Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE52B1FA3
	for <oe-kbuild@lists.linux.dev>; Tue, 23 May 2023 02:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684809419; x=1716345419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWD4hBZBdnP9eW/DJOXZGhkzPqqQacchf2U1P+wv7ek=;
  b=Th2I+JuYs/rjEIHEeuN+cVGRwGOLx9/eZ6iCYkFdT4WsA6A7ruErQySj
   3Zcu+2nD1+NSwPGTSnJZU85hTux1Uzxt9GfI85MaN6XS7my+9tcwi0n+d
   AQZ6pO2P0k4qpw65KOlMviNb3Jq+NdESOyavrUDmHK/AisEJN9FQQwjTF
   u3vgMBVb2TYi04A/HsAoZFasn7RzvL8SuB2CEGh/QMHcwBB6JiSjf9W+n
   hst2BD6UzxZRBpjWFKQqPcR0VT2TWeE6xDtwxyCPQF1E8TsOAcWBk2OjP
   0Kb9DE4WgFdwOAtEgwzRbLUq06ky85LA91Vk+eLPYJJXMa5LYs6KyCNq/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="418812721"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="418812721"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 19:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="768791309"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="768791309"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 May 2023 19:36:39 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1Ht9-000DS7-0T;
	Tue, 23 May 2023 02:36:39 +0000
Date: Tue, 23 May 2023 10:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:drm-next 365/659]
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:461
 amdgpu_debugfs_gprwave_read() warn: ignoring unreachable code.
