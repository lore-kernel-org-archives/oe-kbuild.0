Content-Type: multipart/mixed; boundary="===============5206229228035461930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: powerpc64-linux-ld: drivers/i2c/busses/i2c-pasemi-core.o:undefined reference to `__this_module'
Date: Sat, 26 Mar 2022 15:19:41 +0800
Message-ID: <202203261553.0Nf5qi3l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5206229228035461930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sven Peter <sven@svenpeter.dev>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Sven,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52d543b5497cf31d6baeb0bcfe5a5474c3238578
commit: d88ae2932df0e670610cb741fec442ad12466c03 i2c: pasemi: Add Apple pla=
tform driver
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-s031-20220325 (https://download.01.org/0day-ci=
/archive/20220326/202203261553.0Nf5qi3l-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd88ae2932df0e670610cb741fec442ad12466c03
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d88ae2932df0e670610cb741fec442ad12466c03
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/i2c/b=
usses/i2c-pasemi-core.o' being placed in section `.stubs'
>> powerpc64-linux-ld: drivers/i2c/busses/i2c-pasemi-core.o:(.toc+0x0): und=
efined reference to `__this_module'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5206229228035461930==--

