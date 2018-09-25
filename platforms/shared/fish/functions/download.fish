function download -d "Download file from a specified URL"
  set remote_file $argv[1]
  set local_file $argv[2]

  console_debug "Downloading: $remote_file"
  console_debug "Save To: $local_file"
  curl -fsSL1 -o $local_file $remote_file
end
