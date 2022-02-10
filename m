Content-Type: multipart/mixed; boundary="===============4487859680129189129=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mediatek/mtk_eth_soc.c:1404:3: warning: Value stored to 'budget' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 10 Feb 2022 19:13:56 +0800
Message-ID: <202202101959.NMscEM7g-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4487859680129189129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: a3c62a042237d1adeb0290dcb768e17edd6dcd25 net: mtk_eth: add COMPILE_=
TEST support
date:   8 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220208 (https://download.01.org/0day-ci/arc=
hive/20220210/202202101959.NMscEM7g-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da3c62a042237d1adeb0290dcb768e17edd6dcd25
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a3c62a042237d1adeb0290dcb768e17edd6dcd25
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   6 warnings generated.
   drivers/hwspinlock/qcom_hwspinlock.c:158:24: warning: Passed-by-value st=
ruct argument contains uninitialized data (e.g., field: 'id_size') [clang-a=
nalyzer-core.CallAndMessage]
                   bank->lock[i].priv =3D devm_regmap_field_alloc(&pdev->de=
v,
                                        ^
   drivers/hwspinlock/qcom_hwspinlock.c:132:2: note: 'field' initialized he=
re
           struct reg_field field;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:140:21: note: Left side of '&&' is =
false
           if (IS_ERR(regmap) && PTR_ERR(regmap) =3D=3D -ENODEV)
                              ^
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Calling 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Returning from 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:2: note: Taking false branch
           if (IS_ERR(regmap))
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:148:6: note: Assuming 'bank' is non=
-null
           if (!bank)
               ^~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:148:2: note: Taking false branch
           if (!bank)
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:153:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < QCOM_MUTEX_NUM_LOCKS; i++) {
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:158:24: note: Passed-by-value struc=
t argument contains uninitialized data (e.g., field: 'id_size')
                   bank->lock[i].priv =3D devm_regmap_field_alloc(&pdev->de=
v,
                                        ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:344:7: warning: Branch condi=
tion evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (err)
                       ^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:220:20: note: 'err' declared=
 without an initial value
           int val, ge_mode, err;
                             ^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:223:7: note: Assuming the co=
ndition is true
           if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
                ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:808:34: note: expanded from =
macro 'MTK_HAS_CAPS'
   #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) =3D=3D (_x))
                                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:223:52: note: Left side of '=
&&' is false
           if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
                                                             ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:322:6: note: Assuming field =
'interface' is equal to PHY_INTERFACE_MODE_SGMII
           if (state->interface =3D=3D PHY_INTERFACE_MODE_SGMII ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:322:51: note: Left side of '=
||' is true
           if (state->interface =3D=3D PHY_INTERFACE_MODE_SGMII ||
                                                            ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:334:10: note: Assuming the c=
ondition is true
                   sid =3D (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII))=
 ?
                          ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:808:34: note: expanded from =
macro 'MTK_HAS_CAPS'
   #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) =3D=3D (_x))
                                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:334:9: note: '?' condition i=
s true
                   sid =3D (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII))=
 ?
                         ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:338:14: note: Field 'interfa=
ce' is equal to PHY_INTERFACE_MODE_SGMII
                   if (state->interface !=3D PHY_INTERFACE_MODE_SGMII)
                              ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:338:3: note: Taking false br=
anch
                   if (state->interface !=3D PHY_INTERFACE_MODE_SGMII)
                   ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:341:8: note: Taking false br=
anch
                   else if (phylink_autoneg_inband(mode))
                        ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:344:7: note: Branch conditio=
n evaluates to a garbage value
                   if (err)
                       ^~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1404:3: warning: Value store=
d to 'budget' is never read [clang-analyzer-deadcode.DeadStores]
                   budget =3D mtk_poll_tx_qdma(eth, budget, done, bytes);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1404:3: note: Value stored t=
o 'budget' is never read
                   budget =3D mtk_poll_tx_qdma(eth, budget, done, bytes);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1406:3: warning: Value store=
d to 'budget' is never read [clang-analyzer-deadcode.DeadStores]
                   budget =3D mtk_poll_tx_pdma(eth, budget, done, bytes);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1406:3: note: Value stored t=
o 'budget' is never read
                   budget =3D mtk_poll_tx_pdma(eth, budget, done, bytes);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   include/net/dst_metadata.h:74:18: warning: Access to field 'type' result=
s in a dereference of a null pointer (loaded from variable 'a') [clang-anal=
yzer-core.NullDereference]
           if (!a !=3D !b || a->type !=3D b->type)
                           ^
   net/core/gro.c:735:37: note: Calling 'dev_gro_receive'
           ret =3D napi_frags_finish(napi, skb, dev_gro_receive(napi, skb));
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:446:2: note: Taking false branch
           if (netif_elide_gro(skb->dev))
           ^
   net/core/gro.c:449:2: note: Calling 'gro_list_prepare'
           gro_list_prepare(&gro_list->list, skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:323:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(p, head, list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   net/core/gro.c:328:7: note: Assuming the condition is false
                   if (hash !=3D skb_get_hash_raw(p)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:328:3: note: Taking false branch
                   if (hash !=3D skb_get_hash_raw(p)) {
                   ^
   net/core/gro.c:335:7: note: Assuming field 'vlan_present' is 0
                   if (skb_vlan_tag_present(p))
                       ^
   include/linux/if_vlan.h:77:37: note: expanded from macro 'skb_vlan_tag_p=
resent'
   #define skb_vlan_tag_present(__skb)     ((__skb)->vlan_present)
                                           ^~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:335:3: note: Taking false branch
                   if (skb_vlan_tag_present(p))
                   ^
   net/core/gro.c:338:7: note: Assuming 'maclen' is equal to ETH_HLEN
                   if (maclen =3D=3D ETH_HLEN)
                       ^~~~~~~~~~~~~~~~~~
   net/core/gro.c:338:3: note: Taking true branch
                   if (maclen =3D=3D ETH_HLEN)
                   ^
   net/core/gro.c:351:7: note: Assuming 'diffs' is 0
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                       ^~~~~~
   net/core/gro.c:351:7: note: Left side of '&&' is true
   net/core/gro.c:351:17: note: Assuming the condition is true
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                                 ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:351:3: note: Taking true branch
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                   ^
   net/core/gro.c:357:13: note: Assuming 'p->sk' is equal to 'skb->sk'
                           diffs |=3D p->sk !=3D skb->sk;
                                    ^~~~~~~~~~~~~~~~
   net/core/gro.c:358:13: note: Calling 'skb_metadata_dst_cmp'
                           diffs |=3D skb_metadata_dst_cmp(p, skb);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dst_metadata.h:68:6: note: Assuming the condition is false
           if (!(skb_a->_skb_refdst | skb_b->_skb_refdst))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dst_metadata.h:68:2: note: Taking false branch
           if (!(skb_a->_skb_refdst | skb_b->_skb_refdst))
           ^
   include/net/dst_metadata.h:71:2: note: Value assigned to 'a'
           a =3D (const struct metadata_dst *) skb_dst(skb_a);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dst_metadata.h:74:6: note: Assuming 'a' is null
           if (!a !=3D !b || a->type !=3D b->type)
               ^~
   include/net/dst_metadata.h:74:6: note: Assuming pointer value is null

vim +/budget +1404 drivers/net/ethernet/mediatek/mtk_eth_soc.c

296c9120752bab Stefan Roese  2019-08-16  1391  =

296c9120752bab Stefan Roese  2019-08-16  1392  static int mtk_poll_tx(struc=
t mtk_eth *eth, int budget)
296c9120752bab Stefan Roese  2019-08-16  1393  {
296c9120752bab Stefan Roese  2019-08-16  1394  	struct mtk_tx_ring *ring =
=3D &eth->tx_ring;
e9229ffd550b2d Felix Fietkau 2021-04-22  1395  	struct dim_sample dim_sampl=
e =3D {};
296c9120752bab Stefan Roese  2019-08-16  1396  	unsigned int done[MTK_MAX_D=
EVS];
296c9120752bab Stefan Roese  2019-08-16  1397  	unsigned int bytes[MTK_MAX_=
DEVS];
296c9120752bab Stefan Roese  2019-08-16  1398  	int total =3D 0, i;
296c9120752bab Stefan Roese  2019-08-16  1399  =

296c9120752bab Stefan Roese  2019-08-16  1400  	memset(done, 0, sizeof(done=
));
296c9120752bab Stefan Roese  2019-08-16  1401  	memset(bytes, 0, sizeof(byt=
es));
296c9120752bab Stefan Roese  2019-08-16  1402  =

296c9120752bab Stefan Roese  2019-08-16  1403  	if (MTK_HAS_CAPS(eth->soc->=
caps, MTK_QDMA))
296c9120752bab Stefan Roese  2019-08-16 @1404  		budget =3D mtk_poll_tx_qdm=
a(eth, budget, done, bytes);
296c9120752bab Stefan Roese  2019-08-16  1405  	else
296c9120752bab Stefan Roese  2019-08-16  1406  		budget =3D mtk_poll_tx_pdm=
a(eth, budget, done, bytes);
296c9120752bab Stefan Roese  2019-08-16  1407  =

656e705243fd0c John Crispin  2016-03-08  1408  	for (i =3D 0; i < MTK_MAC_C=
OUNT; i++) {
656e705243fd0c John Crispin  2016-03-08  1409  		if (!eth->netdev[i] || !do=
ne[i])
656e705243fd0c John Crispin  2016-03-08  1410  			continue;
656e705243fd0c John Crispin  2016-03-08  1411  		netdev_completed_queue(eth=
->netdev[i], done[i], bytes[i]);
656e705243fd0c John Crispin  2016-03-08  1412  		total +=3D done[i];
e9229ffd550b2d Felix Fietkau 2021-04-22  1413  		eth->tx_packets +=3D done[=
i];
e9229ffd550b2d Felix Fietkau 2021-04-22  1414  		eth->tx_bytes +=3D bytes[i=
];
656e705243fd0c John Crispin  2016-03-08  1415  	}
656e705243fd0c John Crispin  2016-03-08  1416  =

e9229ffd550b2d Felix Fietkau 2021-04-22  1417  	dim_update_sample(eth->tx_e=
vents, eth->tx_packets, eth->tx_bytes,
e9229ffd550b2d Felix Fietkau 2021-04-22  1418  			  &dim_sample);
e9229ffd550b2d Felix Fietkau 2021-04-22  1419  	net_dim(&eth->tx_dim, dim_s=
ample);
e9229ffd550b2d Felix Fietkau 2021-04-22  1420  =

ad3cba989e8b1b John Crispin  2016-06-10  1421  	if (mtk_queue_stopped(eth) =
&&
ad3cba989e8b1b John Crispin  2016-06-10  1422  	    (atomic_read(&ring->fre=
e_count) > ring->thresh))
13c822f6d468ca John Crispin  2016-04-08  1423  		mtk_wake_queue(eth);
656e705243fd0c John Crispin  2016-03-08  1424  =

656e705243fd0c John Crispin  2016-03-08  1425  	return total;
656e705243fd0c John Crispin  2016-03-08  1426  }
656e705243fd0c John Crispin  2016-03-08  1427  =


:::::: The code at line 1404 was first introduced by commit
:::::: 296c9120752bab93151bd7220896dd302683a91c net: ethernet: mediatek: Ad=
d MT7628/88 SoC support

:::::: TO: Stefan Roese <sr@denx.de>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4487859680129189129==--

