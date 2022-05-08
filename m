Content-Type: multipart/mixed; boundary="===============4339326382594433821=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 225/1129] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1044:2: warning: Value stored to 'tail_p' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 09 May 2022 05:01:10 +0800
Message-ID: <202205090439.ddmmSvqz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4339326382594433821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Saurabh Sengar <saurabh.singh@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>
CC: Swati Agarwal <swati.agarwal@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   3076249fc30bf463f8390f89009de928ad3e95ff
commit: ee94241b2118ddd38a456b2b805fc584b57de58f [225/1129] net: axienet: a=
dded multichannel DMA support
:::::: branch date: 4 days ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20509/202205090439.ddmmSvqz-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/ee94241b2118ddd38a456=
b2b805fc584b57de58f
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout ee94241b2118ddd38a456b2b805fc584b57de58f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~
   net/ipv4/devinet.c:1496:4: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                           strcat(ifa->ifa_label, dot);
                           ^~~~~~
   net/ipv4/devinet.c:1498:4: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(ifa->ifa_label + (IFNAMSIZ - strlen(dot) =
- 1), dot);
                           ^~~~~~
   net/ipv4/devinet.c:1498:4: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                           strcpy(ifa->ifa_label + (IFNAMSIZ - strlen(dot) =
- 1), dot);
                           ^~~~~~
   net/ipv4/devinet.c:1540:5: warning: Value stored to 'in_dev' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                                   in_dev =3D inetdev_init(dev);
                                   ^        ~~~~~~~~~~~~~~~~~
   net/ipv4/devinet.c:1540:5: note: Value stored to 'in_dev' is never read
                                   in_dev =3D inetdev_init(dev);
                                   ^        ~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/net/ethernet/broadcom/bcmsysport.c:903:21: warning: Value stored=
 to 'ndev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct net_device *ndev =3D priv->netdev;
                              ^~~~   ~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bcmsysport.c:903:21: note: Value stored to=
 'ndev' during its initialization is never read
           struct net_device *ndev =3D priv->netdev;
                              ^~~~   ~~~~~~~~~~~~
   Suppressed 17 warnings (13 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/net/ethernet/fujitsu/fmvj18x_cs.c:580:5: warning: Value stored t=
o 'j' is never read [clang-analyzer-deadcode.DeadStores]
       j =3D pcmcia_release_window(link, link->resource[2]);
       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/fujitsu/fmvj18x_cs.c:580:5: note: Value stored to '=
j' is never read
       j =3D pcmcia_release_window(link, link->resource[2]);
       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:204:2: warning: Undefi=
ned or garbage value returned to caller [clang-analyzer-core.uninitialized.=
UndefReturn]
           return ret;
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1401:2: note: Taking f=
alse branch
           dev_dbg(&ndev->dev, "axienet_open()\n");
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1408:6: note: Assuming=
 field 'mactype' is equal to XAXIENET_10G_25G
           if (lp->axienet_config->mactype =3D=3D XAXIENET_10G_25G)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1408:2: note: Taking t=
rue branch
           if (lp->axienet_config->mactype =3D=3D XAXIENET_10G_25G)
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1409:9: note: Calling =
'axienet_device_reset'
                   ret =3D axienet_device_reset(ndev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:426:2: note: Assuming =
'i' is >=3D field 'num_rx_queues'
           for_each_rx_dma_queue(lp, i) {
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet.h:40:18: note: expanded from =
macro 'for_each_rx_dma_queue'
           for ((var) =3D 0; (var) < (lp)->num_rx_queues; (var)++)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:426:2: note: Loop cond=
ition is false. Execution continues on line 434
           for_each_rx_dma_queue(lp, i) {
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet.h:40:2: note: expanded from m=
acro 'for_each_rx_dma_queue'
           for ((var) =3D 0; (var) < (lp)->num_rx_queues; (var)++)
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:435:26: note: Field 'm=
actype' is equal to XAXIENET_10G_25G
           if (lp->axienet_config->mactype !=3D XAXIENET_10G_25G) {
                                   ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:435:2: note: Taking fa=
lse branch
           if (lp->axienet_config->mactype !=3D XAXIENET_10G_25G) {
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:440:6: note: Assuming =
field 'mtu' is <=3D XAE_MTU
           if (ndev->mtu > XAE_MTU && ndev->mtu <=3D XAE_JUMBO_MTU) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:440:26: note: Left sid=
e of '&&' is false
           if (ndev->mtu > XAE_MTU && ndev->mtu <=3D XAE_JUMBO_MTU) {
                                   ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:448:8: note: Calling '=
axienet_dma_bd_init'
           ret =3D axienet_dma_bd_init(ndev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:182:9: note: 'ret' dec=
lared without an initial value
           int i, ret;
                  ^~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:192:2: note: Loop cond=
ition is false. Execution continues on line 204
           for_each_rx_dma_queue(lp, i) {
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet.h:40:2: note: expanded from m=
acro 'for_each_rx_dma_queue'
           for ((var) =3D 0; (var) < (lp)->num_rx_queues; (var)++)
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:204:2: note: Undefined=
 or garbage value returned to caller
           return ret;
           ^      ~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1044:2: warning: Value=
 stored to 'tail_p' is never read [clang-analyzer-deadcode.DeadStores]
           tail_p =3D q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1044:2: note: Value st=
ored to 'tail_p' is never read
           tail_p =3D q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1373:2: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D axienet_mdio_enable(lp);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1373:2: note: Value st=
ored to 'ret' is never read
           ret =3D axienet_mdio_enable(lp);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1409:3: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D axienet_device_reset(ndev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1409:3: note: Value st=
ored to 'ret' is never read
                   ret =3D axienet_device_reset(ndev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1411:3: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D axienet_mii_init(ndev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1411:3: note: Value st=
ored to 'ret' is never read
                   ret =3D axienet_mii_init(ndev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2785:2: warning: Assig=
ned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           int (*axienet_clk_init)(struct platform_device *pdev,
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2785:2: note: Assigned=
 value is garbage or undefined
           int (*axienet_clk_init)(struct platform_device *pdev,
           ^
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/extcon/extcon-max14577.c:40:8: warning: Excessive padding in 'st=
ruct max14577_muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct max14577_muic_irq {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-max14577.c:40:8: note: Excessive padding in 'struc=
t max14577_muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields =
order: name, irq, virq, consider reordering the fields or adding explicit p=
adding members
   struct max14577_muic_irq {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/extcon/extcon-ptn5150.c:173:2: warning: Value stored to 'vendor_=
id' is never read [clang-analyzer-deadcode.DeadStores]
           vendor_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VENDOR, reg_data);
           ^
   drivers/extcon/extcon-ptn5150.c:173:2: note: Value stored to 'vendor_id'=
 is never read
   drivers/extcon/extcon-ptn5150.c:174:2: warning: Value stored to 'version=
_id' is never read [clang-analyzer-deadcode.DeadStores]
           version_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VERSION, reg_data=
);
           ^
   drivers/extcon/extcon-ptn5150.c:174:2: note: Value stored to 'version_id=
' is never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/extcon/extcon-rt8973a.c:25:8: warning: Excessive padding in 'str=
uct muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-rt8973a.c:25:8: note: Excessive padding in 'struct=
 muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: nam=
e, irq, virq, consider reordering the fields or adding explicit padding mem=
bers
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/extcon/extcon-sm5502.c:24:8: warning: Excessive padding in 'stru=
ct muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-sm5502.c:24:8: note: Excessive padding in 'struct =
muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: name=
, irq, virq, consider reordering the fields or adding explicit padding memb=
ers
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   14 warnings generated.
   fs/cifs/connect.c:3715:3: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(bcc_ptr, tree);
                   ^~~~~~
   fs/cifs/connect.c:3715:3: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                   strcpy(bcc_ptr, tree);
                   ^~~~~~

vim +/tail_p +1044 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

ee94241b2118dd Saurabh Sengar               2021-01-22   998  =

ee94241b2118dd Saurabh Sengar               2021-01-22   999  	if (!q->eth_=
hasdre &&
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1000  	    (((phys_=
addr_t)skb->data & 0x3) || num_frag > 0)) {
ee94241b2118dd Saurabh Sengar               2021-01-22  1001  		skb_copy_an=
d_csum_dev(skb, q->tx_buf[q->tx_bd_tail]);
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1002  =

ee94241b2118dd Saurabh Sengar               2021-01-22  1003  		cur_p->phys=
 =3D q->tx_bufs_dma +
ee94241b2118dd Saurabh Sengar               2021-01-22  1004  			      (q->=
tx_buf[q->tx_bd_tail] - q->tx_bufs);
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1005  =

ee94241b2118dd Saurabh Sengar               2021-01-22  1006  #ifdef CONFIG=
_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  1007  		cur_p->cntr=
l =3D skb_pagelen(skb) | XMCDMA_BD_CTRL_TXSOF_MASK;
ee94241b2118dd Saurabh Sengar               2021-01-22  1008  #else
ee94241b2118dd Saurabh Sengar               2021-01-22  1009  		cur_p->cntr=
l =3D skb_pagelen(skb) | XAXIDMA_BD_CTRL_TXSOF_MASK;
ee94241b2118dd Saurabh Sengar               2021-01-22  1010  #endif
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1011  		goto out;
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1012  	} else {
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  1013  		cur_p->phys=
 =3D dma_map_single(ndev->dev.parent, skb->data,
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  1014  					     skb=
_headlen(skb), DMA_TO_DEVICE);
ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1015  	}
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1016  	cur_p->tx_de=
sc_mapping =3D DESC_DMA_MAP_SINGLE;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1017  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  1018  	for (ii =3D =
0; ii < num_frag; ii++) {
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1019  		u32 len;
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1020  		skb_frag_t =
*frag;
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1021  =

ee94241b2118dd Saurabh Sengar               2021-01-22  1022  		if (++q->tx=
_bd_tail >=3D lp->tx_bd_num)
ee94241b2118dd Saurabh Sengar               2021-01-22  1023  			q->tx_bd_t=
ail =3D 0;
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1024  =

ee94241b2118dd Saurabh Sengar               2021-01-22  1025  #ifdef CONFIG=
_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  1026  		cur_p =3D &=
q->txq_bd_v[q->tx_bd_tail];
ee94241b2118dd Saurabh Sengar               2021-01-22  1027  #else
ee94241b2118dd Saurabh Sengar               2021-01-22  1028  		cur_p =3D &=
q->tx_bd_v[q->tx_bd_tail];
ee94241b2118dd Saurabh Sengar               2021-01-22  1029  #endif
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1030  		frag =3D &s=
kb_shinfo(skb)->frags[ii];
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1031  		len =3D skb=
_frag_size(frag);
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1032  		cur_p->phys=
 =3D skb_frag_dma_map(ndev->dev.parent, frag, 0, len,
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1033  					       D=
MA_TO_DEVICE);
ee94241b2118dd Saurabh Sengar               2021-01-22  1034  		cur_p->cntr=
l =3D len;
396a9512783188 Appana Durga Kedareswara Rao 2021-01-22  1035  		cur_p->tx_d=
esc_mapping =3D DESC_DMA_MAP_PAGE;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1036  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1037  =

ce8edb4cf93f17 Appana Durga Kedareswara Rao 2021-01-22  1038  out:
ee94241b2118dd Saurabh Sengar               2021-01-22  1039  #ifdef CONFIG=
_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  1040  	cur_p->cntrl=
 |=3D XMCDMA_BD_CTRL_TXEOF_MASK;
ee94241b2118dd Saurabh Sengar               2021-01-22  1041  	tail_p =3D q=
->tx_bd_p + sizeof(*q->txq_bd_v) * q->tx_bd_tail;
ee94241b2118dd Saurabh Sengar               2021-01-22  1042  #else
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1043  	cur_p->cntrl=
 |=3D XAXIDMA_BD_CTRL_TXEOF_MASK;
ee94241b2118dd Saurabh Sengar               2021-01-22 @1044  	tail_p =3D q=
->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
ee94241b2118dd Saurabh Sengar               2021-01-22  1045  #endif
ee94241b2118dd Saurabh Sengar               2021-01-22  1046  	cur_p->tx_sk=
b =3D (phys_addr_t)skb;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  1047  	cur_p->tx_sk=
b =3D (phys_addr_t)skb;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1048  =

ee94241b2118dd Saurabh Sengar               2021-01-22  1049  	tail_p =3D q=
->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
244a92b6cc6f9a Appana Durga Kedareswara Rao 2020-01-24  1050  	/* Ensure BD=
 write before starting transfer */
244a92b6cc6f9a Appana Durga Kedareswara Rao 2020-01-24  1051  	wmb();
244a92b6cc6f9a Appana Durga Kedareswara Rao 2020-01-24  1052  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  1053  	/* Start the=
 transfer */
ee94241b2118dd Saurabh Sengar               2021-01-22  1054  #ifdef CONFIG=
_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  1055  	axienet_dma_=
bdout(q, XMCDMA_CHAN_TAILDESC_OFFSET(q->chan_id),
ee94241b2118dd Saurabh Sengar               2021-01-22  1056  			  tail_p);
ee94241b2118dd Saurabh Sengar               2021-01-22  1057  #else
ee94241b2118dd Saurabh Sengar               2021-01-22  1058  	axienet_dma_=
bdout(q, XAXIDMA_TX_TDESC_OFFSET, tail_p);
ee94241b2118dd Saurabh Sengar               2021-01-22  1059  #endif
ee94241b2118dd Saurabh Sengar               2021-01-22  1060  	if (++q->tx_=
bd_tail >=3D lp->tx_bd_num)
ee94241b2118dd Saurabh Sengar               2021-01-22  1061  		q->tx_bd_ta=
il =3D 0;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1062  =

ee94241b2118dd Saurabh Sengar               2021-01-22  1063  	spin_unlock_=
irqrestore(&q->tx_lock, flags);
dcbca0a74b25f9 Appana Durga Kedareswara Rao 2020-01-24  1064  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  1065  	return NETDE=
V_TX_OK;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1066  }
8a3b7a252dca9f Daniel Borkmann              2012-01-19  1067  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4339326382594433821==--

