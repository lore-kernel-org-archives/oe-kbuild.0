Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07B3C465
	for <oe-kbuild@lists.linux.dev>; Mon, 26 May 2025 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268354; cv=none; b=ipe5iJuM9Yz+bzyJZHbt5mUI7csE6NCWaF+m85wGlf2bJoJbJ96umV9yNj3aQG7+FWEm8wsI7tP+wN0KmZLEtuCehSHFmHWnX21I0khunV7SLVICaBXhaM+2iflOcRgru7Kp+GZzOeSVg4eLb0u4xUPKPC7YbqN3DJdgGdSuWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268354; c=relaxed/simple;
	bh=LvLgBkZL0j1CtFxKOWdKAoNb4HdbFNXlWrBXrNGIMZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSQBQJ03krCnBgCaJjjUDP4nL9Xia9RJE6HD1QxmfbsDedN48rb8sEfAK54Htoi9wM2nj/tAGrsTFjcegWGQaybtt7M9xHWdbHFxWV/QDMMgXHfSSKlVaCPvNi4MczI97OSqd061v0/jIOK19XWpDch7mfbZ3s3Mf0VshDvymZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9LUH3BO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9LUH3BO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748268353; x=1779804353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LvLgBkZL0j1CtFxKOWdKAoNb4HdbFNXlWrBXrNGIMZg=;
  b=d9LUH3BOnMR2xvRogXZLPhFCmXpgT3efupAjYXxS+rLB5H76VbWFUaE5
   T7hbLWvElVt+8HORxCvnYTFoc4XTY6uzGVeS44yx9WelUo3jTUcn03SBV
   lgChEQs8RgfVttMFNAt3Zzt0UHqsQSZBaZVBCGyA4+jy5xydIWiRPJ2yX
   luwO5CViM+t+jFn+3v23UlHedrKtl2HupINFc/oXsOL3c5zD4AKykfRAW
   eeRhW6rsdM/cKkcszEF9tRVEfixkfCu72844iA7n3mNbhJ+vxuypE4xfy
   RgHYGxUBiL/WNS4MPEVhcYuMcBelKEKIPDD4wQqZtBq6pDqqZkeMQ98ex
   Q==;
X-CSE-ConnectionGUID: UIuRXK3/S/u8RYvHRXMLXQ==
X-CSE-MsgGUID: SFjyjlloTqK3QkkR1fwfIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61603118"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="61603118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 07:05:52 -0700
X-CSE-ConnectionGUID: VOc6xU+2RpiJ+hPKhk1qmw==
X-CSE-MsgGUID: vN/woFG+TfGSK5aih4MD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="147547521"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 May 2025 07:05:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJYSb-000SRe-0m;
	Mon, 26 May 2025 14:05:49 +0000
Date: Mon, 26 May 2025 22:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6174/13629] ld.lld: error: undefined symbol:
 ppc_save_regs
Message-ID: <202505262126.S3x7rNwg-lkp@intel.com>
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
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
commit: 497b7794aef03d525a5be05ae78dd7137c6861a5 [6174/13629] powerpc: do not build ppc_save_regs.o always
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: powerpc64-randconfig-r071-20250526 (https://download.01.org/0day-ci/archive/20250526/202505262126.S3x7rNwg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505262126.S3x7rNwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505262126.S3x7rNwg-lkp@intel.com/

Note: the linux-next/master HEAD 3be1a7a31fbda82f3604b6c31e4f390110de1b46 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ppc_save_regs
   >>> referenced by irq_64.c:119 (arch/powerpc/kernel/irq_64.c:119)
   >>>               arch/powerpc/kernel/irq_64.o:(__replay_soft_interrupts) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
