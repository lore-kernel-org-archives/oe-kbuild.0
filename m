Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857091D47A2
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Apr 2025 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743842226; cv=none; b=pusGrFTqt3bn0J/JHeOyiLfPLig5XZJ50k/wKFYBXOLedkKQ1OOIP+g2R4Z/O1w0KOnhx0MbpvxMyLknLY9pvWH5L8+UrFqNf11mSRF0GpHophQEPTtlhQcbnfwrNTZ2xwCSa1GAw649e8iMQS9a2xKsQ2pSHVEa96yrqJoCmGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743842226; c=relaxed/simple;
	bh=4bqtxHjl0rxJ3XmJt9MI1z8IkNpYMvhsP6v3vkycU7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IFBix3ybyTVSvFnliKE/UgAP6llArXxgD+umYOzznLZOQeeO/7Vy/D12kFSVxTt8JImlffcvzfG1HFksKP/k7/r2mPmHEwrhm7QKwW5xxM+uZXT2z82XZTgyyhQOgpMS+apjWuMnAMniucXmF5VlE6Glm/6A5Iyv06L1UxB+cDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZj7vwQW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZj7vwQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743842225; x=1775378225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bqtxHjl0rxJ3XmJt9MI1z8IkNpYMvhsP6v3vkycU7M=;
  b=MZj7vwQWvWdb0VnAJN4suRCAXoarLnb6Pg3J7D0jYEBtpeLT9neaAVpL
   KLhgzgxGWEtGnP83cIolEVaLZvVCcY8mkPeghbP9nlZp9ZLNu+MYvRk10
   Sw7775I/qZKQkr7hJ60FDwTzfZnPdrUx4of8ROsQ+tBeibecnaY8eJZZR
   IyWCyOzgL/LnTxOKG1lqz08EMvTrmqkjPympkRaV+K0zNICwFUT/0HZC1
   ox2CkT43Nj3zDIfOTDgDD1eULZY19UBtzg/iQfj6WLp2oglkBJhedVLSV
   DGiSrRf9WywPldO8aVqe5YIxQzzerDtPFAtOqypbJ+iY3Sim/Oh6+Yxn5
   g==;
X-CSE-ConnectionGUID: fj57TYhvR7OefjF15lDYSw==
X-CSE-MsgGUID: rbJljAFWSjCfM7ymo1wUMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44529400"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="44529400"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 01:37:01 -0700
X-CSE-ConnectionGUID: AP9SSYAZQ6ukcTbCRWUsVQ==
X-CSE-MsgGUID: jSWem7BJRCGGx3wbEUuB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="131652610"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Apr 2025 01:37:00 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0z1N-0001u9-1E;
	Sat, 05 Apr 2025 08:36:57 +0000
Date: Sat, 5 Apr 2025 16:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/userfaultfd_k.h:221 vma_can_userfault() warn: bitwise
 AND condition is false here
Message-ID: <202504051652.tDFckPp0-lkp@intel.com>
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
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a8662bcd2ff152bfbc751cab20f33053d74d0963
commit: 9651fcedf7b92d3f7f1ab179e8ab55b85ee10fc1 mm: add MAP_DROPPABLE for designating always lazily freeable mappings
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-r072-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051652.tDFckPp0-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504051652.tDFckPp0-lkp@intel.com/

smatch warnings:
include/linux/userfaultfd_k.h:221 vma_can_userfault() warn: bitwise AND condition is false here

vim +221 include/linux/userfaultfd_k.h

932b18e0aec65a Andrea Arcangeli   2015-09-04  214  
b1f9e876862d8f Peter Xu           2022-05-12  215  static inline bool vma_can_userfault(struct vm_area_struct *vma,
d61ea1cb009532 Peter Xu           2023-08-21  216  				     unsigned long vm_flags,
d61ea1cb009532 Peter Xu           2023-08-21  217  				     bool wp_async)
b1f9e876862d8f Peter Xu           2022-05-12  218  {
d61ea1cb009532 Peter Xu           2023-08-21  219  	vm_flags &= __VM_UFFD_FLAGS;
d61ea1cb009532 Peter Xu           2023-08-21  220  
9651fcedf7b92d Jason A. Donenfeld 2022-12-08 @221  	if (vm_flags & VM_DROPPABLE)
9651fcedf7b92d Jason A. Donenfeld 2022-12-08  222  		return false;
9651fcedf7b92d Jason A. Donenfeld 2022-12-08  223  
67eae54bc227b3 Peter Xu           2022-10-24  224  	if ((vm_flags & VM_UFFD_MINOR) &&
67eae54bc227b3 Peter Xu           2022-10-24  225  	    (!is_vm_hugetlb_page(vma) && !vma_is_shmem(vma)))
67eae54bc227b3 Peter Xu           2022-10-24  226  		return false;
d61ea1cb009532 Peter Xu           2023-08-21  227  
d61ea1cb009532 Peter Xu           2023-08-21  228  	/*
d61ea1cb009532 Peter Xu           2023-08-21  229  	 * If wp async enabled, and WP is the only mode enabled, allow any
d61ea1cb009532 Peter Xu           2023-08-21  230  	 * memory type.
d61ea1cb009532 Peter Xu           2023-08-21  231  	 */
d61ea1cb009532 Peter Xu           2023-08-21  232  	if (wp_async && (vm_flags == VM_UFFD_WP))
d61ea1cb009532 Peter Xu           2023-08-21  233  		return true;
d61ea1cb009532 Peter Xu           2023-08-21  234  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
