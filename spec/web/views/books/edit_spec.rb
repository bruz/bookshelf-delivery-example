require 'spec_helper'
require_relative '../../../../apps/web/views/books/edit'

describe Web::Views::Books::Edit do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  do
    Hanami::View::Template.new('apps/web/templates/books/edit.html.erb')
  end
  let(:view)      { Web::Views::Books::Edit.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
