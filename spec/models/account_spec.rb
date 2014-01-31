require 'spec_helper'

describe Account do
  before do
    @account = Account.new(name: "Testy Tester")
  end
  
  subject { @account }
  
  it { should respond_to(:name) }
  it { should respond_to(:manager_id) }
  it { should respond_to(:consultant_id) }
  it { should respond_to(:received) }
  it { should respond_to(:assigned) }
  it { should respond_to(:completed) }
  it { should respond_to(:sent) }
  it { should respond_to(:filed) }
  it { should respond_to(:basic) }
  it { should respond_to(:state) }
  it { should respond_to(:f1116) }
  it { should respond_to(:a) }
  it { should respond_to(:c) }
  it { should respond_to(:d) }
  it { should respond_to(:e) }
  it { should respond_to(:extension) }
  it { should respond_to(:f) }
  it { should respond_to(:f8938) }
  it { should respond_to(:f5471) }
  it { should respond_to(:fee) }
  it { should respond_to(:cost) }
end
