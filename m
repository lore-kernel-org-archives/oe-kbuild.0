Content-Type: multipart/mixed; boundary="===============1439512159231311101=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tnguy-next-queue:dev-queue 95/117] drivers/net/ethernet/intel/iavf/iavf_main.c:1891:6-8: WARNING: possible condition with no effect (if == else)
Date: Wed, 08 Dec 2021 16:04:28 +0800
Message-ID: <202112081620.ErXaJQWa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1439512159231311101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
CC: linux-kernel(a)vger.kernel.org
TO: Brett Creeley <brett.creeley@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.gi=
t dev-queue
head:   a919bf22e7b438986baa113c806b1c93f3ad6b17
commit: d37218ea7dc5c7919c06b55adc3f826838bc768d [95/117] iavf: Add support=
 for VIRTCHNL_VF_OFFLOAD_VLAN_V2 offload enable/disable
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: powerpc-randconfig-c023-20211207 (https://download.01.org/0day-ci/a=
rchive/20211208/202112081620.ErXaJQWa-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/iavf/iavf_main.c:1891:6-8: WARNING: possible =
condition with no effect (if =3D=3D else)

vim +1891 drivers/net/ethernet/intel/iavf/iavf_main.c

b476b0030e612e Jakub Pawlak  2019-05-14  1858  =

d37218ea7dc5c7 Brett Creeley 2021-11-30  1859  /**
d37218ea7dc5c7 Brett Creeley 2021-11-30  1860   * iavf_set_vlan_offload_fea=
tures - set VLAN offload configuration
d37218ea7dc5c7 Brett Creeley 2021-11-30  1861   * @adapter: board private s=
tructure
d37218ea7dc5c7 Brett Creeley 2021-11-30  1862   * @prev_features: previous =
features used for comparison
d37218ea7dc5c7 Brett Creeley 2021-11-30  1863   * @features: updated featur=
es used for configuration
d37218ea7dc5c7 Brett Creeley 2021-11-30  1864   *
d37218ea7dc5c7 Brett Creeley 2021-11-30  1865   * Set the aq_required bit(s=
) based on the requested features passed in to
d37218ea7dc5c7 Brett Creeley 2021-11-30  1866   * configure VLAN stripping =
and/or VLAN insertion if supported. Also, schedule
d37218ea7dc5c7 Brett Creeley 2021-11-30  1867   * the watchdog if any chang=
es are requested to expedite the request via
d37218ea7dc5c7 Brett Creeley 2021-11-30  1868   * virtchnl.
d37218ea7dc5c7 Brett Creeley 2021-11-30  1869   **/
d37218ea7dc5c7 Brett Creeley 2021-11-30  1870  void
d37218ea7dc5c7 Brett Creeley 2021-11-30  1871  iavf_set_vlan_offload_featur=
es(struct iavf_adapter *adapter,
d37218ea7dc5c7 Brett Creeley 2021-11-30  1872  			       netdev_features_t =
prev_features,
d37218ea7dc5c7 Brett Creeley 2021-11-30  1873  			       netdev_features_t =
features)
d37218ea7dc5c7 Brett Creeley 2021-11-30  1874  {
d37218ea7dc5c7 Brett Creeley 2021-11-30  1875  	bool enable_stripping =3D t=
rue, enable_insertion =3D true;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1876  	u16 vlan_ethertype =3D 0;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1877  	u64 aq_required =3D 0;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1878  =

d37218ea7dc5c7 Brett Creeley 2021-11-30  1879  	/* keep cases separate beca=
use one ethertype for offloads can be
d37218ea7dc5c7 Brett Creeley 2021-11-30  1880  	 * disabled at the same tim=
e as another is disabled, so check for an
d37218ea7dc5c7 Brett Creeley 2021-11-30  1881  	 * enabled ethertype first,=
 then check for disabled. Default to
d37218ea7dc5c7 Brett Creeley 2021-11-30  1882  	 * ETH_P_8021Q so an ethert=
ype is specified if disabling insertion and
d37218ea7dc5c7 Brett Creeley 2021-11-30  1883  	 * stripping.
d37218ea7dc5c7 Brett Creeley 2021-11-30  1884  	 */
d37218ea7dc5c7 Brett Creeley 2021-11-30  1885  	if (features & (NETIF_F_HW_=
VLAN_STAG_RX | NETIF_F_HW_VLAN_STAG_TX))
d37218ea7dc5c7 Brett Creeley 2021-11-30  1886  		vlan_ethertype =3D ETH_P_8=
021AD;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1887  	else if (features & (NETIF_=
F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CTAG_TX))
d37218ea7dc5c7 Brett Creeley 2021-11-30  1888  		vlan_ethertype =3D ETH_P_8=
021Q;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1889  	else if (prev_features & (N=
ETIF_F_HW_VLAN_STAG_RX | NETIF_F_HW_VLAN_STAG_TX))
d37218ea7dc5c7 Brett Creeley 2021-11-30  1890  		vlan_ethertype =3D ETH_P_8=
021AD;
d37218ea7dc5c7 Brett Creeley 2021-11-30 @1891  	else if (prev_features & (N=
ETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CTAG_TX))
d37218ea7dc5c7 Brett Creeley 2021-11-30  1892  		vlan_ethertype =3D ETH_P_8=
021Q;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1893  	else
d37218ea7dc5c7 Brett Creeley 2021-11-30  1894  		vlan_ethertype =3D ETH_P_8=
021Q;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1895  =

d37218ea7dc5c7 Brett Creeley 2021-11-30  1896  	if (!(features & (NETIF_F_H=
W_VLAN_STAG_RX | NETIF_F_HW_VLAN_CTAG_RX)))
d37218ea7dc5c7 Brett Creeley 2021-11-30  1897  		enable_stripping =3D false;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1898  	if (!(features & (NETIF_F_H=
W_VLAN_STAG_TX | NETIF_F_HW_VLAN_CTAG_TX)))
d37218ea7dc5c7 Brett Creeley 2021-11-30  1899  		enable_insertion =3D false;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1900  =

d37218ea7dc5c7 Brett Creeley 2021-11-30  1901  	if (VLAN_ALLOWED(adapter)) {
d37218ea7dc5c7 Brett Creeley 2021-11-30  1902  		/* VIRTCHNL_VF_OFFLOAD_VLA=
N only has support for toggling VLAN
d37218ea7dc5c7 Brett Creeley 2021-11-30  1903  		 * stripping via virtchnl.=
 VLAN insertion can be toggled on the
d37218ea7dc5c7 Brett Creeley 2021-11-30  1904  		 * netdev, but it doesn't =
require a virtchnl message
d37218ea7dc5c7 Brett Creeley 2021-11-30  1905  		 */
d37218ea7dc5c7 Brett Creeley 2021-11-30  1906  		if (enable_stripping)
d37218ea7dc5c7 Brett Creeley 2021-11-30  1907  			aq_required |=3D IAVF_FLA=
G_AQ_ENABLE_VLAN_STRIPPING;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1908  		else
d37218ea7dc5c7 Brett Creeley 2021-11-30  1909  			aq_required |=3D IAVF_FLA=
G_AQ_DISABLE_VLAN_STRIPPING;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1910  =

d37218ea7dc5c7 Brett Creeley 2021-11-30  1911  	} else if (VLAN_V2_ALLOWED(=
adapter)) {
d37218ea7dc5c7 Brett Creeley 2021-11-30  1912  		switch (vlan_ethertype) {
d37218ea7dc5c7 Brett Creeley 2021-11-30  1913  		case ETH_P_8021Q:
d37218ea7dc5c7 Brett Creeley 2021-11-30  1914  			if (enable_stripping)
d37218ea7dc5c7 Brett Creeley 2021-11-30  1915  				aq_required |=3D IAVF_FL=
AG_AQ_ENABLE_CTAG_VLAN_STRIPPING;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1916  			else
d37218ea7dc5c7 Brett Creeley 2021-11-30  1917  				aq_required |=3D IAVF_FL=
AG_AQ_DISABLE_CTAG_VLAN_STRIPPING;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1918  =

d37218ea7dc5c7 Brett Creeley 2021-11-30  1919  			if (enable_insertion)
d37218ea7dc5c7 Brett Creeley 2021-11-30  1920  				aq_required |=3D IAVF_FL=
AG_AQ_ENABLE_CTAG_VLAN_INSERTION;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1921  			else
d37218ea7dc5c7 Brett Creeley 2021-11-30  1922  				aq_required |=3D IAVF_FL=
AG_AQ_DISABLE_CTAG_VLAN_INSERTION;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1923  			break;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1924  		case ETH_P_8021AD:
d37218ea7dc5c7 Brett Creeley 2021-11-30  1925  			if (enable_stripping)
d37218ea7dc5c7 Brett Creeley 2021-11-30  1926  				aq_required |=3D IAVF_FL=
AG_AQ_ENABLE_STAG_VLAN_STRIPPING;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1927  			else
d37218ea7dc5c7 Brett Creeley 2021-11-30  1928  				aq_required |=3D IAVF_FL=
AG_AQ_DISABLE_STAG_VLAN_STRIPPING;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1929  =

d37218ea7dc5c7 Brett Creeley 2021-11-30  1930  			if (enable_insertion)
d37218ea7dc5c7 Brett Creeley 2021-11-30  1931  				aq_required |=3D IAVF_FL=
AG_AQ_ENABLE_STAG_VLAN_INSERTION;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1932  			else
d37218ea7dc5c7 Brett Creeley 2021-11-30  1933  				aq_required |=3D IAVF_FL=
AG_AQ_DISABLE_STAG_VLAN_INSERTION;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1934  			break;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1935  		}
d37218ea7dc5c7 Brett Creeley 2021-11-30  1936  	}
d37218ea7dc5c7 Brett Creeley 2021-11-30  1937  =

d37218ea7dc5c7 Brett Creeley 2021-11-30  1938  	if (aq_required) {
d37218ea7dc5c7 Brett Creeley 2021-11-30  1939  		adapter->aq_required |=3D =
aq_required;
d37218ea7dc5c7 Brett Creeley 2021-11-30  1940  		mod_delayed_work(iavf_wq, =
&adapter->watchdog_task, 0);
d37218ea7dc5c7 Brett Creeley 2021-11-30  1941  	}
d37218ea7dc5c7 Brett Creeley 2021-11-30  1942  }
d37218ea7dc5c7 Brett Creeley 2021-11-30  1943  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1439512159231311101==--

