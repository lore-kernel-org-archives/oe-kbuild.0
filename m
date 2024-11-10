Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7D322B
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731249613; cv=none; b=i3cejZV9O0Ztwyr5vbKsl9ZntsA65gd/YXVtc6n0AbjixUmlsdh7xKtltgAInnutbI7uds1dBeaXV6SoYpjHLn3A/vfcvdUO2Gq1EnWsBNMIT6dT0p2e5EB1XfUoOQ+QJ7xjJHvP00IOEQBs/4vidclBBA2aPmLgsS7L4uumVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731249613; c=relaxed/simple;
	bh=E/eHRaDJ3+ZNviM9Z6BphsZRM8zJ8TZWOhmif4piuVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FIhMLlBg+ayny2mJ1+XbsQWRaeekyuqrZPP0m6h/6WF8Aipv7EVJ5PDJAJZJfRSEU9PAas+BgZc9ik21LU5aHD+SIIzxAD8GK+1+yhFJk+C0w9LMSBb+5KG9hodKeWPQcDc+C96ZxqI0BM5GFKd7F4mPuuY1Q8aviNtDh9R9Uso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEHFQJtZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEHFQJtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731249612; x=1762785612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E/eHRaDJ3+ZNviM9Z6BphsZRM8zJ8TZWOhmif4piuVk=;
  b=EEHFQJtZvdF3Eyv7I6ZlEynvyi0gdKpuOt/d5BwNo8UaBaNMz8YA++e/
   UiuHuTz6mH7AriXe/KvYF/oB35yUE9e+W5s88exrepcV3S5qxAmFyuF/B
   S/Zcu1mXFnRsG1ReVVz0FltvxQ9A3WKWqoTvZngB/9TtEEXWPmj6KTZtB
   XVJ7bxAb/vr1zhI7nK5sMKtO2nOpKBWUukF3ohCUM4FKC0PY/LjduhX32
   6iagdKMu39OHVOAWDsDJaD2HX49IExAvHwZu6QVWXYi8aPxdPO7D9wjE9
   GBb9mu/YCWhR0R4yeLFtZ7QXdjP4bVthhGhdb1N6hULTzilufPlBDq5QF
   w==;
X-CSE-ConnectionGUID: tEJg664KT0Oghpob4oYftA==
X-CSE-MsgGUID: K3kZcntQSLWgRYQdKXmH9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30836513"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30836513"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 06:40:11 -0800
X-CSE-ConnectionGUID: L0WZd7NpR6GUIfd9Cek/IA==
X-CSE-MsgGUID: iqPTTsiuQbiEzQsqL/p98Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="86412022"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Nov 2024 06:40:11 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA96m-0000Bz-03;
	Sun, 10 Nov 2024 14:40:08 +0000
Date: Sun, 10 Nov 2024 22:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iommu/iommufd/fault.c:115:38-43: ERROR: invalid reference to
 the index variable of the iterator on line 107
Message-ID: <202411102249.17V47Lz6-lkp@intel.com>
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
head:   de2f378f2b771b39594c04695feee86476743a69
commit: b7d8833677baad8c80ed1aac8c396d687e64a376 iommufd: Fault-capable hwpt attach/detach/replace
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-054-20241110 (https://download.01.org/0day-ci/archive/20241110/202411102249.17V47Lz6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411102249.17V47Lz6-lkp@intel.com/

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
