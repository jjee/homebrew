require 'formula'

class Libtorrent < Formula
  url 'http://libtorrent.rakshasa.no/downloads/libtorrent-0.12.9.tar.gz'
  homepage 'http://libtorrent.rakshasa.no/'
  md5 'b128bbd324f03eb42ef5060080f87548'

  depends_on 'pkg-config' => :build
  depends_on 'libsigc++'

  def install
    system "patch -p0 ./src/data/memory_chunk.cc /usr/local/Cellar/libtorrent/mem.patch"
    system "patch -p0 ./src/torrent/poll_kqueue.cc /usr/local/Cellar/libtorrent/poll_kqueue_freebsd.patch"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--with-kqueue", "--enable-ipv6"
    system "make"
    system "make install"
  end
end
