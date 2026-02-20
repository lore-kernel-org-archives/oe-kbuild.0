Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FABE32AAD1
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771612656; cv=none; b=WgzAscqUfjF/nBpGSR77Regkj66d9HX9ABAh8yvYsZpkVFmLG1NHkRqvCrK1RMHNt2lNB0jaX56uRqqWilYT5wxTxc7JHjo8tbcAzMIH5Tad0tVdMkUWlEi1u2CuEg4hRBq2k+yA4RE3rtVsOqe5HCQvGyLsg7HqtCiWE8A0/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771612656; c=relaxed/simple;
	bh=NgciHFXmvsJITjaqoNc1aZ8emJgXstU6HrtX4M360xY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PRj982aeBVbHxyFiTkOHqaITxavpAgXcDeDKqHslFCho9m32uCZrbqaSSjN30Y9NSFqsdDb/Ql5m4R/zXtbV8y/QcQjukRgv3GqaUEYsaPhlogIHSl8fAfD77nv+bB77SZGaJosd2wPkC4UZxcAdg80vitTEt3sM12jBshq0axA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etYVS2qo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etYVS2qo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771612651; x=1803148651;
  h=date:from:to:cc:subject:message-id;
  bh=NgciHFXmvsJITjaqoNc1aZ8emJgXstU6HrtX4M360xY=;
  b=etYVS2qoNmHT8rOBu/NdgZn1qkvu+y3m6OQCLmSsUBHbDFIer2MclA8p
   Bqdi5SVOOjL3VhUwimHAWMpZoep1wx70UtllwZuVg1p143SERD4Dx/0n9
   RjDzDaEL9XYk0s6DlUxKh0x/YymzFcIWx0KEQhbcU3Zzbnz48YZ8fxexm
   MS2zQPXQ/FsVl6gOWSiOFq16RjwKcOCij+hKN+ecuyVVpFwHp4Qv/4KKM
   JKcf8SHIy5cFkcjgKhD7xR5XrqzxmVXGnCkEG7Ia1BFdx7FXfyGxFM8LS
   j62ItR9z4REJ8EoagtJ7KMOHLX4Er0PKI8/kO/na+pm0fG1Hd38v76UK4
   g==;
X-CSE-ConnectionGUID: s+exVSFIRP2D9xRFGAqtiA==
X-CSE-MsgGUID: yr0maRgVSAqPTsHTZ5ZTiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84070304"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84070304"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 10:37:26 -0800
X-CSE-ConnectionGUID: oqlRnaiaTAyfpnLnvB8uOw==
X-CSE-MsgGUID: BmHx8SrlSn6kKYgbLmGrjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219924320"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Feb 2026 10:37:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtVNS-000000014No-3g3y;
	Fri, 20 Feb 2026 18:37:22 +0000
Date: Sat, 21 Feb 2026 02:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 78/81] ERROR: modpost: __ex_table+0x1924
 references non-executable section '.data.rel.local..Lubsan_data66'
