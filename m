Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263332472A5
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755881846; cv=none; b=A5t8YGb5sNkeTeJqWcBXoEO3yvb92wq42lXLWukB9WpsrXZ17NB7xns8ISsiqhzdlyckCS0ecYVxG67WeJ3fAcjU52zkXgosKezF5TY/2dMw0imtDWGNC25hagY0R3W9iNDirUdSnioBFUcgDywKLDmELZE5wezZLdl0HIIyKSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755881846; c=relaxed/simple;
	bh=JNB1ZBceNNplE+iBKtqOiRGSEIT1VZe8wk6ylNbInpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U04b6svFePILkw9XlSObLcZT42t+HQBtv9JOoBp74Wa5pMTk+A6qovj7SaYD/TuBEbeEuxxM0JXK2L5oyHusQBOcP63ajeKnZbhY31QxkC2/h2D6lJflWzfVBFELBzfYrjljeOfI6eAEE3kO1VCob0VFmVzOl/ZsB0qUG9TctGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DodAqwV/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DodAqwV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755881844; x=1787417844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JNB1ZBceNNplE+iBKtqOiRGSEIT1VZe8wk6ylNbInpo=;
  b=DodAqwV/mKrDu0xlIVlxQEbEVSRKzaouZNTC74LltANeLVlnH0tQPUq1
   qQV6wPOXNBHnJ5duzuf9ZRFCvqnLVnhOh+aamUrgi0rmpKtm81nu/K1Hn
   mXMbxcxf/peqJjhCEOlxVyw0nYHtfXhkrxaflU+RccmCsrYwU4YS0lFKI
   U/cCJn5Tau8XYYYgSRIRV9M8xYvpbk7GqM8rvnSUc09NsDQSI8eZpLI7V
   5j1V9r8InajAg/dLqZyPyB1AuU4AQfGse8/8vwQI6GAh4cbFzcFAIzIkI
   LmY+UimNFVUPZSMVyDVMHD5C3VUDN0LOa3SjjZKmgv33PsJ6lqVrqgcNL
   g==;
X-CSE-ConnectionGUID: Jb/aKIMTR/OL5Mo3NUVPGw==
X-CSE-MsgGUID: WyJPIK6uRci+zMfS+USRNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68466508"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68466508"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 09:57:24 -0700
X-CSE-ConnectionGUID: E0a1GumVTMuCBcRvCuB8wA==
X-CSE-MsgGUID: UNS7UHopRgyGZI/vIZX/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199719383"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Aug 2025 09:57:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upV4p-000LYx-2f;
	Fri, 22 Aug 2025 16:57:19 +0000
Date: Sat, 23 Aug 2025 00:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/msm_iommu.c:778 msm_iommu_gpu_new() error: we
 previously assumed 'adreno_smmu' could be null (see line 767)
Message-ID: <202508230010.dMoERmOs-lkp@intel.com>
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
TO: Rob Clark <robdclark@chromium.org>
CC: Antonino Maniscalco <antomani103@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf6fc5eefc5bbbbff92a085039ff74cdbd065c29
commit: e601ea31d66ba83d565cae9cfa45cbbcdd8286dd drm/msm: Support pgtable preallocation
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r071-20250822 (https://download.01.org/0day-ci/archive/20250823/202508230010.dMoERmOs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508230010.dMoERmOs-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_iommu.c:778 msm_iommu_gpu_new() error: we previously assumed 'adreno_smmu' could be null (see line 767)

vim +/adreno_smmu +778 drivers/gpu/drm/msm/msm_iommu.c

c37d9f0b1a1873 Abhinav Kumar    2025-02-19  755  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  756  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  757  {
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  758  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  759  	struct msm_iommu *iommu;
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  760  	struct msm_mmu *mmu;
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  761  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  762  	mmu = msm_iommu_new(dev, quirks);
db40d2928d245f Luca Weiss       2023-05-08  763  	if (IS_ERR_OR_NULL(mmu))
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  764  		return mmu;
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  765  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  766  	iommu = to_msm_iommu(mmu);
e601ea31d66ba8 Rob Clark        2025-06-29 @767  	if (adreno_smmu && adreno_smmu->cookie) {
e601ea31d66ba8 Rob Clark        2025-06-29  768  		const struct io_pgtable_cfg *cfg =
e601ea31d66ba8 Rob Clark        2025-06-29  769  			adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
e601ea31d66ba8 Rob Clark        2025-06-29  770  		size_t tblsz = get_tblsz(cfg);
e601ea31d66ba8 Rob Clark        2025-06-29  771  
e601ea31d66ba8 Rob Clark        2025-06-29  772  		iommu->pt_cache =
e601ea31d66ba8 Rob Clark        2025-06-29  773  			kmem_cache_create("msm-mmu-pt", tblsz, tblsz, 0, NULL);
e601ea31d66ba8 Rob Clark        2025-06-29  774  	}
f66f3cf6bc42ab Abhinav Kumar    2025-02-19  775  	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  776  
8cceb773f565f3 Dmitry Baryshkov 2023-02-14  777  	/* Enable stall on iommu fault: */
8cceb773f565f3 Dmitry Baryshkov 2023-02-14 @778  	if (adreno_smmu->set_stall)

:::::: The code at line 778 was first introduced by commit
:::::: 8cceb773f565f3a6e3c6c09198aef5a394154ca9 drm/msm/adreno: stall translation on fault for all GPU families

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
