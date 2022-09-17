Content-Type: multipart/mixed; boundary="===============4227712012678825839=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mscc/ocelot.c:1796:12: warning: use of uninitialized value 'err' [CWE-457]
Date: Sun, 18 Sep 2022 03:00:38 +0800
Message-ID: <202209180242.FoPt7qcN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4227712012678825839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/ethernet/mscc/ocelot.c:1796:12: warning: use of uninitialized value 'err=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Colin Foster <colin.foster@in-advantage.com>
CC: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a335366bad1364a07f49df9da1fdfa6d411a5f39
commit: d87b1c08f38a2ce40cf559df36c107a2e6c16a8f net: mscc: ocelot: use bul=
k reads for stats
date:   7 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220915 (https://download.01.org/0day-ci/archi=
ve/20220918/202209180242.FoPt7qcN-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd87b1c08f38a2ce40cf559df36c107a2e6c16a8f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d87b1c08f38a2ce40cf559df36c107a2e6c16a8f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
     607 |         unsigned int pause_ena;
         |                      ^~~~~~~~~
     'ocelot_port_flush': event 1
       |
       |  607 |         unsigned int pause_ena;
       |      |                      ^~~~~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/net/ethernet/mscc/ocelot.c: In function 'ocelot_xtr_poll_frame':
   drivers/net/ethernet/mscc/ocelot.c:1085:13: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1085 |         u64 timestamp, src_port, len;
         |             ^~~~~~~~~
     'ocelot_xtr_poll_frame': event 1
       |
       | 1085 |         u64 timestamp, src_port, len;
       |      |             ^~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/net/ethernet/mscc/ocelot.c:1085:24: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1085 |         u64 timestamp, src_port, len;
         |                        ^~~~~~~~
     'ocelot_xtr_poll_frame': event 1
       |
       | 1085 |         u64 timestamp, src_port, len;
       |      |                        ^~~~~~~~
       |      |                        |
       |      |                        (1) use of uninitialized value '<unk=
nown>' here
       |
   drivers/net/ethernet/mscc/ocelot.c:1085:34: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1085 |         u64 timestamp, src_port, len;
         |                                  ^~~
     'ocelot_xtr_poll_frame': event 1
       |
       | 1085 |         u64 timestamp, src_port, len;
       |      |                                  ^~~
       |      |                                  |
       |      |                                  (1) use of uninitialized v=
alue '<unknown>' here
       |
   drivers/net/ethernet/mscc/ocelot.c:1090:13: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1090 |         u32 val, *buf;
         |             ^~~
     'ocelot_xtr_poll_frame': event 1
       |
       | 1090 |         u32 val, *buf;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/net/ethernet/mscc/ocelot.c: In function 'ocelot_fdb_dump':
   drivers/net/ethernet/mscc/ocelot.c:1410:43: warning: use of uninitialize=
d value 'entry.type' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1410 |                         is_static =3D (entry.type =3D=3D ENTRYTY=
PE_LOCKED);
         |                                      ~~~~~^~~~~
     'ocelot_fdb_dump': events 1-2
       |
       | 1396 |         for (i =3D 0; i < ocelot->num_mact_rows; i++) {
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~     =

       |      |                       |
       |      |                       (2) following 'true' branch...
       | 1397 |                 for (j =3D 0; j < 4; j++) {
       | 1398 |                         struct ocelot_mact_entry entry;
       |      |                                                  ^~~~~
       |      |                                                  |
       |      |                                                  (1) region=
 created on stack here
       |
     'ocelot_fdb_dump': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'ocelot_fdb_dump': events 4-10
       |
       | 1397 |                 for (j =3D 0; j < 4; j++) {
       |      |                             ~~^~~
       |      |                               |
       |      |                               (4) following 'true' branch (=
when 'j !=3D 4')...
       | 1398 |                         struct ocelot_mact_entry entry;
       |      |                                                  ~~~~~
       |      |                                                  |
       |      |                                                  (5) ...to =
here
       |......
       | 1405 |                         if (err =3D=3D -EINVAL)
       |      |                            ~   =

       |      |                            |
       |      |                            (6) following 'false' branch (wh=
en 'err !=3D -22')...
       | 1406 |                                 continue;
       | 1407 |                         else if (err)
       |      |                                 ~
       |      |                                 |
       |      |                                 (7) ...to here
       |      |                                 (8) following 'false' branc=
h (when 'err =3D=3D 0')...
       |......
       | 1410 |                         is_static =3D (entry.type =3D=3D EN=
TRYTYPE_LOCKED);
       |      |                                      ~~~~~~~~~~
       |      |                                           |
       |      |                                           (9) ...to here
       |      |                                           (10) use of unini=
tialized value 'entry.type' here
       |
   drivers/net/ethernet/mscc/ocelot.c: In function 'ocelot_check_stats_work=
':
>> drivers/net/ethernet/mscc/ocelot.c:1796:12: warning: use of uninitialize=
d value 'err' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1796 |         if (err)
         |            ^
     'ocelot_check_stats_work': events 1-4
       |
       | 1786 |         int i, err;
       |      |                ^~~
       |      |                |
       |      |                (1) region created on stack here
       |......
       | 1789 |         for (i =3D 0; i < ocelot->num_phys_ports; i++) {
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (2) following 'false' branch...
       |......
       | 1794 |         mutex_unlock(&ocelot->stats_lock);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       | 1795 | =

       | 1796 |         if (err)
       |      |            ~    =

       |      |            |
       |      |            (4) use of uninitialized value 'err' here
       |
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from include/linux/skbuff.h:31,
                    from include/linux/dsa/ocelot.h:10:
>> include/linux/dev_printk.h:144:31: warning: use of uninitialized value '=
err' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(f=
mt), ##__VA_ARGS__)
         |                               ^
   include/linux/dev_printk.h:110:17: note: in definition of macro 'dev_pri=
ntk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);               =
        \
         |                 ^~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1797:17: note: in expansion of macro =
'dev_err'
    1797 |                 dev_err(ocelot->dev, "Error %d updating ethtool =
stats\n",  err);
         |                 ^~~~~~~
     'ocelot_check_stats_work': events 1-4
       |
       | 1786 |         int i, err;
       |      |                ^~~
       |      |                |
       |      |                (1) region created on stack here
       |......
       | 1789 |         for (i =3D 0; i < ocelot->num_phys_ports; i++) {
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (2) following 'false' branch...
       |......
       | 1794 |         mutex_unlock(&ocelot->stats_lock);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       | 1795 | =

       | 1796 |         if (err)
       |      |            ~    =

       |      |            |
       |      |            (4) following 'true' branch (when 'err !=3D 0').=
..
       |
     'ocelot_check_stats_work': event 5
       |
       | 1797 |                 dev_err(ocelot->dev, "Error %d updating eth=
tool stats\n",  err);
       |      |                         ~~~~~~^~~~~
       |      |                               |
       |      |                               (5) ...to here
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_pri=
ntk_index_wrap'
       |  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);          =
             \
       |      |                         ^~~
   drivers/net/ethernet/mscc/ocelot.c:1797:17: note: in expansion of macro =
'dev_err'
       | 1797 |                 dev_err(ocelot->dev, "Error %d updating eth=
tool stats\n",  err);
       |      |                 ^~~~~~~
       |
     'ocelot_check_stats_work': event 6
       |
       |include/linux/dev_printk.h:144:31:
       |  144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_=
fmt(fmt), ##__VA_ARGS__)
       |      |                               ^
       |      |                               |
       |      |                               (6) use of uninitialized valu=
e 'err' here
   include/linux/dev_printk.h:110:17: note: in definition of macro 'dev_pri=
ntk_index_wrap'
       |  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);          =
             \
       |      |                 ^~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:1797:17: note: in expansion of macro =
'dev_err'
       | 1797 |                 dev_err(ocelot->dev, "Error %d updating eth=
tool stats\n",  err);
       |      |                 ^~~~~~~
       |
   drivers/net/ethernet/mscc/ocelot.c: In function 'ocelot_set_aggr_pgids':
   drivers/net/ethernet/mscc/ocelot.c:2341:31: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2341 |                 unsigned long bond_mask;
         |                               ^~~~~~~~~
     'ocelot_set_aggr_pgids': event 1
       |
       |include/soc/mscc/ocelot.h:83:21:
       |   83 |              (pgid) < PGID_SRC;                            =
     \
       |      |                     ^
       |      |                     |
       |      |                     (1) following 'true' branch (when 'i !=
=3D 80')...
   drivers/net/ethernet/mscc/ocelot.c:2316:9: note: in expansion of macro '=
for_each_aggr_pgid'
       | 2316 |         for_each_aggr_pgid(ocelot, i)
       |      |         ^~~~~~~~~~~~~~~~~~
       |
     'ocelot_set_aggr_pgids': event 2
       |
       | 2317 |                 ocelot_write_rix(ocelot, GENMASK(ocelot->nu=
m_phys_ports - 1, 0),
       |      |                                                  ~~~~~~^~~~=
~~~~~~~~~~~~
       |      |                                                        |
       |      |                                                        (2) =
...to here
   include/soc/mscc/ocelot.h:770:35: note: in definition of macro 'ocelot_w=
rite_rix'
       |  770 |         __ocelot_write_ix(ocelot, val, reg, reg##_RSZ * (ri=
))
       |      |                                   ^~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
       |   38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
       |      |                                      ^~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:2317:42: note: in expansion of macro =
'GENMASK'
       | 2317 |                 ocelot_write_rix(ocelot, GENMASK(ocelot->nu=
m_phys_ports - 1, 0),
       |      |                                          ^~~~~~~
       |
     'ocelot_set_aggr_pgids': events 3-5
       |
       | 2338 |         for (lag =3D 0; lag < ocelot->num_phys_ports; lag++=
) {
       |      |                       ~~~~^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                           |
       |      |                           (3) following 'true' branch...
       | 2339 |                 struct net_device *bond =3D ocelot->ports[l=
ag]->bond;
       |      |                                           ~~~~~~~~~~~~~
       |      |                                                 |
       |      |                                                 (4) ...to h=
ere
       | 2340 |                 int num_active_ports =3D 0;
       | 2341 |                 unsigned long bond_mask;

vim +/err +1796 drivers/net/ethernet/mscc/ocelot.c

1e1caa9735f90b Claudiu Manoil    2019-04-16  1780  =

1e1caa9735f90b Claudiu Manoil    2019-04-16  1781  static void ocelot_check=
_stats_work(struct work_struct *work)
1e1caa9735f90b Claudiu Manoil    2019-04-16  1782  {
1e1caa9735f90b Claudiu Manoil    2019-04-16  1783  	struct delayed_work *de=
l_work =3D to_delayed_work(work);
1e1caa9735f90b Claudiu Manoil    2019-04-16  1784  	struct ocelot *ocelot =
=3D container_of(del_work, struct ocelot,
1e1caa9735f90b Claudiu Manoil    2019-04-16  1785  					     stats_work);
d87b1c08f38a2c Colin Foster      2022-02-13  1786  	int i, err;
1e1caa9735f90b Claudiu Manoil    2019-04-16  1787  =

7fbf6795d127a3 Colin Foster      2022-02-10  1788  	mutex_lock(&ocelot->sta=
ts_lock);
d87b1c08f38a2c Colin Foster      2022-02-13  1789  	for (i =3D 0; i < ocelo=
t->num_phys_ports; i++) {
d87b1c08f38a2c Colin Foster      2022-02-13  1790  		err =3D ocelot_port_up=
date_stats(ocelot, i);
d87b1c08f38a2c Colin Foster      2022-02-13  1791  		if (err)
d87b1c08f38a2c Colin Foster      2022-02-13  1792  			break;
d87b1c08f38a2c Colin Foster      2022-02-13  1793  	}
7fbf6795d127a3 Colin Foster      2022-02-10  1794  	mutex_unlock(&ocelot->s=
tats_lock);
1e1caa9735f90b Claudiu Manoil    2019-04-16  1795  =

d87b1c08f38a2c Colin Foster      2022-02-13 @1796  	if (err)
d87b1c08f38a2c Colin Foster      2022-02-13  1797  		dev_err(ocelot->dev, "=
Error %d updating ethtool stats\n",  err);
d87b1c08f38a2c Colin Foster      2022-02-13  1798  =

a556c76adc052c Alexandre Belloni 2018-05-14  1799  	queue_delayed_work(ocel=
ot->stats_queue, &ocelot->stats_work,
a556c76adc052c Alexandre Belloni 2018-05-14  1800  			   OCELOT_STATS_CHECK=
_DELAY);
a556c76adc052c Alexandre Belloni 2018-05-14  1801  }
a556c76adc052c Alexandre Belloni 2018-05-14  1802  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4227712012678825839==--

