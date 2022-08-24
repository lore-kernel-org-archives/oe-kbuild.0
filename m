Content-Type: multipart/mixed; boundary="===============2562444528248408831=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/realtek/rtl8365mb.c:1391 rtl8365mb_stats_update() error: uninitialized symbol 'ret'.
Date: Wed, 24 Aug 2022 21:08:50 +0800
Message-ID: <202208242139.0eDdBkzo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2562444528248408831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Alvin =C5=A0ipraga" <alsi@bang-olufsen.dk>

Hi Alvin,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
commit: 2511e0c87786f333c4665508f421ac99e378c719 net: dsa: realtek: fix Kco=
nfig to assure consistent driver linkage
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: openrisc-randconfig-m031-20220824 (https://download.01.org/0day-ci/=
archive/20220824/202208242139.0eDdBkzo-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/dsa/realtek/rtl8365mb.c:1391 rtl8365mb_stats_update() error: un=
initialized symbol 'ret'.

vim +/ret +1391 drivers/net/dsa/realtek/rtl8365mb.c

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1348  =

f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  1349  static void rtl8365mb_stats_update(struct realtek_priv =
*priv, int port)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1350  {
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1351  	u64 cnt[RTL8365MB_MIB_END] =3D {
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1352  		[RTL8365MB_MIB_ifOutOctets] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1353  		[RTL8365MB_MIB_ifOutUcastPkts] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1354  		[RTL8365MB_MIB_ifOutMulticastPkts] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1355  		[RTL8365MB_MIB_ifOutBroadcastPkts] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1356  		[RTL8365MB_MIB_ifOutDiscards] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1357  		[RTL8365MB_MIB_ifInOctets] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1358  		[RTL8365MB_MIB_ifInUcastPkts] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1359  		[RTL8365MB_MIB_ifInMulticastPkts] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1360  		[RTL8365MB_MIB_ifInBroadcastPkts] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1361  		[RTL8365MB_MIB_etherStatsDropEvents] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1362  		[RTL8365MB_MIB_etherStatsCollisions] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1363  		[RTL8365MB_MIB_etherStatsFragments] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1364  		[RTL8365MB_MIB_etherStatsJabbers] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1365  		[RTL8365MB_MIB_dot3StatsFCSErrors] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1366  		[RTL8365MB_MIB_dot3StatsLateCollisions] =3D 1,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1367  	};
f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  1368  	struct rtl8365mb *mb =3D priv->chip_data;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1369  	struct rtnl_link_stats64 *stats;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1370  	int ret;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1371  	int i;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1372  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1373  	stats =3D &mb->ports[port].stats;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1374  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1375  	mutex_lock(&mb->mib_lock);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1376  	for (i =3D 0; i < RTL8365MB_MIB_END; i++) {
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1377  		struct rtl8365mb_mib_counter *c =3D &rtl8365mb_m=
ib_counters[i];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1378  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1379  		/* Only fetch required MIB counters (marked =3D =
1 above) */
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1380  		if (!cnt[i])
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1381  			continue;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1382  =

f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  1383  		ret =3D rtl8365mb_mib_counter_read(priv, port, c->off=
set,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1384  						 c->length, &cnt[i]);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1385  		if (ret)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1386  			break;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1387  	}
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1388  	mutex_unlock(&mb->mib_lock);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1389  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1390  	/* Don't update statistics if there was an error =
reading the counters */
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18 @1391  	if (ret)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1392  		return;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1393  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1394  	spin_lock(&mb->ports[port].stats_lock);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1395  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1396  	stats->rx_packets =3D cnt[RTL8365MB_MIB_ifInUcast=
Pkts] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1397  			    cnt[RTL8365MB_MIB_ifInMulticastPkts] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1398  			    cnt[RTL8365MB_MIB_ifInBroadcastPkts] -
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1399  			    cnt[RTL8365MB_MIB_ifOutDiscards];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1400  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1401  	stats->tx_packets =3D cnt[RTL8365MB_MIB_ifOutUcas=
tPkts] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1402  			    cnt[RTL8365MB_MIB_ifOutMulticastPkts] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1403  			    cnt[RTL8365MB_MIB_ifOutBroadcastPkts];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1404  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1405  	/* if{In,Out}Octets includes FCS - remove it */
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1406  	stats->rx_bytes =3D cnt[RTL8365MB_MIB_ifInOctets]=
 - 4 * stats->rx_packets;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1407  	stats->tx_bytes =3D
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1408  		cnt[RTL8365MB_MIB_ifOutOctets] - 4 * stats->tx_p=
ackets;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1409  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1410  	stats->rx_dropped =3D cnt[RTL8365MB_MIB_etherStat=
sDropEvents];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1411  	stats->tx_dropped =3D cnt[RTL8365MB_MIB_ifOutDisc=
ards];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1412  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1413  	stats->multicast =3D cnt[RTL8365MB_MIB_ifInMultic=
astPkts];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1414  	stats->collisions =3D cnt[RTL8365MB_MIB_etherStat=
sCollisions];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1415  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1416  	stats->rx_length_errors =3D cnt[RTL8365MB_MIB_eth=
erStatsFragments] +
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1417  				  cnt[RTL8365MB_MIB_etherStatsJabbers];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1418  	stats->rx_crc_errors =3D cnt[RTL8365MB_MIB_dot3St=
atsFCSErrors];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1419  	stats->rx_errors =3D stats->rx_length_errors + st=
ats->rx_crc_errors;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1420  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1421  	stats->tx_aborted_errors =3D cnt[RTL8365MB_MIB_if=
OutDiscards];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1422  	stats->tx_window_errors =3D cnt[RTL8365MB_MIB_dot=
3StatsLateCollisions];
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1423  	stats->tx_errors =3D stats->tx_aborted_errors + s=
tats->tx_window_errors;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1424  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1425  	spin_unlock(&mb->ports[port].stats_lock);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1426  }
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  1427  =


:::::: The code at line 1391 was first introduced by commit
:::::: 4af2950c50c8634ed2865cf81e607034f78b84aa net: dsa: realtek-smi: add =
rtl8365mb subdriver for RTL8365MB-VC

:::::: TO: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2562444528248408831==--

