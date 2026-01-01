// https://m.youtube.com/watch?v=awd_v1gii_Q&pp=0gcJCR4Bo7VqN5tD
function FindProxyForURL(url, host) {
    // youtube
    if (shExpMatch(url,"*.youtube.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*youtu.be/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*.ytimg.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*.googlevideo.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*.ggpht.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
   
    // https://medium.com/
    if (shExpMatch(url,"*medium.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    
    // instagram.com
    if (shExpMatch(url,"*instagram.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*.cdninstagram.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*.fbcdn.net/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    

    if (shExpMatch(url,"*.google.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*.google.co.uk/*")) {
        return "SOCKS 127.0.0.1:2080";
    }    

    if (shExpMatch(url,"*.jvt.me/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    // https://rutracker.org/
    if (shExpMatch(url,"*rutracker.org/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*rutracker.cc/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*rutrk.org/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    

    if (shExpMatch(url,"*alfavpn.ru/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    

    if (shExpMatch(url,"*vpnon.ru/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*vpnon.site/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*vpnon.tech/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*vpnon.space/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    
    if (shExpMatch(url,"*.protobufpal.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*taskfile.dev/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*gofiber.io/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*facebook.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    // if (shExpMatch(url,"*2ip.ru/*")) {
    //     return "SOCKS 127.0.0.1:2080";
    // }

    if (shExpMatch(url,"*ru.linkedin.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }
    if (shExpMatch(url,"*.linkedin.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*.amazon.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*chatgpt.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*.whatsapp.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*whatsapp.net/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*.jetbrains.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*proton.me/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    if (shExpMatch(url,"*airbnb.com/*")) {
        return "SOCKS 127.0.0.1:2080";
    }

    // if (shExpMatch(url,"docs.rs/*")) {
    //     return "SOCKS 127.0.0.1:2080";
    // }

    return "DIRECT";
}
