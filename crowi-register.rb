require 'crowi-client'

page_name = '/test/hoge'

if CrowiClient.instance.page_exist?(path_exp: page_name)
  raise "Cannot create page. Because page '#{page_name}' is already exists. You need to delete before register."
end

# Create page and attachment files
body = STDIN.read
req = CPApiRequestPagesCreate.new path: page_name, body: body
puts CrowiClient.instance.request(req)
