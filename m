Content-Type: multipart/mixed; boundary="===============5167390476409907633=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/xfs_trans_ail.c:737:10: warning: Although the value stored to 'lip' is used in the enclosing expression, the value is never actually read from 'lip' [clang-analyzer-deadcode.DeadStores]
Date: Mon, 28 Mar 2022 16:10:11 +0800
Message-ID: <202203281617.KuzeVElb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5167390476409907633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Chandan Babu R <chandan.babu@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: 941fbdfd6dd0f1d7961c28123b5460912f678cb5 xfs: xfs_ail_push_all_sync=
() stalls when racing with updates
date:   8 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20328/202203281617.KuzeVElb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D941fbdfd6dd0f1d7961c28123b5460912f678cb5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 941fbdfd6dd0f1d7961c28123b5460912f678cb5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/xfs/xfs_trans_ail.c:473:2: note:  Execution continues on line 473
           XFS_STATS_INC(mp, xs_push_ail);
           ^
   fs/xfs/xfs_stats.h:165:33: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->s.v++;   \
                                          ^
   fs/xfs/xfs_linux.h:104:25: note: expanded from macro 'current_cpu'
   #define current_cpu()           (raw_smp_processor_id())
                                    ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:323:42: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                                   ^
   fs/xfs/xfs_trans_ail.c:473:2: note: Loop condition is false.  Exiting lo=
op
           XFS_STATS_INC(mp, xs_push_ail);
           ^
   fs/xfs/xfs_stats.h:166:2: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(mp->m_stats.xs_stats, current_cpu())->s.v++;        \
           ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/xfs_trans_ail.c:473:2: note: Loop condition is false.  Exiting lo=
op
           XFS_STATS_INC(mp, xs_push_ail);
           ^
   fs/xfs/xfs_stats.h:166:36: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(mp->m_stats.xs_stats, current_cpu())->s.v++;        \
                                             ^
   fs/xfs/xfs_linux.h:104:25: note: expanded from macro 'current_cpu'
   #define current_cpu()           (raw_smp_processor_id())
                                    ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/xfs_trans_ail.c:473:2: note: Control jumps to 'case 4:'  at line =
473
           XFS_STATS_INC(mp, xs_push_ail);
           ^
   fs/xfs/xfs_stats.h:166:36: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(mp->m_stats.xs_stats, current_cpu())->s.v++;        \
                                             ^
   fs/xfs/xfs_linux.h:104:25: note: expanded from macro 'current_cpu'
   #define current_cpu()           (raw_smp_processor_id())
                                    ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   fs/xfs/xfs_trans_ail.c:473:2: note:  Execution continues on line 473
           XFS_STATS_INC(mp, xs_push_ail);
           ^
   fs/xfs/xfs_stats.h:166:36: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(mp->m_stats.xs_stats, current_cpu())->s.v++;        \
                                             ^
   fs/xfs/xfs_linux.h:104:25: note: expanded from macro 'current_cpu'
   #define current_cpu()           (raw_smp_processor_id())
                                    ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:323:42: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                                   ^
   fs/xfs/xfs_trans_ail.c:473:2: note: Loop condition is false.  Exiting lo=
op
           XFS_STATS_INC(mp, xs_push_ail);
           ^
   fs/xfs/xfs_stats.h:163:34: note: expanded from macro 'XFS_STATS_INC'
   #define XFS_STATS_INC(mp, v)                                    \
                                                                   ^
   fs/xfs/xfs_trans_ail.c:476:10: note: 2nd function call argument is an un=
