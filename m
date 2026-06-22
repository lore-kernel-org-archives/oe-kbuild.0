Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB82E372663
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124958; cv=none; b=DkI598s9yfda3wUWwSkGL2YTApLFb5ay9JQLOj90Gd2hgtitYUG5O9bpzT46YSxEE0UnmO8S+ZluHGz18WUxednV82XvhASLoOrbydrPECNJd9xre3e2PQPBhfsbRJjZZmyQPrrQycrc42dSyM+Ajcxi6vCcfs58QqX4Ybx3HWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124958; c=relaxed/simple;
	bh=cX///xaSRzz/RXOSdR3OKnQ0Q/z4uwvgHvE7JQk+rQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f298aYSYEI/fC+tsALI57PNTXJbXq0K+i6WE5usotnhkkAzN6/mqGHp9I82xCnl+m9ba5FfVzWUx16pJw51mgrFNlJu005ySGw8wIixY0rxEetENYq3Z0s/MJBeQYc713yIqb44dFDvQ9B6GEVTFWGEi9cXY5hsbryMAjPUQQQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1niwxbX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1niwxbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782124957; x=1813660957;
  h=date:from:to:cc:subject:message-id;
  bh=cX///xaSRzz/RXOSdR3OKnQ0Q/z4uwvgHvE7JQk+rQ4=;
  b=Z1niwxbX4Rjevv0u56sjYxZMPTw9WPoFAJRYyZgYVPuKqyszp47gsx8J
   bxKJgScHrX7RKBGzELnGbO+HcUBFYp1CG3FHc8VFdWDVlepS8qKHqVP9j
   hxIU6JDfDntf4KxikrdO5Z7IglMNS3DAJdpv4Ja49f1q5p6tZqRrjgn7s
   DncFvo+jiBKzCzc0cdJy9+sl4TB0GvZ5lAZYH2M2RffXge74crZEf3MNr
   zEJrDdQ8CnqcEIoPqjGvtBP1sG92iK9/DF2Palmk3WNMxwawD0nDGO1Ov
   Bu9kDIN7QHaVSTMk6TWH4olrOC8D2NKHNKp7RqMqkQfgL0tLnn4mt+7ep
   g==;
X-CSE-ConnectionGUID: AkWDh9umTvOVciasgR4r7A==
X-CSE-MsgGUID: qlfUpyYMQ3q4JXeMSCM7AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82719310"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="82719310"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:42:36 -0700
X-CSE-ConnectionGUID: LY/YdmjQQ+iHg5rMGgrQQA==
X-CSE-MsgGUID: uTK5w54QTVi5+OYyR9oxkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="254288584"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2026 03:42:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbc6r-0000000010P-0kaI;
	Mon, 22 Jun 2026 10:42:33 +0000
Date: Mon, 22 Jun 2026 18:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: arch/powerpc/kernel/eeh_pe.c:516 Excess function
 parameter 'pe' description in 'eeh_pe_state_mark'
