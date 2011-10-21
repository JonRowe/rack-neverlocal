require 'spec_helper'

module Rack
  describe NeverLocal do
    describe "is rack middleware" do
      let(:app) { mock "app", :call => response }

      let(:response) { mock "response" }

      let(:env)             { { 'REMOTE_ADDR' => 'LOCAL' } }
      let(:transformed_env) { { 'REMOTE_ADDR' => 'notlocal' } }

      before { NeverLocal::RemoveLocalHost.stub(:from).with(env).and_return(transformed_env) }

      it "takes an app" do
        NeverLocal.new app
      end

      subject { NeverLocal.new(app).call(env) }

      it "transforms the environment to strip out local addresses" do
        NeverLocal::RemoveLocalHost.should_receive(:from).with(env).and_return(transformed_env)
        subject
      end

      it "chains call onto app" do
        app.should_receive(:call).with(transformed_env)
        subject
      end

      it("outputs response") { should == response }

    end
  end
end
