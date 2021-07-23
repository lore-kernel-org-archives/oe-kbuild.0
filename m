Content-Type: multipart/mixed; boundary="===============3836397439996488415=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asm-generic:network-ioctl-v6 23/37] drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2206 cxgb_siocdevprivate() warn: potential spectre issue 'adapter->params.sge.qset' [r] (local cap)
Date: Fri, 23 Jul 2021 14:01:14 +0800
Message-ID: <202107231455.Lwg5NKpj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3836397439996488415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arch(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.gi=
t network-ioctl-v6
head:   53ee412663f70832b994bdeeb5f72a928764ffe3
commit: 1e44deef61cb16a66cc238ab857b027c600e29a4 [23/37] cxgb3: use ndo_sio=
cdevprivate
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-m001-20210723 (attached as .config)
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2206 cxgb_siocdevprivate() =
warn: potential spectre issue 'adapter->params.sge.qset' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2224 cxgb_siocdevprivate() =
warn: potential spectre issue 'adapter->sge.qs' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2296 cxgb_siocdevprivate() =
warn: potential spectre issue 'adapter->msix_info' [r]

vim +2206 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2137  =

1e44deef61cb16 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergman=
n       2020-11-06  2138  static int cxgb_siocdevprivate(struct net_device =
*dev,
1e44deef61cb16 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergman=
n       2020-11-06  2139  			       struct ifreq *ifreq,
1e44deef61cb16 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergman=
n       2020-11-06  2140  			       void __user *useraddr,
1e44deef61cb16 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergman=
n       2020-11-06  2141  			       int cmd)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2142  {
5fbf816fe7d72b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-08-29  2143  	struct port_info *pi =3D netdev_priv(dev);
5fbf816fe7d72b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-08-29  2144  	struct adapter *adapter =3D pi->adapter;
5fbf816fe7d72b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-08-29  2145  	int ret;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2146  =

1e44deef61cb16 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergman=
n       2020-11-06  2147  	if (cmd !=3D SIOCCHIOCTL)
1e44deef61cb16 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergman=
n       2020-11-06  2148  		return -EOPNOTSUPP;
1e44deef61cb16 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergman=
n       2020-11-06  2149  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2150  	if (copy_from_user(&cmd, useraddr, sizeof(cmd)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2151  		return -EFAULT;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2152  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2153  	switch (cmd) {
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2154  	case CHELSIO_SET_QSET_PARAMS:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2155  		int i;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2156  		struct qset_params *q;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2157  		struct ch_qset_params t;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2158  		int q1 =3D pi->first_qset;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2159  		int nqsets =3D pi->nqsets;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2160  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2161  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2162  			return -EPERM;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2163  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2164  			return -EFAULT;
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2165  		if (t.cmd !=3D CHELSIO_SET_QSET_PARAMS)
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2166  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2167  		if (t.qset_idx >=3D SGE_QSETS)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2168  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2169  		if (!in_range(t.intr_lat, 0, M_NEWTIMER) ||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2170  		    !in_range(t.cong_thres, 0, 255) ||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2171  		    !in_range(t.txq_size[0], MIN_TXQ_ENTRIES,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2172  			      MAX_TXQ_ENTRIES) ||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2173  		    !in_range(t.txq_size[1], MIN_TXQ_ENTRIES,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2174  			      MAX_TXQ_ENTRIES) ||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2175  		    !in_range(t.txq_size[2], MIN_CTRL_TXQ_ENTRI=
ES,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2176  			      MAX_CTRL_TXQ_ENTRIES) ||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2177  		    !in_range(t.fl_size[0], MIN_FL_ENTRIES,
8e95a2026f3b43 drivers/net/cxgb3/cxgb3_main.c                  Joe Perches =
        2009-12-03  2178  			      MAX_RX_BUFFERS) ||
8e95a2026f3b43 drivers/net/cxgb3/cxgb3_main.c                  Joe Perches =
        2009-12-03  2179  		    !in_range(t.fl_size[1], MIN_FL_ENTRIES,
8e95a2026f3b43 drivers/net/cxgb3/cxgb3_main.c                  Joe Perches =
        2009-12-03  2180  			      MAX_RX_JUMBO_BUFFERS) ||
8e95a2026f3b43 drivers/net/cxgb3/cxgb3_main.c                  Joe Perches =
        2009-12-03  2181  		    !in_range(t.rspq_size, MIN_RSPQ_ENTRIES,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2182  			      MAX_RSPQ_ENTRIES))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2183  			return -EINVAL;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2184  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2185  		if ((adapter->flags & FULL_INIT_DONE) &&
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2186  			(t.rspq_size >=3D 0 || t.fl_size[0] >=3D 0 ||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2187  			t.fl_size[1] >=3D 0 || t.txq_size[0] >=3D 0 ||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2188  			t.txq_size[1] >=3D 0 || t.txq_size[2] >=3D 0 ||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2189  			t.polling >=3D 0 || t.cong_thres >=3D 0))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2190  			return -EBUSY;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2191  =

8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2192  		/* Allow setting of any available qset when off=
load enabled */
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2193  		if (test_bit(OFFLOAD_DEVMAP_BIT, &adapter->open=
_device_map)) {
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2194  			q1 =3D 0;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2195  			for_each_port(adapter, i) {
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2196  				pi =3D adap2pinfo(adapter, i);
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2197  				nqsets +=3D pi->first_qset + pi->nqsets;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2198  			}
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2199  		}
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2200  =

8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2201  		if (t.qset_idx < q1)
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2202  			return -EINVAL;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2203  		if (t.qset_idx > q1 + nqsets - 1)
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2204  			return -EINVAL;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2205  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18 @2206  		q =3D &adapter->params.sge.qset[t.qset_idx];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2207  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2208  		if (t.rspq_size >=3D 0)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2209  			q->rspq_size =3D t.rspq_size;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2210  		if (t.fl_size[0] >=3D 0)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2211  			q->fl_size =3D t.fl_size[0];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2212  		if (t.fl_size[1] >=3D 0)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2213  			q->jumbo_size =3D t.fl_size[1];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2214  		if (t.txq_size[0] >=3D 0)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2215  			q->txq_size[0] =3D t.txq_size[0];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2216  		if (t.txq_size[1] >=3D 0)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2217  			q->txq_size[1] =3D t.txq_size[1];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2218  		if (t.txq_size[2] >=3D 0)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2219  			q->txq_size[2] =3D t.txq_size[2];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2220  		if (t.cong_thres >=3D 0)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2221  			q->cong_thres =3D t.cong_thres;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2222  		if (t.intr_lat >=3D 0) {
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2223  			struct sge_qset *qs =3D
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18 @2224  				&adapter->sge.qs[t.qset_idx];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2225  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2226  			q->coalesce_usecs =3D t.intr_lat;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2227  			t3_update_qset_coalesce(qs, q);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2228  		}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2229  		if (t.polling >=3D 0) {
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2230  			if (adapter->flags & USING_MSIX)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2231  				q->polling =3D t.polling;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2232  			else {
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2233  				/* No polling with INTx for T3A */
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2234  				if (adapter->params.rev =3D=3D 0 &&
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2235  					!(adapter->flags & USING_MSI))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2236  					t.polling =3D 0;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2237  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2238  				for (i =3D 0; i < SGE_QSETS; i++) {
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2239  					q =3D &adapter->params.sge.
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2240  						qset[i];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2241  					q->polling =3D t.polling;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2242  				}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2243  			}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2244  		}
d2fe2755342b30 drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82 =
Miros=C5=82aw     2011-04-17  2245  =

d2fe2755342b30 drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82 =
Miros=C5=82aw     2011-04-17  2246  		if (t.lro >=3D 0) {
d2fe2755342b30 drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82 =
Miros=C5=82aw     2011-04-17  2247  			if (t.lro)
d2fe2755342b30 drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82 =
Miros=C5=82aw     2011-04-17  2248  				dev->wanted_features |=3D NETIF_F_G=
RO;
d2fe2755342b30 drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82 =
Miros=C5=82aw     2011-04-17  2249  			else
d2fe2755342b30 drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82 =
Miros=C5=82aw     2011-04-17  2250  				dev->wanted_features &=3D ~NETIF_F_=
GRO;
d2fe2755342b30 drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82 =
Miros=C5=82aw     2011-04-17  2251  			netdev_update_features(dev);
d2fe2755342b30 drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82 =
Miros=C5=82aw     2011-04-17  2252  		}
04ecb07241d873 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-28  2253  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2254  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2255  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2256  	case CHELSIO_GET_QSET_PARAMS:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2257  		struct qset_params *q;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2258  		struct ch_qset_params t;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2259  		int q1 =3D pi->first_qset;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2260  		int nqsets =3D pi->nqsets;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2261  		int i;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2262  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2263  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2264  			return -EFAULT;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2265  =

2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2266  		if (t.cmd !=3D CHELSIO_GET_QSET_PARAMS)
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2267  			return -EINVAL;
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2268  =

8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2269  		/* Display qsets for all ports when offload ena=
bled */
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2270  		if (test_bit(OFFLOAD_DEVMAP_BIT, &adapter->open=
_device_map)) {
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2271  			q1 =3D 0;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2272  			for_each_port(adapter, i) {
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2273  				pi =3D adap2pinfo(adapter, i);
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2274  				nqsets =3D pi->first_qset + pi->nqsets;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2275  			}
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2276  		}
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2277  =

8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2278  		if (t.qset_idx >=3D nqsets)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2279  			return -EINVAL;
676bcfece19f83 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Gustavo A. R=
. Silva 2018-07-16  2280  		t.qset_idx =3D array_index_nospec(t.qset_idx, n=
qsets);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2281  =

8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2282  		q =3D &adapter->params.sge.qset[q1 + t.qset_idx=
];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2283  		t.rspq_size =3D q->rspq_size;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2284  		t.txq_size[0] =3D q->txq_size[0];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2285  		t.txq_size[1] =3D q->txq_size[1];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2286  		t.txq_size[2] =3D q->txq_size[2];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2287  		t.fl_size[0] =3D q->fl_size;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2288  		t.fl_size[1] =3D q->jumbo_size;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2289  		t.polling =3D q->polling;
d2fe2755342b30 drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82 =
Miros=C5=82aw     2011-04-17  2290  		t.lro =3D !!(dev->features & NETIF_F_=
GRO);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2291  		t.intr_lat =3D q->coalesce_usecs;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2292  		t.cong_thres =3D q->cong_thres;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2293  		t.qnum =3D q1;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2294  =

8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2295  		if (adapter->flags & USING_MSIX)
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08 @2296  			t.vector =3D adapter->msix_info[q1 + t.qset_id=
x + 1].vec;
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2297  		else
8c26376112fb4b drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2008-10-08  2298  			t.vector =3D adapter->pdev->irq;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2299  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2300  		if (copy_to_user(useraddr, &t, sizeof(t)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2301  			return -EFAULT;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2302  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2303  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2304  	case CHELSIO_SET_QSET_NUM:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2305  		struct ch_reg edata;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2306  		unsigned int i, first_qset =3D 0, other_qsets =
=3D 0;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2307  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2308  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2309  			return -EPERM;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2310  		if (adapter->flags & FULL_INIT_DONE)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2311  			return -EBUSY;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2312  		if (copy_from_user(&edata, useraddr, sizeof(eda=
ta)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2313  			return -EFAULT;
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2314  		if (edata.cmd !=3D CHELSIO_SET_QSET_NUM)
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2315  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2316  		if (edata.val < 1 ||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2317  			(edata.val > 1 && !(adapter->flags & USING_MSI=
X)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2318  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2319  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2320  		for_each_port(adapter, i)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2321  			if (adapter->port[i] && adapter->port[i] !=3D =
dev)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2322  				other_qsets +=3D adap2pinfo(adapter, i)->nqse=
ts;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2323  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2324  		if (edata.val + other_qsets > SGE_QSETS)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2325  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2326  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2327  		pi->nqsets =3D edata.val;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2328  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2329  		for_each_port(adapter, i)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2330  			if (adapter->port[i]) {
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2331  				pi =3D adap2pinfo(adapter, i);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2332  				pi->first_qset =3D first_qset;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2333  				first_qset +=3D pi->nqsets;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2334  			}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2335  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2336  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2337  	case CHELSIO_GET_QSET_NUM:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2338  		struct ch_reg edata;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2339  =

49c37c0334a9b8 drivers/net/cxgb3/cxgb3_main.c                  Dan Rosenber=
g       2010-09-15  2340  		memset(&edata, 0, sizeof(struct ch_reg));
49c37c0334a9b8 drivers/net/cxgb3/cxgb3_main.c                  Dan Rosenber=
g       2010-09-15  2341  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2342  		edata.cmd =3D CHELSIO_GET_QSET_NUM;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2343  		edata.val =3D pi->nqsets;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2344  		if (copy_to_user(useraddr, &edata, sizeof(edata=
)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2345  			return -EFAULT;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2346  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2347  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2348  	case CHELSIO_LOAD_FW:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2349  		u8 *fw_data;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2350  		struct ch_mem_range t;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2351  =

1b3aa7afb60d34 drivers/net/cxgb3/cxgb3_main.c                  Alan Cox    =
        2008-04-29  2352  		if (!capable(CAP_SYS_RAWIO))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2353  			return -EPERM;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2354  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2355  			return -EFAULT;
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2356  		if (t.cmd !=3D CHELSIO_LOAD_FW)
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2357  			return -EINVAL;
1b3aa7afb60d34 drivers/net/cxgb3/cxgb3_main.c                  Alan Cox    =
        2008-04-29  2358  		/* Check t.len sanity ? */
c5dc9a3581f486 drivers/net/cxgb3/cxgb3_main.c                  Julia Lawall=
        2010-05-21  2359  		fw_data =3D memdup_user(useraddr + sizeof(t), t=
.len);
c5dc9a3581f486 drivers/net/cxgb3/cxgb3_main.c                  Julia Lawall=
        2010-05-21  2360  		if (IS_ERR(fw_data))
c5dc9a3581f486 drivers/net/cxgb3/cxgb3_main.c                  Julia Lawall=
        2010-05-21  2361  			return PTR_ERR(fw_data);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2362  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2363  		ret =3D t3_load_fw(adapter, fw_data, t.len);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2364  		kfree(fw_data);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2365  		if (ret)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2366  			return ret;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2367  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2368  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2369  	case CHELSIO_SETMTUTAB:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2370  		struct ch_mtus m;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2371  		int i;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2372  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2373  		if (!is_offload(adapter))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2374  			return -EOPNOTSUPP;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2375  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2376  			return -EPERM;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2377  		if (offload_running(adapter))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2378  			return -EBUSY;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2379  		if (copy_from_user(&m, useraddr, sizeof(m)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2380  			return -EFAULT;
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2381  		if (m.cmd !=3D CHELSIO_SETMTUTAB)
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2382  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2383  		if (m.nmtus !=3D NMTUS)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2384  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2385  		if (m.mtus[0] < 81)	/* accommodate SACK */
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2386  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2387  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2388  		/* MTUs must be in ascending order */
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2389  		for (i =3D 1; i < NMTUS; ++i)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2390  			if (m.mtus[i] < m.mtus[i - 1])
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2391  				return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2392  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2393  		memcpy(adapter->params.mtus, m.mtus,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2394  			sizeof(adapter->params.mtus));
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2395  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2396  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2397  	case CHELSIO_GET_PM:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2398  		struct tp_params *p =3D &adapter->params.tp;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2399  		struct ch_pm m =3D {.cmd =3D CHELSIO_GET_PM };
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2400  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2401  		if (!is_offload(adapter))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2402  			return -EOPNOTSUPP;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2403  		m.tx_pg_sz =3D p->tx_pg_size;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2404  		m.tx_num_pg =3D p->tx_num_pgs;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2405  		m.rx_pg_sz =3D p->rx_pg_size;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2406  		m.rx_num_pg =3D p->rx_num_pgs;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2407  		m.pm_total =3D p->pmtx_size + p->chan_rx_size *=
 p->nchan;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2408  		if (copy_to_user(useraddr, &m, sizeof(m)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2409  			return -EFAULT;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2410  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2411  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2412  	case CHELSIO_SET_PM:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2413  		struct ch_pm m;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2414  		struct tp_params *p =3D &adapter->params.tp;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2415  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2416  		if (!is_offload(adapter))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2417  			return -EOPNOTSUPP;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2418  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2419  			return -EPERM;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2420  		if (adapter->flags & FULL_INIT_DONE)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2421  			return -EBUSY;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2422  		if (copy_from_user(&m, useraddr, sizeof(m)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2423  			return -EFAULT;
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2424  		if (m.cmd !=3D CHELSIO_SET_PM)
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2425  			return -EINVAL;
d9da466a3ce2ac drivers/net/cxgb3/cxgb3_main.c                  vignesh babu=
        2007-07-09  2426  		if (!is_power_of_2(m.rx_pg_sz) ||
d9da466a3ce2ac drivers/net/cxgb3/cxgb3_main.c                  vignesh babu=
        2007-07-09  2427  			!is_power_of_2(m.tx_pg_sz))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2428  			return -EINVAL;	/* not power of 2 */
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2429  		if (!(m.rx_pg_sz & 0x14000))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2430  			return -EINVAL;	/* not 16KB or 64KB */
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2431  		if (!(m.tx_pg_sz & 0x1554000))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2432  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2433  		if (m.tx_num_pg =3D=3D -1)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2434  			m.tx_num_pg =3D p->tx_num_pgs;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2435  		if (m.rx_num_pg =3D=3D -1)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2436  			m.rx_num_pg =3D p->rx_num_pgs;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2437  		if (m.tx_num_pg % 24 || m.rx_num_pg % 24)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2438  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2439  		if (m.rx_num_pg * m.rx_pg_sz > p->chan_rx_size =
||
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2440  			m.tx_num_pg * m.tx_pg_sz > p->chan_tx_size)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2441  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2442  		p->rx_pg_size =3D m.rx_pg_sz;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2443  		p->tx_pg_size =3D m.tx_pg_sz;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2444  		p->rx_num_pgs =3D m.rx_num_pg;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2445  		p->tx_num_pgs =3D m.tx_num_pg;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2446  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2447  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2448  	case CHELSIO_GET_MEM:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2449  		struct ch_mem_range t;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2450  		struct mc7 *mem;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2451  		u64 buf[32];
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2452  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2453  		if (!is_offload(adapter))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2454  			return -EOPNOTSUPP;
3546d8f1bbe992 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Michael Elle=
rman    2020-01-24  2455  		if (!capable(CAP_NET_ADMIN))
3546d8f1bbe992 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Michael Elle=
rman    2020-01-24  2456  			return -EPERM;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2457  		if (!(adapter->flags & FULL_INIT_DONE))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2458  			return -EIO;	/* need the memory controllers */
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2459  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2460  			return -EFAULT;
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2461  		if (t.cmd !=3D CHELSIO_GET_MEM)
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2462  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2463  		if ((t.addr & 7) || (t.len & 7))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2464  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2465  		if (t.mem_id =3D=3D MEM_CM)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2466  			mem =3D &adapter->cm;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2467  		else if (t.mem_id =3D=3D MEM_PMRX)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2468  			mem =3D &adapter->pmrx;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2469  		else if (t.mem_id =3D=3D MEM_PMTX)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2470  			mem =3D &adapter->pmtx;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2471  		else
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2472  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2473  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2474  		/*
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2475  		 * Version scheme:
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2476  		 * bits 0..9: chip version
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2477  		 * bits 10..15: chip revision
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2478  		 */
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2479  		t.version =3D 3 | (adapter->params.rev << 10);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2480  		if (copy_to_user(useraddr, &t, sizeof(t)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2481  			return -EFAULT;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2482  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2483  		/*
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2484  		 * Read 256 bytes at a time as len can be large=
 and we don't
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2485  		 * want to use huge intermediate buffers.
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2486  		 */
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2487  		useraddr +=3D sizeof(t);	/* advance to start of=
 buffer */
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2488  		while (t.len) {
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2489  			unsigned int chunk =3D
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2490  				min_t(unsigned int, t.len, sizeof(buf));
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2491  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2492  			ret =3D
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2493  				t3_mc7_bd_read(mem, t.addr / 8, chunk / 8,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2494  						buf);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2495  			if (ret)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2496  				return ret;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2497  			if (copy_to_user(useraddr, buf, chunk))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2498  				return -EFAULT;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2499  			useraddr +=3D chunk;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2500  			t.addr +=3D chunk;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2501  			t.len -=3D chunk;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2502  		}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2503  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2504  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2505  	case CHELSIO_SET_TRACE_FILTER:{
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2506  		struct ch_trace t;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2507  		const struct trace_params *tp;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2508  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2509  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2510  			return -EPERM;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2511  		if (!offload_running(adapter))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2512  			return -EAGAIN;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2513  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2514  			return -EFAULT;
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2515  		if (t.cmd !=3D CHELSIO_SET_TRACE_FILTER)
2c05d88818ab65 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang =
        2018-10-05  2516  			return -EINVAL;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2517  =

4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2518  		tp =3D (const struct trace_params *)&t.sip;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2519  		if (t.config_tx)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2520  			t3_config_trace_filter(adapter, tp, 0,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2521  						t.invert_match,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2522  						t.trace_tx);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2523  		if (t.config_rx)
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2524  			t3_config_trace_filter(adapter, tp, 1,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2525  						t.invert_match,
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2526  						t.trace_rx);
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2527  		break;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2528  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2529  	default:
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2530  		return -EOPNOTSUPP;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2531  	}
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2532  	return 0;
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2533  }
4d22de3e6cc4a0 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray =
        2007-01-18  2534  =


:::::: The code@line 2206 was first introduced by commit
:::::: 4d22de3e6cc4a09c369b504cd8bcde3385a974cd Add support for the latest =
1G/10G Chelsio adapter, T3.

:::::: TO: Divy Le Ray <divy@chelsio.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3836397439996488415==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
m9w+yRBm4in/D1k4a0jUkwIA
--===============3836397439996488415==--

