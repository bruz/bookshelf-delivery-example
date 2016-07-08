require 'spec_helper'
require_relative '../../../../apps/web/views/books/new'

class NewBookParams < Hanami::Action::Params
  param :book do
    param :title, presence: true
    param :author, presence: true
  end
end

describe Web::Views::Books::New do
  let(:params)    { NewBookParams.new({}) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/new.html.erb') }
  let(:view)      { Web::Views::Books::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    params.valid? # trigger validations

    rendered.must_include('There was a problem with your submission')
    rendered.must_include('title is required')
    rendered.must_include('author is required')
  end
end
