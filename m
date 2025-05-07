Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5840521146C
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607138; cv=none; b=LVW66XWnjUnR6rY/NcsaoDDDU9d0hfYjrW3aQ8kqfUZoiGazNn0TrEFX2uWl2UeJCVeaThs0mEvHiSNiRKhId4iajGVNMpHXkYYixug9+n4tLe7ihygzMIqLtc9BIo2X4c2gMJ6FodLWyUhYswAMcY8wUD6C9JUx52hR48L29jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607138; c=relaxed/simple;
	bh=oRwcLwD+kuyPiWR31OOviNbyjZTKXnF8U1p3uh4VkTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HBagNa5QkUg0cS2ehOjfXgj0NJe9IHuBSmK2QwuO5CelsX3B5dd0spVqm2oFeiVVZ3niAi9SDZzhsLt+PjoXSvqx/p8MHrwISUjieoU0OgqGRj85nW8fCKs4tA5CSagk5HXcdkVVdAS4HvZ/ZqhTtTt486m3uFx5If1inHTyXwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2PyTk/+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2PyTk/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746607137; x=1778143137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oRwcLwD+kuyPiWR31OOviNbyjZTKXnF8U1p3uh4VkTs=;
  b=R2PyTk/+BuTrgjIJuySeRVO8BtL5AcvrlByPckS8LXF2WbO8cagdYEKF
   Zt9aNEVImhhiXvsjWGxgBx5Lfv8oYiwm9LiWUOHxtpGydASOIHBXlqcxV
   wunk+HNMJVhIf7V43LSIG0GQrQdgiFWyuwIAvVqkHbpbWZndFZnc1wEVb
   /HCkJfuQsnxgkXavfjjUVggoJUrh38kZepgdZbq36WWLUx6LkUx1nol5H
   Jy33xEpguEm3VulsyafxdPT/a+srBhQOBclyauCs/iF/BnJO3SAQ/PCT/
   nMOcGSswgdhpgcKWbkpowwtPvE/4em/40gWbMn8eoXGg2/ncgpnl+e/Zw
   A==;
X-CSE-ConnectionGUID: 9ESQrM+STNSjEe+LPAhwSA==
X-CSE-MsgGUID: s6BJxp98QhWFaMvH91hDRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48195734"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48195734"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:38:55 -0700
X-CSE-ConnectionGUID: CUn9d4AaQtK4mDlNEwr5Kg==
X-CSE-MsgGUID: 7Ge6y5MAQ8qz10UcqekBWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136410614"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 01:38:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCaIl-0007QP-14;
	Wed, 07 May 2025 08:38:51 +0000
Date: Wed, 7 May 2025 16:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1785/8679]
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:6992 gfx_v11_ip_dump() warn: if
 statement not indented
