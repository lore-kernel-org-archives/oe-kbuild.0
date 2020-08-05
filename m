Content-Type: multipart/mixed; boundary="===============5054589923665637918=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-linux-intel-lts:5.4/yocto 6911/8959] drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2209:12: sparse: sparse: context imbalance in 'stmmac_tx_clean' - different lock contexts for basic block
Date: Thu, 06 Aug 2020 03:47:04 +0800
Message-ID: <202008060327.O6GZOy1Q%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5054589923665637918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Wong, Vincent Por Yin" <vincent.por.yin.wong@intel.com>
CC: "Qin, Chao" <chao.qin@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   894da5cd0b768e16210c20d2316c196241df842a
commit: db7afc218c2a4976d1fbfa667352020fe9a5cb68 [6911/8959] net: stmmac: f=
ix AF_XDP entry/exit without using stmmac_reset
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-s002-20200805 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-117-g8c7aee71-dirty
        git checkout db7afc218c2a4976d1fbfa667352020fe9a5cb68
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1407:6: sparse: sparse=
: symbol 'stmmac_alloc_rx_buffers' was not declared. Should it be static?
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2778:27: sparse: spars=
e: incorrect type in assignment (different base types) @@     expected rest=
ricted __le32 [usertype] etdes4 @@     got unsigned long @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2778:27: sparse:     e=
xpected restricted __le32 [usertype] etdes4
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2778:27: sparse:     g=
ot unsigned long
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2779:27: sparse: spars=
e: incorrect type in assignment (different base types) @@     expected rest=
ricted __le32 [usertype] etdes5 @@     got unsigned long @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2779:27: sparse:     e=
xpected restricted __le32 [usertype] etdes5
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2779:27: sparse:     g=
ot unsigned long
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2780:27: sparse: spars=
e: invalid assignment: |=3D
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2780:27: sparse:    le=
ft side has type restricted __le32
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2780:27: sparse:    ri=
ght side has type unsigned long
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5618:5: sparse: sparse=
: symbol 'stmmac_xdp_xmit' was not declared. Should it be static?
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:6299:6: sparse: sparse=
: symbol 'stmmac_clean_all_tx_rings' was not declared. Should it be static?
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2209:12: sparse: spars=
e: context imbalance in 'stmmac_tx_clean' - different lock contexts for bas=
ic block

# https://github.com/intel/linux-intel-lts/commit/db7afc218c2a4976d1fbfa667=
352020fe9a5cb68
git remote add intel-linux-intel-lts https://github.com/intel/linux-intel-l=
ts.git
git remote update intel-linux-intel-lts
git checkout db7afc218c2a4976d1fbfa667352020fe9a5cb68
vim +/stmmac_tx_clean +2209 drivers/net/ethernet/stmicro/stmmac/stmmac_main=
.c

47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2202  =

