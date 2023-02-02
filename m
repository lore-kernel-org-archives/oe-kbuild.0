Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE363B7
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Feb 2023 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675347586; x=1706883586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seO9PCkXda/kBuBiChmL62KUo5MWLKKj150z2BuKjFg=;
  b=IeskW/ELrfGMxpvOUzWA6VJ+53W+spQuYOnRmE3q19vJ2jnsDZ/xdGhh
   7gVned4YpoOaD79lSUE6aeokTbvM7qSZ6s7OFirtDCuAQimbQP2Z8bV8M
   t1Ux9hIcrMWFb3N0BizuoPbboBsJ2rYB5Obq32qpIuQGD5m8r+C7JcPaz
   ka+UZ0vCn66JfNp51EnvTKDvSA+zRj7ueTBjOQCy18VFv9a9wEFw8xJtD
   sT9gFvjdQkxoHia5M+tHX9E5QRqGMupYN67MLbIpEC7T3DfGdEJvxvxqE
   oOcJOtXP7SC92gKGTh9dtBr5oREb/6i112GEKYbcoDS/N/rEHUZQuSVcc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="329742461"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="329742461"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 06:19:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="773905561"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="773905561"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2023 06:19:35 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNaR4-0006aS-0R;
	Thu, 02 Feb 2023 14:19:34 +0000
Date: Thu, 2 Feb 2023 22:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc2-nesting 2/41]
 drivers/vfio/group.c:796:44: warning: Parameter 'group' can be declared as
 pointer to const [constParameter]
Message-ID: <202302022222.rjDORUEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/vfio/group.c:796:44: warning: Parameter 'group' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd-v6.2-rc2-nesting
head:   f9c22cd2206b239919f6290e33e92cd53748dd0c
commit: 495cdc7850fb76c4db44b98488fec6774fc0eb19 [2/41] vfio: Refine vfio file kAPIs
:::::: branch date: 2 weeks ago
:::::: commit date: 4 weeks ago
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 495cdc7850fb76c4db44b98488fec6774fc0eb19
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/vfio/group.c:409:48: warning: Parameter 'iommu_group' can be declared as pointer to const [constParameter]
   vfio_group_find_from_iommu(struct iommu_group *iommu_group)
                                                  ^
   drivers/vfio/group.c:544:76: warning: Parameter 'dev' can be declared as pointer to const [constParameter]
   static bool vfio_group_has_device(struct vfio_group *group, struct device *dev)
                                                                              ^
>> drivers/vfio/group.c:796:44: warning: Parameter 'group' can be declared as pointer to const [constParameter]
   bool vfio_group_has_dev(struct vfio_group *group, struct vfio_device *device)
                                              ^
   drivers/vfio/group.c:420:14: warning: Uninitialized variable: group->iommu_group [uninitvar]
     if (group->iommu_group == iommu_group)
                ^

vim +/group +796 drivers/vfio/group.c

9eefba8002c27d Yi Liu 2022-11-25  795  
495cdc7850fb76 Yi Liu 2022-11-26 @796  bool vfio_group_has_dev(struct vfio_group *group, struct vfio_device *device)
9eefba8002c27d Yi Liu 2022-11-25  797  {
9eefba8002c27d Yi Liu 2022-11-25  798  	return group == device->group;
9eefba8002c27d Yi Liu 2022-11-25  799  }
9eefba8002c27d Yi Liu 2022-11-25  800  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
