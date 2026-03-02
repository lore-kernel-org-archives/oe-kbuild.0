Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECB242315F
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Mar 2026 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467069; cv=none; b=nNcqKkgvf0KseV82+9/GyM1fyZLwQ/7eX1IL2txbQa/hMn2VVzklkldfgr4f0z1ahWcYoe9399hnGaO3cAbQ1FyG7x10wsbTJu8UMhUhysQQBE6nS46RJAP54TL8c5JIeAqdTCT3A8O/k7e/WMnSDnImJTgCNw7F7oMVK9T9TaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467069; c=relaxed/simple;
	bh=zCmr4LfYLxvv569HGh15xfzUqKRFH1Oj9/XBGjSVJek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oMxxE3jRiicMSDPvWohEqByZL2qCo/WrHhFQJYO2liRvhucO8rAV2mm82z176+1cUq1G0QZAoZ6McpAXQ1V+jqJGKt9PUQSSkb7UAdvxN1Ug8m3N0DPt+BTEiiJUpXpofFEpASwGafHk1ckGsb+j90pVN+6TDSL2l3csMu2zB/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwBFBLAM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwBFBLAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772467067; x=1804003067;
  h=date:from:to:cc:subject:message-id;
  bh=zCmr4LfYLxvv569HGh15xfzUqKRFH1Oj9/XBGjSVJek=;
  b=lwBFBLAMVSb0P9aM8VaI9Hi+YrLtNnlGria0MmGgRSNa85ppahQ+AKLS
   lZ/CBoVw1XHJRjZobWmq9jnW6+nVz56J3jZ3NpaAkuadwYBKVc99k7q2c
   KW0tt2RtrG/rc/GMj6CyeNS99h25GvMGpKriW+nUxboj6KEkkbzlRumtV
   fScF0So5djsqYKT0RJD8/GDJABVUsWQdNKUk/41mIETfuO9ry6l6rslEF
   f6K4HbZM+uVr8/5/HYIZX0dwAmRsLz1orLE0fNVITrCaUW1l6IO7IxK+r
   mW2IITCbFVRxDMw1igZpKadxcet2OLAR6hw4PyINonTBNIoNpcTKAAJek
   g==;
X-CSE-ConnectionGUID: ZzHzaVFISeqqSuszOM/LSA==
X-CSE-MsgGUID: T0XNHn32TBeIPro/7Q7xaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="76080432"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="76080432"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:57:46 -0800
X-CSE-ConnectionGUID: Rco99omeTP21puyI0NAZ0A==
X-CSE-MsgGUID: 3Qb+vpVmSTCdq3rLdNA/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="215661650"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2026 07:57:46 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx5eR-0000000012f-1kaL;
	Mon, 02 Mar 2026 15:57:43 +0000
Date: Mon, 02 Mar 2026 23:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/test_ubsan.c:62:16: sparse: sparse: cast truncates bits
 from constant value (7fffffffffffffff becomes ffffffff)
Message-ID: <202603022304.40Saroyl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "intentionally bad operations"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: ed2b548f1017586c44f50654ef9febb42d491f31 ubsan/overflow: Rework integer overflow sanitizer option to turn on everything
date:   12 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 12 months ago
config: um-randconfig-r122-20260302 (https://download.01.org/0day-ci/archive/20260302/202603022304.40Saroyl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603022304.40Saroyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603022304.40Saroyl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_ubsan.c:62:16: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
   lib/test_ubsan.c:72:18: sparse: sparse: shift count is negative (-1)

vim +62 lib/test_ubsan.c

854686f4edf483d Jinbum Park 2018-04-10  55  
ed2b548f1017586 Kees Cook   2025-03-06  56  static void test_ubsan_truncate_signed(void)
ed2b548f1017586 Kees Cook   2025-03-06  57  {
ed2b548f1017586 Kees Cook   2025-03-06  58  	volatile long val = LONG_MAX;
ed2b548f1017586 Kees Cook   2025-03-06  59  	volatile int val2 = 0;
ed2b548f1017586 Kees Cook   2025-03-06  60  
ed2b548f1017586 Kees Cook   2025-03-06  61  	UBSAN_TEST(CONFIG_UBSAN_INTEGER_WRAP);
ed2b548f1017586 Kees Cook   2025-03-06 @62  	val2 = val;
ed2b548f1017586 Kees Cook   2025-03-06  63  }
ed2b548f1017586 Kees Cook   2025-03-06  64  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
