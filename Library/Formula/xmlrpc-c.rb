require 'formula'

class XmlrpcC <Formula
  url 'http://xmlrpc-c.svn.sourceforge.net/svnroot/xmlrpc-c/advanced'
  homepage 'http://xmlrpc-c.sourceforge.net/'
  version 'foo'

  def install
    ENV.deparallelize
    # choosing --enable-libxml2-backend to lose some weight and not statically
    # link in expat
    #NOTE seemingly it isn't possible to build dylibs with this thing
    system "./configure", "--disable-debug", "--enable-libxml2-backend", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
