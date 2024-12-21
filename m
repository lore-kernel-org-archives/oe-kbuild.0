Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EE41DD877
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734819417; cv=none; b=JHVekuukcLooILMrhSIdvmeex5dMaJtmcY3EXRn1q5BJkJ7+mz3wOAVRUUJMfzDSsFuaqrHhWRIB6zqacXVI7LuBxCAIjZVsVJMaAjW2iZ12yMVUPA3Jc4nqLkVsqq40vSqqRRSXdy0gR3658Tcubsg5od0OygSudXD0hyW13r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734819417; c=relaxed/simple;
	bh=ucC3l5pI4AnRtZMcpMEp/kJoAxjBDtAD80sD+Zul8TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VA4oNr1NIDKQWuzRMKWAMsLYTW3C+JAbMQ7WT32Xl1beMT53ybXRklp8u1eWMcZkeDyamSsfoiaxtbNAuHNwZ1e+k2Y5c8o3ZsC5jM0vWeA1QoI0AzS4Z+9ZFGv9SbBtVB4jzXJ7WIuiVM+s439fVs8xMLuxUygf11RZlGM1rSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnXq9Umm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnXq9Umm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734819415; x=1766355415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ucC3l5pI4AnRtZMcpMEp/kJoAxjBDtAD80sD+Zul8TQ=;
  b=PnXq9Umm1RWqYpT4tMuDCU4QbQMBac9iHvt8rkEK5npiCwlrjjBrmAoo
   ownDrKp+XOU06NsNhhVQowGSWJ0o4irMeip6/uzlXci8Evzw9upwaiUVc
   q3ZuGLdzDEexPki+uX3yY5rgybbNRxvH9KQH8OQsw9+JgVtICTf0obdCm
   mJC+3K80NpitlB22aoEe0ysmgNpEJvKvX+LPk00dX/23nF6Zg6gL3iJRv
   +7InCnLJh5oro+4JSYvZoBXWGxPTke6e5Sl/53R+gcXrH+m1SCL974KoI
   GbpQSYvevOeHoJGilhjSbRyhMT22OKG3oJzpEhbcAPMmKpCI5PsF7yGY6
   w==;
X-CSE-ConnectionGUID: tzCetgBeQV6bOXfcljJckQ==
X-CSE-MsgGUID: L7BAdTJaRfeBmKkAOVLFJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35362722"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35362722"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 14:16:52 -0800
X-CSE-ConnectionGUID: jh4WIBQqQci+l8gZmNbvdA==
X-CSE-MsgGUID: G3aXHQ/PSQud9TnzML0FkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102950657"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 14:16:51 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP7mC-0002XX-38;
	Sat, 21 Dec 2024 22:16:48 +0000
Date: Sun, 22 Dec 2024 06:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] drivers: hwmon: add driver for max42500
Message-ID: <202412220556.U9kI8Oix-lkp@intel.com>
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
In-Reply-To: <20241220012003.9568-3-Kent.Libetario@analog.com>
References: <20241220012003.9568-3-Kent.Libetario@analog.com>
TO: Kent Libetario <Kent.Libetario@analog.com>
TO: linux-hwmon@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>

Hi Kent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on de076198d1e4934c5fc17aa52d5f1884f469ce1a]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Libetario/dt-bindings-hwmon-add-adi-max42500-yaml/20241220-092728
base:   de076198d1e4934c5fc17aa52d5f1884f469ce1a
patch link:    https://lore.kernel.org/r/20241220012003.9568-3-Kent.Libetario%40analog.com
patch subject: [PATCH 2/2] drivers: hwmon: add driver for max42500
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r071-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220556.U9kI8Oix-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412220556.U9kI8Oix-lkp@intel.com/

New smatch warnings:
drivers/hwmon/max42500.c:312 max42500_set_nominal_voltage() warn: impossible condition '(voltage > 255) => (0-255 > 255)'
drivers/hwmon/max42500.c:427 max42500_set_ov_thresh2() warn: impossible condition '(thresh > 255) => (0-255 > 255)'
drivers/hwmon/max42500.c:482 max42500_set_uv_thresh2() warn: impossible condition '(thresh > 255) => (0-255 > 255)'

Old smatch warnings:
drivers/hwmon/max42500.c:318 max42500_set_nominal_voltage() warn: impossible condition '(voltage > 255) => (0-255 > 255)'

vim +312 drivers/hwmon/max42500.c

