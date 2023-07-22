Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B34927F3B
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Jul 2023 03:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689994986; x=1721530986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c642FE/EFMGip4JTWLMZQkpf6SV6oHh6JOFQpm1Py24=;
  b=m0CTfYacpqdOsQPAcj7N485JoXE4sDf8ZE83NyxWTx6hmlLUSuoZul4g
   mZxxUygGqS2lSHekLpiR+cOzqixmmExpjB+uIJp+OeEnJM9t9b46w1lXq
   6855q+KajF2PvbdwDo6rXDjxsSsrkDHFnnZr+GpLbGhpv+MKE1c0gPztZ
   v/kq7wKEx4kBDYEBPr4hkFrT2DQFP0ZkUzUl6jyZ5oLczRU1VEHlsi4Vn
   vbkJEsb8d7BRHe5ZD5IHt5lIQxlRow/SSVGd498kyV9BHatqnewm9p9AS
   sblsMJCfpkuHiHn29G7C3BJVGtoqbQ/l1X+7l030OZLp1CO6HDAh0sHsr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="364618172"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="364618172"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 20:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="725084039"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="725084039"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Jul 2023 20:03:03 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN2sw-0007uL-1k;
	Sat, 22 Jul 2023 03:02:27 +0000
Date: Sat, 22 Jul 2023 11:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:461
 amdgpu_debugfs_gprwave_read() warn: ignoring unreachable code.
Message-ID: <202307221022.RffFHqdu-lkp@intel.com>
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
TO: Tom St Denis <tom.stdenis@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d192f5382581d972c4ae1b4d72e0b59b34cadeb9
commit: 553f973a0d7bbe95ea5da46979d926a9c0ada109 drm/amd/amdgpu: Update debugfs for XCC support (v3)
date:   6 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-m031-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221022.RffFHqdu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221022.RffFHqdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307221022.RffFHqdu-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:461 amdgpu_debugfs_gprwave_read() warn: ignoring unreachable code.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:498 amdgpu_debugfs_gprwave_ioctl() warn: inconsistent returns '&rd->lock'.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:543 amdgpu_debugfs_regs_pcie_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:656 amdgpu_debugfs_regs_didt_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:769 amdgpu_debugfs_regs_smc_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:925 amdgpu_debugfs_gca_config_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1003 amdgpu_debugfs_sensor_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1089 amdgpu_debugfs_wave_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1182 amdgpu_debugfs_gpr_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1237 amdgpu_debugfs_gfxoff_residency_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1336 amdgpu_debugfs_gfxoff_count_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1431 amdgpu_debugfs_gfxoff_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1472 amdgpu_debugfs_gfxoff_status_read() warn: ignoring unreachable code.

vim +461 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c

