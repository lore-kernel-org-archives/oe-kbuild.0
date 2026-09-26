Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D79B2264DB
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 04:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396748; cv=none; b=kFoKij8Ib7iQJ1EisE/NkDOSlISR9+CCDhVV+wbSlPwltXkYYJPKPKcuBTZZhygvczcsMaQ/AeWx53fxlmgbAHtjwkTnmKdwP7qxhwUCFbSDeTTO0HAqlkyrjKFV1kXHqZM6MNLT4btV3DM4JH8gg/WNJb4FamkSCZXScaUf5+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396748; c=relaxed/simple;
	bh=ecsI6I7XhN3rGkW2wSrpA0fAajRi8H9Vzl7xzC14fdQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=at++TOOjQci6wA5S3lZ9SBUqvH9FO1YpNchfFdTu6pk4ZjLj1G1WeroIM0RdILdt6u4vIAfAnd4QNr3i8YXFewW2jHoSUSTv2FTMafM1Hg6PqmYGYUUuIWtAsl8hCg5H+eF1J/bSLEEzMAxHEPFz8MI3D4Er/Mr6v62RwcKKxg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMaOfvfY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMaOfvfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790396746; x=1821932746;
  h=date:from:to:cc:subject:message-id;
  bh=ecsI6I7XhN3rGkW2wSrpA0fAajRi8H9Vzl7xzC14fdQ=;
  b=SMaOfvfYYv4HOqPp9wKbxAzRIU5eL649iTxx2VoZrguc4QF97Uz0a8P7
   BAbSBXZQZvLlG8gkh7u3gyc9x2YjnsorTkDt52OxifSUFc/J/1PemE9yI
   ywhQw5yhqK2CS9CPKKX1e7ft93bEqmm5frH0axDIJRO9NFcdt9H4X7Lm8
   dzXp1BOnqUUfAtzG7tNyHhJZ9ubUDMOmbVpK3dhh5IC21BfzRg9GANhcn
   hVQ6Y0ZFk6L9wRhpF0ekLjNcbnUlaTCTDMwLNOuENo6aW6gT/T+KE95ro
   ZVKiCMsLGCOOUon33Pf1+y3PuC23sCMhInkoPcNs14y2SKOLlNebFzkNn
   w==;
X-CSE-ConnectionGUID: /lFxWCo2RGCGYjmZIMElXg==
X-CSE-MsgGUID: sy4Nj3/tT3GS+so6MvbDPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="78741249"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="78741249"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 21:25:46 -0700
X-CSE-ConnectionGUID: xGkqEnOYR2Wp1+zBf3y9Ew==
X-CSE-MsgGUID: QncMSlN5T3SEmiTPIzBaEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="272292491"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2026 21:25:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAJyo-00000000LVd-1w2Q;
	Sat, 26 Sep 2026 04:25:42 +0000
Date: Sat, 26 Sep 2026 12:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1914/8413] ERROR: modpost:
 __ex_table+0x18e4 references non-executable section '.rodata'
