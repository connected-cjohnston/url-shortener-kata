require './app/url_shortener'

RSpec.describe URLShortener do
  before do
    @db = Daybreak::DB.new './data/urls.db'
  end

  after do
    @db.close
    File.delete('./data/urls.db')
  end

  describe '.shorten' do
    it 'shortens the url' do
      short_url = URLShortener.new.shorten('https://www.yahoo.com')

      expect(short_url.size).to be < 'https://www.yahoo.com'.size
    end

    it 'writes shortened url the db' do
      short_url = URLShortener.new.shorten('https://www.google.com')
      @db.load

      retrieved_url = @db[short_url]

      expect(retrieved_url).to eq 'https://www.google.com'
    end
  end

  describe '.retrieve' do
    it 'retrieves full-length url from the db' do
      @db.set!('https://short_url.com', 'https://www.full_length_url.com')

      long_url = URLShortener.new.retrieve('https://short_url.com')

      expect(long_url).to eq 'https://www.full_length_url.com'
    end

    it 'raises a "not found" error when url is not in the db' do
      expect do
        URLShortener.new.retrieve('https://unknown_url.com')
      end.to raise_error('URL not found: https://unknown_url.com')
    end
  end
end
