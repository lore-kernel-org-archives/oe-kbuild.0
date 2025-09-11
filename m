Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB0F4AEE2
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 03:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757560361; cv=none; b=BnKaWtmGJZxO3BjivfFMuy1M1aVM6nNIrr9PlJLGTajqJl4pSGa8Lan9IPifwnQ297/DxY3kpeWIqk7iWoC94b8Q3It/or+ao2Swb+R1N4Bf7AJTIOigylDXZgYfF/j4Tjcc4EkAez0uwzE+x8LvIyzY0BJMirLjT4UhF8TicRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757560361; c=relaxed/simple;
	bh=5Wf4K86/kUnbsFZi2qhrF6NUp2F6X1S0gHLgZAIhBE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WvCHsmW2wUh47dIclmesaBJYLVBwJkGAahi0HluoizMCMA2v8RgJlp+8T85BbbbUS6xauX59Ft17g4NcRdf9YOZkc8Qdo2GKt6LhmMFZCESzwRQ3x8slROAhMSdqnGBTHbI6Wz9M8faeKmRBVuZ2bAb5aPUNILKwZWD6egFBf6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATwbhm7q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATwbhm7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757560359; x=1789096359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Wf4K86/kUnbsFZi2qhrF6NUp2F6X1S0gHLgZAIhBE0=;
  b=ATwbhm7qbIZIdCUwKRuFsZ/mAASjchKq+ngKr8S5PTP25JOQuK712wfU
   I+IEMr9Mz5goXeGcTKUFvAX37ryb0OZ3Vd8SHwT5INYY0lIkrNpDR4pCO
   LFQBYI1artQchVuuAdVOYNZFuVfvajSS49y973TGAm00rT/DgXzVu6Tvf
   U1sUEzn+182dFZ7TUj7S4STHpo0BYpgVFAc29naR6px6iqkhh0WLEVYqB
   hhcV+CYs3DsMTS06Ewh9Sj4QGebyqXBFzXdpbbONTSshTG+6CfNSlnnna
   zWqZ38fD75uDbHgX5RnAp/mV1EKj5nKnaqeQviBUZNmuI7rA8Ag/i58EG
   w==;
X-CSE-ConnectionGUID: 3/kvcfvHQDCCf51cubhPDw==
X-CSE-MsgGUID: Qcd/+HowQKqwhOPL9I75Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77491477"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="77491477"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 20:12:38 -0700
X-CSE-ConnectionGUID: TZHYoRMPRCKiQTOxx0yPAg==
X-CSE-MsgGUID: 1lz58ph9RESNtSoISsmG8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="178767054"
Received: from lkp-server01.sh.intel.com (HELO 682ec36e968c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2025 20:12:37 -0700
Received: from kbuild by 682ec36e968c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwXje-00004P-2d;
	Thu, 11 Sep 2025 03:12:34 +0000
Date: Thu, 11 Sep 2025 11:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bcachefs:bcachefs-testing 396/407] ERROR: modpost:
 __ex_table+0x1834 references non-executable section '.initcall6.init'
Message-ID: <202509111142.E1bzcmzZ-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   34701549f97cb6ad21d1dc10bbc188b08afa133e
commit: 824881ee3d9874b8271fe42219e24fa66836e4de [396/407] mm: shrinker: Add new stats for .to_text()
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
config: riscv-randconfig-002-20250911 (https://download.01.org/0day-ci/archive/20250911/202509111142.E1bzcmzZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509111142.E1bzcmzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509111142.E1bzcmzZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x16d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x16d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x16e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x16e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16ec (section: __ex_table) -> .L0  (section: .debug_ranges)
ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .L__func__.init_held_rtmutex (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1708 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1710 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1714 (section: __ex_table) -> .L0  (section: .debug_ranges)
ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x171c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .L0  (section: .debug_ranges)
ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1728 (section: __ex_table) -> .L0  (section: .debug_ranges)
ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x172c (section: __ex_table) -> .L0  (section: .debug_ranges)
ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1734 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1734 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1740 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1744 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1744 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x174c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x177c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x177c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1780 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1788 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1788 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x178c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x178c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1794 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1794 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1798 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1798 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x180c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x180c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1810 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1810 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1834 (section: __ex_table) -> __initcall__kmod_fan53555__549_791_fan53555_regulator_driver_init6 (section: .initcall6.init)
>> ERROR: modpost: __ex_table+0x1834 references non-executable section '.initcall6.init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x183c (section: __ex_table) -> fan53555_id (section: .rodata)
ERROR: modpost: __ex_table+0x183c references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1840 (section: __ex_table) -> $d (section: .debug_loc)
ERROR: modpost: __ex_table+0x1840 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1848 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1848 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x184c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x184c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1854 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1854 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1858 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1858 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1860 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1860 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1864 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1864 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x186c (section: __ex_table) -> .L0  (section: .debug_frame)
ERROR: modpost: __ex_table+0x186c references non-executable section '.debug_frame'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1888 (section: __ex_table) -> pv88060_regulator_info (section: .rodata)
ERROR: modpost: __ex_table+0x1888 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x18fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1900 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1900 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1908 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1908 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x190c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x190c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1914 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1914 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1918 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1918 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1920 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1920 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x192c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x192c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1930 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1930 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1938 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1938 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x193c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x193c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1944 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1944 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1948 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1948 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1950 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1950 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x195c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x195c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1960 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1960 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x196c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x196c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1974 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1974 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1980 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1980 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1984 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1984 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x198c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x198c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x199c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x199c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
