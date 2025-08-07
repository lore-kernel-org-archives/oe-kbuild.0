Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E131400C
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754575902; cv=none; b=lbcBfwMNHqnUgKUQeMdVvw+Yy+9Fd+oC3BXclERdGoqy2fK5vuLHh/GWPW3mtutzm5xDAqqgDhM1FlVs4MJqhZnjJn+y/qq4SmWVC+TB5sGc+HANXgruL4tc7flSGIxN9he4m0sVYMGyl/EOi9/WfnYX3gFjerxsKeyCPjxTKAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754575902; c=relaxed/simple;
	bh=v4uQMsqfiwFD8e2uILUJBpH4BH/r+SMjYpqpu77bJ1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+ZRc6zmxqua2ctFW+EFNMocdqiyQxvKuH1PQrvibREb9iAPptxKY7mbxYdB4/0TrHEvMz4pww30Kz6eJy9QReuTyZXGZoT7G0IHIugeuwIW7nioieqCJnxJlgswwoP1OcIVoL8oICjPyd4rSxqgFy0uaqAPP7o5q8oeVttuXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EL3savbQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EL3savbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754575901; x=1786111901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v4uQMsqfiwFD8e2uILUJBpH4BH/r+SMjYpqpu77bJ1w=;
  b=EL3savbQbtD9FMgC6AQvx5UKyRbNuvqatfS6Zx1sg3F9kk3Vig2rMh1t
   zA3Af6lEiKEhQjR/q4jalVuRKv9QBMoRYkEYVlrSPD3UbjjALKLG6T09w
   Ctf18z5Xv5ycyRQI9bLwRUJ5qaK0Qb6cKd7WBI/n6PwfBNI6Ywo3lpxWv
   rfd4lDEz5iZ/BgCHF9U46pYIa+76MNEatykHVB1yXL3VBnujdhQSd6PyG
   ZZhHc5zfQyf0PKLuFRJooKFaqvV+Dl6olG8O4yqA/uu8W0kTCGGzrujhh
   uXNawA3blD5iXWfkEV/zeGGN9neUBY+qkUsBMhGEYrJQZiq401twZ1Ong
   Q==;
X-CSE-ConnectionGUID: F4CoU2frSK6VVgvAq8bwUA==
X-CSE-MsgGUID: RycvU+9DRqqU5xb27Wa6mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68365619"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68365619"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 07:11:41 -0700
X-CSE-ConnectionGUID: Ye4VcccCReScvzQ2dlxTMw==
X-CSE-MsgGUID: M/ovF1ODQW+SdlSJ/QJrcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165080264"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2025 07:11:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk1LE-0002sQ-1x;
	Thu, 07 Aug 2025 14:11:36 +0000
Date: Thu, 7 Aug 2025 22:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ceph-client:tls-tracing-only 1/14] ERROR: modpost:
 __ex_table+0x1788 references non-executable section
 '.rodata.__do_fault.str1.4'
Message-ID: <202508072223.o1pyMfQB-lkp@intel.com>
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
CC: ceph-devel@vger.kernel.org
TO: Alex Markuze <amarkuze@redhat.com>

