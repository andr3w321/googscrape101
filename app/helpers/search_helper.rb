require 'open-uri'

module SearchHelper

  def set_default_radio_btn
    params[:number_of_results]=10 if !params[:number_of_results]
  end

  def search_results
    results = String.new
    if(!params[:q].nil?)
      query = params[:q]
      if(!params[:domain].empty?)
        #check if valid domain entered
        domain_regex = /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$/ix
        if(params[:domain]=~domain_regex)
          query = 'site:'<<params[:domain]<<', '<<params[:q]
        else
          return 'Error parsing domain'
        end
      end

      doc = Nokogiri::HTML(open("http://www.google.com/search?q=#{CGI.escape(query)}&num=#{CGI.escape(params[:number_of_results])}&pws=0"))
      doc.css(".g").each do |node|
        #filter out images, news & video results which are links to additional google searches
        if !node.at_css(".s").nil?
          href = node.at_css("h3").at_css("a")[:href].gsub("\/url?q=","").split("&")[0]
          results << href << "\r\n"
        end
      end
    end
    results
  end
end

