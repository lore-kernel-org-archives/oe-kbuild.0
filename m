Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CC425CC64
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754575243; cv=none; b=LkRSqUGyp7B7XgHko0Zm+th5gNHqtFV8lBGDDbjhXBWYhxKJ1iY7QnhUIr/Vyobq8vXvll4U/nLAKr/ItVkh6aTd2gUITlCZdYkd/r4IZSUNLnu10gHqC3SoOf3CKGQ+13mhdicGDitiKiLv4yiNQwc4SdeQXTqPazdr1vv/TTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754575243; c=relaxed/simple;
	bh=s6mn8BRsX8zZSnIBnK5y0J82POuzmlvjLNZhAiDERqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WN1yaJS3FVu3Pf4G7kfMR5RZBNSiFYCw+Pnl0J4TKx66ec7i6RkglV4FddWJppc8UMBf2EhPzcSy74H5eUGfcPwry5QKZpkKcKr0o10CzLdjs3Jp9jVKj1ikwnrTe/AKDdDYUsX9jGGxdWhlN/Gde4AWdJ5FA9cyOGdcofDeStA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y++uhquk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y++uhquk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754575241; x=1786111241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s6mn8BRsX8zZSnIBnK5y0J82POuzmlvjLNZhAiDERqs=;
  b=Y++uhqukZQnb28+51XhcAKQPuZLEmPcSXmnxPAzdbsUuxdjEXM2IrrDt
   SePrhUbyKbr1gIA34g56Vhu1d+Ej2deDXSEO9oeBdwT+OLD4qUMSYnMPt
   n3czM9xPxTRzTIpoEYEeCKMxLojVzE+q6h4nBffoy33qi6wyLWRwkLYYy
   aI10w8IO10lzJ3gHylphx+Hne8hvp8gxao3CnapknDj+x4xE+GcDbAw28
   cSSKgvNe9hp6SyRWZPAMF/FL6QIg2skR8tWitxD0KSXtRAhQv9Z+7vfKe
   hIFEXGO4z+bW7K2vv5HpVJcqbeusSOCWEkSIqGCnDGr3ZyVJobbw4fNmB
   g==;
X-CSE-ConnectionGUID: //z/xl0JQ4mhJ0EOjPpy5A==
X-CSE-MsgGUID: JPoBCp1DQBWmYASQdAwA9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60753325"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60753325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 07:00:39 -0700
X-CSE-ConnectionGUID: ATqr3tfrQvSJrmKFuQKfQw==
X-CSE-MsgGUID: PoOxrqU/QzeTfKQjqP8hRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="170447056"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2025 07:00:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk1AZ-0002ra-1S;
	Thu, 07 Aug 2025 14:00:35 +0000
Date: Thu, 7 Aug 2025 22:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:x86/mediated_pmu 24/62] ERROR: modpost: __ex_table+0x1e18
 references non-executable section '.data.rel.__compound_literal.118'
