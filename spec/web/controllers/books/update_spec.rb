require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/update'

describe Web::Controllers::Books::Update do
  let(:action) { Web::Controllers::Books::Update.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
