Content-Type: multipart/mixed; boundary="===============3295605951895323070=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2212/11234] drivers/net/ethernet/atheros/alx/main.c:261:17: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Fri, 07 Jan 2022 05:31:36 +0800
Message-ID: <202201070529.pcCG92SX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3295605951895323070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3770333b3f8cb7c9110889853afaa49777c26ea7
commit: 03f61041c17914355dde7261be9ccdc821ddd454 [2212/11234] skbuff: Switc=
h structure bounds to struct_group()
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220105 (https://download.01.org/0day-ci/archi=
ve/20220107/202201070529.pcCG92SX-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e3=
0ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D03f61041c17914355dde7261be9ccdc821ddd454
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 03f61041c17914355dde7261be9ccdc821ddd454
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/block/nbd.c:278:6: note: Assuming the condition is false
           if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags))
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/block/nbd.c:278:2: note: Taking false branch
           if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags))
           ^
   drivers/block/nbd.c:281:3: note: Calling 'nbd_dev_remove'
                   nbd_dev_remove(nbd);
                   ^~~~~~~~~~~~~~~~~~~
   drivers/block/nbd.c:264:2: note: Memory is released
           kfree(nbd);
           ^~~~~~~~~~
   drivers/block/nbd.c:281:3: note: Returning; memory was released
                   nbd_dev_remove(nbd);
                   ^~~~~~~~~~~~~~~~~~~
   drivers/block/nbd.c:2543:3: note: Returning; memory was released
                   nbd_put(nbd);
                   ^~~~~~~~~~~~
   drivers/block/nbd.c:2538:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(&del_list)) {
           ^
   drivers/block/nbd.c:2540:3: note: Calling 'list_del_init'
                   list_del_init(&nbd->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:206:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/tty/serial/mxs-auart.c:1134:3: warning: Value stored to 'istat' =
is never read [clang-analyzer-deadcode.DeadStores]
                   istat &=3D ~AUART_INTR_TXIS;
                   ^        ~~~~~~~~~~~~~~~~
   drivers/tty/serial/mxs-auart.c:1134:3: note: Value stored to 'istat' is =
never read
                   istat &=3D ~AUART_INTR_TXIS;
                   ^        ~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/tty/serial/fsl_lpuart.c:1276:33: warning: The result of the left=
 shift is undefined because the right operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^
   drivers/tty/serial/fsl_lpuart.c:2859:6: note: Assuming field 'suspended'=
 is 0
           if (sport->port.suspended && !irq_wake)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2859:28: note: Left side of '&&' is false
           if (sport->port.suspended && !irq_wake)
                                     ^
   drivers/tty/serial/fsl_lpuart.c:2862:2: note: Taking false branch
           if (lpuart_is_32(sport))
           ^
   drivers/tty/serial/fsl_lpuart.c:2867:6: note: Assuming field 'lpuart_dma=
_rx_use' is true
           if (sport->lpuart_dma_rx_use) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2867:2: note: Taking true branch
           if (sport->lpuart_dma_rx_use) {
           ^
   drivers/tty/serial/fsl_lpuart.c:2868:7: note: Assuming 'irq_wake' is true
                   if (irq_wake) {
                       ^~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2868:3: note: Taking true branch
                   if (irq_wake) {
                   ^
   drivers/tty/serial/fsl_lpuart.c:2869:9: note: Calling 'lpuart_start_rx_d=
ma'
                           if (!lpuart_start_rx_dma(sport))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1267:9: note: Assuming the condition is =
false
           bits =3D (termios->c_cflag & CSIZE) =3D=3D CS7 ? 9 : 10;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1267:9: note: '?' condition is false
   drivers/tty/serial/fsl_lpuart.c:1268:6: note: Assuming the condition is =
false
           if (termios->c_cflag & PARENB)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1268:2: note: Taking false branch
           if (termios->c_cflag & PARENB)
           ^
   drivers/tty/serial/fsl_lpuart.c:1276:33: note: The result of the left sh=
ift is undefined because the right operand is negative
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
>> drivers/net/ethernet/atheros/alx/main.c:261:17: warning: Dereference of =
null pointer [clang-analyzer-core.NullDereference]
                   skb->protocol =3D eth_type_trans(skb, rxq->netdev);
                                 ^
   drivers/net/ethernet/atheros/alx/main.c:306:6: note: Assuming field 'txq=
' is null
           if (np->txq)
               ^~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:306:2: note: Taking false branch
           if (np->txq)
           ^
   drivers/net/ethernet/atheros/alx/main.c:308:6: note: Assuming field 'rxq=
' is non-null
           if (np->rxq)
               ^~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:308:2: note: Taking true branch
           if (np->rxq)
           ^
   drivers/net/ethernet/atheros/alx/main.c:309:10: note: Calling 'alx_clean=
_rx_irq'
                   work =3D alx_clean_rx_irq(np->rxq, budget);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:228:9: note: Assuming 'work' is =
< 'budget'
           while (work < budget) {
                  ^~~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:228:2: note: Loop condition is t=
rue.  Entering loop body
           while (work < budget) {
           ^
   drivers/net/ethernet/atheros/alx/main.c:230:7: note: Assuming the condit=
ion is false
                   if (!(rrd->word3 & cpu_to_le32(1 << RRD_UPDATED_SHIFT)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:230:3: note: Taking false branch
                   if (!(rrd->word3 & cpu_to_le32(1 << RRD_UPDATED_SHIFT)))
                   ^
   drivers/net/ethernet/atheros/alx/main.c:234:7: note: Assuming the condit=
ion is false
                   if (ALX_GET_FIELD(le32_to_cpu(rrd->word0),
                       ^
   drivers/net/ethernet/atheros/alx/hw.h:457:2: note: expanded from macro '=
ALX_GET_FIELD'
           (((_data) >> _field ## _SHIFT) & _field ## _MASK)
           ^
   drivers/net/ethernet/atheros/alx/main.c:234:7: note: Left side of '||' i=
s false
                   if (ALX_GET_FIELD(le32_to_cpu(rrd->word0),
                       ^
   drivers/net/ethernet/atheros/alx/hw.h:457:2: note: expanded from macro '=
ALX_GET_FIELD'
           (((_data) >> _field ## _SHIFT) & _field ## _MASK)
           ^
   drivers/net/ethernet/atheros/alx/main.c:236:7: note: Assuming the condit=
ion is false
                       ALX_GET_FIELD(le32_to_cpu(rrd->word0),
                       ^
   drivers/net/ethernet/atheros/alx/hw.h:457:2: note: expanded from macro '=
ALX_GET_FIELD'
           (((_data) >> _field ## _SHIFT) & _field ## _MASK)
           ^
   drivers/net/ethernet/atheros/alx/main.c:234:3: note: Taking false branch
                   if (ALX_GET_FIELD(le32_to_cpu(rrd->word0),
                   ^
   drivers/net/ethernet/atheros/alx/main.c:251:7: note: Assuming the condit=
ion is false
                   if (rrd->word3 & cpu_to_le32(1 << RRD_ERR_RES_SHIFT) ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:251:7: note: Left side of '||' i=
s false
   drivers/net/ethernet/atheros/alx/main.c:252:7: note: Assuming the condit=
ion is true
                       rrd->word3 & cpu_to_le32(1 << RRD_ERR_LEN_SHIFT)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:251:3: note: Taking true branch
                   if (rrd->word3 & cpu_to_le32(1 << RRD_ERR_RES_SHIFT) ||
                   ^
   drivers/net/ethernet/atheros/alx/main.c:255:4: note: Control jumps to li=
ne 282
                           goto next_pkt;
                           ^
   drivers/net/ethernet/atheros/alx/main.c:282:7: note: Assuming the condit=
ion is true
                   if (++rxq->read_idx =3D=3D rxq->count)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:282:3: note: Taking true branch
                   if (++rxq->read_idx =3D=3D rxq->count)
                   ^
   drivers/net/ethernet/atheros/alx/main.c:284:7: note: Assuming the condit=
ion is false
                   if (++rxq->rrd_read_idx =3D=3D rxq->count)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:284:3: note: Taking false branch
                   if (++rxq->rrd_read_idx =3D=3D rxq->count)
                   ^
   drivers/net/ethernet/atheros/alx/main.c:287:3: note: Taking false branch
                   if (++rfd_cleaned > ALX_RX_ALLOC_THRESH)
                   ^
   drivers/net/ethernet/atheros/alx/main.c:228:9: note: 'work' is < 'budget'
           while (work < budget) {
                  ^~~~
   drivers/net/ethernet/atheros/alx/main.c:228:2: note: Loop condition is t=
rue.  Entering loop body
           while (work < budget) {
           ^
   drivers/net/ethernet/atheros/alx/main.c:230:7: note: Assuming the condit=
ion is false
                   if (!(rrd->word3 & cpu_to_le32(1 << RRD_UPDATED_SHIFT)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/atheros/alx/main.c:230:3: note: Taking false branch
                   if (!(rrd->word3 & cpu_to_le32(1 << RRD_UPDATED_SHIFT)))
                   ^
   drivers/net/ethernet/atheros/alx/main.c:234:7: note: Assuming the condit=
ion is false
                   if (ALX_GET_FIELD(le32_to_cpu(rrd->word0),
                       ^
   drivers/net/ethernet/atheros/alx/hw.h:457:2: note: expanded from macro '=
ALX_GET_FIELD'
           (((_data) >> _field ## _SHIFT) & _field ## _MASK)
           ^
   drivers/net/ethernet/atheros/alx/main.c:234:7: note: Left side of '||' i=
s false
                   if (ALX_GET_FIELD(le32_to_cpu(rrd->word0),
                       ^
   drivers/net/ethernet/atheros/alx/hw.h:457:2: note: expanded from macro '=
ALX_GET_FIELD'

vim +261 drivers/net/ethernet/atheros/alx/main.c

ab69bde6b2e9c37 Johannes Berg  2013-06-17  216  =

702e84185f47245 Tobias Regnery 2016-11-15  217  static int alx_clean_rx_irq=
(struct alx_rx_queue *rxq, int budget)
ab69bde6b2e9c37 Johannes Berg  2013-06-17  218  {
702e84185f47245 Tobias Regnery 2016-11-15  219  	struct alx_priv *alx;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  220  	struct alx_rrd *rrd;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  221  	struct alx_buffer *rxb;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  222  	struct sk_buff *skb;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  223  	u16 length, rfd_cleaned =
=3D 0;
7a05dc64e2e4c61 Eric Dumazet   2015-01-11  224  	int work =3D 0;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  225  =

702e84185f47245 Tobias Regnery 2016-11-15  226  	alx =3D netdev_priv(rxq->n=
etdev);
702e84185f47245 Tobias Regnery 2016-11-15  227  =

7a05dc64e2e4c61 Eric Dumazet   2015-01-11  228  	while (work < budget) {
ab69bde6b2e9c37 Johannes Berg  2013-06-17  229  		rrd =3D &rxq->rrd[rxq->rr=
d_read_idx];
ab69bde6b2e9c37 Johannes Berg  2013-06-17  230  		if (!(rrd->word3 & cpu_to=
_le32(1 << RRD_UPDATED_SHIFT)))
ab69bde6b2e9c37 Johannes Berg  2013-06-17  231  			break;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  232  		rrd->word3 &=3D ~cpu_to_l=
e32(1 << RRD_UPDATED_SHIFT);
ab69bde6b2e9c37 Johannes Berg  2013-06-17  233  =

ab69bde6b2e9c37 Johannes Berg  2013-06-17  234  		if (ALX_GET_FIELD(le32_to=
_cpu(rrd->word0),
ab69bde6b2e9c37 Johannes Berg  2013-06-17  235  				  RRD_SI) !=3D rxq->rea=
d_idx ||
ab69bde6b2e9c37 Johannes Berg  2013-06-17  236  		    ALX_GET_FIELD(le32_to=
_cpu(rrd->word0),
ab69bde6b2e9c37 Johannes Berg  2013-06-17  237  				  RRD_NOR) !=3D 1) {
ab69bde6b2e9c37 Johannes Berg  2013-06-17  238  			alx_schedule_reset(alx);
7a05dc64e2e4c61 Eric Dumazet   2015-01-11  239  			return work;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  240  		}
ab69bde6b2e9c37 Johannes Berg  2013-06-17  241  =

ab69bde6b2e9c37 Johannes Berg  2013-06-17  242  		rxb =3D &rxq->bufs[rxq->r=
ead_idx];
702e84185f47245 Tobias Regnery 2016-11-15  243  		dma_unmap_single(rxq->dev,
ab69bde6b2e9c37 Johannes Berg  2013-06-17  244  				 dma_unmap_addr(rxb, dm=
a),
ab69bde6b2e9c37 Johannes Berg  2013-06-17  245  				 dma_unmap_len(rxb, siz=
e),
ab69bde6b2e9c37 Johannes Berg  2013-06-17  246  				 DMA_FROM_DEVICE);
ab69bde6b2e9c37 Johannes Berg  2013-06-17  247  		dma_unmap_len_set(rxb, si=
ze, 0);
ab69bde6b2e9c37 Johannes Berg  2013-06-17  248  		skb =3D rxb->skb;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  249  		rxb->skb =3D NULL;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  250  =

ab69bde6b2e9c37 Johannes Berg  2013-06-17  251  		if (rrd->word3 & cpu_to_l=
e32(1 << RRD_ERR_RES_SHIFT) ||
ab69bde6b2e9c37 Johannes Berg  2013-06-17  252  		    rrd->word3 & cpu_to_l=
e32(1 << RRD_ERR_LEN_SHIFT)) {
ab69bde6b2e9c37 Johannes Berg  2013-06-17  253  			rrd->word3 =3D 0;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  254  			dev_kfree_skb_any(skb);
ab69bde6b2e9c37 Johannes Berg  2013-06-17  255  			goto next_pkt;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  256  		}
ab69bde6b2e9c37 Johannes Berg  2013-06-17  257  =

ab69bde6b2e9c37 Johannes Berg  2013-06-17  258  		length =3D ALX_GET_FIELD(=
le32_to_cpu(rrd->word3),
ab69bde6b2e9c37 Johannes Berg  2013-06-17  259  				       RRD_PKTLEN) - ET=
H_FCS_LEN;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  260  		skb_put(skb, length);
702e84185f47245 Tobias Regnery 2016-11-15 @261  		skb->protocol =3D eth_typ=
e_trans(skb, rxq->netdev);
ab69bde6b2e9c37 Johannes Berg  2013-06-17  262  =

ab69bde6b2e9c37 Johannes Berg  2013-06-17  263  		skb_checksum_none_assert(=
skb);
ab69bde6b2e9c37 Johannes Berg  2013-06-17  264  		if (alx->dev->features & =
NETIF_F_RXCSUM &&
ab69bde6b2e9c37 Johannes Berg  2013-06-17  265  		    !(rrd->word3 & (cpu_t=
o_le32(1 << RRD_ERR_L4_SHIFT) |
ab69bde6b2e9c37 Johannes Berg  2013-06-17  266  				    cpu_to_le32(1 << RR=
D_ERR_IPV4_SHIFT)))) {
ab69bde6b2e9c37 Johannes Berg  2013-06-17  267  			switch (ALX_GET_FIELD(le=
32_to_cpu(rrd->word2),
ab69bde6b2e9c37 Johannes Berg  2013-06-17  268  					      RRD_PID)) {
ab69bde6b2e9c37 Johannes Berg  2013-06-17  269  			case RRD_PID_IPV6UDP:
ab69bde6b2e9c37 Johannes Berg  2013-06-17  270  			case RRD_PID_IPV4UDP:
ab69bde6b2e9c37 Johannes Berg  2013-06-17  271  			case RRD_PID_IPV4TCP:
ab69bde6b2e9c37 Johannes Berg  2013-06-17  272  			case RRD_PID_IPV6TCP:
ab69bde6b2e9c37 Johannes Berg  2013-06-17  273  				skb->ip_summed =3D CHEC=
KSUM_UNNECESSARY;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  274  				break;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  275  			}
ab69bde6b2e9c37 Johannes Berg  2013-06-17  276  		}
ab69bde6b2e9c37 Johannes Berg  2013-06-17  277  =

702e84185f47245 Tobias Regnery 2016-11-15  278  		napi_gro_receive(&rxq->np=
->napi, skb);
7a05dc64e2e4c61 Eric Dumazet   2015-01-11  279  		work++;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  280  =

ab69bde6b2e9c37 Johannes Berg  2013-06-17  281  next_pkt:
702e84185f47245 Tobias Regnery 2016-11-15  282  		if (++rxq->read_idx =3D=
=3D rxq->count)
ab69bde6b2e9c37 Johannes Berg  2013-06-17  283  			rxq->read_idx =3D 0;
702e84185f47245 Tobias Regnery 2016-11-15  284  		if (++rxq->rrd_read_idx =
=3D=3D rxq->count)
ab69bde6b2e9c37 Johannes Berg  2013-06-17  285  			rxq->rrd_read_idx =3D 0;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  286  =

ab69bde6b2e9c37 Johannes Berg  2013-06-17  287  		if (++rfd_cleaned > ALX_R=
X_ALLOC_THRESH)
ab69bde6b2e9c37 Johannes Berg  2013-06-17  288  			rfd_cleaned -=3D alx_ref=
ill_rx_ring(alx, GFP_ATOMIC);
ab69bde6b2e9c37 Johannes Berg  2013-06-17  289  	}
ab69bde6b2e9c37 Johannes Berg  2013-06-17  290  =

ab69bde6b2e9c37 Johannes Berg  2013-06-17  291  	if (rfd_cleaned)
ab69bde6b2e9c37 Johannes Berg  2013-06-17  292  		alx_refill_rx_ring(alx, G=
FP_ATOMIC);
ab69bde6b2e9c37 Johannes Berg  2013-06-17  293  =

7a05dc64e2e4c61 Eric Dumazet   2015-01-11  294  	return work;
ab69bde6b2e9c37 Johannes Berg  2013-06-17  295  }
ab69bde6b2e9c37 Johannes Berg  2013-06-17  296  =


:::::: The code at line 261 was first introduced by commit
:::::: 702e84185f472457912c641d8c0cc0cc786310eb alx: switch to per queue da=
ta structures

:::::: TO: Tobias Regnery <tobias.regnery@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3295605951895323070==--

