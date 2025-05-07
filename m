Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F823507B
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608983; cv=none; b=hhnorFtIjnJkBbNERS4rlO0osLQPesEeRxhIAAUiXoqXIgJF/Toc6tv08Bh/1hN4CtF5NBeMHZaifcGAhuvFaru/Brq8s+AMEzT3zSnKnWkokcA1XcVjH31zqA/RuJcg61p1psT68w/i7rPp5KeBBTKoE2mUmnek9NpKps5TPIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608983; c=relaxed/simple;
	bh=6XEdAc35dKfmd62GGwWF3AZDbbAgD4+tSNdnKAOXesU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sfGC3Yksp2GleqRfSfuwgVUa0FnbhegFI2gRst4FznGQ6CUxhV8WUv/m+/Nk15HvcbrtaPvwVMgeEpNmP26am7QtyHP9vkXRZKvb/bGrxGegag0BBGtagiyCMdyJ/d31G+ZFZGBCWG7OfCDqLV/QCs7OekXRyxl3YGN9oJJkjm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUPBAjFc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUPBAjFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746608981; x=1778144981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6XEdAc35dKfmd62GGwWF3AZDbbAgD4+tSNdnKAOXesU=;
  b=eUPBAjFc9wjLbFkKjDo2GRTRryUQGHSwgaFcYa4xN1oUn0BIE86TBkCP
   tV0inEexb00+pPnb8Rg6O6pDUGDg6xISD3DpzpPmPLyMJxZ2AdWXfHV59
   aWqMlOsogY1W2jrdcYNkPEuHzbTAjSOcfJ2yMeJZi0RM9njYTmaj3XT+d
   xTHSZIPkcJ54ISOWHHnnIxb0RkRORFqIHwQWewDGzNWDVfCNqpVb/tAZb
   fTGVWlV2pM5BliarLCTgWIlUyMAa/6Sb+YyXMegQL64eqEIrXokApIEbP
   OoJc1kGUuI3ryXPJDjgAbvfZS5mrLXshQox5XiY8eor7BGtMxBhJ7wkCH
   g==;
X-CSE-ConnectionGUID: kxsyZAkMTjeTKw5e5BCprw==
X-CSE-MsgGUID: cfTjsPEjQz+YZbVBzykgFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58983824"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="58983824"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:09:40 -0700
X-CSE-ConnectionGUID: u7s2bQc4StaqYPfzFquIHQ==
X-CSE-MsgGUID: mJUOipBzR/6k8a3riP9D3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135900746"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 02:09:39 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCamX-000094-08;
	Wed, 07 May 2025 09:09:37 +0000
Date: Wed, 7 May 2025 17:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2049/9308] Warning:
 arch/powerpc/kernel/eeh_driver.c:140 function parameter 'edev' not described
 in 'eeh_disable_irq'
Message-ID: <202505071722.1EaopFrv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: fc862949a35aa4d5e92a10c64c620cde350bd511 [2049/9308] scripts/kernel-doc: switch to use kernel-doc.py
:::::: branch date: 2 hours ago
:::::: commit date: 4 weeks ago
config: powerpc64-randconfig-2006-20250506 (https://download.01.org/0day-ci/archive/20250507/202505071722.1EaopFrv-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071722.1EaopFrv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071722.1EaopFrv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/powerpc/kernel/eeh_driver.c:140 function parameter 'edev' not described in 'eeh_disable_irq'
>> Warning: arch/powerpc/kernel/eeh_driver.c:140 Excess function parameter 'dev' description in 'eeh_disable_irq'
>> Warning: arch/powerpc/kernel/eeh_driver.c:163 function parameter 'edev' not described in 'eeh_enable_irq'
>> Warning: arch/powerpc/kernel/eeh_driver.c:163 Excess function parameter 'dev' description in 'eeh_enable_irq'
>> Warning: arch/powerpc/kernel/eeh_driver.c:325 function parameter 'pdev' not described in 'eeh_report_error'
>> Warning: arch/powerpc/kernel/eeh_driver.c:351 function parameter 'pdev' not described in 'eeh_report_mmio_enabled'
>> Warning: arch/powerpc/kernel/eeh_driver.c:371 function parameter 'pdev' not described in 'eeh_report_reset'
>> Warning: arch/powerpc/kernel/eeh_driver.c:417 function parameter 'pdev' not described in 'eeh_report_resume'
>> Warning: arch/powerpc/kernel/eeh_driver.c:443 function parameter 'pdev' not described in 'eeh_report_failure'
--
>> Warning: arch/powerpc/kernel/eeh_pe.c:261 function parameter 'pe' not described in '__eeh_pe_get'
>> Warning: arch/powerpc/kernel/eeh_pe.c:261 function parameter 'flag' not described in '__eeh_pe_get'
>> Warning: arch/powerpc/kernel/eeh_pe.c:516 function parameter 'root' not described in 'eeh_pe_state_mark'
>> Warning: arch/powerpc/kernel/eeh_pe.c:516 function parameter 'state' not described in 'eeh_pe_state_mark'
>> Warning: arch/powerpc/kernel/eeh_pe.c:516 Excess function parameter 'pe' description in 'eeh_pe_state_mark'
>> Warning: arch/powerpc/kernel/eeh_pe.c:534 function parameter 'root' not described in 'eeh_pe_mark_isolated'
>> Warning: arch/powerpc/kernel/eeh_pe.c:534 Excess function parameter 'pe' description in 'eeh_pe_mark_isolated'
>> Warning: arch/powerpc/kernel/eeh_pe.c:582 function parameter 'root' not described in 'eeh_pe_state_clear'
>> Warning: arch/powerpc/kernel/eeh_pe.c:582 Excess function parameter 'data' description in 'eeh_pe_state_clear'
>> Warning: arch/powerpc/kernel/eeh_pe.c:773 function parameter 'edev' not described in 'eeh_restore_one_device_bars'
>> Warning: arch/powerpc/kernel/eeh_pe.c:773 Excess function parameter 'data' description in 'eeh_restore_one_device_bars'
--
>> Warning: arch/powerpc/kernel/eeh_event.c:39 function parameter 'dummy' not described in 'eeh_event_handler'
--
>> Warning: arch/powerpc/platforms/pseries/suspend.c:28 function parameter 'stream_id' not described in 'pseries_suspend_begin'
>> Warning: arch/powerpc/platforms/pseries/suspend.c:57 function parameter 'state' not described in 'pseries_suspend_enter'
>> Warning: arch/powerpc/platforms/pseries/suspend.c:145 function parameter 'dev' not described in 'pseries_suspend_sysfs_register'
--
>> Warning: arch/powerpc/platforms/pseries/vio.c:701 function parameter 'viodev' not described in 'vio_cmo_bus_probe'
>> Warning: arch/powerpc/platforms/pseries/vio.c:810 function parameter 'viodev' not described in 'vio_cmo_bus_remove'
>> Warning: arch/powerpc/platforms/pseries/vio.c:1096 function parameter 'vdev' not described in 'vio_h_cop_sync'
>> Warning: arch/powerpc/platforms/pseries/vio.c:1096 function parameter 'op' not described in 'vio_h_cop_sync'
--
>> Warning: arch/powerpc/platforms/pseries/smp.c:87 function parameter 'lcpu' not described in 'smp_startup_cpu'
--
>> Warning: arch/powerpc/platforms/pseries/lpar.c:1890 function parameter 'mpp_data' not described in 'h_get_mpp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
