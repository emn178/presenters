RSpec.describe Presenters::Model do
  let(:post) { Post.new }
  subject { post.presenter }

  describe "#presenter" do
    context "without block" do
      its(:class) { should eq PostPresenter }
    end
  end
end
