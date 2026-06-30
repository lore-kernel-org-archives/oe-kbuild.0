Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB03540BCCF
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jun 2026 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824427; cv=none; b=myaDH3Ft0liUjyqEJfxItEfULDMfN99tyukL+lB29fOjymLK/fjFFp+dfm3rzMZu75SFMdnMw2+urQmPa81xaC/r+Oseo0c2zh+3uzqORb88P/czXXUlfNbx3PpM64XkMIn/0Q5Zl1j2nU0zW9dMJuo6fgKY/EZhjn2lcPZPGMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824427; c=relaxed/simple;
	bh=2Sh9GJdrM3UOD6jwRu7MYf0+kOK+cm7yztjjt8d9YSs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YvvZyWW1AzCbu91igCgAsdDW07ow5de3yPsDOr+BbrEUMZyG/8Ag2cqSGgI/EEO1Lu0Q65YLyha6jqhFjIe/UjxqG4BaBQhI5pVy6S4t0pqsnMA0U0uPeUx/1+Y75NhjHK+sX6+ViHPcOSp73/JzvT9m+Pv6rSdq/4xRjFgslNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYlRz/zq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYlRz/zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782824426; x=1814360426;
  h=date:from:to:cc:subject:message-id;
  bh=2Sh9GJdrM3UOD6jwRu7MYf0+kOK+cm7yztjjt8d9YSs=;
  b=iYlRz/zqD3VMBGV3uIVJYjtLEdSr/jThjoaYJy2fcG9C/RWaW8e+L16F
   4X6McrCWFrWylmuiViWz2AhsPezc5x6Kc3kRGbKb7TPO52aCY3hjKuWmM
   gdqDgrDeH8seXwZo+kFVjMoFPKnXILq9ALNozIrZu1MGzqhpoUndCRwvc
   vSkjMaCyvTHmwFMhs1NuPW1UPhLWAGZdGTYAoQBbKCL7SFKHpLBGIb0Y8
   dnPRjPm4dDgD3rZpOwTW0wWz3YT/5QCGXnoCfIT2lVbFAHKq7CCRhKFig
   RwWHGUH0eRjjkzcqwcSdXiPQywAYSQlVJRXhUNdRTLwxONmt021O3lh4S
   w==;
X-CSE-ConnectionGUID: NfbXjbAsTxOmQmuKxmUfRg==
X-CSE-MsgGUID: iljChHRtTF+NK2U7B40CEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83671304"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83671304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 06:00:25 -0700
X-CSE-ConnectionGUID: BpzfwZNERUWDcn0v6FFozQ==
X-CSE-MsgGUID: m4QbHt41SMGxd4XjF/BPBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="249616412"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jun 2026 06:00:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weY4c-000000008MA-1SLa;
	Tue, 30 Jun 2026 13:00:22 +0000
Date: Tue, 30 Jun 2026 20:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x15a:
 relocation to !ENDBR: crc32_lsb_vpclmul_avx512+0x24e
Message-ID: <202606302030.jHvQLGik-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 9a73f085dc91980ab7fcc5e9716f4449424b3b59 objtool: Fix another stack overflow in validate_branch()
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-buildonly-randconfig-001-20260629 (https://download.01.org/0day-ci/archive/20260630/202606302030.jHvQLGik-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302030.jHvQLGik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a73f085dc91 ("objtool: Fix another stack overflow in validate_branch()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606302030.jHvQLGik-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x15a: relocation to !ENDBR: crc32_lsb_vpclmul_avx512+0x24e

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
