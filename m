Content-Type: multipart/mixed; boundary="===============4677794146418175220=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10471/12343] kismet: WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE when selected by RISCV_ISA_SVPBMT
Date: Wed, 18 May 2022 05:07:49 +0800
Message-ID: <202205180550.k9fgol15-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4677794146418175220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Wei Fu <wefu@redhat.com>
CC: Liu Shaohua <liush@allwinnertech.com>
CC: Guo Ren <guoren@kernel.org>
CC: Philipp Tomsich <philipp.tomsich@vrull.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   47c1c54d1bcd0a69a56b49473bc20f17b70e5242
commit: ff689fd21cb13098305bae3f8d0c0065df2e2fc1 [10471/12343] riscv: add R=
ISC-V Svpbmt extension support
:::::: branch date: 11 hours ago
:::::: commit date: 6 days ago
config: (https://download.01.org/0day-ci/archive/20220518/202205180550.k9fg=
ol15-lkp(a)intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dff689fd21cb13098305bae3f8d0c0065df2e2fc1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ff689fd21cb13098305bae3f8d0c0065df2e2fc1
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_RISCV_ALTERNATIVE=
 --selectors CONFIG_RISCV_ISA_SVPBMT -a=3Driscv
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Driscv olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RISCV_ALTERNATIV=
E when selected by RISCV_ISA_SVPBMT
   =

   WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
     Depends on [n]: !XIP_KERNEL [=3Dy]
     Selected by [y]:
     - RISCV_ISA_SVPBMT [=3Dy] && 64BIT [=3Dy] && MMU [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4677794146418175220==--

