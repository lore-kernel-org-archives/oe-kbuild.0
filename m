Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3975149C69
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 04:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737348254; cv=none; b=Vmyu7/6b9myUPrgRUuGnATr4pBn85ff/abrH5MQL/GWS3qx8aupKFneMG9BHPkIryKS519QEGbv/l8eAI7wEqxwyM6KQjBaXGigKQwA57eT/wFb4lPsbbplUN1U5XdXF77BFgz+s6IK11Uh9dUyT94y05B4fY9LU7aE6jbkssO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737348254; c=relaxed/simple;
	bh=PxgnJI2x+FZ9iF0Ol3bEy5fmpF0gwd/5eDPRxxcT5rM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMXvYSyKIzXFwcS01W69cqb7KtYKNdMsoM1NKFR59pUR+SrWkPA1D2wlb8wTU73arFJbplg8ew+vLhWUJcmPy8DuIJcp6wk9VPuKTfuqz7x5g2g39uByzMFzjlyzz+64d3HOF1D/r7eHTU83TprkKDP5Qztukzcsi4uiXglIuCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDE3gE6X; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDE3gE6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737348252; x=1768884252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PxgnJI2x+FZ9iF0Ol3bEy5fmpF0gwd/5eDPRxxcT5rM=;
  b=MDE3gE6Xinw85ybgMR+a2Hhiw1AmkbmyCYIPe6a/Y7TEJihr/M0ded/g
   TqEtczwcYPdqIFj6aT0TE56f7zd09h1olwOstNkKSEaEpk9ptt9w5yMnV
   k9rBc4b649kQ6Sje88grm4g21bBCaohRgXwrCZ8K6LUdCXBWe5z88NggI
   LELlN0r34agPhvLHHreJ1SJS/0/FQUptjHzb4LzG8KBkNeL3qHXEkDV44
   HtpDyKgla9tND7gPfIpYvCJApUtWmrM7D57hs+i0ZUhVjEd1upQrKigTo
   dCEwYyNr4jYcMLG1VFH8GrXZlmYRGqMu4Qhd3UUtZRQLXtPXwzM+X1Os/
   w==;
X-CSE-ConnectionGUID: 4dpWslA1SjafRxxyG+5E5g==
X-CSE-MsgGUID: CMRNDGVtRHma1QFYpA3Eaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41467969"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41467969"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 20:44:12 -0800
X-CSE-ConnectionGUID: vezM2xBVQiSZWg+CuqBTLg==
X-CSE-MsgGUID: xPaVGNp1RieYEhPY0GiH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106819097"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2025 20:44:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZjdw-000WCM-0L;
	Mon, 20 Jan 2025 04:44:08 +0000
Date: Mon, 20 Jan 2025 12:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: vmlinux.o:(function rdinit_setup: .init.text+0x58):
 relocation R_RISCV_HI20 out of range: 529072 is not in [-524288, 524287];
 references '.L_MergedGlobals'
Message-ID: <202501201220.zZfGSiAo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: bede169618c68379e1be7ace14e8ac85b964a9ec kbuild: enable objtool for *.mod.o and additional kernel objects
date:   8 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-002-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201220.zZfGSiAo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201220.zZfGSiAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501201220.zZfGSiAo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(function rdinit_setup: .init.text+0x58): relocation R_RISCV_HI20 out of range: 529072 is not in [-524288, 524287]; references '.L_MergedGlobals'
   >>> referenced by ld-temp.o
   >>> defined in vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
