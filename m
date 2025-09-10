Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82208219E8C
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757546179; cv=none; b=VRSVbeZqRhQw4d81ZwFZn/cchERlStKSmy4a1Q2601rGmf0ei4tTMrYOpc6DI9bkM2pyOcE+uo11nyjXpZnB8E3+q4JN4i29AtYgkAkq66CI/Ty/KWQ0xYj7vfVXEqyWQLwOTia9KfpJViyHmheIi+ETjlPRbV2MdJGMTa9vXB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757546179; c=relaxed/simple;
	bh=++eLr57bkeQnlUEtha+P21lZM0/w7TrHEylvc6LeDEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FSjdfGyBub2GJGjyk8TdAH/0w6s//NSHOpPEoyNmEW0Yivl+sC038oKZ6DjYai43eH5Qxuki2bgZN4/3d5UijYvCWg5Yrr1PORr8Lou7D741l5RT/NNdE/vX0U5ALrZWAsIY4I3s58k2w8yTkigXnqebJqGBslNy1jsRzZBFqG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPE5kpFD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPE5kpFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757546178; x=1789082178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++eLr57bkeQnlUEtha+P21lZM0/w7TrHEylvc6LeDEE=;
  b=TPE5kpFDO557o4AdoYjdoV4JPEgTEMtebqcqoT2t/UCwhPe3vpz7tPoe
   8dI9YkycovSLJk+uLXbDcfPLT+HeCtqH9oh2UP6fF57xa3cbbqOCvvCim
   PpiN7vasj0gsxB9nDlCw/YvFQ7ttL+BpHQbXauU/DJeTNz4ZkvVEy/Puq
   S37e+/4Bu2pZ88N2fhjJ4RIOfjsWXT3oUvVbJoL9ozrnCWFV/HWoEnTAK
   pnkl9njfaTLkD1zIF4I3OLIfdGtU//fYkrBv3YCWCtJlbcGI2t0jhchMw
   DhSrtUk+fC4gMsUr7uCkk91Xxz5Pymu/rC+W6iyo3zIWVENtAPgdQubTX
   Q==;
X-CSE-ConnectionGUID: huPVMVOnQhmnz+eDgaZS2A==
X-CSE-MsgGUID: 0+vSHRLwRjGgv+Ii8SpXHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63699082"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63699082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 16:16:17 -0700
X-CSE-ConnectionGUID: Rkbqr+5nS1SBRITKYfrDqA==
X-CSE-MsgGUID: FK2f0zQVS1maGB5gMp8kAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="173429372"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2025 16:16:15 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwU2v-0006Lv-0f;
	Wed, 10 Sep 2025 23:16:13 +0000
Date: Thu, 11 Sep 2025 07:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:work.namespace.file_handles 7/33] ERROR: modpost:
 __ex_table+0x1428 references non-executable section '__jump_table'
