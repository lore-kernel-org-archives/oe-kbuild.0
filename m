Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D1318DF80
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786836914; cv=none; b=RU2ONHau5qfJaATvRqv48MvXweEGbqOtWm24YY5Cul6IzoiDFT2L2/6Bc7Qdq3nSkGPocLyfhVDtG7LEuo+sOV+RFpbhC9FdJphKBbbliAlznz+wwju+ytfUAvxMQx9v6nStSs+VLagwIXpXmqThjpjuoeCvrae9fH8ASddhm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786836914; c=relaxed/simple;
	bh=/82i2gvgHAlGji/Py61NvFb6HJYbbCiGC+wDfmW19Yo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a1RRbAvCOW86kLMyJgdWWp0WEPaeQFCtGMLJZxWhnYvqWW6RYh0fPnhxSlnm0oaN8CZ13qzsKLpQ9oEMNVavjbTOMsNXKH4Y9AmxSTsXHOtneBVxaAHb3RrW5xDOk0ESMXr7Owu58goth9bI8CQBUI24ArYT3IV6Xgk04JMZIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IV4Gor/K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IV4Gor/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786836911; x=1818372911;
  h=date:from:to:cc:subject:message-id;
  bh=/82i2gvgHAlGji/Py61NvFb6HJYbbCiGC+wDfmW19Yo=;
  b=IV4Gor/KezCOBuLH+NxInAypR1cfnuTx+sQsim+5jp9FXaULT7eVuCNz
   fJld5QpsVT+TqA+Xt0Kv5RnDjcNN0f1r+d2IxPEGfhOjuHDiWriT7hWYF
   mjjV1lKnlAu0M/1kHXcbV9HZixkv1vs5lzFB0y6K9vTHQOnU5RFFFFMzE
   bT0+GFNQ9aX9MkBGxmPgAGLSKlizb7DcoqcFBblRX9IdjXoxlb3Mwquod
   MVJIupcrX7JPIXQtXLKXJhsvNZnvpMGGZ/kWKNzQosemXCUoaKQfaSIAV
   OIrL/+zg29Suo+jr0ANw1JQl5vLGzmjSYhoXPfZLHl/PEfSRapUT+sphX
   A==;
X-CSE-ConnectionGUID: ah8Pyu2XSqqzcNWm6jt/Bw==
X-CSE-MsgGUID: nrovjDssTWihRKMaTjNG5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="98518395"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="98518395"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 16:35:11 -0700
X-CSE-ConnectionGUID: lPnPGpptRIS+Uy4hNcfGfQ==
X-CSE-MsgGUID: jPUZ7xVzTn6QWTJYFjTNbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="264106298"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Aug 2026 16:35:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvNu7-00000000cWg-3GYV;
	Sat, 15 Aug 2026 23:35:07 +0000
Date: Sun, 16 Aug 2026 07:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1398/15435] ERROR: modpost:
 __ex_table+0x1aac references non-executable section '__jump_table'
