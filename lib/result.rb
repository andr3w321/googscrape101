class Result
  attr_accessor :href, :hreftext, :greenlink, :summary

  def initialize(href, hreftext, greenlink, summary)
    @href = href
    @hreftext = hreftext
    @greenlink = greenlink 
    @summary = summary
  end
end

