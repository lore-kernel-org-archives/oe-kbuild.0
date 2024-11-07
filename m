Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC87F9
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965927; cv=none; b=AqhhxGtYYMi2okKj+GwRDfTs+wwu6g5UYn71Gca7Tst51vvwYNRSrJ+ee1l9dbpvDIM+Y0QFVP4siQda185rRdRWHXIRjYrr3GCsx4ZRIjr/yWYtuKXOSsvH0yzgjWHk3qkArk/osZXuHZvGYCAJImSmkmvE0x5BORhgc4gTtg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965927; c=relaxed/simple;
	bh=s4XgZApLcMBaIQ81JGETaUUZwTrg5z5YuWU0yU3uErk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cx/hmyQOu6BS3rQK32+7IGuxRYvJQv7obxUoXX6OsuNkhf+zYzPW8A5R8lN+eyqX9QgdZkaDRHUCPt/Vfuq8XWzdOimBT8C7Dhe+t7CDdfZ2wFdRDkp8f3OdWMS+1Pd5noK5FcA+rw5vfp5yFulrgSybMPTsVxdKuMkvobkBT4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHaGpyud; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHaGpyud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730965924; x=1762501924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4XgZApLcMBaIQ81JGETaUUZwTrg5z5YuWU0yU3uErk=;
  b=DHaGpyudt4JJ1GlOs0kwwWUC91/UE/sphRs1JDg+KR5xnUcryFeszxG1
   9MFn/zkrNVUJzF9KzRurRlxUfoEEejMzfXw3+hnX3VZVTa6S6KmSgPYPf
   z78sfciStHK6EPRWhMCKHFMnAfvgoQPVmPThuw21oWRpEUY4KhDZS4+rD
   RE0c/szBI16q9iOpwOwql7Rbydc3EKUkJeFXBR+/LgIQuf7FRljQ3IiE8
   LWFC9vwzlFevw/CEjL8t10cWqquWU8qbhRGV1Es66iaZkQ7js//P8mivP
   t/DL1ZBWoNwayj6IPyMMMj6Xfdav8rpXiMgoLyjdPLsR1w18perfKijUl
   w==;
X-CSE-ConnectionGUID: 9kYt8I3dQheNFhOMf6hNaw==
X-CSE-MsgGUID: 4zsepUe+RouZCyfT9KQBMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="18418077"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="18418077"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:52:04 -0800
X-CSE-ConnectionGUID: 204XW0mvT5S5Z6nnfH4dcg==
X-CSE-MsgGUID: j/frcF++SVqkqqUOwiUnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="84906619"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2024 23:52:02 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8xJ9-000pyQ-2g;
	Thu, 07 Nov 2024 07:51:59 +0000
Date: Thu, 7 Nov 2024 15:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7078/9686] drivers/iommu/amd/iommu.c:1269
 domain_flush_complete() warn: iterator 'i' not incremented
Message-ID: <202411071534.cINodJu5-lkp@intel.com>
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
TO: Vasant Hegde <vasant.hegde@amd.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
commit: d16041124de1dea4389b5e6b330657f34f8c0492 [7078/9686] iommu/amd: xarray to track protection_domain->iommu list
:::::: branch date: 25 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071534.cINodJu5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071534.cINodJu5-lkp@intel.com/

New smatch warnings:
drivers/iommu/amd/iommu.c:1269 domain_flush_complete() warn: iterator 'i' not incremented
drivers/iommu/amd/iommu.c:1462 domain_flush_pages_v1() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/iommu/amd/iommu.c:1996 init_gcr3_table() warn: missing error code? 'ret'

vim +/i +1269 drivers/iommu/amd/iommu.c

