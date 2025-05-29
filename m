Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6DA1B042C
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 01:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481795; cv=none; b=B7hv/Dv2UWdc2dSQD8EDDFJHD37WUw0UGB+DDwqyGWrodDb2ZeTNoutk7w3zJQy1lGw1nr/vDCnha5A3QdmS2LT75PYUWHXmytBGmnSSmhDE0pFtOmim4K/RBpllKg6CZttjzFvPg2oq3YhZ4SsnamCPJJ9sXAzzDZKbgmDWBSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481795; c=relaxed/simple;
	bh=4KUKi6N84yHKpd2wWk9bG3F/1lkVeJKIBH7YLtQhuh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EB8d1F98p0+p/V+W9ccyNt8U4mXGdWyOi9X5ErMXRw9vkL/7uxz6rkkL1IVD2MuTej5rQkYXhlZsbGPSM2kZTeSpJzhCqFbXS7tSbOfpKlo+xc5cImEY63woc6/bXtZFhjFKlPJWj6clztXuAQqI4Lgqibhx88b1+OR8lkvlHqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=En5mf+38; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="En5mf+38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748481794; x=1780017794;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4KUKi6N84yHKpd2wWk9bG3F/1lkVeJKIBH7YLtQhuh8=;
  b=En5mf+386uGRR8k73wIcfGUH2TAnWz90DpD7ySeEUl+zwBCaySZ3nTYl
   iMxWXHuuxhVAMrKNlbzVFrmH0wk/YJTKVvgffa7cu4WwcvEDHY4s74liE
   sBR9JFXw6Fjr/cyeSPc2k2ycvOr0aTLbF4Xf+KAU8wSIteRv9WwklpSGH
   UqzwBC7u4MMiPtLHfuSInG16gBO9HJNntFfYyxcvFZ5b3k71nLGjGyd5J
   Bg0wHE6pYpll76DOoivIesXxsI8bFpMRDzD+4B6y2bj3lUyVSxP9UgQj4
   hvUafmCWsgoVimeI14Rw0tkaeda8sXBISwgOFHhypxM2GXLmz8+MDDpCj
   g==;
X-CSE-ConnectionGUID: dDJ/ND49RseIoxw6L89Okg==
X-CSE-MsgGUID: /Bi7JxQ7S5eL5uyiIBqB2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54334998"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="54334998"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 18:23:14 -0700
X-CSE-ConnectionGUID: YWy5U/c+T0mAfvwWh4u4uw==
X-CSE-MsgGUID: A25TdS2yT7qLb5LVSx+I2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="147296239"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2025 18:23:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKRzB-000WDA-2P;
	Thu, 29 May 2025 01:23:09 +0000
Date: Thu, 29 May 2025 09:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/8] drm/fdinfo: Switch to idr_for_each() in
 drm_show_memory_stats()
Message-ID: <202505290913.ShaJp2WI-lkp@intel.com>
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
In-Reply-To: <20250528091307.1894940-3-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-3-simona.vetter@ffwll.ch>
TO: Simona Vetter <simona.vetter@ffwll.ch>
TO: DRI Development <dri-devel@lists.freedesktop.org>
CC: intel-xe@lists.freedesktop.org
CC: Simona Vetter <simona.vetter@ffwll.ch>
CC: Rob Clark <robdclark@chromium.org>
CC: Emil Velikov <emil.l.velikov@gmail.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CC: stable@vger.kernel.org

