Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5855F39C63D
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437029; cv=none; b=g5DEl6z/ZK4GJef+0MzjEQ7fDrQc8cycUMt8uVhDV2yb02KebRoKK0fszdx7Rlzj66bJdROl3NCIjOe/ThnVGlXtchpYkMsWqrX5oShePAA1YWuA9fzAqJyjs+pOd2sWXV20g/oZ+//g8mpBuCN3WD4JWNsVzerytWeb66aoKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437029; c=relaxed/simple;
	bh=pilBq1wEemEEaVpVHuivmhCJlGT+0f30kLd8feE2U1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rl1wfzfnMskrDDDW1ucHAb44GR+AAMxrMDTdHO/bCuMCFQrQ42IUV/8Xh5e2H+DM4RHoEb016ICMVZ0/1833UKPx7BHJPYDvP0A66ZdOETAlXs1kIx+g0paRl3ZbwxFZj4siz/cMd/FNWtZmhqZJPahPfjr1lv2XhlyxUNKb2H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoGltYEP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoGltYEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774437028; x=1805973028;
  h=date:from:to:cc:subject:message-id;
  bh=pilBq1wEemEEaVpVHuivmhCJlGT+0f30kLd8feE2U1E=;
  b=UoGltYEPP0TKBUyn8Sf5Q2bT8yV27/wskN33ES2A3QPCykv90C4aW59e
   f43Ajpox9C4k4WunYKcdXN2xL7fVkvIz5EgevjBK5i+SA9zwsq4oBhZgP
   S4OEo3sYqWPgyHjo6fFZIFIVs1qVI/dBeU946u+wecA+1CL1SUcMMqDGm
   aVUyqDcQzwKZYMNu0GQSqYSfqHkEuZLbhWHmrvi/Keoapl+WBjdI32stV
   zwru+HrP0EGfRErZEhGqZBVYmeMv2B2nuHzSX+xnsdmo3iaJuCPt6dBFs
   rtv8oY6f1EMa7VOdBviaIxkt8lUkTRVVXfogMIoYClyl++eFi2LItaRaN
   w==;
X-CSE-ConnectionGUID: /B3YV/XTSDiJyCk1PFL4NQ==
X-CSE-MsgGUID: ByOONJzpQDileJbHcOxIug==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93047722"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="93047722"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:10:28 -0700
X-CSE-ConnectionGUID: qIJMQ7pCS+6aLT5kLHl78g==
X-CSE-MsgGUID: ptMHkgpuSyuEbU0SZEIHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="219798727"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 04:10:27 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5M7z-000000006ib-2CLZ;
	Wed, 25 Mar 2026 11:10:23 +0000
Date: Wed, 25 Mar 2026 19:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/include/asm/syscall.h:23 syscall_get_nr() warn:
 check sign expansion for '-1'
Message-ID: <202603251953.xOfBpOhW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Charlie Jenkins <charlie@rivosinc.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: e43b8bb56e537bfc8d9076793091e7679020fc9c entry: Inline syscall_exit_to_user_mode()
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-r072-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251953.xOfBpOhW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603251953.xOfBpOhW-lkp@intel.com/

smatch warnings:
arch/s390/include/asm/syscall.h:23 syscall_get_nr() warn: check sign expansion for '-1'

vim +23 arch/s390/include/asm/syscall.h

e7b8e675d9c71b Mike Frysinger     2010-01-26  19  
753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  20  static inline long syscall_get_nr(struct task_struct *task,
753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  21  				  struct pt_regs *regs)
753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  22  {
d3a73acbc26a4a Martin Schwidefsky 2014-04-15 @23  	return test_pt_regs_flag(regs, PIF_SYSCALL) ?
aa33c8cbbae2eb Martin Schwidefsky 2011-12-27  24  		(regs->int_code & 0xffff) : -1;
753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  25  }
753c4dd6a2fa2a Martin Schwidefsky 2008-10-10  26  

:::::: The code at line 23 was first introduced by commit
:::::: d3a73acbc26a4a81a01a35fd162973e53d0386f5 s390: split TIF bits into CIF, PIF and TIF bits

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