a19ae1eccfb2d97 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-06-26  1257  
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1258  static void domain_flush_complete(struct protection_domain *domain)
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1259  {
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1260  	struct pdom_iommu_info *pdom_iommu_info;
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1261  	unsigned long i;
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1262  
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1263  	lockdep_assert_held(&domain->lock);
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1264  
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1265  	/*
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1266  	 * Devices of this domain are behind this IOMMU
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1267  	 * We need to wait for completion of all commands.
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1268  	 */
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30 @1269  	 xa_for_each(&domain->iommu_array, i, pdom_iommu_info)
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1270  		iommu_completion_wait(pdom_iommu_info->iommu);
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1271  }
964877dc2623283 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-08-28  1272  
d8c13085775c72e arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-06  1273  static int iommu_flush_dte(struct amd_iommu *iommu, u16 devid)
0518a3a4585cb3e arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-20  1274  {
d8c13085775c72e arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-06  1275  	struct iommu_cmd cmd;
0518a3a4585cb3e arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-20  1276  
d8c13085775c72e arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-06  1277  	build_inv_dte(&cmd, devid);
d8c13085775c72e arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-06  1278  
d8c13085775c72e arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-06  1279  	return iommu_queue_command(iommu, &cmd);
d8c13085775c72e arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-06  1280  }
d8c13085775c72e arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-06  1281  
0688a09990986cd drivers/iommu/amd_iommu.c   Joerg Roedel          2017-08-23  1282  static void amd_iommu_flush_dte_all(struct amd_iommu *iommu)
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1283  {
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1284  	u32 devid;
a3cf6ab35751ea7 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1285  	u16 last_bdf = iommu->pci_seg->last_bdf;
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1286  
a3cf6ab35751ea7 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1287  	for (devid = 0; devid <= last_bdf; ++devid)
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1288  		iommu_flush_dte(iommu, devid);
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1289  
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1290  	iommu_completion_wait(iommu);
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1291  }
0518a3a4585cb3e arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-20  1292  
0518a3a4585cb3e arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-20  1293  /*
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1294   * This function uses heavy locking and may disable irqs for some time. But
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1295   * this is no issue because it is only called during resume.
0518a3a4585cb3e arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-20  1296   */
0688a09990986cd drivers/iommu/amd_iommu.c   Joerg Roedel          2017-08-23  1297  static void amd_iommu_flush_tlb_all(struct amd_iommu *iommu)
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1298  {
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1299  	u32 dom_id;
a3cf6ab35751ea7 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1300  	u16 last_bdf = iommu->pci_seg->last_bdf;
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1301  
a3cf6ab35751ea7 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1302  	for (dom_id = 0; dom_id <= last_bdf; ++dom_id) {
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1303  		struct iommu_cmd cmd;
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1304  		build_inv_iommu_pages(&cmd, 0, CMD_INV_IOMMU_ALL_PAGES_ADDRESS,
4f0a600799237ed drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1305  				      dom_id, IOMMU_NO_PASID, false);
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1306  		iommu_queue_command(iommu, &cmd);
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1307  	}
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1308  
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1309  	iommu_completion_wait(iommu);
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1310  }
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1311  
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1312  static void amd_iommu_flush_tlb_domid(struct amd_iommu *iommu, u32 dom_id)
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1313  {
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1314  	struct iommu_cmd cmd;
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1315  
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1316  	build_inv_iommu_pages(&cmd, 0, CMD_INV_IOMMU_ALL_PAGES_ADDRESS,
4f0a600799237ed drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1317  			      dom_id, IOMMU_NO_PASID, false);
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1318  	iommu_queue_command(iommu, &cmd);
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1319  
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1320  	iommu_completion_wait(iommu);
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1321  }
36b7200f67dfe75 drivers/iommu/amd_iommu.c   Stuart Hayes          2019-09-05  1322  
0688a09990986cd drivers/iommu/amd_iommu.c   Joerg Roedel          2017-08-23  1323  static void amd_iommu_flush_all(struct amd_iommu *iommu)
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1324  {
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1325  	struct iommu_cmd cmd;
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1326  
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1327  	build_inv_all(&cmd);
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1328  
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1329  	iommu_queue_command(iommu, &cmd);
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1330  	iommu_completion_wait(iommu);
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1331  }
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1332  
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1333  static void iommu_flush_irt(struct amd_iommu *iommu, u16 devid)
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1334  {
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1335  	struct iommu_cmd cmd;
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1336  
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1337  	build_inv_irt(&cmd, devid);
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1338  
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1339  	iommu_queue_command(iommu, &cmd);
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1340  }
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1341  
0688a09990986cd drivers/iommu/amd_iommu.c   Joerg Roedel          2017-08-23  1342  static void amd_iommu_flush_irt_all(struct amd_iommu *iommu)
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1343  {
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1344  	u32 devid;
a3cf6ab35751ea7 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1345  	u16 last_bdf = iommu->pci_seg->last_bdf;
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1346  
98aeb4ea5599c5f drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-05-30  1347  	if (iommu->irtcachedis_enabled)
98aeb4ea5599c5f drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-05-30  1348  		return;
98aeb4ea5599c5f drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-05-30  1349  
a3cf6ab35751ea7 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1350  	for (devid = 0; devid <= last_bdf; devid++)
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1351  		iommu_flush_irt(iommu, devid);
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1352  
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1353  	iommu_completion_wait(iommu);
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1354  }
7ef2798deb695f1 drivers/iommu/amd_iommu.c   Joerg Roedel          2012-06-21  1355  
af3263758bf0b65 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1356  void amd_iommu_flush_all_caches(struct amd_iommu *iommu)
7d0c5cc5be73f7c arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-07  1357  {
7b7563a93437ef9 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-09-21  1358  	if (check_feature(FEATURE_IA)) {
0688a09990986cd drivers/iommu/amd_iommu.c   Joerg Roedel          2017-08-23  1359  		amd_iommu_flush_all(iommu);
58fc7f1419560ef arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-11  1360  	} else {
0688a09990986cd drivers/iommu/amd_iommu.c   Joerg Roedel          2017-08-23  1361  		amd_iommu_flush_dte_all(iommu);
0688a09990986cd drivers/iommu/amd_iommu.c   Joerg Roedel          2017-08-23  1362  		amd_iommu_flush_irt_all(iommu);
0688a09990986cd drivers/iommu/amd_iommu.c   Joerg Roedel          2017-08-23  1363  		amd_iommu_flush_tlb_all(iommu);
0518a3a4585cb3e arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-20  1364  	}
0518a3a4585cb3e arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-20  1365  }
0518a3a4585cb3e arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-20  1366  
431b2a201533753 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-07-11  1367  /*
cb41ed85efa01e6 arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-05  1368   * Command send function for flushing on-device TLB
431b2a201533753 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-07-11  1369   */
c7fc12354be0ba4 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1370  static int device_flush_iotlb(struct iommu_dev_data *dev_data, u64 address,
c7fc12354be0ba4 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1371  			      size_t size, ioasid_t pasid, bool gn)
3fa43655d81d471 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-26  1372  {
6f35fe5d8a0ad01 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2024-02-05  1373  	struct amd_iommu *iommu = get_amd_iommu_from_dev_data(dev_data);
b00d3bcff4d996f arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-26  1374  	struct iommu_cmd cmd;
6f35fe5d8a0ad01 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2024-02-05  1375  	int qdep = dev_data->ats_qdep;
3fa43655d81d471 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-26  1376  
bbf85fe10faadbd drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1377  	build_inv_iotlb_pages(&cmd, dev_data->devid, qdep, address,
c7fc12354be0ba4 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1378  			      size, pasid, gn);
b00d3bcff4d996f arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-26  1379  
b00d3bcff4d996f arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-26  1380  	return iommu_queue_command(iommu, &cmd);
3fa43655d81d471 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-26  1381  }
3fa43655d81d471 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-26  1382  
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1383  static int device_flush_dte_alias(struct pci_dev *pdev, u16 alias, void *data)
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1384  {
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1385  	struct amd_iommu *iommu = data;
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1386  
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1387  	return iommu_flush_dte(iommu, alias);
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1388  }
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1389  
431b2a201533753 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-07-11  1390  /*
431b2a201533753 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-07-11  1391   * Command send function for invalidating a device table entry
431b2a201533753 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-07-11  1392   */
6c542047937ad66 arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-06-09  1393  static int device_flush_dte(struct iommu_dev_data *dev_data)
a19ae1eccfb2d97 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-06-26  1394  {
6f35fe5d8a0ad01 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2024-02-05  1395  	struct amd_iommu *iommu = get_amd_iommu_from_dev_data(dev_data);
d02674d71c5a625 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1396  	struct pci_dev *pdev = NULL;
99fc4ac3d2978ce drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2022-07-06  1397  	struct amd_iommu_pci_seg *pci_seg;
e25bfb56ea7f046 drivers/iommu/amd_iommu.c   Joerg Roedel          2015-10-20  1398  	u16 alias;
ee2fa7435b6dddf arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-09-17  1399  	int ret;
a19ae1eccfb2d97 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-06-26  1400  
d02674d71c5a625 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1401  	if (dev_is_pci(dev_data->dev))
d02674d71c5a625 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1402  		pdev = to_pci_dev(dev_data->dev);
3fa43655d81d471 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-26  1403  
d02674d71c5a625 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1404  	if (pdev)
d02674d71c5a625 drivers/iommu/amd/iommu.c   Vasant Hegde          2022-07-06  1405  		ret = pci_for_each_dma_alias(pdev,
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1406  					     device_flush_dte_alias, iommu);
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1407  	else
f62dda66b560139 arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-06-09  1408  		ret = iommu_flush_dte(iommu, dev_data->devid);
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1409  	if (ret)
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1410  		return ret;
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1411  
99fc4ac3d2978ce drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2022-07-06  1412  	pci_seg = iommu->pci_seg;
99fc4ac3d2978ce drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2022-07-06  1413  	alias = pci_seg->alias_table[dev_data->devid];
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1414  	if (alias != dev_data->devid) {
e25bfb56ea7f046 drivers/iommu/amd_iommu.c   Joerg Roedel          2015-10-20  1415  		ret = iommu_flush_dte(iommu, alias);
cb41ed85efa01e6 arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-05  1416  		if (ret)
cb41ed85efa01e6 arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-05  1417  			return ret;
3332364e4ebc058 drivers/iommu/amd_iommu.c   Logan Gunthorpe       2019-10-22  1418  	}
a19ae1eccfb2d97 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-06-26  1419  
c7fc12354be0ba4 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1420  	if (dev_data->ats_enabled) {
c7fc12354be0ba4 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1421  		/* Invalidate the entire contents of an IOTLB */
c7fc12354be0ba4 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1422  		ret = device_flush_iotlb(dev_data, 0, ~0UL,
c7fc12354be0ba4 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1423  					 IOMMU_NO_PASID, false);
c7fc12354be0ba4 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1424  	}
ee2fa7435b6dddf arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-09-17  1425  
ee2fa7435b6dddf arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-09-17  1426  	return ret;
a19ae1eccfb2d97 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-06-26  1427  }
a19ae1eccfb2d97 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-06-26  1428  
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1429  static int domain_flush_pages_v2(struct protection_domain *pdom,
a976da66e8e547c drivers/iommu/amd/iommu.c   Vasant Hegde          2023-11-22  1430  				 u64 address, size_t size)
a19ae1eccfb2d97 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-06-26  1431  {
cb41ed85efa01e6 arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-05  1432  	struct iommu_dev_data *dev_data;
11b6402c6673b53 arch/x86/kernel/amd_iommu.c Joerg Roedel          2011-04-06  1433  	struct iommu_cmd cmd;
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1434  	int ret = 0;
a19ae1eccfb2d97 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-06-26  1435  
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1436  	list_for_each_entry(dev_data, &pdom->dev_list, list) {
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1437  		struct amd_iommu *iommu = get_amd_iommu_from_dev(dev_data->dev);
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1438  		u16 domid = dev_data->gcr3_info.domid;
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1439  
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1440  		build_inv_iommu_pages(&cmd, address, size,
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1441  				      domid, IOMMU_NO_PASID, true);
a19ae1eccfb2d97 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-06-26  1442  
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1443  		ret |= iommu_queue_command(iommu, &cmd);
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1444  	}
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1445  
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1446  	return ret;
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1447  }
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1448  
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1449  static int domain_flush_pages_v1(struct protection_domain *pdom,
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1450  				 u64 address, size_t size)
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1451  {
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1452  	struct pdom_iommu_info *pdom_iommu_info;
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1453  	struct iommu_cmd cmd;
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1454  	int ret = 0;
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1455  	unsigned long i;
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1456  
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1457  	lockdep_assert_held(&pdom->lock);
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1458  
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1459  	build_inv_iommu_pages(&cmd, address, size,
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1460  			      pdom->id, IOMMU_NO_PASID, false);
999ba417cc1a438 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-07-03  1461  
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30 @1462  	xa_for_each(&pdom->iommu_array, i, pdom_iommu_info) {
6de8ad9b9ee0ec5 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-23  1463  		/*
6de8ad9b9ee0ec5 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-23  1464  		 * Devices of this domain are behind this IOMMU
6de8ad9b9ee0ec5 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-23  1465  		 * We need a TLB flush
6de8ad9b9ee0ec5 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-23  1466  		 */
d16041124de1dea drivers/iommu/amd/iommu.c   Vasant Hegde          2024-10-30  1467  		ret |= iommu_queue_command(pdom_iommu_info->iommu, &cmd);
6de8ad9b9ee0ec5 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-23  1468  	}
6de8ad9b9ee0ec5 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-11-23  1469  
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1470  	return ret;
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1471  }
87a6f1f22c9781b drivers/iommu/amd/iommu.c   Vasant Hegde          2024-02-05  1472  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
