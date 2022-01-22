Content-Type: multipart/mixed; boundary="===============4097445864619874984=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.16.y-rt-rebase 16/132] kernel/printk/printk.c:3003:4: warning: Value stored to 'any_usable' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 23 Jan 2022 05:52:06 +0800
Message-ID: <202201230553.1xzXqlQl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4097445864619874984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.16.y-rt-rebase
head:   1722f531f5244c70dcd9687c40729860bb254e8d
commit: e1fd5438186d729df636919574f08231f7ecdd1d [16/132] serial: 8250: imp=
lement write_atomic
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20123/202201230553.1xzXqlQl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3De1fd5438186d729df636919574f08231f7ecdd1d
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel=
/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.16.y-rt-rebase
        git checkout e1fd5438186d729df636919574f08231f7ecdd1d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/jbd2/transaction.c:2497:2: note: Loop condition is false.  Exiting lo=
op
           J_ASSERT_JH(jh, jh->b_transaction =3D=3D transaction ||
           ^
   include/linux/jbd2.h:364:31: note: expanded from macro 'J_ASSERT_JH'
   #define J_ASSERT_JH(jh, expr)   J_ASSERT(expr)
                                   ^
   include/linux/jbd2.h:361:26: note: expanded from macro 'J_ASSERT'
   #define J_ASSERT(assert)        BUG_ON(!(assert))
                                   ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/jbd2/transaction.c:2500:10: note: Field 'b_transaction' is null
           if (jh->b_transaction && jh->b_jlist =3D=3D jlist)
                   ^
   fs/jbd2/transaction.c:2500:24: note: Left side of '&&' is false
           if (jh->b_transaction && jh->b_jlist =3D=3D jlist)
                                 ^
   fs/jbd2/transaction.c:2503:6: note: Assuming 'jlist' is not equal to BJ_=
Metadata
           if (jlist =3D=3D BJ_Metadata || jlist =3D=3D BJ_Reserved ||
               ^~~~~~~~~~~~~~~~~~~~
   fs/jbd2/transaction.c:2503:6: note: Left side of '||' is false
   fs/jbd2/transaction.c:2503:30: note: Assuming 'jlist' is not equal to BJ=
_Reserved
           if (jlist =3D=3D BJ_Metadata || jlist =3D=3D BJ_Reserved ||
                                       ^~~~~~~~~~~~~~~~~~~~
   fs/jbd2/transaction.c:2503:6: note: Left side of '||' is false
           if (jlist =3D=3D BJ_Metadata || jlist =3D=3D BJ_Reserved ||
               ^
   fs/jbd2/transaction.c:2504:6: note: Assuming 'jlist' is not equal to BJ_=
Shadow
               jlist =3D=3D BJ_Shadow || jlist =3D=3D BJ_Forget) {
               ^~~~~~~~~~~~~~~~~~
   fs/jbd2/transaction.c:2503:6: note: Left side of '||' is false
           if (jlist =3D=3D BJ_Metadata || jlist =3D=3D BJ_Reserved ||
               ^
   fs/jbd2/transaction.c:2504:28: note: Assuming 'jlist' is not equal to BJ=
_Forget
               jlist =3D=3D BJ_Shadow || jlist =3D=3D BJ_Forget) {
                                     ^~~~~~~~~~~~~~~~~~
   fs/jbd2/transaction.c:2503:2: note: Taking false branch
           if (jlist =3D=3D BJ_Metadata || jlist =3D=3D BJ_Reserved ||
           ^
   fs/jbd2/transaction.c:2519:10: note: Field 'b_transaction' is null
           if (jh->b_transaction)
                   ^
   fs/jbd2/transaction.c:2519:2: note: Taking false branch
           if (jh->b_transaction)
           ^
   fs/jbd2/transaction.c:2525:2: note: 'Default' branch taken. Execution co=
ntinues on line 2545
           switch (jlist) {
           ^
   fs/jbd2/transaction.c:2545:21: note: Passing null pointer value via 1st =
parameter 'list'
           __blist_add_buffer(list, jh);
                              ^~~~
   fs/jbd2/transaction.c:2545:2: note: Calling '__blist_add_buffer'
           __blist_add_buffer(list, jh);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jbd2/transaction.c:1960:7: note: Dereference of null pointer (loaded =
from variable 'list')
           if (!*list) {
                ^~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
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
>> kernel/printk/printk.c:3003:4: warning: Value stored to 'any_usable' is =
never read [clang-analyzer-deadcode.DeadStores]
                           any_usable =3D true;
                           ^            ~~~~
   kernel/printk/printk.c:3003:4: note: Value stored to 'any_usable' is nev=
er read
                           any_usable =3D true;
                           ^            ~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/xfs/libxfs/xfs_refcount.c:114:19: warning: Value stored to 'agno' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           xfs_agnumber_t                  agno =3D cur->bc_ag.pag->pag_agn=
o;
                                           ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_refcount.c:114:19: note: Value stored to 'agno' during=
 its initialization is never read
           xfs_agnumber_t                  agno =3D cur->bc_ag.pag->pag_agn=
o;
                                           ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   drivers/acpi/acpica/exnames.c:160:4: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(name_string, char_buf);
                           ^~~~~~
   drivers/acpi/acpica/exnames.c:160:4: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                           strcat(name_string, char_buf);
                           ^~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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

vim +/any_usable +3003 kernel/printk/printk.c

02489ebe320634 John Ogness 2021-12-22  2992  =

02489ebe320634 John Ogness 2021-12-22  2993  	printk_cpu_sync_get_irqsave(f=
lags);
02489ebe320634 John Ogness 2021-12-22  2994  =

02489ebe320634 John Ogness 2021-12-22  2995  	do {
02489ebe320634 John Ogness 2021-12-22  2996  		any_progress =3D false;
02489ebe320634 John Ogness 2021-12-22  2997  =

02489ebe320634 John Ogness 2021-12-22  2998  		for_each_console(con) {
02489ebe320634 John Ogness 2021-12-22  2999  			bool progress;
02489ebe320634 John Ogness 2021-12-22  3000  =

02489ebe320634 John Ogness 2021-12-22  3001  			if (!console_is_usable(con,=
 true))
02489ebe320634 John Ogness 2021-12-22  3002  				continue;
02489ebe320634 John Ogness 2021-12-22 @3003  			any_usable =3D true;
02489ebe320634 John Ogness 2021-12-22  3004  =

02489ebe320634 John Ogness 2021-12-22  3005  			if (con->flags & CON_EXTEND=
ED) {
02489ebe320634 John Ogness 2021-12-22  3006  				/* Extended consoles do no=
t print "dropped messages". */
02489ebe320634 John Ogness 2021-12-22  3007  				progress =3D console_emit_=
next_record(con,
02489ebe320634 John Ogness 2021-12-22  3008  							&con->atomic_data->text=
[index],
02489ebe320634 John Ogness 2021-12-22  3009  							&con->atomic_data->ext_=
text[index],
02489ebe320634 John Ogness 2021-12-22  3010  							NULL,
02489ebe320634 John Ogness 2021-12-22  3011  							true, NULL);
02489ebe320634 John Ogness 2021-12-22  3012  			} else {
02489ebe320634 John Ogness 2021-12-22  3013  				progress =3D console_emit_=
next_record(con,
02489ebe320634 John Ogness 2021-12-22  3014  							&con->atomic_data->text=
[index],
02489ebe320634 John Ogness 2021-12-22  3015  							NULL,
02489ebe320634 John Ogness 2021-12-22  3016  							&con->atomic_data->drop=
ped_text[index],
02489ebe320634 John Ogness 2021-12-22  3017  							true, NULL);
02489ebe320634 John Ogness 2021-12-22  3018  			}
02489ebe320634 John Ogness 2021-12-22  3019  =

02489ebe320634 John Ogness 2021-12-22  3020  			if (!progress)
02489ebe320634 John Ogness 2021-12-22  3021  				continue;
02489ebe320634 John Ogness 2021-12-22  3022  			any_progress =3D true;
02489ebe320634 John Ogness 2021-12-22  3023  =

02489ebe320634 John Ogness 2021-12-22  3024  			touch_softlockup_watchdog_s=
ync();
02489ebe320634 John Ogness 2021-12-22  3025  			clocksource_touch_watchdog(=
);
02489ebe320634 John Ogness 2021-12-22  3026  			rcu_cpu_stall_reset();
02489ebe320634 John Ogness 2021-12-22  3027  			touch_nmi_watchdog();
02489ebe320634 John Ogness 2021-12-22  3028  		}
02489ebe320634 John Ogness 2021-12-22  3029  	} while (any_progress);
02489ebe320634 John Ogness 2021-12-22  3030  =

02489ebe320634 John Ogness 2021-12-22  3031  	printk_cpu_sync_put_irqrestor=
e(flags);
02489ebe320634 John Ogness 2021-12-22  3032  }
02489ebe320634 John Ogness 2021-12-22  3033  #else /* CONFIG_HAVE_ATOMIC_CO=
NSOLE */
02489ebe320634 John Ogness 2021-12-22  3034  #define atomic_console_flush_a=
ll()
02489ebe320634 John Ogness 2021-12-22  3035  #endif
02489ebe320634 John Ogness 2021-12-22  3036  =


:::::: The code at line 3003 was first introduced by commit
:::::: 02489ebe320634155c5ddb3110d7d456fa68d304 printk: add infrastucture f=
or atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4097445864619874984==--

