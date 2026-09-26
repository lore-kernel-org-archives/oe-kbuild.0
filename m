Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871DE346FBC
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 12:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790424191; cv=none; b=E9nglGgw5gUhm+SBdv1TYxnv8vQQhxOlSTF0tp3m0MTBloVw8/mqA3DBO/3XA0KK+/FlyA517HtbLNUiIrvCq7dxjpWJ4vRATnNfXEk5z8EThwgz/2F/CspZBgl4016i+YBliE0LQ4lhhvGBqjaimINoQ/23EupDoOGLSpKXzZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790424191; c=relaxed/simple;
	bh=/eGilaz1tyMhTTZFuLe7Z8edHEslXiFiPoOoCCXZqZg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jxZKi9lO/SpTyvdUkReLUIibB6glePRfyNd0SD9sJIYB3B+IYSSNsbc1hhqWdbPt1n5Y0MzjcwxCbSzkLqYPy4+KC95h+P5c1VgellDPjMTnDms8WY8LlVSDsZETkJ42/kJV4vxo/JGV68nIaHRlAEPLZEIumaYVVIOz9p0MmBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngL2YKjx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngL2YKjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790424187; x=1821960187;
  h=date:from:to:cc:subject:message-id;
  bh=/eGilaz1tyMhTTZFuLe7Z8edHEslXiFiPoOoCCXZqZg=;
  b=ngL2YKjxpQmZVPXKz9Mk2qIT8TPsg7pzc7MLdRxfxgS6HM+qXHupDae0
   1EOZSITWCMygReigr3TSIq4heXkxbB2kXjthcL/RGmSfnam798yl4FTDI
   IhGRBaeVo0/E1ToY4gFSOxGe7skGhHfdV9WAXx5OqQ6fhwG1A3gMq5G/R
   uwVDqTPLU2/N8oLK6UyeNQwezlmgmS3coEnRd0I6snUixeXYkv8WTg3Cm
   7gd345Kt0LzwAtWXD3MSXEVggCTjPZBQvGgpOHIBmT7bUmnr/zwQb57VI
   LM6SZMUvZV3y4ZN2jgdAC8ayfZ7XOrUAgNgsGbczXJDlTtRYdyPAR8QyQ
   w==;
X-CSE-ConnectionGUID: wt2Uglb9RgOuSjQ5ucvUjQ==
X-CSE-MsgGUID: ABhsHD95RF2y3LUMpaAYjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91293274"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="91293274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 05:03:06 -0700
X-CSE-ConnectionGUID: G9Har/fsTdGFdbY8aPHyqg==
X-CSE-MsgGUID: ShBsVZYuQTa9hYoPuKfCOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="282631371"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2026 05:03:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAR7P-00000000LmH-0YIU;
	Sat, 26 Sep 2026 12:03:03 +0000
Date: Sat, 26 Sep 2026 20:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6692/10910] ERROR: modpost:
 __ex_table+0x18d8 references non-executable section '.data.rel.local'
