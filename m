Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34076107A6
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Feb 2023 23:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675553886; x=1707089886;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aW4rK8LC4pe98rdacGzQ8RUI/GBPddWmLXnVwL3V310=;
  b=gBpQenFoKllj5LIoOu9hP6PIn2zcf2mzeCiUmyouzYPPv7kbo6LV6F78
   r1GoosriNZVLVHq99Q0qu+J8es+ODq68Yvtwk0LB7nTZD84Mk6zt+vzJI
   8jTnJkOHdnJ30reSVcX7woCcau7jbon/BMvtSQ6IDzwa2VpuDxznipYC9
   ENgXM/zkjLQjuV0GBBP7OkpwEUA7zISYrxMXGXsHwpzVUXW9U+ei1ObCJ
   2fMkAfx9ZpZDKTvVq42miUMI8VPwohFPygus0xwwZvnE1ICX/OlgyaVNi
   U9yiSSHbCZq2m55B3yJEwiPCkM9cAbSqdJJTh4Kp+VQD5KgUOrORMMhRc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317005795"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317005795"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 15:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="839979420"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="839979420"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Feb 2023 15:38:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOS6Z-0001Zz-1x;
	Sat, 04 Feb 2023 23:37:59 +0000
Date: Sun, 5 Feb 2023 07:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1080
 amdgpu_debugfs_gfxoff_residency_read() warn: ignoring unreachable code.
