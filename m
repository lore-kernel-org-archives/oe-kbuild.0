Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA8028EC
	for <oe-kbuild@lists.linux.dev>; Mon,  5 May 2025 16:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460863; cv=none; b=u3B7//g1C4M8r/AJMGvfQ2o7clIqRtEoS+ahtSVAI/BLdQanEuEfQyRzbGShYmVQlQGzl5HoYRWxq+X8QtOb/ThEQQt93Fbg/TFAsTB9x+7H+zs9/S59VPf0h09TFgjr+ni2QlPjWh3+xrf1aPvWRMg4zOBWZSaSGka3KdrKgZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460863; c=relaxed/simple;
	bh=o+MdLjZV9ScS2u4UUXHzTfdgmyYyPSQDX5aI9wROw9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQ3FLOkpeiSj2TKB+agkPQq4Ptsy0ZKIjX9JXb68mMF8YqBSWh7IPT/ltykL2StcRyZX9o/U3Jk/BJvKfEbECClb5vCr7UGmpZZbu6sq7PMNd2/HxR4IgPDDMLCfzxGEqnlnVQ4EnWjsb7GxDQLISDmPk77FH7C3QwgkIh3cGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efJH8TpJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efJH8TpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746460858; x=1777996858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o+MdLjZV9ScS2u4UUXHzTfdgmyYyPSQDX5aI9wROw9A=;
  b=efJH8TpJYZhFbh99dwXmL3e3TFsUXd9lkLXbaDz7pmYdkfcqv5rdxCLR
   Ri784/33V71KYFykubTkRl14fbPktztsStO/ULuShlJtJ1ciRQG7muQZY
   x1MExXWY4W2ugiChgAW0MV8W+IfUkqFIy3PSW9G4OiCMVLE7fKAhzz/QQ
   BoG0QayuhxFHZnFquyKwc5rGfY+kpdBGZiUn47s2SaBB8cx/TPspbMW+a
   ad6iunueK+2qaJ4oNvzSL4CDQq2MkakuvJZS1KI9JHv46XTXdaNw8NIZ/
   AyFYxlUEMp4wXyxWPstMwFV36jmDgYAdS+Fbi9oDKa6oAPkx9kiNYbNNA
   Q==;
X-CSE-ConnectionGUID: 9XTxXzDQTsi92JFGINBoug==
X-CSE-MsgGUID: S8uHjyYzQWaWxtXM2JFhTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="65486497"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="65486497"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 09:00:58 -0700
X-CSE-ConnectionGUID: 0BoyCVP1RU2iByyE27/VTg==
X-CSE-MsgGUID: d8bCAmplRvebksZ0nPlWLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="166213070"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 May 2025 09:00:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uByFS-0005td-29;
	Mon, 05 May 2025 16:00:54 +0000
Date: Mon, 5 May 2025 23:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 1/3] mm: introduce new .mmap_proto() f_op callback
Message-ID: <202505052353.V1RLZ4v9-lkp@intel.com>
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
In-Reply-To: <f1bf4b452cc10281ef831c5e38ce16f09923f8c5.1746040540.git.lorenzo.stoakes@oracle.com>
References: <f1bf4b452cc10281ef831c5e38ce16f09923f8c5.1746040540.git.lorenzo.stoakes@oracle.com>
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20250505]
[cannot apply to brauner-vfs/vfs.all linus/master v6.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-introduce-new-mmap_proto-f_op-callback/20250501-035712
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/f1bf4b452cc10281ef831c5e38ce16f09923f8c5.1746040540.git.lorenzo.stoakes%40oracle.com
patch subject: [RFC PATCH 1/3] mm: introduce new .mmap_proto() f_op callback
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20250505 (https://download.01.org/0day-ci/archive/20250505/202505052353.V1RLZ4v9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505052353.V1RLZ4v9-lkp@intel.com/

smatch warnings:
mm/vma.c:2642 __mmap_region() error: we previously assumed 'vma' could be null (see line 2635)

vim +/vma +2642 mm/vma.c

d5b6d999086329 Lorenzo Stoakes 2025-04-30  2609  
f8d4a6cabb74f8 Lorenzo Stoakes 2025-01-02  2610  static unsigned long __mmap_region(struct file *file, unsigned long addr,
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2611  		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2612  		struct list_head *uf)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2613  {
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2614  	struct mm_struct *mm = current->mm;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2615  	struct vm_area_struct *vma = NULL;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2616  	int error;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2617  	VMA_ITERATOR(vmi, mm, addr);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2618  	MMAP_STATE(map, mm, &vmi, addr, len, pgoff, vm_flags, file);
d5b6d999086329 Lorenzo Stoakes 2025-04-30  2619  	bool have_proto = have_mmap_proto_hook(&map);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2620  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2621  	error = __mmap_prepare(&map, uf);
d5b6d999086329 Lorenzo Stoakes 2025-04-30  2622  	if (!error && have_proto)
d5b6d999086329 Lorenzo Stoakes 2025-04-30  2623  		error = call_proto(&map);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2624  	if (error)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2625  		goto abort_munmap;
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2626  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2627  	/* Attempt to merge with adjacent VMAs... */
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2628  	if (map.prev || map.next) {
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2629  		VMG_MMAP_STATE(vmg, &map, /* vma = */ NULL);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2630  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2631  		vma = vma_merge_new_range(&vmg);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2632  	}
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2633  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2634  	/* ...but if we can't, allocate a new VMA. */
0d11630cc50a62 Lorenzo Stoakes 2024-10-25 @2635  	if (!vma) {
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2636  		error = __mmap_new_vma(&map, &vma);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2637  		if (error)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2638  			goto unacct_error;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2639  	}
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2640  
d5b6d999086329 Lorenzo Stoakes 2025-04-30  2641  	if (have_proto)
d5b6d999086329 Lorenzo Stoakes 2025-04-30 @2642  		set_vma_user_defined_fields(vma, &map);
d5b6d999086329 Lorenzo Stoakes 2025-04-30  2643  
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2644  	/* If flags changed, we might be able to merge, so try again. */
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2645  	if (map.retry_merge) {
42c4e4b20d9c46 Lorenzo Stoakes 2024-12-06  2646  		struct vm_area_struct *merged;
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2647  		VMG_MMAP_STATE(vmg, &map, vma);
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2648  
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2649  		vma_iter_config(map.vmi, map.addr, map.end);
42c4e4b20d9c46 Lorenzo Stoakes 2024-12-06  2650  		merged = vma_merge_existing_range(&vmg);
42c4e4b20d9c46 Lorenzo Stoakes 2024-12-06  2651  		if (merged)
42c4e4b20d9c46 Lorenzo Stoakes 2024-12-06  2652  			vma = merged;
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2653  	}
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2654  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2655  	__mmap_complete(&map, vma);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2656  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2657  	return addr;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2658  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2659  	/* Accounting was done by __mmap_prepare(). */
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2660  unacct_error:
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2661  	if (map.charged)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2662  		vm_unacct_memory(map.charged);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2663  abort_munmap:
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2664  	vms_abort_munmap_vmas(&map.vms, &map.mas_detach);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2665  	return error;
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2666  }
7d344babac9984 Lorenzo Stoakes 2024-12-03  2667  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