Message-ID: <202606221843.tezjijAd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Jonathan Corbet <corbet@lwn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 46d9c16115cf046ce564f0230126cae785f73826 scripts/kernel-doc: Detect mismatched inline member documentation tags
date:   5 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
config: powerpc64-randconfig-002-20260622 (https://download.01.org/0day-ci/archive/20260622/202606221843.tezjijAd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221843.tezjijAd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 46d9c16115cf ("scripts/kernel-doc: Detect mismatched inline member documentation tags")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606221843.tezjijAd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: arch/powerpc/kernel/eeh_pe.c:261 function parameter 'pe' not described in '__eeh_pe_get'
   Warning: arch/powerpc/kernel/eeh_pe.c:261 function parameter 'flag' not described in '__eeh_pe_get'
   Warning: arch/powerpc/kernel/eeh_pe.c:516 function parameter 'root' not described in 'eeh_pe_state_mark'
   Warning: arch/powerpc/kernel/eeh_pe.c:516 function parameter 'state' not described in 'eeh_pe_state_mark'
>> Warning: arch/powerpc/kernel/eeh_pe.c:516 Excess function parameter 'pe' description in 'eeh_pe_state_mark'
   Warning: arch/powerpc/kernel/eeh_pe.c:534 function parameter 'root' not described in 'eeh_pe_mark_isolated'
>> Warning: arch/powerpc/kernel/eeh_pe.c:534 Excess function parameter 'pe' description in 'eeh_pe_mark_isolated'
   Warning: arch/powerpc/kernel/eeh_pe.c:567 function parameter 'mode' not described in 'eeh_pe_dev_mode_mark'
   Warning: arch/powerpc/kernel/eeh_pe.c:567 expecting prototype for eeh_pe_dev_state_mark(). Prototype was for eeh_pe_dev_mode_mark() instead
   Warning: arch/powerpc/kernel/eeh_pe.c:582 function parameter 'root' not described in 'eeh_pe_state_clear'
>> Warning: arch/powerpc/kernel/eeh_pe.c:582 Excess function parameter 'data' description in 'eeh_pe_state_clear'
   Warning: arch/powerpc/kernel/eeh_pe.c:775 function parameter 'edev' not described in 'eeh_restore_one_device_bars'
>> Warning: arch/powerpc/kernel/eeh_pe.c:775 Excess function parameter 'data' description in 'eeh_restore_one_device_bars'
   Warning: arch/powerpc/kernel/eeh_pe.c:261 function parameter 'pe' not described in '__eeh_pe_get'
   Warning: arch/powerpc/kernel/eeh_pe.c:261 function parameter 'flag' not described in '__eeh_pe_get'
   Warning: arch/powerpc/kernel/eeh_pe.c:516 function parameter 'root' not described in 'eeh_pe_state_mark'
   Warning: arch/powerpc/kernel/eeh_pe.c:516 function parameter 'state' not described in 'eeh_pe_state_mark'
>> Warning: arch/powerpc/kernel/eeh_pe.c:516 Excess function parameter 'pe' description in 'eeh_pe_state_mark'
   Warning: arch/powerpc/kernel/eeh_pe.c:534 function parameter 'root' not described in 'eeh_pe_mark_isolated'
>> Warning: arch/powerpc/kernel/eeh_pe.c:534 Excess function parameter 'pe' description in 'eeh_pe_mark_isolated'
   Warning: arch/powerpc/kernel/eeh_pe.c:582 function parameter 'root' not described in 'eeh_pe_state_clear'
>> Warning: arch/powerpc/kernel/eeh_pe.c:582 Excess function parameter 'data' description in 'eeh_pe_state_clear'
   Warning: arch/powerpc/kernel/eeh_pe.c:775 function parameter 'edev' not described in 'eeh_restore_one_device_bars'
>> Warning: arch/powerpc/kernel/eeh_pe.c:775 Excess function parameter 'data' description in 'eeh_restore_one_device_bars'
--
   Warning: arch/powerpc/kernel/eeh_driver.c:140 function parameter 'edev' not described in 'eeh_disable_irq'
>> Warning: arch/powerpc/kernel/eeh_driver.c:140 Excess function parameter 'dev' description in 'eeh_disable_irq'
   Warning: arch/powerpc/kernel/eeh_driver.c:163 function parameter 'edev' not described in 'eeh_enable_irq'
>> Warning: arch/powerpc/kernel/eeh_driver.c:163 Excess function parameter 'dev' description in 'eeh_enable_irq'
   Warning: arch/powerpc/kernel/eeh_driver.c:325 function parameter 'pdev' not described in 'eeh_report_error'
   Warning: arch/powerpc/kernel/eeh_driver.c:351 function parameter 'pdev' not described in 'eeh_report_mmio_enabled'
   Warning: arch/powerpc/kernel/eeh_driver.c:371 function parameter 'pdev' not described in 'eeh_report_reset'
   Warning: arch/powerpc/kernel/eeh_driver.c:424 function parameter 'pdev' not described in 'eeh_report_resume'
   Warning: arch/powerpc/kernel/eeh_driver.c:450 function parameter 'pdev' not described in 'eeh_report_failure'
   Warning: arch/powerpc/kernel/eeh_driver.c:761 expecting prototype for eeh_check_slot_presence(). Prototype was for eeh_slot_presence_check() instead
   Warning: arch/powerpc/kernel/eeh_driver.c:140 function parameter 'edev' not described in 'eeh_disable_irq'
>> Warning: arch/powerpc/kernel/eeh_driver.c:140 Excess function parameter 'dev' description in 'eeh_disable_irq'
   Warning: arch/powerpc/kernel/eeh_driver.c:163 function parameter 'edev' not described in 'eeh_enable_irq'
>> Warning: arch/powerpc/kernel/eeh_driver.c:163 Excess function parameter 'dev' description in 'eeh_enable_irq'
   Warning: arch/powerpc/kernel/eeh_driver.c:325 function parameter 'pdev' not described in 'eeh_report_error'
   Warning: arch/powerpc/kernel/eeh_driver.c:351 function parameter 'pdev' not described in 'eeh_report_mmio_enabled'
   Warning: arch/powerpc/kernel/eeh_driver.c:371 function parameter 'pdev' not described in 'eeh_report_reset'
   Warning: arch/powerpc/kernel/eeh_driver.c:424 function parameter 'pdev' not described in 'eeh_report_resume'
   Warning: arch/powerpc/kernel/eeh_driver.c:450 function parameter 'pdev' not described in 'eeh_report_failure'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
