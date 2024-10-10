Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AE238396
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Oct 2024 18:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583352; cv=none; b=hRH68Fhb7xqlkZqDS1ZgZlwNll/c10qnV+DH9+jq8fWERhTY7rZiNi3+xuGvhlks1wWCUew1HBWNHUZkIBNdjW2P8l41p6/rJupEQZTJyfer3xxPNDl35llnEWw4UQuPCTZfDzIWz+jHrhnXwHuVxteZlxLOU5AtLdYcD1u4/OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583352; c=relaxed/simple;
	bh=Vaod/SveOH97eBBheR/t5LcNdIGtFj0AasHHura9O88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ULf2kIJDr+UvMUSdZ3n5ibcADpq/H2FP08gnwzdRwcdMXxDS4pFgMK+6tauIY2KCbJEyaWJHkJdKmQTDP1/hgXM9aBWIk93/w3phRUmL8XPV97eCwIpgewZGR9edIqvPEkgbGDZchIuuPtngAmTUYQVZ7I7w3k2sZMg7EjeFZ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dg5Hswdv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dg5Hswdv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728583351; x=1760119351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vaod/SveOH97eBBheR/t5LcNdIGtFj0AasHHura9O88=;
  b=dg5Hswdv/5z0TWC0KWFyFsOAy2YubjivIfNG2i0jRbFP2DiHCrKDY4SH
   +pwCesK+WraaYJoQmuSK4vgUYrvX9D2PBc+TC0rQ9igOewhCl86PNzUD/
   n2WvmqFBBNcseox0TY+DcMzXQMoGoH7CiNhBGxIRT2e9jIWd0dj697KJd
   NxhPwUdWxkdLj8dREGWyM4BmY9b/6eSpOWLbBVCIu4Y2wTrXXNZAz78sm
   hFOPx2CdLdZolJjIiF2gN2NHH0soC3oltx022XpCQ9yWU0As80MLdLyvJ
   ZNW7t9/TDjQi6jxs95sSDiFFFz8k7nVXBuwKsTBUUPKuIfIWwT9GlOTyn
   w==;
X-CSE-ConnectionGUID: TP6YjebBQaOUoVU6gMXOgg==
X-CSE-MsgGUID: fk+h81B4QKex1g7NCgiJLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27775919"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="27775919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 11:02:29 -0700
X-CSE-ConnectionGUID: k1sT44LOTPi6Sopfbkvyhw==
X-CSE-MsgGUID: xnt2fIDXRkC0T2iqWfvSwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="77493532"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Oct 2024 11:02:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syxUW-000B6n-2v;
	Thu, 10 Oct 2024 18:02:24 +0000
Date: Fri, 11 Oct 2024 02:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2551/3639]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:1206 current_memory_partition_show()
 error: buffer overflow 'nps_desc' 9 <= 9
Message-ID: <202410110140.SnlKy0uW-lkp@intel.com>
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
TO: Lijo Lazar <lijo.lazar@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
commit: 012be6f22c01e25c995c30f1f178ac11820dfb65 [2551/3639] drm/amdgpu: Add sysfs interfaces for NPS mode
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20241010 (https://download.01.org/0day-ci/archive/20241011/202410110140.SnlKy0uW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410110140.SnlKy0uW-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:1206 current_memory_partition_show() error: buffer overflow 'nps_desc' 9 <= 9

vim +/nps_desc +1206 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c

012be6f22c01e2 Lijo Lazar 2024-09-19  1193  
b6f90baafe267a Lijo Lazar 2023-01-31  1194  static ssize_t current_memory_partition_show(
b6f90baafe267a Lijo Lazar 2023-01-31  1195  	struct device *dev, struct device_attribute *addr, char *buf)
b6f90baafe267a Lijo Lazar 2023-01-31  1196  {
b6f90baafe267a Lijo Lazar 2023-01-31  1197  	struct drm_device *ddev = dev_get_drvdata(dev);
b6f90baafe267a Lijo Lazar 2023-01-31  1198  	struct amdgpu_device *adev = drm_to_adev(ddev);
b6f90baafe267a Lijo Lazar 2023-01-31  1199  	enum amdgpu_memory_partition mode;
b6f90baafe267a Lijo Lazar 2023-01-31  1200  
b6f90baafe267a Lijo Lazar 2023-01-31  1201  	mode = adev->gmc.gmc_funcs->query_mem_partition_mode(adev);
012be6f22c01e2 Lijo Lazar 2024-09-19  1202  	if ((mode > ARRAY_SIZE(nps_desc)) ||
012be6f22c01e2 Lijo Lazar 2024-09-19  1203  	    (BIT(mode) & AMDGPU_ALL_NPS_MASK) != BIT(mode))
b6f90baafe267a Lijo Lazar 2023-01-31  1204  		return sysfs_emit(buf, "UNKNOWN\n");
012be6f22c01e2 Lijo Lazar 2024-09-19  1205  
012be6f22c01e2 Lijo Lazar 2024-09-19 @1206  	return sysfs_emit(buf, "%s\n", nps_desc[mode]);
b6f90baafe267a Lijo Lazar 2023-01-31  1207  }
b6f90baafe267a Lijo Lazar 2023-01-31  1208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
