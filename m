Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FB650250
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Feb 2024 22:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707432371; cv=none; b=EsZns6xf2OQ7/8wO0VBMbcV0dhHa4c8ZRv1RdpG9L4/iDh/UYi0o+7N25+M64yBeSnFvu105Z01aFPKxqDPFeNgYdO7NkvJ8ffFSjmTBwPjrrpIpiUnl1VeWFno3sfVgZGLetSmI8AON3GYOv10n2o6rZEaH6mKurnH17Y6Y5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707432371; c=relaxed/simple;
	bh=Lrq/mi4B8BBoELnWUMlBhp6CFg1UvTwjrktdUbzn7do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/taCToPgCkTx3U/VQDwqfJa8oXJhwHficiELcKFnfVmqYvM9ta1NWqlpa/rxG5LhCt39ocuzU6nAyhDs3TSe+7mOgvm5nhLAoLeqDNCtYdvD0avnhgU8IPYQtq3h2h++uocevaymd5sj3l/d3VkKH112MHGZIJvHaP/+eac57I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyjdwMT5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyjdwMT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707432368; x=1738968368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lrq/mi4B8BBoELnWUMlBhp6CFg1UvTwjrktdUbzn7do=;
  b=CyjdwMT5KPDU71uFYFoCunhUqIWQLG38M6U8KEPxiHGj3sd98WezQPyo
   nHeM56WgYVRJHc8GY2Yk5bunMGNmwFBuaKCnXIcscbz8/l4JvUBUbq3Kg
   yVDQRM9NlDEcTvDXJCFpcvVqNE7kqmgGV8Tck95GfwAPaXiY0hIvQr5fn
   D4T7qXUE2VJKAwS/C22PpSPi4gUwIyLC0LLRXMYqyBK+QpLWkUZCeOmTj
   C64bk4cF4xGUPkOWSfsDCpBjzPx/9RsaBufvNFngxPaIY1ZZUHYDFgeYn
   aBC0oxZ6o3FmLtKqTcOIXWVMKLIdeLjNa8t2XzvgJWYyEV64eDwgC1OJi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1215414"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1215414"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 14:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="6553953"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2024 14:46:03 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYD9c-0004Au-1V;
	Thu, 08 Feb 2024 22:46:00 +0000
Date: Fri, 9 Feb 2024 06:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:59
 kfd_dbg_trap_enable() warn: fd re-used after fget(): 'fd'
Message-ID: <202402090633.JBKyd2Af-lkp@intel.com>
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
TO: Jonathan Kim <jonathan.kim@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   047371968ffc470769f541d6933e262dc7085456
commit: 0ab2d7532b05a3e7c06fd3b0c8bd6b46c1dfb508 drm/amdkfd: prepare per-process debug enable and disable
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r071-20240207 (https://download.01.org/0day-ci/archive/20240209/202402090633.JBKyd2Af-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402090633.JBKyd2Af-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:59 kfd_dbg_trap_enable() warn: fd re-used after fget(): 'fd'

vim +/fd +59 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c

0ab2d7532b05a3 Jonathan Kim 2022-03-25  44  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  45  int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
0ab2d7532b05a3 Jonathan Kim 2022-03-25  46  			void __user *runtime_info, uint32_t *runtime_size)
0ab2d7532b05a3 Jonathan Kim 2022-03-25  47  {
0ab2d7532b05a3 Jonathan Kim 2022-03-25  48  	struct file *f;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  49  	uint32_t copy_size;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  50  	int r = 0;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  51  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  52  	if (target->debug_trap_enabled)
0ab2d7532b05a3 Jonathan Kim 2022-03-25  53  		return -EALREADY;
0ab2d7532b05a3 Jonathan Kim 2022-03-25  54  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  55  	copy_size = min((size_t)(*runtime_size), sizeof(target->runtime_info));
0ab2d7532b05a3 Jonathan Kim 2022-03-25  56  
0ab2d7532b05a3 Jonathan Kim 2022-03-25  57  	f = fget(fd);
0ab2d7532b05a3 Jonathan Kim 2022-03-25  58  	if (!f) {
0ab2d7532b05a3 Jonathan Kim 2022-03-25 @59  		pr_err("Failed to get file for (%i)\n", fd);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
