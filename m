Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AD2C026E
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Sep 2025 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918965; cv=none; b=Ebif/DEpDmkNJWaozs5yFRIfMdXq3ij2WpM97dcKGDAOWjcjf6MbVZz9LuwXNTnLi5pqVcg6+ZVKQ+EEHWxdRF9rEhaqKydU1m4JDFGqauDU1jIugESOmJ3PFCxFnmNFXUXrsXmN7l8Yp/Ubf0l8a/c1SeOa1FfzsK9+oyg6lKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918965; c=relaxed/simple;
	bh=iiHFfqY34uErxYsvtgGO7NA1y4FkXHx9ECkaN14TL+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MY72BGdkGMe+K00d24R1zHmcZD50hx/mYuHWb6jUP+IT1VxstgXs06KcQ9vvHzv1sDU9zB2guNUegcq0yM1opojlYyfeP7tNsxzbtoig5MhDOjdS2SSBQNueIwNXCTI7mxKowGBYi3jMzwNgAnsrnyHUBiAhjHeuJ24Nj52P6T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjPbbxDO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjPbbxDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757918962; x=1789454962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iiHFfqY34uErxYsvtgGO7NA1y4FkXHx9ECkaN14TL+0=;
  b=LjPbbxDOTq24r3Jz5/MdeUcfoVn8Co2A8c2lPKyNs7skXENsmsSzDeaS
   mRaiepQwxJ+7tBYYbGJTLeBctcLKXTdTppRhXCDaLsC4Y6F6u/nyVvzjD
   KtjZdhaFYtQ1PrvhA9Qx4GX5M94GGpw9iqn1sWMzFmibDG/v5FrwzXA+9
   POUFcbAs6BgT0D8coXp4r6l6WrfsmSICHCy7M0r4NY1WFtc5/vVAM7ALN
   VubKYPo6x068bAPQ6QbsONmpIZI0/KkGfwpKJh4JfD6jNb7nL3USA1+N/
   DuwO9/AxuXhHVQvvF0JwcgZ26TGy+9azF7ANbUSOvM4znnDk1h9elCClB
   w==;
X-CSE-ConnectionGUID: Yb0m9QVASHmF5PmYktGOAg==
X-CSE-MsgGUID: oohFC0joSlmy+0VPVnHVOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="82751482"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="82751482"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 23:49:20 -0700
X-CSE-ConnectionGUID: T0RCGcLmSFeX8gCODK6B8A==
X-CSE-MsgGUID: dCDYHlipRTyXc5O18pVeOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="174136491"
Received: from lkp-server02.sh.intel.com (HELO 0f80bf6f8d53) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 Sep 2025 23:49:18 -0700
Received: from kbuild by 0f80bf6f8d53 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uy31X-00005b-2i;
	Mon, 15 Sep 2025 06:49:15 +0000
Date: Mon, 15 Sep 2025 14:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:pcie_switch_groups 3/13] drivers/iommu/iommu.c:1021
 iommu_group_alloc_data() warn: Calling kobject_put|get with
 state->initialized unset from line: 1000
