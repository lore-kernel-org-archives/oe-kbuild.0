Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396CC320E
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Jan 2023 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672668155; x=1704204155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qhWBi3Ns5FsrqYZMp+CZYG1OmdmrjkbplfMsajPaEw8=;
  b=g10VNjxtEThPxhdemEvzi1MLt6vSf5fp0uZv9C5VjmLec5FoTy+eVV7a
   ciWcIR/vmb3k1tEAt+8dS8Ze+9MYm9gH1j2sM6hG47zLTxuRV8IFKLTq/
   fASUG+2RgpROvfOCkcOHYFgOrLROq5X5+Ff6h0Xh9vuRZsMsPgijcTpSI
   9eTvGLWgLr/vooSHBP+VJ310nacFv4DPoxAXRBlqgwjUPaBMdFESEmyhG
   8xHO5sz4fAr+oFljfdgmqQccolKKIwvXC2VPcBp4GFS08c5lUAdr5c87i
   FKMmwRwvJRJMXfAiLS2lUurj8wUbVFiqFYb8/p7QVRuez2tAhTKk4KCWH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="320200910"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="320200910"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 06:02:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="604540171"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="604540171"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jan 2023 06:02:32 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCLOZ-000R9b-1j;
	Mon, 02 Jan 2023 14:02:31 +0000
Date: Mon, 2 Jan 2023 22:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/iommu.c:191:57: warning: Parameter 'data' can be
 declared as pointer to const [constParameter]
Message-ID: <202301022200.C8Fb8KuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iommu/iommu.c:191:57: warning: Parameter 'data' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Robin Murphy <robin.murphy@arm.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Krishna Reddy <vdumpa@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88603b6dc419445847923fcb7fe5080067a30f98
commit: 57365a04c92126525a58bf7a1599ddfa832415e9 iommu: Move bus setup to IOMMU device registration
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 57365a04c92126525a58bf7a1599ddfa832415e9
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/iommu.c:191:57: warning: Parameter 'data' can be declared as pointer to const [constParameter]
   static int remove_iommu_group(struct device *dev, void *data)
                                                           ^
>> drivers/iommu/iommu.c:2021:47: warning: Parameter 'domain' can be declared as pointer to const [constParameter]
   void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
                                                 ^
>> drivers/iommu/iommu.c:2642:69: warning: Parameter 'fwnode' can be declared as pointer to const [constParameter]
   const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
                                                                       ^
>> drivers/iommu/iommu.c:580:16: warning: Uninitialized variable: device->dev [uninitvar]
     if (!device->dev->iommu)
                  ^
>> drivers/iommu/iommu.c:1019:19: warning: Uninitialized variable: tmp_device->dev [uninitvar]
     if (tmp_device->dev == dev) {
                     ^
   drivers/iommu/iommu.c:1012:6: note: Assuming condition is false
    if (!group)
        ^
   drivers/iommu/iommu.c:1019:19: note: Uninitialized variable: tmp_device->dev
     if (tmp_device->dev == dev) {
                     ^
>> drivers/iommu/iommu.c:1807:35: warning: Uninitialized variables: group.kobj, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_release, group.name, group.id, group.default_domain, group.blocking_domain, group.domain, group.owner_cnt, group.owner [uninitvar]
     probe_alloc_default_domain(bus, group);
                                     ^
   drivers/iommu/iommu.c:1797:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1807:35: note: Uninitialized variables: group.kobj, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_release, group.name, group.id, group.default_domain, group.blocking_domain, group.domain, group.owner_cnt, group.owner
     probe_alloc_default_domain(bus, group);
                                     ^
>> drivers/iommu/iommu.c:2449:24: warning: Uninitialized variable: start [uninitvar]
     if (len && s_phys != start + len) {
                          ^
--
>> lib/vsprintf.c:588:41: warning: Parameter 'end' can be declared as pointer to const [constParameter]
   static void move_right(char *buf, char *end, unsigned len, unsigned spaces)
                                           ^

vim +/data +191 drivers/iommu/iommu.c

5fa9e7c5fa50f27 Joerg Roedel 2019-08-19  190  
57365a04c921265 Robin Murphy 2022-08-15 @191  static int remove_iommu_group(struct device *dev, void *data)
57365a04c921265 Robin Murphy 2022-08-15  192  {
57365a04c921265 Robin Murphy 2022-08-15  193  	if (dev->iommu && dev->iommu->iommu_dev == data)
57365a04c921265 Robin Murphy 2022-08-15  194  		iommu_release_device(dev);
57365a04c921265 Robin Murphy 2022-08-15  195  
57365a04c921265 Robin Murphy 2022-08-15  196  	return 0;
57365a04c921265 Robin Murphy 2022-08-15  197  }
57365a04c921265 Robin Murphy 2022-08-15  198  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