Message-ID: <202305231007.OF3LwE81-lkp@intel.com>
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
TO: Tom St Denis <tom.stdenis@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   1a998fe528707c9a69fff9da6cd877f3f5c7eb0a
commit: 164fb294093338157cb20fdbe226a07fc3d8af0d [365/659] drm/amd/amdgpu: Update debugfs for XCC support (v3)
:::::: branch date: 6 hours ago
:::::: commit date: 5 days ago
config: s390-randconfig-m031-20230522 (https://download.01.org/0day-ci/archive/20230523/202305231007.OF3LwE81-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305231007.OF3LwE81-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:461 amdgpu_debugfs_gprwave_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:498 amdgpu_debugfs_gprwave_ioctl() warn: inconsistent returns '&rd->lock'.

Old smatch warnings:
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

164fb294093338 Tom St Denis 2022-10-11  395  
164fb294093338 Tom St Denis 2022-10-11  396  static ssize_t amdgpu_debugfs_gprwave_read(struct file *f, char __user *buf, size_t size, loff_t *pos)
164fb294093338 Tom St Denis 2022-10-11  397  {
164fb294093338 Tom St Denis 2022-10-11  398  	struct amdgpu_debugfs_gprwave_data *rd = f->private_data;
164fb294093338 Tom St Denis 2022-10-11  399  	struct amdgpu_device *adev = rd->adev;
164fb294093338 Tom St Denis 2022-10-11  400  	ssize_t result = 0;
164fb294093338 Tom St Denis 2022-10-11  401  	int r;
164fb294093338 Tom St Denis 2022-10-11  402  	uint32_t *data, x;
164fb294093338 Tom St Denis 2022-10-11  403  
164fb294093338 Tom St Denis 2022-10-11  404  	if (size & 0x3 || *pos & 0x3)
164fb294093338 Tom St Denis 2022-10-11  405  		return -EINVAL;
164fb294093338 Tom St Denis 2022-10-11  406  
164fb294093338 Tom St Denis 2022-10-11  407  	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
164fb294093338 Tom St Denis 2022-10-11  408  	if (r < 0) {
164fb294093338 Tom St Denis 2022-10-11  409  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
164fb294093338 Tom St Denis 2022-10-11  410  		return r;
164fb294093338 Tom St Denis 2022-10-11  411  	}
164fb294093338 Tom St Denis 2022-10-11  412  
164fb294093338 Tom St Denis 2022-10-11  413  	r = amdgpu_virt_enable_access_debugfs(adev);
164fb294093338 Tom St Denis 2022-10-11  414  	if (r < 0) {
164fb294093338 Tom St Denis 2022-10-11  415  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
164fb294093338 Tom St Denis 2022-10-11  416  		return r;
164fb294093338 Tom St Denis 2022-10-11  417  	}
164fb294093338 Tom St Denis 2022-10-11  418  
164fb294093338 Tom St Denis 2022-10-11  419  	data = kcalloc(1024, sizeof(*data), GFP_KERNEL);
164fb294093338 Tom St Denis 2022-10-11  420  	if (!data) {
164fb294093338 Tom St Denis 2022-10-11  421  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
164fb294093338 Tom St Denis 2022-10-11  422  		amdgpu_virt_disable_access_debugfs(adev);
164fb294093338 Tom St Denis 2022-10-11  423  		return -ENOMEM;
164fb294093338 Tom St Denis 2022-10-11  424  	}
164fb294093338 Tom St Denis 2022-10-11  425  
164fb294093338 Tom St Denis 2022-10-11  426  	/* switch to the specific se/sh/cu */
164fb294093338 Tom St Denis 2022-10-11  427  	mutex_lock(&adev->grbm_idx_mutex);
164fb294093338 Tom St Denis 2022-10-11  428  	amdgpu_gfx_select_se_sh(adev, rd->id.se, rd->id.sh, rd->id.cu, rd->id.xcc_id);
164fb294093338 Tom St Denis 2022-10-11  429  
164fb294093338 Tom St Denis 2022-10-11  430  	if (!rd->id.gpr_or_wave) {
164fb294093338 Tom St Denis 2022-10-11  431  		x = 0;
164fb294093338 Tom St Denis 2022-10-11  432  		if (adev->gfx.funcs->read_wave_data)
164fb294093338 Tom St Denis 2022-10-11  433  			adev->gfx.funcs->read_wave_data(adev, rd->id.xcc_id, rd->id.simd, rd->id.wave, data, &x);
164fb294093338 Tom St Denis 2022-10-11  434  	} else {
164fb294093338 Tom St Denis 2022-10-11  435  		x = size >> 2;
164fb294093338 Tom St Denis 2022-10-11  436  		if (rd->id.gpr.vpgr_or_sgpr) {
164fb294093338 Tom St Denis 2022-10-11  437  			if (adev->gfx.funcs->read_wave_vgprs)
164fb294093338 Tom St Denis 2022-10-11  438  				adev->gfx.funcs->read_wave_vgprs(adev, rd->id.xcc_id, rd->id.simd, rd->id.wave, rd->id.gpr.thread, *pos, size>>2, data);
164fb294093338 Tom St Denis 2022-10-11  439  		} else {
164fb294093338 Tom St Denis 2022-10-11  440  			if (adev->gfx.funcs->read_wave_sgprs)
164fb294093338 Tom St Denis 2022-10-11  441  				adev->gfx.funcs->read_wave_sgprs(adev, rd->id.xcc_id, rd->id.simd, rd->id.wave, *pos, size>>2, data);
164fb294093338 Tom St Denis 2022-10-11  442  		}
164fb294093338 Tom St Denis 2022-10-11  443  	}
164fb294093338 Tom St Denis 2022-10-11  444  
164fb294093338 Tom St Denis 2022-10-11  445  	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, rd->id.xcc_id);
164fb294093338 Tom St Denis 2022-10-11  446  	mutex_unlock(&adev->grbm_idx_mutex);
164fb294093338 Tom St Denis 2022-10-11  447  
164fb294093338 Tom St Denis 2022-10-11  448  	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
164fb294093338 Tom St Denis 2022-10-11  449  	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
164fb294093338 Tom St Denis 2022-10-11  450  
164fb294093338 Tom St Denis 2022-10-11  451  	if (!x) {
164fb294093338 Tom St Denis 2022-10-11  452  		result = -EINVAL;
164fb294093338 Tom St Denis 2022-10-11  453  		goto done;
164fb294093338 Tom St Denis 2022-10-11  454  	}
164fb294093338 Tom St Denis 2022-10-11  455  
164fb294093338 Tom St Denis 2022-10-11  456  	while (size && (*pos < x * 4)) {
164fb294093338 Tom St Denis 2022-10-11  457  		uint32_t value;
164fb294093338 Tom St Denis 2022-10-11  458  
164fb294093338 Tom St Denis 2022-10-11  459  		value = data[*pos >> 2];
164fb294093338 Tom St Denis 2022-10-11  460  		r = put_user(value, (uint32_t *)buf);
164fb294093338 Tom St Denis 2022-10-11 @461  		if (r) {
164fb294093338 Tom St Denis 2022-10-11  462  			result = r;
164fb294093338 Tom St Denis 2022-10-11  463  			goto done;
164fb294093338 Tom St Denis 2022-10-11  464  		}
164fb294093338 Tom St Denis 2022-10-11  465  
164fb294093338 Tom St Denis 2022-10-11  466  		result += 4;
164fb294093338 Tom St Denis 2022-10-11  467  		buf += 4;
164fb294093338 Tom St Denis 2022-10-11  468  		*pos += 4;
164fb294093338 Tom St Denis 2022-10-11  469  		size -= 4;
164fb294093338 Tom St Denis 2022-10-11  470  	}
164fb294093338 Tom St Denis 2022-10-11  471  
164fb294093338 Tom St Denis 2022-10-11  472  done:
164fb294093338 Tom St Denis 2022-10-11  473  	amdgpu_virt_disable_access_debugfs(adev);
164fb294093338 Tom St Denis 2022-10-11  474  	kfree(data);
164fb294093338 Tom St Denis 2022-10-11  475  	return result;
164fb294093338 Tom St Denis 2022-10-11  476  }
164fb294093338 Tom St Denis 2022-10-11  477  
164fb294093338 Tom St Denis 2022-10-11  478  static long amdgpu_debugfs_gprwave_ioctl(struct file *f, unsigned int cmd, unsigned long data)
164fb294093338 Tom St Denis 2022-10-11  479  {
164fb294093338 Tom St Denis 2022-10-11  480  	struct amdgpu_debugfs_gprwave_data *rd = f->private_data;
164fb294093338 Tom St Denis 2022-10-11  481  	int r;
164fb294093338 Tom St Denis 2022-10-11  482  
164fb294093338 Tom St Denis 2022-10-11  483  	mutex_lock(&rd->lock);
164fb294093338 Tom St Denis 2022-10-11  484  
164fb294093338 Tom St Denis 2022-10-11  485  	switch (cmd) {
164fb294093338 Tom St Denis 2022-10-11  486  	case AMDGPU_DEBUGFS_GPRWAVE_IOC_SET_STATE:
164fb294093338 Tom St Denis 2022-10-11  487  		r = copy_from_user(&rd->id, (struct amdgpu_debugfs_gprwave_iocdata *)data, sizeof rd->id);
164fb294093338 Tom St Denis 2022-10-11  488  		if (r)
164fb294093338 Tom St Denis 2022-10-11  489  			return r ? -EINVAL : 0;
164fb294093338 Tom St Denis 2022-10-11  490  		goto done;
164fb294093338 Tom St Denis 2022-10-11  491  	default:
164fb294093338 Tom St Denis 2022-10-11  492  		r = -EINVAL;
164fb294093338 Tom St Denis 2022-10-11  493  		goto done;
164fb294093338 Tom St Denis 2022-10-11  494  	}
164fb294093338 Tom St Denis 2022-10-11  495  
164fb294093338 Tom St Denis 2022-10-11  496  done:
164fb294093338 Tom St Denis 2022-10-11  497  	mutex_unlock(&rd->lock);
164fb294093338 Tom St Denis 2022-10-11 @498  	return r;
164fb294093338 Tom St Denis 2022-10-11  499  }
164fb294093338 Tom St Denis 2022-10-11  500  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
