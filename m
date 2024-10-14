Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4024B22318
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 23:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728948797; cv=none; b=CSmQ7yUSSafZNAVP1Tu0USuaRZEIfIbnAA9I6rBbRcu536s3OrPbjjRNd7fbfnYzNZHsbvh4/vKgWCTvTXu84lpCJ71Bak5x/rk/YLF2omsi/d3JOhLXBKLlJWi2OPsqs5Ut9r0onMzMhoD6G8d4bUsZn7qS7fWlBu96tSyy2xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728948797; c=relaxed/simple;
	bh=RRC8TCCzGS0zvks/IvC4LZzU81JqBzalrHTd1pn6u5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HqsRsBsd270Vv/8raplcD7p78I2xoQgBRV9J3PGKY8wOEfTmcaL7NjJQC5KnTWF/L+oAkoXsFqA5b+zemd07PcJ9BtwQWgtjQPE6F/cWqELTLtkIsfdGiPdhPVBo51Ah9pzsYkO5cwrePrW6M9T+BX7ineePwKH7RRBfUl4gr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwhEL+YO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwhEL+YO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728948795; x=1760484795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RRC8TCCzGS0zvks/IvC4LZzU81JqBzalrHTd1pn6u5E=;
  b=jwhEL+YOZndtuTWyu5c0BXi3Hxes6FFSTPSpWfjhvzS7s8VBTVECksn/
   OJj9QzrsiToPTiktXhP+9P9YuDQ9xH4z1j7hYWdTfDHQdY9NXocd/BzV1
   g81pX59ZbtSRxzWIJBEQLVVmEJDXtti4PowUKHWCxAyhoD4bBMinEzV4d
   S43HzXkUmu2fPFvu73L4cx8XbcQmk0++W/Nof881WtJegjMnYMv7TdfvW
   bqTmUvKxUEJrRTu+ug0cRbtreeP2ZI8RiN6ZnWS+J0Dps142QLiKoCuR2
   cN3qqdJtSrXUYDWdLAAda6R2WXM1xlnSj+OyGksXH7lTc6UUQ07QkwJlU
   w==;
X-CSE-ConnectionGUID: z1MlutJtQASEl3cHuHpY4g==
X-CSE-MsgGUID: sI1uC1YCTSGD7CDbgROBKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27766402"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="27766402"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 16:33:14 -0700
X-CSE-ConnectionGUID: kmJp1NFpS7eFIRq20rjKUg==
X-CSE-MsgGUID: HhUUbbykSoKE094rfVROfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="108492678"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2024 16:33:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0UYo-000HJn-2W;
	Mon, 14 Oct 2024 23:33:10 +0000
Date: Tue, 15 Oct 2024 07:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/openrisc/kernel/signal.c:50 restore_fp_state() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202410150741.abnI2YlV-lkp@intel.com>
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
head:   eca631b8fe808748d7585059c4307005ca5c5820
commit: 4dc70e1aadfadf968676d983587c6f5d455aba85 openrisc: Move FPU state out of pt_regs
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: openrisc-randconfig-r073-20241015 (https://download.01.org/0day-ci/archive/20241015/202410150741.abnI2YlV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410150741.abnI2YlV-lkp@intel.com/

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
