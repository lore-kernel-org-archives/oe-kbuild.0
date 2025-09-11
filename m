Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D3205ABA
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600426; cv=none; b=KmiBxQv06vVo0fo2/pXg7ximbHheTebAomVBxHpN3iH70ow6XB9uoFhn2ewxTZhPHSZHi9p7nWswrkGMugwSWJRD0JTKMLRymboY7q/NUMNi8VHwIfeOkPxYVDQveoqyN+rPLCmn3KpTIEFqX+gG7bN215HnDhxqdlzi30tVd5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600426; c=relaxed/simple;
	bh=od6VrkmS11xI0FVmykgT+j6ZXE6YhDx7IB/c0ZViGI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DmXb3TY9P7KDLitj8Cx08WXow1W9IiVtL6N4CM2oUdFNKmXrlvqt3QZoALjUaiOq2th0YSITwSlPspd3Rc6f7OYIf/Ots2mtF1GeUijcUAy5MR2xZVaWWFW1+Rl4FBQQ9F5Jh02H5/g7KEqW7NEs85UXizUKzwJZF3cceQ0pVk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIpl24V+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIpl24V+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757600424; x=1789136424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=od6VrkmS11xI0FVmykgT+j6ZXE6YhDx7IB/c0ZViGI4=;
  b=TIpl24V+46lmsjyPJwJ20IEhGLwXFZLQkZnqls3zHFwJtLMCC+UWbEN/
   qulNfiLLBLxXaoSwvJ2G9TqwJbdLaaZtCxXdOrG9P2agrWMWXTBlctgAi
   a8k/3t7g4DkpdASI42rtHxM8ii95lTvkOK1vlZ4spx0q/TasDc7rRoDv+
   q8767eM2FlYeDfdMJw2WRFjFY+HQeS9r9t65D6e4mxrZ3TcaANnrC/t/r
   0TIi9R7R88t2nLNGPiDi7dH+3VO6h1InamR02S8nztIlAGkBdiepE3ovh
   Kt8LQy4k6qs8MIkWQ6ydF25OJ1qUz9N6ORIM0NINREv/LIC7ArQtGraQj
   w==;
X-CSE-ConnectionGUID: NdH3yYB8SPiOQT6TKoYMNw==
X-CSE-MsgGUID: 2Cq63Ha+Q5qPANLC4ZZhAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77388495"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="77388495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 07:20:23 -0700
X-CSE-ConnectionGUID: 5cNoMmoyQROAROAkvPnfoQ==
X-CSE-MsgGUID: kRmWuJ8lS6eFc9ihbeyoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="173607670"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2025 07:20:22 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwi9r-0000Ng-2l;
	Thu, 11 Sep 2025 14:20:19 +0000
Date: Thu, 11 Sep 2025 22:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:master 13/26] ERROR: modpost: __ex_table+0x154c references
 non-executable section '.init.data'
Message-ID: <202509112213.2pyxJmbX-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   74a24c9b361058d1e1ac8d1a02b70fd3e4de8d22
commit: 40d00011a626e2ae161491a31c6a98cc0e271d9b [13/26] Merge branch into tip/master: 'x86/apic'
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: riscv-randconfig-002-20250911 (https://download.01.org/0day-ci/archive/20250911/202509112213.2pyxJmbX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509112213.2pyxJmbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509112213.2pyxJmbX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm1_auto_pwm_min+0x0 (section: .data) -> ti_abb_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm2_auto_pwm_min+0x0 (section: .data) -> ti_abb_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm3_auto_pwm_min+0x0 (section: .data) -> ti_abb_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp1_auto_temp_min+0x0 (section: .data) -> ti_abb_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp2_auto_temp_min+0x0 (section: .data) -> tps62360_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_auto_temp_min+0x0 (section: .data) -> tps62360_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp1_auto_temp_max+0x0 (section: .data) -> tps62360_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp2_auto_temp_max+0x0 (section: .data) -> tps62360_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_auto_temp_max+0x0 (section: .data) -> tps62360_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm1_enable+0x14 (section: .data) -> tps6507x_pmic_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_pwm2_enable+0x14 (section: .data) -> tps6507x_pmic_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_template_temp_max+0x18 (section: .data) -> rzg2l_usbphy_ctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_template_temp_max_hyst+0x18 (section: .data) -> rzg2l_usbphy_ctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_template_temp_crit+0x18 (section: .data) -> rzg2l_usbphy_ctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_template_temp_lcrit+0x18 (section: .data) -> rzg2l_usbphy_ctrl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in0_input+0x14 (section: .data) -> sysrq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in1_input+0x14 (section: .data) -> sysrq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_input+0x14 (section: .data) -> sysrq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in3_input+0x14 (section: .data) -> sysrq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in5_input+0x14 (section: .data) -> sysrq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in6_input+0x14 (section: .data) -> sysrq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in7_input+0x14 (section: .data) -> sysrq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_input+0x0 (section: .data) -> __setup_str_sysrq_always_enabled_setup (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_max+0x0 (section: .data) -> __setup_str_sysrq_always_enabled_setup (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_min+0x0 (section: .data) -> __setup_sysrq_always_enabled_setup (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_offset+0x0 (section: .data) -> __setup_sysrq_always_enabled_setup (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in4_input+0x14 (section: .data) -> sysrq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tmp421_driver+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adm1266_driver+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdpe122_info+0x1e8 (section: .data) -> owl_uart_console_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pim4328_driver+0x4 (section: .data) -> qcom_geni_serial_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scaling_available_governors+0x14 (section: .data) -> drm_core_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scaling_setspeed+0x14 (section: .data) -> drm_panic_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x144c (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x144c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1450 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1450 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1458 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1458 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x145c (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x145c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1464 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1464 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1468 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1468 references non-executable section '.debug_loc'
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
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a0 (section: __ex_table) -> .L0  (section: .debug_ranges)
ERROR: modpost: __ex_table+0x14a0 references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a4 (section: __ex_table) -> .L0  (section: .debug_ranges)
ERROR: modpost: __ex_table+0x14a4 references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1500 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1500 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1504 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1504 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x150c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x150c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1510 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1510 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> .L.str.219 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1548 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> kmem_cache_init.boot_kmem_cache (section: .init.data)
>> ERROR: modpost: __ex_table+0x154c references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1554 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1558 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1560 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1564 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x156c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1570 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1578 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1578 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x157c (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x157c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1584 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1588 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1590 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1594 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x159c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a8 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15a8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15ac references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b4 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15b4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b8 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15b8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c0 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15c0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c4 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15c4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15cc (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15cc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d0 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15d0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d8 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15d8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15dc (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15dc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15e4 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15e4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15e8 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x15e8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x15fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1600 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1600 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1608 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1608 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x160c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x160c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1614 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1618 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1618 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1620 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1620 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1624 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1624 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x163c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x163c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1644 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1648 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1648 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1650 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1650 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1654 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1654 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x165c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x165c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1660 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1660 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
