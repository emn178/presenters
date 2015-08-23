RSpec.describe Presenters::Helper do
  include Presenters::Helper

  let(:post) { Post.new }

  describe "#present" do
    context "without class" do
      it { 
        present(post) do |post|
          expect(post.title).to eq("No Title")
        end
      }
    end

    context "with class" do
      it { 
        present(post, CustomPresenter) do |post|
          expect(post.title).to eq("You have to login.")
        end
      }
    end

    context "without block" do
      it { expect(present(post).title).to eq("No Title") }
    end
  end

  describe "#present_each" do
    let(:posts) { [Post.new, Post.new] }
    context "without class" do
      it { 
        count = 0
        present_each(posts) do |post|
          count += 1
          expect(post.title).to eq("No Title")
        end
        expect(count).to eq(2)
      }
    end

    context "with class" do
      it { 
        count = 0
        present_each(posts, CustomPresenter) do |post|
          count += 1
          expect(post.title).to eq("You have to login.")
        end
        expect(count).to eq(2)
      }
    end
  end
end
