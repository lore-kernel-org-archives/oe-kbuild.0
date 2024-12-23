Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDBC19342F
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Dec 2024 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734952007; cv=none; b=L6ML21vKCb2GgIkELdqODuLy8O6AO7fsXYPrEuWnYwfrm8cz4YwQCKMSHaxC0HA7EQviWeUJn3gZC/R0/MvS6YNU78aIUhI7VDdJ0Jnas8qcIep4S2xaj4qXZsHLlkGJXcYXD7p4KcyYv+HXFb5ggLeo7X5ZlG1uT00iPeKOxQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734952007; c=relaxed/simple;
	bh=HnGUcgosQPnnpCQP0XDhcwiT6wlO/sza4vssFPaCf4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPTCUZx2mjyNmISmMFCY7AWQFgIDH4HhaJhtstm5LTosLg0sPbSmN+kceas1fopjAtN0bPZBaPd903F4cjgVvsAttXLs+PdcuPTl0wqoY8me/K/jyGYHVj7xEV4QjvIXldpAXtpnZ8is4VyJ6gPXF+u7Uw/Ats0d6KXXQEe3us4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtRBrF7b; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtRBrF7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734952006; x=1766488006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HnGUcgosQPnnpCQP0XDhcwiT6wlO/sza4vssFPaCf4M=;
  b=gtRBrF7bdmCoZSQ1ccTn1cgRLqdjfl3kBp38CRtvUYuSVAeuSjTWsnzw
   ZI3F1z0ozi6BMJPNtE26+gDNoI2eJc9/FBGgcYOMzbqr4xCCos0tSPPBF
   dZDuE2nzToF1WIBscijzh3R5nPQwMfXahPuLHp1aAnf3eEwC2isLwfHLM
   s5WEU/XIUIjnvAZpRYyXO+7jvGpGPH/oPSZL1Q83VfCNeJc0uNfNJ5Knc
   7GxKjGnGNl5wAG/fQNsLDVmjwablPx4IzHfNxuJXRuT4bpZd6qLce4us3
   xkO43VwJZbzSlPcUU0rr3qePngjzuxuGnwPnmbEOPD81AnEGEvLYK51Hq
   g==;
X-CSE-ConnectionGUID: I54JlptSTC6E+27aw4klig==
X-CSE-MsgGUID: 6yRByDIYQA6z1/6fu0uPgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35553050"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35553050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 03:06:45 -0800
X-CSE-ConnectionGUID: LUJ7rtnIQ8621us87xN6LA==
X-CSE-MsgGUID: xqpxLnkARZeGbt4QqBBUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="104156197"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2024 03:06:44 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPgGn-0003YZ-0m;
	Mon, 23 Dec 2024 11:06:41 +0000
Date: Mon, 23 Dec 2024 19:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/openrisc/kernel/signal.c:50 restore_fp_state() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202412231902.7wai289d-lkp@intel.com>
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
TO: Stafford Horne <shorne@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bbf9020becbfd8fc2c3da790855b7042fad455b
commit: 4dc70e1aadfadf968676d983587c6f5d455aba85 openrisc: Move FPU state out of pt_regs
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: openrisc-randconfig-r073-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231902.7wai289d-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412231902.7wai289d-lkp@intel.com/

smatch warnings:
arch/openrisc/kernel/signal.c:50 restore_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/openrisc/kernel/signal.c:67 save_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?

vim +50 arch/openrisc/kernel/signal.c

1c4de499e6134e Stafford Horne 2023-08-20  39  
1c4de499e6134e Stafford Horne 2023-08-20  40  asmlinkage int do_work_pending(struct pt_regs *regs, unsigned int thread_flags,
1c4de499e6134e Stafford Horne 2023-08-20  41  			       int syscall);
1c4de499e6134e Stafford Horne 2023-08-20  42  
4dc70e1aadfadf Stafford Horne 2024-03-30  43  #ifdef CONFIG_FPU
4dc70e1aadfadf Stafford Horne 2024-03-30  44  static long restore_fp_state(struct sigcontext __user *sc)
4dc70e1aadfadf Stafford Horne 2024-03-30  45  {
4dc70e1aadfadf Stafford Horne 2024-03-30  46  	long err;
4dc70e1aadfadf Stafford Horne 2024-03-30  47  
4dc70e1aadfadf Stafford Horne 2024-03-30  48  	err = __copy_from_user(&current->thread.fpcsr, &sc->fpcsr, sizeof(unsigned long));
4dc70e1aadfadf Stafford Horne 2024-03-30  49  	if (unlikely(err))
4dc70e1aadfadf Stafford Horne 2024-03-30 @50  		return err;
4dc70e1aadfadf Stafford Horne 2024-03-30  51  
4dc70e1aadfadf Stafford Horne 2024-03-30  52  	/* Restore the FPU state */
4dc70e1aadfadf Stafford Horne 2024-03-30  53  	restore_fpu(current);
4dc70e1aadfadf Stafford Horne 2024-03-30  54  
4dc70e1aadfadf Stafford Horne 2024-03-30  55  	return 0;
4dc70e1aadfadf Stafford Horne 2024-03-30  56  }
4dc70e1aadfadf Stafford Horne 2024-03-30  57  
4dc70e1aadfadf Stafford Horne 2024-03-30  58  static long save_fp_state(struct sigcontext __user *sc)
4dc70e1aadfadf Stafford Horne 2024-03-30  59  {
4dc70e1aadfadf Stafford Horne 2024-03-30  60  	long err;
4dc70e1aadfadf Stafford Horne 2024-03-30  61  
4dc70e1aadfadf Stafford Horne 2024-03-30  62  	/* Sync the user FPU state so we can copy to sigcontext */
4dc70e1aadfadf Stafford Horne 2024-03-30  63  	save_fpu(current);
4dc70e1aadfadf Stafford Horne 2024-03-30  64  
4dc70e1aadfadf Stafford Horne 2024-03-30  65  	err = __copy_to_user(&sc->fpcsr, &current->thread.fpcsr, sizeof(unsigned long));
4dc70e1aadfadf Stafford Horne 2024-03-30  66  
4dc70e1aadfadf Stafford Horne 2024-03-30 @67  	return err;
4dc70e1aadfadf Stafford Horne 2024-03-30  68  }
4dc70e1aadfadf Stafford Horne 2024-03-30  69  #else
4dc70e1aadfadf Stafford Horne 2024-03-30  70  #define save_fp_state(sc) (0)
4dc70e1aadfadf Stafford Horne 2024-03-30  71  #define restore_fp_state(sc) (0)
4dc70e1aadfadf Stafford Horne 2024-03-30  72  #endif
4dc70e1aadfadf Stafford Horne 2024-03-30  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
