require 'yaml'
require 'ostruct'
require 'singleton'

class AppBox < OpenStruct
  include Singleton

  def self.init(env, rails_root)
    data = YAML.load_file("#{rails_root}/config/app_box.yml")
    data['default'].each {|name, value| set_property(name, value)}
    if data.include?(env)
      data[env].each {|name, value| set_property(name, value)}
    end
  end

  def self.method_missing(name, *args, &block)
    AppBox.instance.send(name, *args)
  end

  def self.set_property(name, value, parent=AppBox)
    if value.class == String
      if parent.nil?
        AppBox.send "#{name}=", value
      else
        parent.send "#{name}=", value
      end
    elsif value.class == Hash
      parent = parent.send "#{name}=", OpenStruct.new
      value.each do |_name, _value| 
        set_property(_name, _value, parent)
      end
    end
  end
end
