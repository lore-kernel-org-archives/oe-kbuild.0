Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4C3DFC9C
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270268; cv=none; b=hwYEXiKJf+taPD+ulHp8p7Rk8ds1KShRJFWw01y8PWuDK8dTskVDAd26zSmZXxdLbnHO68KxBsVH8DkJClQ84sPKS4+V9wzfg/KY0bboyN0F3n4e93f4L77BQnahPJjb5EUdLBU5NfY7IIJzKXBxquP9+RVlusd8R3p3nZx6ero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270268; c=relaxed/simple;
	bh=yWQKXLeVOXUM3rrlKbw+P++foVsfv1pexadnodE7r0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JzO112xxZWd2uyqJdYtdfZhToQKW/iXYJpUUijJ5X1SmzSredeozBud+h8flf7ZB41nCwc0nnB8/inb5vmQb278Wqa1b5aKPYlKO8UhcdLx7EHXgziSx0F/5mh0v6V860rEUzcpRLqlLia/xQziGwVsMrKOPpFv8meefBvCYeLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5eyVbpx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5eyVbpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776270266; x=1807806266;
  h=date:from:to:cc:subject:message-id;
  bh=yWQKXLeVOXUM3rrlKbw+P++foVsfv1pexadnodE7r0k=;
  b=n5eyVbpx56NOCga2PIoVYEo/jlVJyHNk+i4PaUKwPo0rstdjzEeum5RE
   48h3joPaEf35ByINvpoO60Uu1oh9iQarGV3V/FDLALC+w0jgavSaAeHWt
   YkN5ToeSrI+RgdED+lLMGneN7tUZNbYKY5S5yM8tqb0WZrMHeQBHAl4lJ
   Gz3LujWW9IycoaKgzGv/h0eqs1r+uJ424H8vB1l74RdDLT5llNMiL3vTO
   3ZP0IeTeGho3tkWFO3tyMBdQT4Lnw/zxVTyItgYKjuuzi91dPCjlJlxi8
   mthkRUlPTrH9ZmshgLUOvSwsIziUL/2mhavyDTxRLsUg9K8tYHlq8XvJO
   g==;
X-CSE-ConnectionGUID: 6e/qv3x1TwmSKxcOIQ6oVQ==
X-CSE-MsgGUID: oS8PecB6S8WYv/e38oigjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94825951"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94825951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 09:24:23 -0700
X-CSE-ConnectionGUID: QUqQ9oMRTyKOlsWU2oDHqQ==
X-CSE-MsgGUID: BBKn8PFeRA+Cx5uno/GR9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253884976"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Apr 2026 09:24:22 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD32J-000000000h0-3wvA;
	Wed, 15 Apr 2026 16:24:19 +0000
Date: Thu, 16 Apr 2026 00:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11821/13789] ERROR: modpost:
 __ex_table+0x216c references non-executable section '__dyndbg'
