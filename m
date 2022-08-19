Content-Type: multipart/mixed; boundary="===============5592025510504733819=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:40:9: sparse: sparse: '__Int8x8_t' has implicit type
Date: Fri, 19 Aug 2022 23:42:42 +0800
Message-ID: <202208192301.TXNESTmk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5592025510504733819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:40:9: sparse: sparse: '=
__Int8x8_t' has implicit type"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Justin M. Forbes" <jforbes@fedoraproject.org>
CC: "Jason A. Donenfeld" <zx2c4@kernel.org>

Hi Justin,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4c2d0b039c5cc0112206a5b22431b577cb1c57ad
commit: e56e18985596617ae426ed5997fb2e737cffb58b lib/crypto: add prompts ba=
ck to crypto libraries
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-s041-20220819 (https://download.01.org/0day-ci/arc=
hive/20220819/202208192301.TXNESTmk-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
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
rm64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   arch/arm64/lib/xor-neon.c: note: in included file (through arch/arm64/in=
clude/asm/neon-intrinsics.h):
>> ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:40:9: sparse: sparse:=
 '__Int8x8_t' has implicit type
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:40:20: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:40:20: sparse: sparse=
: got int8x8_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:41:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:41:21: sparse: sparse=
: got int16x4_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:42:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:42:21: sparse: sparse=
: got int32x2_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:43:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:43:21: sparse: sparse=
: got int64x1_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:44:23: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:44:23: sparse: sparse=
: got float16x4_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:45:23: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:45:23: sparse: sparse=
: got float32x2_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:46:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:46:21: sparse: sparse=
: got poly8x8_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:47:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:47:22: sparse: sparse=
: got poly16x4_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:48:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:48:21: sparse: sparse=
: got uint8x8_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:49:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:49:22: sparse: sparse=
: got uint16x4_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:50:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:50:22: sparse: sparse=
: got uint32x2_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:51:23: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:51:23: sparse: sparse=
: got float64x1_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:52:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:52:22: sparse: sparse=
: got uint64x1_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:53:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:53:21: sparse: sparse=
: got int8x16_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:54:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:54:21: sparse: sparse=
: got int16x8_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:55:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:55:21: sparse: sparse=
: got int32x4_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:56:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:56:21: sparse: sparse=
: got int64x2_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:57:23: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:57:23: sparse: sparse=
: got float16x8_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:58:23: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:58:23: sparse: sparse=
: got float32x4_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:59:23: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:59:23: sparse: sparse=
: got float64x2_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:60:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:60:22: sparse: sparse=
: got poly8x16_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:61:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:61:22: sparse: sparse=
: got poly16x8_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:62:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:62:22: sparse: sparse=
: got poly64x2_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:63:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:63:22: sparse: sparse=
: got poly64x1_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:64:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:64:22: sparse: sparse=
: got uint8x16_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:65:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:65:22: sparse: sparse=
: got uint16x8_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:66:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:66:22: sparse: sparse=
: got uint32x4_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:67:22: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:67:22: sparse: sparse=
: got uint64x2_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:69:19: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:69:19: sparse: sparse=
: got poly8_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:70:20: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:70:20: sparse: sparse=
: got poly16_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:71:20: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:71:20: sparse: sparse=
: got poly64_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:72:21: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:72:21: sparse: sparse=
: got poly128_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:74:16: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:74:16: sparse: sparse=
: got float16_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:78:24: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:78:24: sparse: sparse=
: got bfloat16x4_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:79:24: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:79:24: sparse: sparse=
: got bfloat16x8_t
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:238:1: sparse: sparse=
: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:238:1: sparse: sparse=
: got vadd_s8
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:241:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:241:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:248:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:248:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:255:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:255:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:262:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:262:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:269:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:269:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:276:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:276:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:283:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:283:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:290:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:290:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:297:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:297:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:304:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:304:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:311:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:311:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:318:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:318:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:325:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:325:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:332:1: sparse: sparse=
: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:332:1: sparse: sparse=
: got }
   ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:339:1: sparse: sparse=
: Expected ; at the end of type declaration
>> ../lib/gcc/aarch64-linux/12.1.0/include/arm_neon.h:339:1: sparse: sparse=
: too many errors

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5592025510504733819==--

