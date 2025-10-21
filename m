Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1023431ED
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761061526; cv=none; b=rdyaMTu2QdbfZ3Fh9QVT4Po4PTG3D+eJCuDtAFoGeTC7JzuoSbmZLKlpab/iRF4W/K+WAXaQjTgWoHinVFIkFUmx83ZBuqpi9D+nFon9JmqlNrXT4fsK2Jxi3w/aESKc8bztIEISrxy+ocFd47CHplz0kYXdQyayJtzmBiwH8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761061526; c=relaxed/simple;
	bh=/P7a5iPS36oGSrc/rkAygWu3E4PJgMVase8WQ1XNMOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NoCf8y2dxgKxwCFsmOiRbhFBtGt3HzXpxLnLCjVIPM/ExFg+Ls1UWju6Vne9ghKbdWzZJOnrg65kwXnECnEryYeiCiIptDqRw9uvT6E9HKl6sHqtvlYJ9Wwfn2w5uQTVEpb35/aWsf1p0QY7sXVcXmHphUwTZf/qxNCBGJueOhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRDcyXoj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRDcyXoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761061524; x=1792597524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/P7a5iPS36oGSrc/rkAygWu3E4PJgMVase8WQ1XNMOI=;
  b=LRDcyXojphkGIY6nXk7vlA+tSrJNbNdGLAhguTRf14Zz4Ivt1P+c5Xnc
   cXvoCwFMfGkl5ylh+Ct362bv5aU6LEVf5BKYBikbfbTcG6RJtExvZrg2k
   atoYGAWKzu8Far6oZPFWtzI0mQuFt10G+9LJCz2tY5R51PGmdtR4TqYJi
   WTsmF5dwxfYK39+J1gzOcxSJk49DrCGf4FAnghQwzTfwKQjTH3bcF4Vol
   8Ixsuhx7bVtOpTzHEd3Q/ckOg0XDBt31Ku3e1u2w69EJmtgaooEq4fSNb
   FgAH3560Z+66E2G6wJKRNn26pjzgBVm4q4/YCyW9k82Rfl8o5SZ+iIskV
   Q==;
X-CSE-ConnectionGUID: 5H9y7fusTAyDzfO6paAD6A==
X-CSE-MsgGUID: kQRClDccSja6QnR6HT9RQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73862806"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="73862806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:45:23 -0700
X-CSE-ConnectionGUID: knAMZd2zSn22MY8LqN6Umw==
X-CSE-MsgGUID: cpiRjPjhSuiB/J9OMjExKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183326659"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2025 08:45:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBEY4-000AxP-1d;
	Tue, 21 Oct 2025 15:45:20 +0000
Date: Tue, 21 Oct 2025 23:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/kmsan/hooks.c:267:14: sparse: sparse: cast removes address space
 '__user' of expression
Message-ID: <202510212353.1hEG4lJQ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 5ff8c11775c744dc5076ce126eb1b3adce0a70ae KMSAN: Remove tautological checks
date:   8 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-r133-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212353.1hEG4lJQ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212353.1hEG4lJQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510212353.1hEG4lJQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kmsan/hooks.c:267:14: sparse: sparse: cast removes address space '__user' of expression
   mm/kmsan/hooks.c:279:50: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +267 mm/kmsan/hooks.c

