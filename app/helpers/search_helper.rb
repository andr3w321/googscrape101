require 'open-uri'

module SearchHelper

  def set_default_radio_btn
    params[:number_of_results]=10 if !params[:number_of_results]
  end

  def search_results
    results = String.new
    if(!params[:q].nil?)
      doc = Nokogiri::HTML(open("http://www.google.com/search?q=#{CGI.escape(params[:q])}&num=#{CGI.escape(params[:number_of_results])}&pws=0"))
      doc.css(".g").each do |node|
        #filter out images, news & video results which are links to additional google searches
        if !node.at_css(".s").nil?
          href = node.at_css("h3").at_css("a")[:href]
          results << href << "\r\n"
        end
      end
    end
    results
  end
end