Message-ID: <202509110756.ElyqaYNK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.namespace.file_handles
head:   b33bb9914da5821605ee7947efde4daeec1512f4
commit: 6e419228d8415c9fc1c6584af7f9ecd5a95bbb20 [7/33] mnt: use ns_common_init()
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: riscv-randconfig-002-20250911 (https://download.01.org/0day-ci/archive/20250911/202509110756.ElyqaYNK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110756.ElyqaYNK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509110756.ElyqaYNK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_echo+0x0 (section: .data) -> tsa_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_name+0x0 (section: .data) -> imx8_soc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_path+0x0 (section: .data) -> imx8_soc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_master_attribute_timeout+0x14 (section: .data) -> mtk_devapc_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ug3105_i2c_driver+0x4 (section: .data) -> regulator_virtual_consumer_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_in0_input+0x14 (section: .data) -> cros_ec_regulator_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp1_type+0x18 (section: .data) -> aw37503_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp2_type+0x18 (section: .data) -> aw37503_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_type+0x18 (section: .data) -> aw37503_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atxp1_driver+0x18 (section: .data) -> max77686_pmic_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in0_input+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in0_min+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in0_max+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in0_alarm+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in1_input+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in1_min+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in1_max+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in1_alarm+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_input+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_min+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_max+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_alarm+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in3_input+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in3_min+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in3_max+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in3_alarm+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in4_input+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in4_min+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in4_max+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in4_alarm+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in5_input+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in5_min+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in5_max+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in5_alarm+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in6_input+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in6_min+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in6_max+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in6_alarm+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in7_input+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in7_min+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in7_max+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in7_alarm+0x14 (section: .data) -> mc13783_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_name+0x14 (section: .data) -> mc13783_regulator_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: htu31_driver+0x18 (section: .data) -> tps51632_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: htu31_driver+0x30 (section: .data) -> tps51632_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: htu31_driver+0x64 (section: .data) -> tps51632_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: htu31_groups+0x0 (section: .data) -> pv88090_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: htu31_attrs+0x0 (section: .data) -> tps51632_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_heater_enable+0x0 (section: .data) -> tps51632_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_heater_enable+0x1c (section: .data) -> pv88090_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_heater_enable+0x28 (section: .data) -> pv88090_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_heater_enable+0x2c (section: .data) -> pv88090_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_heater_enable+0x38 (section: .data) -> pv88090_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_heater_enable+0x3c (section: .data) -> pv88090_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_heater_enable+0x48 (section: .data) -> pv88090_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: lm78_driver+0x4 (section: .data) -> sun20i_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp1_max+0x14 (section: .data) -> tps6286x_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp2_max+0x14 (section: .data) -> tps6286x_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_max+0x14 (section: .data) -> tps6286x_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in1_min+0x0 (section: .data) -> tps65217_regulator_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_min+0x0 (section: .data) -> tps65217_regulator_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in3_min+0x0 (section: .data) -> tps65217_regulator_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in4_min+0x0 (section: .data) -> tps65217_regulator_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in5_min+0x0 (section: .data) -> tps65217_regulator_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in6_min+0x0 (section: .data) -> tps65217_regulator_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in7_min+0x0 (section: .data) -> tps65217_regulator_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in9_min+0x0 (section: .data) -> tps65217_regulator_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in10_min+0x0 (section: .data) -> tps65218_regulator_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in11_min+0x0 (section: .data) -> tps65218_regulator_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in12_min+0x0 (section: .data) -> tps65218_regulator_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in13_min+0x0 (section: .data) -> tps65218_regulator_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in14_min+0x0 (section: .data) -> tps65218_regulator_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in15_min+0x0 (section: .data) -> tps65217_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in16_min+0x0 (section: .data) -> tps65217_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in1_max+0x0 (section: .data) -> tps65217_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_max+0x0 (section: .data) -> tps65217_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in3_max+0x0 (section: .data) -> tps65217_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in4_max+0x0 (section: .data) -> tps65217_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in5_max+0x0 (section: .data) -> tps65217_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in6_max+0x0 (section: .data) -> tps65217_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in7_max+0x0 (section: .data) -> tps65218_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in8_max+0x0 (section: .data) -> tps65218_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in9_max+0x0 (section: .data) -> tps65218_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in10_max+0x0 (section: .data) -> tps65218_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in11_max+0x0 (section: .data) -> tps65218_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp1_max+0x18 (section: .data) -> tps65086_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp2_max+0x18 (section: .data) -> tps65086_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_max+0x18 (section: .data) -> tps65086_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: therm_crit_alarm+0x14 (section: .data) -> tn48m_reset_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: therm_crit_alarm+0x34 (section: .data) -> tn48m_reset_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: therm_crit_alarm+0x54 (section: .data) -> tn48m_reset_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm1+0x14 (section: .data) -> zynq_reset_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm2+0x14 (section: .data) -> zynq_reset_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm3+0x14 (section: .data) -> zynq_reset_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm4+0x14 (section: .data) -> zynq_reset_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdpe122_driver+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdpe122_driver+0x30 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdpe122_driver+0x64 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdpe122_info+0x1e8 (section: .data) -> qcom_geni_serial_earlycon_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1428 (section: __ex_table) -> .L0  (section: __jump_table)
>> ERROR: modpost: __ex_table+0x1428 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x144c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x144c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1450 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1450 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1458 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1458 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x145c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x145c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1464 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1464 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1468 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1468 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1470 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1470 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1474 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1474 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x147c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x147c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1480 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1480 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1488 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1488 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x148c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x148c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1494 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1494 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1498 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1498 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e8 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x14e8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ec (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x14ec references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1500 (section: __ex_table) -> __TRACE_SYSTEM____GFP_LAST_BIT (section: .init.data)
ERROR: modpost: __ex_table+0x1500 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1504 (section: __ex_table) -> TRACE_SYSTEM_ZONE_NORMAL (section: _ftrace_eval_map)
ERROR: modpost: __ex_table+0x1504 references non-executable section '_ftrace_eval_map'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1518 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1518 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x151c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x151c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1524 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1524 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1528 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1528 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1530 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1530 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1534 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1534 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x153c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x153c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1540 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1540 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1548 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x154c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1554 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1558 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1560 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1564 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x156c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1570 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1578 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1578 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x157c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x157c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1584 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1588 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1590 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1594 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x159c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15d0 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
