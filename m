Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142B3213254
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jul 2026 05:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317010; cv=none; b=ptx+IUgNxuXtgeagGG6QkY7cWfA80XKVIYC+8brdTTC86FAcOCktJJVS8ryyG/T8FsGt4a+HzwoA9wQdY81sEmiK7A/vyCAV8unzbqDEtmPWl4oRQLZK8lIJanlcsgZbc/danij7/6gTVpEX2ySMJpknSY+5k8PYNvOs5RfVERs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317010; c=relaxed/simple;
	bh=e1mqSY1OWoXUUQVXMb/oRTZ22WTG8O0CGqI+E2NO+Fs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ovm0l2UTfAV90Z0JTOYe1p54By03DSlEr3/BXfFPsICjqCP+EBk1lU7ZHJGSn6/MECkcaNUcjFdZykRHzdqFO51NVZq2FKVj6WiA4PH4TOrstBbi9JqExu+J9WTD3aloCyCq8moxoNpD5xOQRXe71zWIlUfeE8ZfOUitcMExMGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNDOzeLd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNDOzeLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783317008; x=1814853008;
  h=date:from:to:cc:subject:message-id;
  bh=e1mqSY1OWoXUUQVXMb/oRTZ22WTG8O0CGqI+E2NO+Fs=;
  b=RNDOzeLdgc2TNh67ywFHHels3rtKRbFREqdRcF58voSC4Sl7UhCMYQcS
   PnykBq7+fXvlSTcQvJOXk1tsWkKbuARGu8tZQRvlMZ8ECws2rSBLZlWdQ
   XcwaUACHlOgA0Xopl6O1GEYxn7G0ltxXCxPpH0kJoul+ETICdXyeydLuP
   2F5dmshDaYoYvMAS/hlC+G3vto23BxXiaY5WzHHI5vwPpiEwi028alL84
   3OaWn8iGTyUPyLIs/ICdcN6RcDLhH+RAsMW8x8Cquugne6j4i92A77POe
   uF7m5/usmKpG6d+QuWDvUgs++uneS4ijpaMam8jqJg01UKhXFQ6Yyk/FS
   w==;
X-CSE-ConnectionGUID: jOWj8Ap7RYGKLyKXvdsoeA==
X-CSE-MsgGUID: 4VzaVOU4TMO9rqbCFwPS3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95318388"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95318388"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:50:08 -0700
X-CSE-ConnectionGUID: beSe5hoeQQ2MH354CLwhRA==
X-CSE-MsgGUID: IvNc8/6ITQOtjGB3FCzfiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="250945393"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2026 22:50:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgcDU-00000000E71-17Mk;
	Mon, 06 Jul 2026 05:50:04 +0000
Date: Mon, 06 Jul 2026 13:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ath:pending 6/8] ERROR: modpost: __ex_table+0x2670
 references non-executable section '.debug_abbrev'
Message-ID: <202607061342.7idrl3mm-lkp@intel.com>
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
CC: Jeff Johnson <jjohnson@kernel.org>
CC: ath12k@lists.infradead.org
TO: Dmitry Morgun <d.morgun@ispras.ru>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
CC: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
head:   1d5283626b8f083b88ab62107a0b506fa49b816f
commit: 84e14bfa51d8771ddc679356d792798a0e64c99d [6/8] wifi: ath11k: fix potential buffer underflow in ath11k_hal_rx_msdu_list_get()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-002-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061342.7idrl3mm-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061342.7idrl3mm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607061342.7idrl3mm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x2520 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2524 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2524 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x252c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x252c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2530 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2530 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2538 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2538 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x253c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x253c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2544 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2544 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2548 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2548 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2550 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2550 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2554 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2554 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x255c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x255c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2560 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2560 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2568 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2568 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x256c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x256c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2574 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2574 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2578 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2578 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2580 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2580 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2584 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2584 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x258c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x258c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2590 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2590 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2598 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2598 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x259c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x259c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2604 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2604 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2608 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2608 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2610 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2610 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2614 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x261c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x261c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2620 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2620 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2628 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2628 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x262c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x262c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2634 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2634 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2638 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2640 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2640 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2644 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x264c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x264c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2650 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2650 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2670 (section: __ex_table) -> $d (section: .debug_abbrev)
>> ERROR: modpost: __ex_table+0x2670 references non-executable section '.debug_abbrev'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2674 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x2674 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x267c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x267c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2680 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2688 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2688 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x268c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x268c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2694 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2694 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2698 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2700 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2700 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2704 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2704 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x270c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x270c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2710 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2710 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2718 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2718 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x271c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x271c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2724 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2724 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2728 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2730 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2730 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2734 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2734 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x273c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x273c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2740 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2740 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2748 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2748 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x274c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x274c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2754 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2754 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2758 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2760 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2760 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2764 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x276c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x276c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2770 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2778 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2778 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x277c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x277c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2784 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2784 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2788 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2788 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2790 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2790 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2794 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2794 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x279c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x279c references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
