Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E12314D26
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 17:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764179062; cv=none; b=ZyKKdkzB61JXKI1DbxfM9a6PK9hYNY2mND7tAdhVC3OIjo9tWAJpZpH4W00CR4y7sFUVdR+edK3jOkI2Mkv+gqSS1W6hD1WMZSFVIxPoTgHcL7xnksk2OUbV0NiRPtla7bMJHz9717WfCR/tLMQ83/r2N7NH2DBxIfZ68e0ZvFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764179062; c=relaxed/simple;
	bh=KaUGmZEVVBxX8LJw+cqwOfci1Ddi1VnrpwzhlSsCsK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hWNXs+uTQJdu1mWaSPLD+nW3j8022KmyZQwehRlQ/hg5idvFYD4XvXcSNERRkNKFEm+gJXWQDHk0M1cXfGmaPUTH2KRHet7brGze0h0OAC9v2J/e6OmN6ErmJgQBIlC4BD0c4V8v2mYJ+fDmNME5SG6qG3M6RXpgwkZmyyUJAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3GDnpLz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3GDnpLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764179059; x=1795715059;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KaUGmZEVVBxX8LJw+cqwOfci1Ddi1VnrpwzhlSsCsK0=;
  b=k3GDnpLzH9ZJ7Q5A1AnXaeaY8An98I1js7GllpoFvfkcah/F29jGtRlN
   +ngf9n+r9UvHxNFrOf2oVFYh0gWNEvGN6TT8OqcPTshxZz7PaBYcMZb4g
   XpICDuaPxTuYRNoq1xsnxQTmfM7tRoGySy4FTUJsRgL2UagCSJ3M335yo
   kcvuCbGgSQc92f/5NgmbYtEEoCysBCq4A+wrfF4b8h7+46iWltNdXdwsO
   a6d5+p3wSvBV4dud21C9hPSwWM+5N5nRN+EIP9extTRN7+Vi6AYyIf3IK
   jJbw2ss9Icem0tlV2ciSCR2ABHlqvgAJHBBjROwx2Zz8vGk3hfZBmoqbt
   A==;
X-CSE-ConnectionGUID: n5fowJ7aQh2WmmXtDBq+xQ==
X-CSE-MsgGUID: 8T6DTn3+SR+QwWsfRXJwTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70089462"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="70089462"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:44:16 -0800
X-CSE-ConnectionGUID: iK1iBwy0StW99QT2Fbz4pA==
X-CSE-MsgGUID: +ioaGOwzQtiYbeg1BpBSuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192634099"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 09:44:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOJYn-000000003Cj-1zON;
	Wed, 26 Nov 2025 17:44:09 +0000
Date: Thu, 27 Nov 2025 01:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6936
 amdgpu_device_switch_gang() warn: passing freed memory 'old' (line 6935)
Message-ID: <202511270148.BaMdyI0o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Christian König" <christian.koenig@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   30f09200cc4aefbd8385b01e41bde2e4565a6f0e
commit: 0d9a95099dcb05b5f4719c830d15bf4fdcad0dc2 drm/amdgpu: grab an additional reference on the gang fence v2
date:   8 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 8 months ago
config: xtensa-randconfig-r071-20251126 (https://download.01.org/0day-ci/archive/20251127/202511270148.BaMdyI0o-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511270148.BaMdyI0o-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6936 amdgpu_device_switch_gang() warn: passing freed memory 'old' (line 6935)

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1688 amdgpu_device_resize_fb_bar() warn: impossible condition '(res->start > 4294967296) => (0-u32max > 4294967296)'

vim +/old +6936 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

a6328c9c3df355 Christian König 2024-01-18  6901  
68ce8b24224265 Christian König 2022-03-02  6902  /**
68ce8b24224265 Christian König 2022-03-02  6903   * amdgpu_device_switch_gang - switch to a new gang
68ce8b24224265 Christian König 2022-03-02  6904   * @adev: amdgpu_device pointer
68ce8b24224265 Christian König 2022-03-02  6905   * @gang: the gang to switch to
68ce8b24224265 Christian König 2022-03-02  6906   *
68ce8b24224265 Christian König 2022-03-02  6907   * Try to switch to a new gang.
68ce8b24224265 Christian König 2022-03-02  6908   * Returns: NULL if we switched to the new gang or a reference to the current
68ce8b24224265 Christian König 2022-03-02  6909   * gang leader.
68ce8b24224265 Christian König 2022-03-02  6910   */
68ce8b24224265 Christian König 2022-03-02  6911  struct dma_fence *amdgpu_device_switch_gang(struct amdgpu_device *adev,
68ce8b24224265 Christian König 2022-03-02  6912  					    struct dma_fence *gang)
68ce8b24224265 Christian König 2022-03-02  6913  {
68ce8b24224265 Christian König 2022-03-02  6914  	struct dma_fence *old = NULL;
68ce8b24224265 Christian König 2022-03-02  6915  
0d9a95099dcb05 Christian König 2025-01-14  6916  	dma_fence_get(gang);
68ce8b24224265 Christian König 2022-03-02  6917  	do {
68ce8b24224265 Christian König 2022-03-02  6918  		dma_fence_put(old);
a6328c9c3df355 Christian König 2024-01-18  6919  		old = amdgpu_device_get_gang(adev);
68ce8b24224265 Christian König 2022-03-02  6920  		if (old == gang)
68ce8b24224265 Christian König 2022-03-02  6921  			break;
68ce8b24224265 Christian König 2022-03-02  6922  
0d9a95099dcb05 Christian König 2025-01-14  6923  		if (!dma_fence_is_signaled(old)) {
0d9a95099dcb05 Christian König 2025-01-14  6924  			dma_fence_put(gang);
68ce8b24224265 Christian König 2022-03-02  6925  			return old;
0d9a95099dcb05 Christian König 2025-01-14  6926  		}
68ce8b24224265 Christian König 2022-03-02  6927  
68ce8b24224265 Christian König 2022-03-02  6928  	} while (cmpxchg((struct dma_fence __force **)&adev->gang_submit,
68ce8b24224265 Christian König 2022-03-02  6929  			 old, gang) != old);
68ce8b24224265 Christian König 2022-03-02  6930  
0d9a95099dcb05 Christian König 2025-01-14  6931  	/*
0d9a95099dcb05 Christian König 2025-01-14  6932  	 * Drop it once for the exchanged reference in adev and once for the
0d9a95099dcb05 Christian König 2025-01-14  6933  	 * thread local reference acquired in amdgpu_device_get_gang().
0d9a95099dcb05 Christian König 2025-01-14  6934  	 */
0d9a95099dcb05 Christian König 2025-01-14 @6935  	dma_fence_put(old);
68ce8b24224265 Christian König 2022-03-02 @6936  	dma_fence_put(old);
68ce8b24224265 Christian König 2022-03-02  6937  	return NULL;
68ce8b24224265 Christian König 2022-03-02  6938  }
220c8cc855ce70 Alex Deucher    2022-11-11  6939  

:::::: The code at line 6936 was first introduced by commit
:::::: 68ce8b242242651eb3cb4ff29b79c44d02f752c9 drm/amdgpu: add gang submit backend v2

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
