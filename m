Content-Type: multipart/mixed; boundary="===============2721800470272365231=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7722/10864] drivers/net/ethernet/intel/iavf/iavf_main.c:1891:6-8: WARNING: possible condition with no effect (if == else)
Date: Wed, 05 Jan 2022 23:27:51 +0800
Message-ID: <202201052357.4Vvbm3Tc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2721800470272365231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Brett Creeley <brett.creeley@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7a769a3922d81cfc74ab4d90a9cc69485f260976
commit: 8afadd1cd8ba1df757011eb58c471eca0ac81872 [7722/10864] iavf: Add sup=
port for VIRTCHNL_VF_OFFLOAD_VLAN_V2 offload enable/disable
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c024-20220105 (https://download.01.org/0day-ci/arch=
ive/20220105/202201052357.4Vvbm3Tc-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/iavf/iavf_main.c:1891:6-8: WARNING: possible =
condition with no effect (if =3D=3D else)

vim +1891 drivers/net/ethernet/intel/iavf/iavf_main.c

b476b0030e612e Jakub Pawlak  2019-05-14  1858  =

8afadd1cd8ba1d Brett Creeley 2021-11-29  1859  /**
8afadd1cd8ba1d Brett Creeley 2021-11-29  1860   * iavf_set_vlan_offload_fea=
tures - set VLAN offload configuration
8afadd1cd8ba1d Brett Creeley 2021-11-29  1861   * @adapter: board private s=
tructure
8afadd1cd8ba1d Brett Creeley 2021-11-29  1862   * @prev_features: previous =
features used for comparison
8afadd1cd8ba1d Brett Creeley 2021-11-29  1863   * @features: updated featur=
es used for configuration
8afadd1cd8ba1d Brett Creeley 2021-11-29  1864   *
8afadd1cd8ba1d Brett Creeley 2021-11-29  1865   * Set the aq_required bit(s=
) based on the requested features passed in to
8afadd1cd8ba1d Brett Creeley 2021-11-29  1866   * configure VLAN stripping =
and/or VLAN insertion if supported. Also, schedule
8afadd1cd8ba1d Brett Creeley 2021-11-29  1867   * the watchdog if any chang=
es are requested to expedite the request via
8afadd1cd8ba1d Brett Creeley 2021-11-29  1868   * virtchnl.
8afadd1cd8ba1d Brett Creeley 2021-11-29  1869   **/
8afadd1cd8ba1d Brett Creeley 2021-11-29  1870  void
8afadd1cd8ba1d Brett Creeley 2021-11-29  1871  iavf_set_vlan_offload_featur=
es(struct iavf_adapter *adapter,
8afadd1cd8ba1d Brett Creeley 2021-11-29  1872  			       netdev_features_t =
prev_features,
8afadd1cd8ba1d Brett Creeley 2021-11-29  1873  			       netdev_features_t =
features)
8afadd1cd8ba1d Brett Creeley 2021-11-29  1874  {
8afadd1cd8ba1d Brett Creeley 2021-11-29  1875  	bool enable_stripping =3D t=
rue, enable_insertion =3D true;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1876  	u16 vlan_ethertype =3D 0;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1877  	u64 aq_required =3D 0;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1878  =

8afadd1cd8ba1d Brett Creeley 2021-11-29  1879  	/* keep cases separate beca=
use one ethertype for offloads can be
8afadd1cd8ba1d Brett Creeley 2021-11-29  1880  	 * disabled at the same tim=
e as another is disabled, so check for an
8afadd1cd8ba1d Brett Creeley 2021-11-29  1881  	 * enabled ethertype first,=
 then check for disabled. Default to
8afadd1cd8ba1d Brett Creeley 2021-11-29  1882  	 * ETH_P_8021Q so an ethert=
ype is specified if disabling insertion and
8afadd1cd8ba1d Brett Creeley 2021-11-29  1883  	 * stripping.
8afadd1cd8ba1d Brett Creeley 2021-11-29  1884  	 */
8afadd1cd8ba1d Brett Creeley 2021-11-29  1885  	if (features & (NETIF_F_HW_=
VLAN_STAG_RX | NETIF_F_HW_VLAN_STAG_TX))
8afadd1cd8ba1d Brett Creeley 2021-11-29  1886  		vlan_ethertype =3D ETH_P_8=
021AD;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1887  	else if (features & (NETIF_=
F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CTAG_TX))
8afadd1cd8ba1d Brett Creeley 2021-11-29  1888  		vlan_ethertype =3D ETH_P_8=
021Q;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1889  	else if (prev_features & (N=
ETIF_F_HW_VLAN_STAG_RX | NETIF_F_HW_VLAN_STAG_TX))
8afadd1cd8ba1d Brett Creeley 2021-11-29  1890  		vlan_ethertype =3D ETH_P_8=
021AD;
8afadd1cd8ba1d Brett Creeley 2021-11-29 @1891  	else if (prev_features & (N=
ETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CTAG_TX))
8afadd1cd8ba1d Brett Creeley 2021-11-29  1892  		vlan_ethertype =3D ETH_P_8=
021Q;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1893  	else
8afadd1cd8ba1d Brett Creeley 2021-11-29  1894  		vlan_ethertype =3D ETH_P_8=
021Q;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1895  =

8afadd1cd8ba1d Brett Creeley 2021-11-29  1896  	if (!(features & (NETIF_F_H=
W_VLAN_STAG_RX | NETIF_F_HW_VLAN_CTAG_RX)))
8afadd1cd8ba1d Brett Creeley 2021-11-29  1897  		enable_stripping =3D false;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1898  	if (!(features & (NETIF_F_H=
W_VLAN_STAG_TX | NETIF_F_HW_VLAN_CTAG_TX)))
8afadd1cd8ba1d Brett Creeley 2021-11-29  1899  		enable_insertion =3D false;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1900  =

8afadd1cd8ba1d Brett Creeley 2021-11-29  1901  	if (VLAN_ALLOWED(adapter)) {
8afadd1cd8ba1d Brett Creeley 2021-11-29  1902  		/* VIRTCHNL_VF_OFFLOAD_VLA=
N only has support for toggling VLAN
8afadd1cd8ba1d Brett Creeley 2021-11-29  1903  		 * stripping via virtchnl.=
 VLAN insertion can be toggled on the
8afadd1cd8ba1d Brett Creeley 2021-11-29  1904  		 * netdev, but it doesn't =
require a virtchnl message
8afadd1cd8ba1d Brett Creeley 2021-11-29  1905  		 */
8afadd1cd8ba1d Brett Creeley 2021-11-29  1906  		if (enable_stripping)
8afadd1cd8ba1d Brett Creeley 2021-11-29  1907  			aq_required |=3D IAVF_FLA=
G_AQ_ENABLE_VLAN_STRIPPING;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1908  		else
8afadd1cd8ba1d Brett Creeley 2021-11-29  1909  			aq_required |=3D IAVF_FLA=
G_AQ_DISABLE_VLAN_STRIPPING;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1910  =

8afadd1cd8ba1d Brett Creeley 2021-11-29  1911  	} else if (VLAN_V2_ALLOWED(=
adapter)) {
8afadd1cd8ba1d Brett Creeley 2021-11-29  1912  		switch (vlan_ethertype) {
8afadd1cd8ba1d Brett Creeley 2021-11-29  1913  		case ETH_P_8021Q:
8afadd1cd8ba1d Brett Creeley 2021-11-29  1914  			if (enable_stripping)
8afadd1cd8ba1d Brett Creeley 2021-11-29  1915  				aq_required |=3D IAVF_FL=
AG_AQ_ENABLE_CTAG_VLAN_STRIPPING;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1916  			else
8afadd1cd8ba1d Brett Creeley 2021-11-29  1917  				aq_required |=3D IAVF_FL=
AG_AQ_DISABLE_CTAG_VLAN_STRIPPING;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1918  =

8afadd1cd8ba1d Brett Creeley 2021-11-29  1919  			if (enable_insertion)
8afadd1cd8ba1d Brett Creeley 2021-11-29  1920  				aq_required |=3D IAVF_FL=
AG_AQ_ENABLE_CTAG_VLAN_INSERTION;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1921  			else
8afadd1cd8ba1d Brett Creeley 2021-11-29  1922  				aq_required |=3D IAVF_FL=
AG_AQ_DISABLE_CTAG_VLAN_INSERTION;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1923  			break;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1924  		case ETH_P_8021AD:
8afadd1cd8ba1d Brett Creeley 2021-11-29  1925  			if (enable_stripping)
8afadd1cd8ba1d Brett Creeley 2021-11-29  1926  				aq_required |=3D IAVF_FL=
AG_AQ_ENABLE_STAG_VLAN_STRIPPING;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1927  			else
8afadd1cd8ba1d Brett Creeley 2021-11-29  1928  				aq_required |=3D IAVF_FL=
AG_AQ_DISABLE_STAG_VLAN_STRIPPING;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1929  =

8afadd1cd8ba1d Brett Creeley 2021-11-29  1930  			if (enable_insertion)
8afadd1cd8ba1d Brett Creeley 2021-11-29  1931  				aq_required |=3D IAVF_FL=
AG_AQ_ENABLE_STAG_VLAN_INSERTION;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1932  			else
8afadd1cd8ba1d Brett Creeley 2021-11-29  1933  				aq_required |=3D IAVF_FL=
AG_AQ_DISABLE_STAG_VLAN_INSERTION;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1934  			break;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1935  		}
8afadd1cd8ba1d Brett Creeley 2021-11-29  1936  	}
8afadd1cd8ba1d Brett Creeley 2021-11-29  1937  =

8afadd1cd8ba1d Brett Creeley 2021-11-29  1938  	if (aq_required) {
8afadd1cd8ba1d Brett Creeley 2021-11-29  1939  		adapter->aq_required |=3D =
aq_required;
8afadd1cd8ba1d Brett Creeley 2021-11-29  1940  		mod_delayed_work(iavf_wq, =
&adapter->watchdog_task, 0);
8afadd1cd8ba1d Brett Creeley 2021-11-29  1941  	}
8afadd1cd8ba1d Brett Creeley 2021-11-29  1942  }
8afadd1cd8ba1d Brett Creeley 2021-11-29  1943  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2721800470272365231==--