Message-ID: <202602210207.IgwgqQxa-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
TO: Jiayuan Chen <jiayuan.chen@shopee.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Yosry Ahmed <yosry.ahmed@linux.dev>
CC: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   68777acba791f6c852c9128668ef27a662ab7bf4
commit: 155b35f8c559170900eb3f8314f9f62604b3307c [78/81] mm: zswap: add per-memcg stat for incompressible pages
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: riscv-randconfig-r121-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210207.IgwgqQxa-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210207.IgwgqQxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602210207.IgwgqQxa-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x172c (section: __ex_table) -> .LASF267 (section: .debug_str)
ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1734 (section: __ex_table) -> .LASF275 (section: .debug_str)
ERROR: modpost: __ex_table+0x1734 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .LASF267 (section: .debug_str)
ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1740 (section: __ex_table) -> .LASF278 (section: .debug_str)
ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1744 (section: __ex_table) -> .LASF267 (section: .debug_str)
ERROR: modpost: __ex_table+0x1744 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x174c (section: __ex_table) -> .LASF281 (section: .debug_str)
ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .LASF267 (section: .debug_str)
ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .LASF284 (section: .debug_str)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .LASF286 (section: .debug_str)
ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .LASF288 (section: .debug_str)
ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .LASF290 (section: .debug_str)
ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1770 (section: __ex_table) -> .LASF292 (section: .debug_str)
ERROR: modpost: __ex_table+0x1770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1774 (section: __ex_table) -> .LASF294 (section: .debug_str)
ERROR: modpost: __ex_table+0x1774 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x177c (section: __ex_table) -> .LASF296 (section: .debug_str)
ERROR: modpost: __ex_table+0x177c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1780 (section: __ex_table) -> .LASF298 (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1788 (section: __ex_table) -> .LASF300 (section: .debug_str)
ERROR: modpost: __ex_table+0x1788 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x178c (section: __ex_table) -> .LASF302 (section: .debug_str)
ERROR: modpost: __ex_table+0x178c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1794 (section: __ex_table) -> .LASF6112 (section: .debug_str)
ERROR: modpost: __ex_table+0x1794 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1798 (section: __ex_table) -> .LASF6113 (section: .debug_str)
ERROR: modpost: __ex_table+0x1798 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LLST60 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .LLST61 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LASF6117 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .LLST61 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .LLST61 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .LLST2 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .LLST61 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f4 (section: __ex_table) -> .LASF2510 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .LASF2512 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .LASF2514 (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .LASF2512 (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1818 (section: __ex_table) -> .LASF919 (section: .debug_str)
ERROR: modpost: __ex_table+0x1818 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x181c (section: __ex_table) -> .LASF917 (section: .debug_str)
ERROR: modpost: __ex_table+0x181c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1824 (section: __ex_table) -> .LASF922 (section: .debug_str)
ERROR: modpost: __ex_table+0x1824 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1828 (section: __ex_table) -> .LASF924 (section: .debug_str)
ERROR: modpost: __ex_table+0x1828 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1830 (section: __ex_table) -> .LASF926 (section: .debug_str)
ERROR: modpost: __ex_table+0x1830 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1834 (section: __ex_table) -> .LASF917 (section: .debug_str)
ERROR: modpost: __ex_table+0x1834 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x183c (section: __ex_table) -> .LASF465 (section: .debug_str)
ERROR: modpost: __ex_table+0x183c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1840 (section: __ex_table) -> .LASF463 (section: .debug_str)
ERROR: modpost: __ex_table+0x1840 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1848 (section: __ex_table) -> .LASF1620 (section: .debug_str)
ERROR: modpost: __ex_table+0x1848 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x184c (section: __ex_table) -> .LASF1619 (section: .debug_str)
ERROR: modpost: __ex_table+0x184c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1854 (section: __ex_table) -> .LASF84 (section: .debug_str)
ERROR: modpost: __ex_table+0x1854 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1858 (section: __ex_table) -> .LASF82 (section: .debug_str)
ERROR: modpost: __ex_table+0x1858 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1860 (section: __ex_table) -> .LASF2086 (section: .debug_str)
ERROR: modpost: __ex_table+0x1860 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1864 (section: __ex_table) -> .LASF2084 (section: .debug_str)
ERROR: modpost: __ex_table+0x1864 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b4 (section: __ex_table) -> .LASF246 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b8 (section: __ex_table) -> .LASF248 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18dc (section: __ex_table) -> .LASF5497 (section: .debug_str)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18fc (section: __ex_table) -> .LLST67 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x18fc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x190c (section: __ex_table) -> .LASF5500 (section: .debug_str)
ERROR: modpost: __ex_table+0x190c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .LANCHOR122 (section: .data.rel.local..Lubsan_data66)
>> ERROR: modpost: __ex_table+0x1924 references non-executable section '.data.rel.local..Lubsan_data66'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1930 (section: __ex_table) -> .LANCHOR123 (section: .data.rel.local..Lubsan_data67)
>> ERROR: modpost: __ex_table+0x1930 references non-executable section '.data.rel.local..Lubsan_data67'
WARNING: modpost: vmlinux: section mismatch in reference: 0x193c (section: __ex_table) -> .LANCHOR123 (section: .data.rel.local..Lubsan_data67)
ERROR: modpost: __ex_table+0x193c references non-executable section '.data.rel.local..Lubsan_data67'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1948 (section: __ex_table) -> .LANCHOR123 (section: .data.rel.local..Lubsan_data67)
ERROR: modpost: __ex_table+0x1948 references non-executable section '.data.rel.local..Lubsan_data67'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: __ex_table) -> __loc (section: .data.rel.ro.local.__loc.28)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.data.rel.ro.local.__loc.28'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: __ex_table) -> __loc (section: .data.rel.ro.local.__loc.27)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.data.rel.ro.local.__loc.27'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1974 (section: __ex_table) -> .LASF1337 (section: .debug_str)
ERROR: modpost: __ex_table+0x1974 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: __ex_table) -> .LASF1339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1980 (section: __ex_table) -> .LASF1341 (section: .debug_str)
ERROR: modpost: __ex_table+0x1980 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1984 (section: __ex_table) -> .LASF1343 (section: .debug_str)
ERROR: modpost: __ex_table+0x1984 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x198c (section: __ex_table) -> .LASF1345 (section: .debug_str)
ERROR: modpost: __ex_table+0x198c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> .LASF1347 (section: .debug_str)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: __ex_table) -> .LASF1349 (section: .debug_str)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x199c (section: __ex_table) -> .LASF1351 (section: .debug_str)
ERROR: modpost: __ex_table+0x199c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a4 (section: __ex_table) -> .LASF1353 (section: .debug_str)
ERROR: modpost: __ex_table+0x19a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a8 (section: __ex_table) -> .LASF1355 (section: .debug_str)
ERROR: modpost: __ex_table+0x19a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> .LASF130 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> .LASF129 (section: .debug_str)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> .LASF133 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> .LASF135 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> .LASF137 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF139 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> .LASF141 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> .LASF129 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> .LASF144 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: __ex_table) -> .LASF129 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> .LASF1905 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> .LASF1908 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: __ex_table) -> .LASF1910 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: __ex_table) -> .LASF1912 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a50 (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a94 (section: __ex_table) -> .LASF973 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a98 (section: __ex_table) -> .LASF975 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa0 (section: __ex_table) -> .LASF977 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> .LASF979 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aac (section: __ex_table) -> .LASF981 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab0 (section: __ex_table) -> .LASF983 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> .LASF985 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> .LASF987 (section: .debug_str)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> .LASF989 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> .LASF979 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> .LASF716 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> .LASF715 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> .LASF719 (section: .debug_str)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> .LASF721 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> .LASF723 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> .LASF715 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af4 (section: __ex_table) -> .LASF726 (section: .debug_str)
ERROR: modpost: __ex_table+0x1af4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af8 (section: __ex_table) -> .LASF728 (section: .debug_str)
ERROR: modpost: __ex_table+0x1af8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b00 (section: __ex_table) -> .LASF848 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> .LASF847 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b04 references non-executable section '.debug_str'
--
ERROR: modpost: __ex_table+0x232c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x234c (section: __ex_table) -> .LLRL1176 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x234c references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2358 (section: __ex_table) -> .LLST1179 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x2358 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2364 (section: __ex_table) -> .LLRL1182 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x2364 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2370 (section: __ex_table) -> .LASF2510 (section: .debug_str)
ERROR: modpost: __ex_table+0x2370 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2374 (section: __ex_table) -> .LASF2512 (section: .debug_str)
ERROR: modpost: __ex_table+0x2374 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x237c (section: __ex_table) -> .LASF2514 (section: .debug_str)
ERROR: modpost: __ex_table+0x237c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2380 (section: __ex_table) -> .LASF2512 (section: .debug_str)
ERROR: modpost: __ex_table+0x2380 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2388 (section: __ex_table) -> .LASF2517 (section: .debug_str)
ERROR: modpost: __ex_table+0x2388 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x238c (section: __ex_table) -> .LASF2512 (section: .debug_str)
ERROR: modpost: __ex_table+0x238c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2394 (section: __ex_table) -> .LASF2520 (section: .debug_str)
ERROR: modpost: __ex_table+0x2394 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2398 (section: __ex_table) -> .LASF2512 (section: .debug_str)
ERROR: modpost: __ex_table+0x2398 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e0 (section: __ex_table) -> .LLRL481 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x23e0 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23ec (section: __ex_table) -> .LASF2859 (section: .debug_str)
ERROR: modpost: __ex_table+0x23ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2400 (section: __ex_table) -> .LLST484 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x2400 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2424 (section: __ex_table) -> .LLST487 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x2424 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x243c (section: __ex_table) -> .LLST490 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x243c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2440 (section: __ex_table) -> .LLST492 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x2440 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b4 (section: __ex_table) -> .LASF1061 (section: .debug_str)
ERROR: modpost: __ex_table+0x24b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b8 (section: __ex_table) -> .LASF1059 (section: .debug_str)
ERROR: modpost: __ex_table+0x24b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d8 (section: __ex_table) -> .LASF1608 (section: .debug_str)
ERROR: modpost: __ex_table+0x24d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24dc (section: __ex_table) -> .LASF1610 (section: .debug_str)
ERROR: modpost: __ex_table+0x24dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e4 (section: __ex_table) -> .LASF1612 (section: .debug_str)
ERROR: modpost: __ex_table+0x24e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e8 (section: __ex_table) -> .LASF1614 (section: .debug_str)
ERROR: modpost: __ex_table+0x24e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24f0 (section: __ex_table) -> .LASF1616 (section: .debug_str)
ERROR: modpost: __ex_table+0x24f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24f4 (section: __ex_table) -> .LASF1618 (section: .debug_str)
ERROR: modpost: __ex_table+0x24f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24fc (section: __ex_table) -> .LASF1620 (section: .debug_str)
ERROR: modpost: __ex_table+0x24fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2500 (section: __ex_table) -> .LASF1622 (section: .debug_str)
ERROR: modpost: __ex_table+0x2500 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2514 (section: __ex_table) -> .LASF1872 (section: .debug_str)
ERROR: modpost: __ex_table+0x2514 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2518 (section: __ex_table) -> .LASF1874 (section: .debug_str)
ERROR: modpost: __ex_table+0x2518 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2520 (section: __ex_table) -> .LASF1876 (section: .debug_str)
ERROR: modpost: __ex_table+0x2520 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2524 (section: __ex_table) -> .LASF1878 (section: .debug_str)
ERROR: modpost: __ex_table+0x2524 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2530 (section: __ex_table) -> .LASF2638 (section: .debug_str)
ERROR: modpost: __ex_table+0x2530 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x253c (section: __ex_table) -> .LLST113 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x253c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2544 (section: __ex_table) -> .LASF54 (section: .debug_str)
ERROR: modpost: __ex_table+0x2544 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2548 (section: __ex_table) -> .LASF55 (section: .debug_str)
ERROR: modpost: __ex_table+0x2548 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2550 (section: __ex_table) -> .LASF58 (section: .debug_str)
ERROR: modpost: __ex_table+0x2550 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2554 (section: __ex_table) -> .LASF60 (section: .debug_str)
ERROR: modpost: __ex_table+0x2554 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x255c (section: __ex_table) -> .LASF65 (section: .debug_str)
ERROR: modpost: __ex_table+0x255c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2560 (section: __ex_table) -> .LASF63 (section: .debug_str)
ERROR: modpost: __ex_table+0x2560 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2568 (section: __ex_table) -> .LASF66 (section: .debug_str)
ERROR: modpost: __ex_table+0x2568 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x256c (section: __ex_table) -> .LASF68 (section: .debug_str)
ERROR: modpost: __ex_table+0x256c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2574 (section: __ex_table) -> .LASF1967 (section: .debug_str)
ERROR: modpost: __ex_table+0x2574 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2578 (section: __ex_table) -> .LASF1965 (section: .debug_str)
ERROR: modpost: __ex_table+0x2578 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2580 (section: __ex_table) -> .LASF1970 (section: .debug_str)
ERROR: modpost: __ex_table+0x2580 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2584 (section: __ex_table) -> .LASF1965 (section: .debug_str)
ERROR: modpost: __ex_table+0x2584 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x258c (section: __ex_table) -> .LASF1973 (section: .debug_str)
ERROR: modpost: __ex_table+0x258c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2590 (section: __ex_table) -> .LASF1975 (section: .debug_str)
ERROR: modpost: __ex_table+0x2590 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2598 (section: __ex_table) -> .LASF1977 (section: .debug_str)
ERROR: modpost: __ex_table+0x2598 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x259c (section: __ex_table) -> .LASF1979 (section: .debug_str)
ERROR: modpost: __ex_table+0x259c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25bc (section: __ex_table) -> __param_str_nr_hot_quota_exceeds (section: .rodata.__param_str_nr_hot_quota_exceeds)
>> ERROR: modpost: __ex_table+0x25bc references non-executable section '.rodata.__param_str_nr_hot_quota_exceeds'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25c0 (section: __ex_table) -> __param_str_nr_lru_sort_tried_hot_regions (section: .rodata.__param_str_nr_lru_sort_tried_hot_regions)
>> ERROR: modpost: __ex_table+0x25c0 references non-executable section '.rodata.__param_str_nr_lru_sort_tried_hot_regions'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25c8 (section: __ex_table) -> __param_str_nr_lru_sorted_hot_regions (section: .rodata.__param_str_nr_lru_sorted_hot_regions)
>> ERROR: modpost: __ex_table+0x25c8 references non-executable section '.rodata.__param_str_nr_lru_sorted_hot_regions'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25cc (section: __ex_table) -> __param_str_quota_reset_interval_ms (section: .rodata.__param_str_quota_reset_interval_ms)
>> ERROR: modpost: __ex_table+0x25cc references non-executable section '.rodata.__param_str_quota_reset_interval_ms'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25d4 (section: __ex_table) -> __param_str_wmarks_high (section: .rodata.__param_str_wmarks_high)
>> ERROR: modpost: __ex_table+0x25d4 references non-executable section '.rodata.__param_str_wmarks_high'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25d8 (section: __ex_table) -> __param_str_wmarks_low (section: .rodata.__param_str_wmarks_low)
>> ERROR: modpost: __ex_table+0x25d8 references non-executable section '.rodata.__param_str_wmarks_low'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25e0 (section: __ex_table) -> damon_lru_sort_stub_pattern (section: .rodata.damon_lru_sort_stub_pattern)
>> ERROR: modpost: __ex_table+0x25e0 references non-executable section '.rodata.damon_lru_sort_stub_pattern'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25e4 (section: __ex_table) -> __param_str_wmarks_low (section: .rodata.__param_str_wmarks_low)
ERROR: modpost: __ex_table+0x25e4 references non-executable section '.rodata.__param_str_wmarks_low'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2634 (section: __ex_table) -> .LASF1575 (section: .debug_str)
ERROR: modpost: __ex_table+0x2634 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2638 (section: __ex_table) -> .LASF1577 (section: .debug_str)
ERROR: modpost: __ex_table+0x2638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2640 (section: __ex_table) -> .LASF1579 (section: .debug_str)
ERROR: modpost: __ex_table+0x2640 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2644 (section: __ex_table) -> .LASF1581 (section: .debug_str)
ERROR: modpost: __ex_table+0x2644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x265c (section: __ex_table) -> .LLST44 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x265c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2670 (section: __ex_table) -> .LASF503 (section: .debug_str)
ERROR: modpost: __ex_table+0x2670 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2674 (section: __ex_table) -> .LASF505 (section: .debug_str)
ERROR: modpost: __ex_table+0x2674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x267c (section: __ex_table) -> .LASF2413 (section: .debug_str)
ERROR: modpost: __ex_table+0x267c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2680 (section: __ex_table) -> .LASF2415 (section: .debug_str)
ERROR: modpost: __ex_table+0x2680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2688 (section: __ex_table) -> .LASF2417 (section: .debug_str)
ERROR: modpost: __ex_table+0x2688 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x268c (section: __ex_table) -> .LASF2419 (section: .debug_str)
ERROR: modpost: __ex_table+0x268c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2694 (section: __ex_table) -> .LASF2421 (section: .debug_str)
ERROR: modpost: __ex_table+0x2694 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2698 (section: __ex_table) -> .LASF2423 (section: .debug_str)
ERROR: modpost: __ex_table+0x2698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26b8 (section: __ex_table) -> .LLST114 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x26b8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26dc (section: __ex_table) -> .LLST115 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x26dc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26e8 (section: __ex_table) -> .LLST116 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x26e8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26f4 (section: __ex_table) -> .LASF2169 (section: .debug_str)
ERROR: modpost: __ex_table+0x26f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2704 (section: __ex_table) -> .LLST53 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x2704 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x270c (section: __ex_table) -> .LLRL54 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x270c references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2710 (section: __ex_table) -> .LLST53 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x2710 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2718 (section: __ex_table) -> .LASF306 (section: .debug_str)
ERROR: modpost: __ex_table+0x2718 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x271c (section: __ex_table) -> .LASF308 (section: .debug_str)
ERROR: modpost: __ex_table+0x271c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2724 (section: __ex_table) -> .LASF310 (section: .debug_str)
ERROR: modpost: __ex_table+0x2724 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2728 (section: __ex_table) -> .LASF312 (section: .debug_str)
ERROR: modpost: __ex_table+0x2728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2730 (section: __ex_table) -> .LASF314 (section: .debug_str)
ERROR: modpost: __ex_table+0x2730 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2734 (section: __ex_table) -> .LASF312 (section: .debug_str)
ERROR: modpost: __ex_table+0x2734 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2748 (section: __ex_table) -> .LASF2401 (section: .debug_str)
ERROR: modpost: __ex_table+0x2748 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2754 (section: __ex_table) -> .LASF2404 (section: .debug_str)
ERROR: modpost: __ex_table+0x2754 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2760 (section: __ex_table) -> .LASF2407 (section: .debug_str)
ERROR: modpost: __ex_table+0x2760 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2764 (section: __ex_table) -> .LASF2409 (section: .debug_str)
ERROR: modpost: __ex_table+0x2764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x276c (section: __ex_table) -> .LASF2411 (section: .debug_str)
ERROR: modpost: __ex_table+0x276c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2770 (section: __ex_table) -> .LASF2413 (section: .debug_str)
ERROR: modpost: __ex_table+0x2770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2778 (section: __ex_table) -> .LASF2415 (section: .debug_str)
ERROR: modpost: __ex_table+0x2778 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x277c (section: __ex_table) -> .LASF2417 (section: .debug_str)
ERROR: modpost: __ex_table+0x277c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2784 (section: __ex_table) -> .LASF2419 (section: .debug_str)
ERROR: modpost: __ex_table+0x2784 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2788 (section: __ex_table) -> .LASF2422 (section: .debug_str)
ERROR: modpost: __ex_table+0x2788 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2790 (section: __ex_table) -> .LASF1446 (section: .debug_str)
ERROR: modpost: __ex_table+0x2790 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2794 (section: __ex_table) -> .LASF1448 (section: .debug_str)
ERROR: modpost: __ex_table+0x2794 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x279c (section: __ex_table) -> .LASF1450 (section: .debug_str)
ERROR: modpost: __ex_table+0x279c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27a0 (section: __ex_table) -> .LASF1452 (section: .debug_str)
ERROR: modpost: __ex_table+0x27a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27a8 (section: __ex_table) -> .LASF202 (section: .debug_str)
ERROR: modpost: __ex_table+0x27a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27ac (section: __ex_table) -> .LASF204 (section: .debug_str)
ERROR: modpost: __ex_table+0x27ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27b4 (section: __ex_table) -> .LASF206 (section: .debug_str)
ERROR: modpost: __ex_table+0x27b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27b8 (section: __ex_table) -> .LASF208 (section: .debug_str)
ERROR: modpost: __ex_table+0x27b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27c0 (section: __ex_table) -> .LASF210 (section: .debug_str)
ERROR: modpost: __ex_table+0x27c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27c4 (section: __ex_table) -> .LASF212 (section: .debug_str)
ERROR: modpost: __ex_table+0x27c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27cc (section: __ex_table) -> .LASF214 (section: .debug_str)
ERROR: modpost: __ex_table+0x27cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27d0 (section: __ex_table) -> .LASF216 (section: .debug_str)
ERROR: modpost: __ex_table+0x27d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27fc (section: __ex_table) -> .LASF1515 (section: .debug_str)
ERROR: modpost: __ex_table+0x27fc references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
