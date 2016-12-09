function cmini
        set ip (curl -s https://gist.githubusercontent.com/SanCoder-Q/205526799981442e57cd2da91728e676/raw/d25a9330b320d6bf1cf73ca006dd92935483fc0a/MAC_MINI_IP.dat)
        echo "Opening $ip"
        open "vnc://$ip"
end
