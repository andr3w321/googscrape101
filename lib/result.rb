class Result
  attr_accessor :href, :hreftext, :greenlink, :summary

  def self.link_only(href, hreftext)
    self.new(href, hreftext, nil, nil)
  end

  def initialize(href, hreftext, greenlink, summary)
    @href = href
    @hreftext = hreftext
    @greenlink = greenlink 
    @summary = summary
  end

end

