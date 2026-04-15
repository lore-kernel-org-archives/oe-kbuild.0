Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD2C33065C
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 05:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776230138; cv=none; b=OrJK2wnRb213SC8RydtQtM4pw/Ba9oVWnijJ35vEdzS0FcritI2Y1rlJxJWwhuB8VR+JOcwllwBC4ep+fPvEYizoFy30OapSklrTOZxk2PbXwF0myvJstnxveIO+cv56kXIm/nzitSqIgZCCKb3PlFVkNJbdupukPi4JIKwgPgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776230138; c=relaxed/simple;
	bh=xF1GgPrgpaTLXYgjEYBrFOUZ1qkSFsutSHhqyyt8S0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W7LuB97grgXOD5Ufe9ASXgVQ1QFsS+h1Q0pai7JsQiMV1hpC9C3OwkXy3FJ7KUu4q2nauT8snbOQGal7Eg7UKL5H3hVQ0YKYAsz90vuFzpweIRURoDSOmF0z0SFZwZebpDSWSdwcTOeN5CC4Kl4SeOYfx9NtMCq22PZ00bxc1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTnPnFtI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTnPnFtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776230136; x=1807766136;
  h=date:from:to:cc:subject:message-id;
  bh=xF1GgPrgpaTLXYgjEYBrFOUZ1qkSFsutSHhqyyt8S0o=;
  b=PTnPnFtIKDXwWx4bxBpoW+XL0OSWn8WzO+u1/9CxuA7DiXhr5D49L7FL
   NL+5AJYNgfh6oJ2Z0PW74siIczZkKGqKBh8zYLQPiGFWv0gmCP8LS/QQs
   Iem5I2DD1s+3t17HzYgECAPIqgD1oQRmVMsxZ3/UtWyI6Gr/5Pi5SJOVC
   3CnCV4ZoQTgfNrmN4myaS/4EWJobc8CzpokbclEhUyvBr8jdlx5bfo4iB
   dE8gfqtZNPdUyfM5D0CEzSTnkP2rgm3gCvG2TP+X2H/Xwws6cpLssc+YM
   6Mo7EaRgoNnk0eLor7YALhJs5oBEx6tOLDI71z2nETK1rPGV+oAR8veck
   Q==;
X-CSE-ConnectionGUID: 0/CzXk+2T6SIY3i42jvQig==
X-CSE-MsgGUID: g+sj4bH8QYqjUfUugo9jJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77379150"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77379150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 22:15:36 -0700
X-CSE-ConnectionGUID: pygnDp3YQFe7+Ypv1wnxWg==
X-CSE-MsgGUID: LSJU/k4DRGKoLTzw9ObjRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="235250765"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Apr 2026 22:15:34 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCsb5-000000000AF-2tYd;
	Wed, 15 Apr 2026 05:15:31 +0000
Date: Wed, 15 Apr 2026 13:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kernel/syscall.c:40 __do_sys_mmap2() warn:
 bitwise AND condition is false here
Message-ID: <202604151305.GlKvqJlf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5c0f43e8535d619ff32400e2e916075109fc7a56
commit: 14338e631afd6d4b2c2f8fb7deba786d86c40fad LoongArch: Adjust system call for 32BIT/64BIT
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r071-20260415 (https://download.01.org/0day-ci/archive/20260415/202604151305.GlKvqJlf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 14338e631afd ("LoongArch: Adjust system call for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604151305.GlKvqJlf-lkp@intel.com/

smatch warnings:
arch/loongarch/kernel/syscall.c:40 __do_sys_mmap2() warn: bitwise AND condition is false here
arch/loongarch/kernel/syscall.c:40 __do_sys_mmap2() warn: bitwise AND condition is false here

vim +40 arch/loongarch/kernel/syscall.c

be769645a2aef57 Huacai Chen 2022-05-31  36  
14338e631afd6d4 Huacai Chen 2025-12-08  37  SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len, unsigned long,
14338e631afd6d4 Huacai Chen 2025-12-08  38  		 prot, unsigned long, flags, unsigned long, fd, unsigned long, offset)
14338e631afd6d4 Huacai Chen 2025-12-08  39  {
14338e631afd6d4 Huacai Chen 2025-12-08 @40  	if (offset & (~PAGE_MASK >> 12))
14338e631afd6d4 Huacai Chen 2025-12-08  41  		return -EINVAL;
14338e631afd6d4 Huacai Chen 2025-12-08  42  
14338e631afd6d4 Huacai Chen 2025-12-08  43  	return ksys_mmap_pgoff(addr, len, prot, flags, fd, offset >> (PAGE_SHIFT - 12));
14338e631afd6d4 Huacai Chen 2025-12-08  44  }
14338e631afd6d4 Huacai Chen 2025-12-08  45  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
