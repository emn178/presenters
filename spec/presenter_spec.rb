RSpec.describe Presenter do
  subject { PostPresenter.new post }

  describe "#title" do
    context "with nil" do
      let(:post) { Post.new }
      its(:title) { should eq "No Title" }
      it { should respond_to(:content) }
    end

    context "with nil" do
      let(:post) { Post.new :title => "My Title" }
      its(:title) { should eq "My Title" }
      it { should respond_to(:content) }
    end
  end

  describe "#present" do
    context "with user" do
      let(:user) { User.new }
      let(:post) { Post.new :user => user}
      its(:poster) { should eq "No Name" }
    end
  end
end
