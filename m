Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE8F192D95
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727273725; cv=none; b=lhlM5dZnnO5ZQhpK0wS4jzuGNzEgKisN4V92I8Nm+yEkmL2AwfZMWFi4bYdahJe1mz39luj6pjBOkSV2XCrRLKlLy6+dqn9oojBtZOzWOfB5Zdv5q/4+kBGuXIbZmAv9Z/MOH50sf53PgS3DHOcsA6dkLN5d6qGln1zwI0bPQos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727273725; c=relaxed/simple;
	bh=iH0e+zGh6UbWkigD9dTd2bkLDdNPjhy6cKSSUcPQcKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XiXKfrVPHOEmamjslDZ7NXioUf1ycGL8jcA03YNhMAPmmstXc/AmapKUrJaJnxFMtnSw2GCbz9Y9tdoXsWg0uUNOnV4i5u9kXVyhiI/8AIbpfdsElHDDnvU5xFTmIQX9TNb6ISOuJfGey6r8KNg0vzr1ghBGm5iyRZwyW0dikD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddt3WVaj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddt3WVaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727273724; x=1758809724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iH0e+zGh6UbWkigD9dTd2bkLDdNPjhy6cKSSUcPQcKM=;
  b=ddt3WVajIsno+AVhTv1eqcTjdIipCl9b1s4/T0cyiuzqEZpCQnuSkM30
   eoUQkxpyhSnzA+wp1rb+yrPLmdU5KSrm/hs1icLrMoF4/imI/GcMQoGJv
   h1zyN/bXttZ2gzBZeFe/XzbG+tqWPDBORb7D4AK5AAgDwNEIOSy3y8X+r
   yeYaTRzLZbGobCM2lQ51tRi9I9delqgegG/GfuROYsua8H49ip57GtD5s
   YrItdHt0DQ5cipltbQHtvCedAl3kaS7LqCOhLqJLu+qnQ/dZRn0ar7xso
   +w1uCmllScF6vnM+GyHmysCS9UblV+7FlHRE0ibshqreJJReIZQzh9IAW
   Q==;
X-CSE-ConnectionGUID: YtjI6FFNRQiVUbXJ6Ua5AQ==
X-CSE-MsgGUID: 8bF/Gu//SBmlBiY4scxJ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36889802"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="36889802"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 07:15:21 -0700
X-CSE-ConnectionGUID: gDB6OH+/SqG0PfASKLBaEg==
X-CSE-MsgGUID: IVqKqjNORkCstlj1gss5yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="71388074"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Sep 2024 07:15:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stSnV-000JaF-2f;
	Wed, 25 Sep 2024 14:15:17 +0000
Date: Wed, 25 Sep 2024 22:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/openrisc/kernel/signal.c:50 restore_fp_state() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202409252213.O8pkWPZ0-lkp@intel.com>
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
head:   684a64bf32b6e488004e0ad7f0d7e922798f65b6
commit: 4dc70e1aadfadf968676d983587c6f5d455aba85 openrisc: Move FPU state out of pt_regs
date:   5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r073-20240925 (https://download.01.org/0day-ci/archive/20240925/202409252213.O8pkWPZ0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409252213.O8pkWPZ0-lkp@intel.com/

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
