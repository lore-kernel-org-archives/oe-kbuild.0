Content-Type: multipart/mixed; boundary="===============1273964621487659414=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [norov:bitmap-for-next 43/43] lib/bitmap.c:1573:52: sparse: sparse: shift too big (32) for type unsigned long
Date: Mon, 11 Apr 2022 08:25:15 +0800
Message-ID: <202204110835.zusFpO0r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1273964621487659414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux bitmap-for-next
head:   a136dfabd10d0c1354c41a069cc4e00147a721e1
commit: a136dfabd10d0c1354c41a069cc4e00147a721e1 [43/43] bitmap_from_arr64
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: openrisc-randconfig-s032-20220410 (https://download.01.org/0day-ci/=
archive/20220411/202204110835.zusFpO0r-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/norov/linux/commit/a136dfabd10d0c1354c41a069cc=
4e00147a721e1
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov bitmap-for-next
        git checkout a136dfabd10d0c1354c41a069cc4e00147a721e1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Do=
penrisc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   lib/bitmap.c:1418:32: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@     expected unsigned long @@     got restricted __le6=
4 [usertype] @@
   lib/bitmap.c:1418:32: sparse:     expected unsigned long
   lib/bitmap.c:1418:32: sparse:     got restricted __le64 [usertype]
   lib/bitmap.c:1420:32: sparse: sparse: incorrect type in assignment (diff=
erent base types) @@     expected unsigned long @@     got restricted __le3=
2 [usertype] @@
   lib/bitmap.c:1420:32: sparse:     expected unsigned long
   lib/bitmap.c:1420:32: sparse:     got restricted __le32 [usertype]
>> lib/bitmap.c:1573:52: sparse: sparse: shift too big (32) for type unsign=
ed long

vim +1573 lib/bitmap.c

a136dfabd10d0c Yury Norov 2022-03-22  1559  =

a136dfabd10d0c Yury Norov 2022-03-22  1560  /**
a136dfabd10d0c Yury Norov 2022-03-22  1561   * bitmap_to_arr64 - copy the c=
ontents of bitmap to a u64 array of bits
a136dfabd10d0c Yury Norov 2022-03-22  1562   *	@buf: array of u64 (in host =
byte order), the dest bitmap
a136dfabd10d0c Yury Norov 2022-03-22  1563   *	@bitmap: array of unsigned l=
ongs, the source bitmap
a136dfabd10d0c Yury Norov 2022-03-22  1564   *	@nbits: number of bits in @b=
itmap
a136dfabd10d0c Yury Norov 2022-03-22  1565   */
a136dfabd10d0c Yury Norov 2022-03-22  1566  void bitmap_to_arr64(u64 *buf, =
const unsigned long *bitmap, unsigned int nbits)
a136dfabd10d0c Yury Norov 2022-03-22  1567  {
a136dfabd10d0c Yury Norov 2022-03-22  1568  	unsigned int i =3D 0, words =
=3D BITS_TO_LONGS(nbits);
a136dfabd10d0c Yury Norov 2022-03-22  1569  =

a136dfabd10d0c Yury Norov 2022-03-22  1570  	while (i < words) {
a136dfabd10d0c Yury Norov 2022-03-22  1571  		buf[i/2] =3D bitmap[i++];
a136dfabd10d0c Yury Norov 2022-03-22  1572  		if (i < words)
a136dfabd10d0c Yury Norov 2022-03-22 @1573  			buf[i/2] |=3D bitmap[i++] <<=
 32;
a136dfabd10d0c Yury Norov 2022-03-22  1574  	}
a136dfabd10d0c Yury Norov 2022-03-22  1575  =

a136dfabd10d0c Yury Norov 2022-03-22  1576  	/* Clear tail bits in last ele=
ment of array beyond nbits. */
a136dfabd10d0c Yury Norov 2022-03-22  1577  	if (nbits % 64)
a136dfabd10d0c Yury Norov 2022-03-22  1578  		buf[i - 1] &=3D GENMASK_ULL(n=
bits, 0);
a136dfabd10d0c Yury Norov 2022-03-22  1579  }
a136dfabd10d0c Yury Norov 2022-03-22  1580  EXPORT_SYMBOL(bitmap_to_arr64);
c724f193619c89 Yury Norov 2018-02-06  1581  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1273964621487659414==--

