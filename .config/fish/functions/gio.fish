# shorten github url
# gio code github.com/blahblah
function gio
  curl -i https://git.io -F "url=$argv[2]" -F "code=$argv[1]"
end
