Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D7B6FC3
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 23:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768863685; cv=none; b=qVxTAQzemZb/4q7WLuwgFdAkhuxROmFY6i+twHO8rLohMcyySNxTcJC0lvil5i+h9P5deMInS59h4/i1VMozvU2FpFQew9is/IrbtSUOb0lGjKGiKl6EX/lxY7yHS5Vi+625jqgWnRjY9xG7xCeiqZEnDloULNZeeJAD9L5pB8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768863685; c=relaxed/simple;
	bh=eM6sR5f3Gz53e+SlMow2rAwKTBIrTwEfKYpqqWvokaI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fyoygp3uARpSff7cqNZJzL9IS+AZsWlq2VcA9Q8dT1JZxnj18TPqXCnthCndUxsUCk+955Lwu03orFI2wCwo1OcUyD2yre7hgzBYhg2R8tW7LGSvmGCw3uPZQUms0r1ehJl+68XYDk94UlC4OlhXqyG5b4YZdLMUlb6VHiWaN34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HD6JLCxU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HD6JLCxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768863683; x=1800399683;
  h=date:from:to:cc:subject:message-id;
  bh=eM6sR5f3Gz53e+SlMow2rAwKTBIrTwEfKYpqqWvokaI=;
  b=HD6JLCxUONF2m2NZ3vgcrnhuVq7FEr8fYX3Sv04b7mrVnzN3T9XigMW+
   6xNzCI9lGagBbYi+QrcxiqVKjeTk+OQsDJeEZ1fQFLkc6J8JkHP6+QV3c
   dB0c2P774CUjzBwlsGPh98k1/dI1Rci+CH+6p6nKbzR1es17O+m2AsFlm
   AniksBncaqYUb5gsqFfabi1xsQIOUtY+8A/gPpCKOARlfRvkreLql1lwF
   OS6gpKAtdzH1IB13vWUuU7qnfd7UhrvuPtDefiAWqhPZGKQyQOsOqo3ev
   DqgB8cgtTHMxd4bvbba5y6O5muEApNUNxCwllbsZhwdCmt434VwMUwpXg
   A==;
X-CSE-ConnectionGUID: +LjUr7PRTLG6Ht/2K7c3rA==
X-CSE-MsgGUID: /iCPlIm5SgCqEncOSJQfxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81511233"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="81511233"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 15:01:23 -0800
X-CSE-ConnectionGUID: tSFjX2TxRGmdf7VIKMxqaA==
X-CSE-MsgGUID: pmAUT8QbTHamFfeASvl4HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="210471918"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2026 15:01:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhyFK-00000000OMj-3XTV;
	Mon, 19 Jan 2026 23:01:18 +0000
Date: Tue, 20 Jan 2026 07:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 70/160] ERROR: modpost:
 __ex_table+0x10c0 references non-executable section '.debug_rnglists'
