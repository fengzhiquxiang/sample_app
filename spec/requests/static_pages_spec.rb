require 'spec_helper'

describe "StaticPages" do
    subject { page }
    
    it "should have the right links on the layout" do
        visit root_path
        click_link "About"
        expect(page).to have_title(full_title('About Us'))
        click_link "Help"
        expect(page).to have_title(full_title('Help'))
        click_link "Contact"
        expect(page).to have_title(full_title('Contact'))
        click_link "Home"
        click_link "Sign up now!"
        expect(page).to have_title(full_title('Sign up'))
        click_link "sample app"
        expect(page).to have_title(full_title(''))
    end

    describe "Contact page" do
        it "should have the content 'Contact'" do
            visit contact_path
            expect(page).to have_content('Contact')
        end

        it "should have the title 'Contact'" do
            visit contact_path
            expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
        end
    end

    describe "GET /static_pages" do
        it "works! (now write some real specs)" do
            # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
            get root_path
            response.status.should be(200)
        end
    end

    describe "Home page" do
        before { visit root_path }
        it "should have the content 'Sample App'" do
            # visit home_path
            expect(page).to have_content('Sample App')
        end

        it "should have the base title" do
            # visit home_path
            expect(page).to have_title("Ruby on Rails Tutorial Sample App")
        end

        it "should not have a custom page title" do
            # visit home_path
            expect(page).not_to have_title('| Home')
        end 
    end

    describe "Help page" do
        it "should have the content 'Help'" do
          visit help_path
          expect(page).to have_content('Help')
        end

        it "should have the title 'Help'" do
          visit help_path
          expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
        end
    end

    describe "About page" do
        it "should have the content 'About Us'" do
            visit about_path
            expect(page).to have_content('About Us')
        end

        it "should have the title 'About Us'" do
            visit about_path
            expect(page).to have_title("Ruby on Rails Tutorial Sample App | About Us")
        end
    end

    describe "for signed-in users" do
        let(:user) { FactoryGirl.create(:user) }
        before do
            FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
            FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
            sign_in user
            visit root_path
        end
    
        it "should render the user's feed" do
            user.feed.each do |item|
                expect(page).to have_selector("li##{item.id}", text: item.content)
            end
        end

        describe "follower/following counts" do
            let(:other_user) { FactoryGirl.create(:user) }
            before do
                other_user.follow!(user)
                visit root_path
            end
            it { should have_link("0 following", href: following_user_path(user)) }
            it { should have_link("1 followers", href: followers_user_path(user)) }
        end

        describe "add reply botton" do
            it { should have_link('Reply', href: replies_path(user) }
            # it { should have_selector('link', text: 'Reply') }
        end
    end
end