Message-ID: <202604160002.gW2fez6X-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Airlie <airlied@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e6efabc0afca02efa263aba533f35d90117ab283
commit: 4516432284e1b2ad9e70de8067f779c9c1072189 [11821/13789] ttm/pool: track allocated_pages per numa node.
:::::: branch date: 26 hours ago
:::::: commit date: 8 days ago
config: riscv-randconfig-002-20260415 (https://download.01.org/0day-ci/archive/20260416/202604160002.gW2fez6X-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160002.gW2fez6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604160002.gW2fez6X-lkp@intel.com/

Note: the linux-next/master HEAD e6efabc0afca02efa263aba533f35d90117ab283 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_temp3_max+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4151_driver+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4151_driver+0x30 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4151_driver+0x68 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4151_groups+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4151_attrs+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4151_attrs+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4151_attrs+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in1_input+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in1_input+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_input+0x0 (section: .data) -> .Lpcrel_hi12 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_in2_input+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_attr_curr1_input+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4245_driver+0x18 (section: .data) -> .Lpcrel_hi9 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc4245_driver+0x68 (section: .data) -> .Lpcrel_hi4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_template_pwm_temp_tolerance+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_template_pwm_crit_temp_tolerance+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_template_in_input+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_template_in_min+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sensor_dev_template_in_max+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_temp1_input+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bcm_kona_wdt_driver+0x4 (section: .data) -> filelock_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_rca+0x14 (section: .data) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: srf04_driver+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: machxo2_spi_driver+0x0 (section: .data) -> match_dev_by_uuid (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: machxo2_spi_driver+0x10 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: machxo2_spi_driver+0x28 (section: .data) -> match_dev_by_uuid (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gnss_minors+0x1c (section: .data) -> io_uring_optable_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gnss_groups+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gnss_attrs+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_type+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fb0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fbc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fcc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x204c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x204c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2050 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2050 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2058 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2058 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x205c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x205c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2064 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2064 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2068 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2068 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2070 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2070 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2074 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2074 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x207c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x207c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2080 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2080 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2088 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2088 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x208c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x208c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2094 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2094 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2098 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2098 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2100 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2100 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2104 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2104 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x210c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x210c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2110 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2110 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2118 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2118 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x211c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x211c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2154 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2154 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2158 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2158 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x216c (section: __ex_table) -> link_rcec_helper.__UNIQUE_ID_ddebug_350 (section: __dyndbg)
>> ERROR: modpost: __ex_table+0x216c references non-executable section '__dyndbg'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x217c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x217c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2184 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2188 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2188 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2190 (section: __ex_table) -> .L0  (section: .debug_addr)
ERROR: modpost: __ex_table+0x2190 references non-executable section '.debug_addr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2194 (section: __ex_table) -> $d (section: .debug_str)
ERROR: modpost: __ex_table+0x2194 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x219c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x219c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2200 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2200 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2208 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2208 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x220c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x220c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2214 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2214 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2218 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2218 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2220 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2220 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2224 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2224 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x222c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x222c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2230 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2230 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2238 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2238 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x223c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x223c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2244 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2244 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2248 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2248 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2250 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2250 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2254 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2254 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x225c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x225c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2260 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2260 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2268 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2268 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x226c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x226c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2274 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2274 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2278 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2278 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2280 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2280 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2284 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2284 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x228c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x228c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2290 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2290 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2298 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2298 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x229c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x229c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22e4 (section: __ex_table) -> .L.str.2 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x22e4 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22ec (section: __ex_table) -> __initcall__kmod_gcc_sc8280xp__339_7588_gcc_sc8280xp_init4 (section: .initcall4.init)
>> ERROR: modpost: __ex_table+0x22ec references non-executable section '.initcall4.init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f0 (section: __ex_table) -> __UNIQUE_ID_modinfo_340 (section: .modinfo)
ERROR: modpost: __ex_table+0x22f0 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f8 (section: __ex_table) -> gcc_dfs_clocks (section: .data.rel.ro)
ERROR: modpost: __ex_table+0x22f8 references non-executable section '.data.rel.ro'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22fc (section: __ex_table) -> gcc_qupv3_wrap0_s2_clk_src (section: .data)
ERROR: modpost: __ex_table+0x22fc references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2304 (section: __ex_table) -> gcc_qupv3_wrap0_s6_clk_src_init (section: .data)
ERROR: modpost: __ex_table+0x2304 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2308 (section: __ex_table) -> gcc_qupv3_wrap1_s1_clk_src (section: .data)
ERROR: modpost: __ex_table+0x2308 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2310 (section: __ex_table) -> gcc_qupv3_wrap1_s5_clk_src_init (section: .data)
ERROR: modpost: __ex_table+0x2310 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2314 (section: __ex_table) -> gcc_qupv3_wrap2_s0_clk_src (section: .data)
ERROR: modpost: __ex_table+0x2314 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x231c (section: __ex_table) -> gcc_qupv3_wrap2_s3_clk_src_init (section: .data)
ERROR: modpost: __ex_table+0x231c references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2320 (section: __ex_table) -> gcc_qupv3_wrap2_s6_clk_src (section: .data)
ERROR: modpost: __ex_table+0x2320 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2328 (section: __ex_table) -> gcc_gpll7 (section: .data)
ERROR: modpost: __ex_table+0x2328 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x232c (section: __ex_table) -> gcc_aggre_noc_pcie_4_axi_clk (section: .data)
ERROR: modpost: __ex_table+0x232c references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2334 (section: __ex_table) -> gcc_aggre_usb4_1_axi_clk (section: .data)
ERROR: modpost: __ex_table+0x2334 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2338 (section: __ex_table) -> gcc_ahb2phy0_clk (section: .data)
ERROR: modpost: __ex_table+0x2338 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2340 (section: __ex_table) -> gcc_cfg_noc_usb3_prim_axi_clk (section: .data)
ERROR: modpost: __ex_table+0x2340 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2344 (section: __ex_table) -> gcc_ddrss_gpu_axi_clk (section: .data)
ERROR: modpost: __ex_table+0x2344 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x234c (section: __ex_table) -> gcc_disp_throttle_rt_axi_clk (section: .data)
ERROR: modpost: __ex_table+0x234c references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2350 (section: __ex_table) -> gcc_emac0_rgmii_clk_src (section: .data)
ERROR: modpost: __ex_table+0x2350 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2358 (section: __ex_table) -> gcc_emac1_slv_ahb_clk (section: .data)
ERROR: modpost: __ex_table+0x2358 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x235c (section: __ex_table) -> gcc_gp3_clk (section: .data)
ERROR: modpost: __ex_table+0x235c references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2364 (section: __ex_table) -> gcc_gpu_gpll0_div_clk_src (section: .data)
ERROR: modpost: __ex_table+0x2364 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2368 (section: __ex_table) -> gcc_gpu_tcu_throttle_clk (section: .data)
ERROR: modpost: __ex_table+0x2368 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2370 (section: __ex_table) -> gcc_pcie_0_aux_clk (section: .data)
ERROR: modpost: __ex_table+0x2370 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2374 (section: __ex_table) -> gcc_pcie_0_pipe_clk (section: .data)
ERROR: modpost: __ex_table+0x2374 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x237c (section: __ex_table) -> gcc_usb4_1_master_clk (section: .data)
ERROR: modpost: __ex_table+0x237c references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2380 (section: __ex_table) -> gcc_usb4_1_phy_pcie_pipe_clk (section: .data)
ERROR: modpost: __ex_table+0x2380 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2388 (section: __ex_table) -> .L.str.62 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x2388 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x238c (section: __ex_table) -> .L.str.69 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x238c references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2394 (section: __ex_table) -> $d (section: .debug_line)
ERROR: modpost: __ex_table+0x2394 references non-executable section '.debug_line'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2400 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2400 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2404 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2404 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x240c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x240c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2410 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2410 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2418 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2418 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x241c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x241c references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
