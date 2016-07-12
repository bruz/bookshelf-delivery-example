require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/edit'

describe Web::Controllers::Books::Edit do
  let(:action) { Web::Controllers::Books::Edit.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
