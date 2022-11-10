Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98A626
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Nov 2022 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668064337; x=1699600337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNz/fxPiCabbCor2JfsGAtsW4D4uFndEqeDTNbRgOcw=;
  b=nNtQ5HOoePQU+MlrkN8NkZPClX8RmmOggnRvlQFCwdX7Ac/VxNvm7Oqw
   dfGkhTb+UBBZvMXsB72GgSCnIyfzOZ9i4vD3YH74gp4ZOUuz4zNAnZpBo
   Y+P5Vpz1yfK1iX/QXmOsH+bvxpctXjMya6/yeY9+If/q2jn8HFprDxAnO
   yOApMJGWRP9e26nPcC55O07hiP48qajP40wDZMCJWXQVXye1ET+AZtKOt
   hAJGiv4aykndCVQr9a417h2oIVNpNXJFzokSCIXeXKilsIpOezB/7NI3z
   v3WAUUYTZuQIZU77T1juMX/uIv1nkjBDHWCDjTW/CaOEZtNv2ZJqYz8B8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="291630686"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="291630686"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 23:12:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="700684997"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="700684997"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2022 23:12:15 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ot1jS-0002an-2m;
	Thu, 10 Nov 2022 07:12:14 +0000
Date: Thu, 10 Nov 2022 15:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4512/6614] drivers/iommu/iommu.c:1830:35:
 warning: Uninitialized variables: group.kobj, group.devices_kobj,
 group.devices, group.pasid_array, group.iommu_data,
 group.iommu_data_release, group.name, group.id, group.default_domain,
 group.blocking_domain, group.domain,...
