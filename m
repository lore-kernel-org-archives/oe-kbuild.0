Content-Type: multipart/mixed; boundary="===============8813485916064382890=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [net-next:master 33/49] drivers/net/ethernet/mscc/ocelot_stats.c:75 ocelot_check_stats_work() error: uninitialized symbol 'err'.
Date: Sun, 11 Sep 2022 05:22:16 +0800
Message-ID: <202209110557.yqj9XPqC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8813485916064382890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: netdev(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
master
head:   169ccf0e40825d9e465863e4707d8e8546d3c3cb
commit: fe90104cd6048364db821c06bcb2246074919c04 [33/49] net: mscc: ocelot:=
 move stats code to ocelot_stats.c
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: openrisc-randconfig-m041-20220907 (https://download.01.org/0day-ci/=
archive/20220911/202209110557.yqj9XPqC-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mscc/ocelot_stats.c:75 ocelot_check_stats_work() error=
: uninitialized symbol 'err'.

vim +/err +75 drivers/net/ethernet/mscc/ocelot_stats.c

fe90104cd60483 Vladimir Oltean 2022-09-08  55  =

fe90104cd60483 Vladimir Oltean 2022-09-08  56  static void ocelot_check_sta=
ts_work(struct work_struct *work)
fe90104cd60483 Vladimir Oltean 2022-09-08  57  {
fe90104cd60483 Vladimir Oltean 2022-09-08  58  	struct delayed_work *del_wo=
rk =3D to_delayed_work(work);
fe90104cd60483 Vladimir Oltean 2022-09-08  59  	struct ocelot *ocelot =3D c=
ontainer_of(del_work, struct ocelot,
fe90104cd60483 Vladimir Oltean 2022-09-08  60  					     stats_work);
fe90104cd60483 Vladimir Oltean 2022-09-08  61  	int port, err;
fe90104cd60483 Vladimir Oltean 2022-09-08  62  =

fe90104cd60483 Vladimir Oltean 2022-09-08  63  	mutex_lock(&ocelot->stat_vi=
ew_lock);
fe90104cd60483 Vladimir Oltean 2022-09-08  64  =

fe90104cd60483 Vladimir Oltean 2022-09-08  65  	for (port =3D 0; port < oce=
lot->num_phys_ports; port++) {
fe90104cd60483 Vladimir Oltean 2022-09-08  66  		err =3D ocelot_port_update=
_stats(ocelot, port);
fe90104cd60483 Vladimir Oltean 2022-09-08  67  		if (err)
fe90104cd60483 Vladimir Oltean 2022-09-08  68  			break;
fe90104cd60483 Vladimir Oltean 2022-09-08  69  =

fe90104cd60483 Vladimir Oltean 2022-09-08  70  		spin_lock(&ocelot->stats_l=
ock);
fe90104cd60483 Vladimir Oltean 2022-09-08  71  		ocelot_port_transfer_stats=
(ocelot, port);
fe90104cd60483 Vladimir Oltean 2022-09-08  72  		spin_unlock(&ocelot->stats=
_lock);
fe90104cd60483 Vladimir Oltean 2022-09-08  73  	}
fe90104cd60483 Vladimir Oltean 2022-09-08  74  =

fe90104cd60483 Vladimir Oltean 2022-09-08 @75  	if (!err && ocelot->ops->up=
date_stats)
fe90104cd60483 Vladimir Oltean 2022-09-08  76  		ocelot->ops->update_stats(=
ocelot);
fe90104cd60483 Vladimir Oltean 2022-09-08  77  =

fe90104cd60483 Vladimir Oltean 2022-09-08  78  	mutex_unlock(&ocelot->stat_=
view_lock);
fe90104cd60483 Vladimir Oltean 2022-09-08  79  =

fe90104cd60483 Vladimir Oltean 2022-09-08  80  	if (err)
fe90104cd60483 Vladimir Oltean 2022-09-08  81  		dev_err(ocelot->dev, "Erro=
r %d updating ethtool stats\n",  err);
fe90104cd60483 Vladimir Oltean 2022-09-08  82  =

fe90104cd60483 Vladimir Oltean 2022-09-08  83  	queue_delayed_work(ocelot->=
stats_queue, &ocelot->stats_work,
fe90104cd60483 Vladimir Oltean 2022-09-08  84  			   OCELOT_STATS_CHECK_DEL=
AY);
fe90104cd60483 Vladimir Oltean 2022-09-08  85  }
fe90104cd60483 Vladimir Oltean 2022-09-08  86  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8813485916064382890==--

