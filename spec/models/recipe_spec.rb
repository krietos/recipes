require 'spec_helper'

describe Recipe do
  it { should validate_presence_of :name }
  it { should have_many :tags}
end


