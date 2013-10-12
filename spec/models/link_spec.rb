require 'spec_helper'

describe Link do 
it { should validate_presence_of :user }
it { should belong_to :user }
end