Message-ID: <202609261234.1wM8Hvti-lkp@intel.com>
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
TO: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: b74dc82a3b289b872eb4ceaa2a3528e9d9b53931 [1914/8413] lkdtm: use kmalloc() instead of __get_free_page
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-1001-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261234.1wM8Hvti-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261234.1wM8Hvti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609261234.1wM8Hvti-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .LASF1036 (section: .debug_str)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .LASF1038 (section: .debug_str)
ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .LASF1040 (section: .debug_str)
ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .LASF1031 (section: .debug_str)
ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1770 (section: __ex_table) -> .LASF1043 (section: .debug_str)
ERROR: modpost: __ex_table+0x1770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1774 (section: __ex_table) -> .LASF1045 (section: .debug_str)
ERROR: modpost: __ex_table+0x1774 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x177c (section: __ex_table) -> .LASF1047 (section: .debug_str)
ERROR: modpost: __ex_table+0x177c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1780 (section: __ex_table) -> .LASF1049 (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1788 (section: __ex_table) -> .LASF2132 (section: .debug_str)
ERROR: modpost: __ex_table+0x1788 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x178c (section: __ex_table) -> .LASF2134 (section: .debug_str)
ERROR: modpost: __ex_table+0x178c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1794 (section: __ex_table) -> .LASF2136 (section: .debug_str)
ERROR: modpost: __ex_table+0x1794 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1798 (section: __ex_table) -> .LASF2138 (section: .debug_str)
ERROR: modpost: __ex_table+0x1798 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LLRL589 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LLST592 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LLST601 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .LASF5365 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e0 (section: __ex_table) -> .LLST605 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17e0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ec (section: __ex_table) -> .LASF5365 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .LLST608 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .LASF3841 (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .LASF3843 (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x180c (section: __ex_table) -> .LASF401 (section: .debug_str)
ERROR: modpost: __ex_table+0x180c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1810 (section: __ex_table) -> .LASF403 (section: .debug_str)
ERROR: modpost: __ex_table+0x1810 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1818 (section: __ex_table) -> .LASF405 (section: .debug_str)
ERROR: modpost: __ex_table+0x1818 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x181c (section: __ex_table) -> .LASF407 (section: .debug_str)
ERROR: modpost: __ex_table+0x181c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1824 (section: __ex_table) -> .LASF409 (section: .debug_str)
ERROR: modpost: __ex_table+0x1824 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1828 (section: __ex_table) -> .LASF403 (section: .debug_str)
ERROR: modpost: __ex_table+0x1828 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1830 (section: __ex_table) -> .LASF412 (section: .debug_str)
ERROR: modpost: __ex_table+0x1830 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1834 (section: __ex_table) -> .LASF415 (section: .debug_str)
ERROR: modpost: __ex_table+0x1834 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x183c (section: __ex_table) -> .LASF417 (section: .debug_str)
ERROR: modpost: __ex_table+0x183c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1840 (section: __ex_table) -> .LASF403 (section: .debug_str)
ERROR: modpost: __ex_table+0x1840 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1848 (section: __ex_table) -> .LASF617 (section: .debug_str)
ERROR: modpost: __ex_table+0x1848 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x184c (section: __ex_table) -> .LASF421 (section: .debug_str)
ERROR: modpost: __ex_table+0x184c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1854 (section: __ex_table) -> .LASF423 (section: .debug_str)
ERROR: modpost: __ex_table+0x1854 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1858 (section: __ex_table) -> .LASF421 (section: .debug_str)
ERROR: modpost: __ex_table+0x1858 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1860 (section: __ex_table) -> .LASF3033 (section: .debug_str)
ERROR: modpost: __ex_table+0x1860 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1864 (section: __ex_table) -> .LASF2754 (section: .debug_str)
ERROR: modpost: __ex_table+0x1864 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1878 (section: __ex_table) -> .LASF2850 (section: .debug_str)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x187c (section: __ex_table) -> .LASF2852 (section: .debug_str)
ERROR: modpost: __ex_table+0x187c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1884 (section: __ex_table) -> .LASF2854 (section: .debug_str)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1888 (section: __ex_table) -> .LASF2856 (section: .debug_str)
ERROR: modpost: __ex_table+0x1888 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1890 (section: __ex_table) -> .LASF2858 (section: .debug_str)
ERROR: modpost: __ex_table+0x1890 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1894 (section: __ex_table) -> .LASF2856 (section: .debug_str)
ERROR: modpost: __ex_table+0x1894 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x189c (section: __ex_table) -> .LLST821 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x189c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a0 (section: __ex_table) -> .LLST483 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x18a0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a8 (section: __ex_table) -> .LASF98 (section: .debug_str)
ERROR: modpost: __ex_table+0x18a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18ac (section: __ex_table) -> .LASF100 (section: .debug_str)
ERROR: modpost: __ex_table+0x18ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b4 (section: __ex_table) -> .LASF1301 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b8 (section: __ex_table) -> .LASF1303 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e4 (section: __ex_table) -> __func__ (section: .rodata)
>> ERROR: modpost: __ex_table+0x18e4 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e8 (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f0 (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18fc (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x18fc references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1908 (section: __ex_table) -> __already_done (section: .data..once)
ERROR: modpost: __ex_table+0x1908 references non-executable section '.data..once'
WARNING: modpost: vmlinux: section mismatch in reference: 0x190c (section: __ex_table) -> __already_done (section: .data..once)
ERROR: modpost: __ex_table+0x190c references non-executable section '.data..once'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1914 (section: __ex_table) -> __already_done (section: .data..once)
ERROR: modpost: __ex_table+0x1914 references non-executable section '.data..once'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1920 (section: __ex_table) -> .LLST91 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1920 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .LASF5060 (section: .debug_str)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1930 (section: __ex_table) -> .LASF5069 (section: .debug_str)
ERROR: modpost: __ex_table+0x1930 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x193c (section: __ex_table) -> .LASF5069 (section: .debug_str)
ERROR: modpost: __ex_table+0x193c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1944 (section: __ex_table) -> .LLST76 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1944 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1948 (section: __ex_table) -> .LLST78 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1948 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1950 (section: __ex_table) -> .LLST80 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1950 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: __ex_table) -> .LLST82 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1960 (section: __ex_table) -> .LASF5069 (section: .debug_str)
ERROR: modpost: __ex_table+0x1960 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: __ex_table) -> .LLST86 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x196c (section: __ex_table) -> .LASF5069 (section: .debug_str)
ERROR: modpost: __ex_table+0x196c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: __ex_table) -> .LASF5069 (section: .debug_str)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x198c (section: __ex_table) -> .LLST44 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x198c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> .LLST45 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: __ex_table) -> .LLST46 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x199c (section: __ex_table) -> .LASF5069 (section: .debug_str)
ERROR: modpost: __ex_table+0x199c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a4 (section: __ex_table) -> .LLRL48 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x19a4 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a8 (section: __ex_table) -> .LASF5069 (section: .debug_str)
ERROR: modpost: __ex_table+0x19a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> .LASF1146 (section: .debug_str)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> .LASF1148 (section: .debug_str)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19bc (section: __ex_table) -> .LASF1150 (section: .debug_str)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> .LASF1148 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LASF1049 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LASF1051 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .LASF1053 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF860 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> .LASF3406 (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> .LASF3408 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> .LASF3410 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> .LASF3412 (section: .debug_str)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> .LASF3414 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> .LASF3416 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> .LASF3418 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF3370 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> .LASF3421 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> .LASF3423 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> .LASF3425 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: __ex_table) -> .LASF3370 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> .LASF3544 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> .LASF3546 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> .LASF3548 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: __ex_table) -> .LASF3369 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: __ex_table) -> .LASF3551 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a50 (section: __ex_table) -> .LASF3553 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a50 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