initialized value
           while ((XFS_LSN_CMP(lip->li_lsn, target) <=3D 0)) {
                   ^
   fs/xfs/xfs_log.h:91:26: note: expanded from macro 'XFS_LSN_CMP'
   #define XFS_LSN_CMP(x,y) _lsn_cmp(x,y)
                            ^          ~
>> fs/xfs/xfs_trans_ail.c:737:10: warning: Although the value stored to 'li=
p' is used in the enclosing expression, the value is never actually read fr=
om 'lip' [clang-analyzer-deadcode.DeadStores]
           while ((lip =3D xfs_ail_max(ailp)) !=3D NULL) {
                   ^     ~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_trans_ail.c:737:10: note: Although the value stored to 'lip' =
is used in the enclosing expression, the value is never actually read from =
'lip'
           while ((lip =3D xfs_ail_max(ailp)) !=3D NULL) {
                   ^     ~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   5 warnings generated.
   kernel/static_call.c:275:47: warning: Access to field 'func' results in =
a dereference of a null pointer (loaded from variable 'key') [clang-analyze=
r-core.NullDereference]
                   arch_static_call_transform(site_addr, NULL, key->func,
                                                               ^
   kernel/static_call.c:500:16: note: Calling 'static_call_init'
   early_initcall(static_call_init);
                  ^
   include/linux/init.h:269:47: note: expanded from macro 'early_initcall'
   #define early_initcall(fn)              __define_initcall(fn, early)
                                           ~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/init.h:262:54: note: expanded from macro '__define_initcal=
l'
   #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##=
id)
                                     ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/init.h:260:20: note: expanded from macro '___define_initca=
ll'
           __unique_initcall(fn, id, __sec, __initcall_id(fn))
           ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:254:22: note: expanded from macro '__unique_initcal=
l'
           ____define_initcall(fn,                                 \
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:241:33: note: expanded from macro '____define_initc=
all'
           __define_initcall_stub(__stub, fn)                      \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/init.h:226:10: note: expanded from macro '__define_initcal=
l_stub'
                   return fn();                                    \
                          ^~~~
   kernel/static_call.c:478:6: note: Assuming 'static_call_initialized' is =
false
           if (static_call_initialized)
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/static_call.c:478:2: note: Taking false branch
           if (static_call_initialized)
           ^
   kernel/static_call.c:483:8: note: Calling '__static_call_init'
           ret =3D __static_call_init(NULL, __start_static_call_sites,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/static_call.c:217:6: note: 'start' is not equal to 'stop'
           if (start =3D=3D stop)
               ^~~~~
   kernel/static_call.c:217:2: note: Taking false branch
           if (start =3D=3D stop)
           ^
   kernel/static_call.c:222:2: note: Loop condition is true.  Entering loop=
 body
           for (site =3D start; site < stop; site++) {
           ^
   kernel/static_call.c:225:8: note: 'mod' is null
                   if ((mod && within_module_init((unsigned long)site_addr,=
 mod)) ||
                        ^~~
   kernel/static_call.c:225:12: note: Left side of '&&' is false
                   if ((mod && within_module_init((unsigned long)site_addr,=
 mod)) ||
                            ^
   kernel/static_call.c:226:9: note: 'mod' is null
                       (!mod && init_section_contains(site_addr, 1)))
                         ^~~
   kernel/static_call.c:226:8: note: Left side of '&&' is true
                       (!mod && init_section_contains(site_addr, 1)))
                        ^
   kernel/static_call.c:225:3: note: Taking false branch
                   if ((mod && within_module_init((unsigned long)site_addr,=
 mod)) ||
                   ^
   kernel/static_call.c:229:3: note: Value assigned to 'key'
                   key =3D static_call_key(site);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/static_call.c:230:7: note: Assuming 'key' is equal to 'prev_key'
                   if (key !=3D prev_key) {

vim +737 fs/xfs/xfs_trans_ail.c

fd074841cfe01b0 Dave Chinner      2011-04-08  725  =

211e4d434bd737b Christoph Hellwig 2012-04-23  726  /*
211e4d434bd737b Christoph Hellwig 2012-04-23  727   * Push out all items in=
 the AIL immediately and wait until the AIL is empty.
211e4d434bd737b Christoph Hellwig 2012-04-23  728   */
211e4d434bd737b Christoph Hellwig 2012-04-23  729  void
211e4d434bd737b Christoph Hellwig 2012-04-23  730  xfs_ail_push_all_sync(
211e4d434bd737b Christoph Hellwig 2012-04-23  731  	struct xfs_ail  *ailp)
211e4d434bd737b Christoph Hellwig 2012-04-23  732  {
211e4d434bd737b Christoph Hellwig 2012-04-23  733  	struct xfs_log_item	*li=
p;
211e4d434bd737b Christoph Hellwig 2012-04-23  734  	DEFINE_WAIT(wait);
211e4d434bd737b Christoph Hellwig 2012-04-23  735  =

57e809561118a4d Matthew Wilcox    2018-03-07  736  	spin_lock(&ailp->ail_lo=
ck);
211e4d434bd737b Christoph Hellwig 2012-04-23 @737  	while ((lip =3D xfs_ail=
_max(ailp)) !=3D NULL) {
57e809561118a4d Matthew Wilcox    2018-03-07  738  		prepare_to_wait(&ailp-=
>ail_empty, &wait, TASK_UNINTERRUPTIBLE);
57e809561118a4d Matthew Wilcox    2018-03-07  739  		wake_up_process(ailp->=
ail_task);
57e809561118a4d Matthew Wilcox    2018-03-07  740  		spin_unlock(&ailp->ail=
_lock);
211e4d434bd737b Christoph Hellwig 2012-04-23  741  		schedule();
57e809561118a4d Matthew Wilcox    2018-03-07  742  		spin_lock(&ailp->ail_l=
ock);
211e4d434bd737b Christoph Hellwig 2012-04-23  743  	}
57e809561118a4d Matthew Wilcox    2018-03-07  744  	spin_unlock(&ailp->ail_=
lock);
211e4d434bd737b Christoph Hellwig 2012-04-23  745  =

57e809561118a4d Matthew Wilcox    2018-03-07  746  	finish_wait(&ailp->ail_=
empty, &wait);
211e4d434bd737b Christoph Hellwig 2012-04-23  747  }
211e4d434bd737b Christoph Hellwig 2012-04-23  748  =


:::::: The code at line 737 was first introduced by commit
:::::: 211e4d434bd737be38aabad0247ce3da9964370e xfs: implement freezing by =
emptying the AIL

:::::: TO: Christoph Hellwig <hch@infradead.org>
:::::: CC: Ben Myers <bpm@sgi.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5167390476409907633==--

