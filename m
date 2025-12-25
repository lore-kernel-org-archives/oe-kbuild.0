Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1624C6D
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 16:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766678748; cv=none; b=RoxjyFvULcxP0ConttYqT2yTqf6kwlnaxt6od//UUbu9fSCLtyRpceJ2F+PjlgxU8BtKKxQKsz9ClTqLQNLL4nAsYtLaz/Ayt2IYezikTma/rj28siqTG2UatSGBUAsE372KqKUBT9V9XgsBdmqsT1zIiK2tt02OGhjB0g2W+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766678748; c=relaxed/simple;
	bh=MfVYRnjnqPkBF0sQHq5YTuhMvfbPm84uFfI+vW2jPKM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qzUqEdepS8Fu8IORTEHPw0tod7ubdk/TouFumkJpn5rIO3UdNWl7TkOyGksB0xjU8bWVFo3ytd9ixqUwUxFedKD7cVjZfJ32y7Wy/azhVi+8AKX/S54YM/YLa5bF4KZqI0oWzTc1UbTE99EWiMyIhjXYXUJzy/te20mon0kEvW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjMzw8NF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjMzw8NF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766678746; x=1798214746;
  h=date:from:to:cc:subject:message-id;
  bh=MfVYRnjnqPkBF0sQHq5YTuhMvfbPm84uFfI+vW2jPKM=;
  b=EjMzw8NFpTL16qBoI8dx6kdbfi9tzHCQSghHKBdbFnAGK/OAeb8RJdzX
   D76DMfRNRlX1XOa8qwpDXxgXjeUh/LJ7kN81L1GC9R/HcVdlO9pouULiu
   YhA5HeJiHKAjkclgOFu4a8DdrE3ruFbDL7EAZSUO49Y/BGKpK0/QAb6gV
   oVla9uX98UVRBwoDUvajNZ/FhafpGIqK+r79mRx+5XXWvswplq75jX1zO
   vkH6VDejSORDzReEBUCAcUOlz6Z4MbGqBrZ5T8UTok6zFbxtsZ8Pa8Y+M
   LCEn5Knl7V8kupmKIlAqoZJ4rKMU4aEAd4dEvqIDDAcbuujnDrzcHGfyh
   g==;
X-CSE-ConnectionGUID: UXVW6QLsS7msAQCdlfMigA==
X-CSE-MsgGUID: jl5Iw310RP+SrmOGQJqt+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68634453"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68634453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 08:05:46 -0800
X-CSE-ConnectionGUID: qK5X8pvZRTeut3pzDmZ+jQ==
X-CSE-MsgGUID: VcHyYHm9RcqkO82MFfc69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="201149051"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Dec 2025 08:05:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYnqQ-000000004Dv-2NnL;
	Thu, 25 Dec 2025 16:05:42 +0000
Date: Fri, 26 Dec 2025 00:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kernel/syscall.c:40 __do_sys_mmap2() warn:
 bitwise AND condition is false here
Message-ID: <202512260001.sU7sCBw0-lkp@intel.com>
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
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: 14338e631afd6d4b2c2f8fb7deba786d86c40fad LoongArch: Adjust system call for 32BIT/64BIT
date:   2 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 2 weeks ago
config: loongarch-randconfig-r071-20251225 (https://download.01.org/0day-ci/archive/20251226/202512260001.sU7sCBw0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512260001.sU7sCBw0-lkp@intel.com/

smatch warnings:
arch/loongarch/kernel/syscall.c:40 __do_sys_mmap2() warn: bitwise AND condition is false here
arch/loongarch/kernel/syscall.c:40 __do_sys_mmap2() warn: bitwise AND condition is false here

vim +40 arch/loongarch/kernel/syscall.c

be769645a2aef5 Huacai Chen 2022-05-31  36  
14338e631afd6d Huacai Chen 2025-12-08  37  SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len, unsigned long,
14338e631afd6d Huacai Chen 2025-12-08  38  		 prot, unsigned long, flags, unsigned long, fd, unsigned long, offset)
14338e631afd6d Huacai Chen 2025-12-08  39  {
14338e631afd6d Huacai Chen 2025-12-08 @40  	if (offset & (~PAGE_MASK >> 12))
14338e631afd6d Huacai Chen 2025-12-08  41  		return -EINVAL;
14338e631afd6d Huacai Chen 2025-12-08  42  
14338e631afd6d Huacai Chen 2025-12-08  43  	return ksys_mmap_pgoff(addr, len, prot, flags, fd, offset >> (PAGE_SHIFT - 12));
14338e631afd6d Huacai Chen 2025-12-08  44  }
14338e631afd6d Huacai Chen 2025-12-08  45  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
