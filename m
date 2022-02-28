Content-Type: multipart/mixed; boundary="===============4838827416931725055=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.17.y-rt-rebase 16/117] kernel/printk/printk.c:3059:4: warning: Value stored to 'any_usable' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 28 Feb 2022 11:37:47 +0800
Message-ID: <202202281113.l5cXAnKc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4838827416931725055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.17.y-rt-rebase
head:   2da1afeb004bf496c1cb9b5dbc9b92900a689b2b
commit: 13ead04370ba6ef9a9067b71a805b24a1cfcd264 [16/117] serial: 8250: imp=
lement write_atomic
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
228/202202281113.l5cXAnKc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3D13ead04370ba6ef9a9067b71a805b24a1cfcd264
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel=
/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.17.y-rt-rebase
        git checkout 13ead04370ba6ef9a9067b71a805b24a1cfcd264
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:388:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/gfs2/bmap.c:2279:2: note: '?' condition is true
           fs_warn(sdp, "bmap=3D%d lblock=3D%llu block=3D%llu, state=3D0x%0=
8lx, size=3D%llu\n",
           ^
   fs/gfs2/util.h:22:2: note: expanded from macro 'fs_warn'
           pr_warn("fsid=3D%s: " fmt, (fs)->sd_fsname, ##__VA_ARGS__)
           ^
   include/linux/printk.h:517:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:397:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   fs/gfs2/bmap.c:2279:2: note: '?' condition is true
           fs_warn(sdp, "bmap=3D%d lblock=3D%llu block=3D%llu, state=3D0x%0=
8lx, size=3D%llu\n",
           ^
   fs/gfs2/util.h:22:2: note: expanded from macro 'fs_warn'
           pr_warn("fsid=3D%s: " fmt, (fs)->sd_fsname, ##__VA_ARGS__)
           ^
   include/linux/printk.h:517:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:401:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   fs/gfs2/bmap.c:2279:2: note: Loop condition is false.  Exiting loop
           fs_warn(sdp, "bmap=3D%d lblock=3D%llu block=3D%llu, state=3D0x%0=
8lx, size=3D%llu\n",
           ^
   fs/gfs2/util.h:22:2: note: expanded from macro 'fs_warn'
           pr_warn("fsid=3D%s: " fmt, (fs)->sd_fsname, ##__VA_ARGS__)
           ^
   include/linux/printk.h:517:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:387:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   fs/gfs2/bmap.c:2282:2: note: Calling 'gfs2_free_journal_extents'
           gfs2_free_journal_extents(jd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/bmap.c:2178:2: note: Loop condition is true.  Entering loop body
           while(!list_empty(&jd->extent_list)) {
           ^
   fs/gfs2/bmap.c:2181:3: note: Memory is released
                   kfree(jext);
                   ^~~~~~~~~~~
   fs/gfs2/bmap.c:2178:8: note: Assuming the condition is true
           while(!list_empty(&jd->extent_list)) {
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/bmap.c:2178:2: note: Loop condition is true.  Entering loop body
           while(!list_empty(&jd->extent_list)) {
           ^
   fs/gfs2/bmap.c:2180:3: note: Calling 'list_del'
                   list_del(&jext->list);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   kernel/printk/printk.c:157:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:157:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:159:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:159:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
>> kernel/printk/printk.c:3059:4: warning: Value stored to 'any_usable' is =
never read [clang-analyzer-deadcode.DeadStores]
                           any_usable =3D true;
                           ^            ~~~~
   kernel/printk/printk.c:3059:4: note: Value stored to 'any_usable' is nev=
er read
                           any_usable =3D true;
                           ^            ~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/input/touchscreen/ads7846.c:329:8: warning: Excessive padding in=
 'struct ser_req' (81 padding bytes, where 17 is optimal). =

   Optimal fields order: =

   sample, =

   scratch, =

   msg, =

   xfer, =

   ref_on, =

   command, =

   ref_off, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ser_req {
   ~~~~~~~^~~~~~~~~
   drivers/input/touchscreen/ads7846.c:329:8: note: Excessive padding in 's=
truct ser_req' (81 padding bytes, where 17 is optimal). Optimal fields orde=
r: sample, scratch, msg, xfer, ref_on, command, ref_off, consider reorderin=
g the fields or adding explicit padding members
   struct ser_req {
   ~~~~~~~^~~~~~~~~
   drivers/input/touchscreen/ads7846.c:343:8: warning: Excessive padding in=
 'struct ads7845_ser_req' (114 padding bytes, where 50 is optimal). =

   Optimal fields order: =

   sample, =

   command, =

   msg, =

   xfer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ads7845_ser_req {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ads7846.c:343:8: note: Excessive padding in 's=
truct ads7845_ser_req' (114 padding bytes, where 50 is optimal). Optimal fi=
elds order: sample, command, msg, xfer, consider reordering the fields or a=
dding explicit padding members
   struct ads7845_ser_req {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   1 warning generated.
   include/linux/list.h:88:2: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
           __list_add(new, head, head->next);
           ^
   kernel/audit_watch.c:476:19: note: Assuming 'audit_watch_group' is equal=
 to field 'group'
           if (WARN_ON_ONCE(inode_mark->group !=3D audit_watch_group))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/audit_watch.c:476:6: note: '?' condition is false
           if (WARN_ON_ONCE(inode_mark->group !=3D audit_watch_group))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/audit_watch.c:476:6: note: '?' condition is false
           if (WARN_ON_ONCE(inode_mark->group !=3D audit_watch_group))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   kernel/audit_watch.c:476:6: note: Taking false branch
           if (WARN_ON_ONCE(inode_mark->group !=3D audit_watch_group))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/audit_watch.c:476:2: note: '?' condition is false
           if (WARN_ON_ONCE(inode_mark->group !=3D audit_watch_group))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/audit_watch.c:476:19: note: Assuming 'audit_watch_group' is equal=
 to field 'group'
           if (WARN_ON_ONCE(inode_mark->group !=3D audit_watch_group))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \

vim +/any_usable +3059 kernel/printk/printk.c

a1b245828d4e47 John Ogness 2022-02-04  3048  =

a1b245828d4e47 John Ogness 2022-02-04  3049  	printk_cpu_sync_get_irqsave(f=
lags);
a1b245828d4e47 John Ogness 2022-02-04  3050  =

a1b245828d4e47 John Ogness 2022-02-04  3051  	do {
a1b245828d4e47 John Ogness 2022-02-04  3052  		any_progress =3D false;
a1b245828d4e47 John Ogness 2022-02-04  3053  =

a1b245828d4e47 John Ogness 2022-02-04  3054  		for_each_console(con) {
a1b245828d4e47 John Ogness 2022-02-04  3055  			bool progress;
a1b245828d4e47 John Ogness 2022-02-04  3056  =

a1b245828d4e47 John Ogness 2022-02-04  3057  			if (!console_is_usable(con,=
 true))
a1b245828d4e47 John Ogness 2022-02-04  3058  				continue;
a1b245828d4e47 John Ogness 2022-02-04 @3059  			any_usable =3D true;
a1b245828d4e47 John Ogness 2022-02-04  3060  =

a1b245828d4e47 John Ogness 2022-02-04  3061  			if (con->flags & CON_EXTEND=
ED) {
a1b245828d4e47 John Ogness 2022-02-04  3062  				/* Extended consoles do no=
t print "dropped messages". */
a1b245828d4e47 John Ogness 2022-02-04  3063  				progress =3D console_emit_=
next_record(con,
a1b245828d4e47 John Ogness 2022-02-04  3064  							&con->atomic_data->text=
[index],
a1b245828d4e47 John Ogness 2022-02-04  3065  							&con->atomic_data->ext_=
text[index],
a1b245828d4e47 John Ogness 2022-02-04  3066  							NULL,
a1b245828d4e47 John Ogness 2022-02-04  3067  							true, NULL);
a1b245828d4e47 John Ogness 2022-02-04  3068  			} else {
a1b245828d4e47 John Ogness 2022-02-04  3069  				progress =3D console_emit_=
next_record(con,
a1b245828d4e47 John Ogness 2022-02-04  3070  							&con->atomic_data->text=
[index],
a1b245828d4e47 John Ogness 2022-02-04  3071  							NULL,
a1b245828d4e47 John Ogness 2022-02-04  3072  							&con->atomic_data->drop=
ped_text[index],
a1b245828d4e47 John Ogness 2022-02-04  3073  							true, NULL);
a1b245828d4e47 John Ogness 2022-02-04  3074  			}
a1b245828d4e47 John Ogness 2022-02-04  3075  =

a1b245828d4e47 John Ogness 2022-02-04  3076  			if (!progress)
a1b245828d4e47 John Ogness 2022-02-04  3077  				continue;
a1b245828d4e47 John Ogness 2022-02-04  3078  			any_progress =3D true;
a1b245828d4e47 John Ogness 2022-02-04  3079  =

a1b245828d4e47 John Ogness 2022-02-04  3080  			touch_softlockup_watchdog_s=
ync();
a1b245828d4e47 John Ogness 2022-02-04  3081  			clocksource_touch_watchdog(=
);
a1b245828d4e47 John Ogness 2022-02-04  3082  			rcu_cpu_stall_reset();
a1b245828d4e47 John Ogness 2022-02-04  3083  			touch_nmi_watchdog();
a1b245828d4e47 John Ogness 2022-02-04  3084  		}
a1b245828d4e47 John Ogness 2022-02-04  3085  	} while (any_progress);
a1b245828d4e47 John Ogness 2022-02-04  3086  =

a1b245828d4e47 John Ogness 2022-02-04  3087  	printk_cpu_sync_put_irqrestor=
e(flags);
a1b245828d4e47 John Ogness 2022-02-04  3088  }
a1b245828d4e47 John Ogness 2022-02-04  3089  #else /* CONFIG_HAVE_ATOMIC_CO=
NSOLE */
a1b245828d4e47 John Ogness 2022-02-04  3090  #define atomic_console_flush_a=
ll()
a1b245828d4e47 John Ogness 2022-02-04  3091  #endif
a1b245828d4e47 John Ogness 2022-02-04  3092  =


:::::: The code at line 3059 was first introduced by commit
:::::: a1b245828d4e478367d866406e847baf596e9673 printk: add infrastucture f=
or atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4838827416931725055==--

