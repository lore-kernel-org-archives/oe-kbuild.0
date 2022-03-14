Content-Type: multipart/mixed; boundary="===============4960560659109899473=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5133/11953] drivers/net/ethernet/mscc/ocelot.c:1778 ocelot_port_update_stats() error: uninitialized symbol 'err'.
Date: Mon, 14 Mar 2022 11:31:15 +0800
Message-ID: <202203141139.KXUKjsZA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4960560659109899473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Colin Foster <colin.foster@in-advantage.com>
CC: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: d87b1c08f38a2ce40cf559df36c107a2e6c16a8f [5133/11953] net: mscc: oc=
elot: use bulk reads for stats
:::::: branch date: 4 days ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-m031-20220313 (https://download.01.org/0day-ci/arc=
hive/20220314/202203141139.KXUKjsZA-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mscc/ocelot.c:1778 ocelot_port_update_stats() error: u=
ninitialized symbol 'err'.
drivers/net/ethernet/mscc/ocelot.c:1796 ocelot_check_stats_work() error: un=
initialized symbol 'err'.

vim +/err +1778 drivers/net/ethernet/mscc/ocelot.c

a556c76adc052c9 Alexandre Belloni 2018-05-14  1747  =

7fbf6795d127a3b Colin Foster      2022-02-10  1748  /* Caller must hold &oc=
elot->stats_lock */
d87b1c08f38a2ce Colin Foster      2022-02-13  1749  static int ocelot_port_=
update_stats(struct ocelot *ocelot, int port)
a556c76adc052c9 Alexandre Belloni 2018-05-14  1750  {
d87b1c08f38a2ce Colin Foster      2022-02-13  1751  	unsigned int idx =3D p=
ort * ocelot->num_stats;
d87b1c08f38a2ce Colin Foster      2022-02-13  1752  	struct ocelot_stats_re=
gion *region;
d87b1c08f38a2ce Colin Foster      2022-02-13  1753  	int err, j;
a556c76adc052c9 Alexandre Belloni 2018-05-14  1754  =

a556c76adc052c9 Alexandre Belloni 2018-05-14  1755  	/* Configure the port =
to read the stats from */
e27d785e60b6b1d Colin Foster      2022-02-13  1756  	ocelot_write(ocelot, S=
YS_STAT_CFG_STAT_VIEW(port), SYS_STAT_CFG);
a556c76adc052c9 Alexandre Belloni 2018-05-14  1757  =

d87b1c08f38a2ce Colin Foster      2022-02-13  1758  	list_for_each_entry(re=
gion, &ocelot->stats_regions, node) {
d87b1c08f38a2ce Colin Foster      2022-02-13  1759  		err =3D ocelot_bulk_r=
ead_rix(ocelot, SYS_COUNT_RX_OCTETS,
d87b1c08f38a2ce Colin Foster      2022-02-13  1760  					   region->offset,=
 region->buf,
d87b1c08f38a2ce Colin Foster      2022-02-13  1761  					   region->count);
d87b1c08f38a2ce Colin Foster      2022-02-13  1762  		if (err)
d87b1c08f38a2ce Colin Foster      2022-02-13  1763  			return err;
a556c76adc052c9 Alexandre Belloni 2018-05-14  1764  =

d87b1c08f38a2ce Colin Foster      2022-02-13  1765  		for (j =3D 0; j < reg=
ion->count; j++) {
d87b1c08f38a2ce Colin Foster      2022-02-13  1766  			u64 *stat =3D &ocelo=
t->stats[idx + j];
d87b1c08f38a2ce Colin Foster      2022-02-13  1767  			u64 val =3D region->=
buf[j];
a556c76adc052c9 Alexandre Belloni 2018-05-14  1768  =

d87b1c08f38a2ce Colin Foster      2022-02-13  1769  			if (val < (*stat & U=
32_MAX))
d87b1c08f38a2ce Colin Foster      2022-02-13  1770  				*stat +=3D (u64)1 <=
< 32;
d87b1c08f38a2ce Colin Foster      2022-02-13  1771  =

d87b1c08f38a2ce Colin Foster      2022-02-13  1772  			*stat =3D (*stat & ~=
(u64)U32_MAX) + val;
d87b1c08f38a2ce Colin Foster      2022-02-13  1773  		}
a556c76adc052c9 Alexandre Belloni 2018-05-14  1774  =

d87b1c08f38a2ce Colin Foster      2022-02-13  1775  		idx +=3D region->coun=
t;
a556c76adc052c9 Alexandre Belloni 2018-05-14  1776  	}
d87b1c08f38a2ce Colin Foster      2022-02-13  1777  =

d87b1c08f38a2ce Colin Foster      2022-02-13 @1778  	return err;
1e1caa9735f90b5 Claudiu Manoil    2019-04-16  1779  }
1e1caa9735f90b5 Claudiu Manoil    2019-04-16  1780  =

1e1caa9735f90b5 Claudiu Manoil    2019-04-16  1781  static void ocelot_chec=
k_stats_work(struct work_struct *work)
1e1caa9735f90b5 Claudiu Manoil    2019-04-16  1782  {
1e1caa9735f90b5 Claudiu Manoil    2019-04-16  1783  	struct delayed_work *d=
el_work =3D to_delayed_work(work);
1e1caa9735f90b5 Claudiu Manoil    2019-04-16  1784  	struct ocelot *ocelot =
=3D container_of(del_work, struct ocelot,
1e1caa9735f90b5 Claudiu Manoil    2019-04-16  1785  					     stats_work);
d87b1c08f38a2ce Colin Foster      2022-02-13  1786  	int i, err;
1e1caa9735f90b5 Claudiu Manoil    2019-04-16  1787  =

7fbf6795d127a3b Colin Foster      2022-02-10  1788  	mutex_lock(&ocelot->st=
ats_lock);
d87b1c08f38a2ce Colin Foster      2022-02-13  1789  	for (i =3D 0; i < ocel=
ot->num_phys_ports; i++) {
d87b1c08f38a2ce Colin Foster      2022-02-13  1790  		err =3D ocelot_port_u=
pdate_stats(ocelot, i);
d87b1c08f38a2ce Colin Foster      2022-02-13  1791  		if (err)
d87b1c08f38a2ce Colin Foster      2022-02-13  1792  			break;
d87b1c08f38a2ce Colin Foster      2022-02-13  1793  	}
7fbf6795d127a3b Colin Foster      2022-02-10  1794  	mutex_unlock(&ocelot->=
stats_lock);
1e1caa9735f90b5 Claudiu Manoil    2019-04-16  1795  =

d87b1c08f38a2ce Colin Foster      2022-02-13 @1796  	if (err)
d87b1c08f38a2ce Colin Foster      2022-02-13  1797  		dev_err(ocelot->dev, =
"Error %d updating ethtool stats\n",  err);
d87b1c08f38a2ce Colin Foster      2022-02-13  1798  =

a556c76adc052c9 Alexandre Belloni 2018-05-14  1799  	queue_delayed_work(oce=
lot->stats_queue, &ocelot->stats_work,
a556c76adc052c9 Alexandre Belloni 2018-05-14  1800  			   OCELOT_STATS_CHEC=
K_DELAY);
a556c76adc052c9 Alexandre Belloni 2018-05-14  1801  }
a556c76adc052c9 Alexandre Belloni 2018-05-14  1802  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4960560659109899473==--

