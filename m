Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72BC171C9
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755333359; cv=none; b=BL2/YjtyqvV0po9ME2d1ZocNixWDYrlYsyb8NZnicolrvwPsItfiw9IpU98BNY0/ho90jgnvDgSmuip9lgmF4pGlIF/FAourg858ziLYTMnYYpJVzthWysjHAXuTGajjNwpoHk+2nPdeEEojL6OMZN5CJ1FDdjivqWG7B8GKUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755333359; c=relaxed/simple;
	bh=2EJDYZaaDakuSXP4Yf81ASWkPEh8hRe1l9r0IXWChCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dthJlWlDBJAIWqpZWjgjMI4jPuFWuEdOWt2+5uOjiuHFgGypCj0xWGuyuWjrZwvZZKG8DYgfD2C6bd3ZUz+d0yoNLi7xAEnKPtgGbXOz2nifyNb6nhWIt8K2M+jOwT+3RT9TtfxgrGkpMEmhWza6/IjZxSGD8bbpS5eudVKm//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpZxZKji; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpZxZKji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755333358; x=1786869358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2EJDYZaaDakuSXP4Yf81ASWkPEh8hRe1l9r0IXWChCY=;
  b=LpZxZKjij3l8JXs5MPkbpCAuaYYlmuw/2X1laWh6s0Tyfoj3j958iwbP
   D0GEW6S8XvG1w0PBYCr2Te3Cg4OgUAFeAkMpKgrAPvQa3ZpZIWjKe2Vdw
   I55I3UBr64IdlZuopzp3WjULgqkLcxJ+qN7GH2fNE0nhdogjh3GU0ZCC3
   sPWuY8UFMie0iuXgM/aifES1ZaArH2etUzel5Lr7TeVSSvoCP8vIcvfUC
   +cdax4CXSVbZ8VzAQIkS/NZ2teP4Rx3/P83LUtbAlV3aK60qxhRRURcf/
   Q/1bEnY0kgJwY24A0wUGGLs7oR6d1BObE2vg+qcfxYatMqZlHOo7MN+RK
   Q==;
X-CSE-ConnectionGUID: 3fdY0TYhTrOA2x3cS63rNQ==
X-CSE-MsgGUID: t/8CwIf2T9WsTmO/ELFYpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="75203857"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75203857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 01:35:57 -0700
X-CSE-ConnectionGUID: Wc3efHShTmm0EUp1Dpxg9w==
X-CSE-MsgGUID: p2vDPRrsSmqBSCtJRMuNEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167564524"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2025 01:35:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unCOI-000CkA-0R;
	Sat, 16 Aug 2025 08:35:54 +0000
Date: Sat, 16 Aug 2025 16:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v11 3/9] tee: implement protected DMA-heap
Message-ID: <202508161645.gRvuwznK-lkp@intel.com>
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
In-Reply-To: <20250813060339.2977604-4-jens.wiklander@linaro.org>
References: <20250813060339.2977604-4-jens.wiklander@linaro.org>
TO: Jens Wiklander <jens.wiklander@linaro.org>

Hi Jens,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Wiklander/optee-sync-secure-world-ABI-headers/20250813-140602
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20250813060339.2977604-4-jens.wiklander%40linaro.org
patch subject: [PATCH v11 3/9] tee: implement protected DMA-heap
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: alpha-randconfig-r071-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161645.gRvuwznK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508161645.gRvuwznK-lkp@intel.com/

smatch warnings:
drivers/tee/tee_heap.c:327 tee_device_put_all_dma_heaps() warn: iterator 'i' not incremented

vim +/i +327 drivers/tee/tee_heap.c

47438b4ab89c8e Jens Wiklander 2025-08-13  321  
47438b4ab89c8e Jens Wiklander 2025-08-13  322  void tee_device_put_all_dma_heaps(struct tee_device *teedev)
47438b4ab89c8e Jens Wiklander 2025-08-13  323  {
47438b4ab89c8e Jens Wiklander 2025-08-13  324  	struct tee_dma_heap *h;
47438b4ab89c8e Jens Wiklander 2025-08-13  325  	u_long i;
47438b4ab89c8e Jens Wiklander 2025-08-13  326  
47438b4ab89c8e Jens Wiklander 2025-08-13 @327  	xa_for_each(&tee_dma_heap, i, h) {
47438b4ab89c8e Jens Wiklander 2025-08-13  328  		if (h) {
47438b4ab89c8e Jens Wiklander 2025-08-13  329  			mutex_lock(&h->mu);
47438b4ab89c8e Jens Wiklander 2025-08-13  330  			if (h->teedev == teedev && !h->shutting_down) {
47438b4ab89c8e Jens Wiklander 2025-08-13  331  				h->shutting_down = true;
47438b4ab89c8e Jens Wiklander 2025-08-13  332  				put_tee_heap(h);
47438b4ab89c8e Jens Wiklander 2025-08-13  333  			}
47438b4ab89c8e Jens Wiklander 2025-08-13  334  			mutex_unlock(&h->mu);
47438b4ab89c8e Jens Wiklander 2025-08-13  335  		}
47438b4ab89c8e Jens Wiklander 2025-08-13  336  	}
47438b4ab89c8e Jens Wiklander 2025-08-13  337  }
47438b4ab89c8e Jens Wiklander 2025-08-13  338  EXPORT_SYMBOL_GPL(tee_device_put_all_dma_heaps);
47438b4ab89c8e Jens Wiklander 2025-08-13  339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
