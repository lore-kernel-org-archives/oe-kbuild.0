Content-Type: multipart/mixed; boundary="===============0547538958325557852=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can be declared with const [constParameter]
Date: Thu, 25 Aug 2022 13:20:50 +0800
Message-ID: <202208251326.QOa4CWlt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0547538958325557852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/risc=
v/kernel/cpufeature.c:288:27: warning: Parameter 'end' can be declared with=
 const [constParameter]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Heiko Stuebner <heiko@sntech.de>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Wei Fu <wefu@redhat.com>
CC: Liu Shaohua <liush@allwinnertech.com>
CC: Guo Ren <guoren@kernel.org>
CC: Philipp Tomsich <philipp.tomsich@vrull.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
commit: ff689fd21cb13098305bae3f8d0c0065df2e2fc1 riscv: add RISC-V Svpbmt e=
xtension support
date:   4 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 4 months ago
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ff689fd21cb13098305bae3f8d0c0065df2e2fc1
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/kernel/cpufeature.c:288:27: warning: Parameter 'end' can be d=
eclared with const [constParameter]
           struct alt_entry *end,
                             ^
--
>> block/blk-throttle.c:1484:3: warning: %llu in format string (no. 1) requ=
ires 'unsigned long long' but the argument type is 'unsigned long'. [invali=
dPrintfArgType_uint]
     snprintf(bufs[0], sizeof(bufs[0]), "%llu",
     ^
   block/blk-throttle.c:1487:3: warning: %llu in format string (no. 1) requ=
ires 'unsigned long long' but the argument type is 'unsigned long'. [invali=
dPrintfArgType_uint]
     snprintf(bufs[1], sizeof(bufs[1]), "%llu",
     ^
>> block/blk-throttle.c:1814:21: warning: Parameter 'this_tg' can be declar=
ed with const [constParameter]
    struct throtl_grp *this_tg)
                       ^

vim +/end +288 arch/riscv/kernel/cpufeature.c

ff689fd21cb130 Heiko Stuebner 2022-05-11  286  =

ff689fd21cb130 Heiko Stuebner 2022-05-11  287  void __init_or_module riscv_=
cpufeature_patch_func(struct alt_entry *begin,
ff689fd21cb130 Heiko Stuebner 2022-05-11 @288  						  struct alt_entry *en=
d,

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0547538958325557852==--

