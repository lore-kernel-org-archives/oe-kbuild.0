Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA119067A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719235; cv=none; b=W/WOp9Y/KSqcVmxmaVDV4pOXrMuWshBg6L4UsSXbPolXN6EJe/On/S6wTXc6ZPJKgIil5ogFaDcorpsbyX8zkoOuoNWkGcQrOagLITtGULCJLwMpx/3Eb44VEupQmaT9REfZSs8NZugH5VxT9kkaoqnzsrkxON41K/8ODDtE+94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719235; c=relaxed/simple;
	bh=Ak21ffOMTkyrlQBK+OrKvowau0mb/JMUHSWayQlCtd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gR8HYXMaLPrBIrJVvze5JslMjgFhP9CG0KLOjdsHI1xODrCxBnGP8DrfXtGF6QlpA+HYxo39P/LT9Xsx8YZHLvaxO5Z3uwRqaNEGUera4mZ1wzJs4FkrBqpQgmUTHFFDP2iAeSFq6OaEb9ZlpT40EK+wCIOlrJZPxBCCOjrrkO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bw7modVh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bw7modVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719232; x=1765255232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ak21ffOMTkyrlQBK+OrKvowau0mb/JMUHSWayQlCtd4=;
  b=Bw7modVh89RJRjA1UZ8ck8K0fZ5Rog42hq6Xp+HgetDzEyX0fM1mrIZ1
   qPYfSq+Ag2EhsrWolHYG0xMbhpRHTqBvAbkGcH5G7nbnBO7DOlXjp9HUh
   2kuO/XKcFuNDJd+e8f7gyl7z4P1jsgGo+IFz3VWSpAQ/d8KgdBn5cZyr+
   nsP1O6g4ayucstphlK0C4AdjQbT9SprjkvCug/uIQwbU8S4oaC+wWz6xd
   7NGUQlLs/pZtnCPMLJA3qbaHob6pmLefU70v4IJZP1FtPd+X687vDoeDC
   xS3HKuSKQotJPtBG90eUV0uyhCQ6z77NkHKGEnhRaP71BIfTJprnr/poW
   g==;
X-CSE-ConnectionGUID: 5XX2miNYSuCETT2lfQe4Ug==
X-CSE-MsgGUID: Q98U8PS3RduEiuOaiQ65wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37931541"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37931541"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:40:30 -0800
X-CSE-ConnectionGUID: /8rAuju7QIu8BEvrRq4qZA==
X-CSE-MsgGUID: THojkYe2TJi4tcrzozAKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94827053"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2024 20:40:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVZK-0003ta-16;
	Mon, 09 Dec 2024 04:40:26 +0000
Date: Mon, 9 Dec 2024 12:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/um/signal.c:189 copy_sc_to_user() warn: sizeof(NUMBER)?
Message-ID: <202412081159.T2BNo0f8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Benjamin Berg <benjamin.berg@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: 3f17fed2149192c7d3b76a45a6a87b4ff22cd586 um: switch to regset API and depend on XSTATE
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: um-randconfig-r072-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081159.T2BNo0f8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412081159.T2BNo0f8-lkp@intel.com/

New smatch warnings:
arch/x86/um/signal.c:189 copy_sc_to_user() warn: sizeof(NUMBER)?

Old smatch warnings:
arch/x86/um/signal.c:45 copy_sc_from_user() warn: maybe return -EFAULT instead of the bytes remaining?
arch/x86/um/signal.c:195 copy_sc_to_user() warn: sizeof(NUMBER)?

vim +189 arch/x86/um/signal.c

a5f6096c805e6d2 arch/um/sys-i386/signal.c Jeff Dike      2007-10-16  180  
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  181  	if (copy_to_user(to_fp64, regs->regs.fp, host_fp_size))
a5f6096c805e6d2 arch/um/sys-i386/signal.c Jeff Dike      2007-10-16  182  		return 1;
5a6951273e0e9dc arch/x86/um/signal.c      Benjamin Berg  2024-09-13  183  
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  184  	/*
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  185  	 * Put magic/size values for userspace. We do not bother to verify them
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  186  	 * later on, however, userspace needs them should it try to read the
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  187  	 * XSTATE data. And ptrace does not fill in these parts.
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  188  	 */
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23 @189  	BUILD_BUG_ON(sizeof(int) != FP_XSTATE_MAGIC2_SIZE);
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  190  #ifdef CONFIG_X86_32
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  191  	__put_user(offsetof(struct _fpstate_32, _fxsr_env) +
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  192  		   host_fp_size + FP_XSTATE_MAGIC2_SIZE,
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  193  		   &to_fp64->fpstate.sw_reserved.extended_size);
5a6951273e0e9dc arch/x86/um/signal.c      Benjamin Berg  2024-09-13  194  #else
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  195  	__put_user(host_fp_size + FP_XSTATE_MAGIC2_SIZE,
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  196  		   &to_fp64->fpstate.sw_reserved.extended_size);
5a6951273e0e9dc arch/x86/um/signal.c      Benjamin Berg  2024-09-13  197  #endif
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  198  	__put_user(host_fp_size, &to_fp64->fpstate.sw_reserved.xstate_size);
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  199  
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  200  	__put_user(FP_XSTATE_MAGIC1, &to_fp64->fpstate.sw_reserved.magic1);
3f17fed2149192c arch/x86/um/signal.c      Benjamin Berg  2024-10-23  201  	__put_user(FP_XSTATE_MAGIC2, (int *)((void *)to_fp64 + host_fp_size));
^1da177e4c3f415 arch/um/sys-i386/signal.c Linus Torvalds 2005-04-16  202  
f67aa2ffb7ce2f6 arch/x86/um/signal.c      Al Viro        2011-08-18  203  	return 0;
^1da177e4c3f415 arch/um/sys-i386/signal.c Linus Torvalds 2005-04-16  204  }
^1da177e4c3f415 arch/um/sys-i386/signal.c Linus Torvalds 2005-04-16  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
