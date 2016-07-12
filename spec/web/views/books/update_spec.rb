require 'spec_helper'
require_relative '../../../../apps/web/views/books/update'

describe Web::Views::Books::Update do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  do
    Hanami::View::Template.new('apps/web/templates/books/update.html.erb')
  end
  let(:view)      { Web::Views::Books::Update.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
