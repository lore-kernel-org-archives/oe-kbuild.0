Content-Type: multipart/mixed; boundary="===============3976642905198417038=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 405/973] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1434:2: warning: Value stored to 'tail_p' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 12 Mar 2022 06:34:10 +0800
Message-ID: <202203120636.JAU4Dhu1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3976642905198417038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Piyush Mehta <piyush.mehta@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Manish Narani <manish.narani@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   802aff9b79e15ede7cbb84ac784f943f5a66287a
commit: 9a7535b91e5a749ad7e26fade0820c4c847ff8e2 [405/973] usb: xhci-plat: =
Add remote wakeup support for xilinx
:::::: branch date: 8 days ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20312/202203120636.JAU4Dhu1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/9a7535b91e5a749ad7e26=
fade0820c4c847ff8e2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 9a7535b91e5a749ad7e26fade0820c4c847ff8e2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
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
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/i3c/master/mipi-i3c-hci/ext_caps.c:78:7: warning: Value stored t=
o 'mode_entry' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
                   u32 mode_entry =3D readl(base);
                       ^~~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/ext_caps.c:78:7: note: Value stored to '=
mode_entry' during its initialization is never read
                   u32 mode_entry =3D readl(base);
                       ^~~~~~~~~~
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
   17 warnings generated.
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1434:2: warning: Value=
 stored to 'tail_p' is never read [clang-analyzer-deadcode.DeadStores]
           tail_p =3D q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1434:2: note: Value st=
ored to 'tail_p' is never read
           tail_p =3D q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3232:2: warning: Assig=
