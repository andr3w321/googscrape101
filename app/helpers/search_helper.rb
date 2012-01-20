require 'open-uri'

module SearchHelper
  def search_results
    class Result
      attr_accessor :href, :name

      def initialize(href, name)
        @href = href
        @name = name
      end
    end
    @results = Array.new
    doc = Nokogiri::HTML(open("http://www.google.com/search?q="+params[:q]+"&num=10"))
    doc.xpath('//h3/a').each do |node|
      @results << Result.new(node['href'], node.content)
    end
    @results
  end
end