Message-ID: <202302050738.QuVmHfY1-lkp@intel.com>
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
head:   db27c22251e7c8f3a9d5bfb55c9c8c701a70bbb3
commit: 0ad7347a64ac4baec1786810709eebedc5f823d5 drm/amd: Add detailed GFXOFF stats to debugfs
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-m031-20230204 (https://download.01.org/0day-ci/archive/20230205/202302050738.QuVmHfY1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1080 amdgpu_debugfs_gfxoff_residency_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1179 amdgpu_debugfs_gfxoff_count_read() warn: ignoring unreachable code.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:386 amdgpu_debugfs_regs_pcie_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:499 amdgpu_debugfs_regs_didt_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:612 amdgpu_debugfs_regs_smc_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:768 amdgpu_debugfs_gca_config_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:846 amdgpu_debugfs_sensor_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:932 amdgpu_debugfs_wave_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1025 amdgpu_debugfs_gpr_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1274 amdgpu_debugfs_gfxoff_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1315 amdgpu_debugfs_gfxoff_status_read() warn: ignoring unreachable code.

vim +1080 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c

75758255dc0fae Alex Deucher  2017-12-14  1044  
0ad7347a64ac4b André Almeida 2022-08-10  1045  /**
0ad7347a64ac4b André Almeida 2022-08-10  1046   * amdgpu_debugfs_gfxoff_residency_read - Read GFXOFF residency
0ad7347a64ac4b André Almeida 2022-08-10  1047   *
0ad7347a64ac4b André Almeida 2022-08-10  1048   * @f: open file handle
0ad7347a64ac4b André Almeida 2022-08-10  1049   * @buf: User buffer to store read data in
0ad7347a64ac4b André Almeida 2022-08-10  1050   * @size: Number of bytes to read
0ad7347a64ac4b André Almeida 2022-08-10  1051   * @pos:  Offset to seek to
0ad7347a64ac4b André Almeida 2022-08-10  1052   *
0ad7347a64ac4b André Almeida 2022-08-10  1053   * Read the last residency value logged. It doesn't auto update, one needs to
0ad7347a64ac4b André Almeida 2022-08-10  1054   * stop logging before getting the current value.
0ad7347a64ac4b André Almeida 2022-08-10  1055   */
0ad7347a64ac4b André Almeida 2022-08-10  1056  static ssize_t amdgpu_debugfs_gfxoff_residency_read(struct file *f, char __user *buf,
0ad7347a64ac4b André Almeida 2022-08-10  1057  						    size_t size, loff_t *pos)
0ad7347a64ac4b André Almeida 2022-08-10  1058  {
0ad7347a64ac4b André Almeida 2022-08-10  1059  	struct amdgpu_device *adev = file_inode(f)->i_private;
0ad7347a64ac4b André Almeida 2022-08-10  1060  	ssize_t result = 0;
0ad7347a64ac4b André Almeida 2022-08-10  1061  	int r;
0ad7347a64ac4b André Almeida 2022-08-10  1062  
0ad7347a64ac4b André Almeida 2022-08-10  1063  	if (size & 0x3 || *pos & 0x3)
0ad7347a64ac4b André Almeida 2022-08-10  1064  		return -EINVAL;
0ad7347a64ac4b André Almeida 2022-08-10  1065  
0ad7347a64ac4b André Almeida 2022-08-10  1066  	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1067  	if (r < 0) {
0ad7347a64ac4b André Almeida 2022-08-10  1068  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1069  		return r;
0ad7347a64ac4b André Almeida 2022-08-10  1070  	}
0ad7347a64ac4b André Almeida 2022-08-10  1071  
0ad7347a64ac4b André Almeida 2022-08-10  1072  	while (size) {
0ad7347a64ac4b André Almeida 2022-08-10  1073  		uint32_t value;
0ad7347a64ac4b André Almeida 2022-08-10  1074  
0ad7347a64ac4b André Almeida 2022-08-10  1075  		r = amdgpu_get_gfx_off_residency(adev, &value);
0ad7347a64ac4b André Almeida 2022-08-10  1076  		if (r)
0ad7347a64ac4b André Almeida 2022-08-10  1077  			goto out;
0ad7347a64ac4b André Almeida 2022-08-10  1078  
0ad7347a64ac4b André Almeida 2022-08-10  1079  		r = put_user(value, (uint32_t *)buf);
0ad7347a64ac4b André Almeida 2022-08-10 @1080  		if (r)
0ad7347a64ac4b André Almeida 2022-08-10  1081  			goto out;
0ad7347a64ac4b André Almeida 2022-08-10  1082  
0ad7347a64ac4b André Almeida 2022-08-10  1083  		result += 4;
0ad7347a64ac4b André Almeida 2022-08-10  1084  		buf += 4;
0ad7347a64ac4b André Almeida 2022-08-10  1085  		*pos += 4;
0ad7347a64ac4b André Almeida 2022-08-10  1086  		size -= 4;
0ad7347a64ac4b André Almeida 2022-08-10  1087  	}
0ad7347a64ac4b André Almeida 2022-08-10  1088  
0ad7347a64ac4b André Almeida 2022-08-10  1089  	r = result;
0ad7347a64ac4b André Almeida 2022-08-10  1090  out:
0ad7347a64ac4b André Almeida 2022-08-10  1091  	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1092  	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1093  
0ad7347a64ac4b André Almeida 2022-08-10  1094  	return r;
0ad7347a64ac4b André Almeida 2022-08-10  1095  }
0ad7347a64ac4b André Almeida 2022-08-10  1096  
0ad7347a64ac4b André Almeida 2022-08-10  1097  /**
0ad7347a64ac4b André Almeida 2022-08-10  1098   * amdgpu_debugfs_gfxoff_residency_write - Log GFXOFF Residency
0ad7347a64ac4b André Almeida 2022-08-10  1099   *
0ad7347a64ac4b André Almeida 2022-08-10  1100   * @f: open file handle
0ad7347a64ac4b André Almeida 2022-08-10  1101   * @buf: User buffer to write data from
0ad7347a64ac4b André Almeida 2022-08-10  1102   * @size: Number of bytes to write
0ad7347a64ac4b André Almeida 2022-08-10  1103   * @pos:  Offset to seek to
0ad7347a64ac4b André Almeida 2022-08-10  1104   *
0ad7347a64ac4b André Almeida 2022-08-10  1105   * Write a 32-bit non-zero to start logging; write a 32-bit zero to stop
0ad7347a64ac4b André Almeida 2022-08-10  1106   */
0ad7347a64ac4b André Almeida 2022-08-10  1107  static ssize_t amdgpu_debugfs_gfxoff_residency_write(struct file *f, const char __user *buf,
0ad7347a64ac4b André Almeida 2022-08-10  1108  						     size_t size, loff_t *pos)
0ad7347a64ac4b André Almeida 2022-08-10  1109  {
0ad7347a64ac4b André Almeida 2022-08-10  1110  	struct amdgpu_device *adev = file_inode(f)->i_private;
0ad7347a64ac4b André Almeida 2022-08-10  1111  	ssize_t result = 0;
0ad7347a64ac4b André Almeida 2022-08-10  1112  	int r;
0ad7347a64ac4b André Almeida 2022-08-10  1113  
0ad7347a64ac4b André Almeida 2022-08-10  1114  	if (size & 0x3 || *pos & 0x3)
0ad7347a64ac4b André Almeida 2022-08-10  1115  		return -EINVAL;
0ad7347a64ac4b André Almeida 2022-08-10  1116  
0ad7347a64ac4b André Almeida 2022-08-10  1117  	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1118  	if (r < 0) {
0ad7347a64ac4b André Almeida 2022-08-10  1119  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1120  		return r;
0ad7347a64ac4b André Almeida 2022-08-10  1121  	}
0ad7347a64ac4b André Almeida 2022-08-10  1122  
0ad7347a64ac4b André Almeida 2022-08-10  1123  	while (size) {
0ad7347a64ac4b André Almeida 2022-08-10  1124  		u32 value;
0ad7347a64ac4b André Almeida 2022-08-10  1125  
0ad7347a64ac4b André Almeida 2022-08-10  1126  		r = get_user(value, (uint32_t *)buf);
0ad7347a64ac4b André Almeida 2022-08-10  1127  		if (r)
0ad7347a64ac4b André Almeida 2022-08-10  1128  			goto out;
0ad7347a64ac4b André Almeida 2022-08-10  1129  
0ad7347a64ac4b André Almeida 2022-08-10  1130  		amdgpu_set_gfx_off_residency(adev, value ? true : false);
0ad7347a64ac4b André Almeida 2022-08-10  1131  
0ad7347a64ac4b André Almeida 2022-08-10  1132  		result += 4;
0ad7347a64ac4b André Almeida 2022-08-10  1133  		buf += 4;
0ad7347a64ac4b André Almeida 2022-08-10  1134  		*pos += 4;
0ad7347a64ac4b André Almeida 2022-08-10  1135  		size -= 4;
0ad7347a64ac4b André Almeida 2022-08-10  1136  	}
0ad7347a64ac4b André Almeida 2022-08-10  1137  
0ad7347a64ac4b André Almeida 2022-08-10  1138  	r = result;
0ad7347a64ac4b André Almeida 2022-08-10  1139  out:
0ad7347a64ac4b André Almeida 2022-08-10  1140  	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1141  	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1142  
0ad7347a64ac4b André Almeida 2022-08-10  1143  	return r;
0ad7347a64ac4b André Almeida 2022-08-10  1144  }
0ad7347a64ac4b André Almeida 2022-08-10  1145  
0ad7347a64ac4b André Almeida 2022-08-10  1146  
0ad7347a64ac4b André Almeida 2022-08-10  1147  /**
0ad7347a64ac4b André Almeida 2022-08-10  1148   * amdgpu_debugfs_gfxoff_count_read - Read GFXOFF entry count
0ad7347a64ac4b André Almeida 2022-08-10  1149   *
0ad7347a64ac4b André Almeida 2022-08-10  1150   * @f: open file handle
0ad7347a64ac4b André Almeida 2022-08-10  1151   * @buf: User buffer to store read data in
0ad7347a64ac4b André Almeida 2022-08-10  1152   * @size: Number of bytes to read
0ad7347a64ac4b André Almeida 2022-08-10  1153   * @pos:  Offset to seek to
0ad7347a64ac4b André Almeida 2022-08-10  1154   */
0ad7347a64ac4b André Almeida 2022-08-10  1155  static ssize_t amdgpu_debugfs_gfxoff_count_read(struct file *f, char __user *buf,
0ad7347a64ac4b André Almeida 2022-08-10  1156  						size_t size, loff_t *pos)
0ad7347a64ac4b André Almeida 2022-08-10  1157  {
0ad7347a64ac4b André Almeida 2022-08-10  1158  	struct amdgpu_device *adev = file_inode(f)->i_private;
0ad7347a64ac4b André Almeida 2022-08-10  1159  	ssize_t result = 0;
0ad7347a64ac4b André Almeida 2022-08-10  1160  	int r;
0ad7347a64ac4b André Almeida 2022-08-10  1161  
0ad7347a64ac4b André Almeida 2022-08-10  1162  	if (size & 0x3 || *pos & 0x3)
0ad7347a64ac4b André Almeida 2022-08-10  1163  		return -EINVAL;
0ad7347a64ac4b André Almeida 2022-08-10  1164  
0ad7347a64ac4b André Almeida 2022-08-10  1165  	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1166  	if (r < 0) {
0ad7347a64ac4b André Almeida 2022-08-10  1167  		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1168  		return r;
0ad7347a64ac4b André Almeida 2022-08-10  1169  	}
0ad7347a64ac4b André Almeida 2022-08-10  1170  
0ad7347a64ac4b André Almeida 2022-08-10  1171  	while (size) {
0ad7347a64ac4b André Almeida 2022-08-10  1172  		u64 value = 0;
0ad7347a64ac4b André Almeida 2022-08-10  1173  
0ad7347a64ac4b André Almeida 2022-08-10  1174  		r = amdgpu_get_gfx_off_entrycount(adev, &value);
0ad7347a64ac4b André Almeida 2022-08-10  1175  		if (r)
0ad7347a64ac4b André Almeida 2022-08-10  1176  			goto out;
0ad7347a64ac4b André Almeida 2022-08-10  1177  
0ad7347a64ac4b André Almeida 2022-08-10  1178  		r = put_user(value, (u64 *)buf);
0ad7347a64ac4b André Almeida 2022-08-10 @1179  		if (r)
0ad7347a64ac4b André Almeida 2022-08-10  1180  			goto out;
0ad7347a64ac4b André Almeida 2022-08-10  1181  
0ad7347a64ac4b André Almeida 2022-08-10  1182  		result += 4;
0ad7347a64ac4b André Almeida 2022-08-10  1183  		buf += 4;
0ad7347a64ac4b André Almeida 2022-08-10  1184  		*pos += 4;
0ad7347a64ac4b André Almeida 2022-08-10  1185  		size -= 4;
0ad7347a64ac4b André Almeida 2022-08-10  1186  	}
0ad7347a64ac4b André Almeida 2022-08-10  1187  
0ad7347a64ac4b André Almeida 2022-08-10  1188  	r = result;
0ad7347a64ac4b André Almeida 2022-08-10  1189  out:
0ad7347a64ac4b André Almeida 2022-08-10  1190  	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1191  	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
0ad7347a64ac4b André Almeida 2022-08-10  1192  
0ad7347a64ac4b André Almeida 2022-08-10  1193  	return r;
0ad7347a64ac4b André Almeida 2022-08-10  1194  }
0ad7347a64ac4b André Almeida 2022-08-10  1195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
