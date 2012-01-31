function testForSiteSearch()
{
  var searchRegex = /^[a-zA-Z0-9\-]+\.([a-zA-Z0-9]{2,4})+\,\s./;
  var input = document.getElementById('q');
  if(searchRegex.test(input.value)) input.value='site:'+input.value;
  console.log('hi');
}
