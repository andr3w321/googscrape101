require 'open-uri'
require 'result'

module SearchHelper

  def set_default_radio_btn
    params[:number_of_results]=10 if !params[:number_of_results]
  end

  def search_results
    results = Array.new
    @linkslist = ""
    if(!params[:q].nil?)
      doc = Nokogiri::HTML(open("http://www.google.com/search?q=#{CGI.escape(params[:q])}&num=#{CGI.escape(params[:number_of_results])}&pws=0"))
      doc.css(".g").each do |node|
        #to filter out images & video results uncomment section and delete below
        #if !node.at_css(".s").nil?
          #href       = node.at_css("h3").at_css("a")[:href]
          #href_text  = node.at_css("h3").text
          #green_link = node.at_css("cite").text
          #summary    = node.at_css(".s").text
          #results << Result.new(href, href_text, green_link, summary)
        #end
        
        href       = node.at_css("h3").at_css("a")[:href]
        href_text  = node.at_css("h3").text
        @linkslist << href << "\r\n"
        results << Result.link_only(href, href_text)
      end
    end
    results
  end

  def get_links
    @linkslist
  end
end
