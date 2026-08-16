Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C28718C933
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 03:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786850209; cv=none; b=cC0P6zsN/wI3OqB8HbbRVODCxqym3x6j7SzmVrhOy0jhb6R0wACNhQ1hle/Yuoc9ROqZb7/Z0KB1wLHyzwzqnUD9Nr+83evv3WObkXUjNOyuHekj7Qh0T+RIGNvQAWr6dRhTvrir4SpZw5BDT+SVaMGUcoSDSee15dcBx0D2zCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786850209; c=relaxed/simple;
	bh=hrufclA8y14g3si0f2FBJ7rDJ1tqIp5HhIMcACqnipw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QKpP0qyzqtunoK90ajzS+5cZ8myJ5CEBamf9i47tZjzNAMqM+IzyAgWXxEGYkti31+HhqlCar4VvsJMemCYxIWH9om4kb4pAcDZ491EvU+arIUZWrf35LSFiRSGHOfVlBZArecKWZt9inU+zhr0O80ji5BkpcgtjmDKDo2oFw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QH7P2ui2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QH7P2ui2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786850206; x=1818386206;
  h=date:from:to:cc:subject:message-id;
  bh=hrufclA8y14g3si0f2FBJ7rDJ1tqIp5HhIMcACqnipw=;
  b=QH7P2ui2qgCPbFsu/KlhJra2f3nqbhsNEIBSnZ8gi5eAJ6/uYwucQjbc
   EfpOoA9AoRRH/oXnDiYLiONsrPMHBibMrYcwKHDQ10kmyTQWfJXDkVnZn
   pxEOhVEeP81Af0yoczbwVJMzMQs4Ps/A6NW1Gc0e6ue4TeRfWOg3JFO2W
   xTEh7TfIYoXD5iqmq/VbhXcssaL59d2Lb5kUPV0iTMEUB+19nRZQJyT4Y
   dVXFpY3jEYals7eEmFjyMeoankdqvU4T1u8MShzMPAZQMVFtAcUMPStNM
   tECByRL7K1WPTJkLfXwrRSAf95ngFhhRovjl8rDf6r1O0uH3Sz4uo7Gl3
   g==;
X-CSE-ConnectionGUID: k7oFEZdfThaLoNgouhTOBg==
X-CSE-MsgGUID: o3Wr0+5HSbCeiFYHJJYfDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="110155691"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="110155691"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 20:16:46 -0700
X-CSE-ConnectionGUID: 7/Ho3VgySX+RFTZUCwtoEA==
X-CSE-MsgGUID: 4ruXsGO+S4ChBnMW+ovkfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="264136587"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Aug 2026 20:16:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvRMY-00000000ciI-0csd;
	Sun, 16 Aug 2026 03:16:42 +0000
Date: Sun, 16 Aug 2026 11:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:drm-misc-next 4/4] ERROR: modpost:
 __ex_table+0x1b4c references non-executable section '.debug_addr'
