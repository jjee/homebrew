require 'formula'

class Curl < Formula
  homepage 'http://curl.haxx.se/'
  url 'http://curl.haxx.se/download/curl-7.21.7.tar.bz2'
  sha256 '1a50dd17400c042090203eef347e946f29c342c32b6c4843c740c80975e8215a'

  keg_only :provided_by_osx,
            "The libcurl provided by Leopard is too old for CouchDB to use."

  depends_on 'c-ares' if ARGV.include? "--enable-ares"

  def options
    [["--with-ssl", "Include SSL support"],["--enable-ares", "Include c-ares support"]]
  end

  def install
    args = ["--disable-debug", "--disable-debug", "--disable-dependency-tracking",
                               "--prefix=#{prefix}"]
                               
    if ARGV.include? '--with-ssl'
      args.push "--with-ssl"
    end
    
    if ARGV.include? '--enable-ares'
      args.push "--enable-ares"
    end
    
    system "./configure", *args
    system "make install"
  end
end