47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2203  /**
732fdf0e5253e9d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2014-11-18  2204   * stmmac_tx_clean - to manage the transmission=
 completion
32ceabcad3c8abd drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2013-04-08  2205   * @priv: driver private structure
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2206   * @queue: TX queue index
732fdf0e5253e9d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2014-11-18  2207   * Description: it reclaims the transmit resour=
ces after transmission completes.
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2208   */
8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17 @2209  static int stmmac_tx_clean(struct stmmac_priv *=
priv, int budget, u32 queue)
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2210  {
56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2211  	struct stmmac_tx_queue *tx_q =3D get_tx_queue(=
priv, queue);
3897957494d979a drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Beniamino=
 Galvani  2015-01-21  2212  	unsigned int bytes_compl =3D 0, pkts_compl =3D=
 0;
8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17  2213  	unsigned int entry, count =3D 0;
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2214  =

56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2215  	if (!queue_is_xdp(priv, queue))
8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17  2216  		__netif_tx_lock_bh(netdev_get_tx_queue(priv->=
dev, queue));
a9097a9666fd7b0 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2011-10-18  2217  =

9125cdd1be11995 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2012-11-25  2218  	priv->xstats.tx_clean++;
9125cdd1be11995 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2012-11-25  2219  =

8d5f4b07174976c drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Bernd Edl=
inger     2017-10-21  2220  	entry =3D tx_q->dirty_tx;
8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17  2221  	while ((entry !=3D tx_q->cur_tx) && (count < b=
udget)) {
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2222  		struct sk_buff *skb =3D tx_q->tx_skbuff[entry=
];
c24602ef8664937 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2013-03-26  2223  		struct dma_desc *p;
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2224  		int status;
c24602ef8664937 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2013-03-26  2225  =

c24602ef8664937 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2013-03-26  2226  		if (priv->extend_desc)
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2227  			p =3D (struct dma_desc *)(tx_q->dma_etx + en=
try);
1df51f6ffc148f2 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Kweh Hock=
 Leong    2019-08-09  2228  		else if (priv->enhanced_tx_desc)
1df51f6ffc148f2 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Kweh Hock=
 Leong    2019-08-09  2229  			p =3D &(tx_q->dma_enhtx + entry)->basic;
c24602ef8664937 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2013-03-26  2230  		else
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2231  			p =3D tx_q->dma_tx + entry;
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2232  =

42de047d60bc5d8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-04-16  2233  		status =3D stmmac_tx_status(priv, &priv->dev-=
>stats,
42de047d60bc5d8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-04-16  2234  				&priv->xstats, p, priv->ioaddr);
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2235  		/* Check if the descriptor is owned by the DM=
A */
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2236  		if (unlikely(status & tx_dma_own))
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2237  			break;
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2238  =

8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17  2239  		count++;
8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17  2240  =

a6b25da5e7ba212 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Niklas Ca=
ssel      2018-02-26  2241  		/* Make sure descriptor fields are read after=
 reading
a6b25da5e7ba212 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Niklas Ca=
ssel      2018-02-26  2242  		 * the own bit.
a6b25da5e7ba212 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Niklas Ca=
ssel      2018-02-26  2243  		 */
a6b25da5e7ba212 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Niklas Ca=
ssel      2018-02-26  2244  		dma_rmb();
a6b25da5e7ba212 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Niklas Ca=
ssel      2018-02-26  2245  =

c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2246  		/* Just consider the last segment and ...*/
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2247  		if (likely(!(status & tx_not_ls))) {
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2248  			/* ... verify the status error condition */
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2249  			if (unlikely(status & tx_err)) {
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2250  				priv->dev->stats.tx_errors++;
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2251  			} else {
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2252  				priv->dev->stats.tx_packets++;
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2253  				priv->xstats.tx_pkt_n++;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2254  =

1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2255  				switch (queue) {
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2256  				case 0x0:
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2257  					priv->xstats.q0_tx_pkt_n++;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2258  					break;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2259  				case 0x1:
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2260  					priv->xstats.q1_tx_pkt_n++;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2261  					break;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2262  				case 0x2:
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2263  					priv->xstats.q2_tx_pkt_n++;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2264  					break;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2265  				case 0x3:
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2266  					priv->xstats.q3_tx_pkt_n++;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2267  					break;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2268  				case 0x4:
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2269  					priv->xstats.q4_tx_pkt_n++;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2270  					break;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2271  				case 0x5:
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2272  					priv->xstats.q5_tx_pkt_n++;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2273  					break;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2274  				case 0x6:
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2275  					priv->xstats.q6_tx_pkt_n++;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2276  					break;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2277  				case 0x7:
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2278  					priv->xstats.q7_tx_pkt_n++;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2279  					break;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2280  				default:
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2281  					break;
1669fca61b324c6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan, Tee =
Min       2019-08-15  2282  				}
c363b6586cd4244 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice G=
asnier    2016-02-29  2283  			}
21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2284  			if (!queue_is_xdp(priv, queue) &&
21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2285  			    skb_shinfo(skb)->tx_flags & SKBTX_IN_PRO=
GRESS) {
21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2286  				struct skb_shared_hwtstamps shhwtstamp;
21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2287  =

21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2288  				memset(&shhwtstamp, 0,
21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2289  				       sizeof(struct skb_shared_hwtstamps));
21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2290  				stmmac_get_tx_hwtstamp(priv, p,
21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2291  						       &shhwtstamp.hwtstamp);
21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2292  				skb_tstamp_tx(skb, &shhwtstamp);
21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2293  =

21bd120d3bd39c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-11-28  2294  			}
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2295  		}
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2296  =

ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2297  		if (likely(tx_q->tx_skbuff_dma[entry].buf)) {
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2298  			if (tx_q->tx_skbuff_dma[entry].map_as_page)
362b37be01edc74 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2014-08-27  2299  				dma_unmap_page(priv->device,
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2300  					       tx_q->tx_skbuff_dma[entry].buf,
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2301  					       tx_q->tx_skbuff_dma[entry].len,
362b37be01edc74 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2014-08-27  2302  					       DMA_TO_DEVICE);
362b37be01edc74 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2014-08-27  2303  			else
cf32deec16e4e8d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Rayagond =
Kokatanur 2013-03-26  2304  				dma_unmap_single(priv->device,
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2305  						 tx_q->tx_skbuff_dma[entry].buf,
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2306  						 tx_q->tx_skbuff_dma[entry].len,
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2307  						 DMA_TO_DEVICE);
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2308  			tx_q->tx_skbuff_dma[entry].buf =3D 0;
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2309  			tx_q->tx_skbuff_dma[entry].len =3D 0;
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2310  			tx_q->tx_skbuff_dma[entry].map_as_page =3D f=
alse;
cf32deec16e4e8d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Rayagond =
Kokatanur 2013-03-26  2311  		}
f748be531d7012c drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Alexandre=
 TORGUE   2016-04-01  2312  =

2c520b1c9cfa7d4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-04-16  2313  		stmmac_clean_desc3(priv, tx_q, p);
f748be531d7012c drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Alexandre=
 TORGUE   2016-04-01  2314  =

ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2315  		tx_q->tx_skbuff_dma[entry].last_segment =3D f=
alse;
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2316  		tx_q->tx_skbuff_dma[entry].is_jumbo =3D false;
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2317  =

47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2318  		if (likely(skb !=3D NULL)) {
3897957494d979a drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Beniamino=
 Galvani  2015-01-21  2319  			pkts_compl++;
3897957494d979a drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Beniamino=
 Galvani  2015-01-21  2320  			bytes_compl +=3D skb->len;
7c565c33464798b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Eric W. B=
iederman  2014-03-15  2321  			dev_consume_skb_any(skb);
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2322  			tx_q->tx_skbuff[entry] =3D NULL;
56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2323  		} else if (queue_is_xdp(priv, queue)) {
56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2324  			pkts_compl++;
56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2325  			bytes_compl +=3D tx_q->xdpf[entry]->len;
56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2326  			xdp_return_frame(tx_q->xdpf[entry]);
56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2327  			tx_q->xdpf[entry] =3D NULL;
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2328  		}
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2329  =

42de047d60bc5d8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-04-16  2330  		stmmac_release_tx_desc(priv, p, priv->mode);
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2331  =

b8a723a68f15af5 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song, Yoo=
ng Siang  2018-07-19  2332  		entry =3D STMMAC_GET_ENTRY(entry, priv->dma_t=
x_size);
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2333  	}
ce736788e8a92c1 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2334  	tx_q->dirty_tx =3D entry;
3897957494d979a drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Beniamino=
 Galvani  2015-01-21  2335  =

56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2336  	if (queue_is_xdp(priv, queue))
56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2337  		goto xdp_tx_done;
56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2338  =

c22a3f48ef99ea4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2339  	netdev_tx_completed_queue(netdev_get_tx_queue(=
priv->dev, queue),
c22a3f48ef99ea4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2340  				  pkts_compl, bytes_compl);
c22a3f48ef99ea4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2341  =

c22a3f48ef99ea4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2342  	if (unlikely(netif_tx_queue_stopped(netdev_get=
_tx_queue(priv->dev,
c22a3f48ef99ea4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2343  								queue))) &&
b8a723a68f15af5 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song, Yoo=
ng Siang  2018-07-19  2344  	    stmmac_tx_avail(priv, queue) > STMMAC_TX_T=
HRESH(priv)) {
3897957494d979a drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Beniamino=
 Galvani  2015-01-21  2345  =

b3e51069627e2b9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Cor=
entin     2016-11-16  2346  		netif_dbg(priv, tx_done, priv->dev,
b3e51069627e2b9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Cor=
entin     2016-11-16  2347  			  "%s: restart transmit\n", __func__);
c22a3f48ef99ea4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o         2017-04-06  2348  		netif_tx_wake_queue(netdev_get_tx_queue(priv-=
>dev, queue));
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2349  	}
d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2012-06-27  2350  =

56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2351  xdp_tx_done:
d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2012-06-27  2352  	if ((priv->eee_enabled) && (!priv->tx_path_in_=
lpi_mode)) {
d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2012-06-27  2353  		stmmac_enable_eee_mode(priv);
f5351ef73e476d7 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2013-06-18  2354  		mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T=
(eee_timer));
d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO 2012-06-27  2355  	}
8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17  2356  =

4ccb45857c2c077 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2019-02-19  2357  	/* We still have pending packets, let's call f=
or a new scheduling */
4ccb45857c2c077 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2019-02-19  2358  	if (tx_q->dirty_tx !=3D tx_q->cur_tx)
4ccb45857c2c077 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2019-02-19  2359  		mod_timer(&tx_q->txtimer, STMMAC_COAL_TIMER(1=
0));
4ccb45857c2c077 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2019-02-19  2360  =

56a2ef6888738a6 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong     2019-09-23  2361  	if (!queue_is_xdp(priv, queue))
8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17  2362  		__netif_tx_unlock_bh(netdev_get_tx_queue(priv=
->dev, queue));
8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17  2363  =

8fce3331702316d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u         2018-09-17  2364  	return count;
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2365  }
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro 2009-10-14  2366  =


:::::: The code at line 2209 was first introduced by commit
:::::: 8fce3331702316d4bcfeb0771c09ac75d2192bbc net: stmmac: Rework coalesc=
e timer and fix multi-queue races

:::::: TO: Jose Abreu <Jose.Abreu@synopsys.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5054589923665637918==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CdPW1r8A55fYj3wPAgA=
--===============5054589923665637918==--

