Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF1C18A93F
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733296457; cv=none; b=LiEtMwDXMQUWivSyiRsx+YYpAKgKZZ62jRr89SmaV3+tXWmrfXeElMsb2NCjVkeAvOgjk0Al+VTwupn+SoRjKQm6hXkPpxyJ3C1rRbOP4o4Aj2kg2jmB1DF3hZOVSUKyA2ZAcDnhuoSn9IyguS+oKzhVNGY8Yiq1l40Ah0Dy3W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733296457; c=relaxed/simple;
	bh=u0dTKuiZLyhRRj5UQTNfqb6JuURQS0Tz+VYYsrGu/WY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQyLNpgT2yrTa1bVasESNW8pT2L7tyYGNnTrofSAZFbF+l+Y1DQwFwSO32HI/T1KC8frNyl7p3FjhVeB3DCEKAia65dz73QG7x0F0JLZbBHWvjwOgpas+KD7vnWDlPXdYLOw+ImiWpuNMGhKSvH4usHb6m6nKwvAL+JTjHZLOag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6hLg2oZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6hLg2oZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733296455; x=1764832455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0dTKuiZLyhRRj5UQTNfqb6JuURQS0Tz+VYYsrGu/WY=;
  b=O6hLg2oZ8m9LfMNOHu7sdAqNE4dFpD4TdyFH9J7rkqaqEk6oneCU++8/
   r78iarY5TX0UECyczWG3s3sI3zBZizvF1ya1DFfPvnwwoAU81MX8RkXJy
   PTEdfmYCWIZ1dJJkZCty85bnLbMr3CStr269wGvt2oKFkfLqz7OvhaNsS
   cpfXyl+53ykPYT8DxPGzI11iRNFBVwttahYJ1b/QvtrZpved6wqBDvS9M
   5H3tzx1bMCoh7Gaf4levP8dhGls/I7klRLoEW1hDuXchU7LqY+2hMhPRN
   Uem5zwPXUle66fJEHn4zPMcC9l9r2uQil0A1YtB5JeBBvr63uMmRmslUx
   A==;
X-CSE-ConnectionGUID: fwmQEH53SKO8ZFzB7Hlw1Q==
X-CSE-MsgGUID: uBCmwpt0ToSMxsUEL0A3iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33693040"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="33693040"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:14:14 -0800
X-CSE-ConnectionGUID: /RnCdLGZQHCp91FAOQlgHg==
X-CSE-MsgGUID: QvGgy38OSnuHQC/dQPh79g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93558758"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Dec 2024 23:14:13 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIjaM-0002hB-23;
	Wed, 04 Dec 2024 07:14:10 +0000
Date: Wed, 4 Dec 2024 15:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iommu/iommufd/fault.c:115:38-43: ERROR: invalid reference to
 the index variable of the iterator on line 107
Message-ID: <202412041504.Wbe8xJZ6-lkp@intel.com>
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
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: b7d8833677baad8c80ed1aac8c396d687e64a376 iommufd: Fault-capable hwpt attach/detach/replace
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r051-20241204 (https://download.01.org/0day-ci/archive/20241204/202412041504.Wbe8xJZ6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412041504.Wbe8xJZ6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/fault.c:115:38-43: ERROR: invalid reference to the index variable of the iterator on line 107

vim +115 drivers/iommu/iommufd/fault.c

b7d8833677baad8 Lu Baolu 2024-07-02   95  
b7d8833677baad8 Lu Baolu 2024-07-02   96  static void iommufd_auto_response_faults(struct iommufd_hw_pagetable *hwpt,
b7d8833677baad8 Lu Baolu 2024-07-02   97  					 struct iommufd_attach_handle *handle)
b7d8833677baad8 Lu Baolu 2024-07-02   98  {
b7d8833677baad8 Lu Baolu 2024-07-02   99  	struct iommufd_fault *fault = hwpt->fault;
b7d8833677baad8 Lu Baolu 2024-07-02  100  	struct iopf_group *group, *next;
b7d8833677baad8 Lu Baolu 2024-07-02  101  	unsigned long index;
b7d8833677baad8 Lu Baolu 2024-07-02  102  
b7d8833677baad8 Lu Baolu 2024-07-02  103  	if (!fault)
b7d8833677baad8 Lu Baolu 2024-07-02  104  		return;
b7d8833677baad8 Lu Baolu 2024-07-02  105  
b7d8833677baad8 Lu Baolu 2024-07-02  106  	mutex_lock(&fault->mutex);
b7d8833677baad8 Lu Baolu 2024-07-02 @107  	list_for_each_entry_safe(group, next, &fault->deliver, node) {
b7d8833677baad8 Lu Baolu 2024-07-02  108  		if (group->attach_handle != &handle->handle)
b7d8833677baad8 Lu Baolu 2024-07-02  109  			continue;
b7d8833677baad8 Lu Baolu 2024-07-02  110  		list_del(&group->node);
b7d8833677baad8 Lu Baolu 2024-07-02  111  		iopf_group_response(group, IOMMU_PAGE_RESP_INVALID);
b7d8833677baad8 Lu Baolu 2024-07-02  112  		iopf_free_group(group);
b7d8833677baad8 Lu Baolu 2024-07-02  113  	}
b7d8833677baad8 Lu Baolu 2024-07-02  114  
b7d8833677baad8 Lu Baolu 2024-07-02 @115  	xa_for_each(&fault->response, index, group) {
b7d8833677baad8 Lu Baolu 2024-07-02  116  		if (group->attach_handle != &handle->handle)
b7d8833677baad8 Lu Baolu 2024-07-02  117  			continue;
b7d8833677baad8 Lu Baolu 2024-07-02  118  		xa_erase(&fault->response, index);
b7d8833677baad8 Lu Baolu 2024-07-02  119  		iopf_group_response(group, IOMMU_PAGE_RESP_INVALID);
b7d8833677baad8 Lu Baolu 2024-07-02  120  		iopf_free_group(group);
b7d8833677baad8 Lu Baolu 2024-07-02  121  	}
b7d8833677baad8 Lu Baolu 2024-07-02  122  	mutex_unlock(&fault->mutex);
b7d8833677baad8 Lu Baolu 2024-07-02  123  }
b7d8833677baad8 Lu Baolu 2024-07-02  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
