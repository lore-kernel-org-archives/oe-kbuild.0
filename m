Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E4318039
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734274971; cv=none; b=q2YXRZFx1rDAS2o1wuTcs516scOC724bunhj/zUDbMp4lDNIr7JYl5c1a3TwojQ1Skg8hY9i+Kc/7PoM7oi4bE1sYgscZ/lBrruHavAbv0JSIQ3+uVb0iEHDlGBWzv4kR/7bn7AQ1GnKXiqz3OgWUuBoIVybFOODroi9f9u6bwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734274971; c=relaxed/simple;
	bh=M/hdQbn8SlYML6u7QFNVf3bfBJeigw4KJ39Rpo0Htes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ae3GoL20HTCWtFqY1zSV4YTw47641iGStpX48ZegrhPojPtahPzB9Fh6FrddBaPc+CcOLICy4KIsjQP/KIyT+Ep1LPNkWdTwh0kGqb5goTQVfsaGzSvmieG3KMB8BisnHjhDEPoujb8YF2xG0iWK/tWqj2CscmZ73Hzyvdbij3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DovG2YxU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DovG2YxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734274970; x=1765810970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M/hdQbn8SlYML6u7QFNVf3bfBJeigw4KJ39Rpo0Htes=;
  b=DovG2YxUVPPcLgVT5p2Ft/pWDeu9R3JBGDiZFR3rnpw67kK9O0qQyhE3
   e1jb43lhPPWRhkZX6kXZ16Ij/JNyNVSN8yxQAM/CUHRjUDPahXYhMqCEi
   yf2Gc7k0/PeajHoj4k35bDMGIzok74L3fUkBifDCyioFjs3ZJD+xbmyDz
   WoyfP5lCrQn+QwsVuTfoFZI0mw3WrEVkQv+oBniHRrSO7sm0j18ealnpC
   TNCpwBmyzee7ZuDmaMluiA281KHLN2NlvNEm7bpaFShD0CV7rJLToacWv
   vapRD2kRWkTnF289bFcbkZBSmL8q4Pk68EmNSpT37mIu53Kum1N63BLYU
   Q==;
X-CSE-ConnectionGUID: JsaHDZcISL6GM+YSYUbFsA==
X-CSE-MsgGUID: TdzISESpRoSLZCZ6Lmc0LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34394794"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="34394794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 07:02:49 -0800
X-CSE-ConnectionGUID: zroajbECRbyOhE7tuvd/jw==
X-CSE-MsgGUID: WO+frBhcSoeV/M4JwHhBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="127793221"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2024 07:02:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMq8r-000Dg6-0x;
	Sun, 15 Dec 2024 15:02:45 +0000
Date: Sun, 15 Dec 2024 23:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:219:16-26: ERROR: invalid
 reference to the index variable of the iterator on line 207
Message-ID: <202412152253.mPrDQYGU-lkp@intel.com>
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
TO: Yang Wang <kevinyang.wang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d8308bf5b67dff50262d8a9260a50113b3628c6
commit: f5e4cc8461c408dcb679bb1f7c3bd8a586406709 drm/amdgpu: implement RAS ACA driver framework
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-052-20241214 (https://download.01.org/0day-ci/archive/20241215/202412152253.mPrDQYGU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412152253.mPrDQYGU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:219:16-26: ERROR: invalid reference to the index variable of the iterator on line 207

vim +219 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c

f5e4cc8461c408d Yang Wang 2023-11-13  199  
f5e4cc8461c408d Yang Wang 2023-11-13  200  static struct aca_bank_error *find_bank_error(struct aca_error *aerr, struct aca_bank_info *info)
f5e4cc8461c408d Yang Wang 2023-11-13  201  {
f5e4cc8461c408d Yang Wang 2023-11-13  202  	struct aca_bank_error *bank_error = NULL;
f5e4cc8461c408d Yang Wang 2023-11-13  203  	struct aca_bank_info *tmp_info;
f5e4cc8461c408d Yang Wang 2023-11-13  204  	bool found = false;
f5e4cc8461c408d Yang Wang 2023-11-13  205  
f5e4cc8461c408d Yang Wang 2023-11-13  206  	mutex_lock(&aerr->lock);
f5e4cc8461c408d Yang Wang 2023-11-13 @207  	list_for_each_entry(bank_error, &aerr->list, node) {
f5e4cc8461c408d Yang Wang 2023-11-13  208  		tmp_info = &bank_error->info;
f5e4cc8461c408d Yang Wang 2023-11-13  209  		if (tmp_info->socket_id == info->socket_id &&
f5e4cc8461c408d Yang Wang 2023-11-13  210  		    tmp_info->die_id == info->die_id) {
f5e4cc8461c408d Yang Wang 2023-11-13  211  			found = true;
f5e4cc8461c408d Yang Wang 2023-11-13  212  			goto out_unlock;
f5e4cc8461c408d Yang Wang 2023-11-13  213  		}
f5e4cc8461c408d Yang Wang 2023-11-13  214  	}
f5e4cc8461c408d Yang Wang 2023-11-13  215  
f5e4cc8461c408d Yang Wang 2023-11-13  216  out_unlock:
f5e4cc8461c408d Yang Wang 2023-11-13  217  	mutex_unlock(&aerr->lock);
f5e4cc8461c408d Yang Wang 2023-11-13  218  
f5e4cc8461c408d Yang Wang 2023-11-13 @219  	return found ? bank_error : NULL;
f5e4cc8461c408d Yang Wang 2023-11-13  220  }
f5e4cc8461c408d Yang Wang 2023-11-13  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
