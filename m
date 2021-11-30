Content-Type: multipart/mixed; boundary="===============4545740821337615552=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/actions/owl-emac.c:210:16: warning: Access to field 'control' results in a dereference of an undefined pointer value (loaded from variable 'desc') [clang-analyzer-core.NullDereference]
Date: Wed, 01 Dec 2021 02:28:19 +0800
Message-ID: <202112010219.RWu2F2Ib-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4545740821337615552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d58071a8a76d779eedab38033ae4c821c30295a5
commit: fbcf8a340150abd20bf44fc706362b0827157fe8 net: ethernet: actions: Ad=
d helper dependency on COMPILE_TEST
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20211001 (https://download.01.org/0day-ci/archi=
ve/20211201/202112010219.RWu2F2Ib-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 962e50=
3cc8bc411f7523cc393acae8aae425b1c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfbcf8a340150abd20bf44fc706362b0827157fe8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fbcf8a340150abd20bf44fc706362b0827157fe8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/net/can/ti_hecc.c:783:3: warning: Value stored to 'int_status' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   int_status =3D hecc_read(priv, HECC_CANGIF1);
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/ti_hecc.c:783:3: note: Value stored to 'int_status' is n=
ever read
                   int_status =3D hecc_read(priv, HECC_CANGIF1);
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/ti_hecc.c:786:3: warning: Value stored to 'int_status' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   int_status =3D hecc_read(priv, HECC_CANGIF0);
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/ti_hecc.c:786:3: note: Value stored to 'int_status' is n=
ever read
                   int_status =3D hecc_read(priv, HECC_CANGIF0);
                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/ti_hecc.c:861:22: warning: Value stored to 'np' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *np =3D pdev->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~~~~
   drivers/net/can/ti_hecc.c:861:22: note: Value stored to 'np' during its =
initialization is never read
           struct device_node *np =3D pdev->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/net/ethernet/actions/owl-emac.c:210:16: warning: Access to field=
 'control' results in a dereference of an undefined pointer value (loaded f=
rom variable 'desc') [clang-analyzer-core.NullDereference]
           desc->control |=3D OWL_EMAC_BIT_RDES1_RER;
                         ^
   drivers/net/ethernet/actions/owl-emac.c:1420:2: note: '?' condition is f=
alse
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/net/ethernet/actions/owl-emac.c:1420:6: note: 'ret' is 0
           if (ret)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/net/ethernet/actions/owl-emac.c:1420:2: note: '?' condition is f=
alse
           if (ret)
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
   drivers/net/ethernet/actions/owl-emac.c:1420:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/ethernet/actions/owl-emac.c:1423:2: note: Assuming the condi=
tion is false
           if (netif_running(netdev)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/net/ethernet/actions/owl-emac.c:1423:2: note: '?' condition is f=
alse
           if (netif_running(netdev)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/net/ethernet/actions/owl-emac.c:1423:2: note: '?' condition is t=
rue
           if (netif_running(netdev)) {
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
   drivers/net/ethernet/actions/owl-emac.c:1423:2: note: Taking true branch
           if (netif_running(netdev)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/ethernet/actions/owl-emac.c:1427:9: note: Calling 'owl_emac_=
enable'
                   ret =3D owl_emac_enable(netdev, true);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/actions/owl-emac.c:1042:8: note: Calling 'owl_emac_=
ring_prepare_rx'
           ret =3D owl_emac_ring_prepare_rx(priv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/actions/owl-emac.c:184:2: note: 'desc' declared wit=
hout an initial value
           struct owl_emac_ring_desc *desc;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/actions/owl-emac.c:189:14: note: Assuming 'i' is >=
=3D field 'size'
           for (i =3D 0; i < ring->size; i++) {
                       ^~~~~~~~~~~~~~
   drivers/net/ethernet/actions/owl-emac.c:189:2: note: Loop condition is f=
alse. Execution continues on line 210
           for (i =3D 0; i < ring->size; i++) {
           ^
   drivers/net/ethernet/actions/owl-emac.c:210:16: note: Access to field 'c=
ontrol' results in a dereference of an undefined pointer value (loaded from=
 variable 'desc')
           desc->control |=3D OWL_EMAC_BIT_RDES1_RER;
           ~~~~          ^
   drivers/net/ethernet/actions/owl-emac.c:233:16: warning: Access to field=
 'control' results in a dereference of an undefined pointer value (loaded f=
rom variable 'desc') [clang-analyzer-core.NullDereference]
           desc->control |=3D OWL_EMAC_BIT_TDES1_TER;
                         ^
   drivers/net/ethernet/actions/owl-emac.c:1420:2: note: '?' condition is f=
alse
           if (ret)

vim +210 drivers/net/ethernet/actions/owl-emac.c

de6e0b19823985 Cristian Ciocaltea 2021-03-22  178  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  179  static int owl_emac_ring=
_prepare_rx(struct owl_emac_priv *priv)
de6e0b19823985 Cristian Ciocaltea 2021-03-22  180  {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  181  	struct owl_emac_ring *r=
ing =3D &priv->rx_ring;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  182  	struct device *dev =3D =
owl_emac_get_dev(priv);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  183  	struct net_device *netd=
ev =3D priv->netdev;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  184  	struct owl_emac_ring_de=
sc *desc;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  185  	struct sk_buff *skb;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  186  	dma_addr_t dma_addr;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  187  	int i;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  188  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  189  	for (i =3D 0; i < ring-=
>size; i++) {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  190  		skb =3D owl_emac_alloc=
_skb(netdev);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  191  		if (!skb)
de6e0b19823985 Cristian Ciocaltea 2021-03-22  192  			return -ENOMEM;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  193  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  194  		dma_addr =3D owl_emac_=
dma_map_rx(priv, skb);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  195  		if (dma_mapping_error(=
dev, dma_addr)) {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  196  			dev_kfree_skb(skb);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  197  			return -ENOMEM;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  198  		}
de6e0b19823985 Cristian Ciocaltea 2021-03-22  199  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  200  		desc =3D &ring->descs[=
i];
de6e0b19823985 Cristian Ciocaltea 2021-03-22  201  		desc->status =3D OWL_E=
MAC_BIT_RDES0_OWN;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  202  		desc->control =3D skb_=
tailroom(skb) & OWL_EMAC_MSK_RDES1_RBS1;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  203  		desc->buf_addr =3D dma=
_addr;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  204  		desc->reserved =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  205  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  206  		ring->skbs[i] =3D skb;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  207  		ring->skbs_dma[i] =3D =
dma_addr;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  208  	}
de6e0b19823985 Cristian Ciocaltea 2021-03-22  209  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22 @210  	desc->control |=3D OWL_=
EMAC_BIT_RDES1_RER;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  211  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  212  	ring->head =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  213  	ring->tail =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  214  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  215  	return 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  216  }
de6e0b19823985 Cristian Ciocaltea 2021-03-22  217  =


:::::: The code at line 210 was first introduced by commit
:::::: de6e0b198239857943db395377dc1d2ddd6c05df net: ethernet: actions: Add=
 Actions Semi Owl Ethernet MAC driver

:::::: TO: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4545740821337615552==--

