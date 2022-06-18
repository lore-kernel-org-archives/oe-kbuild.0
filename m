Content-Type: multipart/mixed; boundary="===============2474864905879744977=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/errata/thead/errata.c:55:90: warning: Parameter 'end' can be declared with const [constParameter]
Date: Sat, 18 Jun 2022 13:24:05 +0800
Message-ID: <202206181304.r2FYhPjf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2474864905879744977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/risc=
v/errata/thead/errata.c:55:90: warning: Parameter 'end' can be declared wit=
h const [constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Heiko Stuebner <heiko@sntech.de>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: a35707c3d850dda0ceefb75b1b3bd191921d5765 riscv: add memory-type err=
ata for T-Head
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a35707c3d850dda0ceefb75b1b3bd191921d5765
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/errata/thead/errata.c:55:90: warning: Parameter 'end' can be =
declared with const [constParameter]
   void __init_or_module thead_errata_patch_func(struct alt_entry *begin, s=
truct alt_entry *end,
                                                                           =
                 ^

vim +/end +55 arch/riscv/errata/thead/errata.c

a35707c3d850dd Heiko Stuebner 2022-05-11  54  =

a35707c3d850dd Heiko Stuebner 2022-05-11 @55  void __init_or_module thead_e=
rrata_patch_func(struct alt_entry *begin, struct alt_entry *end,

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2474864905879744977==--

