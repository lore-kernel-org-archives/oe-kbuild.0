Content-Type: multipart/mixed; boundary="===============0890209229580839174=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mediatek/mtk_eth_soc.c:1404:3: warning: Value stored to 'budget' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 25 Jul 2022 23:03:35 +0800
Message-ID: <202207252207.1Xeei9vo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0890209229580839174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:1404:3: warning: Value stored =
to 'budget' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: a3c62a042237d1adeb0290dcb768e17edd6dcd25 net: mtk_eth: add COMPILE_=
TEST support
date:   7 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220721 (https://download.01.org/0day-ci/archi=
ve/20220725/202207252207.1Xeei9vo-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d=
68c137551cce816416190a18d45b4d4e2a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da3c62a042237d1adeb0290dcb768e17edd6dcd25
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a3c62a042237d1adeb0290dcb768e17edd6dcd25
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   fs/ceph/mds_client.c:4208:14: note: Calling 'ceph_mdsmap_get_state'
                   newstate =3D ceph_mdsmap_get_state(newmap, i);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/mdsmap.h:53:2: note: Taking false branch
           BUG_ON(w < 0);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/ceph/mdsmap.h:53:2: note: Loop condition is false.  Exitin=
g loop
           BUG_ON(w < 0);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   include/linux/ceph/mdsmap.h:54:6: note: 'w' is < field 'possible_max_ran=
k'
           if (w >=3D m->possible_max_rank)
               ^
   include/linux/ceph/mdsmap.h:54:2: note: Taking false branch
           if (w >=3D m->possible_max_rank)
           ^
   include/linux/ceph/mdsmap.h:56:9: note: Dereference of null pointer
           return m->m_info[w].state;
                  ^~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c:1296:4: warning: Value st=
ored to 'offs' is never read [clang-analyzer-deadcode.DeadStores]
                           offs +=3D mvpp2_cls_hek_field_size(MVPP22_CLS_HE=
K_OPT_L4DIP);
                           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c:1296:4: note: Value store=
d to 'offs' is never read
                           offs +=3D mvpp2_cls_hek_field_size(MVPP22_CLS_HE=
K_OPT_L4DIP);
                           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/net/ethernet/marvell/pxa168_eth.c:677:2: warning: Value stored t=
o 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val &=3D ~SDMA_CMD_ERD;   /* abort dma command */
           ^      ~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/pxa168_eth.c:677:2: note: Value stored to '=
val' is never read
           val &=3D ~SDMA_CMD_ERD;   /* abort dma command */
           ^      ~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/namespace.c:2242:13: warning: Access to field 'd_inode' results in a =
dereference of a null pointer (loaded from variable 'dentry') [clang-analyz=
er-core.NullDereference]
           inode_lock(dentry->d_inode);
                      ^
   fs/namespace.c:3816:1: note: Calling '__do_sys_pivot_root'
   SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:249:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/namespace.c:3824:2: note: Taking false branch
           if (!may_mount())
           ^
   fs/namespace.c:3829:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3829:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3834:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3834:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3838:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3838:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3842:11: note: Calling 'lock_mount'
           old_mp =3D lock_mount(&old);
                    ^~~~~~~~~~~~~~~~
   fs/namespace.c:2243:6: note: Assuming the condition is true
           if (unlikely(cant_mount(dentry))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/namespace.c:2243:2: note: Taking false branch
           if (unlikely(cant_mount(dentry))) {
           ^
   fs/namespace.c:2249:14: note: 'mnt' is non-null
           if (likely(!mnt)) {
                       ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/namespace.c:2249:2: note: Taking false branch
           if (likely(!mnt)) {
           ^
   fs/namespace.c:2262:2: note: Null pointer value stored to 'dentry'
           dentry =3D path->dentry =3D dget(mnt->mnt_root);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:2263:2: note: Control jumps to line 2242
           goto retry;
           ^
   fs/namespace.c:2242:13: note: Access to field 'd_inode' results in a der=
eference of a null pointer (loaded from variable 'dentry')
           inode_lock(dentry->d_inode);
                      ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/net/ethernet/qualcomm/emac/emac-mac.c:1411:13: warning: Access t=
o field 'skb' results in a dereference of a null pointer (loaded from varia=
ble 'tpbuf') [clang-analyzer-core.NullDereference]
           tpbuf->skb =3D skb;
                      ^
   drivers/net/ethernet/qualcomm/emac/emac-mac.c:1444:2: note: Taking false=
 branch
           if (emac_tso_csum(adpt, tx_q, skb, &tpd) !=3D 0) {
           ^
   drivers/net/ethernet/qualcomm/emac/emac-mac.c:1449:6: note: Assuming fie=
ld 'vlan_present' is 0
           if (skb_vlan_tag_present(skb)) {
               ^
   include/linux/if_vlan.h:77:37: note: expanded from macro 'skb_vlan_tag_p=
resent'
   #define skb_vlan_tag_present(__skb)     ((__skb)->vlan_present)

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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0890209229580839174==--