Message-ID: <202509151452.LdffxDB3-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   bf8d5a37268d05065ff20a424747073107e242d4
commit: d123f7b734f1c0db1137f31721ded0b79e551611 [3/13] iommu: Add iommu_group bus_data
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-r073-20250914 (https://download.01.org/0day-ci/archive/20250915/202509151452.LdffxDB3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509151452.LdffxDB3-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommu.c:1021 iommu_group_alloc_data() warn: Calling kobject_put|get with state->initialized unset from line: 1000

Old smatch warnings:
drivers/iommu/iommu.c:1027 iommu_group_alloc_data() warn: Calling kobject_put|get with state->initialized unset from line: 1000
drivers/iommu/iommu.c:1036 iommu_group_alloc_data() warn: Calling kobject_put|get with state->initialized unset from line: 1000

vim +1021 drivers/iommu/iommu.c

d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30   994  
d123f7b734f1c0 drivers/iommu/iommu.c Jason Gunthorpe 2025-09-09   995  static struct iommu_group *iommu_group_alloc_data(u32 bus_data)
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30   996  {
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30   997  	struct iommu_group *group;
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30   998  	int ret;
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30   999  
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1000  	group = kzalloc(sizeof(*group), GFP_KERNEL);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1001  	if (!group)
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1002  		return ERR_PTR(-ENOMEM);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1003  
d123f7b734f1c0 drivers/iommu/iommu.c Jason Gunthorpe 2025-09-09  1004  	group->bus_data = bus_data;
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1005  	group->kobj.kset = iommu_group_kset;
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1006  	mutex_init(&group->mutex);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1007  	INIT_LIST_HEAD(&group->devices);
41df6dcc0a3ff4 drivers/iommu/iommu.c Joerg Roedel    2020-04-29  1008  	INIT_LIST_HEAD(&group->entry);
16603704559c7a drivers/iommu/iommu.c Lu Baolu        2022-10-31  1009  	xa_init(&group->pasid_array);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1010  
822242e649ea9f drivers/iommu/iommu.c Ke Liu          2022-06-08  1011  	ret = ida_alloc(&iommu_group_ida, GFP_KERNEL);
feccf398db631f drivers/iommu/iommu.c Heiner Kallweit 2016-06-29  1012  	if (ret < 0) {
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1013  		kfree(group);
feccf398db631f drivers/iommu/iommu.c Heiner Kallweit 2016-06-29  1014  		return ERR_PTR(ret);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1015  	}
feccf398db631f drivers/iommu/iommu.c Heiner Kallweit 2016-06-29  1016  	group->id = ret;
fc2100eb4d0960 drivers/base/iommu.c  Joerg Roedel    2008-11-26  1017  
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1018  	ret = kobject_init_and_add(&group->kobj, &iommu_group_ktype,
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1019  				   NULL, "%d", group->id);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1020  	if (ret) {
7cc31613734c48 drivers/iommu/iommu.c Qiushi Wu       2020-05-27 @1021  		kobject_put(&group->kobj);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1022  		return ERR_PTR(ret);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1023  	}
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1024  
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1025  	group->devices_kobj = kobject_create_and_add("devices", &group->kobj);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1026  	if (!group->devices_kobj) {
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1027  		kobject_put(&group->kobj); /* triggers .release & free */
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1028  		return ERR_PTR(-ENOMEM);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1029  	}
fc2100eb4d0960 drivers/base/iommu.c  Joerg Roedel    2008-11-26  1030  
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1031  	/*
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1032  	 * The devices_kobj holds a reference on the group kobject, so
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1033  	 * as long as that exists so will the group.  We can therefore
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1034  	 * use the devices_kobj for reference counting.
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1035  	 */
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1036  	kobject_put(&group->kobj);
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1037  
bc7d12b91bd354 drivers/iommu/iommu.c Eric Auger      2017-01-19  1038  	ret = iommu_group_create_file(group,
bc7d12b91bd354 drivers/iommu/iommu.c Eric Auger      2017-01-19  1039  				      &iommu_group_attr_reserved_regions);
4daa861174d560 drivers/iommu/iommu.c Jason Gunthorpe 2023-02-15  1040  	if (ret) {
4daa861174d560 drivers/iommu/iommu.c Jason Gunthorpe 2023-02-15  1041  		kobject_put(group->devices_kobj);
bc7d12b91bd354 drivers/iommu/iommu.c Eric Auger      2017-01-19  1042  		return ERR_PTR(ret);
4daa861174d560 drivers/iommu/iommu.c Jason Gunthorpe 2023-02-15  1043  	}
bc7d12b91bd354 drivers/iommu/iommu.c Eric Auger      2017-01-19  1044  
c52c72d3dee81a drivers/iommu/iommu.c Olof Johansson  2018-07-11  1045  	ret = iommu_group_create_file(group, &iommu_group_attr_type);
4daa861174d560 drivers/iommu/iommu.c Jason Gunthorpe 2023-02-15  1046  	if (ret) {
4daa861174d560 drivers/iommu/iommu.c Jason Gunthorpe 2023-02-15  1047  		kobject_put(group->devices_kobj);
c52c72d3dee81a drivers/iommu/iommu.c Olof Johansson  2018-07-11  1048  		return ERR_PTR(ret);
4daa861174d560 drivers/iommu/iommu.c Jason Gunthorpe 2023-02-15  1049  	}
c52c72d3dee81a drivers/iommu/iommu.c Olof Johansson  2018-07-11  1050  
269aa808a990b3 drivers/iommu/iommu.c Joerg Roedel    2015-05-28  1051  	pr_debug("Allocated group %d\n", group->id);
269aa808a990b3 drivers/iommu/iommu.c Joerg Roedel    2015-05-28  1052  
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1053  	return group;
d72e31c9374627 drivers/iommu/iommu.c Alex Williamson 2012-05-30  1054  }
d123f7b734f1c0 drivers/iommu/iommu.c Jason Gunthorpe 2025-09-09  1055  

:::::: The code at line 1021 was first introduced by commit
:::::: 7cc31613734c4870ae32f5265d576ef296621343 iommu: Fix reference count leak in iommu_group_alloc.

:::::: TO: Qiushi Wu <wu000273@umn.edu>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
