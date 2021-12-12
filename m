Content-Type: multipart/mixed; boundary="===============5401638289509478604=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/iavf/iavf_main.c:2065 iavf_watchdog_task() warn: inconsistent returns '&adapter->crit_lock'.
Date: Sun, 12 Dec 2021 12:13:41 +0800
Message-ID: <202112121221.DwFIXdGv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5401638289509478604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mateusz Palczewski <mateusz.palczewski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Jakub Pawlak <jakub.pawlak@intel.com>
CC: Jan Sokolowski <jan.sokolowski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 898ef1cb1cb24040c3e89263e02c605af70c776a iavf: Combine init and wat=
chdog state machines
date:   8 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-m031-20211211 (https://download.01.org/0day-ci/arch=
ive/20211212/202112121221.DwFIXdGv-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/intel/iavf/iavf_main.c:2065 iavf_watchdog_task() warn:=
 inconsistent returns '&adapter->crit_lock'.

Old smatch warnings:
drivers/net/ethernet/intel/iavf/iavf_main.c:2354 iavf_reset_task() warn: in=
consistent returns '&adapter->crit_lock'.

vim +2065 drivers/net/ethernet/intel/iavf/iavf_main.c

b66c7bc1cd4d72 drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1928  =

b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1929  /**
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1930   * iavf_watchdog_task - Periodic call-back task
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1931   * @work: pointer to work_struct
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1932   **/
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1933  static void iavf_watchdog_task(struct work_struc=
t *work)
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1934  {
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1935  	struct iavf_adapter *adapter =3D container_of(w=
ork,
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1936  						    struct iavf_adapter,
fdd4044ffdc831 drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1937  						    watchdog_task.work);
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1938  	struct iavf_hw *hw =3D &adapter->hw;
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1939  	u32 reg_val;
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1940  =

5ac49f3c2702f2 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assma=
nn       2021-08-04  1941  	if (!mutex_trylock(&adapter->crit_lock))
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1942  		goto restart_watchdog;
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1943  =

bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  1944  	if (adapter->flags & IAVF_FLAG_PF_COMMS_FAILED)
45eebd62999d37 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1945  		iavf_change_state(adapter, __IAVF_COMM_FAILED);
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  1946  =

898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1947  	if (adapter->flags & IAVF_FLAG_RESET_NEEDED &&
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1948  	    adapter->state !=3D __IAVF_RESETTING) {
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1949  		iavf_change_state(adapter, __IAVF_RESETTING);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1950  		adapter->aq_required =3D 0;
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1951  		adapter->current_op =3D VIRTCHNL_OP_UNKNOWN;
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1952  	}
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1953  =

bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  1954  	switch (adapter->state) {
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1955  	case __IAVF_STARTUP:
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1956  		iavf_startup(adapter);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1957  		mutex_unlock(&adapter->crit_lock);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1958  		queue_delayed_work(iavf_wq, &adapter->watchdog=
_task,
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1959  				   msecs_to_jiffies(30));
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1960  		return;
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1961  	case __IAVF_INIT_VERSION_CHECK:
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1962  		iavf_init_version_check(adapter);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1963  		mutex_unlock(&adapter->crit_lock);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1964  		queue_delayed_work(iavf_wq, &adapter->watchdog=
_task,
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1965  				   msecs_to_jiffies(30));
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1966  		return;
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1967  	case __IAVF_INIT_GET_RESOURCES:
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1968  		iavf_init_get_resources(adapter);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1969  		mutex_unlock(&adapter->crit_lock);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1970  		queue_delayed_work(iavf_wq, &adapter->watchdog=
_task,
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1971  				   msecs_to_jiffies(1));
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1972  		return;
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1973  	case __IAVF_INIT_FAILED:
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1974  		if (++adapter->aq_wait_count > IAVF_AQ_MAX_ERR=
) {
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1975  			dev_err(&adapter->pdev->dev,
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1976  				"Failed to communicate with PF; waiting befo=
re retry\n");
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1977  			adapter->flags |=3D IAVF_FLAG_PF_COMMS_FAILED;
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1978  			iavf_shutdown_adminq(hw);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1979  			mutex_unlock(&adapter->crit_lock);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1980  			queue_delayed_work(iavf_wq,
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1981  					   &adapter->watchdog_task, (5 * HZ));
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1982  			return;
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1983  		}
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1984  		/* Try again from failed step*/
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1985  		iavf_change_state(adapter, adapter->last_state=
);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1986  		mutex_unlock(&adapter->crit_lock);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1987  		queue_delayed_work(iavf_wq, &adapter->watchdog=
_task, HZ);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1988  		return;
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  1989  	case __IAVF_COMM_FAILED:
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1990  		reg_val =3D rd32(hw, IAVF_VFGEN_RSTAT) &
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1991  			  IAVF_VFGEN_RSTAT_VFR_STATE_MASK;
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1992  		if (reg_val =3D=3D VIRTCHNL_VFR_VFACTIVE ||
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1993  		    reg_val =3D=3D VIRTCHNL_VFR_COMPLETED) {
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1994  			/* A chance for redemption! */
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  1995  			dev_err(&adapter->pdev->dev,
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  1996  				"Hardware came out of reset. Attempting rein=
it.\n");
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  1997  			/* When init task contacts the PF and
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1998  			 * gets everything set up again, it'll restar=
t the
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  1999  			 * watchdog for us. Down, boy. Sit. Stay. Woo=
f.
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2000  			 */
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2001  			iavf_change_state(adapter, __IAVF_STARTUP);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2002  			adapter->flags &=3D ~IAVF_FLAG_PF_COMMS_FAILE=
D;
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2003  		}
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2004  		adapter->aq_required =3D 0;
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2005  		adapter->current_op =3D VIRTCHNL_OP_UNKNOWN;
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2006  		queue_delayed_work(iavf_wq,
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2007  				   &adapter->watchdog_task,
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2008  				   msecs_to_jiffies(10));
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2009  		return;
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2010  	case __IAVF_RESETTING:
5ac49f3c2702f2 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assma=
nn       2021-08-04  2011  		mutex_unlock(&adapter->crit_lock);
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2012  		queue_delayed_work(iavf_wq, &adapter->watchdog=
_task, HZ * 2);
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2013  		return;
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2014  	case __IAVF_DOWN:
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2015  	case __IAVF_DOWN_PENDING:
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2016  	case __IAVF_TESTING:
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2017  	case __IAVF_RUNNING:
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2018  		if (adapter->current_op) {
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2019  			if (!iavf_asq_done(hw)) {
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2020  				dev_dbg(&adapter->pdev->dev,
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2021  					"Admin queue timeout\n");
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2022  				iavf_send_api_ver(adapter);
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2023  			}
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2024  		} else {
9358076642f14c drivers/net/ethernet/intel/iavf/iavf_main.c     Tony Nguyen =
         2020-06-24  2025  			/* An error will be returned if no commands w=
ere
9358076642f14c drivers/net/ethernet/intel/iavf/iavf_main.c     Tony Nguyen =
         2020-06-24  2026  			 * processed; use this opportunity to update =
stats
9358076642f14c drivers/net/ethernet/intel/iavf/iavf_main.c     Tony Nguyen =
         2020-06-24  2027  			 */
9358076642f14c drivers/net/ethernet/intel/iavf/iavf_main.c     Tony Nguyen =
         2020-06-24  2028  			if (iavf_process_aq_command(adapter) &&
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2029  			    adapter->state =3D=3D __IAVF_RUNNING)
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2030  				iavf_request_stats(adapter);
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2031  		}
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2032  		if (adapter->state =3D=3D __IAVF_RUNNING)
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2033  			iavf_detect_recover_hung(&adapter->vsi);
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2034  		break;
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2035  	case __IAVF_REMOVE:
5ac49f3c2702f2 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assma=
nn       2021-08-04  2036  		mutex_unlock(&adapter->crit_lock);
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2037  		return;
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2038  	default:
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2039  		return;
0075fa0fadd0ac drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha Ra=
mamurthy 2018-01-23  2040  	}
0075fa0fadd0ac drivers/net/ethernet/intel/i40evf/i40evf_main.c Harshitha Ra=
mamurthy 2018-01-23  2041  =

bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2042  	/* check for hw reset */
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2043  	reg_val =3D rd32(hw, IAVF_VF_ARQLEN1) & IAVF_VF=
_ARQLEN1_ARQENABLE_MASK;
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2044  	if (!reg_val) {
45eebd62999d37 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2045  		iavf_change_state(adapter, __IAVF_RESETTING);
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2046  		adapter->flags |=3D IAVF_FLAG_RESET_PENDING;
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2047  		adapter->aq_required =3D 0;
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2048  		adapter->current_op =3D VIRTCHNL_OP_UNKNOWN;
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2049  		dev_err(&adapter->pdev->dev, "Hardware reset d=
etected\n");
bac8486116b0ee drivers/net/ethernet/intel/iavf/iavf_main.c     Jan Sokolows=
ki       2019-05-14  2050  		queue_work(iavf_wq, &adapter->reset_task);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2051  		mutex_unlock(&adapter->crit_lock);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2052  		queue_delayed_work(iavf_wq,
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2053  				   &adapter->watchdog_task, HZ * 2);
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2054  		return;
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2055  	}
b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2056  =

b476b0030e612e drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2057  	schedule_delayed_work(&adapter->client_task, ms=
ecs_to_jiffies(5));
5ac49f3c2702f2 drivers/net/ethernet/intel/iavf/iavf_main.c     Stefan Assma=
nn       2021-08-04  2058  	mutex_unlock(&adapter->crit_lock);
ef8693eb90ae38 drivers/net/ethernet/intel/i40evf/i40evf_main.c Mitch Willia=
ms       2014-02-13  2059  restart_watchdog:
898ef1cb1cb240 drivers/net/ethernet/intel/iavf/iavf_main.c     Mateusz Palc=
zewski   2021-08-19  2060  	queue_work(iavf_wq, &adapter->adminq_task);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose   =
         2013-12-21  2061  	if (adapter->aq_required)
fdd4044ffdc831 drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2062  		queue_delayed_work(iavf_wq, &adapter->watchdog=
_task,
fdd4044ffdc831 drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14  2063  				   msecs_to_jiffies(20));
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose   =
         2013-12-21  2064  	else
fdd4044ffdc831 drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak=
         2019-05-14 @2065  		queue_delayed_work(iavf_wq, &adapter->watchdog=
_task, HZ * 2);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose   =
         2013-12-21  2066  }
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose   =
         2013-12-21  2067  =


:::::: The code at line 2065 was first introduced by commit
:::::: fdd4044ffdc8313b91353af7879a39ef9c683bec iavf: Remove timer for work=
 triggering, use delaying work instead

:::::: TO: Jakub Pawlak <jakub.pawlak@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5401638289509478604==--

