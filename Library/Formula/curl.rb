require 'formula'

class Curl <Formula
  url 'http://curl.haxx.se/download/curl-7.21.2.tar.bz2'
  homepage 'http://curl.haxx.se/'
  md5 'ca96df88e044c7c25d19692ec8b250b2'

  keg_only :provided_by_osx

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
