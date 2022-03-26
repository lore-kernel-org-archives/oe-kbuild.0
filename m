Content-Type: multipart/mixed; boundary="===============4895757451132562681=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/skbuff.h:3288:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sat, 26 Mar 2022 13:17:10 +0800
Message-ID: <202203261308.0SryIE7o-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4895757451132562681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dimitris Michailidis <d.michailidis@fungible.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52d543b5497cf31d6baeb0bcfe5a5474c3238578
commit: b23f9239195a1af116d6b388cd00c9002f80f80f net/fungible: fix errors w=
hen CONFIG_TLS_DEVICE=3Dn
date:   2 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220321 (https://download.01.org/0day-ci/arc=
hive/20220326/202203261308.0SryIE7o-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db23f9239195a1af116d6b388cd00c9002f80f80f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b23f9239195a1af116d6b388cd00c9002f80f80f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:349:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:337:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:321:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:548:5: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
                                   (c) || rcu_read_lock_bh_held(), __rcu)
                                   ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Assuming =
the condition is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:392:19: note: expanded from macro '__rcu_derefe=
rence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/rcupdate.h:319:8: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                        ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '&&' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Loop cond=
ition is false.  Exiting loop
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:317:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:483:6: note: Assuming '=
xdpqs' is null
           if (xdpqs)
               ^~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:483:2: note: Taking fal=