b073d7f8aee4eb Alexander Potapenko 2022-09-15  245  
75cf0290271bf6 Alexander Potapenko 2022-09-15  246  void kmsan_copy_to_user(void __user *to, const void *from, size_t to_copy,
75cf0290271bf6 Alexander Potapenko 2022-09-15  247  			size_t left)
75cf0290271bf6 Alexander Potapenko 2022-09-15  248  {
75cf0290271bf6 Alexander Potapenko 2022-09-15  249  	unsigned long ua_flags;
75cf0290271bf6 Alexander Potapenko 2022-09-15  250  
75cf0290271bf6 Alexander Potapenko 2022-09-15  251  	if (!kmsan_enabled || kmsan_in_runtime())
75cf0290271bf6 Alexander Potapenko 2022-09-15  252  		return;
75cf0290271bf6 Alexander Potapenko 2022-09-15  253  	/*
75cf0290271bf6 Alexander Potapenko 2022-09-15  254  	 * At this point we've copied the memory already. It's hard to check it
75cf0290271bf6 Alexander Potapenko 2022-09-15  255  	 * before copying, as the size of actually copied buffer is unknown.
75cf0290271bf6 Alexander Potapenko 2022-09-15  256  	 */
75cf0290271bf6 Alexander Potapenko 2022-09-15  257  
75cf0290271bf6 Alexander Potapenko 2022-09-15  258  	/* copy_to_user() may copy zero bytes. No need to check. */
75cf0290271bf6 Alexander Potapenko 2022-09-15  259  	if (!to_copy)
75cf0290271bf6 Alexander Potapenko 2022-09-15  260  		return;
75cf0290271bf6 Alexander Potapenko 2022-09-15  261  	/* Or maybe copy_to_user() failed to copy anything. */
75cf0290271bf6 Alexander Potapenko 2022-09-15  262  	if (to_copy <= left)
75cf0290271bf6 Alexander Potapenko 2022-09-15  263  		return;
75cf0290271bf6 Alexander Potapenko 2022-09-15  264  
75cf0290271bf6 Alexander Potapenko 2022-09-15  265  	ua_flags = user_access_save();
f926e9326f3a79 Ilya Leoshkevich    2024-06-21  266  	if (!IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) ||
f926e9326f3a79 Ilya Leoshkevich    2024-06-21 @267  	    (u64)to < TASK_SIZE) {
75cf0290271bf6 Alexander Potapenko 2022-09-15  268  		/* This is a user memory access, check it. */
75cf0290271bf6 Alexander Potapenko 2022-09-15  269  		kmsan_internal_check_memory((void *)from, to_copy - left, to,
75cf0290271bf6 Alexander Potapenko 2022-09-15  270  					    REASON_COPY_TO_USER);
75cf0290271bf6 Alexander Potapenko 2022-09-15  271  	} else {
75cf0290271bf6 Alexander Potapenko 2022-09-15  272  		/* Otherwise this is a kernel memory access. This happens when a
75cf0290271bf6 Alexander Potapenko 2022-09-15  273  		 * compat syscall passes an argument allocated on the kernel
75cf0290271bf6 Alexander Potapenko 2022-09-15  274  		 * stack to a real syscall.
75cf0290271bf6 Alexander Potapenko 2022-09-15  275  		 * Don't check anything, just copy the shadow of the copied
75cf0290271bf6 Alexander Potapenko 2022-09-15  276  		 * bytes.
75cf0290271bf6 Alexander Potapenko 2022-09-15  277  		 */
e17c1f15b0ccfa Alexander Potapenko 2025-05-07  278  		kmsan_enter_runtime();
75cf0290271bf6 Alexander Potapenko 2022-09-15  279  		kmsan_internal_memmove_metadata((void *)to, (void *)from,
75cf0290271bf6 Alexander Potapenko 2022-09-15  280  						to_copy - left);
e17c1f15b0ccfa Alexander Potapenko 2025-05-07  281  		kmsan_leave_runtime();
75cf0290271bf6 Alexander Potapenko 2022-09-15  282  	}
75cf0290271bf6 Alexander Potapenko 2022-09-15  283  	user_access_restore(ua_flags);
75cf0290271bf6 Alexander Potapenko 2022-09-15  284  }
75cf0290271bf6 Alexander Potapenko 2022-09-15  285  EXPORT_SYMBOL(kmsan_copy_to_user);
75cf0290271bf6 Alexander Potapenko 2022-09-15  286  

:::::: The code at line 267 was first introduced by commit
:::::: f926e9326f3a79f7e01ac790e2361f44d8ca8320 kmsan: fix kmsan_copy_to_user() on arches with overlapping address spaces

:::::: TO: Ilya Leoshkevich <iii@linux.ibm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