Message-ID: <202211101502.iqYF2VxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iommu/iommu.c:1830:35: warning: Uninitialized variables: group.kobj, group.devices_kobj, group.devices, group.pasid_array, group.iommu_data, group.iommu_data_release, group.name, group.id, group.default_domain, group.blocking_domain, group.domain, group.owner_cnt, group.owner [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: "Jean-Philippe Brucker" <jean-philippe@linaro.org>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Yi Liu <yi.l.liu@intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   94db6b12c18d7cf7c5726dbe816c2248494a778d
commit: 16603704559c7a68718059c4f75287886c01b20f [4512/6614] iommu: Add attach/detach_dev_pasid iommu interfaces
:::::: branch date: 25 hours ago
:::::: commit date: 7 days ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 16603704559c7a68718059c4f75287886c01b20f
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/iommu/iommu.c:194:57: warning: Parameter 'data' can be declared as pointer to const [constParameter]
   static int remove_iommu_group(struct device *dev, void *data)
                                                           ^
   drivers/iommu/iommu.c:2020:47: warning: Parameter 'domain' can be declared as pointer to const [constParameter]
   void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
                                                 ^
   drivers/iommu/iommu.c:2642:69: warning: Parameter 'fwnode' can be declared as pointer to const [constParameter]
   const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
                                                                       ^
   drivers/iommu/iommu.c:3337:53: warning: Parameter 'domain' can be declared as pointer to const [constParameter]
   void iommu_detach_device_pasid(struct iommu_domain *domain, struct device *dev,
                                                       ^
   drivers/iommu/iommu.c:602:16: warning: Uninitialized variable: device->dev [uninitvar]
     if (!device->dev->iommu)
                  ^
   drivers/iommu/iommu.c:1042:19: warning: Uninitialized variable: tmp_device->dev [uninitvar]
     if (tmp_device->dev == dev) {
                     ^
   drivers/iommu/iommu.c:1035:6: note: Assuming condition is false
    if (!group)
        ^
   drivers/iommu/iommu.c:1042:19: note: Uninitialized variable: tmp_device->dev
     if (tmp_device->dev == dev) {
                     ^
>> drivers/iommu/iommu.c:1830:35: warning: Uninitialized variables: group.kobj, group.devices_kobj, group.devices, group.pasid_array, group.iommu_data, group.iommu_data_release, group.name, group.id, group.default_domain, group.blocking_domain, group.domain, group.owner_cnt, group.owner [uninitvar]
     probe_alloc_default_domain(bus, group);
                                     ^
   drivers/iommu/iommu.c:1820:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1830:35: note: Uninitialized variables: group.kobj, group.devices_kobj, group.devices, group.pasid_array, group.iommu_data, group.iommu_data_release, group.name, group.id, group.default_domain, group.blocking_domain, group.domain, group.owner_cnt, group.owner
     probe_alloc_default_domain(bus, group);
                                     ^
   drivers/iommu/iommu.c:2448:24: warning: Uninitialized variable: start [uninitvar]
     if (len && s_phys != start + len) {
                          ^

vim +1830 drivers/iommu/iommu.c

ce574c27ae275b Joerg Roedel 2020-04-29  1807  
5012c3968537e2 Joerg Roedel 2020-04-29  1808  int bus_iommu_probe(struct bus_type *bus)
deac0b3bed26bb Joerg Roedel 2020-04-29  1809  {
deac0b3bed26bb Joerg Roedel 2020-04-29  1810  	struct iommu_group *group, *next;
deac0b3bed26bb Joerg Roedel 2020-04-29  1811  	LIST_HEAD(group_list);
3eeeb45c6d0444 Joerg Roedel 2020-04-29  1812  	int ret;
deac0b3bed26bb Joerg Roedel 2020-04-29  1813  
deac0b3bed26bb Joerg Roedel 2020-04-29  1814  	/*
deac0b3bed26bb Joerg Roedel 2020-04-29  1815  	 * This code-path does not allocate the default domain when
deac0b3bed26bb Joerg Roedel 2020-04-29  1816  	 * creating the iommu group, so do it after the groups are
deac0b3bed26bb Joerg Roedel 2020-04-29  1817  	 * created.
deac0b3bed26bb Joerg Roedel 2020-04-29  1818  	 */
deac0b3bed26bb Joerg Roedel 2020-04-29  1819  	ret = bus_for_each_dev(bus, NULL, &group_list, probe_iommu_group);
deac0b3bed26bb Joerg Roedel 2020-04-29  1820  	if (ret)
deac0b3bed26bb Joerg Roedel 2020-04-29  1821  		return ret;
deac0b3bed26bb Joerg Roedel 2020-04-29  1822  
deac0b3bed26bb Joerg Roedel 2020-04-29  1823  	list_for_each_entry_safe(group, next, &group_list, entry) {
deac0b3bed26bb Joerg Roedel 2020-04-29  1824  		/* Remove item from the list */
deac0b3bed26bb Joerg Roedel 2020-04-29  1825  		list_del_init(&group->entry);
deac0b3bed26bb Joerg Roedel 2020-04-29  1826  
deac0b3bed26bb Joerg Roedel 2020-04-29  1827  		mutex_lock(&group->mutex);
deac0b3bed26bb Joerg Roedel 2020-04-29  1828  
deac0b3bed26bb Joerg Roedel 2020-04-29  1829  		/* Try to allocate default domain */
deac0b3bed26bb Joerg Roedel 2020-04-29 @1830  		probe_alloc_default_domain(bus, group);
deac0b3bed26bb Joerg Roedel 2020-04-29  1831  
deac0b3bed26bb Joerg Roedel 2020-04-29  1832  		if (!group->default_domain) {
deac0b3bed26bb Joerg Roedel 2020-04-29  1833  			mutex_unlock(&group->mutex);
deac0b3bed26bb Joerg Roedel 2020-04-29  1834  			continue;
deac0b3bed26bb Joerg Roedel 2020-04-29  1835  		}
deac0b3bed26bb Joerg Roedel 2020-04-29  1836  
ce574c27ae275b Joerg Roedel 2020-04-29  1837  		iommu_group_create_direct_mappings(group);
ce574c27ae275b Joerg Roedel 2020-04-29  1838  
deac0b3bed26bb Joerg Roedel 2020-04-29  1839  		ret = __iommu_group_dma_attach(group);
deac0b3bed26bb Joerg Roedel 2020-04-29  1840  
deac0b3bed26bb Joerg Roedel 2020-04-29  1841  		mutex_unlock(&group->mutex);
deac0b3bed26bb Joerg Roedel 2020-04-29  1842  
deac0b3bed26bb Joerg Roedel 2020-04-29  1843  		if (ret)
deac0b3bed26bb Joerg Roedel 2020-04-29  1844  			break;
70b8170e55d3ca Joerg Roedel 2020-05-19  1845  
70b8170e55d3ca Joerg Roedel 2020-05-19  1846  		__iommu_group_dma_finalize(group);
deac0b3bed26bb Joerg Roedel 2020-04-29  1847  	}
deac0b3bed26bb Joerg Roedel 2020-04-29  1848  
deac0b3bed26bb Joerg Roedel 2020-04-29  1849  	return ret;
deac0b3bed26bb Joerg Roedel 2020-04-29  1850  }
deac0b3bed26bb Joerg Roedel 2020-04-29  1851  

:::::: The code at line 1830 was first introduced by commit
:::::: deac0b3bed26bb5d04486696b1071d8ec3851100 iommu: Split off default domain allocation from group assignment

:::::: TO: Joerg Roedel <jroedel@suse.de>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
