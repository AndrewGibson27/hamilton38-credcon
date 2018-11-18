class Scraper
  attr_reader :timestamp

  DASHBOARD_URL = "http://mario-blob-prod.azureedge.net/data/data-2.json"

  def initialize(timestamp: Time.now)
    @timestamp = timestamp
  end

  def call
    create_trending_urls
    create_trending_domains
    create_top_urls
    create_top_domains

    puts "resources created!"
  end

  private

  def resource
    @resource ||= JSON.parse(RestClient.get(DASHBOARD_URL).body)
  end

  def create_trending_urls
    resource['breakoutUrls']['data'].each do |url|
      puts "creating resource for #{url['name']}"
      Resource.create do |r|
        r.path = url["name"]
        r.mentions = url["value"]
        r.subtype = :url
        r.trending = true
      end
    end
  end

  def create_trending_domains
    resource['breakoutDomains']['data'].each do |url|
      puts "creating resource for #{url['name']}"
      Resource.create do |r|
        r.path = url["name"]
        r.mentions = url["value"]
        r.subtype = :domain
        r.trending = true
      end
    end
  end

  def create_top_urls
    resource['topUrls']['data'].each do |url|
      puts "creating resource for #{url['name']}"
      Resource.create do |r|
        r.path = url["name"]
        r.mentions = url["value"]
        r.subtype = :url
        r.trending = false
      end
    end
  end

  def create_top_domains
    resource['topDomains']['data'].each do |url|
      puts "creating resource for #{url['name']}"
      Resource.create do |r|
        r.path = url["name"]
        r.mentions = url["value"]
        r.subtype = :domain
        r.trending = false
      end
    end
  end
end