Message-ID: <202608161105.4XbJmzht-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dri-devel@lists.freedesktop.org
TO: Alex Huang <Alex.Huang2@amd.com>
CC: Mario Limonciello <superm1@kernel.org>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   09b47186a4164f3aaa3591313f80794443117342
commit: b961eb36d7b04147104cff2fd8bc0e94f4713324 [4/4] drm/amd/display: Remove unused DMCU/DMUB EDID CEA parser
:::::: branch date: 30 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r072-20260816 (https://download.01.org/0day-ci/archive/20260816/202608161105.4XbJmzht-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161105.4XbJmzht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608161105.4XbJmzht-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD 09b47186a4164f3aaa3591313f80794443117342 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: i2c_imx_driver+0x0 (section: .data) -> .Lpcrel_hi9 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: spacemit_i2c_conditionally_reset_bus._rs+0x1c (section: .data) -> pca963x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_versatile_driver+0x0 (section: .data) -> .Lpcrel_hi9 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_i2c_driver+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_i2c_driver+0x58 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_i2c_bus_recovery_info+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_i2c_bus_recovery_info+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_i2c_bus_recovery_info+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_i2c_bus_recovery_info+0x10 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_i2c_bus_recovery_info+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_i2c_bus_recovery_info+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: os05b10_driver+0x8 (section: .data) -> lm3630a_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_speed+0x1c (section: .data) -> gcc_sc8180x_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pm8916_lbc_charger_driver+0x0 (section: .data) -> gcc_sm8350_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w83795_driver+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_fan1_div+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_fan1_div+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_fan2_div+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_fan2_div+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_fan3_div+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_fan3_div+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0x14 (section: .data) -> exynos4x12_isp_clk_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0x3c (section: .data) -> exynos4x12_isp_clk_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0x44 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0x64 (section: .data) -> exynos4x12_isp_clk_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0x6c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0x8c (section: .data) -> exynos4x12_isp_clk_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0x94 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0xb4 (section: .data) -> exynos4x12_isp_clk_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_pwm+0xbc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: abituguru3_sysfs_attr+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_fan1_input+0x14 (section: .data) -> sg2042_pll_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_fan2_input+0x14 (section: .data) -> sg2042_pll_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp1_auto_point2_temp+0x1c (section: .data) -> jh7110_pll_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp2_auto_point2_temp+0x1c (section: .data) -> jh7110_pll_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_auto_point2_temp+0x1c (section: .data) -> jh7110_pll_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp4_auto_point2_temp+0x1c (section: .data) -> jh7110_pll_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm1_enable+0x14 (section: .data) -> .Lpcrel_hi5 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm2_enable+0x14 (section: .data) -> .Lpcrel_hi5 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm3_enable+0x14 (section: .data) -> .Lpcrel_hi5 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm4_enable+0x14 (section: .data) -> .Lpcrel_hi5 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adt7475_driver+0x68 (section: .data) -> suniv_f1c100s_ccu_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adt7475_driver+0x70 (section: .data) -> suniv_f1c100s_ccu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: asc7621_driver+0x70 (section: .data) -> sun50i_a100_ccu_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: asc7621_params+0x0 (section: .data) -> sun50i_a100_ccu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: asc7621_params+0x38 (section: .data) -> sun50i_a100_ccu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: asc7621_params+0x70 (section: .data) -> sun50i_a100_ccu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: asc7621_params+0xa8 (section: .data) -> sun50i_a100_ccu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: g762_attrs+0x0 (section: .data) -> xvcu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: g762_attrs+0x4 (section: .data) -> xvcu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: g762_attrs+0x8 (section: .data) -> xvcu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: g762_attrs+0xc (section: .data) -> xvcu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: g762_attrs+0x10 (section: .data) -> xvcu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4260_driver+0x4 (section: .data) -> milbeaut_hdmac_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sy7636a_sensor_driver+0x0 (section: .data) -> wpcm450_soc_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: w83l786ng_driver+0x18 (section: .data) -> rpm_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_in_input+0x14 (section: .data) -> rpm_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_in_input+0x3c (section: .data) -> rpm_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sda_in_input+0x64 (section: .data) -> rpm_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adm1266_driver+0x30 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adm1266_driver+0x68 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max16601_driver+0x4 (section: .data) -> sun20i_ppu_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: imx8mm_tmu_data+0x8 (section: .data) -> max77541_regulator_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: imx8mp_tmu_data+0x8 (section: .data) -> max77541_regulator_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: unittest_driver+0x2c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fluke_unaccel_interface+0x0 (section: .data) -> tpm_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fluke_hybrid_interface+0x0 (section: .data) -> .Lpcrel_hi21 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fluke_interface+0x0 (section: .data) -> .Lpcrel_hi23 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fluke_gpib_platform_driver+0x0 (section: .data) -> tpm_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: fluke_gpib_platform_driver+0x2c (section: .data) -> tpm_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b18 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b1c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b24 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b30 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b34 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b3c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b40 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b48 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b4c (section: __ex_table) -> $d (section: .debug_addr)
>> ERROR: modpost: __ex_table+0x1b4c references non-executable section '.debug_addr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b54 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b58 (section: __ex_table) -> pxa_usb_phy_init._entry (section: .rodata)
ERROR: modpost: __ex_table+0x1b58 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b60 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b64 (section: __ex_table) -> .L0  (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1b64 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b6c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b70 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b84 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b90 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b94 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b9c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bdc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be4 (section: __ex_table) -> .L.str.262 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1be4 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be8 (section: __ex_table) -> scif0_clk_mux (section: .rodata)
ERROR: modpost: __ex_table+0x1be8 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bfc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bfc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c00 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c08 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c0c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c20 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c24 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c2c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c30 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c38 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c3c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c44 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c48 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c50 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c54 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c5c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c60 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c68 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c6c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c74 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c78 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c80 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c84 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c8c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c90 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c90 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
