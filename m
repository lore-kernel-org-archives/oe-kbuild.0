Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92F1D2E0
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jul 2023 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689934894; x=1721470894;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=caJNvpUK+l94XHPfMBZH4z1+Yh50m5i66xUemGwpq6w=;
  b=GPlAnWmyAcV2IHq9PXFd/RQW8/BitBGFNx6n1C+/+wpiB9uMA6xRy5CR
   hSbGafZBVkZRT4p15HPfthtDGkYzO8VBTy0OjyjVkJ4fe6tk4JXPeUuwW
   Hf+KIFWejl3KMia3z11ZMDJqvfyTmlJbjJvHInpihd7hDSCS4p1MZ3DFY
   AEmsyzAKsH2ozIge4SCUZJo5VJPIKV7DCripq9q0CsfB91kZ6YtsY3RCh
   vdP7wRGzSVWB6FGOwckx5KJCFy/IyT67hfyosWGZQQNtZXg4RcHHjG6fc
   Pm/H//USzWqeyioysbPLksM4Yc3FtDRgHoeGmsieOH1J5v++gLntgQ3kW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="351871235"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="351871235"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 03:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="728056636"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="728056636"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2023 03:21:31 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMnGJ-0007BB-0M;
	Fri, 21 Jul 2023 10:21:27 +0000
Date: Fri, 21 Jul 2023 18:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1164
 amdgpu_debugfs_gfxoff_status_read() warn: ignoring unreachable code.
Message-ID: <202307211820.8dYNxdiA-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "André Almeida" <andrealmeid@igalia.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7e3a1bafdea735050dfde00523cf505dc7fd309
commit: 4686177f7d2140cdd9d031702c2b53ac4c89340a drm/amd/debugfs: Expose GFXOFF state to userspace
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-m031-20230720 (https://download.01.org/0day-ci/archive/20230721/202307211820.8dYNxdiA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211820.8dYNxdiA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307211820.8dYNxdiA-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1164 amdgpu_debugfs_gfxoff_status_read() warn: ignoring unreachable code.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:386 amdgpu_debugfs_regs_pcie_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:499 amdgpu_debugfs_regs_didt_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:612 amdgpu_debugfs_regs_smc_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:768 amdgpu_debugfs_gca_config_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:846 amdgpu_debugfs_sensor_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:932 amdgpu_debugfs_wave_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1025 amdgpu_debugfs_gpr_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1123 amdgpu_debugfs_gfxoff_read() warn: ignoring unreachable code.

vim +1164 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c

4686177f7d2140 André Almeida 2022-07-14  1139  
4686177f7d2140 André Almeida 2022-07-14  1140  static ssize_t amdgpu_debugfs_gfxoff_status_read(struct file *f, char __user *buf,
4686177f7d2140 André Almeida 2022-07-14  1141  						 size_t size, loff_t *pos)
4686177f7d2140 André Almeida 2022-07-14  1142  {
4686177f7d2140 André Almeida 2022-07-14  1143  	struct amdgpu_device *adev = file_inode(f)->i_private;
4686177f7d2140 André Almeida 2022-07-14  1144  	ssize_t result = 0;
4686177f7d2140 André Almeida 2022-07-14  1145  	int r;
4686177f7d2140 André Almeida 2022-07-14  1146  
4686177f7d2140 André Almeida 2022-07-14  1147  	if (size & 0x3 || *pos & 0x3)
4686177f7d2140 André Almeida 2022-07-14  1148  		return -EINVAL;
4686177f7d2140 André Almeida 2022-07-14  1149  
4686177f7d2140 André Almeida 2022-07-14  1150  	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
4686177f7d2140 André Almeida 2022-07-14  1151  	if (r < 0) {
4686177f7d2140 André Almeida 2022-07-14  1152  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
4686177f7d2140 André Almeida 2022-07-14  1153  		return r;
4686177f7d2140 André Almeida 2022-07-14  1154  	}
4686177f7d2140 André Almeida 2022-07-14  1155  
4686177f7d2140 André Almeida 2022-07-14  1156  	while (size) {
4686177f7d2140 André Almeida 2022-07-14  1157  		u32 value;
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1158  
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1159  		r = amdgpu_get_gfx_off_status(adev, &value);
edadd6fc28b24d André Almeida 2022-07-04  1160  		if (r)
edadd6fc28b24d André Almeida 2022-07-04  1161  			goto out;
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1162  
4686177f7d2140 André Almeida 2022-07-14  1163  		r = put_user(value, (u32 *)buf);
edadd6fc28b24d André Almeida 2022-07-04 @1164  		if (r)
edadd6fc28b24d André Almeida 2022-07-04  1165  			goto out;
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1166  
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1167  		result += 4;
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1168  		buf += 4;
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1169  		*pos += 4;
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1170  		size -= 4;
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1171  	}
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1172  
edadd6fc28b24d André Almeida 2022-07-04  1173  	r = result;
edadd6fc28b24d André Almeida 2022-07-04  1174  out:
4a580877bdcb83 Luben Tuikov  2020-08-24  1175  	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
4a580877bdcb83 Luben Tuikov  2020-08-24  1176  	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1177  
edadd6fc28b24d André Almeida 2022-07-04  1178  	return r;
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1179  }
443c7f3c3641c7 Jinzhou.Su    2020-07-07  1180  

:::::: The code at line 1164 was first introduced by commit
:::::: edadd6fc28b24dd5806dafc4b38633494ff423e6 drm/amdpgu/debugfs: Simplify some exit paths

:::::: TO: André Almeida <andrealmeid@igalia.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
