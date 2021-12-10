Content-Type: multipart/mixed; boundary="===============3061685372466068308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2316/5842] drivers/net/ethernet/atheros/alx/main.c:261:17: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Fri, 10 Dec 2021 11:45:04 +0800
Message-ID: <202112101100.fGvEVwNK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3061685372466068308==
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
head:   4eee8d0b64ecc3231040fa68ba750317ffca5c52
commit: 03f61041c17914355dde7261be9ccdc821ddd454 [2316/5842] skbuff: Switch=
 structure bounds to struct_group()
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-c001-20211130 (https://download.01.org/0day-ci/arch=
ive/20211210/202112101100.fGvEVwNK-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D03f61041c17914355dde7261be9ccdc821ddd454
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 03f61041c17914355dde7261be9ccdc821ddd454
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                  ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/llc/llc_conn.c:488:2: note: Assuming the condition is true
           sk_nulls_for_each_rcu(rc, node, laddr_hb) {
           ^
   include/net/sock.h:816:2: note: expanded from macro 'sk_nulls_for_each_r=
cu'
           hlist_nulls_for_each_entry_rcu(__sk, node, list, sk_nulls_node)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist_nulls.h:170:4: note: expanded from macro 'hlist_nu=
lls_for_each_entry_rcu'
                   (!is_a_nulls(pos)) &&                                   =
        \
                    ^~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:488:2: note: Left side of '&&' is true
           sk_nulls_for_each_rcu(rc, node, laddr_hb) {
           ^
   include/net/sock.h:816:2: note: expanded from macro 'sk_nulls_for_each_r=
cu'
           hlist_nulls_for_each_entry_rcu(__sk, node, list, sk_nulls_node)
           ^
   include/linux/rculist_nulls.h:170:3: note: expanded from macro 'hlist_nu=
lls_for_each_entry_rcu'
                   (!is_a_nulls(pos)) &&                                   =
        \
                   ^
   net/llc/llc_conn.c:488:2: note: Loop condition is true.  Entering loop b=
ody
           sk_nulls_for_each_rcu(rc, node, laddr_hb) {
           ^
   include/net/sock.h:816:2: note: expanded from macro 'sk_nulls_for_each_r=
cu'
           hlist_nulls_for_each_entry_rcu(__sk, node, list, sk_nulls_node)
           ^
   include/linux/rculist_nulls.h:168:2: note: expanded from macro 'hlist_nu=
lls_for_each_entry_rcu'
           for (({barrier();}),                                            =
        \
           ^
   net/llc/llc_conn.c:489:7: note: Calling 'llc_estab_match'
                   if (llc_estab_match(sap, daddr, laddr, rc)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:460:9: note: Assuming 'llc->laddr.lsap' is equal to '=
laddr->lsap'
           return llc->laddr.lsap =3D=3D laddr->lsap &&
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:460:9: note: Left side of '&&' is true
   net/llc/llc_conn.c:461:3: note: Assuming 'llc->daddr.lsap' is equal to '=
daddr->lsap'
                   llc->daddr.lsap =3D=3D daddr->lsap &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:460:9: note: Left side of '&&' is true
           return llc->laddr.lsap =3D=3D laddr->lsap &&
                  ^
   net/llc/llc_conn.c:460:9: note: Left side of '&&' is true
   net/llc/llc_conn.c:463:3: note: Calling 'ether_addr_equal'
                   ether_addr_equal(llc->daddr.mac, daddr->mac);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/etherdevice.h:349:36: note: The right operand of '^' is a =
garbage value
           u32 fold =3D ((*(const u32 *)addr1) ^ (*(const u32 *)addr2)) |
                                             ^  ~~~~~~~~~~~~~~~~~~~
   include/linux/jhash.h:95:25: warning: The left operand of '<<' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           case 6:  b +=3D (u32)k[5]<<8;     fallthrough;
                                  ^
   net/llc/llc_conn.c:776:2: note: Calling 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, daddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:278:6: note: Assuming the condition is false
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:278:2: note: Taking false branch
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
           ^
   net/llc/llc_conn.c:776:2: note: Returning from 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, daddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:779:7: note: Calling '__llc_lookup'
           sk =3D __llc_lookup(sap, &saddr, &daddr);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:599:20: note: Calling '__llc_lookup_established'
           struct sock *sk =3D __llc_lookup_established(sap, daddr, laddr);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:483:13: note: Calling 'llc_sk_laddr_hashfn'
           int slot =3D llc_sk_laddr_hashfn(sap, laddr);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc.h:83:17: note: Calling 'jhash'
           return hash_32(jhash(laddr->mac, sizeof(laddr->mac), 0),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jhash.h:79:2: note: Loop condition is false. Execution con=
tinues on line 88
           while (length > 12) {
           ^
   include/linux/jhash.h:88:2: note: Control jumps to 'case 6:'  at line 95
           switch (length) {
           ^
   include/linux/jhash.h:95:25: note: The left operand of '<<' is a garbage=
 value
           case 6:  b +=3D (u32)k[5]<<8;     fallthrough;
                              ~~~~^
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
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
   drivers/net/ethernet/atheros/alx/main.c:247:3: note: Loop condition is f=
alse.  Exiting loop
                   dma_unmap_len_set(rxb, size, 0);
                   ^
   include/linux/dma-mapping.h:596:50: note: expanded from macro 'dma_unmap=
_len_set'
   #define dma_unmap_len_set(PTR, LEN_NAME, VAL)    do { } while (0)
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

vim +261 drivers/net/ethernet/atheros/alx/main.c

ab69bde6b2e9c3 Johannes Berg  2013-06-17  216  =

702e84185f4724 Tobias Regnery 2016-11-15  217  static int alx_clean_rx_irq(=
struct alx_rx_queue *rxq, int budget)
ab69bde6b2e9c3 Johannes Berg  2013-06-17  218  {
702e84185f4724 Tobias Regnery 2016-11-15  219  	struct alx_priv *alx;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  220  	struct alx_rrd *rrd;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  221  	struct alx_buffer *rxb;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  222  	struct sk_buff *skb;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  223  	u16 length, rfd_cleaned =3D=
 0;
7a05dc64e2e4c6 Eric Dumazet   2015-01-11  224  	int work =3D 0;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  225  =

702e84185f4724 Tobias Regnery 2016-11-15  226  	alx =3D netdev_priv(rxq->ne=
tdev);
702e84185f4724 Tobias Regnery 2016-11-15  227  =

7a05dc64e2e4c6 Eric Dumazet   2015-01-11  228  	while (work < budget) {
ab69bde6b2e9c3 Johannes Berg  2013-06-17  229  		rrd =3D &rxq->rrd[rxq->rrd=
_read_idx];
ab69bde6b2e9c3 Johannes Berg  2013-06-17  230  		if (!(rrd->word3 & cpu_to_=
le32(1 << RRD_UPDATED_SHIFT)))
ab69bde6b2e9c3 Johannes Berg  2013-06-17  231  			break;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  232  		rrd->word3 &=3D ~cpu_to_le=
32(1 << RRD_UPDATED_SHIFT);
ab69bde6b2e9c3 Johannes Berg  2013-06-17  233  =

ab69bde6b2e9c3 Johannes Berg  2013-06-17  234  		if (ALX_GET_FIELD(le32_to_=
cpu(rrd->word0),
ab69bde6b2e9c3 Johannes Berg  2013-06-17  235  				  RRD_SI) !=3D rxq->read=
_idx ||
ab69bde6b2e9c3 Johannes Berg  2013-06-17  236  		    ALX_GET_FIELD(le32_to_=
cpu(rrd->word0),
ab69bde6b2e9c3 Johannes Berg  2013-06-17  237  				  RRD_NOR) !=3D 1) {
ab69bde6b2e9c3 Johannes Berg  2013-06-17  238  			alx_schedule_reset(alx);
7a05dc64e2e4c6 Eric Dumazet   2015-01-11  239  			return work;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  240  		}
ab69bde6b2e9c3 Johannes Berg  2013-06-17  241  =

ab69bde6b2e9c3 Johannes Berg  2013-06-17  242  		rxb =3D &rxq->bufs[rxq->re=
ad_idx];
702e84185f4724 Tobias Regnery 2016-11-15  243  		dma_unmap_single(rxq->dev,
ab69bde6b2e9c3 Johannes Berg  2013-06-17  244  				 dma_unmap_addr(rxb, dma=
),
ab69bde6b2e9c3 Johannes Berg  2013-06-17  245  				 dma_unmap_len(rxb, size=
),
ab69bde6b2e9c3 Johannes Berg  2013-06-17  246  				 DMA_FROM_DEVICE);
ab69bde6b2e9c3 Johannes Berg  2013-06-17  247  		dma_unmap_len_set(rxb, siz=
e, 0);
ab69bde6b2e9c3 Johannes Berg  2013-06-17  248  		skb =3D rxb->skb;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  249  		rxb->skb =3D NULL;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  250  =

ab69bde6b2e9c3 Johannes Berg  2013-06-17  251  		if (rrd->word3 & cpu_to_le=
32(1 << RRD_ERR_RES_SHIFT) ||
ab69bde6b2e9c3 Johannes Berg  2013-06-17  252  		    rrd->word3 & cpu_to_le=
32(1 << RRD_ERR_LEN_SHIFT)) {
ab69bde6b2e9c3 Johannes Berg  2013-06-17  253  			rrd->word3 =3D 0;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  254  			dev_kfree_skb_any(skb);
ab69bde6b2e9c3 Johannes Berg  2013-06-17  255  			goto next_pkt;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  256  		}
ab69bde6b2e9c3 Johannes Berg  2013-06-17  257  =

ab69bde6b2e9c3 Johannes Berg  2013-06-17  258  		length =3D ALX_GET_FIELD(l=
e32_to_cpu(rrd->word3),
ab69bde6b2e9c3 Johannes Berg  2013-06-17  259  				       RRD_PKTLEN) - ETH=
_FCS_LEN;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  260  		skb_put(skb, length);
702e84185f4724 Tobias Regnery 2016-11-15 @261  		skb->protocol =3D eth_type=
_trans(skb, rxq->netdev);
ab69bde6b2e9c3 Johannes Berg  2013-06-17  262  =

ab69bde6b2e9c3 Johannes Berg  2013-06-17  263  		skb_checksum_none_assert(s=
kb);
ab69bde6b2e9c3 Johannes Berg  2013-06-17  264  		if (alx->dev->features & N=
ETIF_F_RXCSUM &&
ab69bde6b2e9c3 Johannes Berg  2013-06-17  265  		    !(rrd->word3 & (cpu_to=
_le32(1 << RRD_ERR_L4_SHIFT) |
ab69bde6b2e9c3 Johannes Berg  2013-06-17  266  				    cpu_to_le32(1 << RRD=
_ERR_IPV4_SHIFT)))) {
ab69bde6b2e9c3 Johannes Berg  2013-06-17  267  			switch (ALX_GET_FIELD(le3=
2_to_cpu(rrd->word2),
ab69bde6b2e9c3 Johannes Berg  2013-06-17  268  					      RRD_PID)) {
ab69bde6b2e9c3 Johannes Berg  2013-06-17  269  			case RRD_PID_IPV6UDP:
ab69bde6b2e9c3 Johannes Berg  2013-06-17  270  			case RRD_PID_IPV4UDP:
ab69bde6b2e9c3 Johannes Berg  2013-06-17  271  			case RRD_PID_IPV4TCP:
ab69bde6b2e9c3 Johannes Berg  2013-06-17  272  			case RRD_PID_IPV6TCP:
ab69bde6b2e9c3 Johannes Berg  2013-06-17  273  				skb->ip_summed =3D CHECK=
SUM_UNNECESSARY;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  274  				break;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  275  			}
ab69bde6b2e9c3 Johannes Berg  2013-06-17  276  		}
ab69bde6b2e9c3 Johannes Berg  2013-06-17  277  =

702e84185f4724 Tobias Regnery 2016-11-15  278  		napi_gro_receive(&rxq->np-=
>napi, skb);
7a05dc64e2e4c6 Eric Dumazet   2015-01-11  279  		work++;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  280  =

ab69bde6b2e9c3 Johannes Berg  2013-06-17  281  next_pkt:
702e84185f4724 Tobias Regnery 2016-11-15  282  		if (++rxq->read_idx =3D=3D=
 rxq->count)
ab69bde6b2e9c3 Johannes Berg  2013-06-17  283  			rxq->read_idx =3D 0;
702e84185f4724 Tobias Regnery 2016-11-15  284  		if (++rxq->rrd_read_idx =
=3D=3D rxq->count)
ab69bde6b2e9c3 Johannes Berg  2013-06-17  285  			rxq->rrd_read_idx =3D 0;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  286  =

ab69bde6b2e9c3 Johannes Berg  2013-06-17  287  		if (++rfd_cleaned > ALX_RX=
_ALLOC_THRESH)
ab69bde6b2e9c3 Johannes Berg  2013-06-17  288  			rfd_cleaned -=3D alx_refi=
ll_rx_ring(alx, GFP_ATOMIC);
ab69bde6b2e9c3 Johannes Berg  2013-06-17  289  	}
ab69bde6b2e9c3 Johannes Berg  2013-06-17  290  =

ab69bde6b2e9c3 Johannes Berg  2013-06-17  291  	if (rfd_cleaned)
ab69bde6b2e9c3 Johannes Berg  2013-06-17  292  		alx_refill_rx_ring(alx, GF=
P_ATOMIC);
ab69bde6b2e9c3 Johannes Berg  2013-06-17  293  =

7a05dc64e2e4c6 Eric Dumazet   2015-01-11  294  	return work;
ab69bde6b2e9c3 Johannes Berg  2013-06-17  295  }
ab69bde6b2e9c3 Johannes Berg  2013-06-17  296  =


:::::: The code at line 261 was first introduced by commit
:::::: 702e84185f472457912c641d8c0cc0cc786310eb alx: switch to per queue da=
ta structures

:::::: TO: Tobias Regnery <tobias.regnery@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3061685372466068308==--