553f973a0d7bbe Tom St Denis 2022-10-11  395  
553f973a0d7bbe Tom St Denis 2022-10-11  396  static ssize_t amdgpu_debugfs_gprwave_read(struct file *f, char __user *buf, size_t size, loff_t *pos)
553f973a0d7bbe Tom St Denis 2022-10-11  397  {
553f973a0d7bbe Tom St Denis 2022-10-11  398  	struct amdgpu_debugfs_gprwave_data *rd = f->private_data;
553f973a0d7bbe Tom St Denis 2022-10-11  399  	struct amdgpu_device *adev = rd->adev;
553f973a0d7bbe Tom St Denis 2022-10-11  400  	ssize_t result = 0;
553f973a0d7bbe Tom St Denis 2022-10-11  401  	int r;
553f973a0d7bbe Tom St Denis 2022-10-11  402  	uint32_t *data, x;
553f973a0d7bbe Tom St Denis 2022-10-11  403  
553f973a0d7bbe Tom St Denis 2022-10-11  404  	if (size & 0x3 || *pos & 0x3)
553f973a0d7bbe Tom St Denis 2022-10-11  405  		return -EINVAL;
553f973a0d7bbe Tom St Denis 2022-10-11  406  
553f973a0d7bbe Tom St Denis 2022-10-11  407  	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
553f973a0d7bbe Tom St Denis 2022-10-11  408  	if (r < 0) {
553f973a0d7bbe Tom St Denis 2022-10-11  409  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
553f973a0d7bbe Tom St Denis 2022-10-11  410  		return r;
553f973a0d7bbe Tom St Denis 2022-10-11  411  	}
553f973a0d7bbe Tom St Denis 2022-10-11  412  
553f973a0d7bbe Tom St Denis 2022-10-11  413  	r = amdgpu_virt_enable_access_debugfs(adev);
553f973a0d7bbe Tom St Denis 2022-10-11  414  	if (r < 0) {
553f973a0d7bbe Tom St Denis 2022-10-11  415  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
553f973a0d7bbe Tom St Denis 2022-10-11  416  		return r;
553f973a0d7bbe Tom St Denis 2022-10-11  417  	}
553f973a0d7bbe Tom St Denis 2022-10-11  418  
553f973a0d7bbe Tom St Denis 2022-10-11  419  	data = kcalloc(1024, sizeof(*data), GFP_KERNEL);
553f973a0d7bbe Tom St Denis 2022-10-11  420  	if (!data) {
553f973a0d7bbe Tom St Denis 2022-10-11  421  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
553f973a0d7bbe Tom St Denis 2022-10-11  422  		amdgpu_virt_disable_access_debugfs(adev);
553f973a0d7bbe Tom St Denis 2022-10-11  423  		return -ENOMEM;
553f973a0d7bbe Tom St Denis 2022-10-11  424  	}
553f973a0d7bbe Tom St Denis 2022-10-11  425  
553f973a0d7bbe Tom St Denis 2022-10-11  426  	/* switch to the specific se/sh/cu */
553f973a0d7bbe Tom St Denis 2022-10-11  427  	mutex_lock(&adev->grbm_idx_mutex);
553f973a0d7bbe Tom St Denis 2022-10-11  428  	amdgpu_gfx_select_se_sh(adev, rd->id.se, rd->id.sh, rd->id.cu, rd->id.xcc_id);
553f973a0d7bbe Tom St Denis 2022-10-11  429  
553f973a0d7bbe Tom St Denis 2022-10-11  430  	if (!rd->id.gpr_or_wave) {
553f973a0d7bbe Tom St Denis 2022-10-11  431  		x = 0;
553f973a0d7bbe Tom St Denis 2022-10-11  432  		if (adev->gfx.funcs->read_wave_data)
553f973a0d7bbe Tom St Denis 2022-10-11  433  			adev->gfx.funcs->read_wave_data(adev, rd->id.xcc_id, rd->id.simd, rd->id.wave, data, &x);
553f973a0d7bbe Tom St Denis 2022-10-11  434  	} else {
553f973a0d7bbe Tom St Denis 2022-10-11  435  		x = size >> 2;
553f973a0d7bbe Tom St Denis 2022-10-11  436  		if (rd->id.gpr.vpgr_or_sgpr) {
553f973a0d7bbe Tom St Denis 2022-10-11  437  			if (adev->gfx.funcs->read_wave_vgprs)
553f973a0d7bbe Tom St Denis 2022-10-11  438  				adev->gfx.funcs->read_wave_vgprs(adev, rd->id.xcc_id, rd->id.simd, rd->id.wave, rd->id.gpr.thread, *pos, size>>2, data);
553f973a0d7bbe Tom St Denis 2022-10-11  439  		} else {
553f973a0d7bbe Tom St Denis 2022-10-11  440  			if (adev->gfx.funcs->read_wave_sgprs)
553f973a0d7bbe Tom St Denis 2022-10-11  441  				adev->gfx.funcs->read_wave_sgprs(adev, rd->id.xcc_id, rd->id.simd, rd->id.wave, *pos, size>>2, data);
553f973a0d7bbe Tom St Denis 2022-10-11  442  		}
553f973a0d7bbe Tom St Denis 2022-10-11  443  	}
553f973a0d7bbe Tom St Denis 2022-10-11  444  
553f973a0d7bbe Tom St Denis 2022-10-11  445  	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, rd->id.xcc_id);
553f973a0d7bbe Tom St Denis 2022-10-11  446  	mutex_unlock(&adev->grbm_idx_mutex);
553f973a0d7bbe Tom St Denis 2022-10-11  447  
553f973a0d7bbe Tom St Denis 2022-10-11  448  	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
553f973a0d7bbe Tom St Denis 2022-10-11  449  	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
553f973a0d7bbe Tom St Denis 2022-10-11  450  
553f973a0d7bbe Tom St Denis 2022-10-11  451  	if (!x) {
553f973a0d7bbe Tom St Denis 2022-10-11  452  		result = -EINVAL;
553f973a0d7bbe Tom St Denis 2022-10-11  453  		goto done;
553f973a0d7bbe Tom St Denis 2022-10-11  454  	}
553f973a0d7bbe Tom St Denis 2022-10-11  455  
553f973a0d7bbe Tom St Denis 2022-10-11  456  	while (size && (*pos < x * 4)) {
553f973a0d7bbe Tom St Denis 2022-10-11  457  		uint32_t value;
553f973a0d7bbe Tom St Denis 2022-10-11  458  
553f973a0d7bbe Tom St Denis 2022-10-11  459  		value = data[*pos >> 2];
553f973a0d7bbe Tom St Denis 2022-10-11  460  		r = put_user(value, (uint32_t *)buf);
553f973a0d7bbe Tom St Denis 2022-10-11 @461  		if (r) {
553f973a0d7bbe Tom St Denis 2022-10-11  462  			result = r;
553f973a0d7bbe Tom St Denis 2022-10-11  463  			goto done;
553f973a0d7bbe Tom St Denis 2022-10-11  464  		}
553f973a0d7bbe Tom St Denis 2022-10-11  465  
553f973a0d7bbe Tom St Denis 2022-10-11  466  		result += 4;
553f973a0d7bbe Tom St Denis 2022-10-11  467  		buf += 4;
553f973a0d7bbe Tom St Denis 2022-10-11  468  		*pos += 4;
553f973a0d7bbe Tom St Denis 2022-10-11  469  		size -= 4;
553f973a0d7bbe Tom St Denis 2022-10-11  470  	}
553f973a0d7bbe Tom St Denis 2022-10-11  471  
553f973a0d7bbe Tom St Denis 2022-10-11  472  done:
553f973a0d7bbe Tom St Denis 2022-10-11  473  	amdgpu_virt_disable_access_debugfs(adev);
553f973a0d7bbe Tom St Denis 2022-10-11  474  	kfree(data);
553f973a0d7bbe Tom St Denis 2022-10-11  475  	return result;
553f973a0d7bbe Tom St Denis 2022-10-11  476  }
553f973a0d7bbe Tom St Denis 2022-10-11  477  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
