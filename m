Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B772621
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786265368; cv=none; b=m3uHG4B1J6bhkymHjh4KKIv5xNEwDyOYj7GLkXoNNrQDVNLGccdQmNri0gMiA90ozYFw+lDJmkOSbGNM9fIBPPcCCLPtH2PmtkKENGWPV7XvuNtQ09yCCpfAS56mgeqVGHTqmNoIN0zkE1jBx16HuJxv8Ov1YujGG1JSjuYbg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786265368; c=relaxed/simple;
	bh=RVlARugdJhyxSZ/j4Zhtr/4ss9WnL7rJQqBqORUWclE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ilUqhFQz/rWlF6iJnDgzDa91dPrsWnmpy9KEZiWeQgafN/7WmDhw5+Ni3blzbk592QC6dZ9s/wXPzpd3Yd9vEy78pwj1Fn224zGeCx/rn13yjmLRYTZK6kwqQmMhqDBPb8uMfEuPIJ2aEbuYA1Yh8umae0RnC9YLoKpILmu32/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9y+EkAU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9y+EkAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786265366; x=1817801366;
  h=date:from:to:cc:subject:message-id;
  bh=RVlARugdJhyxSZ/j4Zhtr/4ss9WnL7rJQqBqORUWclE=;
  b=f9y+EkAUjX5rSwoNePPJxuRGKmCCqX3ThlhX0ZKgJrqpOZN8AeF7QdBd
   35/KL1tTULy6N2N0AdKcTX/DMioeFMt6F77oQaIXczBNgieBkPPiSQcQz
   M+bTMqbRDz6QeLpgbpoH8eh8UYao5jm2jR/GkbRH7JPjzup1NJvzkVb6v
   ssM+s/bWh7mHtyH76yGr+z0nGaioZM/g76BqIXJMQJiICPS7AIHJ8fz6x
   8v69EMMNPX/WudGCOBjCCwDmKApvjqbLlKQaVLcTpOGa74LxfI0Z3REAI
   88Mf4IBAAgN83waioqRPQmfCM82LOawcK6ctnA5Z0StreqbH2ax0AthMG
   Q==;
X-CSE-ConnectionGUID: srWcBmiqSG+yyQEXvqXWew==
X-CSE-MsgGUID: EDk7pJo7Q6CL+5YYAJgFPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="97407583"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="97407583"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 01:49:25 -0700
X-CSE-ConnectionGUID: h4g6Ls3URLOnrJIdqQstrA==
X-CSE-MsgGUID: aygAsIVORs2s9U8BYyPpEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="267027381"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Aug 2026 01:49:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wszDd-00000000Lj2-0kLL;
	Sun, 09 Aug 2026 08:49:21 +0000
Date: Sun, 09 Aug 2026 16:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/parport/share.c:1029 parport_claim() warn: mixing
 irq and irqsave
Message-ID: <202608091622.jlJn0jOj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Sven Schnelle <svens@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: 1f57f68c4dd101e5e8ffc9ffa6428f45bcdd776a s390: Remove GENERIC_LOCKBREAK Kconfig option
date:   9 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 weeks ago
config: s390-randconfig-r071-20260809 (https://download.01.org/0day-ci/archive/20260809/202608091622.jlJn0jOj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1f57f68c4dd1 ("s390: Remove GENERIC_LOCKBREAK Kconfig option")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608091622.jlJn0jOj-lkp@intel.com/

smatch warnings:
drivers/parport/share.c:1029 parport_claim() warn: mixing irq and irqsave

vim +1029 drivers/parport/share.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1026  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1027  	/* Restore control registers */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1028  	port->ops->restore_state(port, dev->state);
^1da177e4c3f41 Linus Torvalds  2005-04-16 @1029  	write_unlock_irqrestore(&port->cad_lock, flags);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1030  	dev->time = jiffies;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1031  	return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1032  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1033  blocked:
7b7a0a30c98514 Sudip Mukherjee 2015-10-28  1034  	/*
7b7a0a30c98514 Sudip Mukherjee 2015-10-28  1035  	 * If this is the first time we tried to claim the port, register an
7b7a0a30c98514 Sudip Mukherjee 2015-10-28  1036  	 * interest.  This is only allowed for devices sleeping in
7b7a0a30c98514 Sudip Mukherjee 2015-10-28  1037  	 * parport_claim_or_block(), or those with a wakeup function.
7b7a0a30c98514 Sudip Mukherjee 2015-10-28  1038  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1039  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1040  	/* The cad_lock is still held for writing here */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1041  	if (dev->waiting & 2 || dev->wakeup) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1042  		spin_lock(&port->waitlist_lock);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1043  		if (test_and_set_bit(0, &dev->waiting) == 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1044  			/* First add ourselves to the end of the wait list. */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1045  			dev->waitnext = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1046  			dev->waitprev = port->waittail;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1047  			if (port->waittail) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1048  				port->waittail->waitnext = dev;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1049  				port->waittail = dev;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1050  			} else
^1da177e4c3f41 Linus Torvalds  2005-04-16  1051  				port->waithead = port->waittail = dev;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1052  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1053  		spin_unlock(&port->waitlist_lock);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1054  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1055  	write_unlock_irqrestore(&port->cad_lock, flags);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1056  	return -EAGAIN;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1057  }
27c6db26555029 Sudip Mukherjee 2015-10-28  1058  EXPORT_SYMBOL(parport_claim);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1059  

:::::: The code at line 1029 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
