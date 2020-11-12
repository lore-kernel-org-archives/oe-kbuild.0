Content-Type: multipart/mixed; boundary="===============7539624521832484497=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arnd-playground:to-build 41/52] drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2206 cxgb_siocdevprivate() warn: potential spectre issue 'adapter->params.sge.qset' (local cap)
Date: Thu, 12 Nov 2020 16:43:49 +0800
Message-ID: <202011121636.J04aHPK4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7539624521832484497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 to-build
head:   011b1628940bc808cebef5f6a81b3a84bc8e7756
commit: dc1ec0d612aca0e773c0821125b4716d8787f9a6 [41/52] cxgb3: use ndo_sio=
cdevprivate
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-m001-20201111 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

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

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2137  =

dc1ec0d612aca0e drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergma=
nn       2020-11-06  2138  static int cxgb_siocdevprivate(struct net_device=
 *dev,
dc1ec0d612aca0e drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergma=
nn       2020-11-06  2139  			       struct ifreq *ifreq,
dc1ec0d612aca0e drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergma=
nn       2020-11-06  2140  			       void __user *useraddr,
dc1ec0d612aca0e drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergma=
nn       2020-11-06  2141  			       int cmd)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2142  {
5fbf816fe7d72bf drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-08-29  2143  	struct port_info *pi =3D netdev_priv(dev);
5fbf816fe7d72bf drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-08-29  2144  	struct adapter *adapter =3D pi->adapter;
5fbf816fe7d72bf drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-08-29  2145  	int ret;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2146  =

dc1ec0d612aca0e drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergma=
nn       2020-11-06  2147  	if (cmd !=3D SIOCCHIOCTL)
dc1ec0d612aca0e drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergma=
nn       2020-11-06  2148  		return -EOPNOTSUPP;
dc1ec0d612aca0e drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Arnd Bergma=
nn       2020-11-06  2149  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2150  	if (copy_from_user(&cmd, useraddr, sizeof(cmd)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2151  		return -EFAULT;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2152  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2153  	switch (cmd) {
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2154  	case CHELSIO_SET_QSET_PARAMS:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2155  		int i;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2156  		struct qset_params *q;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2157  		struct ch_qset_params t;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2158  		int q1 =3D pi->first_qset;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2159  		int nqsets =3D pi->nqsets;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2160  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2161  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2162  			return -EPERM;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2163  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2164  			return -EFAULT;
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2165  		if (t.cmd !=3D CHELSIO_SET_QSET_PARAMS)
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2166  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2167  		if (t.qset_idx >=3D SGE_QSETS)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2168  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2169  		if (!in_range(t.intr_lat, 0, M_NEWTIMER) ||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2170  		    !in_range(t.cong_thres, 0, 255) ||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2171  		    !in_range(t.txq_size[0], MIN_TXQ_ENTRIES,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2172  			      MAX_TXQ_ENTRIES) ||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2173  		    !in_range(t.txq_size[1], MIN_TXQ_ENTRIES,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2174  			      MAX_TXQ_ENTRIES) ||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2175  		    !in_range(t.txq_size[2], MIN_CTRL_TXQ_ENTR=
IES,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2176  			      MAX_CTRL_TXQ_ENTRIES) ||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2177  		    !in_range(t.fl_size[0], MIN_FL_ENTRIES,
8e95a2026f3b43f drivers/net/cxgb3/cxgb3_main.c                  Joe Perches=
         2009-12-03  2178  			      MAX_RX_BUFFERS) ||
8e95a2026f3b43f drivers/net/cxgb3/cxgb3_main.c                  Joe Perches=
         2009-12-03  2179  		    !in_range(t.fl_size[1], MIN_FL_ENTRIES,
8e95a2026f3b43f drivers/net/cxgb3/cxgb3_main.c                  Joe Perches=
         2009-12-03  2180  			      MAX_RX_JUMBO_BUFFERS) ||
8e95a2026f3b43f drivers/net/cxgb3/cxgb3_main.c                  Joe Perches=
         2009-12-03  2181  		    !in_range(t.rspq_size, MIN_RSPQ_ENTRIES,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2182  			      MAX_RSPQ_ENTRIES))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2183  			return -EINVAL;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2184  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2185  		if ((adapter->flags & FULL_INIT_DONE) &&
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2186  			(t.rspq_size >=3D 0 || t.fl_size[0] >=3D 0 ||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2187  			t.fl_size[1] >=3D 0 || t.txq_size[0] >=3D 0 ||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2188  			t.txq_size[1] >=3D 0 || t.txq_size[2] >=3D 0 =
||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2189  			t.polling >=3D 0 || t.cong_thres >=3D 0))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2190  			return -EBUSY;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2191  =

8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2192  		/* Allow setting of any available qset when of=
fload enabled */
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2193  		if (test_bit(OFFLOAD_DEVMAP_BIT, &adapter->ope=
n_device_map)) {
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2194  			q1 =3D 0;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2195  			for_each_port(adapter, i) {
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2196  				pi =3D adap2pinfo(adapter, i);
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2197  				nqsets +=3D pi->first_qset + pi->nqsets;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2198  			}
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2199  		}
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2200  =

8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2201  		if (t.qset_idx < q1)
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2202  			return -EINVAL;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2203  		if (t.qset_idx > q1 + nqsets - 1)
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2204  			return -EINVAL;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2205  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18 @2206  		q =3D &adapter->params.sge.qset[t.qset_idx];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2207  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2208  		if (t.rspq_size >=3D 0)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2209  			q->rspq_size =3D t.rspq_size;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2210  		if (t.fl_size[0] >=3D 0)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2211  			q->fl_size =3D t.fl_size[0];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2212  		if (t.fl_size[1] >=3D 0)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2213  			q->jumbo_size =3D t.fl_size[1];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2214  		if (t.txq_size[0] >=3D 0)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2215  			q->txq_size[0] =3D t.txq_size[0];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2216  		if (t.txq_size[1] >=3D 0)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2217  			q->txq_size[1] =3D t.txq_size[1];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2218  		if (t.txq_size[2] >=3D 0)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2219  			q->txq_size[2] =3D t.txq_size[2];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2220  		if (t.cong_thres >=3D 0)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2221  			q->cong_thres =3D t.cong_thres;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2222  		if (t.intr_lat >=3D 0) {
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2223  			struct sge_qset *qs =3D
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18 @2224  				&adapter->sge.qs[t.qset_idx];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2225  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2226  			q->coalesce_usecs =3D t.intr_lat;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2227  			t3_update_qset_coalesce(qs, q);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2228  		}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2229  		if (t.polling >=3D 0) {
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2230  			if (adapter->flags & USING_MSIX)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2231  				q->polling =3D t.polling;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2232  			else {
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2233  				/* No polling with INTx for T3A */
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2234  				if (adapter->params.rev =3D=3D 0 &&
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2235  					!(adapter->flags & USING_MSI))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2236  					t.polling =3D 0;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2237  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2238  				for (i =3D 0; i < SGE_QSETS; i++) {
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2239  					q =3D &adapter->params.sge.
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2240  						qset[i];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2241  					q->polling =3D t.polling;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2242  				}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2243  			}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2244  		}
d2fe2755342b30b drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82=
 Miros=C5=82aw     2011-04-17  2245  =

d2fe2755342b30b drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82=
 Miros=C5=82aw     2011-04-17  2246  		if (t.lro >=3D 0) {
d2fe2755342b30b drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82=
 Miros=C5=82aw     2011-04-17  2247  			if (t.lro)
d2fe2755342b30b drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82=
 Miros=C5=82aw     2011-04-17  2248  				dev->wanted_features |=3D NETIF_F_=
GRO;
d2fe2755342b30b drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82=
 Miros=C5=82aw     2011-04-17  2249  			else
d2fe2755342b30b drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82=
 Miros=C5=82aw     2011-04-17  2250  				dev->wanted_features &=3D ~NETIF_F=
_GRO;
d2fe2755342b30b drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82=
 Miros=C5=82aw     2011-04-17  2251  			netdev_update_features(dev);
d2fe2755342b30b drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82=
 Miros=C5=82aw     2011-04-17  2252  		}
04ecb07241d8731 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-28  2253  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2254  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2255  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2256  	case CHELSIO_GET_QSET_PARAMS:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2257  		struct qset_params *q;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2258  		struct ch_qset_params t;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2259  		int q1 =3D pi->first_qset;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2260  		int nqsets =3D pi->nqsets;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2261  		int i;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2262  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2263  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2264  			return -EFAULT;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2265  =

2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2266  		if (t.cmd !=3D CHELSIO_GET_QSET_PARAMS)
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2267  			return -EINVAL;
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2268  =

8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2269  		/* Display qsets for all ports when offload en=
abled */
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2270  		if (test_bit(OFFLOAD_DEVMAP_BIT, &adapter->ope=
n_device_map)) {
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2271  			q1 =3D 0;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2272  			for_each_port(adapter, i) {
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2273  				pi =3D adap2pinfo(adapter, i);
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2274  				nqsets =3D pi->first_qset + pi->nqsets;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2275  			}
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2276  		}
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2277  =

8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2278  		if (t.qset_idx >=3D nqsets)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2279  			return -EINVAL;
676bcfece19f836 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Gustavo A. =
R. Silva 2018-07-16  2280  		t.qset_idx =3D array_index_nospec(t.qset_idx, =
nqsets);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2281  =

8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2282  		q =3D &adapter->params.sge.qset[q1 + t.qset_id=
x];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2283  		t.rspq_size =3D q->rspq_size;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2284  		t.txq_size[0] =3D q->txq_size[0];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2285  		t.txq_size[1] =3D q->txq_size[1];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2286  		t.txq_size[2] =3D q->txq_size[2];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2287  		t.fl_size[0] =3D q->fl_size;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2288  		t.fl_size[1] =3D q->jumbo_size;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2289  		t.polling =3D q->polling;
d2fe2755342b30b drivers/net/cxgb3/cxgb3_main.c                  Micha=C5=82=
 Miros=C5=82aw     2011-04-17  2290  		t.lro =3D !!(dev->features & NETIF_F=
_GRO);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2291  		t.intr_lat =3D q->coalesce_usecs;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2292  		t.cong_thres =3D q->cong_thres;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2293  		t.qnum =3D q1;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2294  =

8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2295  		if (adapter->flags & USING_MSIX)
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08 @2296  			t.vector =3D adapter->msix_info[q1 + t.qset_i=
dx + 1].vec;
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2297  		else
8c26376112fb4b8 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2008-10-08  2298  			t.vector =3D adapter->pdev->irq;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2299  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2300  		if (copy_to_user(useraddr, &t, sizeof(t)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2301  			return -EFAULT;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2302  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2303  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2304  	case CHELSIO_SET_QSET_NUM:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2305  		struct ch_reg edata;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2306  		unsigned int i, first_qset =3D 0, other_qsets =
=3D 0;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2307  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2308  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2309  			return -EPERM;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2310  		if (adapter->flags & FULL_INIT_DONE)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2311  			return -EBUSY;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2312  		if (copy_from_user(&edata, useraddr, sizeof(ed=
ata)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2313  			return -EFAULT;
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2314  		if (edata.cmd !=3D CHELSIO_SET_QSET_NUM)
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2315  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2316  		if (edata.val < 1 ||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2317  			(edata.val > 1 && !(adapter->flags & USING_MS=
IX)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2318  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2319  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2320  		for_each_port(adapter, i)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2321  			if (adapter->port[i] && adapter->port[i] !=3D=
 dev)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2322  				other_qsets +=3D adap2pinfo(adapter, i)->nqs=
ets;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2323  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2324  		if (edata.val + other_qsets > SGE_QSETS)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2325  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2326  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2327  		pi->nqsets =3D edata.val;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2328  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2329  		for_each_port(adapter, i)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2330  			if (adapter->port[i]) {
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2331  				pi =3D adap2pinfo(adapter, i);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2332  				pi->first_qset =3D first_qset;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2333  				first_qset +=3D pi->nqsets;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2334  			}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2335  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2336  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2337  	case CHELSIO_GET_QSET_NUM:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2338  		struct ch_reg edata;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2339  =

49c37c0334a9b85 drivers/net/cxgb3/cxgb3_main.c                  Dan Rosenbe=
rg       2010-09-15  2340  		memset(&edata, 0, sizeof(struct ch_reg));
49c37c0334a9b85 drivers/net/cxgb3/cxgb3_main.c                  Dan Rosenbe=
rg       2010-09-15  2341  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2342  		edata.cmd =3D CHELSIO_GET_QSET_NUM;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2343  		edata.val =3D pi->nqsets;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2344  		if (copy_to_user(useraddr, &edata, sizeof(edat=
a)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2345  			return -EFAULT;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2346  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2347  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2348  	case CHELSIO_LOAD_FW:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2349  		u8 *fw_data;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2350  		struct ch_mem_range t;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2351  =

1b3aa7afb60d348 drivers/net/cxgb3/cxgb3_main.c                  Alan Cox   =
         2008-04-29  2352  		if (!capable(CAP_SYS_RAWIO))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2353  			return -EPERM;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2354  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2355  			return -EFAULT;
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2356  		if (t.cmd !=3D CHELSIO_LOAD_FW)
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2357  			return -EINVAL;
1b3aa7afb60d348 drivers/net/cxgb3/cxgb3_main.c                  Alan Cox   =
         2008-04-29  2358  		/* Check t.len sanity ? */
c5dc9a3581f486a drivers/net/cxgb3/cxgb3_main.c                  Julia Lawal=
l        2010-05-21  2359  		fw_data =3D memdup_user(useraddr + sizeof(t), =
t.len);
c5dc9a3581f486a drivers/net/cxgb3/cxgb3_main.c                  Julia Lawal=
l        2010-05-21  2360  		if (IS_ERR(fw_data))
c5dc9a3581f486a drivers/net/cxgb3/cxgb3_main.c                  Julia Lawal=
l        2010-05-21  2361  			return PTR_ERR(fw_data);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2362  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2363  		ret =3D t3_load_fw(adapter, fw_data, t.len);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2364  		kfree(fw_data);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2365  		if (ret)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2366  			return ret;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2367  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2368  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2369  	case CHELSIO_SETMTUTAB:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2370  		struct ch_mtus m;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2371  		int i;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2372  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2373  		if (!is_offload(adapter))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2374  			return -EOPNOTSUPP;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2375  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2376  			return -EPERM;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2377  		if (offload_running(adapter))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2378  			return -EBUSY;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2379  		if (copy_from_user(&m, useraddr, sizeof(m)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2380  			return -EFAULT;
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2381  		if (m.cmd !=3D CHELSIO_SETMTUTAB)
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2382  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2383  		if (m.nmtus !=3D NMTUS)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2384  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2385  		if (m.mtus[0] < 81)	/* accommodate SACK */
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2386  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2387  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2388  		/* MTUs must be in ascending order */
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2389  		for (i =3D 1; i < NMTUS; ++i)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2390  			if (m.mtus[i] < m.mtus[i - 1])
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2391  				return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2392  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2393  		memcpy(adapter->params.mtus, m.mtus,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2394  			sizeof(adapter->params.mtus));
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2395  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2396  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2397  	case CHELSIO_GET_PM:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2398  		struct tp_params *p =3D &adapter->params.tp;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2399  		struct ch_pm m =3D {.cmd =3D CHELSIO_GET_PM };
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2400  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2401  		if (!is_offload(adapter))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2402  			return -EOPNOTSUPP;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2403  		m.tx_pg_sz =3D p->tx_pg_size;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2404  		m.tx_num_pg =3D p->tx_num_pgs;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2405  		m.rx_pg_sz =3D p->rx_pg_size;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2406  		m.rx_num_pg =3D p->rx_num_pgs;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2407  		m.pm_total =3D p->pmtx_size + p->chan_rx_size =
* p->nchan;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2408  		if (copy_to_user(useraddr, &m, sizeof(m)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2409  			return -EFAULT;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2410  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2411  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2412  	case CHELSIO_SET_PM:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2413  		struct ch_pm m;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2414  		struct tp_params *p =3D &adapter->params.tp;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2415  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2416  		if (!is_offload(adapter))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2417  			return -EOPNOTSUPP;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2418  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2419  			return -EPERM;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2420  		if (adapter->flags & FULL_INIT_DONE)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2421  			return -EBUSY;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2422  		if (copy_from_user(&m, useraddr, sizeof(m)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2423  			return -EFAULT;
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2424  		if (m.cmd !=3D CHELSIO_SET_PM)
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2425  			return -EINVAL;
d9da466a3ce2ac0 drivers/net/cxgb3/cxgb3_main.c                  vignesh bab=
u        2007-07-09  2426  		if (!is_power_of_2(m.rx_pg_sz) ||
d9da466a3ce2ac0 drivers/net/cxgb3/cxgb3_main.c                  vignesh bab=
u        2007-07-09  2427  			!is_power_of_2(m.tx_pg_sz))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2428  			return -EINVAL;	/* not power of 2 */
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2429  		if (!(m.rx_pg_sz & 0x14000))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2430  			return -EINVAL;	/* not 16KB or 64KB */
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2431  		if (!(m.tx_pg_sz & 0x1554000))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2432  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2433  		if (m.tx_num_pg =3D=3D -1)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2434  			m.tx_num_pg =3D p->tx_num_pgs;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2435  		if (m.rx_num_pg =3D=3D -1)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2436  			m.rx_num_pg =3D p->rx_num_pgs;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2437  		if (m.tx_num_pg % 24 || m.rx_num_pg % 24)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2438  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2439  		if (m.rx_num_pg * m.rx_pg_sz > p->chan_rx_size=
 ||
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2440  			m.tx_num_pg * m.tx_pg_sz > p->chan_tx_size)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2441  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2442  		p->rx_pg_size =3D m.rx_pg_sz;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2443  		p->tx_pg_size =3D m.tx_pg_sz;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2444  		p->rx_num_pgs =3D m.rx_num_pg;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2445  		p->tx_num_pgs =3D m.tx_num_pg;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2446  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2447  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2448  	case CHELSIO_GET_MEM:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2449  		struct ch_mem_range t;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2450  		struct mc7 *mem;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2451  		u64 buf[32];
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2452  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2453  		if (!is_offload(adapter))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2454  			return -EOPNOTSUPP;
3546d8f1bbe9924 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Michael Ell=
erman    2020-01-24  2455  		if (!capable(CAP_NET_ADMIN))
3546d8f1bbe9924 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Michael Ell=
erman    2020-01-24  2456  			return -EPERM;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2457  		if (!(adapter->flags & FULL_INIT_DONE))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2458  			return -EIO;	/* need the memory controllers */
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2459  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2460  			return -EFAULT;
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2461  		if (t.cmd !=3D CHELSIO_GET_MEM)
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2462  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2463  		if ((t.addr & 7) || (t.len & 7))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2464  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2465  		if (t.mem_id =3D=3D MEM_CM)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2466  			mem =3D &adapter->cm;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2467  		else if (t.mem_id =3D=3D MEM_PMRX)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2468  			mem =3D &adapter->pmrx;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2469  		else if (t.mem_id =3D=3D MEM_PMTX)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2470  			mem =3D &adapter->pmtx;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2471  		else
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2472  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2473  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2474  		/*
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2475  		 * Version scheme:
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2476  		 * bits 0..9: chip version
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2477  		 * bits 10..15: chip revision
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2478  		 */
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2479  		t.version =3D 3 | (adapter->params.rev << 10);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2480  		if (copy_to_user(useraddr, &t, sizeof(t)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2481  			return -EFAULT;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2482  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2483  		/*
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2484  		 * Read 256 bytes at a time as len can be larg=
e and we don't
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2485  		 * want to use huge intermediate buffers.
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2486  		 */
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2487  		useraddr +=3D sizeof(t);	/* advance to start o=
f buffer */
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2488  		while (t.len) {
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2489  			unsigned int chunk =3D
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2490  				min_t(unsigned int, t.len, sizeof(buf));
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2491  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2492  			ret =3D
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2493  				t3_mc7_bd_read(mem, t.addr / 8, chunk / 8,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2494  						buf);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2495  			if (ret)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2496  				return ret;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2497  			if (copy_to_user(useraddr, buf, chunk))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2498  				return -EFAULT;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2499  			useraddr +=3D chunk;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2500  			t.addr +=3D chunk;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2501  			t.len -=3D chunk;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2502  		}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2503  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2504  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2505  	case CHELSIO_SET_TRACE_FILTER:{
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2506  		struct ch_trace t;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2507  		const struct trace_params *tp;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2508  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2509  		if (!capable(CAP_NET_ADMIN))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2510  			return -EPERM;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2511  		if (!offload_running(adapter))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2512  			return -EAGAIN;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2513  		if (copy_from_user(&t, useraddr, sizeof(t)))
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2514  			return -EFAULT;
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2515  		if (t.cmd !=3D CHELSIO_SET_TRACE_FILTER)
2c05d88818ab657 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c Wenwen Wang=
         2018-10-05  2516  			return -EINVAL;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2517  =

4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2518  		tp =3D (const struct trace_params *)&t.sip;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2519  		if (t.config_tx)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2520  			t3_config_trace_filter(adapter, tp, 0,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2521  						t.invert_match,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2522  						t.trace_tx);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2523  		if (t.config_rx)
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2524  			t3_config_trace_filter(adapter, tp, 1,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2525  						t.invert_match,
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2526  						t.trace_rx);
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2527  		break;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2528  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2529  	default:
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2530  		return -EOPNOTSUPP;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2531  	}
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2532  	return 0;
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2533  }
4d22de3e6cc4a09 drivers/net/cxgb3/cxgb3_main.c                  Divy Le Ray=
         2007-01-18  2534  =


:::::: The code@line 2206 was first introduced by commit
:::::: 4d22de3e6cc4a09c369b504cd8bcde3385a974cd Add support for the latest =
1G/10G Chelsio adapter, T3.

:::::: TO: Divy Le Ray <divy@chelsio.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7539624521832484497==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
RBRNm1lEoFSjQQAmly9wWFaPqf8DvLOY34MkAgA=
--===============7539624521832484497==--

