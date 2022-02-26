Content-Type: multipart/mixed; boundary="===============0467797922855377753=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/iavf/iavf_main.c:2309 iavf_reset_task() warn: inconsistent returns '&adapter->crit_lock'.
Date: Sat, 26 Feb 2022 19:00:39 +0800
Message-ID: <202202261834.igXJI6TK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0467797922855377753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Stefan Assmann <sassmann@kpanic.de>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9137eda53752ef73148e42b0d7640a00f1bc96b1
commit: 5ac49f3c2702f269d31cc37eb9308bc557953c4d iavf: use mutexes for lock=
ing of critical sections
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: ia64-randconfig-m031-20220220 (https://download.01.org/0day-ci/arch=
ive/20220226/202202261834.igXJI6TK-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/intel/iavf/iavf_main.c:2309 iavf_reset_task() warn: in=
consistent returns '&adapter->crit_lock'.

vim +2309 drivers/net/ethernet/intel/iavf/iavf_main.c

dedecb6d429bd33 drivers/net/ethernet/intel/i40evf/i40evf_main.c Joe Perches=
           2016-11-01  2088  =

5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2089  /**
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2090   * iavf_reset_task - Call-back task to handle =
hardware reset
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2091   * @work: pointer to work_struct
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2092   *
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2093   * During reset we need to shut down and reini=
tialize the admin queue
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2094   * before we can use it to communicate with th=
e PF again. We also clear
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2095   * and reinit the rings because that context i=
s lost as well.
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2096   **/
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2097  static void iavf_reset_task(struct work_struct=
 *work)
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2098  {
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2099  	struct iavf_adapter *adapter =3D container_of=
(work,
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2100  						      struct iavf_adapter,
ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2101  						      reset_task);
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2102  	struct virtchnl_vf_resource *vfres =3D adapte=
r->vf_res;
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2103  	struct net_device *netdev =3D adapter->netdev;
f349daa58809ae3 drivers/net/ethernet/intel/iavf/iavf_main.c     Jesse Brand=
eburg      2018-09-14  2104  	struct iavf_hw *hw =3D &adapter->hw;
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2105  	struct iavf_mac_filter *f, *ftmp;
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2106  	struct iavf_vlan_filter *vlf;
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2107  	struct iavf_cloud_filter *cf;
ee5c1e92dd01d37 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-08-28  2108  	u32 reg_val;
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2109  	int i =3D 0, err;
44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2110  	bool running;
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2111  =

06aa040f039404a drivers/net/ethernet/intel/i40evf/i40evf_main.c Avinash Day=
anand      2017-12-18  2112  	/* When device is being removed it doesn't ma=
ke sense to run the reset
06aa040f039404a drivers/net/ethernet/intel/i40evf/i40evf_main.c Avinash Day=
anand      2017-12-18  2113  	 * task, just return in such a case.
06aa040f039404a drivers/net/ethernet/intel/i40evf/i40evf_main.c Avinash Day=
anand      2017-12-18  2114  	 */
5ac49f3c2702f26 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-08-04  2115  	if (mutex_is_locked(&adapter->remove_lock))
06aa040f039404a drivers/net/ethernet/intel/i40evf/i40evf_main.c Avinash Day=
anand      2017-12-18  2116  		return;
06aa040f039404a drivers/net/ethernet/intel/i40evf/i40evf_main.c Avinash Day=
anand      2017-12-18  2117  =

5ac49f3c2702f26 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-08-04  2118  	if (iavf_lock_timeout(&adapter->crit_lock, 20=
0)) {
226d528512cfac8 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-03-16  2119  		schedule_work(&adapter->reset_task);
226d528512cfac8 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-03-16  2120  		return;
226d528512cfac8 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-03-16  2121  	}
5ac49f3c2702f26 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-08-04  2122  	while (!mutex_trylock(&adapter->client_lock))
f98a20068dfcc16 drivers/net/ethernet/intel/i40evf/i40evf_main.c Neerav Pari=
kh         2014-09-13  2123  		usleep_range(500, 1000);
ed0e894de7c1339 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2017-01-24  2124  	if (CLIENT_ENABLED(adapter)) {
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2125  		adapter->flags &=3D ~(IAVF_FLAG_CLIENT_NEEDS=
_OPEN |
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2126  				    IAVF_FLAG_CLIENT_NEEDS_CLOSE |
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2127  				    IAVF_FLAG_CLIENT_NEEDS_L2_PARAMS |
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2128  				    IAVF_FLAG_SERVICE_CLIENT_REQUESTED);
ed0e894de7c1339 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2017-01-24  2129  		cancel_delayed_work_sync(&adapter->client_ta=
sk);
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2130  		iavf_notify_client_close(&adapter->vsi, true=
);
ed0e894de7c1339 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2017-01-24  2131  	}
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2132  	iavf_misc_irq_disable(adapter);
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2133  	if (adapter->flags & IAVF_FLAG_RESET_NEEDED) {
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2134  		adapter->flags &=3D ~IAVF_FLAG_RESET_NEEDED;
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2135  		/* Restart the AQ here. If we have been rese=
t but didn't
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2136  		 * detect it, or if the PF had to reinit, ou=
r AQ will be hosed.
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2137  		 */
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2138  		iavf_shutdown_adminq(hw);
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2139  		iavf_init_adminq(hw);
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2140  		iavf_request_reset(adapter);
3526d8005f23da2 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-03-06  2141  	}
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2142  	adapter->flags |=3D IAVF_FLAG_RESET_PENDING;
3526d8005f23da2 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-03-06  2143  =

ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2144  	/* poll until we see the reset actually happe=
n */
8e3e4b9da7e6268 drivers/net/ethernet/intel/iavf/iavf_main.c     Paul Greenw=
alt        2020-06-05  2145  	for (i =3D 0; i < IAVF_RESET_WAIT_DETECTED_CO=
UNT; i++) {
f1cad2ce06f28c4 drivers/net/ethernet/intel/iavf/iavf_main.c     Jesse Brand=
eburg      2018-09-14  2146  		reg_val =3D rd32(hw, IAVF_VF_ARQLEN1) &
f1cad2ce06f28c4 drivers/net/ethernet/intel/iavf/iavf_main.c     Jesse Brand=
eburg      2018-09-14  2147  			  IAVF_VF_ARQLEN1_ARQENABLE_MASK;
ee5c1e92dd01d37 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-08-28  2148  		if (!reg_val)
ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2149  			break;
ee5c1e92dd01d37 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-08-28  2150  		usleep_range(5000, 10000);
ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2151  	}
8e3e4b9da7e6268 drivers/net/ethernet/intel/iavf/iavf_main.c     Paul Greenw=
alt        2020-06-05  2152  	if (i =3D=3D IAVF_RESET_WAIT_DETECTED_COUNT) {
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2153  		dev_info(&adapter->pdev->dev, "Never saw res=
et\n");
ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2154  		goto continue_reset; /* act like the reset h=
appened */
ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2155  	}
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2156  =

ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2157  	/* wait until the reset is complete and the P=
F is responding to us */
8e3e4b9da7e6268 drivers/net/ethernet/intel/iavf/iavf_main.c     Paul Greenw=
alt        2020-06-05  2158  	for (i =3D 0; i < IAVF_RESET_WAIT_COMPLETE_CO=
UNT; i++) {
7d3f04af69bed2d drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2016-10-05  2159  		/* sleep first to make sure a minimum wait t=
ime is met */
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2160  		msleep(IAVF_RESET_WAIT_MS);
7d3f04af69bed2d drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2016-10-05  2161  =

f1cad2ce06f28c4 drivers/net/ethernet/intel/iavf/iavf_main.c     Jesse Brand=
eburg      2018-09-14  2162  		reg_val =3D rd32(hw, IAVF_VFGEN_RSTAT) &
f1cad2ce06f28c4 drivers/net/ethernet/intel/iavf/iavf_main.c     Jesse Brand=
eburg      2018-09-14  2163  			  IAVF_VFGEN_RSTAT_VFR_STATE_MASK;
310a2ad92e3fd91 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jesse Brand=
eburg      2017-05-11  2164  		if (reg_val =3D=3D VIRTCHNL_VFR_VFACTIVE)
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2165  			break;
ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2166  	}
7d3f04af69bed2d drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2016-10-05  2167  =

509a447ae80c2e4 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-12-23  2168  	pci_set_master(adapter->pdev);
7d3f04af69bed2d drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2016-10-05  2169  =

8e3e4b9da7e6268 drivers/net/ethernet/intel/iavf/iavf_main.c     Paul Greenw=
alt        2020-06-05  2170  	if (i =3D=3D IAVF_RESET_WAIT_COMPLETE_COUNT) {
80e7289356cdba9 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-05-10  2171  		dev_err(&adapter->pdev->dev, "Reset never fi=
nished (%x)\n",
ee5c1e92dd01d37 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-08-28  2172  			reg_val);
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2173  		iavf_disable_vf(adapter);
5ac49f3c2702f26 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-08-04  2174  		mutex_unlock(&adapter->client_lock);
ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2175  		return; /* Do not attempt to reinit. It's de=
ad, Jim. */
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2176  	}
ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2177  =

ef8693eb90ae387 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-02-13  2178  continue_reset:
44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2179  	/* We don't use netif_running() because it ma=
y be true prior to
44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2180  	 * ndo_open() returning, so we can't assume i=
t means all our open
44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2181  	 * tasks have finished, since we're not holdi=
ng the rtnl_lock here.
44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2182  	 */
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2183  	running =3D ((adapter->state =3D=3D __IAVF_RU=
NNING) ||
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2184  		   (adapter->state =3D=3D __IAVF_RESETTING));
44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2185  =

44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2186  	if (running) {
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2187  		netif_carrier_off(netdev);
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2188  		netif_tx_stop_all_queues(netdev);
3f341acc1c65b80 drivers/net/ethernet/intel/i40evf/i40evf_main.c Sridhar Sam=
udrala     2016-09-01  2189  		adapter->link_up =3D false;
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2190  		iavf_napi_disable_all(adapter);
3c8e0b989aa1afc drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-02-27  2191  	}
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2192  	iavf_irq_disable(adapter);
3c8e0b989aa1afc drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-02-27  2193  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2194  	adapter->state =3D __IAVF_RESETTING;
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2195  	adapter->flags &=3D ~IAVF_FLAG_RESET_PENDING;
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2196  =

67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2197  	/* free the Tx/Rx rings and descriptors, migh=
t be better to just
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2198  	 * re-use them sometime in the future
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2199  	 */
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2200  	iavf_free_all_rx_resources(adapter);
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2201  	iavf_free_all_tx_resources(adapter);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2202  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2203  	adapter->flags |=3D IAVF_FLAG_QUEUES_DISABLED;
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2204  	/* kill and reinit the admin queue */
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2205  	iavf_shutdown_adminq(hw);
310a2ad92e3fd91 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jesse Brand=
eburg      2017-05-11  2206  	adapter->current_op =3D VIRTCHNL_OP_UNKNOWN;
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2207  	err =3D iavf_init_adminq(hw);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2208  	if (err)
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2209  		dev_info(&adapter->pdev->dev, "Failed to ini=
t adminq: %d\n",
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2210  			 err);
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2211  	adapter->aq_required =3D 0;
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2212  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2213  	if (adapter->flags & IAVF_FLAG_REINIT_ITR_NEE=
DED) {
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2214  		err =3D iavf_reinit_interrupt_scheme(adapter=
);
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2215  		if (err)
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2216  			goto reset_err;
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2217  	}
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2218  =

a7550f8b1c97128 drivers/net/ethernet/intel/iavf/iavf_main.c     Md Fahad Iq=
bal Polash 2021-06-04  2219  	if (RSS_AQ(adapter)) {
a7550f8b1c97128 drivers/net/ethernet/intel/iavf/iavf_main.c     Md Fahad Iq=
bal Polash 2021-06-04  2220  		adapter->aq_required |=3D IAVF_FLAG_AQ_CONFI=
GURE_RSS;
a7550f8b1c97128 drivers/net/ethernet/intel/iavf/iavf_main.c     Md Fahad Iq=
bal Polash 2021-06-04  2221  	} else {
a7550f8b1c97128 drivers/net/ethernet/intel/iavf/iavf_main.c     Md Fahad Iq=
bal Polash 2021-06-04  2222  		err =3D iavf_init_rss(adapter);
a7550f8b1c97128 drivers/net/ethernet/intel/iavf/iavf_main.c     Md Fahad Iq=
bal Polash 2021-06-04  2223  		if (err)
a7550f8b1c97128 drivers/net/ethernet/intel/iavf/iavf_main.c     Md Fahad Iq=
bal Polash 2021-06-04  2224  			goto reset_err;
a7550f8b1c97128 drivers/net/ethernet/intel/iavf/iavf_main.c     Md Fahad Iq=
bal Polash 2021-06-04  2225  	}
a7550f8b1c97128 drivers/net/ethernet/intel/iavf/iavf_main.c     Md Fahad Iq=
bal Polash 2021-06-04  2226  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2227  	adapter->aq_required |=3D IAVF_FLAG_AQ_GET_CO=
NFIG;
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2228  	adapter->aq_required |=3D IAVF_FLAG_AQ_MAP_VE=
CTORS;
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2229  =

504398f0a78e724 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2230  	spin_lock_bh(&adapter->mac_vlan_list_lock);
504398f0a78e724 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2231  =

9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2232  	/* Delete filter for the current MAC address,=
 it could have
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2233  	 * been changed by the PF via administrativel=
y set MAC.
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2234  	 * Will be re-added via VIRTCHNL_OP_GET_VF_RE=
SOURCES.
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2235  	 */
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2236  	list_for_each_entry_safe(f, ftmp, &adapter->m=
ac_filter_list, list) {
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2237  		if (ether_addr_equal(f->macaddr, adapter->hw=
.mac.addr)) {
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2238  			list_del(&f->list);
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2239  			kfree(f);
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2240  		}
9e05229190380f6 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2019-12-17  2241  	}
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2242  	/* re-add all MAC filters */
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2243  	list_for_each_entry(f, &adapter->mac_filter_l=
ist, list) {
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2244  		f->add =3D true;
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2245  	}
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2246  	/* re-add all VLAN filters */
40d01366e6dd5ef drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-10-01  2247  	list_for_each_entry(vlf, &adapter->vlan_filte=
r_list, list) {
40d01366e6dd5ef drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-10-01  2248  		vlf->add =3D true;
ac833bbf7958bbd drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-01-29  2249  	}
504398f0a78e724 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2250  =

504398f0a78e724 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2251  	spin_unlock_bh(&adapter->mac_vlan_list_lock);
504398f0a78e724 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2252  =

0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2253  	/* check if TCs are running and re-add all cl=
oud filters */
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2254  	spin_lock_bh(&adapter->cloud_filter_list_lock=
);
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2255  	if ((vfres->vf_cap_flags & VIRTCHNL_VF_OFFLOA=
D_ADQ) &&
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2256  	    adapter->num_tc) {
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2257  		list_for_each_entry(cf, &adapter->cloud_filt=
er_list, list) {
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2258  			cf->add =3D true;
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2259  		}
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2260  	}
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2261  	spin_unlock_bh(&adapter->cloud_filter_list_lo=
ck);
0075fa0fadd0ac6 drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha R=
amamurthy  2018-01-23  2262  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2263  	adapter->aq_required |=3D IAVF_FLAG_AQ_ADD_MA=
C_FILTER;
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2264  	adapter->aq_required |=3D IAVF_FLAG_AQ_ADD_VL=
AN_FILTER;
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2265  	adapter->aq_required |=3D IAVF_FLAG_AQ_ADD_CL=
OUD_FILTER;
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2266  	iavf_misc_irq_enable(adapter);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2267  =

fdd4044ffdc8313 drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawla=
k          2019-05-14  2268  	mod_delayed_work(iavf_wq, &adapter->watchdog_=
task, 2);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2269  =

44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2270  	/* We were running when the reset started, so=
 we need to restore some
44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2271  	 * state here.
44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2272  	 */
44b034b406211fc drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Kelle=
r          2017-10-27  2273  	if (running) {
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2274  		/* allocate transmit descriptors */
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2275  		err =3D iavf_setup_all_tx_resources(adapter);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2276  		if (err)
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2277  			goto reset_err;
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2278  =

5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2279  		/* allocate receive descriptors */
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2280  		err =3D iavf_setup_all_rx_resources(adapter);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2281  		if (err)
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2282  			goto reset_err;
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2283  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2284  		if (adapter->flags & IAVF_FLAG_REINIT_ITR_NE=
EDED) {
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2285  			err =3D iavf_request_traffic_irqs(adapter, =
netdev->name);
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2286  			if (err)
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2287  				goto reset_err;
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2288  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2289  			adapter->flags &=3D ~IAVF_FLAG_REINIT_ITR_N=
EEDED;
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2290  		}
5b36e8d04b4439c drivers/net/ethernet/intel/i40evf/i40evf_main.c Alan Brady =
           2017-08-22  2291  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2292  		iavf_configure(adapter);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2293  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2294  		iavf_up_complete(adapter);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2295  =

129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2296  		iavf_irq_enable(adapter, true);
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2297  	} else {
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14  2298  		adapter->state =3D __IAVF_DOWN;
fe2647ab0c9970c drivers/net/ethernet/intel/i40evf/i40evf_main.c Sudheer Mog=
ilappagari 2017-06-23  2299  		wake_up(&adapter->down_waitqueue);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2300  	}
5ac49f3c2702f26 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-08-04  2301  	mutex_unlock(&adapter->client_lock);
5ac49f3c2702f26 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-08-04  2302  	mutex_unlock(&adapter->crit_lock);
67c818a1d58c789 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2015-06-19  2303  =

5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2304  	return;
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2305  reset_err:
5ac49f3c2702f26 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-08-04  2306  	mutex_unlock(&adapter->client_lock);
5ac49f3c2702f26 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assm=
ann        2021-08-04  2307  	mutex_unlock(&adapter->crit_lock);
80e7289356cdba9 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willi=
ams        2014-05-10  2308  	dev_err(&adapter->pdev->dev, "failed to alloc=
ate resources during reinit\n");
129cf89e585676e drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brand=
eburg      2018-09-14 @2309  	iavf_close(netdev);
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2310  }
5eae00c57f5e42b drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose  =
           2013-12-21  2311  =


:::::: The code at line 2309 was first introduced by commit
:::::: 129cf89e585676ea4cc4c096bad46ad73c46e21f iavf: rename functions and =
structs to new name

:::::: TO: Jesse Brandeburg <jesse.brandeburg@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0467797922855377753==--

