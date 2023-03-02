# frozen_string_literal: true

require 'daybreak'

# Changes a long url into a short one
class URLShortener
  def initialize
    @db = Database.new
  end

  def shorten(full_length_url)
    short_url = "https://conn.io/#{rand(1000..99_999).to_s(36)}"
    @db.add(short_url, full_length_url)
    short_url
  end

  def retrieve(short_url)
    url = @db.get(short_url)
    raise "URL not found: #{short_url}" unless url

    url
  end
end

# Database
class Database
  DB_PATH = './data/urls.db'

  def initialize
    @db = Daybreak::DB.new(DB_PATH)
  end

  def add(short_url, long_url)
    @db.set!(short_url, long_url)
    close
  end

  def get(short_url)
    url = @db[short_url]
    close
    url
  end

  def close
    @db.close
  end
end

# Wrapper for `Kernel.rand`
class Random
  def self.ran(range)
    rand(range)
  end
end
