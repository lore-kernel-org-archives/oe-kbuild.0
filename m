Content-Type: multipart/mixed; boundary="===============2422161986192039916=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/test_bpf.c:63:8: warning: Excessive padding in 'struct bpf_test' (11 padding bytes, where 3 is optimal).
Date: Mon, 14 Mar 2022 19:29:52 +0800
Message-ID: <202203141908.tAeiWtmh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2422161986192039916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Johan Almbladh <johan.almbladh@anyfinetworks.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: c2a228d69cef802cf6bfd773c84f8419d2e2acf9 bpf/tests: Allow different=
 number of runs per test case
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220314/202203141908.tAeiWtmh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc2a228d69cef802cf6bfd773c84f8419d2e2acf9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c2a228d69cef802cf6bfd773c84f8419d2e2acf9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:967:6: note: Left side of '&&' is true
           if (!result && powerplay_table->usDispClkDependencyTableOffset)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:967:17: note: Assuming field 'usDispClkDependencyTableOffset' is 0
           if (!result && powerplay_table->usDispClkDependencyTableOffset)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:967:2: note: Taking false branch
           if (!result && powerplay_table->usDispClkDependencyTableOffset)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:973:7: note: 'result' is 0
           if (!result && powerplay_table->usDcefclkDependencyTableOffset)
                ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:973:6: note: Left side of '&&' is true
           if (!result && powerplay_table->usDcefclkDependencyTableOffset)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:973:17: note: Assuming field 'usDcefclkDependencyTableOffset' is 0
           if (!result && powerplay_table->usDcefclkDependencyTableOffset)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:973:2: note: Taking false branch
           if (!result && powerplay_table->usDcefclkDependencyTableOffset)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:978:7: note: 'result' is 0
           if (!result && powerplay_table->usMclkDependencyTableOffset)
                ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:978:6: note: Left side of '&&' is true
           if (!result && powerplay_table->usMclkDependencyTableOffset)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:978:17: note: Assuming field 'usMclkDependencyTableOffset' is 0
           if (!result && powerplay_table->usMclkDependencyTableOffset)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:978:2: note: Taking false branch
           if (!result && powerplay_table->usMclkDependencyTableOffset)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:983:7: note: 'result' is 0
           if (!result && powerplay_table->usPCIETableOffset)
                ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:983:6: note: Left side of '&&' is true
           if (!result && powerplay_table->usPCIETableOffset)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:983:17: note: Assuming field 'usPCIETableOffset' is not equal to 0
           if (!result && powerplay_table->usPCIETableOffset)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:983:2: note: Taking true branch
           if (!result && powerplay_table->usPCIETableOffset)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:984:12: note: Calling 'get_pcie_table'
                   result =3D get_pcie_table(hwmgr,
                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:794:2: note: Assuming field 'ucNumEntries' is not equal to 0
           PP_ASSERT_WITH_CODE(atom_pcie_table->ucNumEntries,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:7: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                       ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:794:2: note: Taking false branch
           PP_ASSERT_WITH_CODE(atom_pcie_table->ucNumEntries,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:3: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:794:2: note: Loop condition is false.  Exiting loop
           PP_ASSERT_WITH_CODE(atom_pcie_table->ucNumEntries,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:38:2: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
           do {                                    \
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:798:15: note: Calling 'kzalloc'
           pcie_table =3D kzalloc(struct_size(pcie_table, entries, atom_pci=
e_table->ucNumEntries),
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:798:15: note: Returning from 'kzalloc'
           pcie_table =3D kzalloc(struct_size(pcie_table, entries, atom_pci=
e_table->ucNumEntries),
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:800:6: note: Assuming 'pcie_table' is non-null
           if (!pcie_table)
               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:800:2: note: Taking false branch
           if (!pcie_table)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:803:15: note: Access to field 'count' results in a dereference of a null =
pointer (loaded from field 'vdd_dep_on_sclk')
           pcie_count =3D table_info->vdd_dep_on_sclk->count;
                        ^           ~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> lib/test_bpf.c:63:8: warning: Excessive padding in 'struct bpf_test' (11=
 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   descr, =

   fill_helper, =

   u, =

   expected_errcode, =

   stack_depth, =

   nr_testruns, =

   test, =

   aux, =

   data, =

   frag_data, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bpf_test {
   ~~~~~~~^~~~~~~~~~
   lib/test_bpf.c:63:8: note: Excessive padding in 'struct bpf_test' (11 pa=
dding bytes, where 3 is optimal). Optimal fields order: descr, fill_helper,=
 u, expected_errcode, stack_depth, nr_testruns, test, aux, data, frag_data,=
 consider reordering the fields or adding explicit padding members
   struct bpf_test {
   ~~~~~~~^~~~~~~~~~
   lib/test_bpf.c:8593:2: warning: Undefined or garbage value returned to c=
aller [clang-analyzer-core.uninitialized.UndefReturn]
           return fp;
           ^
   lib/test_bpf.c:9242:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   lib/test_bpf.c:9242:2: note: Taking false branch
           if (ret < 0)
           ^
   lib/test_bpf.c:9245:8: note: Calling 'test_bpf'
           ret =3D test_bpf();
                 ^~~~~~~~~~
   lib/test_bpf.c:8953:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
           ^
   lib/test_bpf.c:8958:3: note: Taking false branch
                   if (exclude_test(i))
                   ^
   lib/test_bpf.c:8961:3: note: Loop condition is false.  Exiting loop
                   pr_info("#%d %s ", i, tests[i].descr);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   lib/test_bpf.c:8963:8: note: Calling 'generate_filter'
                   fp =3D generate_filter(i, &err);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_bpf.c:8537:2: note: 'fp' declared without an initial value
           struct bpf_prog *fp;
           ^~~~~~~~~~~~~~~~~~~
   lib/test_bpf.c:8539:2: note: 'Default' branch taken. Execution continues=
 on line 8592
           switch (test_type) {
           ^
   lib/test_bpf.c:8593:2: note: Undefined or garbage value returned to call=
er
           return fp;
           ^      ~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1328=
:2: warning: Value stored to 'rd_buf_ptr' is never read [clang-analyzer-dea=
dcode.DeadStores]
           rd_buf_ptr +=3D str_len;
           ^             ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1328=
:2: note: Value stored to 'rd_buf_ptr' is never read
           rd_buf_ptr +=3D str_len;
           ^             ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1515=
:2: warning: Value stored to 'rd_buf_ptr' is never read [clang-analyzer-dea=
dcode.DeadStores]
           rd_buf_ptr +=3D str_len;
           ^             ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1515=
:2: note: Value stored to 'rd_buf_ptr' is never read
           rd_buf_ptr +=3D str_len;
           ^             ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1700=
:2: warning: Value stored to 'rd_buf_ptr' is never read [clang-analyzer-dea=
dcode.DeadStores]
           rd_buf_ptr +=3D str_len;
           ^             ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1700=
:2: note: Value stored to 'rd_buf_ptr' is never read
           rd_buf_ptr +=3D str_len;
           ^             ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1881=
:2: warning: Value stored to 'rd_buf_ptr' is never read [clang-analyzer-dea=
dcode.DeadStores]
           rd_buf_ptr +=3D str_len;
           ^             ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1881=
:2: note: Value stored to 'rd_buf_ptr' is never read
           rd_buf_ptr +=3D str_len;
           ^             ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:2057=
:2: warning: Value stored to 'rd_buf_ptr' is never read [clang-analyzer-dea=
dcode.DeadStores]
           rd_buf_ptr +=3D str_len;

vim +63 lib/test_bpf.c

10f18e0ba1ea7e Daniel Borkmann    2014-05-23  62  =

64a8946b447e41 Alexei Starovoitov 2014-05-08 @63  struct bpf_test {
64a8946b447e41 Alexei Starovoitov 2014-05-08  64  	const char *descr;
64a8946b447e41 Alexei Starovoitov 2014-05-08  65  	union {
64a8946b447e41 Alexei Starovoitov 2014-05-08  66  		struct sock_filter insn=
s[MAX_INSNS];
2695fb552cbef1 Alexei Starovoitov 2014-07-24  67  		struct bpf_insn insns_i=
nt[MAX_INSNS];
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  68  		struct {
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  69  			void *insns;
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  70  			unsigned int len;
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  71  		} ptr;
ece80490e2c1ce Andrew Morton      2014-05-22  72  	} u;
10f18e0ba1ea7e Daniel Borkmann    2014-05-23  73  	__u8 aux;
64a8946b447e41 Alexei Starovoitov 2014-05-08  74  	__u8 data[MAX_DATA];
64a8946b447e41 Alexei Starovoitov 2014-05-08  75  	struct {
64a8946b447e41 Alexei Starovoitov 2014-05-08  76  		int data_size;
64a8946b447e41 Alexei Starovoitov 2014-05-08  77  		__u32 result;
64a8946b447e41 Alexei Starovoitov 2014-05-08  78  	} test[MAX_SUBTESTS];
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  79  	int (*fill_helper)(struc=
t bpf_test *self);
09584b40674241 Yonghong Song      2018-02-02  80  	int expected_errcode; /*=
 used when FLAG_EXPECTED_FAIL is set in the aux */
bac142acb90e95 Nicolas Schichan   2015-08-04  81  	__u8 frag_data[MAX_DATA];
105c03614bff2d Alexei Starovoitov 2017-05-30  82  	int stack_depth; /* for =
eBPF only, since tests don't call verifier */
c2a228d69cef80 Johan Almbladh     2021-09-14  83  	int nr_testruns; /* Cust=
om run count, defaults to MAX_TESTRUNS if 0 */
64a8946b447e41 Alexei Starovoitov 2014-05-08  84  };
64a8946b447e41 Alexei Starovoitov 2014-05-08  85  =


:::::: The code@line 63 was first introduced by commit
:::::: 64a8946b447e418b4283c3573ef397980cca0cd8 net: filter: BPF testsuite

:::::: TO: Alexei Starovoitov <ast@plumgrid.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2422161986192039916==--

