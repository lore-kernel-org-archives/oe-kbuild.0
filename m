Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E41223C77
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 23:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733787599; cv=none; b=QvpouwGa93uUgU+5NfOA4Qk5j2o2YBhD27k9GIcj2ePl+QiW9zYsKze05kEdrH/mo1G6PV/OlpAWSOh5JOTCuRTCNyqnTJiY41lxYDq2H+dJpWnmcMH/lke14Mj8zDJD6ZzmlsutMp4baIP9RANgtvq8ba+x8PIShV/36tVGDvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733787599; c=relaxed/simple;
	bh=phQ3KbYR2FfdY4JtcwGfWZjBxyGToPKwHAJAXWljHRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q/VwLfRPvYnRk7NBZ/EMdhEg98RBBdwGTb8BThna4Xne3Qa67TR5EDjROaL9i0uIrOM/VL4NQlckQKUs4ijxKrxckvtaOxZpT0DlVpcKueDaY1cbmeg9av/XOMPYvfv3qnIZtyiblIoePyYnbtb6itA1GOkmALZjiLGEppKcuAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djZJ5NZi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djZJ5NZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733787597; x=1765323597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=phQ3KbYR2FfdY4JtcwGfWZjBxyGToPKwHAJAXWljHRE=;
  b=djZJ5NZi6NYASS3EcyQj+Ihk4YJaONpwxJLARfs7qwAfvWycLRHjHsXV
   n8IXIdwFr0TJFQlPBjI/vZ2CbRqh9Wws40OYgFDmD1G8o6FHNoo8iKyuo
   /ZYfom/2YunieoDfybi/b/vq8uQsWDd4A7upE8Y+r3DgpQBJ8N2IERx3a
   nhQwCJWZAj68/4IYajywtqv7Cy4tUtAHrQf7jBBccqJrmvsti+5ENY5k/
   B3uT7OTSNif+/AO+mGS5DSZGoLCQtLKAnUtEIHynXI8cFBdyq2A1ErSPZ
   AMBGWfra5dIkCA1Bj/3f1yh4hGO/NTqRzuuQrn477xjLL7y0paxz8LhOg
   A==;
X-CSE-ConnectionGUID: TeGob2c7TECKWThKg1q6RQ==
X-CSE-MsgGUID: x3mUHLzhS3mgLZuwEfa3nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34244955"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34244955"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 15:39:56 -0800
X-CSE-ConnectionGUID: vypH357+QSKPZ1/7B+WBFg==
X-CSE-MsgGUID: p6UmtmEaQwWq+n8IaJkSlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="126048892"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2024 15:39:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKnM0-0004vJ-2C;
	Mon, 09 Dec 2024 23:39:52 +0000
Date: Tue, 10 Dec 2024 07:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_display_debugfs.c:1510:2-29:
 opportunity for str_true_false(( dsc_fractional_bpp_enable ))
Message-ID: <202412100726.6DTkXbAQ-lkp@intel.com>
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
TO: Swati Sharma <swati2.sharma@intel.com>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
CC: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Sui Jingfeng <suijingfeng@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: 680c1e31a59b223d677a22b508017d26b71a636a drm/i915/dsc: Add debugfs entry to validate DSC fractional bpp
date:   1 year, 1 month ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-103-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100726.6DTkXbAQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412100726.6DTkXbAQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/display/intel_display_debugfs.c:1298:2-14: opportunity for str_true_false(( dsc_enable ))
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:1510:2-29: opportunity for str_true_false(( dsc_fractional_bpp_enable ))

vim +1510 drivers/gpu/drm/i915/display/intel_display_debugfs.c

680c1e31a59b223 Swati Sharma 2023-11-10  1486  
680c1e31a59b223 Swati Sharma 2023-11-10  1487  static ssize_t i915_dsc_fractional_bpp_write(struct file *file,
680c1e31a59b223 Swati Sharma 2023-11-10  1488  					     const char __user *ubuf,
680c1e31a59b223 Swati Sharma 2023-11-10  1489  					     size_t len, loff_t *offp)
680c1e31a59b223 Swati Sharma 2023-11-10  1490  {
680c1e31a59b223 Swati Sharma 2023-11-10  1491  	struct drm_connector *connector =
680c1e31a59b223 Swati Sharma 2023-11-10  1492  		((struct seq_file *)file->private_data)->private;
680c1e31a59b223 Swati Sharma 2023-11-10  1493  	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
680c1e31a59b223 Swati Sharma 2023-11-10  1494  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
680c1e31a59b223 Swati Sharma 2023-11-10  1495  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
680c1e31a59b223 Swati Sharma 2023-11-10  1496  	bool dsc_fractional_bpp_enable = false;
680c1e31a59b223 Swati Sharma 2023-11-10  1497  	int ret;
680c1e31a59b223 Swati Sharma 2023-11-10  1498  
680c1e31a59b223 Swati Sharma 2023-11-10  1499  	if (len == 0)
680c1e31a59b223 Swati Sharma 2023-11-10  1500  		return 0;
680c1e31a59b223 Swati Sharma 2023-11-10  1501  
680c1e31a59b223 Swati Sharma 2023-11-10  1502  	drm_dbg(&i915->drm,
680c1e31a59b223 Swati Sharma 2023-11-10  1503  		"Copied %zu bytes from user to force fractional bpp for DSC\n", len);
680c1e31a59b223 Swati Sharma 2023-11-10  1504  
680c1e31a59b223 Swati Sharma 2023-11-10  1505  	ret = kstrtobool_from_user(ubuf, len, &dsc_fractional_bpp_enable);
680c1e31a59b223 Swati Sharma 2023-11-10  1506  	if (ret < 0)
680c1e31a59b223 Swati Sharma 2023-11-10  1507  		return ret;
680c1e31a59b223 Swati Sharma 2023-11-10  1508  
680c1e31a59b223 Swati Sharma 2023-11-10  1509  	drm_dbg(&i915->drm, "Got %s for DSC Fractional BPP Enable\n",
680c1e31a59b223 Swati Sharma 2023-11-10 @1510  		(dsc_fractional_bpp_enable) ? "true" : "false");
680c1e31a59b223 Swati Sharma 2023-11-10  1511  	intel_dp->force_dsc_fractional_bpp_en = dsc_fractional_bpp_enable;
680c1e31a59b223 Swati Sharma 2023-11-10  1512  
680c1e31a59b223 Swati Sharma 2023-11-10  1513  	*offp += len;
680c1e31a59b223 Swati Sharma 2023-11-10  1514  
680c1e31a59b223 Swati Sharma 2023-11-10  1515  	return len;
680c1e31a59b223 Swati Sharma 2023-11-10  1516  }
680c1e31a59b223 Swati Sharma 2023-11-10  1517  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
