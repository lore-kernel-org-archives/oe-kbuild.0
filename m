Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CD31D5146
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811973; cv=none; b=DhbtW3PUBxFOvFxsAyiFkvHGADnfJ4BlARX00DvMPb+jA5qTOeuFiU0nXjvQq2jhdVcsiGoenjfVaqnlE7+rWPdOQko8E94MzzLc7poYUzcQWP8usXYrgptsPf0IUa+oC2JUTxhgzFc0SzViEhih/oNqhLXpwJTxsim6tJ+sDeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811973; c=relaxed/simple;
	bh=idOARjQUUn5eFjdZcaCfWkUVmPH21Szcp10e0ANP5wM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UysuPL8edDnzD4l/R0p3xkVRtFzDXtSPyV+41YRiiTYE/PR4uewFrN1O6kxFncrmxUC7OxO5E/TI/09lgSDxuRIYG+oGWd4bbxPqUKQWbU+jZFltg0pkF1zaM0vLnZTv/mHZuM6WtHbHEz/9dIph1+32FcAKBiNkd1hMQcqmN4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qbs/+e64; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qbs/+e64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763811972; x=1795347972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=idOARjQUUn5eFjdZcaCfWkUVmPH21Szcp10e0ANP5wM=;
  b=Qbs/+e64ULBI7SLQZlMSg+MKHrjoW33siORnos8thr+QtI2h3NyDmZnV
   If6ZYjNnXZrY7WOp6OBn1t9hl5o6Zzv8X2eKXl/3prUR8GaOELdeo4+Hh
   I/XLzc38pHGf99wAFvs2oP7LK6jemq0a2MxMwteMuDGPAo//hsUzUKSm/
   B5Us26dr0qhurJx0hMcIMC9LL6UbdH/FQ9WTabi//PD+x6klLLl6/y5HZ
   kHmxD3kY5huGAe4c6CVfCB+3gRawpYAROdoMucxTJNxNQkUl0F7x/WBEp
   50bSKRswEKxUaEPmz3pSmChPINzOHgNpXT6umprYOKp4sfuO4/EH18Ay7
   A==;
X-CSE-ConnectionGUID: yFPhwL5DQZm/y18/kA28MQ==
X-CSE-MsgGUID: a95vpdeiSW2lDz3XV0EdQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65825983"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65825983"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 03:46:07 -0800
X-CSE-ConnectionGUID: MfyC/FtoQ6yD6qV7bsD7Tg==
X-CSE-MsgGUID: SXej9wVwSHOhX5jUnaEp5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222544581"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2025 03:46:06 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMm43-0007SP-2I;
	Sat, 22 Nov 2025 11:46:03 +0000
Date: Sat, 22 Nov 2025 19:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:208:22-24:
 WARNING opportunity for min()
Message-ID: <202511221958.D2O7zHwC-lkp@intel.com>
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
TO: Xinpeng Sun <xinpeng.sun@intel.com>
CC: Jiri Kosina <jikos@kernel.org>
CC: Even Xu <even.xu@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
commit: 0b1fca9dce44d0d2a8f4c55df1e4149744934a91 HID: intel-thc-hid: intel-quicki2c: support ACPI config for advanced features
date:   9 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-r062-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221958.D2O7zHwC-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511221958.D2O7zHwC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:208:22-24: WARNING opportunity for min()
   drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:213:22-24: WARNING opportunity for min()

vim +208 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c

