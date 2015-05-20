require 'spec_helper'
describe 'smartcard' do

  context 'with defaults for all parameters' do
    it { should contain_class('smartcard') }
  end
end