ned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           int (*axienet_clk_init)(struct platform_device *pdev,
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3232:2: note: Assigned=
 value is garbage or undefined
           int (*axienet_clk_init)(struct platform_device *pdev,
           ^
   Suppressed 15 warnings (12 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/net/ethernet/dnet.c:608:2: warning: Value stored to 'config' is =
never read [clang-analyzer-deadcode.DeadStores]
           config =3D dnet_readl(bp, INTR_SRC);
           ^
   drivers/net/ethernet/dnet.c:608:2: note: Value stored to 'config' is nev=
er read
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/iio/light/tsl2772.c:896:40: warning: The result of the left shif=
t is undefined because the left operand is negative [clang-analyzer-core.Un=
definedBinaryOperatorResult]
           chip->settings.prox_thres_high =3D (max << 1) - mean;
                                                 ^
   drivers/iio/light/tsl2772.c:1057:6: note: Assuming the condition is false
           if (kstrtobool(buf, &value) || !value)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:1057:6: note: Left side of '||' is false
   drivers/iio/light/tsl2772.c:1057:33: note: Assuming 'value' is true
           if (kstrtobool(buf, &value) || !value)
                                          ^~~~~~
   drivers/iio/light/tsl2772.c:1057:2: note: Taking false branch
           if (kstrtobool(buf, &value) || !value)
           ^
   drivers/iio/light/tsl2772.c:1060:8: note: Calling 'tsl2772_prox_cal'
           ret =3D tsl2772_prox_cal(indio_dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:875:6: note: Assuming field 'prox_max_sample=
s_cal' is >=3D 1
           if (chip->settings.prox_max_samples_cal < 1 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:875:6: note: Left side of '||' is false
   drivers/iio/light/tsl2772.c:876:6: note: Assuming field 'prox_max_sample=
s_cal' is <=3D MAX_SAMPLES_CAL
               chip->settings.prox_max_samples_cal > MAX_SAMPLES_CAL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:875:2: note: Taking false branch
           if (chip->settings.prox_max_samples_cal < 1 ||
           ^
   drivers/iio/light/tsl2772.c:879:14: note: 'i' is < field 'prox_max_sampl=
es_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^
   drivers/iio/light/tsl2772.c:879:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:882:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   drivers/iio/light/tsl2772.c:882:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/light/tsl2772.c:879:14: note: Assuming 'i' is >=3D field 'pr=
ox_max_samples_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:879:2: note: Loop condition is false. Execut=
ion continues on line 888
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:889:2: note: The value -2147483648 is assign=
ed to 'max'
           max =3D INT_MIN;
           ^~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:890:14: note: Assuming 'i' is >=3D field 'pr=
ox_max_samples_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:890:2: note: Loop condition is false. Execut=
ion continues on line 894
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:896:40: note: The result of the left shift i=
s undefined because the left operand is negative
           chip->settings.prox_thres_high =3D (max << 1) - mean;
                                             ~~~ ^
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
   fs/nfs/nfs4proc.c:1827:3: warning: Value stored to 'delegation' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   delegation =3D &deleg_cur->stateid;
                   ^            ~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4proc.c:1827:3: note: Value stored to 'delegation' is never re=
ad
                   delegation =3D &deleg_cur->stateid;
                   ^            ~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/tail_p +1434 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

ee94241b2118ddd Saurabh Sengar               2021-01-22  1388  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1389  	if (!q->eth=
_hasdre &&
ce8edb4cf93f176 Appana Durga Kedareswara Rao 2021-01-22  1390  	    (((phys=
_addr_t)skb->data & 0x3) || num_frag > 0)) {
ee94241b2118ddd Saurabh Sengar               2021-01-22  1391  		skb_copy_a=
nd_csum_dev(skb, q->tx_buf[q->tx_bd_tail]);
ce8edb4cf93f176 Appana Durga Kedareswara Rao 2021-01-22  1392  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1393  		cur_p->phy=
s =3D q->tx_bufs_dma +
ee94241b2118ddd Saurabh Sengar               2021-01-22  1394  			      (q-=
>tx_buf[q->tx_bd_tail] - q->tx_bufs);
ce8edb4cf93f176 Appana Durga Kedareswara Rao 2021-01-22  1395  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1396  #ifdef CONFI=
G_AXIENET_HAS_MCDMA
ee94241b2118ddd Saurabh Sengar               2021-01-22  1397  		cur_p->cnt=
rl =3D skb_pagelen(skb) | XMCDMA_BD_CTRL_TXSOF_MASK;
ee94241b2118ddd Saurabh Sengar               2021-01-22  1398  #else
ee94241b2118ddd Saurabh Sengar               2021-01-22  1399  		cur_p->cnt=
rl =3D skb_pagelen(skb) | XAXIDMA_BD_CTRL_TXSOF_MASK;
ee94241b2118ddd Saurabh Sengar               2021-01-22  1400  #endif
ce8edb4cf93f176 Appana Durga Kedareswara Rao 2021-01-22  1401  		goto out;
ce8edb4cf93f176 Appana Durga Kedareswara Rao 2021-01-22  1402  	} else {
9dce88e232cf191 Appana Durga Kedareswara Rao 2020-01-24  1403  		cur_p->phy=
s =3D dma_map_single(ndev->dev.parent, skb->data,
9dce88e232cf191 Appana Durga Kedareswara Rao 2020-01-24  1404  					     sk=
b_headlen(skb), DMA_TO_DEVICE);
ce8edb4cf93f176 Appana Durga Kedareswara Rao 2021-01-22  1405  	}
396a9512783188d Appana Durga Kedareswara Rao 2021-01-22  1406  	cur_p->tx_d=
esc_mapping =3D DESC_DMA_MAP_SINGLE;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1407  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1408  	for (ii =3D=
 0; ii < num_frag; ii++) {
396a9512783188d Appana Durga Kedareswara Rao 2021-01-22  1409  		u32 len;
396a9512783188d Appana Durga Kedareswara Rao 2021-01-22  1410  		skb_frag_t=
 *frag;
396a9512783188d Appana Durga Kedareswara Rao 2021-01-22  1411  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1412  		if (++q->t=
x_bd_tail >=3D lp->tx_bd_num)
ee94241b2118ddd Saurabh Sengar               2021-01-22  1413  			q->tx_bd_=
tail =3D 0;
90c9074a1401aaf Michal Simek                 2021-01-22  1414  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1415  #ifdef CONFI=
G_AXIENET_HAS_MCDMA
ee94241b2118ddd Saurabh Sengar               2021-01-22  1416  		cur_p =3D =
&q->txq_bd_v[q->tx_bd_tail];
ee94241b2118ddd Saurabh Sengar               2021-01-22  1417  #else
ee94241b2118ddd Saurabh Sengar               2021-01-22  1418  		cur_p =3D =
&q->tx_bd_v[q->tx_bd_tail];
ee94241b2118ddd Saurabh Sengar               2021-01-22  1419  #endif
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1420  		frag =3D &=
skb_shinfo(skb)->frags[ii];
396a9512783188d Appana Durga Kedareswara Rao 2021-01-22  1421  		len =3D sk=
b_frag_size(frag);
396a9512783188d Appana Durga Kedareswara Rao 2021-01-22  1422  		cur_p->phy=
s =3D skb_frag_dma_map(ndev->dev.parent, frag, 0, len,
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1423  					       =
DMA_TO_DEVICE);
ee94241b2118ddd Saurabh Sengar               2021-01-22  1424  		cur_p->cnt=
rl =3D len;
396a9512783188d Appana Durga Kedareswara Rao 2021-01-22  1425  		cur_p->tx_=
desc_mapping =3D DESC_DMA_MAP_PAGE;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1426  	}
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1427  =

ce8edb4cf93f176 Appana Durga Kedareswara Rao 2021-01-22  1428  out:
ee94241b2118ddd Saurabh Sengar               2021-01-22  1429  #ifdef CONFI=
G_AXIENET_HAS_MCDMA
ee94241b2118ddd Saurabh Sengar               2021-01-22  1430  	cur_p->cntr=
l |=3D XMCDMA_BD_CTRL_TXEOF_MASK;
ee94241b2118ddd Saurabh Sengar               2021-01-22  1431  	tail_p =3D =
q->tx_bd_p + sizeof(*q->txq_bd_v) * q->tx_bd_tail;
ee94241b2118ddd Saurabh Sengar               2021-01-22  1432  #else
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1433  	cur_p->cntr=
l |=3D XAXIDMA_BD_CTRL_TXEOF_MASK;
ee94241b2118ddd Saurabh Sengar               2021-01-22 @1434  	tail_p =3D =
q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
ee94241b2118ddd Saurabh Sengar               2021-01-22  1435  #endif
ee94241b2118ddd Saurabh Sengar               2021-01-22  1436  	cur_p->tx_s=
kb =3D (phys_addr_t)skb;
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  1437  	cur_p->tx_s=
kb =3D (phys_addr_t)skb;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1438  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1439  	tail_p =3D =
q->tx_bd_p + sizeof(*q->tx_bd_v) * q->tx_bd_tail;
244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1440  	/* Ensure B=
D write before starting transfer */
244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1441  	wmb();
244a92b6cc6f9ae Appana Durga Kedareswara Rao 2020-01-24  1442  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1443  	/* Start th=
e transfer */
ee94241b2118ddd Saurabh Sengar               2021-01-22  1444  #ifdef CONFI=
G_AXIENET_HAS_MCDMA
ee94241b2118ddd Saurabh Sengar               2021-01-22  1445  	axienet_dma=
_bdout(q, XMCDMA_CHAN_TAILDESC_OFFSET(q->chan_id),
ee94241b2118ddd Saurabh Sengar               2021-01-22  1446  			  tail_p);
ee94241b2118ddd Saurabh Sengar               2021-01-22  1447  #else
ee94241b2118ddd Saurabh Sengar               2021-01-22  1448  	axienet_dma=
_bdout(q, XAXIDMA_TX_TDESC_OFFSET, tail_p);
ee94241b2118ddd Saurabh Sengar               2021-01-22  1449  #endif
ee94241b2118ddd Saurabh Sengar               2021-01-22  1450  	if (++q->tx=
_bd_tail >=3D lp->tx_bd_num)
ee94241b2118ddd Saurabh Sengar               2021-01-22  1451  		q->tx_bd_t=
ail =3D 0;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1452  =

ee94241b2118ddd Saurabh Sengar               2021-01-22  1453  	spin_unlock=
_irqrestore(&q->tx_lock, flags);
dcbca0a74b25f96 Appana Durga Kedareswara Rao 2020-01-24  1454  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1455  	return NETD=
EV_TX_OK;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1456  }
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  1457  =


:::::: The code at line 1434 was first introduced by commit
:::::: ee94241b2118ddd38a456b2b805fc584b57de58f net: axienet: added multich=
annel DMA support

:::::: TO: Saurabh Sengar <saurabh.singh@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3976642905198417038==--