5282e45ccbfa91 Even Xu     2025-01-06  115  
5282e45ccbfa91 Even Xu     2025-01-06  116  /**
bccbe21e766f9b Even Xu     2025-05-14  117   * quicki2c_get_acpi_resources - Query all QuickI2C devices' ACPI parameters
bccbe21e766f9b Even Xu     2025-05-14  118   * @qcdev: Point to quicki2c_device structure
5282e45ccbfa91 Even Xu     2025-01-06  119   *
bccbe21e766f9b Even Xu     2025-05-14  120   * This function gets all QuickI2C devices' ACPI resource.
5282e45ccbfa91 Even Xu     2025-01-06  121   *
bccbe21e766f9b Even Xu     2025-05-14  122   * Return: 0 if success or error code on failure.
5282e45ccbfa91 Even Xu     2025-01-06  123   */
5282e45ccbfa91 Even Xu     2025-01-06  124  static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
5282e45ccbfa91 Even Xu     2025-01-06  125  {
5282e45ccbfa91 Even Xu     2025-01-06  126  	struct acpi_device *adev = ACPI_COMPANION(qcdev->dev);
5282e45ccbfa91 Even Xu     2025-01-06  127  	struct quicki2c_subip_acpi_parameter i2c_param;
5282e45ccbfa91 Even Xu     2025-01-06  128  	struct quicki2c_subip_acpi_config i2c_config;
d08a1049659aa9 Even Xu     2025-01-13  129  	u32 hid_desc_addr;
5282e45ccbfa91 Even Xu     2025-01-06  130  	int ret = -EINVAL;
5282e45ccbfa91 Even Xu     2025-01-06  131  
5282e45ccbfa91 Even Xu     2025-01-06  132  	if (!adev) {
5282e45ccbfa91 Even Xu     2025-01-06  133  		dev_err(qcdev->dev, "Invalid acpi device pointer\n");
5282e45ccbfa91 Even Xu     2025-01-06  134  		return ret;
5282e45ccbfa91 Even Xu     2025-01-06  135  	}
5282e45ccbfa91 Even Xu     2025-01-06  136  
5282e45ccbfa91 Even Xu     2025-01-06  137  	qcdev->acpi_dev = adev;
5282e45ccbfa91 Even Xu     2025-01-06  138  
5282e45ccbfa91 Even Xu     2025-01-06  139  	ret = quicki2c_acpi_get_dsm_property(adev, &i2c_hid_guid,
5282e45ccbfa91 Even Xu     2025-01-06  140  					     QUICKI2C_ACPI_REVISION_NUM,
5282e45ccbfa91 Even Xu     2025-01-06  141  					     QUICKI2C_ACPI_FUNC_NUM_HID_DESC_ADDR,
5282e45ccbfa91 Even Xu     2025-01-06  142  					     ACPI_TYPE_INTEGER,
d08a1049659aa9 Even Xu     2025-01-13  143  					     &hid_desc_addr);
5282e45ccbfa91 Even Xu     2025-01-06  144  	if (ret)
5282e45ccbfa91 Even Xu     2025-01-06  145  		return ret;
5282e45ccbfa91 Even Xu     2025-01-06  146  
d08a1049659aa9 Even Xu     2025-01-13  147  	qcdev->hid_desc_addr = (u16)hid_desc_addr;
d08a1049659aa9 Even Xu     2025-01-13  148  
5282e45ccbfa91 Even Xu     2025-01-06  149  	ret = quicki2c_acpi_get_dsm_property(adev, &thc_platform_guid,
5282e45ccbfa91 Even Xu     2025-01-06  150  					     QUICKI2C_ACPI_REVISION_NUM,
5282e45ccbfa91 Even Xu     2025-01-06  151  					     QUICKI2C_ACPI_FUNC_NUM_ACTIVE_LTR_VAL,
5282e45ccbfa91 Even Xu     2025-01-06  152  					     ACPI_TYPE_INTEGER,
5282e45ccbfa91 Even Xu     2025-01-06  153  					     &qcdev->active_ltr_val);
5282e45ccbfa91 Even Xu     2025-01-06  154  	if (ret)
5282e45ccbfa91 Even Xu     2025-01-06  155  		return ret;
5282e45ccbfa91 Even Xu     2025-01-06  156  
5282e45ccbfa91 Even Xu     2025-01-06  157  	ret = quicki2c_acpi_get_dsm_property(adev, &thc_platform_guid,
5282e45ccbfa91 Even Xu     2025-01-06  158  					     QUICKI2C_ACPI_REVISION_NUM,
5282e45ccbfa91 Even Xu     2025-01-06  159  					     QUICKI2C_ACPI_FUNC_NUM_LP_LTR_VAL,
5282e45ccbfa91 Even Xu     2025-01-06  160  					     ACPI_TYPE_INTEGER,
5282e45ccbfa91 Even Xu     2025-01-06  161  					     &qcdev->low_power_ltr_val);
5282e45ccbfa91 Even Xu     2025-01-06  162  	if (ret)
5282e45ccbfa91 Even Xu     2025-01-06  163  		return ret;
5282e45ccbfa91 Even Xu     2025-01-06  164  
5282e45ccbfa91 Even Xu     2025-01-06  165  	ret = quicki2c_acpi_get_dsd_property(adev, QUICKI2C_ACPI_METHOD_NAME_ICRS,
5282e45ccbfa91 Even Xu     2025-01-06  166  					     ACPI_TYPE_BUFFER, &i2c_param);
5282e45ccbfa91 Even Xu     2025-01-06  167  	if (ret)
5282e45ccbfa91 Even Xu     2025-01-06  168  		return ret;
5282e45ccbfa91 Even Xu     2025-01-06  169  
5282e45ccbfa91 Even Xu     2025-01-06  170  	if (i2c_param.addressing_mode != HIDI2C_ADDRESSING_MODE_7BIT)
5282e45ccbfa91 Even Xu     2025-01-06  171  		return -EOPNOTSUPP;
5282e45ccbfa91 Even Xu     2025-01-06  172  
5282e45ccbfa91 Even Xu     2025-01-06  173  	qcdev->i2c_slave_addr = i2c_param.device_address;
5282e45ccbfa91 Even Xu     2025-01-06  174  
5282e45ccbfa91 Even Xu     2025-01-06  175  	ret = quicki2c_acpi_get_dsd_property(adev, QUICKI2C_ACPI_METHOD_NAME_ISUB,
5282e45ccbfa91 Even Xu     2025-01-06  176  					     ACPI_TYPE_BUFFER, &i2c_config);
5282e45ccbfa91 Even Xu     2025-01-06  177  	if (ret)
5282e45ccbfa91 Even Xu     2025-01-06  178  		return ret;
5282e45ccbfa91 Even Xu     2025-01-06  179  
5282e45ccbfa91 Even Xu     2025-01-06  180  	if (i2c_param.connection_speed > 0 &&
5282e45ccbfa91 Even Xu     2025-01-06  181  	    i2c_param.connection_speed <= QUICKI2C_SUBIP_STANDARD_MODE_MAX_SPEED) {
5282e45ccbfa91 Even Xu     2025-01-06  182  		qcdev->i2c_speed_mode = THC_I2C_STANDARD;
5282e45ccbfa91 Even Xu     2025-01-06  183  		qcdev->i2c_clock_hcnt = i2c_config.SMHX;
5282e45ccbfa91 Even Xu     2025-01-06  184  		qcdev->i2c_clock_lcnt = i2c_config.SMLX;
5282e45ccbfa91 Even Xu     2025-01-06  185  	} else if (i2c_param.connection_speed > QUICKI2C_SUBIP_STANDARD_MODE_MAX_SPEED &&
5282e45ccbfa91 Even Xu     2025-01-06  186  		   i2c_param.connection_speed <= QUICKI2C_SUBIP_FAST_MODE_MAX_SPEED) {
5282e45ccbfa91 Even Xu     2025-01-06  187  		qcdev->i2c_speed_mode = THC_I2C_FAST_AND_PLUS;
5282e45ccbfa91 Even Xu     2025-01-06  188  		qcdev->i2c_clock_hcnt = i2c_config.FMHX;
5282e45ccbfa91 Even Xu     2025-01-06  189  		qcdev->i2c_clock_lcnt = i2c_config.FMLX;
5282e45ccbfa91 Even Xu     2025-01-06  190  	} else if (i2c_param.connection_speed > QUICKI2C_SUBIP_FAST_MODE_MAX_SPEED &&
5282e45ccbfa91 Even Xu     2025-01-06  191  		   i2c_param.connection_speed <= QUICKI2C_SUBIP_FASTPLUS_MODE_MAX_SPEED) {
5282e45ccbfa91 Even Xu     2025-01-06  192  		qcdev->i2c_speed_mode = THC_I2C_FAST_AND_PLUS;
5282e45ccbfa91 Even Xu     2025-01-06  193  		qcdev->i2c_clock_hcnt = i2c_config.FPHX;
5282e45ccbfa91 Even Xu     2025-01-06  194  		qcdev->i2c_clock_lcnt = i2c_config.FPLX;
5282e45ccbfa91 Even Xu     2025-01-06  195  	} else if (i2c_param.connection_speed > QUICKI2C_SUBIP_FASTPLUS_MODE_MAX_SPEED &&
5282e45ccbfa91 Even Xu     2025-01-06  196  		   i2c_param.connection_speed <= QUICKI2C_SUBIP_HIGH_SPEED_MODE_MAX_SPEED) {
5282e45ccbfa91 Even Xu     2025-01-06  197  		qcdev->i2c_speed_mode = THC_I2C_HIGH_SPEED;
5282e45ccbfa91 Even Xu     2025-01-06  198  		qcdev->i2c_clock_hcnt = i2c_config.HMHX;
5282e45ccbfa91 Even Xu     2025-01-06  199  		qcdev->i2c_clock_lcnt = i2c_config.HMLX;
5282e45ccbfa91 Even Xu     2025-01-06  200  	} else {
5282e45ccbfa91 Even Xu     2025-01-06  201  		return -EOPNOTSUPP;
5282e45ccbfa91 Even Xu     2025-01-06  202  	}
5282e45ccbfa91 Even Xu     2025-01-06  203  
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  204  	if (qcdev->ddata) {
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  205  		qcdev->i2c_max_frame_size_enable = i2c_config.FSEN;
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  206  		qcdev->i2c_int_delay_enable = i2c_config.INDE;
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  207  
0b1fca9dce44d0 Xinpeng Sun 2025-09-17 @208  		if (i2c_config.FSVL <= qcdev->ddata->max_detect_size)
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  209  			qcdev->i2c_max_frame_size = i2c_config.FSVL;
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  210  		else
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  211  			qcdev->i2c_max_frame_size = qcdev->ddata->max_detect_size;
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  212  
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  213  		if (i2c_config.INDV <= qcdev->ddata->max_interrupt_delay)
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  214  			qcdev->i2c_int_delay = i2c_config.INDV;
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  215  		else
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  216  			qcdev->i2c_int_delay = qcdev->ddata->max_interrupt_delay;
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  217  	}
0b1fca9dce44d0 Xinpeng Sun 2025-09-17  218  
5282e45ccbfa91 Even Xu     2025-01-06  219  	return 0;
5282e45ccbfa91 Even Xu     2025-01-06  220  }
5282e45ccbfa91 Even Xu     2025-01-06  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