Message-ID: <202608160725.07RwbHqf-lkp@intel.com>
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
TO: "Peter Zijlstra (Intel)" <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: 85570f10a4c61372c1d437365b9d8dbad512ec6f [1398/15435] sched/eevdf: Move to a single runqueue
:::::: branch date: 31 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-r072-20260816 (https://download.01.org/0day-ci/archive/20260816/202608160725.07RwbHqf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160725.07RwbHqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160725.07RwbHqf-lkp@intel.com/

Note: the linux-next/master HEAD 4477a78374a57c3809b172ad30cceabda48c47c6 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: isp1760_plat_driver+0x2c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsg_lun_attrs+0x4 (section: .data) -> sun8i_h3_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsg_lun_attrs+0x8 (section: .data) -> sun8i_h3_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsg_lun_attrs+0xc (section: .data) -> sun8i_h3_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsg_lun_attrs+0x10 (section: .data) -> sun8i_h3_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsg_lun_attrs+0x14 (section: .data) -> sun8i_h3_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsg_lun_attrs+0x18 (section: .data) -> sun8i_h3_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsg_lun_opts_attr_cdrom+0x0 (section: .data) -> sun8i_h3_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsg_lun_opts_attr_inquiry_string+0x0 (section: .data) -> sun8i_h3_pinctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uvcg_uncompressed_attr_b_bits_per_pixel+0x10 (section: .data) -> ur_pinctrl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: serio_raw_drv+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: serio_raw_drv+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: serio_raw_mutex+0x20 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: serio_raw_mutex+0x44 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i801_driver+0x4 (section: .data) -> mpfs_gpio_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: omap_i2c_bus_recovery_info+0x4 (section: .data) -> fsl_pwm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: p2wi_driver+0x0 (section: .data) -> rzg2l_gpt_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bcm_kona_i2c_driver+0x14 (section: .data) -> vt8500_pwm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: bcm_kona_i2c_driver+0x2c (section: .data) -> vt8500_pwm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adv7175_driver+0x4 (section: .data) -> pca955x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: og01a1b_i2c_driver+0x30 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ov13b10_write_regs._rs+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ov8856_i2c_driver+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tc358746_driver+0x18 (section: .data) -> adp8870_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: tc358746_driver+0x30 (section: .data) -> adp8870_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tc358746_driver+0x58 (section: .data) -> adp8870_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: media_devnode_lock+0x34 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: su3000_map+0x8 (section: .data) -> atmel_lcdfb_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: su3000_map+0x1c (section: .data) -> atmel_lcdfb_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_arm_ship_mode+0x1c (section: .data) -> gcc_ipq5210_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp1_type+0x1c (section: .data) -> gcc_qcs615_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp2_type+0x1c (section: .data) -> gcc_qcs615_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_type+0x1c (section: .data) -> gcc_qcs615_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp1_auto_point2_temp+0x1c (section: .data) -> lpass_core_cc_sc7280_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp2_auto_point2_temp+0x1c (section: .data) -> lpass_core_cc_sc7280_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_auto_point2_temp+0x1c (section: .data) -> lpass_core_cc_sc7280_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: emc2103_driver+0x4 (section: .data) -> camcc_sm6350_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_input+0x14 (section: .data) -> gcc_sm7150_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_power1_input+0x14 (section: .data) -> gcc_sm7150_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lm95245_driver+0x30 (section: .data) -> gpu_cc_sm8550_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: lm95245_driver+0x68 (section: .data) -> gpu_cc_sm8550_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: max127_driver+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsa320_hwmon_driver+0x0 (section: .data) -> sun55i_a523_r_ccu_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pc87360_driver+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pc87360_driver+0x14 (section: .data) -> sun5i_ccu_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pm6764tr_driver+0x4 (section: .data) -> loongson2_cmc_dma_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ucd9200_driver+0x4 (section: .data) -> zynqmp_dma_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: imx91_tmu+0x2c (section: .data) -> qcom_ramp_controller_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_dimm_location+0x14 (section: .data) -> sun50i_h6_ppu_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ktype_instance_ctrl+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: shmem_io_ops32+0x0 (section: .data) -> max77503_regulator_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_clock_event+0x6c (section: .data) -> mt6397_regulator_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_clocksource+0x38 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hid_map_usage._rs+0x1c (section: .data) -> rt4801_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xinmo_driver+0x54 (section: .data) -> lantiq_rcu_reset_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cec_pci_interface+0x20 (section: .data) -> early_smh_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mbox_test_driver+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_event_list+0x0 (section: .data) -> airoha_trng_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_event_list+0x4 (section: .data) -> airoha_trng_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_event_list_lock+0x34 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xd3c (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xd50 (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xd54 (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xd68 (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xd6c (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xd84 (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xd88 (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xd98 (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xd9c (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xdb0 (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scsi_static_device_list+0xf60 (section: .init.data) -> qcom_ebi2_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a58 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a5c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a64 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a68 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a70 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a7c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a80 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a88 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a8c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a94 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a98 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aac (section: __ex_table) -> .L0  (section: __jump_table)
>> ERROR: modpost: __ex_table+0x1aac references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.debug_str'
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
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b28 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b28 references non-executable section '.debug_str'
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
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b4c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b54 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b58 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b60 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b64 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b64 references non-executable section '.debug_str'
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
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb8 (section: __ex_table) -> .L.str (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1bb8 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc4 (section: __ex_table) -> .L.str (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1bc4 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bdc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1be4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1be8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bf0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bf4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c14 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c18 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c18 references non-executable section '.debug_str'
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
