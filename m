Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EB5C13C
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463523; cv=none; b=skAJgJbVchWkysXb/ZCXpFUGmJR3dsKIU/tctnZZNgyzD8IWvtwJg1b8OUMifRliKsgCFhC8EEvk+t5cHQBBKMTicJCuXQa3u3yBko3xr91AZGCQGqjWRfe4KzlY3AzFpO2HmEUkav98GKgEIstI9H00mgN+7DcN+QiCBhadJ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463523; c=relaxed/simple;
	bh=Cuntx4xTP3nxfJIRN7mx0k/kgc40hH4nSW2awbtKlSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kV9/HplQh1VwqKZ5iDD1kPKnqqA55Fgeo4suM5kRIIUWK4bmtz73T6vAJ9tCMuewCZTO0NxFl8/gUCgt7e035hAXAz79f/8NnOPMqMttRC4jiiB3yHi6D9iR7j3XWuXw2xz+jDyj/5kBWEVx+natQWGYigt73Ueg+zbQ+tKbI2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXq8ivuh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXq8ivuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730463521; x=1761999521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cuntx4xTP3nxfJIRN7mx0k/kgc40hH4nSW2awbtKlSM=;
  b=LXq8ivuhkJHsIXy+xVLbQtamqqbpUQH8PqRXLqCWRh4U5q6wrR10VjEA
   l7YCYjaakTIcbB0Dgi53WQUXo25v1SUAP72rSw8LJeMHFMMNfdH1eM30i
   AKOSGxpJi99RwjiWQfC0PVzfP9z8IGXkdvkBWmSWZxdafFl4eodD49NQI
   2NdCrZL/Epz+cCWUgTTmtuL+HZ8rhTAHCzqMRe1M6R3sEb3F1rvU79IIS
   kaL+yncflyF0C+qYChsIRc+VXzUzVzSqXz20qkbcqU611YQW4wcbbhc1O
   WCq4KTuCtV4ILW+4QCYfnsnP8E7N4UZZPcsrWHnSoKBGRQwDSfUp/kdjn
   w==;
X-CSE-ConnectionGUID: LjTIVxFATNiKTYDby2hOuQ==
X-CSE-MsgGUID: Pi/8NnPYQR+gXya6k6TK6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="55627236"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="55627236"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:18:39 -0700
X-CSE-ConnectionGUID: JxbvEGEjRaCLSKqgyu8ajQ==
X-CSE-MsgGUID: ku+i+4B4S7OrLfeh0M95sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83091411"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2024 05:18:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6qbr-000hWz-0L;
	Fri, 01 Nov 2024 12:18:35 +0000
Date: Fri, 1 Nov 2024 20:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c:225:67-70: opportunity for
 str_on_off(val)
Message-ID: <202411012052.w6SjsURO-lkp@intel.com>
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
head:   6c52d4da1c742cd01a797a4d0a2d3c5a60dc9bfe
commit: 4051844c6616c0bf33dd16342967ea5b931746ae drm/amdgpu: add amdgpu mca debug sysfs support
date:   1 year, 1 month ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-052-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012052.w6SjsURO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411012052.w6SjsURO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c:225:67-70: opportunity for str_on_off(val)

vim +225 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c

7ff607e2723386 Yang Wang 2023-09-05  214  
4051844c6616c0 Yang Wang 2023-09-06  215  #if defined(CONFIG_DEBUG_FS)
4051844c6616c0 Yang Wang 2023-09-06  216  static int amdgpu_mca_smu_debug_mode_set(void *data, u64 val)
4051844c6616c0 Yang Wang 2023-09-06  217  {
4051844c6616c0 Yang Wang 2023-09-06  218  	struct amdgpu_device *adev = (struct amdgpu_device *)data;
4051844c6616c0 Yang Wang 2023-09-06  219  	int ret;
4051844c6616c0 Yang Wang 2023-09-06  220  
4051844c6616c0 Yang Wang 2023-09-06  221  	ret = amdgpu_mca_smu_set_debug_mode(adev, val ? true : false);
4051844c6616c0 Yang Wang 2023-09-06  222  	if (ret)
4051844c6616c0 Yang Wang 2023-09-06  223  		return ret;
4051844c6616c0 Yang Wang 2023-09-06  224  
4051844c6616c0 Yang Wang 2023-09-06 @225  	dev_info(adev->dev, "amdgpu set smu mca debug mode %s success\n", val ? "on" : "off");
4051844c6616c0 Yang Wang 2023-09-06  226  
4051844c6616c0 Yang Wang 2023-09-06  227  	return 0;
4051844c6616c0 Yang Wang 2023-09-06  228  }
4051844c6616c0 Yang Wang 2023-09-06  229  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
