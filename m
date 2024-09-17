Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579B582D98
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726558200; cv=none; b=LALIq8rftFONT0wvRoiyTGw1jU+A0XE68obMQEf86WCfUCTIVmxTqYMZTTZ//cdUDOpQi3csXlYstU66oUbwRsiOPtApVxC9Js/ZVt+wrK1gB3TCShMyCYONnAxWlDGGmvifZQnCi3zLVni4tEQ4zZRXzCcGTOlieM7V8Q+JW08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726558200; c=relaxed/simple;
	bh=gSv9I0R2y3BU14FubqHHzTR1uChkKpuV7h7cBW0C57A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDnuGphbknhoFBLbY+hS4QIEmEG22yB2KjzH3pm+wIi08ghE0hBTgCOCndcn0HuXtWcRiEemV/+Whavqz7KtQ6GIpBtY/B1bVjBHDvu6Gi7hFApvUCO0jBh+3INHJzmqsJEAYNK4KdNpZ1ky68T1A2pI3YAmPxB1izGaiKh5iSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jg4ddzRg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jg4ddzRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726558198; x=1758094198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gSv9I0R2y3BU14FubqHHzTR1uChkKpuV7h7cBW0C57A=;
  b=jg4ddzRgr9V9MAkETTuLkbWSr6ZKPkOEd5A4BkV+iI7v+YWxShKiwLVd
   vMnQ8RLq6PTsBCyhnvesD7tDMGoQOYXhTdAU0C0CdvggCaMRQbZYnRluL
   pn6JWB4w5tNKU6wqQ3pK4+YH7fsTsyVqzz9pItrApT4LODGaApzCrSufk
   SEME3zxkOZ7Jdjb9BIA4Th9PBxqO+84HW9xrH3wn6yuDpJ2npeSnEjdtu
   +rPEwEotknnThv1ZiFjmKl68QB49FxpdZdMGVUxoxWjJjy0Klkr+ZcFst
   EBC9imAzMPGIkuzB8dyQPuR5xTlovJHAtD2ofXZwEJKWhttlpn/77Frml
   g==;
X-CSE-ConnectionGUID: V2BTFA30SbqWebVTdyAPpQ==
X-CSE-MsgGUID: BHAztPRUSiuwNJ4NKSfFeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25339772"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25339772"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 00:29:57 -0700
X-CSE-ConnectionGUID: ONdsVgAhSPWzCS8bPq+0Bg==
X-CSE-MsgGUID: lUvU5xBzTgqmGBkmWfFSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="99789991"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Sep 2024 00:29:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqSeo-000Avu-0p;
	Tue, 17 Sep 2024 07:29:54 +0000
Date: Tue, 17 Sep 2024 15:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iommu/iommufd/fault.c:115:38-43: ERROR: invalid reference to
 the index variable of the iterator on line 107
Message-ID: <202409171518.qdLmV9WL-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a430d95c5efa2b545d26a094eb5f624e36732af0
commit: b7d8833677baad8c80ed1aac8c396d687e64a376 iommufd: Fault-capable hwpt attach/detach/replace
date:   2 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 months ago
config: m68k-randconfig-r062-20240917 (https://download.01.org/0day-ci/archive/20240917/202409171518.qdLmV9WL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409171518.qdLmV9WL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/fault.c:115:38-43: ERROR: invalid reference to the index variable of the iterator on line 107

vim +115 drivers/iommu/iommufd/fault.c

b7d8833677baad Lu Baolu 2024-07-02   95  
b7d8833677baad Lu Baolu 2024-07-02   96  static void iommufd_auto_response_faults(struct iommufd_hw_pagetable *hwpt,
b7d8833677baad Lu Baolu 2024-07-02   97  					 struct iommufd_attach_handle *handle)
b7d8833677baad Lu Baolu 2024-07-02   98  {
b7d8833677baad Lu Baolu 2024-07-02   99  	struct iommufd_fault *fault = hwpt->fault;
b7d8833677baad Lu Baolu 2024-07-02  100  	struct iopf_group *group, *next;
b7d8833677baad Lu Baolu 2024-07-02  101  	unsigned long index;
b7d8833677baad Lu Baolu 2024-07-02  102  
b7d8833677baad Lu Baolu 2024-07-02  103  	if (!fault)
b7d8833677baad Lu Baolu 2024-07-02  104  		return;
b7d8833677baad Lu Baolu 2024-07-02  105  
b7d8833677baad Lu Baolu 2024-07-02  106  	mutex_lock(&fault->mutex);
b7d8833677baad Lu Baolu 2024-07-02 @107  	list_for_each_entry_safe(group, next, &fault->deliver, node) {
b7d8833677baad Lu Baolu 2024-07-02  108  		if (group->attach_handle != &handle->handle)
b7d8833677baad Lu Baolu 2024-07-02  109  			continue;
b7d8833677baad Lu Baolu 2024-07-02  110  		list_del(&group->node);
b7d8833677baad Lu Baolu 2024-07-02  111  		iopf_group_response(group, IOMMU_PAGE_RESP_INVALID);
b7d8833677baad Lu Baolu 2024-07-02  112  		iopf_free_group(group);
b7d8833677baad Lu Baolu 2024-07-02  113  	}
b7d8833677baad Lu Baolu 2024-07-02  114  
b7d8833677baad Lu Baolu 2024-07-02 @115  	xa_for_each(&fault->response, index, group) {
b7d8833677baad Lu Baolu 2024-07-02  116  		if (group->attach_handle != &handle->handle)
b7d8833677baad Lu Baolu 2024-07-02  117  			continue;
b7d8833677baad Lu Baolu 2024-07-02  118  		xa_erase(&fault->response, index);
b7d8833677baad Lu Baolu 2024-07-02  119  		iopf_group_response(group, IOMMU_PAGE_RESP_INVALID);
b7d8833677baad Lu Baolu 2024-07-02  120  		iopf_free_group(group);
b7d8833677baad Lu Baolu 2024-07-02  121  	}
b7d8833677baad Lu Baolu 2024-07-02  122  	mutex_unlock(&fault->mutex);
b7d8833677baad Lu Baolu 2024-07-02  123  }
b7d8833677baad Lu Baolu 2024-07-02  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