tree:   https://github.com/ceph/ceph-client.git tls-tracing-only
head:   ffad14ce035a047cbfda2d38f7ae37b0767de136
commit: 0fb3ed82a35731d9ebbfc731637f6ecf7341c3ff [1/14] TLS update
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072223.o1pyMfQB-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072223.o1pyMfQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072223.o1pyMfQB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1480 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1488 (section: __ex_table) -> .LASF512 (section: .debug_str)
ERROR: modpost: __ex_table+0x1488 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x148c (section: __ex_table) -> .LASF514 (section: .debug_str)
ERROR: modpost: __ex_table+0x148c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1494 (section: __ex_table) -> .LASF516 (section: .debug_str)
ERROR: modpost: __ex_table+0x1494 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1498 (section: __ex_table) -> .LASF518 (section: .debug_str)
ERROR: modpost: __ex_table+0x1498 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a0 (section: __ex_table) -> .LASF520 (section: .debug_str)
ERROR: modpost: __ex_table+0x14a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a4 (section: __ex_table) -> .LASF522 (section: .debug_str)
ERROR: modpost: __ex_table+0x14a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ac (section: __ex_table) -> .LASF524 (section: .debug_str)
ERROR: modpost: __ex_table+0x14ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b0 (section: __ex_table) -> .LASF526 (section: .debug_str)
ERROR: modpost: __ex_table+0x14b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b8 (section: __ex_table) -> .LASF528 (section: .debug_str)
ERROR: modpost: __ex_table+0x14b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14bc (section: __ex_table) -> .LASF530 (section: .debug_str)
ERROR: modpost: __ex_table+0x14bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c4 (section: __ex_table) -> .LASF532 (section: .debug_str)
ERROR: modpost: __ex_table+0x14c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c8 (section: __ex_table) -> .LASF534 (section: .debug_str)
ERROR: modpost: __ex_table+0x14c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d0 (section: __ex_table) -> .LASF536 (section: .debug_str)
ERROR: modpost: __ex_table+0x14d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d4 (section: __ex_table) -> .LASF538 (section: .debug_str)
ERROR: modpost: __ex_table+0x14d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14dc (section: __ex_table) -> .LASF540 (section: .debug_str)
ERROR: modpost: __ex_table+0x14dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e0 (section: __ex_table) -> .LASF2663 (section: .debug_str)
ERROR: modpost: __ex_table+0x14e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e8 (section: __ex_table) -> .LASF543 (section: .debug_str)
ERROR: modpost: __ex_table+0x14e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ec (section: __ex_table) -> .LASF545 (section: .debug_str)
ERROR: modpost: __ex_table+0x14ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f4 (section: __ex_table) -> .LASF547 (section: .debug_str)
ERROR: modpost: __ex_table+0x14f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f8 (section: __ex_table) -> .LASF549 (section: .debug_str)
ERROR: modpost: __ex_table+0x14f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1500 (section: __ex_table) -> .LASF551 (section: .debug_str)
ERROR: modpost: __ex_table+0x1500 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1504 (section: __ex_table) -> .LASF553 (section: .debug_str)
ERROR: modpost: __ex_table+0x1504 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x150c (section: __ex_table) -> .LASF834 (section: .debug_str)
ERROR: modpost: __ex_table+0x150c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1510 (section: __ex_table) -> .LASF836 (section: .debug_str)
ERROR: modpost: __ex_table+0x1510 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1518 (section: __ex_table) -> .LASF2407 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1518 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x151c (section: __ex_table) -> .LASF2409 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x151c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1528 (section: __ex_table) -> .LASF2409 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1528 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x153c (section: __ex_table) -> .LASF8753 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x153c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1540 (section: __ex_table) -> .LASF8755 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1540 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> .LASF8757 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1548 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> .LASF8759 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x154c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> .LASF8761 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1554 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> .LASF8763 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1558 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> .LASF8765 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1560 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> .LASF8767 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1564 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> .LASF8769 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x156c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> .LASF8771 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1570 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15fc (section: __ex_table) -> .LASF2066 (section: .debug_str)
ERROR: modpost: __ex_table+0x15fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1600 (section: __ex_table) -> .LASF2068 (section: .debug_str)
ERROR: modpost: __ex_table+0x1600 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1608 (section: __ex_table) -> .LASF2070 (section: .debug_str)
ERROR: modpost: __ex_table+0x1608 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x160c (section: __ex_table) -> .LASF2072 (section: .debug_str)
ERROR: modpost: __ex_table+0x160c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1614 (section: __ex_table) -> .LASF2074 (section: .debug_str)
ERROR: modpost: __ex_table+0x1614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1618 (section: __ex_table) -> .LASF2076 (section: .debug_str)
ERROR: modpost: __ex_table+0x1618 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1620 (section: __ex_table) -> .LASF2078 (section: .debug_str)
ERROR: modpost: __ex_table+0x1620 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1624 (section: __ex_table) -> .LASF2080 (section: .debug_str)
ERROR: modpost: __ex_table+0x1624 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x162c (section: __ex_table) -> .LASF2580 (section: .debug_str)
ERROR: modpost: __ex_table+0x162c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1630 (section: __ex_table) -> .LASF2582 (section: .debug_str)
ERROR: modpost: __ex_table+0x1630 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .LASF2584 (section: .debug_str)
ERROR: modpost: __ex_table+0x1638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x163c (section: __ex_table) -> .LASF2586 (section: .debug_str)
ERROR: modpost: __ex_table+0x163c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1788 (section: __ex_table) -> .LC10 (section: .rodata.__do_fault.str1.4)
>> ERROR: modpost: __ex_table+0x1788 references non-executable section '.rodata.__do_fault.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LASF3469 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17dc (section: __ex_table) -> .LLST5136 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17dc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e0 (section: __ex_table) -> .LLST5137 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17e0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e8 (section: __ex_table) -> .LLST5138 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17e8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ec (section: __ex_table) -> .LLST5139 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17ec references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f4 (section: __ex_table) -> .LLST5140 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17f4 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .LLST5141 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .LLST5142 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x180c (section: __ex_table) -> .LLST5144 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x180c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1810 (section: __ex_table) -> .LLST5145 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1810 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x181c (section: __ex_table) -> .LLST5147 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x181c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1824 (section: __ex_table) -> .LLST5148 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1824 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1834 (section: __ex_table) -> .LVUS5149 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1834 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1840 (section: __ex_table) -> .LLST5150 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1840 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1854 (section: __ex_table) -> .LVUS5151 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1854 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1858 (section: __ex_table) -> .LVUS5152 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1858 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1884 (section: __ex_table) -> .LLST1256 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1894 (section: __ex_table) -> .LVUS1257 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1894 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f4 (section: __ex_table) -> .LLST1258 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1908 (section: __ex_table) -> .LVUS1259 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1908 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .LVUS3703 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1938 (section: __ex_table) -> .LASF2262 (section: .debug_str)
ERROR: modpost: __ex_table+0x1938 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x193c (section: __ex_table) -> .LASF2264 (section: .debug_str)
ERROR: modpost: __ex_table+0x193c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1944 (section: __ex_table) -> .LASF2266 (section: .debug_str)
ERROR: modpost: __ex_table+0x1944 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1948 (section: __ex_table) -> .LASF2268 (section: .debug_str)
ERROR: modpost: __ex_table+0x1948 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1950 (section: __ex_table) -> .LASF2270 (section: .debug_str)
ERROR: modpost: __ex_table+0x1950 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: __ex_table) -> .LASF2272 (section: .debug_str)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x195c (section: __ex_table) -> .LASF2274 (section: .debug_str)
ERROR: modpost: __ex_table+0x195c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1960 (section: __ex_table) -> .LASF2276 (section: .debug_str)
ERROR: modpost: __ex_table+0x1960 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: __ex_table) -> .LASF2356 (section: .debug_str)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x196c (section: __ex_table) -> .LASF2358 (section: .debug_str)
ERROR: modpost: __ex_table+0x196c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1974 (section: __ex_table) -> .LASF2360 (section: .debug_str)
ERROR: modpost: __ex_table+0x1974 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: __ex_table) -> .LASF2362 (section: .debug_str)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .LASF1309 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .LASF1311 (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LASF1313 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LASF1315 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .LASF1317 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF1319 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> .LASF1321 (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> .LASF1323 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> .LASF1325 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> .LASF1327 (section: .debug_str)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> .LASF1329 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> .LASF1331 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> .LASF1333 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF1335 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> .LASF1337 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> .LASF1339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> .LASF1341 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
