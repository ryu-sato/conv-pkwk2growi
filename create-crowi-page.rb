# create-crowi-page
# 
# [NOTE] How to use
#   input body of crowi's page pass throw STDIN and specified page name with option
#   ex. echo -e "test \nhoge" | ruby create-crowi-page.rb '/sandbox/create-crowi-page-test'

require 'crowi-client'

if ARGV.length < 1
  puts "$0 CROWI_PAGE_NAME"
  exit 1
end
page_name = ARGV[0]

if CrowiClient.instance.page_exist?(path_exp: page_name)
  puts "Cannot create page. Because page '#{page_name}' is already exists. Ignore this page."
  exit 0
end

# Create page and attachment files
body = STDIN.read
req = CPApiRequestPagesCreate.new path: page_name, body: body
puts CrowiClient.instance.request(req)
