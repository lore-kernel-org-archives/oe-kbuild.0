Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753416;
	b=acfRkmETIzMkIFsf7rIyw8yoLopg9l7p+MHe0WQlblhFpJh4FFfUD0b2BZrJfhulVelb
	 +lUP02zBA1fhGEGHdyCDH4V7t+kbq/lMZ6If7MiS2YlIftlxdiMSivjbACO5MVKroltvW
	 24glvl0lOsyvhg75ucMyipCwNHOHTlG4UoUQyedjn8oh+3FkOcXvuvABkMWm0reIxPJGq
	 Ku88UcFoEOCpdApN9d/InTmgUAiyA3KE5pNVs1xU2r4p7f4dCeS+v+VULZeXeSkwNX2oN
	 slhZJU5AsPLamT948NM9Te5NubLmLDKgSXunEyTbmiEvd+Uv/MQqm3bV+ucsFOJFuLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753416;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5bt9qiRJIVUucPE+Bi5PP8khHLZ3ToBipoEQASomlio=;
	b=YEE6Zt/Hva9yDI5rXDYmu0/OY6t1XAtMgHMinF1oFN9gYxl/jPNOEH2LxSsnixGxs0O8
	 naSn/QpMQ89XScvnEaGRka3TK70RcyTF/+7nvaNtS0bHGH3RrUZziq3fQxTb5Twd3cOg9
	 vrW/RgdetOJEmNidTa0SD0NEvhjTthWJ8KOgpSRYDoto+ZmI2LMF84JFDdpbMGHK5//CI
	 ufJgQHLVMTPDgVxPXf1R+GmLXj/0A1VVrtvj0Z4PFdo/lvDQXbnjLNckAO2TKWF7aNCji
	 j09EJ7TpX5+7AvsfRvp3MbrR1m8I3aMHPOvTg+wzMr1I2szkP0MycFiWlypvBYqn8Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ezxsXKiO;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1E606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 14:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ezxsXKiO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794753415; x=1826289415;
  h=date:from:to:cc:subject:message-id;
  bh=tqMQ28vooBy4jOL+C39+kZ7wwfAYetD5XqdMhjrngDg=;
  b=ezxsXKiOLat4VPc7CoNz92UoJbE/XbQtWA9INz9Tx+Tq4ZFUxEElCWpd
   CCBUHNK1scFSoXwnrmt82JwqaZYP4T59GB6ca8akhRm5c0vCLRk5BjTNB
   gGtaolV0ctdrAzgp2b9RB3rUJapgFhzfe5oAWXPeDIii5Gi1DlZKRbWwQ
   5iNItpfZgYjI7li4i34ycH+Io3O47e8NcNiU3vjcYq8dLRqvTnHP5brJb
   g13c6DS/9aLh4wNfl0ujIAyeWOXzCFKjTFCeT0hDNgG3iVHs/aGh52ZWF
   GeA+GeP6D0ZSqEGTSU8bdmaGTcyZxwr1laxHZBdrnLo3j+5zAfX9kvmDS
   Q==;
X-CSE-ConnectionGUID: u43lV++yR6+DHyBIorJ0jA==
X-CSE-MsgGUID: fWwn9CEwS+S3MtGGFyJ8JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3374477"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3374477"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 06:36:54 -0800
X-CSE-ConnectionGUID: MlI9R1cKQimEKkRlxWvnhQ==
X-CSE-MsgGUID: CA2Ya3fkQ1iqv87Qd86hgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9587020"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 06:36:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSbLe-000000002Ea-42y6;
	Sun, 15 Nov 2026 14:36:50 +0000
Date: Sun, 15 Nov 2026 15:36:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:969:19:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202611151517.5wTbqELn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/static-indicators/43/43c9f7cba9f9fcd09a5e23686ab4f0f67b62d888-reported_build_error_fbc-sparse"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alex Hung <alex.hung@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Harry Wentland <harry.wentland@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 43c9f7cba9f9fcd09a5e23686ab4f0f67b62d888 drm/amdgpu: Pack nested ucode_info struct
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r2310-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151517.5wTbqELn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151517.5wTbqELn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 43c9f7cba9f9 ("drm/amdgpu: Pack nested ucode_info struct")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151517.5wTbqELn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:969:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected int r @@     got restricted vm_fault_t @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:969:19: sparse:     expected int r
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:969:19: sparse:     got restricted vm_fault_t

vim +969 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c