38dfb309423437 Kent Libetario 2024-12-20  296  
38dfb309423437 Kent Libetario 2024-12-20  297  /**
38dfb309423437 Kent Libetario 2024-12-20  298   * @brief Set nominal voltage for VM1 to VM5.
38dfb309423437 Kent Libetario 2024-12-20  299   * @return 0 in case of success, negative error code otherwise.
38dfb309423437 Kent Libetario 2024-12-20  300   */
38dfb309423437 Kent Libetario 2024-12-20  301  static int max42500_set_nominal_voltage(struct max42500_state *st,
38dfb309423437 Kent Libetario 2024-12-20  302  	enum max42500_vm_input vm_in, u8 voltage)
38dfb309423437 Kent Libetario 2024-12-20  303  {
38dfb309423437 Kent Libetario 2024-12-20  304  	u8 reg_addr;
38dfb309423437 Kent Libetario 2024-12-20  305  
38dfb309423437 Kent Libetario 2024-12-20  306  	switch (vm_in) {
38dfb309423437 Kent Libetario 2024-12-20  307  	case MAX42500_VM1:
38dfb309423437 Kent Libetario 2024-12-20  308  	case MAX42500_VM2:
38dfb309423437 Kent Libetario 2024-12-20  309  	case MAX42500_VM3:
38dfb309423437 Kent Libetario 2024-12-20  310  	case MAX42500_VM4:
38dfb309423437 Kent Libetario 2024-12-20  311  		if (voltage < MAX42500_MIN_VNOM ||
38dfb309423437 Kent Libetario 2024-12-20 @312  			voltage > MAX42500_VNOM_MAX_VM1_VM4)
38dfb309423437 Kent Libetario 2024-12-20  313  			return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  314  		reg_addr = MAX42500_REG_VIN1 + vm_in;
38dfb309423437 Kent Libetario 2024-12-20  315  		break;
38dfb309423437 Kent Libetario 2024-12-20  316  	case MAX42500_VM5:
38dfb309423437 Kent Libetario 2024-12-20  317  		if (voltage < MAX42500_MIN_VNOM ||
38dfb309423437 Kent Libetario 2024-12-20  318  			voltage > MAX42500_VNOM_MAX_VM5)
38dfb309423437 Kent Libetario 2024-12-20  319  			return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  320  		reg_addr = MAX42500_REG_VIN5;
38dfb309423437 Kent Libetario 2024-12-20  321  		break;
38dfb309423437 Kent Libetario 2024-12-20  322  	default:
38dfb309423437 Kent Libetario 2024-12-20  323  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  324  	}
38dfb309423437 Kent Libetario 2024-12-20  325  
38dfb309423437 Kent Libetario 2024-12-20  326  	st->nominal_volt[vm_in] = voltage;
38dfb309423437 Kent Libetario 2024-12-20  327  	return max42500_reg_write(st, reg_addr, voltage);
38dfb309423437 Kent Libetario 2024-12-20  328  }
38dfb309423437 Kent Libetario 2024-12-20  329  
38dfb309423437 Kent Libetario 2024-12-20  330  /**
38dfb309423437 Kent Libetario 2024-12-20  331   * @brief Get the status of the voltage monitor input.
38dfb309423437 Kent Libetario 2024-12-20  332   * @return 0 in case of success, negative error code otherwise.
38dfb309423437 Kent Libetario 2024-12-20  333   */
38dfb309423437 Kent Libetario 2024-12-20  334  static int max42500_get_comp_status(struct max42500_state *st,
38dfb309423437 Kent Libetario 2024-12-20  335  									u8 vm_in, u8 *status)
38dfb309423437 Kent Libetario 2024-12-20  336  {
38dfb309423437 Kent Libetario 2024-12-20  337  	int ret;
38dfb309423437 Kent Libetario 2024-12-20  338  	u8 reg_addr;
38dfb309423437 Kent Libetario 2024-12-20  339  	u8 vm_in_status;
38dfb309423437 Kent Libetario 2024-12-20  340  
38dfb309423437 Kent Libetario 2024-12-20  341  	switch (vm_in % MAX42500_COMP_STAT_MAX) {
38dfb309423437 Kent Libetario 2024-12-20  342  	case MAX42500_COMP_STAT_OFF:
38dfb309423437 Kent Libetario 2024-12-20  343  		reg_addr = MAX42500_REG_STATOFF;
38dfb309423437 Kent Libetario 2024-12-20  344  		break;
38dfb309423437 Kent Libetario 2024-12-20  345  	case MAX42500_COMP_STAT_UV:
38dfb309423437 Kent Libetario 2024-12-20  346  		reg_addr = MAX42500_REG_STATUV;
38dfb309423437 Kent Libetario 2024-12-20  347  		break;
38dfb309423437 Kent Libetario 2024-12-20  348  	case MAX42500_COMP_STAT_OV:
38dfb309423437 Kent Libetario 2024-12-20  349  		reg_addr = MAX42500_REG_STATOV;
38dfb309423437 Kent Libetario 2024-12-20  350  		break;
38dfb309423437 Kent Libetario 2024-12-20  351  	default:
38dfb309423437 Kent Libetario 2024-12-20  352  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  353  	}
38dfb309423437 Kent Libetario 2024-12-20  354  
38dfb309423437 Kent Libetario 2024-12-20  355  	ret = max42500_reg_read(st, reg_addr, &vm_in_status);
38dfb309423437 Kent Libetario 2024-12-20  356  	if (ret)
38dfb309423437 Kent Libetario 2024-12-20  357  		return ret;
38dfb309423437 Kent Libetario 2024-12-20  358  
38dfb309423437 Kent Libetario 2024-12-20  359  	switch (vm_in % MAX42500_VM_MAX) {
38dfb309423437 Kent Libetario 2024-12-20  360  	case MAX42500_VM1:
38dfb309423437 Kent Libetario 2024-12-20  361  		*status = (u8)FIELD_GET(BIT(MAX42500_VM1), vm_in_status);
38dfb309423437 Kent Libetario 2024-12-20  362  		break;
38dfb309423437 Kent Libetario 2024-12-20  363  	case MAX42500_VM2:
38dfb309423437 Kent Libetario 2024-12-20  364  		*status = (u8)FIELD_GET(BIT(MAX42500_VM2), vm_in_status);
38dfb309423437 Kent Libetario 2024-12-20  365  		break;
38dfb309423437 Kent Libetario 2024-12-20  366  	case MAX42500_VM3:
38dfb309423437 Kent Libetario 2024-12-20  367  		*status = (u8)FIELD_GET(BIT(MAX42500_VM3), vm_in_status);
38dfb309423437 Kent Libetario 2024-12-20  368  		break;
38dfb309423437 Kent Libetario 2024-12-20  369  	case MAX42500_VM4:
38dfb309423437 Kent Libetario 2024-12-20  370  		*status = (u8)FIELD_GET(BIT(MAX42500_VM4), vm_in_status);
38dfb309423437 Kent Libetario 2024-12-20  371  		break;
38dfb309423437 Kent Libetario 2024-12-20  372  	case MAX42500_VM5:
38dfb309423437 Kent Libetario 2024-12-20  373  		*status = (u8)FIELD_GET(BIT(MAX42500_VM5), vm_in_status);
38dfb309423437 Kent Libetario 2024-12-20  374  		break;
38dfb309423437 Kent Libetario 2024-12-20  375  	case MAX42500_VM6:
38dfb309423437 Kent Libetario 2024-12-20  376  		*status = (u8)FIELD_GET(BIT(MAX42500_VM6), vm_in_status);
38dfb309423437 Kent Libetario 2024-12-20  377  		break;
38dfb309423437 Kent Libetario 2024-12-20  378  	case MAX42500_VM7:
38dfb309423437 Kent Libetario 2024-12-20  379  		*status = (u8)FIELD_GET(BIT(MAX42500_VM7), vm_in_status);
38dfb309423437 Kent Libetario 2024-12-20  380  		break;
38dfb309423437 Kent Libetario 2024-12-20  381  	default:
38dfb309423437 Kent Libetario 2024-12-20  382  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  383  	}
38dfb309423437 Kent Libetario 2024-12-20  384  	st->comp_status[vm_in] = *status;
38dfb309423437 Kent Libetario 2024-12-20  385  
38dfb309423437 Kent Libetario 2024-12-20  386  	return 0;
38dfb309423437 Kent Libetario 2024-12-20  387  }
38dfb309423437 Kent Libetario 2024-12-20  388  
38dfb309423437 Kent Libetario 2024-12-20  389  /**
38dfb309423437 Kent Libetario 2024-12-20  390   * @brief Set the overvoltage threshold of VM1 to VM5.
38dfb309423437 Kent Libetario 2024-12-20  391   * @return 0 in case of success, negative error code otherwise.
38dfb309423437 Kent Libetario 2024-12-20  392   */
38dfb309423437 Kent Libetario 2024-12-20  393  static int max42500_set_ov_thresh1(struct max42500_state *st,
38dfb309423437 Kent Libetario 2024-12-20  394  	enum max42500_vm_input vm_in, u8 thresh)
38dfb309423437 Kent Libetario 2024-12-20  395  {
38dfb309423437 Kent Libetario 2024-12-20  396  	if (thresh < MAX42500_MIN_THRESH_VM1_VM5 ||
38dfb309423437 Kent Libetario 2024-12-20  397  		thresh > MAX42500_MAX_THRESH_VM1_VM5)
38dfb309423437 Kent Libetario 2024-12-20  398  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  399  
38dfb309423437 Kent Libetario 2024-12-20  400  	switch (vm_in) {
38dfb309423437 Kent Libetario 2024-12-20  401  	case MAX42500_VM1:
38dfb309423437 Kent Libetario 2024-12-20  402  	case MAX42500_VM2:
38dfb309423437 Kent Libetario 2024-12-20  403  	case MAX42500_VM3:
38dfb309423437 Kent Libetario 2024-12-20  404  	case MAX42500_VM4:
38dfb309423437 Kent Libetario 2024-12-20  405  	case MAX42500_VM5:
38dfb309423437 Kent Libetario 2024-12-20  406  		st->ov_thresh1[vm_in] = thresh;
38dfb309423437 Kent Libetario 2024-12-20  407  		return max42500_reg_update(st,
38dfb309423437 Kent Libetario 2024-12-20  408  								MAX42500_REG_OVUV1 + vm_in,
38dfb309423437 Kent Libetario 2024-12-20  409  								GENMASK(7, 4),
38dfb309423437 Kent Libetario 2024-12-20  410  								FIELD_PREP(GENMASK(7, 4),
38dfb309423437 Kent Libetario 2024-12-20  411  								thresh));
38dfb309423437 Kent Libetario 2024-12-20  412  	default:
38dfb309423437 Kent Libetario 2024-12-20  413  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  414  	}
38dfb309423437 Kent Libetario 2024-12-20  415  }
38dfb309423437 Kent Libetario 2024-12-20  416  
38dfb309423437 Kent Libetario 2024-12-20  417  /**
38dfb309423437 Kent Libetario 2024-12-20  418   * @brief Set the overvoltage threshold of VM6 and VM7.
38dfb309423437 Kent Libetario 2024-12-20  419   * @return 0 in case of success, negative error code otherwise.
38dfb309423437 Kent Libetario 2024-12-20  420   */
38dfb309423437 Kent Libetario 2024-12-20  421  static int max42500_set_ov_thresh2(struct max42500_state *st,
38dfb309423437 Kent Libetario 2024-12-20  422  	enum max42500_vm_input vm_in, u8 thresh)
38dfb309423437 Kent Libetario 2024-12-20  423  {
38dfb309423437 Kent Libetario 2024-12-20  424  	u8 reg_addr;
38dfb309423437 Kent Libetario 2024-12-20  425  
38dfb309423437 Kent Libetario 2024-12-20  426  	if (thresh < MAX42500_MIN_THRESH_VM6_V7 ||
38dfb309423437 Kent Libetario 2024-12-20 @427  		thresh > MAX42500_MAX_THRESH_VM6_V7)
38dfb309423437 Kent Libetario 2024-12-20  428  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  429  
38dfb309423437 Kent Libetario 2024-12-20  430  	switch (vm_in) {
38dfb309423437 Kent Libetario 2024-12-20  431  	case MAX42500_VM6:
38dfb309423437 Kent Libetario 2024-12-20  432  		reg_addr = MAX42500_REG_VINO6;
38dfb309423437 Kent Libetario 2024-12-20  433  		break;
38dfb309423437 Kent Libetario 2024-12-20  434  	case MAX42500_VM7:
38dfb309423437 Kent Libetario 2024-12-20  435  		reg_addr = MAX42500_REG_VINO7;
38dfb309423437 Kent Libetario 2024-12-20  436  		break;
38dfb309423437 Kent Libetario 2024-12-20  437  	default:
38dfb309423437 Kent Libetario 2024-12-20  438  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  439  	}
38dfb309423437 Kent Libetario 2024-12-20  440  
38dfb309423437 Kent Libetario 2024-12-20  441  	st->ov_thresh2[vm_in] = thresh;
38dfb309423437 Kent Libetario 2024-12-20  442  	return max42500_reg_write(st, reg_addr, thresh);
38dfb309423437 Kent Libetario 2024-12-20  443  }
38dfb309423437 Kent Libetario 2024-12-20  444  
38dfb309423437 Kent Libetario 2024-12-20  445  /**
38dfb309423437 Kent Libetario 2024-12-20  446   * @brief Set the undervoltage threshold of VM1 to VM5.
38dfb309423437 Kent Libetario 2024-12-20  447   * @return 0 in case of success, negative error code otherwise.
38dfb309423437 Kent Libetario 2024-12-20  448   */
38dfb309423437 Kent Libetario 2024-12-20  449  static int max42500_set_uv_thresh1(struct max42500_state *st,
38dfb309423437 Kent Libetario 2024-12-20  450  	enum max42500_vm_input vm_in, u8 thresh)
38dfb309423437 Kent Libetario 2024-12-20  451  {
38dfb309423437 Kent Libetario 2024-12-20  452  	if (thresh < MAX42500_MIN_THRESH_VM1_VM5 ||
38dfb309423437 Kent Libetario 2024-12-20  453  		thresh > MAX42500_MAX_THRESH_VM1_VM5)
38dfb309423437 Kent Libetario 2024-12-20  454  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  455  
38dfb309423437 Kent Libetario 2024-12-20  456  	switch (vm_in) {
38dfb309423437 Kent Libetario 2024-12-20  457  	case MAX42500_VM1:
38dfb309423437 Kent Libetario 2024-12-20  458  	case MAX42500_VM2:
38dfb309423437 Kent Libetario 2024-12-20  459  	case MAX42500_VM3:
38dfb309423437 Kent Libetario 2024-12-20  460  	case MAX42500_VM4:
38dfb309423437 Kent Libetario 2024-12-20  461  	case MAX42500_VM5:
38dfb309423437 Kent Libetario 2024-12-20  462  		st->uv_thresh1[vm_in] = thresh;
38dfb309423437 Kent Libetario 2024-12-20  463  		return max42500_reg_update(st,
38dfb309423437 Kent Libetario 2024-12-20  464  					MAX42500_REG_OVUV1 + vm_in,
38dfb309423437 Kent Libetario 2024-12-20  465  					GENMASK(3, 0),
38dfb309423437 Kent Libetario 2024-12-20  466  					thresh);
38dfb309423437 Kent Libetario 2024-12-20  467  	default:
38dfb309423437 Kent Libetario 2024-12-20  468  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  469  	}
38dfb309423437 Kent Libetario 2024-12-20  470  }
38dfb309423437 Kent Libetario 2024-12-20  471  
38dfb309423437 Kent Libetario 2024-12-20  472  /**
38dfb309423437 Kent Libetario 2024-12-20  473   * @brief Set the undervoltage threshold of VM6 and VM7.
38dfb309423437 Kent Libetario 2024-12-20  474   * @return 0 in case of success, negative error code otherwise.
38dfb309423437 Kent Libetario 2024-12-20  475   */
38dfb309423437 Kent Libetario 2024-12-20  476  static int max42500_set_uv_thresh2(struct max42500_state *st,
38dfb309423437 Kent Libetario 2024-12-20  477  	enum max42500_vm_input vm_in, u8 thresh)
38dfb309423437 Kent Libetario 2024-12-20  478  {
38dfb309423437 Kent Libetario 2024-12-20  479  	u8 reg_addr;
38dfb309423437 Kent Libetario 2024-12-20  480  
38dfb309423437 Kent Libetario 2024-12-20  481  	if (thresh < MAX42500_MIN_THRESH_VM6_V7 ||
38dfb309423437 Kent Libetario 2024-12-20 @482  		thresh > MAX42500_MAX_THRESH_VM6_V7)
38dfb309423437 Kent Libetario 2024-12-20  483  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  484  
38dfb309423437 Kent Libetario 2024-12-20  485  	switch (vm_in) {
38dfb309423437 Kent Libetario 2024-12-20  486  	case MAX42500_VM6:
38dfb309423437 Kent Libetario 2024-12-20  487  		reg_addr = MAX42500_REG_VINU6;
38dfb309423437 Kent Libetario 2024-12-20  488  		break;
38dfb309423437 Kent Libetario 2024-12-20  489  	case MAX42500_VM7:
38dfb309423437 Kent Libetario 2024-12-20  490  		reg_addr = MAX42500_REG_VINU7;
38dfb309423437 Kent Libetario 2024-12-20  491  		break;
38dfb309423437 Kent Libetario 2024-12-20  492  	default:
38dfb309423437 Kent Libetario 2024-12-20  493  		return -EINVAL;
38dfb309423437 Kent Libetario 2024-12-20  494  	}
38dfb309423437 Kent Libetario 2024-12-20  495  
38dfb309423437 Kent Libetario 2024-12-20  496  	st->uv_thresh2[vm_in] = thresh;
38dfb309423437 Kent Libetario 2024-12-20  497  	return max42500_reg_write(st, reg_addr, thresh);
38dfb309423437 Kent Libetario 2024-12-20  498  }
38dfb309423437 Kent Libetario 2024-12-20  499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
