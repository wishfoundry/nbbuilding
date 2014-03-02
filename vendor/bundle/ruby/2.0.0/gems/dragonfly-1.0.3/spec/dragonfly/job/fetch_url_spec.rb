require 'spec_helper'

describe Dragonfly::Job::FetchUrl do

  let (:app) { test_app }
  let (:job) { Dragonfly::Job.new(app) }

  before(:each) do
    stub_request(:get, %r{http://place\.com/.*}).to_return(:body => 'result!')
  end

  it "adds a step" do
    job.fetch_url!('some.url')
    job.steps.should match_steps([Dragonfly::Job::FetchUrl])
  end

  it "should fetch the specified url when applied" do
    job.fetch_url!('http://place.com')
    job.data.should == "result!"
  end

  it "should default to http" do
    job.fetch_url!('place.com')
    job.data.should == "result!"
  end

  it "should also work with https" do
    stub_request(:get, /place.com/).to_return(:body => 'secure result!')
    job.fetch_url!('https://place.com')
    job.data.should == "secure result!"
  end

  [
    "place.com",
    "http://place.com",
    "place.com/",
    "place.com/stuff/",
    "place.com/?things"
  ].each do |url|
    it "doesn't set the name if there isn't one, e.g. for #{url}" do
      job.fetch_url!(url)
      job.name.should be_nil
    end

    it "doesn't set the name url_attr if there isn't one, e.g. for #{url}" do
      job.fetch_url!(url)
      job.url_attributes.name.should be_nil
    end
  end

  [
    "place.com/dung.beetle",
    "http://place.com/dung.beetle",
    "place.com/stuff/dung.beetle",
    "place.com/dung.beetle?morethings"
  ].each do |url|
    it "sets the name if there is one, e.g. for #{url}" do
      job.fetch_url!(url)
      job.name.should == 'dung.beetle'
    end

    it "sets the name url_attr if there is one, e.g. for #{url}" do
      job.fetch_url!(url)
      job.url_attributes.name.should == 'dung.beetle'
    end
  end

  it "should raise an error if not found" do
    stub_request(:get, "notfound.com").to_return(:status => 404, :body => "BLAH")
    expect{
      job.fetch_url!('notfound.com').apply
    }.to raise_error(Dragonfly::Job::FetchUrl::ErrorResponse){|error|
      error.status.should == 404
      error.body.should == "BLAH"
    }
  end

  it "should raise an error if server error" do
    stub_request(:get, "error.com").to_return(:status => 500, :body => "BLAH")
    expect{
      job.fetch_url!('error.com').apply
    }.to raise_error(Dragonfly::Job::FetchUrl::ErrorResponse){|error|
      error.status.should == 500
      error.body.should == "BLAH"
    }
  end

  it "should follow redirects" do
    stub_request(:get, "redirectme.com").to_return(:status => 302, :headers => {'Location' => 'http://ok.com'})
    stub_request(:get, "ok.com").to_return(:body => "OK!")
    job.fetch_url('redirectme.com').data.should == 'OK!'
  end

  it "follows redirects to https" do
    stub_request(:get, "redirectme.com").to_return(:status => 302, :headers => {'Location' => 'https://ok.com'})
    stub_request(:get, /ok.com/).to_return(:body => "OK!")
    job.fetch_url('redirectme.com').data.should == 'OK!'
  end

  it "raises if redirecting too many times" do
    stub_request(:get, "redirectme.com").to_return(:status => 302, :headers => {'Location' => 'http://redirectme-back.com'})
    stub_request(:get, "redirectme-back.com").to_return(:status => 302, :headers => {'Location' => 'http://redirectme.com'})
    expect {
      job.fetch_url('redirectme.com').apply
    }.to raise_error(Dragonfly::Job::FetchUrl::TooManyRedirects)
  end

  describe "data uris" do
    it "accepts standard base64 encoded data uris" do
      job.fetch_url!("data:text/plain;base64,aGVsbG8=\n")
      job.data.should == 'hello'
      job.mime_type.should == 'text/plain'
      job.ext.should == 'txt'
    end

    it "doesn't accept other data uris" do
      expect {
        job.fetch_url!("data:text/html;charset=utf-8,<stuff />").apply
      }.to raise_error(Dragonfly::Job::FetchUrl::CannotHandle)
    end
  end

end
