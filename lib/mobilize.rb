require "mobilize/version"
require "mobilize/model_additions"
require "mobilize/railtie" if defined? Rails

module Mobilze

 
  require "base64"
  
  def self.from_qp(str, remove_underscore = true)
    return '' if str.nil? 
    result = str.gsub(/=\r\n/, "")
    result = result.gsub(/_/, " ") if remove_underscore
    result.gsub!(/\r\n/m, $/)
    result.gsub!(/=([\da-fA-F]{2})/) { $1.hex.chr }
    result
  end
  
  
  def self.hebrew_decode(str1)
    unless str1.nil?
      str = str1.force_encoding("utf-8")
      if str.to_s.include? "=?UTF-8?B?"
        s =  str1.gsub("=?UTF-8?B?","").gsub("?=","") 
        xx = Base64.decode64(s)
        return xx.force_encoding("utf-8")
      else
        if str.include? "=?UTF-8?Q?"
          s =  str1.gsub("=?UTF-8?Q?","").gsub("?=","") 
          str = from_qp(s)
          return str.force_encoding("utf-8")
        else
          return str.force_encoding("utf-8")
        end
      end
    else
      return " "
    end
  end

  # encoding: UTF-8
  def self.hebrew_text?(text)
    heb =0
    abc = 'אבגדהוזחטיכלמנסעפצקרשת'
    text.chars.each{|c| heb = heb + 1 if abc.include? c }
    ret heb > 10
  end
  
  
end