1a3b2b5dca1924 Felix Kuehling 2021-02-24   931  
814ab9930cfd70 Philip Yang    2020-02-07   932  /**
814ab9930cfd70 Philip Yang    2020-02-07   933   * svm_migrate_to_ram - CPU page fault handler
814ab9930cfd70 Philip Yang    2020-02-07   934   * @vmf: CPU vm fault vma, address
814ab9930cfd70 Philip Yang    2020-02-07   935   *
48ff079b28d82d Felix Kuehling 2021-03-17   936   * Context: vm fault handler, caller holds the mmap read lock
814ab9930cfd70 Philip Yang    2020-02-07   937   *
814ab9930cfd70 Philip Yang    2020-02-07   938   * Return:
814ab9930cfd70 Philip Yang    2020-02-07   939   * 0 - OK
814ab9930cfd70 Philip Yang    2020-02-07   940   * VM_FAULT_SIGBUS - notice application to have SIGBUS page fault
814ab9930cfd70 Philip Yang    2020-02-07   941   */
814ab9930cfd70 Philip Yang    2020-02-07   942  static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
814ab9930cfd70 Philip Yang    2020-02-07   943  {
a546a276844079 Xiaogang Chen  2023-12-01   944  	unsigned long start, last, size;
48ff079b28d82d Felix Kuehling 2021-03-17   945  	unsigned long addr = vmf->address;
e1f84eef313f48 Philip Yang    2022-09-07   946  	struct svm_range_bo *svm_bo;
48ff079b28d82d Felix Kuehling 2021-03-17   947  	struct svm_range *prange;
48ff079b28d82d Felix Kuehling 2021-03-17   948  	struct kfd_process *p;
48ff079b28d82d Felix Kuehling 2021-03-17   949  	struct mm_struct *mm;
48ff079b28d82d Felix Kuehling 2021-03-17   950  	int r = 0;
48ff079b28d82d Felix Kuehling 2021-03-17   951  
e1f84eef313f48 Philip Yang    2022-09-07   952  	svm_bo = vmf->page->zone_device_data;
e1f84eef313f48 Philip Yang    2022-09-07   953  	if (!svm_bo) {
e1f84eef313f48 Philip Yang    2022-09-07   954  		pr_debug("failed get device page at addr 0x%lx\n", addr);
e1f84eef313f48 Philip Yang    2022-09-07   955  		return VM_FAULT_SIGBUS;
e1f84eef313f48 Philip Yang    2022-09-07   956  	}
e1f84eef313f48 Philip Yang    2022-09-07   957  	if (!mmget_not_zero(svm_bo->eviction_fence->mm)) {
e6a7746ef9a6e1 Colin Ian King 2022-09-14   958  		pr_debug("addr 0x%lx of process mm is destroyed\n", addr);
e1f84eef313f48 Philip Yang    2022-09-07   959  		return VM_FAULT_SIGBUS;
e1f84eef313f48 Philip Yang    2022-09-07   960  	}
e1f84eef313f48 Philip Yang    2022-09-07   961  
e1f84eef313f48 Philip Yang    2022-09-07   962  	mm = svm_bo->eviction_fence->mm;
e1f84eef313f48 Philip Yang    2022-09-07   963  	if (mm != vmf->vma->vm_mm)
e1f84eef313f48 Philip Yang    2022-09-07   964  		pr_debug("addr 0x%lx is COW mapping in child process\n", addr);
48ff079b28d82d Felix Kuehling 2021-03-17   965  
e1f84eef313f48 Philip Yang    2022-09-07   966  	p = kfd_lookup_process_by_mm(mm);
48ff079b28d82d Felix Kuehling 2021-03-17   967  	if (!p) {
48ff079b28d82d Felix Kuehling 2021-03-17   968  		pr_debug("failed find process at fault address 0x%lx\n", addr);
e1f84eef313f48 Philip Yang    2022-09-07  @969  		r = VM_FAULT_SIGBUS;
e1f84eef313f48 Philip Yang    2022-09-07   970  		goto out_mmput;
814ab9930cfd70 Philip Yang    2020-02-07   971  	}
a6283010e2907a Alex Sierra    2021-10-29   972  	if (READ_ONCE(p->svms.faulting_task) == current) {
a6283010e2907a Alex Sierra    2021-10-29   973  		pr_debug("skipping ram migration\n");
e1f84eef313f48 Philip Yang    2022-09-07   974  		r = 0;
e1f84eef313f48 Philip Yang    2022-09-07   975  		goto out_unref_process;
a6283010e2907a Alex Sierra    2021-10-29   976  	}
e1f84eef313f48 Philip Yang    2022-09-07   977  
48ff079b28d82d Felix Kuehling 2021-03-17   978  	pr_debug("CPU page fault svms 0x%p address 0x%lx\n", &p->svms, addr);
e1f84eef313f48 Philip Yang    2022-09-07   979  	addr >>= PAGE_SHIFT;
48ff079b28d82d Felix Kuehling 2021-03-17   980  
48ff079b28d82d Felix Kuehling 2021-03-17   981  	mutex_lock(&p->svms.lock);
48ff079b28d82d Felix Kuehling 2021-03-17   982  
a546a276844079 Xiaogang Chen  2023-12-01   983  	prange = svm_range_from_addr(&p->svms, addr, NULL);
48ff079b28d82d Felix Kuehling 2021-03-17   984  	if (!prange) {
e1f84eef313f48 Philip Yang    2022-09-07   985  		pr_debug("failed get range svms 0x%p addr 0x%lx\n", &p->svms, addr);
48ff079b28d82d Felix Kuehling 2021-03-17   986  		r = -EFAULT;
e1f84eef313f48 Philip Yang    2022-09-07   987  		goto out_unlock_svms;
48ff079b28d82d Felix Kuehling 2021-03-17   988  	}
48ff079b28d82d Felix Kuehling 2021-03-17   989  
a546a276844079 Xiaogang Chen  2023-12-01   990  	mutex_lock(&prange->migrate_mutex);
48ff079b28d82d Felix Kuehling 2021-03-17   991  
48ff079b28d82d Felix Kuehling 2021-03-17   992  	if (!prange->actual_loc)
48ff079b28d82d Felix Kuehling 2021-03-17   993  		goto out_unlock_prange;
48ff079b28d82d Felix Kuehling 2021-03-17   994  
a546a276844079 Xiaogang Chen  2023-12-01   995  	/* Align migration range start and size to granularity size */
a546a276844079 Xiaogang Chen  2023-12-01   996  	size = 1UL << prange->granularity;
a546a276844079 Xiaogang Chen  2023-12-01   997  	start = max(ALIGN_DOWN(addr, size), prange->start);
a546a276844079 Xiaogang Chen  2023-12-01   998  	last = min(ALIGN(addr + 1, size) - 1, prange->last);
48ff079b28d82d Felix Kuehling 2021-03-17   999  
a546a276844079 Xiaogang Chen  2023-12-01  1000  	r = svm_migrate_vram_to_ram(prange, vmf->vma->vm_mm, start, last,
a546a276844079 Xiaogang Chen  2023-12-01  1001  				    KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU, vmf->page);
48ff079b28d82d Felix Kuehling 2021-03-17  1002  	if (r)
e1f84eef313f48 Philip Yang    2022-09-07  1003  		pr_debug("failed %d migrate svms 0x%p range 0x%p [0x%lx 0x%lx]\n",
a546a276844079 Xiaogang Chen  2023-12-01  1004  			r, prange->svms, prange, start, last);
48ff079b28d82d Felix Kuehling 2021-03-17  1005  
48ff079b28d82d Felix Kuehling 2021-03-17  1006  out_unlock_prange:
48ff079b28d82d Felix Kuehling 2021-03-17  1007  	mutex_unlock(&prange->migrate_mutex);
e1f84eef313f48 Philip Yang    2022-09-07  1008  out_unlock_svms:
48ff079b28d82d Felix Kuehling 2021-03-17  1009  	mutex_unlock(&p->svms.lock);
e1f84eef313f48 Philip Yang    2022-09-07  1010  out_unref_process:
9682069a03c1ff Yang Li        2022-10-26  1011  	pr_debug("CPU fault svms 0x%p address 0x%lx done\n", &p->svms, addr);
48ff079b28d82d Felix Kuehling 2021-03-17  1012  	kfd_unref_process(p);
e1f84eef313f48 Philip Yang    2022-09-07  1013  out_mmput:
e1f84eef313f48 Philip Yang    2022-09-07  1014  	mmput(mm);
48ff079b28d82d Felix Kuehling 2021-03-17  1015  	return r ? VM_FAULT_SIGBUS : 0;
48ff079b28d82d Felix Kuehling 2021-03-17  1016  }
814ab9930cfd70 Philip Yang    2020-02-07  1017  

:::::: The code at line 969 was first introduced by commit
:::::: e1f84eef313f4820cca068a238c645d0a38c6a9b drm/amdkfd: handle CPU fault on COW mapping

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
