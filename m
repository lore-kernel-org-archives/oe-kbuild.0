Content-Type: multipart/mixed; boundary="===============2047249500389208133=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/dsa/tag_sja1105.c:168:3: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Mon, 20 Jun 2022 17:43:13 +0800
Message-ID: <202206201718.TKIKCbRb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2047249500389208133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/dsa/t=
ag_sja1105.c:168:3: warning: Undefined or garbage value returned to caller =
[clang-analyzer-core.uninitialized.UndefReturn]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 8ded9160928e545c2e694b77a87263fa078ff4c6 net: dsa: tag_sja1105: sto=
p asking the sja1105 driver in sja1105_xmit_tpid
date:   10 months ago
:::::: branch date: 3 days ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220620/202206201718.TKIKCbRb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa=
7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8ded9160928e545c2e694b77a87263fa078ff4c6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8ded9160928e545c2e694b77a87263fa078ff4c6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1527:22: note: Left side of '&&' is false
           if (fi->fib_prefsrc && !fib_valid_prefsrc(cfg, fi->fib_prefsrc))=
 {
                               ^
   net/ipv4/fib_semantics.c:1532:11: note: Field 'nh' is non-null
           if (!fi->nh) {
                    ^
   net/ipv4/fib_semantics.c:1532:2: note: Taking false branch
           if (!fi->nh) {
           ^
   net/ipv4/fib_semantics.c:1545:6: note: Assuming 'ofi' is null
           if (ofi) {
               ^~~
   net/ipv4/fib_semantics.c:1545:2: note: Taking false branch
           if (ofi) {
           ^
   net/ipv4/fib_semantics.c:1556:25: note: Calling 'fib_info_hashfn'
                          &fib_info_hash[fib_info_hashfn(fi)]);
                                         ^~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:353:6: note: Assuming field 'nh' is non-null
           if (fi->nh) {
               ^~~~~~
   net/ipv4/fib_semantics.c:353:2: note: Taking true branch
           if (fi->nh) {
           ^
   net/ipv4/fib_semantics.c:361:2: note: Returning without writing to 'fi->=
nh', which participates in a condition later
           return fib_info_hashfn_result(val);
           ^
   net/ipv4/fib_semantics.c:1556:25: note: Returning from 'fib_info_hashfn'
                          &fib_info_hash[fib_info_hashfn(fi)]);
                                         ^~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1557:6: note: Assuming field 'fib_prefsrc' is 0
           if (fi->fib_prefsrc) {
               ^~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1557:2: note: Taking false branch
           if (fi->fib_prefsrc) {
           ^
   net/ipv4/fib_semantics.c:1563:6: note: Assuming field 'nh' is non-null
           if (fi->nh) {
               ^~~~~~
   net/ipv4/fib_semantics.c:1563:2: note: Taking true branch
           if (fi->nh) {
           ^
   net/ipv4/fib_semantics.c:1564:26: note: Passing null pointer value via 2=
nd parameter 'head'
                   list_add(&fi->nh_list, &nh->fi_list);
                                          ^~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1564:3: note: Calling 'list_add'
                   list_add(&fi->nh_list, &nh->fi_list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:86:24: note: Access to field 'next' results in a de=
reference of a null pointer (loaded from variable 'head')
           __list_add(new, head, head->next);
                                 ^~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> net/dsa/tag_sja1105.c:168:3: warning: Undefined or garbage value returne=
d to caller [clang-analyzer-core.uninitialized.UndefReturn]
                   return proto;
                   ^
   net/dsa/tag_sja1105.c:270:6: note: Assuming field 'offload_fwd_mark' is 0
           if (skb->offload_fwd_mark)
               ^~~~~~~~~~~~~~~~~~~~~
   net/dsa/tag_sja1105.c:270:2: note: Taking false branch
           if (skb->offload_fwd_mark)
           ^
   net/dsa/tag_sja1105.c:277:2: note: Taking true branch
           if (likely(!sja1105_is_link_local(skb)))
           ^
   net/dsa/tag_sja1105.c:278:38: note: Calling 'sja1105_xmit_tpid'
                   return dsa_8021q_xmit(skb, netdev, sja1105_xmit_tpid(dp),
                                                      ^~~~~~~~~~~~~~~~~~~~~
   net/dsa/tag_sja1105.c:143:2: note: 'proto' declared without an initial v=
alue
           u16 proto;
           ^~~~~~~~~
   net/dsa/tag_sja1105.c:148:6: note: Assuming the condition is false
           if (!dsa_port_is_vlan_filtering(dp))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/dsa/tag_sja1105.c:148:2: note: Taking false branch
           if (!dsa_port_is_vlan_filtering(dp))
           ^
   net/dsa/tag_sja1105.c:155:2: note: Left side of '&&' is false
           list_for_each_entry(other_dp, &ds->dst->ports, list) {
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
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/dsa/tag_sja1105.c:155:2: note: Taking false branch
           list_for_each_entry(other_dp, &ds->dst->ports, list) {
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
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/dsa/tag_sja1105.c:155:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry(other_dp, &ds->dst->ports, list) {
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
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/dsa/tag_sja1105.c:155:2: note: Loop condition is true.  Entering loo=
p body
           list_for_each_entry(other_dp, &ds->dst->ports, list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   net/dsa/tag_sja1105.c:156:7: note: Assuming 'ds' is equal to field 'ds'
                   if (other_dp->ds !=3D ds)
                       ^~~~~~~~~~~~~~~~~~
   net/dsa/tag_sja1105.c:156:3: note: Taking false branch
                   if (other_dp->ds !=3D ds)
                   ^
   net/dsa/tag_sja1105.c:159:7: note: Assuming field 'bridge_dev' is non-nu=
ll
                   if (!other_dp->bridge_dev)
                       ^~~~~~~~~~~~~~~~~~~~~
   net/dsa/tag_sja1105.c:159:3: note: Taking false branch
                   if (!other_dp->bridge_dev)
                   ^

vim +168 net/dsa/tag_sja1105.c

a68578c20a9667 Vladimir Oltean 2020-01-04  135  =

8ded9160928e54 Vladimir Oltean 2021-08-24  136  /* Send VLAN tags with a TP=
ID that blends in with whatever VLAN protocol a
8ded9160928e54 Vladimir Oltean 2021-08-24  137   * bridge spanning ports of=
 this switch might have.
8ded9160928e54 Vladimir Oltean 2021-08-24  138   */
994d2cbb08ca05 Vladimir Oltean 2021-08-17  139  static u16 sja1105_xmit_tpi=
d(struct dsa_port *dp)
38b5beeae7a4cd Vladimir Oltean 2020-05-12  140  {
8ded9160928e54 Vladimir Oltean 2021-08-24  141  	struct dsa_switch *ds =3D =
dp->ds;
8ded9160928e54 Vladimir Oltean 2021-08-24  142  	struct dsa_port *other_dp;
8ded9160928e54 Vladimir Oltean 2021-08-24  143  	u16 proto;
8ded9160928e54 Vladimir Oltean 2021-08-24  144  =

8ded9160928e54 Vladimir Oltean 2021-08-24  145  	/* Since VLAN awareness is=
 global, then if this port is VLAN-unaware,
8ded9160928e54 Vladimir Oltean 2021-08-24  146  	 * all ports are. Use the =
VLAN-unaware TPID used for tag_8021q.
8ded9160928e54 Vladimir Oltean 2021-08-24  147  	 */
8ded9160928e54 Vladimir Oltean 2021-08-24  148  	if (!dsa_port_is_vlan_filt=
ering(dp))
8ded9160928e54 Vladimir Oltean 2021-08-24  149  		return ETH_P_SJA1105;
8ded9160928e54 Vladimir Oltean 2021-08-24  150  =

8ded9160928e54 Vladimir Oltean 2021-08-24  151  	/* Port is VLAN-aware, so =
there is a bridge somewhere (a single one,
8ded9160928e54 Vladimir Oltean 2021-08-24  152  	 * we're sure about that).=
 It may not be on this port though, so we
8ded9160928e54 Vladimir Oltean 2021-08-24  153  	 * need to find it.
8ded9160928e54 Vladimir Oltean 2021-08-24  154  	 */
8ded9160928e54 Vladimir Oltean 2021-08-24  155  	list_for_each_entry(other_=
dp, &ds->dst->ports, list) {
8ded9160928e54 Vladimir Oltean 2021-08-24  156  		if (other_dp->ds !=3D ds)
8ded9160928e54 Vladimir Oltean 2021-08-24  157  			continue;
8ded9160928e54 Vladimir Oltean 2021-08-24  158  =

8ded9160928e54 Vladimir Oltean 2021-08-24  159  		if (!other_dp->bridge_dev)
8ded9160928e54 Vladimir Oltean 2021-08-24  160  			continue;
8ded9160928e54 Vladimir Oltean 2021-08-24  161  =

8ded9160928e54 Vladimir Oltean 2021-08-24  162  		/* Error is returned only=
 if CONFIG_BRIDGE_VLAN_FILTERING,
8ded9160928e54 Vladimir Oltean 2021-08-24  163  		 * which seems pointless =
to handle, as our port cannot become
8ded9160928e54 Vladimir Oltean 2021-08-24  164  		 * VLAN-aware in that cas=
e.
8ded9160928e54 Vladimir Oltean 2021-08-24  165  		 */
8ded9160928e54 Vladimir Oltean 2021-08-24  166  		br_vlan_get_proto(other_d=
p->bridge_dev, &proto);
8ded9160928e54 Vladimir Oltean 2021-08-24  167  =

8ded9160928e54 Vladimir Oltean 2021-08-24 @168  		return proto;
8ded9160928e54 Vladimir Oltean 2021-08-24  169  	}
994d2cbb08ca05 Vladimir Oltean 2021-08-17  170  =

8ded9160928e54 Vladimir Oltean 2021-08-24  171  	WARN_ONCE(1, "Port is VLAN=
-aware but cannot find associated bridge!\n");
994d2cbb08ca05 Vladimir Oltean 2021-08-17  172  =

8ded9160928e54 Vladimir Oltean 2021-08-24  173  	return ETH_P_SJA1105;
38b5beeae7a4cd Vladimir Oltean 2020-05-12  174  }
38b5beeae7a4cd Vladimir Oltean 2020-05-12  175  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2047249500389208133==--

