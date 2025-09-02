Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD420311
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756848270; cv=none; b=cRCluY7fHe7uOO9vtV3KKJ+WGMFn8le4pQu7kgStf+8sPKu9/znaLyVNfBdQ1Y5fP6J9Te3wN+RphQGMHaRYixkqUhqPr6zS3mXr6qWB58UyzyLIGchD+lyCYnKpkPnLo7poIH2DUkax1h3N1eUsQv57cXikfDSn+AUdtcGbY6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756848270; c=relaxed/simple;
	bh=G8LLBVDPLP+Y+neny9gHqvIKWfCeawaYd+MPUMj3mPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EnrjH15ha+fucnVmwSEq0ywj7bc8oQt5wDQqzHFqLa0/sZ3CQS/F67uimtE+P2RnabJxGnhvsfNbTRnAntcu9seBm8RkfFoOixoPGIlmN0Al35pO9upEBhmXexU9NitwO20FfjFxrluiaphDl9ir1fg8K36ojqUS1TRK9O/ps/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAKY4oic; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAKY4oic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756848266; x=1788384266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8LLBVDPLP+Y+neny9gHqvIKWfCeawaYd+MPUMj3mPc=;
  b=IAKY4oicVWd8sMbssaP5BWxAbQwKVI6xHuj+qU0wzbvELpEo2QJpJYUc
   pr/PgLlrFU8dsOa1apj0411xFlWy+UUHbA5i1gto5XuSAWZV8HOxedELw
   p81hjP2CBEIO/8z0OVXbGZcHLd4SYDftcBWbtcQ8ueaMy1Egmfy1ihjem
   lxJKfwzhYkneIfFtO/2XvPXVmAzHTdHtUEtfqTdLAM0r04PwCy/6v/XgH
   oFTi+fMyXjejhE5an1Mb/tsev32JoWu8PPomb+9vdt75aCPZahC1a9c5z
   VzVi1GRDPlstRC9joUU4PspCTjEgJSLW5kDV74+sTbAmbNx5v27+kPMIH
   A==;
X-CSE-ConnectionGUID: r1I7y5sbRNWcf4Uz+hwV+A==
X-CSE-MsgGUID: FSZT20tLR4SviWwGQZIw+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69406008"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="69406008"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 14:24:25 -0700
X-CSE-ConnectionGUID: DdZ/a+TZTxGfGd1fKRfqwA==
X-CSE-MsgGUID: n1NT0dUiQ8CTdnAFNHicgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="176659063"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2025 14:24:23 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utYUG-00032H-2V;
	Tue, 02 Sep 2025 21:24:20 +0000
Date: Wed, 3 Sep 2025 05:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [leon-rdma:dmabuf-vfio 8/27] ERROR: modpost: __ex_table+0x2254
 references non-executable section '.rodata.str1.4'
