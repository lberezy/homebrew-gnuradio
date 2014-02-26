require 'formula'

class Rtlsdr < Formula
  homepage 'http://sdr.osmocom.org/trac/wiki/rtl-sdr'
  head 'https://github.com/steve-m/librtlsdr.git'

  depends_on 'pkg-config' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'cmake' => :build
  depends_on 'libusb'

  if MacOS.xcode_version.to_f >= 4.3
    depends_on 'autoconf'
  end

  def install
    args = ["--prefix=#{prefix}"]
    system "autoreconf -i"
    system "./configure", *args
    system "make install"
  end
end
