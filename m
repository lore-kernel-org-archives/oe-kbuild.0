Content-Type: multipart/mixed; boundary="===============2201482697277863408=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/lib/xor-neon.c:14:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
Date: Sun, 07 Aug 2022 19:24:34 +0800
Message-ID: <202208071903.Z1uxLzC5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2201482697277863408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "only Kconfig file updated"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/arm/lib/xor-neon.c:14:2: sparse: sparse: You should compile this file=
 with '-march=3Darmv7-a -mfloat-abi=3Dsoftfp -mfpu=3Dneon'"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Justin M. Forbes" <jforbes@fedoraproject.org>
CC: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: e56e18985596617ae426ed5997fb2e737cffb58b lib/crypto: add prompts ba=
ck to crypto libraries
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-s053-20220804 (https://download.01.org/0day-ci/archi=
ve/20220807/202208071903.Z1uxLzC5-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De56e18985596617ae426ed5997fb2e737cffb58b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e56e18985596617ae426ed5997fb2e737cffb58b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/arm/lib/xor-neon.c:14:2: sparse: sparse: You should compile this fi=
le with '-march=3Darmv7-a -mfloat-abi=3Dsoftfp -mfpu=3Dneon'

vim +14 arch/arm/lib/xor-neon.c

01956597cbc46d Ard Biesheuvel    2013-05-17  12  =

01956597cbc46d Ard Biesheuvel    2013-05-17  13  #ifndef __ARM_NEON__
de9c0d49d85dc5 Nathan Chancellor 2019-02-02 @14  #error You should compile =
this file with '-march=3Darmv7-a -mfloat-abi=3Dsoftfp -mfpu=3Dneon'
01956597cbc46d Ard Biesheuvel    2013-05-17  15  #endif
01956597cbc46d Ard Biesheuvel    2013-05-17  16  =


:::::: The code at line 14 was first introduced by commit
:::::: de9c0d49d85dc563549972edc5589d195cd5e859 ARM: 8833/1: Ensure that NE=
ON code always compiles with Clang

:::::: TO: Nathan Chancellor <natechancellor@gmail.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2201482697277863408==--

