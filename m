Content-Type: multipart/mixed; boundary="===============3213057705430696325=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/sysctl_net.c:146:4: warning: Value stored to 'where' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 02 Jan 2022 12:23:14 +0800
Message-ID: <202201021220.hWaGDDmh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3213057705430696325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jonathon Reinhart <jonathon.reinhart@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: 31c4d2f160eb7b17cbead24dc6efed06505a3fee net: Ensure net namespace =
isolation of sysctls
date:   9 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-c006-20211207 (https://download.01.org/0day-ci/arc=
hive/20220102/202201021220.hWaGDDmh-lkp(a)intel.com/config)
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
   drivers/char/ipmi/ipmi_si_intf.c:766:2: note: Taking true branch
           if (si_sm_result =3D=3D SI_SM_TRANSACTION_COMPLETE) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:769:3: note: Calling 'handle_transactio=
n_done'
                   handle_transaction_done(smi_info);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:541:2: note: Control jumps to 'case SI_=
GETTING_EVENTS:'  at line 600
           switch (smi_info->si_state) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:603:4: note: Access to field 'rsp_size'=
 results in a dereference of a null pointer (loaded from field 'curr_msg')
                           =3D smi_info->handlers->get_result(
                           ^
   drivers/char/ipmi/ipmi_si_intf.c:641:4: warning: Access to field 'rsp_si=
ze' results in a dereference of a null pointer (loaded from field 'curr_msg=
') [clang-analyzer-core.NullDereference]
                           =3D smi_info->handlers->get_result(
                           ^
   drivers/char/ipmi/ipmi_si_intf.c:2167:6: note: Assuming field 'dev_group=
_added' is false
           if (smi_info->dev_group_added) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2167:2: note: Taking false branch
           if (smi_info->dev_group_added) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:2171:6: note: Assuming field 'dev' is n=
ull
           if (smi_info->io.dev)
               ^~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2171:2: note: Taking false branch
           if (smi_info->io.dev)
           ^
   drivers/char/ipmi/ipmi_si_intf.c:2179:6: note: Assuming field 'irq_clean=
up' is null
           if (smi_info->io.irq_cleanup) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2179:2: note: Taking false branch
           if (smi_info->io.irq_cleanup) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:2183:2: note: Calling 'stop_timer_and_t=
hread'
           stop_timer_and_thread(smi_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1843:6: note: Assuming field 'thread' i=
s equal to NULL
           if (smi_info->thread !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1843:2: note: Taking false branch
           if (smi_info->thread !=3D NULL) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:1849:2: note: Value assigned to field '=
curr_msg'
           del_timer_sync(&smi_info->si_timer);
           ^
   include/linux/timer.h:190:29: note: expanded from macro 'del_timer_sync'
   # define del_timer_sync(t)              del_timer(t)
                                           ^~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2183:2: note: Returning from 'stop_time=
r_and_thread'
           stop_timer_and_thread(smi_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2197:9: note: Assuming field 'curr_msg'=
 is null
           while (smi_info->curr_msg || (smi_info->si_state !=3D SI_NORMAL)=
) {
                  ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2197:9: note: Left side of '||' is false
   drivers/char/ipmi/ipmi_si_intf.c:2197:32: note: Assuming field 'si_state=
' is not equal to SI_NORMAL
           while (smi_info->curr_msg || (smi_info->si_state !=3D SI_NORMAL)=
) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2197:2: note: Loop condition is true.  =
Entering loop body
           while (smi_info->curr_msg || (smi_info->si_state !=3D SI_NORMAL)=
) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:2198:3: note: Calling 'poll'
                   poll(smi_info);
                   ^~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1040:6: note: Assuming 'run_to_completi=
on' is true
           if (!run_to_completion)
               ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1040:2: note: Taking false branch
           if (!run_to_completion)
           ^
   drivers/char/ipmi/ipmi_si_intf.c:1042:2: note: Calling 'smi_event_handle=
r'
           smi_event_handler(smi_info, 10);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:763:9: note: Assuming 'si_sm_result' is=
 not equal to SI_SM_CALL_WITHOUT_DELAY
           while (si_sm_result =3D=3D SI_SM_CALL_WITHOUT_DELAY)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:763:2: note: Loop condition is false. E=
xecution continues on line 766
           while (si_sm_result =3D=3D SI_SM_CALL_WITHOUT_DELAY)
           ^
   drivers/char/ipmi/ipmi_si_intf.c:766:6: note: Assuming 'si_sm_result' is=
 equal to SI_SM_TRANSACTION_COMPLETE
           if (si_sm_result =3D=3D SI_SM_TRANSACTION_COMPLETE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:766:2: note: Taking true branch
           if (si_sm_result =3D=3D SI_SM_TRANSACTION_COMPLETE) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:769:3: note: Calling 'handle_transactio=
n_done'
                   handle_transaction_done(smi_info);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:541:2: note: Control jumps to 'case SI_=
GETTING_MESSAGES:'  at line 638
           switch (smi_info->si_state) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:641:4: note: Access to field 'rsp_size'=
 results in a dereference of a null pointer (loaded from field 'curr_msg')
                           =3D smi_info->handlers->get_result(
                           ^
   Suppressed 3 warnings (3 in non-user code).
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/md/md-faulty.c:247:7: warning: Although the value stored to 'n' =
is used in the enclosing expression, the value is never actually read from =
'n' [clang-analyzer-deadcode.DeadStores]
           if ((n=3Datomic_read(&conf->counters[WriteAll])) !=3D 0)
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-faulty.c:247:7: note: Although the value stored to 'n' is =
used in the enclosing expression, the value is never actually read from 'n'
           if ((n=3Datomic_read(&conf->counters[WriteAll])) !=3D 0)
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/xfs/xfs_pnfs.c:39:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_pnfs.c:39:3: note: Value stored to 'error' is never read
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   3 warnings generated.
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

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
--===============3213057705430696325==--

