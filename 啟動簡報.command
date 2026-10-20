#!/bin/bash
cd "$(dirname "$0")"
python3 - <<'SERVE'
from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler
import webbrowser, threading
server = ThreadingHTTPServer(('127.0.0.1', 0), SimpleHTTPRequestHandler)
url = 'http://127.0.0.1:%s/index.html' % server.server_port
print('漫畫簡報：' + url, flush=True)
threading.Timer(0.4, lambda: webbrowser.open(url)).start()
server.serve_forever()
SERVE
