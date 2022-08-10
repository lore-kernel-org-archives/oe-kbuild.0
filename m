Content-Type: multipart/mixed; boundary="===============1943884654119941221=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:pending-fixes 13358/13464] include/net/bluetooth/bluetooth.h:347:16: warning: 'memcmp' specified bound 6 exceeds source size 0
Date: Wed, 10 Aug 2022 15:50:50 +0800
Message-ID: <202208101504.NDdUBuGe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1943884654119941221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/net/bluetooth/bluetooth.h:347:16: warning: 'memcmp' specified boun=
d 6 exceeds source size 0 [-Wstringop-overread]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 pending-fixes
head:   5c5775c41d5494a213623a99b8ba1a7679efd79f
commit: 332f1795ca202489c665a75e62e18ff6284de077 [13358/13464] Bluetooth: L=
2CAP: Fix l2cap_global_chan_by_psm regression
:::::: branch date: 9 hours ago
:::::: commit date: 32 hours ago
config: powerpc-randconfig-s051-20220810 (https://download.01.org/0day-ci/a=
rchive/20220810/202208101504.NDdUBuGe-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D332f1795ca202489c665a75e62e18ff6284de077
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next pending-fixes
        git checkout 332f1795ca202489c665a75e62e18ff6284de077
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash net/bluetooth/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/bluetooth/l2cap_core.c:37:
   In function 'bacmp',
       inlined from 'l2cap_global_chan_by_psm' at net/bluetooth/l2cap_core.=
c:2003:15:
>> include/net/bluetooth/bluetooth.h:347:16: warning: 'memcmp' specified bo=
und 6 exceeds source size 0 [-Wstringop-overread]
     347 |         return memcmp(ba1, ba2, sizeof(bdaddr_t));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'bacmp',
       inlined from 'l2cap_global_chan_by_psm' at net/bluetooth/l2cap_core.=
c:2004:15:
>> include/net/bluetooth/bluetooth.h:347:16: warning: 'memcmp' specified bo=
und 6 exceeds source size 0 [-Wstringop-overread]
     347 |         return memcmp(ba1, ba2, sizeof(bdaddr_t));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcmp +347 include/net/bluetooth/bluetooth.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  343  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  344  /* Copy, swap, convert BD Ad=
dress */
f53c20e93612f7 David Herrmann 2013-04-06  345  static inline int bacmp(cons=
t bdaddr_t *ba1, const bdaddr_t *ba2)
^1da177e4c3f41 Linus Torvalds 2005-04-16  346  {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @347  	return memcmp(ba1, ba2, siz=
eof(bdaddr_t));
^1da177e4c3f41 Linus Torvalds 2005-04-16  348  }
f53c20e93612f7 David Herrmann 2013-04-06  349  static inline void bacpy(bda=
ddr_t *dst, const bdaddr_t *src)
^1da177e4c3f41 Linus Torvalds 2005-04-16  350  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  351  	memcpy(dst, src, sizeof(bda=
ddr_t));
^1da177e4c3f41 Linus Torvalds 2005-04-16  352  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  353  =


:::::: The code at line 347 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1943884654119941221==--

