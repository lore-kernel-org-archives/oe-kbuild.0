Content-Type: multipart/mixed; boundary="===============7575970759985046400=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/sysctl_net.c:146:4: warning: Value stored to 'where' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 08 Jan 2022 23:50:18 +0800
Message-ID: <202201082339.qplFN6G1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7575970759985046400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jonathon Reinhart <jonathon.reinhart@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d1587f7bfe9a0f97a75d42ac1489aeda551106bc
commit: 31c4d2f160eb7b17cbead24dc6efed06505a3fee net: Ensure net namespace =
isolation of sysctls
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-c006-20211207 (https://download.01.org/0day-ci/arc=
hive/20220108/202201082339.qplFN6G1-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D31c4d2f160eb7b17cbead24dc6efed06505a3fee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 31c4d2f160eb7b17cbead24dc6efed06505a3fee
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/events/core.c:10082:2: note: Loop condition is false.  Exiting lo=
op
           list_for_each_entry(filter, &ifh->list, entry) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/events/core.c:10082:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry(filter, &ifh->list, entry) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   kernel/events/core.c:10083:7: note: Assuming field 'dentry' is non-null
                   if (filter->path.dentry) {
                       ^~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10083:3: note: Taking true branch
                   if (filter->path.dentry) {
                   ^
   kernel/events/core.c:10091:35: note: Passing null pointer value via 2nd =
parameter 'mm'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                                                          ^~
   kernel/events/core.c:10091:4: note: Calling 'perf_addr_filter_apply'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10044:13: note: Dereference of null pointer
           for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
                      ^~~~~~~~
   kernel/events/core.c:11837:2: warning: Value stored to 'err' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   kernel/events/core.c:11837:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> net/sysctl_net.c:146:4: warning: Value stored to 'where' is never read [=
clang-analyzer-deadcode.DeadStores]
                           where =3D "module";
                           ^       ~~~~~~~~
   net/sysctl_net.c:146:4: note: Value stored to 'where' is never read
                           where =3D "module";
                           ^       ~~~~~~~~
   net/sysctl_net.c:148:4: warning: Value stored to 'where' is never read [=
clang-analyzer-deadcode.DeadStores]
                           where =3D "kernel";
                           ^       ~~~~~~~~
   net/sysctl_net.c:148:4: note: Value stored to 'where' is never read
                           where =3D "kernel";
                           ^       ~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/input/serio/apbps2.c:114:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D ioread32be(&priv->regs->data);
                   ^
   drivers/input/serio/apbps2.c:114:3: note: Value stored to 'tmp' is never=
 read
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/input/mouse/cyapa_gen5.c:1856:16: warning: The result of the lef=
t shift is undefined because the left operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
                   value |=3D  -1 << num_bits;
                                ^
   drivers/input/mouse/cyapa_gen5.c:2318:6: note: Assuming the condition is=
 false
           if (!cyapa_is_pip_app_mode(cyapa))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:2318:2: note: Taking false branch
           if (!cyapa_is_pip_app_mode(cyapa))
           ^
   drivers/input/mouse/cyapa_gen5.c:2323:6: note: 'error' is 0
           if (error)
               ^~~~~
   drivers/input/mouse/cyapa_gen5.c:2323:2: note: Taking false branch
           if (error)
           ^
   drivers/input/mouse/cyapa_gen5.c:2328:10: note: Calling 'cyapa_gen5_read=
_mutual_idac_data'
           error =3D cyapa_gen5_read_mutual_idac_data(cyapa,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:2133:10: note: Calling 'cyapa_gen5_read=
_idac_data'
           error =3D cyapa_gen5_read_idac_data(cyapa,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1952:6: note: 'cmd_code' is equal to PI=
P_RETRIEVE_DATA_STRUCTURE
           if (cmd_code !=3D PIP_RETRIEVE_DATA_STRUCTURE ||
               ^~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1952:6: note: Left side of '||' is false
   drivers/input/mouse/cyapa_gen5.c:1953:4: note: 'idac_data_type' is equal=
 to GEN5_RETRIEVE_MUTUAL_PWC_DATA
                   (idac_data_type !=3D GEN5_RETRIEVE_MUTUAL_PWC_DATA &&
                    ^~~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1953:52: note: Left side of '&&' is fal=
se
                   (idac_data_type !=3D GEN5_RETRIEVE_MUTUAL_PWC_DATA &&
                                                                    ^
   drivers/input/mouse/cyapa_gen5.c:1955:4: note: 'data_size' is non-null
                   !data_size || !idac_max || !idac_min || !idac_ave)
                    ^~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1952:6: note: Left side of '||' is false
           if (cmd_code !=3D PIP_RETRIEVE_DATA_STRUCTURE ||
               ^
   drivers/input/mouse/cyapa_gen5.c:1955:18: note: 'idac_max' is non-null
                   !data_size || !idac_max || !idac_min || !idac_ave)
                                  ^~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1952:6: note: Left side of '||' is false
           if (cmd_code !=3D PIP_RETRIEVE_DATA_STRUCTURE ||
               ^
   drivers/input/mouse/cyapa_gen5.c:1955:31: note: 'idac_min' is non-null
                   !data_size || !idac_max || !idac_min || !idac_ave)
                                               ^~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1952:6: note: Left side of '||' is false
           if (cmd_code !=3D PIP_RETRIEVE_DATA_STRUCTURE ||
               ^
   drivers/input/mouse/cyapa_gen5.c:1955:44: note: 'idac_ave' is non-null
                   !data_size || !idac_max || !idac_min || !idac_ave)
                                                            ^~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1952:2: note: Taking false branch
           if (cmd_code !=3D PIP_RETRIEVE_DATA_STRUCTURE ||
           ^
   drivers/input/mouse/cyapa_gen5.c:1962:2: note: Taking true branch
           if (*data_size =3D=3D 0) {
           ^
   drivers/input/mouse/cyapa_gen5.c:1974:7: note: 'idac_data_type' is equal=
 to GEN5_RETRIEVE_MUTUAL_PWC_DATA
                   if (idac_data_type =3D=3D GEN5_RETRIEVE_MUTUAL_PWC_DATA)=
 {
                       ^~~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1974:3: note: Taking true branch
                   if (idac_data_type =3D=3D GEN5_RETRIEVE_MUTUAL_PWC_DATA)=
 {
                   ^
   drivers/input/mouse/cyapa_gen5.c:1975:8: note: Assuming field 'aligned_e=
lectrodes_rx' is not equal to 0
                           if (cyapa->aligned_electrodes_rx =3D=3D 0) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1975:4: note: Taking false branch
                           if (cyapa->aligned_electrodes_rx =3D=3D 0) {
                           ^
   drivers/input/mouse/cyapa_gen5.c:2016:19: note: Assuming '__UNIQUE_ID___=
x219' is >=3D '__UNIQUE_ID___y220'
                   read_elements =3D min(read_elements, max_element_cnt - c=
ount);
                                   ^

vim +/where +146 net/sysctl_net.c

95bdfccb2bf4ea Eric W. Biederman 2007-11-30  117  =

31c4d2f160eb7b Jonathon Reinhart 2021-04-12  118  /* Verify that sysctls fo=
r non-init netns are safe by either:
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  119   * 1) being read-only, or
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  120   * 2) having a data point=
er which points outside of the global kernel/module
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  121   *    data segment, and r=
ather into the heap where a per-net object was
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  122   *    allocated.
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  123   */
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  124  static void ensure_safe_n=
et_sysctl(struct net *net, const char *path,
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  125  				   struct ctl_table *=
table)
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  126  {
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  127  	struct ctl_table *ent;
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  128  =

31c4d2f160eb7b Jonathon Reinhart 2021-04-12  129  	pr_debug("Registering ne=
t sysctl (net %p): %s\n", net, path);
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  130  	for (ent =3D table; ent-=
>procname; ent++) {
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  131  		unsigned long addr;
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  132  		const char *where;
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  133  =

31c4d2f160eb7b Jonathon Reinhart 2021-04-12  134  		pr_debug("  procname=3D=
%s mode=3D%o proc_handler=3D%ps data=3D%p\n",
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  135  			 ent->procname, ent->m=
ode, ent->proc_handler, ent->data);
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  136  =

31c4d2f160eb7b Jonathon Reinhart 2021-04-12  137  		/* If it's not writable=
 inside the netns, then it can't hurt. */
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  138  		if ((ent->mode & 0222) =
=3D=3D 0) {
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  139  			pr_debug("    Not writ=
able by anyone\n");
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  140  			continue;
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  141  		}
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  142  =

31c4d2f160eb7b Jonathon Reinhart 2021-04-12  143  		/* Where does data poin=
t? */
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  144  		addr =3D (unsigned long=
)ent->data;
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  145  		if (is_module_address(a=
ddr))
31c4d2f160eb7b Jonathon Reinhart 2021-04-12 @146  			where =3D "module";
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  147  		else if (core_kernel_da=
ta(addr))
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  148  			where =3D "kernel";
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  149  		else
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  150  			continue;
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  151  =

31c4d2f160eb7b Jonathon Reinhart 2021-04-12  152  		/* If it is writable an=
d points to kernel/module global
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  153  		 * data, then it's prob=
ably a netns leak.
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  154  		 */
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  155  		WARN(1, "sysctl %s/%s: =
data points to %s global data: %ps\n",
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  156  		     path, ent->procnam=
e, where, ent->data);
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  157  =

31c4d2f160eb7b Jonathon Reinhart 2021-04-12  158  		/* Make it "safe" by dr=
opping writable perms */
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  159  		ent->mode &=3D ~0222;
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  160  	}
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  161  }
31c4d2f160eb7b Jonathon Reinhart 2021-04-12  162  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7575970759985046400==--