Message-ID: <202609261944.h6Ey9ZPR-lkp@intel.com>
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
TO: Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Zhiguo Niu <zhiguo.niu@unisoc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: cc46c2e9336b5b43eabbb90d4217168b0512900a [6692/10910] f2fs: cache: introduce tracepoints
:::::: branch date: 19 hours ago
:::::: commit date: 8 days ago
config: riscv-randconfig-1001-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261944.h6Ey9ZPR-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261944.h6Ey9ZPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609261944.h6Ey9ZPR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1704 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .LASF4144 (section: .debug_str)
ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1710 (section: __ex_table) -> .LASF4146 (section: .debug_str)
ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1714 (section: __ex_table) -> .LASF4148 (section: .debug_str)
ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x171c (section: __ex_table) -> .LASF4150 (section: .debug_str)
ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .LASF4152 (section: .debug_str)
ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1728 (section: __ex_table) -> .LASF4154 (section: .debug_str)
ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x172c (section: __ex_table) -> .LASF4156 (section: .debug_str)
ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1734 (section: __ex_table) -> .LASF810 (section: .debug_str)
ERROR: modpost: __ex_table+0x1734 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .LASF812 (section: .debug_str)
ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1740 (section: __ex_table) -> .LASF814 (section: .debug_str)
ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1744 (section: __ex_table) -> .LASF816 (section: .debug_str)
ERROR: modpost: __ex_table+0x1744 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x174c (section: __ex_table) -> .LASF818 (section: .debug_str)
ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .LASF816 (section: .debug_str)
ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .LASF821 (section: .debug_str)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .LASF823 (section: .debug_str)
ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .LASF825 (section: .debug_str)
ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .LASF816 (section: .debug_str)
ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1770 (section: __ex_table) -> .LASF828 (section: .debug_str)
ERROR: modpost: __ex_table+0x1770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1774 (section: __ex_table) -> .LASF830 (section: .debug_str)
ERROR: modpost: __ex_table+0x1774 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x177c (section: __ex_table) -> .LASF832 (section: .debug_str)
ERROR: modpost: __ex_table+0x177c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1780 (section: __ex_table) -> .LASF834 (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LASF2206 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .LASF2208 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LASF2210 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .LASF2212 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .LASF2214 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .LASF2216 (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .LASF2218 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .LASF2220 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LASF2222 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .LASF2181 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17dc (section: __ex_table) -> .LASF2225 (section: .debug_str)
ERROR: modpost: __ex_table+0x17dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e0 (section: __ex_table) -> .LASF2227 (section: .debug_str)
ERROR: modpost: __ex_table+0x17e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e8 (section: __ex_table) -> .LASF2229 (section: .debug_str)
ERROR: modpost: __ex_table+0x17e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ec (section: __ex_table) -> .LASF2181 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f4 (section: __ex_table) -> .LASF2232 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .LASF2234 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .LASF5824 (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .LASF5826 (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1878 (section: __ex_table) -> .LASF2022 (section: .debug_str)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x187c (section: __ex_table) -> .LASF2024 (section: .debug_str)
ERROR: modpost: __ex_table+0x187c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1884 (section: __ex_table) -> .LASF2026 (section: .debug_str)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1888 (section: __ex_table) -> .LASF2028 (section: .debug_str)
ERROR: modpost: __ex_table+0x1888 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1890 (section: __ex_table) -> .LASF2030 (section: .debug_str)
ERROR: modpost: __ex_table+0x1890 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1894 (section: __ex_table) -> .LASF2028 (section: .debug_str)
ERROR: modpost: __ex_table+0x1894 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x189c (section: __ex_table) -> .LASF39 (section: .debug_str)
ERROR: modpost: __ex_table+0x189c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a8 (section: __ex_table) -> .LASF2650 (section: .debug_str)
ERROR: modpost: __ex_table+0x18a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18ac (section: __ex_table) -> .LASF2652 (section: .debug_str)
ERROR: modpost: __ex_table+0x18ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b8 (section: __ex_table) -> .LLRL1881 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x18b8 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d8 (section: __ex_table) -> trace_event_fields_ext4_load_inode (section: .data.rel.local)
>> ERROR: modpost: __ex_table+0x18d8 references non-executable section '.data.rel.local'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18dc (section: __ex_table) -> trace_event_fields_ext4__map_blocks_exit (section: .data.rel.local)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.data.rel.local'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .LLST196 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: __ex_table) -> .LASF4082 (section: .debug_str)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: __ex_table) -> .LLST174 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1974 (section: __ex_table) -> .LLST177 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1974 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1980 (section: __ex_table) -> .LLST179 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1980 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1984 (section: __ex_table) -> .LLST181 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1984 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: __ex_table) -> .LLST185 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> .LASF1274 (section: .debug_str)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> .LASF1276 (section: .debug_str)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19bc (section: __ex_table) -> .LASF1278 (section: .debug_str)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> .LASF1276 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LASF1877 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LASF1879 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .LASF1881 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF1687 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> .LASF2572 (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> .LASF2574 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> .LASF2576 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> .LASF2578 (section: .debug_str)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> .LASF2580 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> .LASF2582 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> .LASF2584 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF2536 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> .LASF2587 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> .LASF2589 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> .LASF2591 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: __ex_table) -> .LASF2536 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> .LASF3119 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> .LASF3121 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> .LASF3123 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: __ex_table) -> .LASF2944 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: __ex_table) -> .LASF3126 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a50 (section: __ex_table) -> .LASF3128 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a58 (section: __ex_table) -> .LASF3130 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a5c (section: __ex_table) -> .LASF3132 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a64 (section: __ex_table) -> .LASF3134 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a68 (section: __ex_table) -> .LASF2944 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a70 (section: __ex_table) -> .LASF3137 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: __ex_table) -> .LASF2944 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a80 (section: __ex_table) -> __UNIQUE_ID_ddebug_522 (section: __dyndbg)
ERROR: modpost: __ex_table+0x1a80 references non-executable section '__dyndbg'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a8c (section: __ex_table) -> __UNIQUE_ID_ddebug_520 (section: __dyndbg)
ERROR: modpost: __ex_table+0x1a8c references non-executable section '__dyndbg'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a94 (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x1a94 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a98 (section: __ex_table) -> .LC1 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1a98 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> __UNIQUE_ID_ddebug_522 (section: __dyndbg)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '__dyndbg'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab0 (section: __ex_table) -> __UNIQUE_ID_ddebug_522 (section: __dyndbg)
ERROR: modpost: __ex_table+0x1ab0 references non-executable section '__dyndbg'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> .LASF3650 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> .LASF3620 (section: .debug_str)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> .LASF3653 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> .LASF3655 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
