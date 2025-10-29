Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5F02C11F4
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 00:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761697900; cv=none; b=GQbht0Ao3cSi8Y9Ne/p9sPiuWbXAWUshAcA4HCtFgXpzW2ygVS70V4uqxuYzdqSLGypo4vRa6MOdAfaBNIAapM99bu4ZRk3YTc5oqcT7vktvaxMz4olqekVK68DlFEebFP+2QnuQOLMzUg5gUPyj3on6PXSS9MijWD9+fuB7rHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761697900; c=relaxed/simple;
	bh=lbLJhByiJ5OJiE27BxKnYhvKRwSsskyftdsR2SMK7Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMawTQYEZlk7zx8Rdm0cGqZzKnVsEF2GFzJEITZxdzSKbIMBCGEC8LnDSIjppyLxoLYR+7IJzgZg8nzATy00v9kfvSZfP5LloPi+WrAjirSYQ9Acv5bCN45HCdTC5L/zczTPl6m2A3zLkgIv9E+1KHRSnyeVqgHTPNgUar5Jsk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irMeUVs5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irMeUVs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761697899; x=1793233899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbLJhByiJ5OJiE27BxKnYhvKRwSsskyftdsR2SMK7Hw=;
  b=irMeUVs5RQhrKUa479NAF7zTRtPXoYpXZMZH+jLm9hhQTQA8kF1bKgYY
   iC+w8mzFujtevzojfCTRDLHiRmov34Kg19X+rDUoKCZwo0rmQnsGUx+p4
   EtmYzvLNwRVUwC8UGXvbAASsbx0xy1+8GocQgJnM6JqhyqdDYLAwyQIUC
   hphO9SQLw83LB9dDIabJI0Lxs4enkFND8T38/jWZoA438s05Va8vmg7B5
   k+RgRNBB2RtHIbpaGMDewXUJYenvhhrT53mp7ukXuK8SzqSY0xPVBQK1Y
   F2PvH+jHkQJb/Yacmwp+uXdze8EFVa5LbHVtvNAkfHw9ckxU5bMCOQTH9
   Q==;
X-CSE-ConnectionGUID: HFMeTprgT6SH8n43l91i1w==
X-CSE-MsgGUID: 1PhA4xJuQPCfg/+4ppZvEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67453588"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="67453588"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 17:31:39 -0700
X-CSE-ConnectionGUID: VAsuD6KFSJ2XeHQl22XGVA==
X-CSE-MsgGUID: zBfFjchSSjWIzaEdmZKUow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185195380"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2025 17:31:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDu6A-000Jvx-2Y;
	Wed, 29 Oct 2025 00:31:34 +0000
Date: Wed, 29 Oct 2025 08:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 443/4391] drivers/accel/ivpu/ivpu_gem.c:58:54-61:
 WARNING: Consider using %pe to print PTR_ERR()
Message-ID: <202510290821.p45JqxMU-lkp@intel.com>
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
TO: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
CC: Karol Wachowski <karol.wachowski@linux.intel.com>
CC: Maciej Falkowski <maciej.falkowski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7d2388eeec24966fc4d5cf32d706f0514f29ac5
commit: e0c0891cd63bf8338c25c423e28a5a93aed3d74c [443/4391] accel/ivpu: Rework bind/unbind of imported buffers
:::::: branch date: 21 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-103-20251029 (https://download.01.org/0day-ci/archive/20251029/202510290821.p45JqxMU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510290821.p45JqxMU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/ivpu/ivpu_gem.c:58:54-61: WARNING: Consider using %pe to print PTR_ERR()

vim +58 drivers/accel/ivpu/ivpu_gem.c

98d3f772ca7d68 Jacek Lawrynowicz 2025-05-28  46  
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  47  static struct sg_table *ivpu_bo_map_attachment(struct ivpu_device *vdev, struct ivpu_bo *bo)
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  48  {
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  49  	struct sg_table *sgt = bo->base.sgt;
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  50  
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  51  	drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach);
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  52  
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  53  	ivpu_bo_lock(bo);
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  54  
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  55  	if (!sgt) {
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  56  		sgt = dma_buf_map_attachment(bo->base.base.import_attach, DMA_BIDIRECTIONAL);
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  57  		if (IS_ERR(sgt))
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25 @58  			ivpu_err(vdev, "Failed to map BO in IOMMU: %ld\n", PTR_ERR(sgt));
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  59  		else
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  60  			bo->base.sgt = sgt;
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  61  	}
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  62  
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  63  	ivpu_bo_unlock(bo);
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  64  
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  65  	return sgt;
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  66  }
e0c0891cd63bf8 Jacek Lawrynowicz 2025-09-25  67  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
