require 'spec_helper'

module Rack
  class NeverLocal
    describe RemoveLocalHost do
      describe '.from' do

        subject { RemoveLocalHost.from env }

        context "not a local ip" do
          let(:env) { { 'REMOTE_ADDR' => '192.168.1.1' } }
          it { should == env }
        end

        context "127.0.0.1" do
          let(:env) { { 'REMOTE_ADDR' => '127.0.0.1', 'HTTP_X_REAL_IP' => '192.168.1.1' } }
          its(['REMOTE_ADDR']) { should_not == '127.0.0.1' }
        end

      end

      describe 'transform_from(key,env)' do
        subject { RemoveLocalHost.transform_from 'KEY', env }

        context "key present" do
          let(:env) { { 'KEY' => 'VALUE' } }

          it "replaces remote addr with value" do
            subject
            env['REMOTE_ADDR'].should == 'VALUE'
          end
        end
        context "key missing" do
          let(:env) { { 'NOT_KEY' => 'VALUE' } }
          specify { should be_nil }
        end
      end

      describe 'detect_localhost(env)' do
        subject { RemoveLocalHost.detect_localhost(env) }

        context "not a local ip" do
          let(:env) { { 'REMOTE_ADDR' => '192.168.1.1' } }
          it { should be_false }
        end

        context "127.0.0.1" do
          let(:env) { { 'REMOTE_ADDR' => '127.0.0.1' } }
          it { should be_true }
        end

        context "127.0.0.1" do
          let(:env) { { 'REMOTE_ADDR' => '::1' } }
          it { should be_true }
        end
      end
    end
  end
end