Message-ID: <202505071619.7sHTLpNg-lkp@intel.com>
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
TO: Alex Deucher <alexander.deucher@amd.com>
CC: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: Sunil Khatri <sunil.khatri@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: eb15a5d1aef59d1ec3aafe9d9f13953deb9977b6 [1785/8679] drm/amdgpu/gfx11: dump full CP packet header FIFOs
:::::: branch date: 23 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20250410 (https://download.01.org/0day-ci/archive/20250507/202505071619.7sHTLpNg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505071619.7sHTLpNg-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:6992 gfx_v11_ip_dump() warn: if statement not indented

vim +6992 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c

015a04a59e3f9f Sunil Khatri 2024-05-15  6964  
fa73462dc04826 Sunil Khatri 2024-09-24  6965  static void gfx_v11_ip_dump(struct amdgpu_ip_block *ip_block)
b5812822d9c982 Sunil Khatri 2024-05-15  6966  {
fa73462dc04826 Sunil Khatri 2024-09-24  6967  	struct amdgpu_device *adev = ip_block->adev;
368c33ac8ab984 Sunil Khatri 2024-05-22  6968  	uint32_t i, j, k, reg, index = 0;
b5812822d9c982 Sunil Khatri 2024-05-15  6969  	uint32_t reg_count = ARRAY_SIZE(gc_reg_list_11_0);
b5812822d9c982 Sunil Khatri 2024-05-15  6970  
b5812822d9c982 Sunil Khatri 2024-05-15  6971  	if (!adev->gfx.ip_dump_core)
b5812822d9c982 Sunil Khatri 2024-05-15  6972  		return;
b5812822d9c982 Sunil Khatri 2024-05-15  6973  
b5812822d9c982 Sunil Khatri 2024-05-15  6974  	amdgpu_gfx_off_ctrl(adev, false);
b5812822d9c982 Sunil Khatri 2024-05-15  6975  	for (i = 0; i < reg_count; i++)
b5812822d9c982 Sunil Khatri 2024-05-15  6976  		adev->gfx.ip_dump_core[i] = RREG32(SOC15_REG_ENTRY_OFFSET(gc_reg_list_11_0[i]));
b5812822d9c982 Sunil Khatri 2024-05-15  6977  	amdgpu_gfx_off_ctrl(adev, true);
368c33ac8ab984 Sunil Khatri 2024-05-22  6978  
368c33ac8ab984 Sunil Khatri 2024-05-22  6979  	/* dump compute queue registers for all instances */
33837d62a4cb5e Sunil Khatri 2024-05-31  6980  	if (!adev->gfx.ip_dump_compute_queues)
368c33ac8ab984 Sunil Khatri 2024-05-22  6981  		return;
368c33ac8ab984 Sunil Khatri 2024-05-22  6982  
368c33ac8ab984 Sunil Khatri 2024-05-22  6983  	reg_count = ARRAY_SIZE(gc_cp_reg_list_11);
368c33ac8ab984 Sunil Khatri 2024-05-22  6984  	amdgpu_gfx_off_ctrl(adev, false);
368c33ac8ab984 Sunil Khatri 2024-05-22  6985  	mutex_lock(&adev->srbm_mutex);
368c33ac8ab984 Sunil Khatri 2024-05-22  6986  	for (i = 0; i < adev->gfx.mec.num_mec; i++) {
368c33ac8ab984 Sunil Khatri 2024-05-22  6987  		for (j = 0; j < adev->gfx.mec.num_pipe_per_mec; j++) {
368c33ac8ab984 Sunil Khatri 2024-05-22  6988  			for (k = 0; k < adev->gfx.mec.num_queue_per_pipe; k++) {
368c33ac8ab984 Sunil Khatri 2024-05-22  6989  				/* ME0 is for GFX so start from 1 for CP */
a85cc86cce4183 Sunil Khatri 2024-07-09  6990  				soc21_grbm_select(adev, adev->gfx.me.num_me + i, j, k, 0);
368c33ac8ab984 Sunil Khatri 2024-05-22  6991  				for (reg = 0; reg < reg_count; reg++) {
eb15a5d1aef59d Alex Deucher 2025-03-20 @6992  					if (i && gc_cp_reg_list_11[reg].reg_offset == regCP_MEC_ME1_HEADER_DUMP)
eb15a5d1aef59d Alex Deucher 2025-03-20  6993  					adev->gfx.ip_dump_compute_queues[index + reg] =
eb15a5d1aef59d Alex Deucher 2025-03-20  6994  						RREG32(SOC15_REG_OFFSET(GC, 0, regCP_MEC_ME2_HEADER_DUMP));
eb15a5d1aef59d Alex Deucher 2025-03-20  6995  					else
33837d62a4cb5e Sunil Khatri 2024-05-31  6996  						adev->gfx.ip_dump_compute_queues[index + reg] =
368c33ac8ab984 Sunil Khatri 2024-05-22  6997  							RREG32(SOC15_REG_ENTRY_OFFSET(
368c33ac8ab984 Sunil Khatri 2024-05-22  6998  								       gc_cp_reg_list_11[reg]));
368c33ac8ab984 Sunil Khatri 2024-05-22  6999  				}
368c33ac8ab984 Sunil Khatri 2024-05-22  7000  				index += reg_count;
368c33ac8ab984 Sunil Khatri 2024-05-22  7001  			}
368c33ac8ab984 Sunil Khatri 2024-05-22  7002  		}
368c33ac8ab984 Sunil Khatri 2024-05-22  7003  	}
368c33ac8ab984 Sunil Khatri 2024-05-22  7004  	soc21_grbm_select(adev, 0, 0, 0, 0);
368c33ac8ab984 Sunil Khatri 2024-05-22  7005  	mutex_unlock(&adev->srbm_mutex);
368c33ac8ab984 Sunil Khatri 2024-05-22  7006  	amdgpu_gfx_off_ctrl(adev, true);
498906d3761070 Sunil Khatri 2024-05-22  7007  
498906d3761070 Sunil Khatri 2024-05-22  7008  	/* dump gfx queue registers for all instances */
498906d3761070 Sunil Khatri 2024-05-22  7009  	if (!adev->gfx.ip_dump_gfx_queues)
498906d3761070 Sunil Khatri 2024-05-22  7010  		return;
498906d3761070 Sunil Khatri 2024-05-22  7011  
ea67deb03cc0b3 Sunil Khatri 2024-07-02  7012  	index = 0;
498906d3761070 Sunil Khatri 2024-05-22  7013  	reg_count = ARRAY_SIZE(gc_gfx_queue_reg_list_11);
498906d3761070 Sunil Khatri 2024-05-22  7014  	amdgpu_gfx_off_ctrl(adev, false);
498906d3761070 Sunil Khatri 2024-05-22  7015  	mutex_lock(&adev->srbm_mutex);
498906d3761070 Sunil Khatri 2024-05-22  7016  	for (i = 0; i < adev->gfx.me.num_me; i++) {
498906d3761070 Sunil Khatri 2024-05-22  7017  		for (j = 0; j < adev->gfx.me.num_pipe_per_me; j++) {
498906d3761070 Sunil Khatri 2024-05-22  7018  			for (k = 0; k < adev->gfx.me.num_queue_per_pipe; k++) {
498906d3761070 Sunil Khatri 2024-05-22  7019  				soc21_grbm_select(adev, i, j, k, 0);
498906d3761070 Sunil Khatri 2024-05-22  7020  
498906d3761070 Sunil Khatri 2024-05-22  7021  				for (reg = 0; reg < reg_count; reg++) {
498906d3761070 Sunil Khatri 2024-05-22  7022  					adev->gfx.ip_dump_gfx_queues[index + reg] =
498906d3761070 Sunil Khatri 2024-05-22  7023  						RREG32(SOC15_REG_ENTRY_OFFSET(
498906d3761070 Sunil Khatri 2024-05-22  7024  							gc_gfx_queue_reg_list_11[reg]));
498906d3761070 Sunil Khatri 2024-05-22  7025  				}
498906d3761070 Sunil Khatri 2024-05-22  7026  				index += reg_count;
498906d3761070 Sunil Khatri 2024-05-22  7027  			}
498906d3761070 Sunil Khatri 2024-05-22  7028  		}
498906d3761070 Sunil Khatri 2024-05-22  7029  	}
498906d3761070 Sunil Khatri 2024-05-22  7030  	soc21_grbm_select(adev, 0, 0, 0, 0);
498906d3761070 Sunil Khatri 2024-05-22  7031  	mutex_unlock(&adev->srbm_mutex);
498906d3761070 Sunil Khatri 2024-05-22  7032  	amdgpu_gfx_off_ctrl(adev, true);
b5812822d9c982 Sunil Khatri 2024-05-15  7033  }
b5812822d9c982 Sunil Khatri 2024-05-15  7034  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
