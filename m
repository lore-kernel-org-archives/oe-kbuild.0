Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0C776051
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706548630; cv=none; b=nRW9FsjGLOiKcPxOPcywjgf4W9BjnXNAatBZE9i6JwqqAVxiFJqChzwQsdWO0ghv/uzerY8fAu2e6325NkaJVubAyIixKoEFo4R2yzru0LCk7kWOiU2TWF14UhCWwcJuIY0CN2oa027jInCSIUDN2ACRECoVaAFncQKTh9BS8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706548630; c=relaxed/simple;
	bh=qDeJRGyg9/BtF8LlQcdQaXnpzBap66rmpToZWVxIdhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INZGU8TcLVNAQOUqxGHA8jW7zXo3LXhPcv38b4J6sgon2vnKlRMCm+9RaFqLsUl6G7VF93R89NIrVbc1X82JEAknoYJtKmJSLHojsbqwG/NKKqDl7Bt3lkzs7zBdUSmkKs9u0Is4RIGhxBkurN+Kg8iH7UFt6FqeSkZ2tFTac1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqsxjdD5; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqsxjdD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706548627; x=1738084627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qDeJRGyg9/BtF8LlQcdQaXnpzBap66rmpToZWVxIdhA=;
  b=GqsxjdD5au31XtkeJwK7zhyKy/g+dBJPbuPKqAu4nlfnswebpDShEVEP
   r5QlcEwicElzZmEvjopwhOeXdch6IJMiK4Wy1LXcerjaqx1Mi4sr4aHQV
   vQicrs6A0t1kuWYE2+s7jhqQk1LIGgLjU+DZXpdWW5/7NzBvHZTizrcXS
   UCZvHOKiKRAV/qIpk8VOq6IJTYZ/lytGJ8k48mBZVuT1Xzfd2CjzuCOp3
   nJcUW04pU5Hhyx1M4RIztQjzfjpC+GwDnj6EEG6vQagGYSdTmvz4Xk+MZ
   ykbfWaYi0+B1XtU4GI0TzzjmEwUUqCAYqgTW7jm/vzeJMAj4BQxVUppIf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="402653709"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="402653709"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 09:17:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29591879"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2024 09:17:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUVFm-0004Ua-0t;
	Mon, 29 Jan 2024 17:17:02 +0000
Date: Tue, 30 Jan 2024 01:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2565/2825] mm/userfaultfd.c:983
 move_zeropage_pte() warn: inconsistent returns 'dst_ptl'.
Message-ID: <202401300107.U8iMAkTl-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   596764183be8ebb13352b281a442a1f1151c9b06
commit: ea4df6a5ea81105879ca5549555e231c4596fbc4 [2565/2825] userfaultfd: handle zeropage moves by UFFDIO_MOVE
:::::: branch date: 14 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20240129 (https://download.01.org/0day-ci/archive/20240130/202401300107.U8iMAkTl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401300107.U8iMAkTl-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:983 move_zeropage_pte() warn: inconsistent returns 'dst_ptl'.

vim +/dst_ptl +983 mm/userfaultfd.c

adef440691bab8 Andrea Arcangeli   2023-12-06  961  
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  962  static int move_zeropage_pte(struct mm_struct *mm,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  963  			     struct vm_area_struct *dst_vma,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  964  			     struct vm_area_struct *src_vma,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  965  			     unsigned long dst_addr, unsigned long src_addr,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  966  			     pte_t *dst_pte, pte_t *src_pte,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  967  			     pte_t orig_dst_pte, pte_t orig_src_pte,
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  968  			     spinlock_t *dst_ptl, spinlock_t *src_ptl)
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  969  {
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  970  	pte_t zero_pte;
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  971  
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  972  	double_pt_lock(dst_ptl, src_ptl);
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  973  	if (!pte_same(ptep_get(src_pte), orig_src_pte) ||
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  974  	    !pte_same(ptep_get(dst_pte), orig_dst_pte))
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  975  		return -EAGAIN;
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  976  
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  977  	zero_pte = pte_mkspecial(pfn_pte(my_zero_pfn(dst_addr),
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  978  					 dst_vma->vm_page_prot));
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  979  	ptep_clear_flush(src_vma, src_addr, src_pte);
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  980  	set_pte_at(mm, dst_addr, dst_pte, zero_pte);
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  981  	double_pt_unlock(dst_ptl, src_ptl);
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  982  
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24 @983  	return 0;
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  984  }
ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  985  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