Message-ID: <202601200639.G4ubBVcS-lkp@intel.com>
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
TO: Ryota Sakamoto <sakamo.ryota@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   dd9392e810c469bea3540b54053ac309c9437581
commit: 76dd62b392c85cb443256341516e27ef4a569bd8 [70/160] lib/tests: convert test_uuid module to KUnit
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-002-20260120 (https://download.01.org/0day-ci/archive/20260120/202601200639.G4ubBVcS-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200639.G4ubBVcS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601200639.G4ubBVcS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0xf58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf60 (section: __ex_table) -> .LASF145 (section: .debug_str)
ERROR: modpost: __ex_table+0xf60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf64 (section: __ex_table) -> .LASF147 (section: .debug_str)
ERROR: modpost: __ex_table+0xf64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf6c (section: __ex_table) -> .LASF149 (section: .debug_str)
ERROR: modpost: __ex_table+0xf6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf70 (section: __ex_table) -> .LASF151 (section: .debug_str)
ERROR: modpost: __ex_table+0xf70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf78 (section: __ex_table) -> .LASF153 (section: .debug_str)
ERROR: modpost: __ex_table+0xf78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf7c (section: __ex_table) -> .LASF155 (section: .debug_str)
ERROR: modpost: __ex_table+0xf7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf84 (section: __ex_table) -> .LASF157 (section: .debug_str)
ERROR: modpost: __ex_table+0xf84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf88 (section: __ex_table) -> .LASF159 (section: .debug_str)
ERROR: modpost: __ex_table+0xf88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf90 (section: __ex_table) -> .LASF161 (section: .debug_str)
ERROR: modpost: __ex_table+0xf90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf94 (section: __ex_table) -> .LASF155 (section: .debug_str)
ERROR: modpost: __ex_table+0xf94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf9c (section: __ex_table) -> .LASF164 (section: .debug_str)
ERROR: modpost: __ex_table+0xf9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfa0 (section: __ex_table) -> .LASF155 (section: .debug_str)
ERROR: modpost: __ex_table+0xfa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfa8 (section: __ex_table) -> .LASF167 (section: .debug_str)
ERROR: modpost: __ex_table+0xfa8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfac (section: __ex_table) -> .LASF169 (section: .debug_str)
ERROR: modpost: __ex_table+0xfac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfb4 (section: __ex_table) -> .LASF171 (section: .debug_str)
ERROR: modpost: __ex_table+0xfb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfb8 (section: __ex_table) -> .LASF155 (section: .debug_str)
ERROR: modpost: __ex_table+0xfb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfc0 (section: __ex_table) -> .LASF174 (section: .debug_str)
ERROR: modpost: __ex_table+0xfc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfc4 (section: __ex_table) -> .LASF155 (section: .debug_str)
ERROR: modpost: __ex_table+0xfc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfcc (section: __ex_table) -> .LASF274 (section: .debug_str)
ERROR: modpost: __ex_table+0xfcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfd0 (section: __ex_table) -> .LASF276 (section: .debug_str)
ERROR: modpost: __ex_table+0xfd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1014 (section: __ex_table) -> .LASF1092 (section: .debug_str)
ERROR: modpost: __ex_table+0x1014 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1018 (section: __ex_table) -> .LASF1094 (section: .debug_str)
ERROR: modpost: __ex_table+0x1018 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1020 (section: __ex_table) -> .LASF1096 (section: .debug_str)
ERROR: modpost: __ex_table+0x1020 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1024 (section: __ex_table) -> .LASF1098 (section: .debug_str)
ERROR: modpost: __ex_table+0x1024 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x102c (section: __ex_table) -> .LASF1100 (section: .debug_str)
ERROR: modpost: __ex_table+0x102c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1030 (section: __ex_table) -> .LASF1102 (section: .debug_str)
ERROR: modpost: __ex_table+0x1030 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1038 (section: __ex_table) -> .LASF1104 (section: .debug_str)
ERROR: modpost: __ex_table+0x1038 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x103c (section: __ex_table) -> .LASF1106 (section: .debug_str)
ERROR: modpost: __ex_table+0x103c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1044 (section: __ex_table) -> .LASF1108 (section: .debug_str)
ERROR: modpost: __ex_table+0x1044 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1048 (section: __ex_table) -> .LASF1110 (section: .debug_str)
ERROR: modpost: __ex_table+0x1048 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1050 (section: __ex_table) -> .LASF1112 (section: .debug_str)
ERROR: modpost: __ex_table+0x1050 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1054 (section: __ex_table) -> .LASF1114 (section: .debug_str)
ERROR: modpost: __ex_table+0x1054 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x105c (section: __ex_table) -> .LASF1116 (section: .debug_str)
ERROR: modpost: __ex_table+0x105c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1060 (section: __ex_table) -> .LASF1118 (section: .debug_str)
ERROR: modpost: __ex_table+0x1060 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1068 (section: __ex_table) -> .LASF1120 (section: .debug_str)
ERROR: modpost: __ex_table+0x1068 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x106c (section: __ex_table) -> .LASF1122 (section: .debug_str)
ERROR: modpost: __ex_table+0x106c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1074 (section: __ex_table) -> .LASF1124 (section: .debug_str)
ERROR: modpost: __ex_table+0x1074 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1078 (section: __ex_table) -> .LASF1126 (section: .debug_str)
ERROR: modpost: __ex_table+0x1078 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1080 (section: __ex_table) -> .LASF1128 (section: .debug_str)
ERROR: modpost: __ex_table+0x1080 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1084 (section: __ex_table) -> .LASF1126 (section: .debug_str)
ERROR: modpost: __ex_table+0x1084 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x108c (section: __ex_table) -> .LASF1131 (section: .debug_str)
ERROR: modpost: __ex_table+0x108c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1090 (section: __ex_table) -> .LASF1126 (section: .debug_str)
ERROR: modpost: __ex_table+0x1090 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1098 (section: __ex_table) -> .LASF1134 (section: .debug_str)
ERROR: modpost: __ex_table+0x1098 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x109c (section: __ex_table) -> .LASF1126 (section: .debug_str)
ERROR: modpost: __ex_table+0x109c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x10a4 (section: __ex_table) -> .LASF4067 (section: .debug_str)
ERROR: modpost: __ex_table+0x10a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x10a8 (section: __ex_table) -> .LASF4069 (section: .debug_str)
ERROR: modpost: __ex_table+0x10a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x10b0 (section: __ex_table) -> .LASF4071 (section: .debug_str)
ERROR: modpost: __ex_table+0x10b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x10b4 (section: __ex_table) -> .LASF4073 (section: .debug_str)
ERROR: modpost: __ex_table+0x10b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x10bc (section: __ex_table) -> .LASF4414 (section: .debug_str)
ERROR: modpost: __ex_table+0x10bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x10c0 (section: __ex_table) -> .LLRL395 (section: .debug_rnglists)
>> ERROR: modpost: __ex_table+0x10c0 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x10c8 (section: __ex_table) -> .LLRL399 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x10c8 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x10e4 (section: __ex_table) -> .LLST398 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x10e4 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1104 (section: __ex_table) -> .LASF1920 (section: .debug_str)
ERROR: modpost: __ex_table+0x1104 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1108 (section: __ex_table) -> .LASF1922 (section: .debug_str)
ERROR: modpost: __ex_table+0x1108 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1110 (section: __ex_table) -> .LASF1924 (section: .debug_str)
ERROR: modpost: __ex_table+0x1110 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1114 (section: __ex_table) -> .LASF1922 (section: .debug_str)
ERROR: modpost: __ex_table+0x1114 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x111c (section: __ex_table) -> .LASF1927 (section: .debug_str)
ERROR: modpost: __ex_table+0x111c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1120 (section: __ex_table) -> .LASF1922 (section: .debug_str)
ERROR: modpost: __ex_table+0x1120 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1128 (section: __ex_table) -> .LASF1930 (section: .debug_str)
ERROR: modpost: __ex_table+0x1128 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x112c (section: __ex_table) -> .LASF1932 (section: .debug_str)
ERROR: modpost: __ex_table+0x112c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1134 (section: __ex_table) -> .LASF1934 (section: .debug_str)
ERROR: modpost: __ex_table+0x1134 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1138 (section: __ex_table) -> .LASF1936 (section: .debug_str)
ERROR: modpost: __ex_table+0x1138 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1140 (section: __ex_table) -> .LASF1938 (section: .debug_str)
ERROR: modpost: __ex_table+0x1140 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1144 (section: __ex_table) -> .LASF1940 (section: .debug_str)
ERROR: modpost: __ex_table+0x1144 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x114c (section: __ex_table) -> .LASF1942 (section: .debug_str)
ERROR: modpost: __ex_table+0x114c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1150 (section: __ex_table) -> .LASF1944 (section: .debug_str)
ERROR: modpost: __ex_table+0x1150 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1164 (section: __ex_table) -> .LASF2151 (section: .debug_str)
ERROR: modpost: __ex_table+0x1164 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1168 (section: __ex_table) -> .LASF2153 (section: .debug_str)
ERROR: modpost: __ex_table+0x1168 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1174 (section: __ex_table) -> .LASF2814 (section: .debug_str)
ERROR: modpost: __ex_table+0x1174 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: ohci_hcd_at91_driver+0x14 (section: .data.rel) -> .LVL4904 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: qt2_device+0x0 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: qt2_device+0x10 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0x0 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0x4 (section: .data.rel) -> init_cma_pageblock (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0x10 (section: .data.rel) -> memblock_free_pages (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0x7c (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0x88 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0x8c (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0x90 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xa0 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xa4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xa8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xac (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xb4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xbc (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xc0 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xc4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xcc (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xd0 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xd4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xd8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xdc (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xf4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0xfc (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_1port_device+0x100 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0x0 (section: .data.rel) -> memblock_free_pages (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0x4 (section: .data.rel) -> init_cma_pageblock (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0x10 (section: .data.rel) -> memblock_free_pages (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0x7c (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0x88 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0x8c (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0x90 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xa0 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xa4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xa8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xac (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xb4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xbc (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xc0 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xc4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xcc (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xd0 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xd4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xd8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xdc (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xf4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0xfc (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_2port_device+0x100 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: clie_3_5_device+0x7c (section: .data.rel) -> .LBB2873 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: clie_3_5_device+0xa4 (section: .data.rel) -> .LBE2870 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: clie_5_device+0x4 (section: .data.rel) -> .LVL665 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: clie_5_device+0x78 (section: .data.rel) -> .LBE2873 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: clie_5_device+0xa4 (section: .data.rel) -> .LBE2870 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: clie_5_device+0xf4 (section: .data.rel) -> .LBB2882 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handspring_device+0x4 (section: .data.rel) -> .LBE2896 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handspring_device+0x78 (section: .data.rel) -> .LBE2873 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handspring_device+0x80 (section: .data.rel) -> .LBB2874 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handspring_device+0xa4 (section: .data.rel) -> .LBE2870 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handspring_device+0xf4 (section: .data.rel) -> .LBB2882 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
