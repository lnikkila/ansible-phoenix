RSpec.describe server(:localhost) do
  describe user("phoenix") do
    it { should exist }
    it { should belong_to_group "phoenix" }

    it { should have_home_directory "/home/phoenix" }
  end

  describe file("/var/www") do
    it { should be_directory }
    it { should be_mode 755 }

    it { should be_owned_by     "phoenix" }
    it { should be_grouped_into "phoenix" }
  end

  describe package("inotify-tools") do
    it { should be_installed }
  end

  describe service("phoenix") do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(4000) do
    it { should be_listening.on '0.0.0.0' }
  end

  describe http('http://localhost:4000/') do
    subject { response }

    its(:status) { should eq 200 }
    its(:body)   { should match(/Hello\s+Phoenix/i) }
  end
end
