Content-Type: multipart/mixed; boundary="===============6803938297237606225=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ipa/ipa_qmi.c:128:14: warning: Value stored to 'ipa' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 27 Jan 2022 09:11:13 +0800
Message-ID: <202201270925.F8g9FeNj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6803938297237606225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Elder <elder@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 99e75a37bd0af8eb8a0560f48091672b1b6d9218 net: ipa: relax 64-bit bui=
ld requirement
date:   10 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220125 (https://download.01.org/0day-ci/archi=
ve/20220127/202201270925.F8g9FeNj-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D99e75a37bd0af8eb8a0560f48091672b1b6d9218
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 99e75a37bd0af8eb8a0560f48091672b1b6d9218
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mtd/chips/cfi_util.c:317:2: note: Loop condition is false.  Exit=
ing loop
           local_irq_disable();
           ^
   include/linux/irqflags.h:205:2: note: expanded from macro 'local_irq_dis=
able'
           do {                                            \
           ^
   drivers/mtd/chips/cfi_util.c:321:2: note: Calling 'cfi_qry_mode_on'
           cfi_qry_mode_on(base, map, cfi);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_util.c:251:2: note: Calling 'cfi_send_gen_cmd'
           cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL=
);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_util.c:209:8: note: Calling 'cfi_build_cmd'
           val =3D cfi_build_cmd(cmd, map, cfi);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_util.c:78:6: note: Assuming the condition is false
           if (map_bankwidth_is_large(map)) {
               ^
   include/linux/mtd/map.h:115:39: note: expanded from macro 'map_bankwidth=
_is_large'
   # define map_bankwidth_is_large(map) (map_bankwidth(map) > BITS_PER_LONG=
/8)
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/mtd/map.h:113:29: note: expanded from macro 'map_bankwidth'
   # define map_bankwidth(map) ((map)->bankwidth)
                               ^
   drivers/mtd/chips/cfi_util.c:78:2: note: Taking false branch
           if (map_bankwidth_is_large(map)) {
           ^
   drivers/mtd/chips/cfi_util.c:91:2: note: Control jumps to 'case 4:'  at =
line 99
           switch (chip_mode) {
           ^
   drivers/mtd/chips/cfi_util.c:100:12: note: '?' condition is true
                   onecmd =3D cpu_to_cfi32(map, cmd);
                            ^
   include/linux/mtd/cfi_endian.h:30:30: note: expanded from macro 'cpu_to_=
cfi32'
   #define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
                                ^
   include/linux/mtd/cfi_endian.h:36:31: note: expanded from macro '_cpu_to=
_cfi'
   #define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
                                 ^
   include/linux/mtd/cfi_endian.h:25:22: note: expanded from macro 'cfi_hos=
t'
   #define cfi_host(s) (cfi_default(s) =3D=3D CFI_HOST_ENDIAN)
                        ^
   include/linux/mtd/cfi_endian.h:22:25: note: expanded from macro 'cfi_def=
ault'
   #define cfi_default(s) ((s)?:CFI_DEFAULT_ENDIAN)
                           ^
   drivers/mtd/chips/cfi_util.c:100:12: note: Assuming the condition is true
                   onecmd =3D cpu_to_cfi32(map, cmd);
                            ^
   include/linux/mtd/cfi_endian.h:30:30: note: expanded from macro 'cpu_to_=
cfi32'
   #define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/cfi_endian.h:36:31: note: expanded from macro '_cpu_to=
_cfi'
   #define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
                                 ^~~~~~~~~~~
   include/linux/mtd/cfi_endian.h:25:22: note: expanded from macro 'cfi_hos=
t'
   #define cfi_host(s) (cfi_default(s) =3D=3D CFI_HOST_ENDIAN)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/cfi_endian.h:22:24: note: expanded from macro 'cfi_def=
ault'
   #define cfi_default(s) ((s)?:CFI_DEFAULT_ENDIAN)
                          ^
   drivers/mtd/chips/cfi_util.c:100:12: note: '?' condition is true
                   onecmd =3D cpu_to_cfi32(map, cmd);
                            ^
   include/linux/mtd/cfi_endian.h:30:30: note: expanded from macro 'cpu_to_=
cfi32'
   #define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
                                ^
   include/linux/mtd/cfi_endian.h:36:31: note: expanded from macro '_cpu_to=
_cfi'
   #define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
                                 ^
   include/linux/mtd/cfi_endian.h:25:21: note: expanded from macro 'cfi_hos=
t'
   #define cfi_host(s) (cfi_default(s) =3D=3D CFI_HOST_ENDIAN)
                       ^
   drivers/mtd/chips/cfi_util.c:101:3: note:  Execution continues on line 1=
06
                   break;
                   ^
   drivers/mtd/chips/cfi_util.c:106:2: note: Control jumps to 'case 2:'  at=
 line 116
           switch (chips_per_word) {
           ^
   drivers/mtd/chips/cfi_util.c:117:21: note: The result of the left shift =
is undefined due to shifting by '32', which is greater or equal to the widt=
h of type 'unsigned long'
                   onecmd |=3D (onecmd << (chip_mode * 8));
                                     ^  ~~~~~~~~~~~~~~~
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
   9 warnings generated.
>> drivers/net/ipa/ipa_qmi.c:128:14: warning: Value stored to 'ipa' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ipa *ipa =3D container_of(ipa_qmi, struct ipa, qmi);
                       ^~~
   drivers/net/ipa/ipa_qmi.c:128:14: note: Value stored to 'ipa' during its=
 initialization is never read
           struct ipa *ipa =3D container_of(ipa_qmi, struct ipa, qmi);
                       ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   include/asm-generic/bitops/non-atomic.h:106:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/net/net_failover.c:644:16: note: Assuming the condition is false
           primary_dev =3D rtnl_dereference(nfo_info->primary_dev);
                         ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:562:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:381:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/rcupdate.h:318:7: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if (debug_lockdep_rcu_enabled() && !__warned && (c)) {  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/net_failover.c:644:16: note: Left side of '&&' is false
           primary_dev =3D rtnl_dereference(nfo_info->primary_dev);
                         ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:562:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:381:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:35: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if (debug_lockdep_rcu_enabled() && !__warned && (c)) {  \
                                                   ^
   drivers/net/net_failover.c:644:16: note: Loop condition is false.  Exiti=
ng loop
           primary_dev =3D rtnl_dereference(nfo_info->primary_dev);
                         ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:562:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:381:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   drivers/net/net_failover.c:645:16: note: Assuming the condition is false
           standby_dev =3D rtnl_dereference(nfo_info->standby_dev);
                         ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:562:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:381:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/rcupdate.h:318:7: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if (debug_lockdep_rcu_enabled() && !__warned && (c)) {  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/net_failover.c:645:16: note: Left side of '&&' is false
           standby_dev =3D rtnl_dereference(nfo_info->standby_dev);
                         ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:562:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:381:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:35: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if (debug_lockdep_rcu_enabled() && !__warned && (c)) {  \
                                                   ^
   drivers/net/net_failover.c:645:16: note: Loop condition is false.  Exiti=
ng loop
           standby_dev =3D rtnl_dereference(nfo_info->standby_dev);
                         ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())

vim +/ipa +128 drivers/net/ipa/ipa_qmi.c

530f9216a9537b Alex Elder 2020-03-05  116  =

530f9216a9537b Alex Elder 2020-03-05  117  /* Determine whether everything =
is ready to start normal operation.
530f9216a9537b Alex Elder 2020-03-05  118   * We know everything (else) is =
ready when we know the IPA driver on
530f9216a9537b Alex Elder 2020-03-05  119   * the modem is ready, and the m=
icrocontroller is ready.
530f9216a9537b Alex Elder 2020-03-05  120   *
530f9216a9537b Alex Elder 2020-03-05  121   * When the modem boots (or rebo=
ots), the handshake sequence starts
530f9216a9537b Alex Elder 2020-03-05  122   * with the AP sending the modem=
 an INIT_DRIVER request.  Within
530f9216a9537b Alex Elder 2020-03-05  123   * that request, the uc_loaded f=
lag will be zero (false) for an
530f9216a9537b Alex Elder 2020-03-05  124   * initial boot, non-zero (true)=
 for a subsequent (SSR) boot.
530f9216a9537b Alex Elder 2020-03-05  125   */
530f9216a9537b Alex Elder 2020-03-05  126  static void ipa_qmi_ready(struct=
 ipa_qmi *ipa_qmi)
530f9216a9537b Alex Elder 2020-03-05  127  {
530f9216a9537b Alex Elder 2020-03-05 @128  	struct ipa *ipa =3D container_o=
f(ipa_qmi, struct ipa, qmi);
530f9216a9537b Alex Elder 2020-03-05  129  	int ret;
530f9216a9537b Alex Elder 2020-03-05  130  =

530f9216a9537b Alex Elder 2020-03-05  131  	/* We aren't ready until the mo=
dem and microcontroller are */
530f9216a9537b Alex Elder 2020-03-05  132  	if (!ipa_qmi->modem_ready || !i=
pa_qmi->uc_ready)
530f9216a9537b Alex Elder 2020-03-05  133  		return;
530f9216a9537b Alex Elder 2020-03-05  134  =

530f9216a9537b Alex Elder 2020-03-05  135  	/* Send the indication message =
if it was requested */
530f9216a9537b Alex Elder 2020-03-05  136  	ipa_qmi_indication(ipa_qmi);
530f9216a9537b Alex Elder 2020-03-05  137  =

530f9216a9537b Alex Elder 2020-03-05  138  	/* The initial boot requires us=
 to send the indication. */
530f9216a9537b Alex Elder 2020-03-05  139  	if (ipa_qmi->initial_boot) {
530f9216a9537b Alex Elder 2020-03-05  140  		if (!ipa_qmi->indication_sent)
530f9216a9537b Alex Elder 2020-03-05  141  			return;
530f9216a9537b Alex Elder 2020-03-05  142  =

530f9216a9537b Alex Elder 2020-03-05  143  		/* The initial modem boot comp=
leted successfully */
530f9216a9537b Alex Elder 2020-03-05  144  		ipa_qmi->initial_boot =3D fals=
e;
530f9216a9537b Alex Elder 2020-03-05  145  	}
530f9216a9537b Alex Elder 2020-03-05  146  =

530f9216a9537b Alex Elder 2020-03-05  147  	/* We're ready.  Start up norma=
l operation */
530f9216a9537b Alex Elder 2020-03-05  148  	ipa =3D container_of(ipa_qmi, s=
truct ipa, qmi);
530f9216a9537b Alex Elder 2020-03-05  149  	ret =3D ipa_modem_start(ipa);
530f9216a9537b Alex Elder 2020-03-05  150  	if (ret)
530f9216a9537b Alex Elder 2020-03-05  151  		dev_err(&ipa->pdev->dev, "erro=
r %d starting modem\n", ret);
530f9216a9537b Alex Elder 2020-03-05  152  }
530f9216a9537b Alex Elder 2020-03-05  153  =


:::::: The code at line 128 was first introduced by commit
:::::: 530f9216a9537b58cdc2f967b5cd78f5dafb34c4 soc: qcom: ipa: AP/modem co=
mmunications

:::::: TO: Alex Elder <elder@linaro.org>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6803938297237606225==--

