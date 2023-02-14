Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A2410799
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Feb 2023 10:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676371446; x=1707907446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q/wCM2G5pbvxb57CXFPcJYqJOBuC0S9+FmYr+V/XSO0=;
  b=l0YpyhUdrIxZhdhyDC8LNevGEF9IK/QYZgN4dcD2Mn46pl/JoSCdd6Rp
   RCBTLnfEJFayYk+eWPFNJULnWN4AUoAsgBJDXloNmw5w4xA+icJ2AXOG8
   tl+UVYoZ6duqn9C7FyhHTVCYDusUx5+0Xoem2QD6WcMSXBjmnbW8Kn/YR
   fcD4ZqhLUE7kMb2QOR65h6ylNAb0P2pZV17gIYiqNe//XeIJ3caZvw6Wh
   PylvqvESEw+AB5Byp0lkZiEKIsxha7EfxXdF//+S0lRsEU5y7pWonJs7X
   FQo1er87O8Z2zm3GIHhpyxaWtLFTmPkDMyzYu5NqvcysGldOpp6r+ACHF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="319162127"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="319162127"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 02:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="793071570"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="793071570"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Feb 2023 02:44:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRsn5-0008Ph-3A;
	Tue, 14 Feb 2023 10:44:03 +0000
Date: Tue, 14 Feb 2023 18:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 10457/12724] drivers/pci/setup-bus.c:1916:21-24:
 ERROR: invalid reference to the index variable of the iterator on line 1890
Message-ID: <202302141850.4L2rwgdH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
commit: 9db0b9b6a14249ef65a5f1e5e3b37762af96f425 [10457/12724] PCI: Take other bus devices into account when distributing resources
:::::: branch date: 7 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/20230214/202302141850.4L2rwgdH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302141850.4L2rwgdH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/setup-bus.c:1916:21-24: ERROR: invalid reference to the index variable of the iterator on line 1890

vim +1916 drivers/pci/setup-bus.c

