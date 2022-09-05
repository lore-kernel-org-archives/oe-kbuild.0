Content-Type: multipart/mixed; boundary="===============5067939521654190503=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4735/4736] sound/soc/codecs/wcd934x.c:undefined reference to `__regmap_init_slimbus'
Date: Mon, 05 Sep 2022 17:05:17 +0800
Message-ID: <202209051654.FdX1Z1CO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5067939521654190503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 sound/soc/codecs/wcd934x.c:(.text+0x5bf0): undefined reference to `__regma=
p_init_slimbus'"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
commit: f09cadfb05237e17d1328083899a1b933d1e31dd [4735/4736] Merge branch '=
mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-s032-20220905 (https://download.01.org/0day-ci/arch=
ive/20220905/202209051654.FdX1Z1CO-lkp(a)intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Df09cadfb05237e17d1328083899a1b933d1e31dd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f09cadfb05237e17d1328083899a1b933d1e31dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mipsel-linux-ld: mipsel-linux-ld: DWARF error: could not find abbrev num=
ber 97
   sound/soc/codecs/wcd934x.o: in function `wcd934x_codec_probe':
>> sound/soc/codecs/wcd934x.c:(.text+0x5bf0): undefined reference to `__reg=
map_init_slimbus'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5067939521654190503==--

