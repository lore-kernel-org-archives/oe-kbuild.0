Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14E28C843
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758724; cv=none; b=Cf2u0nzeOBcw0kA5J7bKuuofGsXuGSond+L2FUoUFdI9TTm8lede6ojPdqFwTm+6iGbqOeZFtuK3WSEm5/+TcqUoB2JkBcANKNLwAEZlh6e2XzUxkXIpAWVYPam+m7J5bDKesP+ZYTdXOQ5HuJXN42qw9d/BOrV8p4LswTSyI7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758724; c=relaxed/simple;
	bh=4Ewc2cesy8QkLFC++yzI+q0y6PzKefLVj106+4X/jog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hJ0/gncqKguWd6XToueF5aPleNKcqeAgfikoCCs6BGYz2Yngq4bNnEiy6A5EeG6V1LuqX0WEkjlq4hm1ymwuuaKNRIGLhAQFc1nsiWbzAZdNYJ4t8TO+KmrOkJ0/+9GrSjhMUvh9Qr/YLxtM4s4wepuiBJ6WkyAcyl1KSE3Q4J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Una+ZtaW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Una+ZtaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750758722; x=1782294722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Ewc2cesy8QkLFC++yzI+q0y6PzKefLVj106+4X/jog=;
  b=Una+ZtaWRMcofykE3hoiHeDg3OXNECaO2wRwoXqo0Lz3zZGpWSsePAwP
   KoB6PGqh8GP4xQdwPGKCe5bm3CIZyzAGCIeYmhaTRUWOxgYXsshIPwlEU
   XfBWe5gbh6Pe8SNxm9KCOpuHwrHzMzz4ipLiNFZc4s4/1ATcSY5abbcW7
   GXNcHFklxivdwleSsHL0eL67lxokM7kp8KZJCPNv9jZ/QOgewe20ac2qo
   J8V3k5FOASWOp2LZLaoHikpHPFx7Wiw8E3jUCg0Ns+ZbdT7wi6tgyJJDh
   IQ0WD9Xo0xDCAmzzZzhJDVFuTicdEvUtmhvyRN4wCe1hpOYiIKRf8rE0c
   Q==;
X-CSE-ConnectionGUID: 5myzd6xUQ1G0gjEcJbRVLA==
X-CSE-MsgGUID: VJ2IBQAxQhCPFSQPt2l3Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64051613"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="64051613"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:52:02 -0700
X-CSE-ConnectionGUID: VUSsrWfhSg+7Zp/9waUnyg==
X-CSE-MsgGUID: aZESWp6VSk2ywND5NPj5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152397303"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jun 2025 02:52:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU0Jq-000Rze-2I;
	Tue, 24 Jun 2025 09:51:58 +0000
Date: Tue, 24 Jun 2025 17:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3084/4398]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:1402 amdgpu_is_kicker_fw() warn:
 if statement not indented
Message-ID: <202506241714.zT0xpTkB-lkp@intel.com>
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
TO: Frank Min <Frank.Min@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
commit: 09aa2b408f4ab689c3541d22b0968de0392ee406 [3084/4398] drm/amdgpu: Add kicker device detection
:::::: branch date: 27 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250619 (https://download.01.org/0day-ci/archive/20250624/202506241714.zT0xpTkB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506241714.zT0xpTkB-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:1402 amdgpu_is_kicker_fw() warn: if statement not indented

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:1503 amdgpu_ucode_request() warn: '*fw' from request_firmware() not released on lines: 1503.

vim +1402 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c

54a3e032340ef9 Mario Limonciello 2022-12-28  1396  
09aa2b408f4ab6 Frank Min         2025-06-04  1397  bool amdgpu_is_kicker_fw(struct amdgpu_device *adev)
09aa2b408f4ab6 Frank Min         2025-06-04  1398  {
09aa2b408f4ab6 Frank Min         2025-06-04  1399  	int i;
09aa2b408f4ab6 Frank Min         2025-06-04  1400  
09aa2b408f4ab6 Frank Min         2025-06-04  1401  	for (i = 0; i < ARRAY_SIZE(kicker_device_list); i++) {
09aa2b408f4ab6 Frank Min         2025-06-04 @1402  		if (adev->pdev->device == kicker_device_list[i].device &&
09aa2b408f4ab6 Frank Min         2025-06-04  1403  			adev->pdev->revision == kicker_device_list[i].revision)
09aa2b408f4ab6 Frank Min         2025-06-04  1404  		return true;
09aa2b408f4ab6 Frank Min         2025-06-04  1405  	}
09aa2b408f4ab6 Frank Min         2025-06-04  1406  
09aa2b408f4ab6 Frank Min         2025-06-04  1407  	return false;
09aa2b408f4ab6 Frank Min         2025-06-04  1408  }
09aa2b408f4ab6 Frank Min         2025-06-04  1409  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
