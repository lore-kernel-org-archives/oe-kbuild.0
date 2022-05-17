Content-Type: multipart/mixed; boundary="===============0464150127256831039=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10829/12195] kismet: WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE when selected by ERRATA_THEAD
Date: Tue, 17 May 2022 12:33:04 +0800
Message-ID: <202205171222.fxFkO8YK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0464150127256831039==
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
head:   3f7bdc402fb06f897ff1f492a2d42e1f7c2efedb
commit: a35707c3d850dda0ceefb75b1b3bd191921d5765 [10829/12195] riscv: add m=
emory-type errata for T-Head
:::::: branch date: 18 hours ago
:::::: commit date: 5 days ago
config: (https://download.01.org/0day-ci/archive/20220517/202205171222.fxFk=
O8YK-lkp(a)intel.com/config)
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
     - RISCV_ISA_SVPBMT [=3Dy] && 64BIT [=3Dy] && MMU [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0464150127256831039==--

