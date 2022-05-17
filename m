Content-Type: multipart/mixed; boundary="===============6822949019758005640=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10474/12343] kismet: WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE when selected by ERRATA_THEAD
Date: Wed, 18 May 2022 01:22:41 +0800
Message-ID: <202205180147.0awy6sgw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6822949019758005640==
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   47c1c54d1bcd0a69a56b49473bc20f17b70e5242
commit: a35707c3d850dda0ceefb75b1b3bd191921d5765 [10474/12343] riscv: add m=
emory-type errata for T-Head
:::::: branch date: 8 hours ago
:::::: commit date: 6 days ago
config: (https://download.01.org/0day-ci/archive/20220518/202205180147.0awy=
6sgw-lkp(a)intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Da35707c3d850dda0ceefb75b1b3bd191921d5765
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a35707c3d850dda0ceefb75b1b3bd191921d5765
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_RISCV_ALTERNATIVE=
 --selectors CONFIG_ERRATA_THEAD -a=3Driscv
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Driscv olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RISCV_ALTERNATIV=
E when selected by ERRATA_THEAD
   =

   WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
     Depends on [n]: !XIP_KERNEL [=3Dy]
     Selected by [y]:
     - ERRATA_THEAD [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6822949019758005640==--

