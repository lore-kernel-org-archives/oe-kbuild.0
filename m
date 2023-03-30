Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E53539B
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680185186; x=1711721186;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V3VX6YXVGMGosTSDjlArCcbBrSUaA47yyq1DQeaYIa8=;
  b=QrSnHTDGvyTw9Jp8Hq2MVB/NrGor8ep/ayduPxfWgJmSZGmzZ3VrjB5w
   4yGR+kykM8lRWpkILmXgGhSeQvaMcRf/q1V66PBddSzu6f/9tyZNNMRqG
   wlv8CTKVQnS1KkdWVYmWpCdZNHLfy4wln2rJ39tW/bcOWMBCCEf0XeWaA
   TjF2zEDUP38KCDLDP6f1CbTpXAQaad3+BUSmQ0TxZfVw2Z0N5F5H3m75k
   K+NfAPrSrqZaFgq6SMrLGd3BNuOETEFLzeW5qmgUlg8EjjtgnRhh3Hjjd
   a42JEaRTUlQuKj1DSP/M2ohK8WQIWEFYrxJnS6Rlp0MHI1hIzImdU/gl4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342805272"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="342805272"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 06:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678200891"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="678200891"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 06:43:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phsZH-000Ktc-2P;
	Thu, 30 Mar 2023 13:43:55 +0000
Date: Thu, 30 Mar 2023 21:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1164
 amdgpu_debugfs_gfxoff_status_read() warn: ignoring unreachable code.
Message-ID: <202303302102.AQR0WSYc-lkp@intel.com>
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
head:   ffe78bbd512166e0ef1cc4858010b128c510ed7d
commit: 4686177f7d2140cdd9d031702c2b53ac4c89340a drm/amd/debugfs: Expose GFXOFF state to userspace
date:   8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-m031-20230329 (https://download.01.org/0day-ci/archive/20230330/202303302102.AQR0WSYc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303302102.AQR0WSYc-lkp@intel.com/

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
https://github.com/intel/lkp-tests