Message-ID: <202509030442.wlRtJvSN-lkp@intel.com>
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
TO: Leon Romanovsky <leonro@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   7323090f0330be584177fba6b841a56a2eee5cb0
commit: ff9b206af00cd1b1700479d5c3d7e0e0b62e7f0e [8/27] kmsan: convert kmsan_handle_dma to use physical addresses
:::::: branch date: 7 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509030442.wlRtJvSN-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030442.wlRtJvSN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509030442.wlRtJvSN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1eb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb8 (section: __ex_table) -> .LASF2111 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec0 (section: __ex_table) -> .LASF2198 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec4 (section: __ex_table) -> .LASF2200 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ecc (section: __ex_table) -> .LLST34 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ecc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed0 (section: __ex_table) -> .LLST36 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ed0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2124 (section: __ex_table) -> .LASF1092 (section: .debug_str)
ERROR: modpost: __ex_table+0x2124 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2128 (section: __ex_table) -> .LASF1094 (section: .debug_str)
ERROR: modpost: __ex_table+0x2128 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2130 (section: __ex_table) -> .LASF1745 (section: .debug_str)
ERROR: modpost: __ex_table+0x2130 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2134 (section: __ex_table) -> .LASF1747 (section: .debug_str)
ERROR: modpost: __ex_table+0x2134 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x213c (section: __ex_table) -> .LASF1749 (section: .debug_str)
ERROR: modpost: __ex_table+0x213c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2140 (section: __ex_table) -> .LASF1751 (section: .debug_str)
ERROR: modpost: __ex_table+0x2140 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2148 (section: __ex_table) -> .LASF3420 (section: .debug_str)
ERROR: modpost: __ex_table+0x2148 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2154 (section: __ex_table) -> .Ldebug_line0 (section: .debug_line)
ERROR: modpost: __ex_table+0x2154 references non-executable section '.debug_line'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2158 (section: __ex_table) -> .LASF1 (section: .debug_str)
ERROR: modpost: __ex_table+0x2158 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2160 (section: __ex_table) -> .LASF958 (section: .debug_str)
ERROR: modpost: __ex_table+0x2160 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2164 (section: __ex_table) -> .LASF961 (section: .debug_str)
ERROR: modpost: __ex_table+0x2164 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x216c (section: __ex_table) -> .LASF963 (section: .debug_str)
ERROR: modpost: __ex_table+0x216c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2170 (section: __ex_table) -> .LASF965 (section: .debug_str)
ERROR: modpost: __ex_table+0x2170 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: __ex_table) -> .LASF967 (section: .debug_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x217c (section: __ex_table) -> .LASF681 (section: .debug_str)
ERROR: modpost: __ex_table+0x217c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2184 (section: __ex_table) -> .LASF970 (section: .debug_str)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2188 (section: __ex_table) -> .LASF681 (section: .debug_str)
ERROR: modpost: __ex_table+0x2188 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2190 (section: __ex_table) -> .LASF973 (section: .debug_str)
ERROR: modpost: __ex_table+0x2190 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2194 (section: __ex_table) -> .LASF975 (section: .debug_str)
ERROR: modpost: __ex_table+0x2194 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x219c (section: __ex_table) -> .LASF977 (section: .debug_str)
ERROR: modpost: __ex_table+0x219c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a0 (section: __ex_table) -> .LASF979 (section: .debug_str)
ERROR: modpost: __ex_table+0x21a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a8 (section: __ex_table) -> .LASF981 (section: .debug_str)
ERROR: modpost: __ex_table+0x21a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21ac (section: __ex_table) -> .LASF983 (section: .debug_str)
ERROR: modpost: __ex_table+0x21ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b4 (section: __ex_table) -> .LASF985 (section: .debug_str)
ERROR: modpost: __ex_table+0x21b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b8 (section: __ex_table) -> .LASF983 (section: .debug_str)
ERROR: modpost: __ex_table+0x21b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c0 (section: __ex_table) -> .LASF988 (section: .debug_str)
ERROR: modpost: __ex_table+0x21c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c4 (section: __ex_table) -> .LASF990 (section: .debug_str)
ERROR: modpost: __ex_table+0x21c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21cc (section: __ex_table) -> .LASF992 (section: .debug_str)
ERROR: modpost: __ex_table+0x21cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21d0 (section: __ex_table) -> .LASF994 (section: .debug_str)
ERROR: modpost: __ex_table+0x21d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f0 (section: __ex_table) -> .LASF1373 (section: .debug_str)
ERROR: modpost: __ex_table+0x21f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21f4 (section: __ex_table) -> .LASF1294 (section: .debug_str)
ERROR: modpost: __ex_table+0x21f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21fc (section: __ex_table) -> .LASF1376 (section: .debug_str)
ERROR: modpost: __ex_table+0x21fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2200 (section: __ex_table) -> .LASF1294 (section: .debug_str)
ERROR: modpost: __ex_table+0x2200 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2208 (section: __ex_table) -> .LASF1379 (section: .debug_str)
ERROR: modpost: __ex_table+0x2208 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x220c (section: __ex_table) -> .LASF1294 (section: .debug_str)
ERROR: modpost: __ex_table+0x220c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2214 (section: __ex_table) -> .LASF1382 (section: .debug_str)
ERROR: modpost: __ex_table+0x2214 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2218 (section: __ex_table) -> .LASF1384 (section: .debug_str)
ERROR: modpost: __ex_table+0x2218 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2220 (section: __ex_table) -> .LASF1386 (section: .debug_str)
ERROR: modpost: __ex_table+0x2220 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2224 (section: __ex_table) -> .LASF1384 (section: .debug_str)
ERROR: modpost: __ex_table+0x2224 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x222c (section: __ex_table) -> .LASF1389 (section: .debug_str)
ERROR: modpost: __ex_table+0x222c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2230 (section: __ex_table) -> .LASF1384 (section: .debug_str)
ERROR: modpost: __ex_table+0x2230 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2238 (section: __ex_table) -> .LASF88 (section: .debug_str)
ERROR: modpost: __ex_table+0x2238 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x223c (section: __ex_table) -> .LASF90 (section: .debug_str)
ERROR: modpost: __ex_table+0x223c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2250 (section: __ex_table) -> ssd1307fb_driver (section: .data)
ERROR: modpost: __ex_table+0x2250 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2254 (section: __ex_table) -> .LC32 (section: .rodata.str1.4)
>> ERROR: modpost: __ex_table+0x2254 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x225c (section: __ex_table) -> .LC34 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x225c references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2260 (section: __ex_table) -> .Ldebug_abbrev0 (section: .debug_abbrev)
ERROR: modpost: __ex_table+0x2260 references non-executable section '.debug_abbrev'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2268 (section: __ex_table) -> .LASF4256 (section: .debug_str)
ERROR: modpost: __ex_table+0x2268 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x226c (section: __ex_table) -> .Ldebug_ranges0 (section: .debug_ranges)
ERROR: modpost: __ex_table+0x226c references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2274 (section: __ex_table) -> .LASF0 (section: .debug_str)
ERROR: modpost: __ex_table+0x2274 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2278 (section: __ex_table) -> .LASF2 (section: .debug_str)
ERROR: modpost: __ex_table+0x2278 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2280 (section: __ex_table) -> .LASF5 (section: .debug_str)
ERROR: modpost: __ex_table+0x2280 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2284 (section: __ex_table) -> .LASF6 (section: .debug_str)
ERROR: modpost: __ex_table+0x2284 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x228c (section: __ex_table) -> .LASF8 (section: .debug_str)
ERROR: modpost: __ex_table+0x228c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2290 (section: __ex_table) -> .LASF10 (section: .debug_str)
ERROR: modpost: __ex_table+0x2290 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d4 (section: __ex_table) -> .LASF661 (section: .debug_str)
ERROR: modpost: __ex_table+0x22d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d8 (section: __ex_table) -> .LASF662 (section: .debug_str)
ERROR: modpost: __ex_table+0x22d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f8 (section: __ex_table) -> .LASF3349 (section: .debug_str)
ERROR: modpost: __ex_table+0x22f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22fc (section: __ex_table) -> .LASF3351 (section: .debug_str)
ERROR: modpost: __ex_table+0x22fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2304 (section: __ex_table) -> .LASF3353 (section: .debug_str)
ERROR: modpost: __ex_table+0x2304 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2308 (section: __ex_table) -> .LASF3355 (section: .debug_str)
ERROR: modpost: __ex_table+0x2308 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2310 (section: __ex_table) -> .LASF997 (section: .debug_str)
ERROR: modpost: __ex_table+0x2310 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2314 (section: __ex_table) -> .LASF999 (section: .debug_str)
ERROR: modpost: __ex_table+0x2314 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x231c (section: __ex_table) -> .LASF1001 (section: .debug_str)
ERROR: modpost: __ex_table+0x231c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2320 (section: __ex_table) -> .LASF1003 (section: .debug_str)
ERROR: modpost: __ex_table+0x2320 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2328 (section: __ex_table) -> .LASF1005 (section: .debug_str)
ERROR: modpost: __ex_table+0x2328 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x232c (section: __ex_table) -> .LASF1007 (section: .debug_str)
ERROR: modpost: __ex_table+0x232c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2334 (section: __ex_table) -> .LASF1009 (section: .debug_str)
ERROR: modpost: __ex_table+0x2334 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2338 (section: __ex_table) -> .LASF1011 (section: .debug_str)
ERROR: modpost: __ex_table+0x2338 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2370 (section: __ex_table) -> .LASF4338 (section: .debug_str)
ERROR: modpost: __ex_table+0x2370 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2374 (section: __ex_table) -> .LASF4340 (section: .debug_str)
ERROR: modpost: __ex_table+0x2374 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x237c (section: __ex_table) -> .LASF1647 (section: .debug_str)
ERROR: modpost: __ex_table+0x237c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2380 (section: __ex_table) -> .LASF1649 (section: .debug_str)
ERROR: modpost: __ex_table+0x2380 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2388 (section: __ex_table) -> .LASF1651 (section: .debug_str)
ERROR: modpost: __ex_table+0x2388 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x238c (section: __ex_table) -> .LASF1649 (section: .debug_str)
ERROR: modpost: __ex_table+0x238c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2394 (section: __ex_table) -> .LASF1654 (section: .debug_str)
ERROR: modpost: __ex_table+0x2394 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2398 (section: __ex_table) -> .LASF1656 (section: .debug_str)
ERROR: modpost: __ex_table+0x2398 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a0 (section: __ex_table) -> .LASF1658 (section: .debug_str)
ERROR: modpost: __ex_table+0x23a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a4 (section: __ex_table) -> .LASF1660 (section: .debug_str)
ERROR: modpost: __ex_table+0x23a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23ac (section: __ex_table) -> __bpf_trace_tp_map_oom_score_adj_update (section: __bpf_raw_tp_map)
ERROR: modpost: __ex_table+0x23ac references non-executable section '__bpf_raw_tp_map'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23b0 (section: __ex_table) -> __tpstrtab_reclaim_retry_zone (section: __tracepoints_strings)
ERROR: modpost: __ex_table+0x23b0 references non-executable section '__tracepoints_strings'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23b8 (section: __ex_table) -> __tpstrtab_wake_reaper (section: __tracepoints_strings)
ERROR: modpost: __ex_table+0x23b8 references non-executable section '__tracepoints_strings'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23bc (section: __ex_table) -> __tpstrtab_reclaim_retry_zone (section: __tracepoints_strings)
ERROR: modpost: __ex_table+0x23bc references non-executable section '__tracepoints_strings'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23c4 (section: __ex_table) -> .LASF899 (section: .debug_str)
ERROR: modpost: __ex_table+0x23c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23c8 (section: __ex_table) -> .LASF901 (section: .debug_str)
ERROR: modpost: __ex_table+0x23c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d0 (section: __ex_table) -> .LASF903 (section: .debug_str)
ERROR: modpost: __ex_table+0x23d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d4 (section: __ex_table) -> .LASF905 (section: .debug_str)
ERROR: modpost: __ex_table+0x23d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23dc (section: __ex_table) -> .LASF907 (section: .debug_str)
ERROR: modpost: __ex_table+0x23dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e0 (section: __ex_table) -> .LASF909 (section: .debug_str)
ERROR: modpost: __ex_table+0x23e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e8 (section: __ex_table) -> .LASF911 (section: .debug_str)
ERROR: modpost: __ex_table+0x23e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23ec (section: __ex_table) -> .LASF909 (section: .debug_str)
ERROR: modpost: __ex_table+0x23ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23f4 (section: __ex_table) -> .LASF3449 (section: .debug_str)
ERROR: modpost: __ex_table+0x23f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23f8 (section: __ex_table) -> .LASF3451 (section: .debug_str)
ERROR: modpost: __ex_table+0x23f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x240c (section: __ex_table) -> .LASF1473 (section: .debug_str)
ERROR: modpost: __ex_table+0x240c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2410 (section: __ex_table) -> .LASF1475 (section: .debug_str)
ERROR: modpost: __ex_table+0x2410 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
