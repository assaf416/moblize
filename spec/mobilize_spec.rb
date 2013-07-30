# encoding: utf-8
require 'spec_helper'

describe Mobilize do
  describe ".fake_text" do
    it "decodes a Base64 String with hebrew" do
      Mobilize.fake_text("?UTF8-!#!@#}").should eq("שלום")
    end
  end
end