Hi Simona,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250527]
[also build test WARNING on linus/master v6.15]
[cannot apply to v6.15 v6.15-rc7 v6.15-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simona-Vetter/drm-gem-Fix-race-in-drm_gem_handle_create_tail/20250528-171524
base:   next-20250527
patch link:    https://lore.kernel.org/r/20250528091307.1894940-3-simona.vetter%40ffwll.ch
patch subject: [PATCH 2/8] drm/fdinfo: Switch to idr_for_each() in drm_show_memory_stats()
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: nios2-randconfig-r072-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290913.ShaJp2WI-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505290913.ShaJp2WI-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_file.c:916 drm_bo_memory_stats() error: uninitialized symbol 'drm_data'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
drivers/gpu/drm/drm_file.c:920 drm_bo_memory_stats() error: uninitialized symbol 'drm_data'.
drivers/gpu/drm/drm_file.c:922 drm_bo_memory_stats() error: uninitialized symbol 'drm_data'.

vim +/drm_data +916 drivers/gpu/drm/drm_file.c

686b21b5f6ca2f Rob Clark      2023-05-24  899  
743b2fa85c5435 Simona Vetter  2025-05-28  900  static int
743b2fa85c5435 Simona Vetter  2025-05-28  901  drm_bo_memory_stats(int id, void *ptr, void *data)
743b2fa85c5435 Simona Vetter  2025-05-28  902  {
743b2fa85c5435 Simona Vetter  2025-05-28  903  	struct drm_bo_print_data *drm_data;
743b2fa85c5435 Simona Vetter  2025-05-28  904  	struct drm_gem_object *obj = ptr;
686b21b5f6ca2f Rob Clark      2023-05-24  905  	enum drm_gem_object_status s = 0;
743b2fa85c5435 Simona Vetter  2025-05-28  906  	size_t add_size;
743b2fa85c5435 Simona Vetter  2025-05-28  907  
743b2fa85c5435 Simona Vetter  2025-05-28  908  	if (!obj)
743b2fa85c5435 Simona Vetter  2025-05-28  909  		return 0;
743b2fa85c5435 Simona Vetter  2025-05-28  910  
743b2fa85c5435 Simona Vetter  2025-05-28  911  	add_size = (obj->funcs && obj->funcs->rss) ?
553c84892bac70 Adrián Larumbe 2023-09-29  912  		obj->funcs->rss(obj) : obj->size;
686b21b5f6ca2f Rob Clark      2023-05-24  913  
686b21b5f6ca2f Rob Clark      2023-05-24  914  	if (obj->funcs && obj->funcs->status) {
686b21b5f6ca2f Rob Clark      2023-05-24  915  		s = obj->funcs->status(obj);
743b2fa85c5435 Simona Vetter  2025-05-28 @916  		drm_data->supported_status |= s;
686b21b5f6ca2f Rob Clark      2023-05-24  917  	}
686b21b5f6ca2f Rob Clark      2023-05-24  918  
bebf2ebd70f210 Yunxiang Li    2024-12-19  919  	if (drm_gem_object_is_shared_for_memory_stats(obj))
743b2fa85c5435 Simona Vetter  2025-05-28  920  		drm_data->status.shared += obj->size;
bebf2ebd70f210 Yunxiang Li    2024-12-19  921  	else
743b2fa85c5435 Simona Vetter  2025-05-28  922  		drm_data->status.private += obj->size;
686b21b5f6ca2f Rob Clark      2023-05-24  923  
686b21b5f6ca2f Rob Clark      2023-05-24  924  	if (s & DRM_GEM_OBJECT_RESIDENT) {
743b2fa85c5435 Simona Vetter  2025-05-28  925  		drm_data->status.resident += add_size;
686b21b5f6ca2f Rob Clark      2023-05-24  926  	} else {
686b21b5f6ca2f Rob Clark      2023-05-24  927  		/* If already purged or not yet backed by pages, don't
686b21b5f6ca2f Rob Clark      2023-05-24  928  		 * count it as purgeable:
686b21b5f6ca2f Rob Clark      2023-05-24  929  		 */
686b21b5f6ca2f Rob Clark      2023-05-24  930  		s &= ~DRM_GEM_OBJECT_PURGEABLE;
686b21b5f6ca2f Rob Clark      2023-05-24  931  	}
686b21b5f6ca2f Rob Clark      2023-05-24  932  
686b21b5f6ca2f Rob Clark      2023-05-24  933  	if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
743b2fa85c5435 Simona Vetter  2025-05-28  934  		drm_data->status.active += add_size;
743b2fa85c5435 Simona Vetter  2025-05-28  935  		drm_data->supported_status |= DRM_GEM_OBJECT_ACTIVE;
686b21b5f6ca2f Rob Clark      2023-05-24  936  
686b21b5f6ca2f Rob Clark      2023-05-24  937  		/* If still active, don't count as purgeable: */
686b21b5f6ca2f Rob Clark      2023-05-24  938  		s &= ~DRM_GEM_OBJECT_PURGEABLE;
686b21b5f6ca2f Rob Clark      2023-05-24  939  	}
686b21b5f6ca2f Rob Clark      2023-05-24  940  
686b21b5f6ca2f Rob Clark      2023-05-24  941  	if (s & DRM_GEM_OBJECT_PURGEABLE)
743b2fa85c5435 Simona Vetter  2025-05-28  942  		drm_data->status.purgeable += add_size;
743b2fa85c5435 Simona Vetter  2025-05-28  943  
743b2fa85c5435 Simona Vetter  2025-05-28  944  	return 0;
686b21b5f6ca2f Rob Clark      2023-05-24  945  }
743b2fa85c5435 Simona Vetter  2025-05-28  946  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
