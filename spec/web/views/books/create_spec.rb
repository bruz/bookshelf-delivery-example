require 'spec_helper'
require_relative '../../../../apps/web/views/books/create'

describe Web::Views::Books::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  do
    Hanami::View::Template.new('apps/web/templates/books/create.html.erb')
  end
  let(:view)      { Web::Views::Books::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