se branch
           if (xdpqs)
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:486:9: note: Assuming '=
budget' is 0
           while (budget && !cqe_phase_mismatch(q->next_cqe_info, q->phase)=
) {
                  ^~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:486:16: note: Left side=
 of '&&' is false
           while (budget && !cqe_phase_mismatch(q->next_cqe_info, q->phase)=
) {
                         ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:494:6: note: Assuming f=
ield 'xdp_flush' is not equal to 0
           if (unlikely(q->xdp_flush)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:494:2: note: Taking tru=
e branch
           if (unlikely(q->xdp_flush)) {
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:495:7: note: Assuming t=
he condition is true
                   if (q->xdp_flush & FUN_XDP_FLUSH_TX)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:495:3: note: Taking tru=
e branch
                   if (q->xdp_flush & FUN_XDP_FLUSH_TX)
                   ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:496:18: note: Passing n=
ull pointer value via 1st parameter 'q'
                           fun_txq_wr_db(xdp_q);
                                         ^~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:496:4: note: Calling 'f=
un_txq_wr_db'
                           fun_txq_wr_db(xdp_q);
                           ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_txrx.h:235:22: note: Access =
to field 'prod_cnt' results in a dereference of a null pointer (loaded from=
 variable 'q')
           unsigned int tail =3D q->prod_cnt & q->mask;
                               ^
>> include/linux/skbuff.h:3288:2: warning: Undefined or garbage value retur=
ned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return frag->bv_page;
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:512:27: note: Calling '=
fun_process_cqes'
           int work_done =3D budget - fun_process_cqes(q, budget);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is true
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Taking fa=
lse branch
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:349:2: note: expanded from macro 'compile=
time_assert'
--
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/input/keyboard/lm8323.c:333:3: warning: Value stored to 'active'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
   drivers/input/keyboard/lm8323.c:333:3: note: Value stored to 'active' is=
 never read
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
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
   11 warnings generated.
   drivers/video/backlight/ams369fg06.c:215:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ams369fg06_spi_write(lcd, 0x40 + i, gamma[i]);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/ams369fg06.c:215:3: note: Value stored to 'ret' =
is never read
                   ret =3D ams369fg06_spi_write(lcd, 0x40 + i, gamma[i]);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/ams369fg06.c:216:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ams369fg06_spi_write(lcd, 0x50 + i, gamma[i+7*1]=
);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/ams369fg06.c:216:3: note: Value stored to 'ret' =
is never read
                   ret =3D ams369fg06_spi_write(lcd, 0x50 + i, gamma[i+7*1]=
);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/video/backlight/adp8860_bl.c:230:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/adp8860_bl.c:230:2: note: Value stored to 'ret' =
is never read
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/net/ethernet/fungible/funeth/funeth_ethtool.c:973:28: warning: V=
alue stored to 'fp' during its initialization is never read [clang-analyzer=
-deadcode.DeadStores]
           const struct funeth_priv *fp =3D netdev_priv(netdev);
                                     ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_ethtool.c:973:28: note: Valu=
e stored to 'fp' during its initialization is never read
           const struct funeth_priv *fp =3D netdev_priv(netdev);
                                     ^~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
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
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:349:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:337:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:321:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:548:5: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
                                   (c) || rcu_read_lock_bh_held(), __rcu)
                                   ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Assuming =
the condition is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:392:19: note: expanded from macro '__rcu_derefe=
rence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/rcupdate.h:319:8: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                        ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '&&' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Loop cond=
ition is false.  Exiting loop
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:317:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:483:6: note: Assuming '=
xdpqs' is null
           if (xdpqs)
               ^~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:483:2: note: Taking fal=
se branch
           if (xdpqs)
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:486:9: note: Assuming '=
budget' is 0
           while (budget && !cqe_phase_mismatch(q->next_cqe_info, q->phase)=
) {
                  ^~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:486:16: note: Left side=
 of '&&' is false
           while (budget && !cqe_phase_mismatch(q->next_cqe_info, q->phase)=
) {
                         ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:494:6: note: Assuming f=
ield 'xdp_flush' is not equal to 0
           if (unlikely(q->xdp_flush)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:494:2: note: Taking tru=
e branch
           if (unlikely(q->xdp_flush)) {
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:495:7: note: Assuming t=
he condition is true
                   if (q->xdp_flush & FUN_XDP_FLUSH_TX)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:495:3: note: Taking tru=
e branch
                   if (q->xdp_flush & FUN_XDP_FLUSH_TX)
                   ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:496:18: note: Passing n=
ull pointer value via 1st parameter 'q'
                           fun_txq_wr_db(xdp_q);
                                         ^~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:496:4: note: Calling 'f=
un_txq_wr_db'
                           fun_txq_wr_db(xdp_q);
                           ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_txrx.h:235:22: note: Access =
to field 'prod_cnt' results in a dereference of a null pointer (loaded from=
 variable 'q')
           unsigned int tail =3D q->prod_cnt & q->mask;
                               ^
>> include/linux/skbuff.h:3288:2: warning: Undefined or garbage value retur=
ned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return frag->bv_page;
           ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:512:27: note: Calling '=
fun_process_cqes'
           int work_done =3D budget - fun_process_cqes(q, budget);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is false
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Left side=
 of '||' is true
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   drivers/net/ethernet/fungible/funeth/funeth_rx.c:482:10: note: Taking fa=
lse branch
           xdpqs =3D rcu_dereference_bh(fp->xdpqs);
                   ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:349:2: note: expanded from macro 'compile=
time_assert'

vim +3288 include/linux/skbuff.h

7240b60c98d630 Jonathan Lemon          2019-07-30  3279  =

131ea6675c761f Ian Campbell            2011-08-19  3280  /**
e227867f123026 Masanari Iida           2014-02-18  3281   * skb_frag_page -=
 retrieve the page referred to by a paged fragment
131ea6675c761f Ian Campbell            2011-08-19  3282   * @frag: the page=
d fragment
131ea6675c761f Ian Campbell            2011-08-19  3283   *
131ea6675c761f Ian Campbell            2011-08-19  3284   * Returns the &st=
ruct page associated with @frag.
131ea6675c761f Ian Campbell            2011-08-19  3285   */
131ea6675c761f Ian Campbell            2011-08-19  3286  static inline stru=
ct page *skb_frag_page(const skb_frag_t *frag)
131ea6675c761f Ian Campbell            2011-08-19  3287  {
1dfa5bd38545c6 Matthew Wilcox (Oracle  2019-07-22 @3288) 	return frag->bv_p=
age;
131ea6675c761f Ian Campbell            2011-08-19  3289  }
131ea6675c761f Ian Campbell            2011-08-19  3290  =


:::::: The code at line 3288 was first introduced by commit
:::::: 1dfa5bd38545c6f6a8b6c496e58db93f80da1076 net: Rename skb_frag page t=
o bv_page

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4895757451132562681==--

