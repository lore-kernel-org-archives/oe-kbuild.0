Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19901D54F7
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Jul 2025 22:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753829241; cv=none; b=Zjjmqj5oVj1OrXghM/LEuG3aLTNjzZ12diUxbEwVP2cBfBdgZ9icnkWei308jxZQ9S+/3AbxIn/1nqH61MvA6apU0ghKzLdqD0QUJLumdASMtnUeao0r5uj08CeLV10hUe1cNM0JyII9kAXBCmOd5w45G4OLm4TB8sEJYJkVpGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753829241; c=relaxed/simple;
	bh=i69R2MzxdHOe9Q0fP8FFxdxwaRoPNfDNenESluwSRkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpKcSiWg74kBJmvNpY0nC638hSBzWDUBV7jkYjvdaSIw0Yz1nxZrQ7pOEeYd07HLAN5A1bcbZI1/x19lZ2I4NQcaNdO2kYn34yKUffqhjyL06RRa0VcWB3br2p4bXKcuqo1zAjFMbrXNBJeftCHwH/zeEkTTBsd6bnfvCXkWnSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eT9BJpNu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eT9BJpNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753829239; x=1785365239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i69R2MzxdHOe9Q0fP8FFxdxwaRoPNfDNenESluwSRkA=;
  b=eT9BJpNuHHehEaT61hfeGXhGiFuJDVd8wNbZEczwxFJJXD57kLQ/dtc6
   FFlpAMS2800As2bbu74UVXs+AuaG2cka+Xm1IgeW6+Cy2O78zEVyA2ntO
   buMseF/DF2z691GX/E1cSxBKbsb0bwgoNVjNa3MIuNTa7smpD7HdP+Rh8
   kxmLbf4gmdNZf6DRLWtwMXgI/m6yV6HHiVs7Ko14HUDeO0HcF1fU0Gzhf
   99OtxE1elXBAY6fgf+zBKt47jEngoGRTVpsjdgcS5lbxZ2BJINacP30o2
   +J9CKjfSfXR3O3Sv4i3GeRimLfdxgEDTgkmTHHDzMB25PmuwTS/7+6ZB1
   Q==;
X-CSE-ConnectionGUID: PZabw0AdRvyi6+HgMivvXQ==
X-CSE-MsgGUID: L0c12x88R7yYMI6bd+kirA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59943260"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="59943260"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 15:47:17 -0700
X-CSE-ConnectionGUID: 8XI6jl7oSkCiJme+4E/Sdw==
X-CSE-MsgGUID: /g+4ye+0SeC0LQ2qHas+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163168689"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2025 15:47:16 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugt6I-0001k3-0F;
	Tue, 29 Jul 2025 22:47:14 +0000
Date: Wed, 30 Jul 2025 06:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
Message-ID: <202507300646.kTchyjvh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250729060728.82402-1-chuguangqing@inspur.com>
References: <20250729060728.82402-1-chuguangqing@inspur.com>
TO: chuguangqing <chuguangqing@inspur.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: chuguangqing <chuguangqing@inspur.com>

Hi chuguangqing,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on drm-misc/drm-misc-next v6.16 next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chuguangqing/gpu-drm-fix-compilation-errors-in-drm_vram_helper/20250729-141222
base:   linus/master
patch link:    https://lore.kernel.org/r/20250729060728.82402-1-chuguangqing%40inspur.com
patch subject: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: s390-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300646.kTchyjvh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300646.kTchyjvh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507300646.kTchyjvh-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/drm_gem_ttm_helper: 'drm_gem_ttm_print_info' exported twice. Previous export was in vmlinux
>> ERROR: modpost: drivers/gpu/drm/drm_gem_ttm_helper: 'drm_gem_ttm_vmap' exported twice. Previous export was in vmlinux
>> ERROR: modpost: drivers/gpu/drm/drm_gem_ttm_helper: 'drm_gem_ttm_vunmap' exported twice. Previous export was in vmlinux
>> ERROR: modpost: drivers/gpu/drm/drm_gem_ttm_helper: 'drm_gem_ttm_mmap' exported twice. Previous export was in vmlinux
>> ERROR: modpost: drivers/gpu/drm/drm_gem_ttm_helper: 'drm_gem_ttm_dumb_map_offset' exported twice. Previous export was in vmlinux

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