Message-ID: <202508072122.P5wwgSJd-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: Kan Liang <kan.liang@linux.intel.com>
CC: Sean Christopherson <seanjc@google.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Mingwei Zhang <mizhang@google.com>

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   3d5c3f3d8caef2bc9e69cb17f7ec233202068616
commit: 56a5a2c6595dea5e793bc5b6d1a9198a52b9ede9 [24/62] perf: Add a EVENT_GUEST flag
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072122.P5wwgSJd-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072122.P5wwgSJd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072122.P5wwgSJd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1c68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c6c (section: __ex_table) -> .LASF70 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c74 (section: __ex_table) -> .LASF387 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c78 (section: __ex_table) -> .LASF389 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c80 (section: __ex_table) -> .LASF391 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c84 (section: __ex_table) -> .LASF392 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c8c (section: __ex_table) -> .LASF394 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c90 (section: __ex_table) -> .LASF396 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c98 (section: __ex_table) -> .LASF398 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c9c (section: __ex_table) -> .LASF392 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ca4 (section: __ex_table) -> .LASF401 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ca4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ca8 (section: __ex_table) -> .LASF392 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ca8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cb0 (section: __ex_table) -> .LASF404 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cb0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cb4 (section: __ex_table) -> .LASF392 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cbc (section: __ex_table) -> .LASF407 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cc0 (section: __ex_table) -> .LASF409 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cc8 (section: __ex_table) -> .LASF411 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ccc (section: __ex_table) -> .LASF413 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ccc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cd4 (section: __ex_table) -> .LASF415 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cd8 (section: __ex_table) -> .LASF417 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ce0 (section: __ex_table) -> .LASF419 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ce0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ce4 (section: __ex_table) -> .LASF392 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ce4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cec (section: __ex_table) -> .LASF422 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cf0 (section: __ex_table) -> .LASF424 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cf0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cf8 (section: __ex_table) -> .LASF426 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cf8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cfc (section: __ex_table) -> .LASF428 (section: .debug_str)
ERROR: modpost: __ex_table+0x1cfc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d04 (section: __ex_table) -> .LASF430 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d08 (section: __ex_table) -> .LASF392 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d10 (section: __ex_table) -> .LASF433 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d14 (section: __ex_table) -> .LASF392 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d1c (section: __ex_table) -> .LASF436 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d20 (section: __ex_table) -> .LASF392 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d28 (section: __ex_table) -> .LASF439 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d2c (section: __ex_table) -> .LASF441 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dac (section: __ex_table) -> .LASF2038 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db0 (section: __ex_table) -> .LASF2040 (section: .debug_str)
ERROR: modpost: __ex_table+0x1db0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db8 (section: __ex_table) -> .LASF2042 (section: .debug_str)
ERROR: modpost: __ex_table+0x1db8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dbc (section: __ex_table) -> .LASF2044 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc4 (section: __ex_table) -> .LASF2463 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc8 (section: __ex_table) -> .LASF2460 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd0 (section: __ex_table) -> .LASF2466 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd4 (section: __ex_table) -> .LASF2460 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ddc (section: __ex_table) -> .LASF2469 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ddc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de0 (section: __ex_table) -> .LASF2460 (section: .debug_str)
ERROR: modpost: __ex_table+0x1de0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de8 (section: __ex_table) -> .LASF2472 (section: .debug_str)
ERROR: modpost: __ex_table+0x1de8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dec (section: __ex_table) -> .LASF2474 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df4 (section: __ex_table) -> .LASF2476 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df8 (section: __ex_table) -> .LASF2474 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e00 (section: __ex_table) -> .LASF2479 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e04 (section: __ex_table) -> .LASF2474 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> __compound_literal (section: .data.rel.__compound_literal.118)
>> ERROR: modpost: __ex_table+0x1e18 references non-executable section '.data.rel.__compound_literal.118'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> __compound_literal (section: .data.rel.__compound_literal.120)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.data.rel.__compound_literal.120'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> __compound_literal (section: .data.rel.__compound_literal.121)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.data.rel.__compound_literal.121'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> __compound_literal (section: .data.rel.local.__compound_literal.122)
>> ERROR: modpost: __ex_table+0x1e28 references non-executable section '.data.rel.local.__compound_literal.122'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e30 (section: __ex_table) -> .LASF2412 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e34 (section: __ex_table) -> .LASF2414 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e3c (section: __ex_table) -> .LASF2416 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e40 (section: __ex_table) -> .LASF2418 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e48 (section: __ex_table) -> .LASF2420 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e4c (section: __ex_table) -> .LASF2422 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e54 (section: __ex_table) -> .LASF2424 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e58 (section: __ex_table) -> .LASF2426 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e60 (section: __ex_table) -> .LASF128 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e64 (section: __ex_table) -> .LASF130 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e78 (section: __ex_table) -> .LLST614 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1e78 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e7c (section: __ex_table) -> .LLST643 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1e7c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea8 (section: __ex_table) -> .LASF3398 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ea8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eac (section: __ex_table) -> .LASF3400 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee4 (section: __ex_table) -> .LASF2295 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ee4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee8 (section: __ex_table) -> .LASF2297 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ee8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef0 (section: __ex_table) -> .LASF4 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef4 (section: __ex_table) -> .LASF5 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1efc (section: __ex_table) -> .LASF7 (section: .debug_str)
ERROR: modpost: __ex_table+0x1efc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f00 (section: __ex_table) -> .LASF9 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f08 (section: __ex_table) -> .LASF11 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f0c (section: __ex_table) -> .LASF5 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f14 (section: __ex_table) -> .LASF14 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f18 (section: __ex_table) -> .LASF16 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f20 (section: __ex_table) -> .LASF18 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f24 (section: __ex_table) -> .LASF20 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f2c (section: __ex_table) -> .LASF22 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f30 (section: __ex_table) -> .LASF24 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f38 (section: __ex_table) -> .LASF1231 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f3c (section: __ex_table) -> .LASF1233 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f44 (section: __ex_table) -> .LASF1235 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f48 (section: __ex_table) -> .LASF1237 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f80 (section: __ex_table) -> .LASF576 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f84 (section: __ex_table) -> .LASF578 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f8c (section: __ex_table) -> .LASF580 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f90 (section: __ex_table) -> .LASF582 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd4 (section: __ex_table) -> .LASF2864 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd8 (section: __ex_table) -> .LASF2866 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe0 (section: __ex_table) -> .LASF2868 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe4 (section: __ex_table) -> .LASF2870 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fec (section: __ex_table) -> .LASF2872 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff0 (section: __ex_table) -> .LASF2870 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2028 (section: __ex_table) -> .LASF2259 (section: .debug_str)
ERROR: modpost: __ex_table+0x2028 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x202c (section: __ex_table) -> .LASF2261 (section: .debug_str)
ERROR: modpost: __ex_table+0x202c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2034 (section: __ex_table) -> .LASF2263 (section: .debug_str)
ERROR: modpost: __ex_table+0x2034 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2038 (section: __ex_table) -> .LASF2261 (section: .debug_str)
ERROR: modpost: __ex_table+0x2038 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2070 (section: __ex_table) -> .LASF1684 (section: .debug_str)
ERROR: modpost: __ex_table+0x2070 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2074 (section: __ex_table) -> .LASF1686 (section: .debug_str)
ERROR: modpost: __ex_table+0x2074 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x207c (section: __ex_table) -> .LASF777 (section: .debug_str)
ERROR: modpost: __ex_table+0x207c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2080 (section: __ex_table) -> .LASF779 (section: .debug_str)
ERROR: modpost: __ex_table+0x2080 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
