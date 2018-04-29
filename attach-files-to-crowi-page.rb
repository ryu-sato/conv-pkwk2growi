# attach-files-to-crowi-page
# 
# [NOTE] How to use
#   specify page name and file path of attachments from command line options.
#   ex. ruby attach-files-to-crowi-page.rb '/sandbox/create-crowi-page-test' create-crowi-page-test/1.png
#
# [NOTE]
#   Cannot attach files to Growi

require 'crowi-client'

if ARGV.length < 2
  puts "$0 CROWI_PAGE_NAME PATH_TO_ATTACHMENT_FILE"
  exit 1
end
page_name = ARGV[0]
attachments_file_path = ARGV[1]

unless CrowiClient.instance.page_exist?(path_exp: page_name)
  puts "Cannot attach file. Because page '#{page_name}' is not exists. You need to create before attach."
  exit 1
end

# Create page and attachment files
page_id = CrowiClient.instance.page_id(path_exp: page_name)
puts page_id
puts attachments_file_path
puts File.new(attachments_file_path)
req = CPApiRequestAttachmentsAdd.new page_id: page_id,
                                     file: File.new(attachments_file_path)
puts CrowiClient.instance.request(req)
