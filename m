Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC7F33FE
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742032; cv=none; b=unEdAU1cyc2ZluuBLUPQAASxCEd1RrcGr8pAKgAvBMBIhqAU7RaQncZ1k80gwC+8kp9aNrY6MtAHbaVhbWbKSppxj4K4hyfi3OyTQ022qvpsNuJprx+cBIab1dMpm3HK+Eb0KIZ6g2dzGvSOdzRYgQ0RcCy9zUZVGnEjD6YTbIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742032; c=relaxed/simple;
	bh=uaIs9IF+AlCbQqAYDcWjawnJLkKIVsCunoZkiHIR2ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m9xHhdOZod1MFBUpCCfopfol8k7LnFmrao769cLs6L0AHXeI6ksaAiVPPoOQWy0UaC+xk/FstxBN1iQRoZ3LEI4vdKjC8umQwpYnY40otu6cgHjsQaaoX/n319z2vL7yQjoGZAaQz4G/CZt4msR/hBoPBYqnqhGenRCscibXRmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M95g5xlF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M95g5xlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730742030; x=1762278030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaIs9IF+AlCbQqAYDcWjawnJLkKIVsCunoZkiHIR2ok=;
  b=M95g5xlFJKD4xr/FKnKv1zTgWbWk1WCWGb+0vyxy51vCP1i7VsfKuS5H
   CK0RPZ/DFvYRtTUrwwzVZRsbidBtOiu3F7ddcOpsgP8+JQmBkNafNhklB
   mHhEEuI+gGU5l9DPZkpITyJlPsaxkyv8LfQBZY1gFSHrMTKk2pnpcvDP6
   3L/8EHVe9dn45w2aGGhLZrD2dl14brHcbee7pOX5wJSz7d1JC4VWBtozM
   +ZkU1LaWTezqE+iqfamNP/gTkPvN6CI6ntaXj0M7uIWG+bxVak7JoXWWo
   /2LpvV/Nojooq/dQzHGcvMlDuHw9Holsi9BVZ73Q7bJgwvURgpcpHfVE/
   g==;
X-CSE-ConnectionGUID: DGu58z5RSTqkPzEeQpjt3A==
X-CSE-MsgGUID: OiHaM7iXRSi25MX+3RRm9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29881925"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="29881925"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 09:40:29 -0800
X-CSE-ConnectionGUID: OkZXwlEYRwm3QCDV/9/ZSQ==
X-CSE-MsgGUID: TueXzIGFQHeADSnq0pTpug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="114513849"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2024 09:40:28 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t813x-000l4n-2k;
	Mon, 04 Nov 2024 17:40:25 +0000
Date: Tue, 5 Nov 2024 01:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/openrisc/kernel/signal.c:50 restore_fp_state() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202411050108.7hvptsS6-lkp@intel.com>
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
head:   59b723cd2adbac2a34fc8e12c74ae26ae45bf230
commit: 4dc70e1aadfadf968676d983587c6f5d455aba85 openrisc: Move FPU state out of pt_regs
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: openrisc-randconfig-r072-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050108.7hvptsS6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411050108.7hvptsS6-lkp@intel.com/

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
