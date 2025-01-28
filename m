Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD91B19F438
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jan 2025 11:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063537; cv=none; b=l2TetU6YjMb8UcL98qEG78JAdqkrYHFT3fMYKVLCMaWtqgfxanMcFCLspRhMP8sldck9q+6ahT8wr1lnMIveSVxpEBdmNdaD854OnFik6pxQrKtMlUBTz1FdSR6mw+W/BDJs0AJiJLku2QQQSOgYUUZiTn3lYb1mw1mZRZJ4Z3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063537; c=relaxed/simple;
	bh=NP69I2IWLpS33EReec6bYyqHArLod+ffTHAr8aw/DLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMBBXLKq5RmB9N/x7jZiyybrzID38Kfj+VtDd5RMAbtOgnWRLokhr7sYT9mBLwE0whAB2LKbZ9sMD3zx/nPWmJz1lMfjoDS1aZOEdYMJVufXnqv5+qtn4tAaMpMmPwyXu20N5saFYNWUyG5UgFiyhOY8eO058FYnY6Jt4I/8geM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kj1nHy23; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kj1nHy23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738063534; x=1769599534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NP69I2IWLpS33EReec6bYyqHArLod+ffTHAr8aw/DLk=;
  b=kj1nHy23jJrCzbe7I9UQn+pqBSr0bw9X2jyuunr75nLNaQdICwJI2nfz
   i5s+9rUjhBSCi8jYfQQiHBkEqNAxejtAxgMUq/2afVGqUoi9S6YoMVSaP
   bPAQll6IbcXDguJMmTosIwI1eni5Np3tk7O5qZvpcuquPjI5vieWSsh18
   7mGv9ruOvTbt7UqIVBEQYP1q6NdYGAPJcBnjHrg29v4Ns1ytOFhJUM0eX
   scU3o9RIxsEspNCu4HyBUSd6wUYzBBJDJ0WEsUMNHSc4FQQOSj55wFOLN
   sv/mqbtMcMDsDJ2QjHj689pp5obuWJopHP7tQVDCwuVQT1vRSYPlPqKZF
   g==;
X-CSE-ConnectionGUID: cb8C/hPOQ22nibAndSH7RQ==
X-CSE-MsgGUID: iwQBlIspQfqK9Bi2FzWSGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38247620"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="38247620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 03:25:32 -0800
X-CSE-ConnectionGUID: 5GlHrFyET7Gr9ypk2bHkCQ==
X-CSE-MsgGUID: Sqmt/IpmQOq8R7fszhllbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132003823"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2025 03:25:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcjii-000hid-2v;
	Tue, 28 Jan 2025 11:25:28 +0000
Date: Tue, 28 Jan 2025 19:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/5] mm: make vmg->target consistent and further simplify
 commit_merge()
Message-ID: <202501281920.FkxJgcHL-lkp@intel.com>
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
In-Reply-To: <829048d075d18dd34572f330d17af66b8cff8441.1737929364.git.lorenzo.stoakes@oracle.com>
References: <829048d075d18dd34572f330d17af66b8cff8441.1737929364.git.lorenzo.stoakes@oracle.com>
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Liam R . Howlett" <Liam.Howlett@oracle.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Jann Horn <jannh@google.com>
CC: linux-kernel@vger.kernel.org

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-simplify-vma-merge-structure-and-expand-comments/20250127-235322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/829048d075d18dd34572f330d17af66b8cff8441.1737929364.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 4/5] mm: make vmg->target consistent and further simplify commit_merge()
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281920.FkxJgcHL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501281920.FkxJgcHL-lkp@intel.com/

smatch warnings:
mm/vma.c:126 init_multi_vma_prep() error: we previously assumed 'vmg' could be null (see line 119)

vim +/vmg +126 mm/vma.c

cacded5e42b960 Lorenzo Stoakes 2024-08-30  105  
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  106  /*
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  107   * init_multi_vma_prep() - Initializer for struct vma_prepare
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  108   * @vp: The vma_prepare struct
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  109   * @vma: The vma that will be altered once locked
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  110   * @vmg: The merge state that will be used to determine adjustment and VMA
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  111   *       removal.
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  112   */
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  113  static void init_multi_vma_prep(struct vma_prepare *vp,
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  114  				struct vm_area_struct *vma,
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  115  				struct vma_merge_struct *vmg)
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  116  {
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  117  	struct vm_area_struct *adjust;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  118  	struct vm_area_struct **remove = &vp->remove;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27 @119  	unsigned long flags = vmg ? vmg->merge_flags : 0;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  120  
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  121  	memset(vp, 0, sizeof(struct vma_prepare));
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  122  	vp->vma = vma;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  123  	vp->anon_vma = vma->anon_vma;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  124  
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  125  	if (flags & __VMG_FLAG_REMOVE_MIDDLE) {
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27 @126  		*remove = vmg->middle;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  127  		remove = &vp->remove2;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  128  	}
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  129  	if (flags & __VMG_FLAG_REMOVE_NEXT)
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  130  		*remove = vmg->next;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  131  
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  132  	if (flags & __VMG_FLAG_ADJUST_MIDDLE_START)
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  133  		adjust = vmg->middle;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  134  	else if (flags & __VMG_FLAG_ADJUST_NEXT_START)
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  135  		adjust = vmg->next;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  136  	else
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  137  		adjust = NULL;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  138  
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  139  	vp->adj_next = adjust;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  140  	if (!vp->anon_vma && adjust)
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  141  		vp->anon_vma = adjust->anon_vma;
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  142  
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  143  	VM_WARN_ON(vp->anon_vma && adjust && adjust->anon_vma &&
a6f0dbbf79ea89 Lorenzo Stoakes 2025-01-27  144  		   vp->anon_vma != adjust->anon_vma);
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  145  
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  146  	vp->file = vma->vm_file;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  147  	if (vp->file)
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  148  		vp->mapping = vma->vm_file->f_mapping;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  149  }
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  150  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
