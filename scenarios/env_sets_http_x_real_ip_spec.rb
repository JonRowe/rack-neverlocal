require 'spec_helper'

class FakeApp
  def call(env)
    @env = env
  end
  attr_reader :env
end


describe "server sends client in" do
  let(:app)        { FakeApp.new }
  let(:middleware) { Rack::NeverLocal.new(app) }

  context "HTTP_X_REAL_IP" do
    let(:env) do
      {
        'HTTP_X_REAL_IP' => "212.123.212.123",
        'REMOTE_ADDR'    => "127.0.0.1"
      }
    end

    subject { middleware.call(env) }

    it "sends the app the correct REMOTE_ADDR" do
      subject
      app.env['REMOTE_ADDR'].should == "212.123.212.123"
    end
  end

  context "HTTP_X_CLUSTER_CLIENT_IP" do
    let(:env) do
      {
        'HTTP_X_CLUSTER_CLIENT_IP' => "212.123.212.123",
        'REMOTE_ADDR'    => "127.0.0.1"
      }
    end

    subject { middleware.call(env) }

    it "sends the app the correct REMOTE_ADDR" do
      subject
      app.env['REMOTE_ADDR'].should == "212.123.212.123"
    end
  end

  context "both" do
    let(:env) do
      {
        'HTTP_X_REAL_IP' => "212.123.212.123",
        'HTTP_X_CLUSTER_CLIENT_IP' => "212.123.111.111",
        'REMOTE_ADDR'    => "127.0.0.1"
      }
    end

    subject { middleware.call(env) }

    it "sends the app the correct REMOTE_ADDR" do
      subject
      app.env['REMOTE_ADDR'].should == "212.123.212.123"
    end
  end
end
