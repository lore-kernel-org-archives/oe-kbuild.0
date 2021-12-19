Content-Type: multipart/mixed; boundary="===============5262663989666890258=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v4 6/7] bpf: Add "live packet" mode for XDP in bpf_prog_run()
Date: Sun, 19 Dec 2021 13:45:15 +0800
Message-ID: <202112191337.xxF9Xt5w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5262663989666890258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211217002741.146797-7-toke@redhat.com>
References: <20211217002741.146797-7-toke@redhat.com>
TO: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>
TO: Alexei Starovoitov <ast@kernel.org>
TO: Daniel Borkmann <daniel@iogearbox.net>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: Martin KaFai Lau <kafai@fb.com>
TO: Song Liu <songliubraving@fb.com>
TO: Yonghong Song <yhs@fb.com>
TO: John Fastabend <john.fastabend@gmail.com>
TO: KP Singh <kpsingh@kernel.org>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org

Hi "Toke,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Toke-H-iland-J-rgensen/Add=
-support-for-transmitting-packets-using-XDP-in-bpf_prog_run/20211217-082908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20211216 (https://download.01.org/0day-ci/archi=
ve/20211219/202112191337.xxF9Xt5w-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3=
d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/a3e21683741cab77adaeece94=
c327006e875938b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Toke-H-iland-J-rgensen/Add-support=
-for-transmitting-packets-using-XDP-in-bpf_prog_run/20211217-082908
        git checkout a3e21683741cab77adaeece94c327006e875938b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:391:19: note: expanded from macro '__rcu_derefe=
rence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/rcupdate.h:319:8: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                        ^
   net/xfrm/xfrm_policy.c:2164:8: note: Left side of '&&' is false
           pol =3D rcu_dereference(sk->sk_policy[dir]);
                 ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:391:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   net/xfrm/xfrm_policy.c:2164:8: note: Loop condition is false.  Exiting l=
oop
           pol =3D rcu_dereference(sk->sk_policy[dir]);
                 ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:391:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:317:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   net/xfrm/xfrm_policy.c:2165:6: note: 'pol' is not equal to NULL
           if (pol !=3D NULL) {
               ^~~
   net/xfrm/xfrm_policy.c:2165:2: note: Taking true branch
           if (pol !=3D NULL) {
           ^
   net/xfrm/xfrm_policy.c:2169:7: note: Assuming 'family' is equal to field=
 'family'
                   if (pol->family !=3D family) {
                       ^~~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_policy.c:2169:3: note: Taking false branch
                   if (pol->family !=3D family) {
                   ^
   net/xfrm/xfrm_policy.c:2174:11: note: Calling 'xfrm_selector_match'
                   match =3D xfrm_selector_match(&pol->selector, fl, family=
);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_policy.c:224:2: note: Control jumps to 'case 10:'  at line=
 227
           switch (family) {
           ^
   net/xfrm/xfrm_policy.c:228:10: note: Calling '__xfrm6_selector_match'
                   return __xfrm6_selector_match(sel, fl);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_policy.c:213:10: note: Assuming the condition is true
           return  addr_match(&fl6->daddr, &sel->daddr, sel->prefixlen_d) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_policy.c:213:10: note: Left side of '&&' is true
   net/xfrm/xfrm_policy.c:214:3: note: Assuming the condition is true
                   addr_match(&fl6->saddr, &sel->saddr, sel->prefixlen_s) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_policy.c:213:10: note: Left side of '&&' is true
           return  addr_match(&fl6->daddr, &sel->daddr, sel->prefixlen_d) &&
                   ^
   net/xfrm/xfrm_policy.c:215:3: note: Assuming the condition is true
                   !((xfrm_flowi_dport(fl, &fl6->uli) ^ sel->dport) & sel->=
dport_mask) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   net/xfrm/xfrm_policy.c:213:10: note: Left side of '&&' is true
           return  addr_match(&fl6->daddr, &sel->daddr, sel->prefixlen_d) &&
                   ^
   net/xfrm/xfrm_policy.c:216:3: note: Assuming the condition is true
                   !((xfrm_flowi_sport(fl, &fl6->uli) ^ sel->sport) & sel->=
sport_mask) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   net/xfrm/xfrm_policy.c:213:10: note: Left side of '&&' is true
           return  addr_match(&fl6->daddr, &sel->daddr, sel->prefixlen_d) &&
                   ^
   net/xfrm/xfrm_policy.c:217:22: note: The left operand of '=3D=3D' is a g=
arbage value
                   (fl6->flowi6_proto =3D=3D sel->proto || !sel->proto) &&
                    ~~~~~~~~~~~~~~~~~ ^
   net/xfrm/xfrm_policy.c:3395:4: warning: Value stored to 'exthdr' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           exthdr =3D (struct ipv6_opt_hdr *)(nh + offset);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_policy.c:3395:4: note: Value stored to 'exthdr' is never r=
ead
                           exthdr =3D (struct ipv6_opt_hdr *)(nh + offset);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
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
   22 warnings generated.
>> net/bpf/test_run.c:103:8: warning: Excessive padding in 'struct xdp_test=
_data' (48 padding bytes, where 16 is optimal). =

   Optimal fields order: =

   rxq, =

   orig_ctx, =

   dev, =

   pp, =

   frame_cnt, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct xdp_test_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   net/bpf/test_run.c:103:8: note: Excessive padding in 'struct xdp_test_da=
ta' (48 padding bytes, where 16 is optimal). Optimal fields order: rxq, ori=
g_ctx, dev, pp, frame_cnt, consider reordering the fields or adding explici=
t padding members
   struct xdp_test_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   net/ethtool/ioctl.c:2125:4: warning: Called function pointer is null (nu=
ll dereference) [clang-analyzer-core.CallAndMessage]
                           ops->get_ethtool_phy_stats(dev, &stats, data);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2095:6: note: Assuming 'phydev' is non-null
           if (!phydev && (!ops->get_ethtool_phy_stats || !ops->get_sset_co=
unt))
               ^~~~~~~
   net/ethtool/ioctl.c:2095:14: note: Left side of '&&' is false
           if (!phydev && (!ops->get_ethtool_phy_stats || !ops->get_sset_co=
unt))
                       ^
   net/ethtool/ioctl.c:2098:11: note: Field 'phydev' is non-null
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
                    ^
   net/ethtool/ioctl.c:2098:6: note: Left side of '&&' is true
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
               ^
   net/ethtool/ioctl.c:2098:21: note: Assuming field 'get_ethtool_phy_stats=
' is null
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2098:6: note: Left side of '&&' is true
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
               ^
   net/ethtool/ioctl.c:2099:6: note: Assuming 'phy_ops' is null
               phy_ops && phy_ops->get_sset_count)
               ^~~~~~~
   net/ethtool/ioctl.c:2099:14: note: Left side of '&&' is false
               phy_ops && phy_ops->get_sset_count)
                       ^
   net/ethtool/ioctl.c:2103:6: note: Assuming 'n_stats' is >=3D 0
           if (n_stats < 0)
               ^~~~~~~~~~~
   net/ethtool/ioctl.c:2103:2: note: Taking false branch
           if (n_stats < 0)
           ^
   net/ethtool/ioctl.c:2105:6: note: Assuming the condition is false
           if (n_stats > S32_MAX / sizeof(u64))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2105:2: note: Taking false branch
           if (n_stats > S32_MAX / sizeof(u64))
           ^
   net/ethtool/ioctl.c:2107:15: note: Assuming 'n_stats' is not equal to 0
           WARN_ON_ONCE(!n_stats);
                        ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/ethtool/ioctl.c:2109:6: note: Calling 'copy_from_user'
           if (copy_from_user(&stats, useraddr, sizeof(stats)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:6: note: Assuming the condition is false
           if (likely(check_copy_size(to, n, false)))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later

vim +103 net/bpf/test_run.c

a3e21683741cab Toke H=C3=B8iland-J=C3=B8rgensen 2021-12-17  102  =

a3e21683741cab Toke H=C3=B8iland-J=C3=B8rgensen 2021-12-17 @103  struct xdp=
_test_data {
a3e21683741cab Toke H=C3=B8iland-J=C3=B8rgensen 2021-12-17  104  	struct xd=
p_buff *orig_ctx;
a3e21683741cab Toke H=C3=B8iland-J=C3=B8rgensen 2021-12-17  105  	struct xd=
p_rxq_info rxq;
a3e21683741cab Toke H=C3=B8iland-J=C3=B8rgensen 2021-12-17  106  	struct ne=
t_device *dev;
a3e21683741cab Toke H=C3=B8iland-J=C3=B8rgensen 2021-12-17  107  	struct pa=
ge_pool *pp;
a3e21683741cab Toke H=C3=B8iland-J=C3=B8rgensen 2021-12-17  108  	u32 frame=
_cnt;
a3e21683741cab Toke H=C3=B8iland-J=C3=B8rgensen 2021-12-17  109  };
a3e21683741cab Toke H=C3=B8iland-J=C3=B8rgensen 2021-12-17  110  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5262663989666890258==--