9db0b9b6a14249 Mika Westerberg      2023-01-31  1822  
9db0b9b6a14249 Mika Westerberg      2023-01-31  1823  /*
9db0b9b6a14249 Mika Westerberg      2023-01-31  1824   * io, mmio and mmio_pref contain the total amount of bridge window space
9db0b9b6a14249 Mika Westerberg      2023-01-31  1825   * available. This includes the minimal space needed to cover all the
9db0b9b6a14249 Mika Westerberg      2023-01-31  1826   * existing devices on the bus and the possible extra space that can be
9db0b9b6a14249 Mika Westerberg      2023-01-31  1827   * shared with the bridges.
9db0b9b6a14249 Mika Westerberg      2023-01-31  1828   */
1a5767725ceced Mika Westerberg      2017-10-13  1829  static void pci_bus_distribute_available_resources(struct pci_bus *bus,
0d6076184aecb9 Nicholas Johnson     2019-05-07  1830  					    struct list_head *add_list,
d555a50fd6e028 Nicholas Johnson     2020-01-06  1831  					    struct resource io,
d555a50fd6e028 Nicholas Johnson     2020-01-06  1832  					    struct resource mmio,
d555a50fd6e028 Nicholas Johnson     2020-01-06  1833  					    struct resource mmio_pref)
1a5767725ceced Mika Westerberg      2017-10-13  1834  {
1a5767725ceced Mika Westerberg      2017-10-13  1835  	unsigned int normal_bridges = 0, hotplug_bridges = 0;
1a5767725ceced Mika Westerberg      2017-10-13  1836  	struct resource *io_res, *mmio_res, *mmio_pref_res;
1a5767725ceced Mika Westerberg      2017-10-13  1837  	struct pci_dev *dev, *bridge = bus->self;
9db0b9b6a14249 Mika Westerberg      2023-01-31  1838  	resource_size_t io_per_b, mmio_per_b, mmio_pref_per_b, align;
1a5767725ceced Mika Westerberg      2017-10-13  1839  
6e0688dbff625f Krzysztof Wilczynski 2020-05-20  1840  	io_res = &bridge->resource[PCI_BRIDGE_IO_WINDOW];
6e0688dbff625f Krzysztof Wilczynski 2020-05-20  1841  	mmio_res = &bridge->resource[PCI_BRIDGE_MEM_WINDOW];
6e0688dbff625f Krzysztof Wilczynski 2020-05-20  1842  	mmio_pref_res = &bridge->resource[PCI_BRIDGE_PREF_MEM_WINDOW];
1a5767725ceced Mika Westerberg      2017-10-13  1843  
f924c26e4ee651 Nicholas Johnson     2020-01-06  1844  	/*
f924c26e4ee651 Nicholas Johnson     2020-01-06  1845  	 * The alignment of this bridge is yet to be considered, hence it must
f924c26e4ee651 Nicholas Johnson     2020-01-06  1846  	 * be done now before extending its bridge window.
f924c26e4ee651 Nicholas Johnson     2020-01-06  1847  	 */
f924c26e4ee651 Nicholas Johnson     2020-01-06  1848  	align = pci_resource_alignment(bridge, io_res);
f924c26e4ee651 Nicholas Johnson     2020-01-06  1849  	if (!io_res->parent && align)
f924c26e4ee651 Nicholas Johnson     2020-01-06  1850  		io.start = min(ALIGN(io.start, align), io.end + 1);
f924c26e4ee651 Nicholas Johnson     2020-01-06  1851  
f924c26e4ee651 Nicholas Johnson     2020-01-06  1852  	align = pci_resource_alignment(bridge, mmio_res);
f924c26e4ee651 Nicholas Johnson     2020-01-06  1853  	if (!mmio_res->parent && align)
f924c26e4ee651 Nicholas Johnson     2020-01-06  1854  		mmio.start = min(ALIGN(mmio.start, align), mmio.end + 1);
f924c26e4ee651 Nicholas Johnson     2020-01-06  1855  
f924c26e4ee651 Nicholas Johnson     2020-01-06  1856  	align = pci_resource_alignment(bridge, mmio_pref_res);
f924c26e4ee651 Nicholas Johnson     2020-01-06  1857  	if (!mmio_pref_res->parent && align)
f924c26e4ee651 Nicholas Johnson     2020-01-06  1858  		mmio_pref.start = min(ALIGN(mmio_pref.start, align),
f924c26e4ee651 Nicholas Johnson     2020-01-06  1859  			mmio_pref.end + 1);
f924c26e4ee651 Nicholas Johnson     2020-01-06  1860  
1a5767725ceced Mika Westerberg      2017-10-13  1861  	/*
ae4611f1d7e99e Nicholas Johnson     2020-01-06  1862  	 * Now that we have adjusted for alignment, update the bridge window
ae4611f1d7e99e Nicholas Johnson     2020-01-06  1863  	 * resources to fill as much remaining resource space as possible.
1a5767725ceced Mika Westerberg      2017-10-13  1864  	 */
1e58f4e1cb47de Nicholas Johnson     2020-01-06  1865  	adjust_bridge_window(bridge, io_res, add_list, resource_size(&io));
1e58f4e1cb47de Nicholas Johnson     2020-01-06  1866  	adjust_bridge_window(bridge, mmio_res, add_list, resource_size(&mmio));
1e58f4e1cb47de Nicholas Johnson     2020-01-06  1867  	adjust_bridge_window(bridge, mmio_pref_res, add_list,
7779385484dad7 Nicholas Johnson     2020-01-28  1868  			     resource_size(&mmio_pref));
1a5767725ceced Mika Westerberg      2017-10-13  1869  
1a5767725ceced Mika Westerberg      2017-10-13  1870  	/*
1a5767725ceced Mika Westerberg      2017-10-13  1871  	 * Calculate how many hotplug bridges and normal bridges there
1a5767725ceced Mika Westerberg      2017-10-13  1872  	 * are on this bus.  We will distribute the additional available
1a5767725ceced Mika Westerberg      2017-10-13  1873  	 * resources between hotplug bridges.
1a5767725ceced Mika Westerberg      2017-10-13  1874  	 */
1a5767725ceced Mika Westerberg      2017-10-13  1875  	for_each_pci_bridge(dev, bus) {
1a5767725ceced Mika Westerberg      2017-10-13  1876  		if (dev->is_hotplug_bridge)
1a5767725ceced Mika Westerberg      2017-10-13  1877  			hotplug_bridges++;
1a5767725ceced Mika Westerberg      2017-10-13  1878  		else
1a5767725ceced Mika Westerberg      2017-10-13  1879  			normal_bridges++;
1a5767725ceced Mika Westerberg      2017-10-13  1880  	}
1a5767725ceced Mika Westerberg      2017-10-13  1881  
9db0b9b6a14249 Mika Westerberg      2023-01-31  1882  	if (!(hotplug_bridges + normal_bridges))
6a381ea694c9da Nicholas Johnson     2019-06-22  1883  		return;
6a381ea694c9da Nicholas Johnson     2019-06-22  1884  
5c6bcc344b18df Nicholas Johnson     2019-06-22  1885  	/*
9db0b9b6a14249 Mika Westerberg      2023-01-31  1886  	 * Calculate the amount of space we can forward from "bus" to any
9db0b9b6a14249 Mika Westerberg      2023-01-31  1887  	 * downstream buses, i.e., the space left over after assigning the
9db0b9b6a14249 Mika Westerberg      2023-01-31  1888  	 * BARs and windows on "bus".
5c6bcc344b18df Nicholas Johnson     2019-06-22  1889  	 */
9db0b9b6a14249 Mika Westerberg      2023-01-31 @1890  	list_for_each_entry(dev, &bus->devices, bus_list) {
9db0b9b6a14249 Mika Westerberg      2023-01-31  1891  		if (!dev->is_virtfn)
9db0b9b6a14249 Mika Westerberg      2023-01-31  1892  			remove_dev_resources(dev, &io, &mmio, &mmio_pref);
9db0b9b6a14249 Mika Westerberg      2023-01-31  1893  	}
1a5767725ceced Mika Westerberg      2017-10-13  1894  
1a5767725ceced Mika Westerberg      2017-10-13  1895  	/*
9db0b9b6a14249 Mika Westerberg      2023-01-31  1896  	 * If there is at least one hotplug bridge on this bus it gets all
9db0b9b6a14249 Mika Westerberg      2023-01-31  1897  	 * the extra resource space that was left after the reductions
9db0b9b6a14249 Mika Westerberg      2023-01-31  1898  	 * above.
9db0b9b6a14249 Mika Westerberg      2023-01-31  1899  	 *
9db0b9b6a14249 Mika Westerberg      2023-01-31  1900  	 * If there are no hotplug bridges the extra resource space is
9db0b9b6a14249 Mika Westerberg      2023-01-31  1901  	 * split between non-hotplug bridges. This is to allow possible
9db0b9b6a14249 Mika Westerberg      2023-01-31  1902  	 * hotplug bridges below them to get the extra space as well.
1a5767725ceced Mika Westerberg      2017-10-13  1903  	 */
9db0b9b6a14249 Mika Westerberg      2023-01-31  1904  	if (hotplug_bridges) {
9db0b9b6a14249 Mika Westerberg      2023-01-31  1905  		io_per_b = div64_ul(resource_size(&io), hotplug_bridges);
9db0b9b6a14249 Mika Westerberg      2023-01-31  1906  		mmio_per_b = div64_ul(resource_size(&mmio), hotplug_bridges);
9db0b9b6a14249 Mika Westerberg      2023-01-31  1907  		mmio_pref_per_b = div64_ul(resource_size(&mmio_pref),
f924c26e4ee651 Nicholas Johnson     2020-01-06  1908  					   hotplug_bridges);
9db0b9b6a14249 Mika Westerberg      2023-01-31  1909  	} else {
9db0b9b6a14249 Mika Westerberg      2023-01-31  1910  		io_per_b = div64_ul(resource_size(&io), normal_bridges);
9db0b9b6a14249 Mika Westerberg      2023-01-31  1911  		mmio_per_b = div64_ul(resource_size(&mmio), normal_bridges);
9db0b9b6a14249 Mika Westerberg      2023-01-31  1912  		mmio_pref_per_b = div64_ul(resource_size(&mmio_pref),
9db0b9b6a14249 Mika Westerberg      2023-01-31  1913  					   normal_bridges);
9db0b9b6a14249 Mika Westerberg      2023-01-31  1914  	}
1a5767725ceced Mika Westerberg      2017-10-13  1915  
1a5767725ceced Mika Westerberg      2017-10-13 @1916  	for_each_pci_bridge(dev, bus) {
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1917  		struct resource *res;
1a5767725ceced Mika Westerberg      2017-10-13  1918  		struct pci_bus *b;
1a5767725ceced Mika Westerberg      2017-10-13  1919  
1a5767725ceced Mika Westerberg      2017-10-13  1920  		b = dev->subordinate;
9db0b9b6a14249 Mika Westerberg      2023-01-31  1921  		if (!b)
1a5767725ceced Mika Westerberg      2017-10-13  1922  			continue;
9db0b9b6a14249 Mika Westerberg      2023-01-31  1923  		if (hotplug_bridges && !dev->is_hotplug_bridge)
9db0b9b6a14249 Mika Westerberg      2023-01-31  1924  			continue;
9db0b9b6a14249 Mika Westerberg      2023-01-31  1925  
9db0b9b6a14249 Mika Westerberg      2023-01-31  1926  		res = &dev->resource[PCI_BRIDGE_IO_WINDOW];
1a5767725ceced Mika Westerberg      2017-10-13  1927  
1a5767725ceced Mika Westerberg      2017-10-13  1928  		/*
9db0b9b6a14249 Mika Westerberg      2023-01-31  1929  		 * Make sure the split resource space is properly aligned
9db0b9b6a14249 Mika Westerberg      2023-01-31  1930  		 * for bridge windows (align it down to avoid going above
9db0b9b6a14249 Mika Westerberg      2023-01-31  1931  		 * what is available).
1a5767725ceced Mika Westerberg      2017-10-13  1932  		 */
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1933  		align = pci_resource_alignment(dev, res);
9db0b9b6a14249 Mika Westerberg      2023-01-31  1934  		io.end = align ? io.start + ALIGN_DOWN(io_per_b, align) - 1
9db0b9b6a14249 Mika Westerberg      2023-01-31  1935  			       : io.start + io_per_b - 1;
9db0b9b6a14249 Mika Westerberg      2023-01-31  1936  
9db0b9b6a14249 Mika Westerberg      2023-01-31  1937  		/*
9db0b9b6a14249 Mika Westerberg      2023-01-31  1938  		 * The x_per_b holds the extra resource space that can be
9db0b9b6a14249 Mika Westerberg      2023-01-31  1939  		 * added for each bridge but there is the minimal already
9db0b9b6a14249 Mika Westerberg      2023-01-31  1940  		 * reserved as well so adjust x.start down accordingly to
9db0b9b6a14249 Mika Westerberg      2023-01-31  1941  		 * cover the whole space.
9db0b9b6a14249 Mika Westerberg      2023-01-31  1942  		 */
9db0b9b6a14249 Mika Westerberg      2023-01-31  1943  		io.start -= resource_size(res);
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1944  
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1945  		res = &dev->resource[PCI_BRIDGE_MEM_WINDOW];
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1946  		align = pci_resource_alignment(dev, res);
9db0b9b6a14249 Mika Westerberg      2023-01-31  1947  		mmio.end = align ? mmio.start + ALIGN_DOWN(mmio_per_b, align) - 1
9db0b9b6a14249 Mika Westerberg      2023-01-31  1948  				 : mmio.start + mmio_per_b - 1;
9db0b9b6a14249 Mika Westerberg      2023-01-31  1949  		mmio.start -= resource_size(res);
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1950  
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1951  		res = &dev->resource[PCI_BRIDGE_PREF_MEM_WINDOW];
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1952  		align = pci_resource_alignment(dev, res);
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1953  		mmio_pref.end = align ? mmio_pref.start +
9db0b9b6a14249 Mika Westerberg      2023-01-31  1954  					ALIGN_DOWN(mmio_pref_per_b, align) - 1
9db0b9b6a14249 Mika Westerberg      2023-01-31  1955  				      : mmio_pref.start + mmio_pref_per_b - 1;
9db0b9b6a14249 Mika Westerberg      2023-01-31  1956  		mmio_pref.start -= resource_size(res);
d555a50fd6e028 Nicholas Johnson     2020-01-06  1957  
d555a50fd6e028 Nicholas Johnson     2020-01-06  1958  		pci_bus_distribute_available_resources(b, add_list, io, mmio,
d555a50fd6e028 Nicholas Johnson     2020-01-06  1959  						       mmio_pref);
f924c26e4ee651 Nicholas Johnson     2020-01-06  1960  
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1961  		io.start += io.end + 1;
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1962  		mmio.start += mmio.end + 1;
08f0a15ee8adb4 Mika Westerberg      2023-01-31  1963  		mmio_pref.start += mmio_pref.end + 1;
1a5767725ceced Mika Westerberg      2017-10-13  1964  	}
1a5767725ceced Mika Westerberg      2017-10-13  1965  }
1a5767725ceced Mika Westerberg      2017-10-13  1966  

:::::: The code at line 1916 was first introduced by commit
:::::: 1a5767725cecedd80a541799c83c0c97b8b5b624 PCI: Distribute available resources to hotplug-capable bridges

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
