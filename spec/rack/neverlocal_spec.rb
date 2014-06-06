require 'spec_helper'

module Rack
  describe NeverLocal do
    describe "is rack middleware" do
      let(:app) { double "app", :call => response }

      let(:response) { double "response" }

      let(:env)             { { 'REMOTE_ADDR' => 'LOCAL' } }
      let(:transformed_env) { { 'REMOTE_ADDR' => 'notlocal' } }

      before { NeverLocal::RemoveLocalHost.stub(:from).with(env).and_return(transformed_env) }

      it "takes an app" do
        NeverLocal.new app
      end

      subject(:call) { NeverLocal.new(app).call(env) }

      it "transforms the environment to strip out local addresses" do
        expect(NeverLocal::RemoveLocalHost).to receive(:from).with(env).and_return(transformed_env)
        call
      end

      it "chains call onto app" do
        expect(app).to receive(:call).with(transformed_env)
        call
      end

      it("outputs response") { is_expected.to eq response }

    end
  end
end
