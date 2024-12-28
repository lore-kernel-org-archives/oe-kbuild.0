Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DAD635
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Dec 2024 05:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735362155; cv=none; b=SgdT4S2Y/Pb3k/USF6SHLiOQOoJDfop6+bGwrA1M+9NU0qgKjvtstF+Az+xgVHpc3mCTPkOME1JtbjA2ls2Nv2Khxez6TTx1sQqEXhMXY2uLfCYGNI4XT1Nnr2pTFbc8D2gOzBju96vOGGueEgM/HpqWoY0l335zg9s5EXshBsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735362155; c=relaxed/simple;
	bh=jcWeZljMutA4nZtTbJChfO3oi5U3pum0JLjSMDEvJ7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIPgtgn1jn9Tq+7HL/fl79jIkvt51BgZ89byBSubwBJHOi0KHKExeIKWy6TxgpCEHCMtiMMpEHNzRl5RkJN6zyKAw1yR187EEH7HKrGOd1eWhLQ0b9glLHcRsLiWvcb6h39TZCXIGmS7rIKSscu+2xMP0mVWRyeej9Wp/LJeT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxAcYZ1B; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxAcYZ1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735362154; x=1766898154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jcWeZljMutA4nZtTbJChfO3oi5U3pum0JLjSMDEvJ7g=;
  b=QxAcYZ1BIphslkNM8yuP2SjRQ1zJVop5dO133rKz1l2gkvwdWtEuIynD
   glw88W3jDmjjcm7+dXL7xMgEGQsFoxStEPL/JXdmCLyKeYPgPdXzUqgp2
   bUSD0ruzSWrAsQu3OJ2BWh2TDmv/dLd4lFCfwMhgT+Un+9ifzx33z3P1/
   ZgRXENyokinCw4miSXFa8/pme5R2r7yZX952ylFGtLgvTiiYeJXBtmBsR
   NndvRLVoUBtVt4IV1zOsGZRSrrJcF/+gGpWIDB4QBeHVd52iOtxiUNqpB
   r5AwitctDXHy0CCOdLmw4kXcsbXidzkbkpShDPvRrWbPcVkTtwAxrN+t9
   g==;
X-CSE-ConnectionGUID: 3H/HVbm8TWeE5kL2Em51VQ==
X-CSE-MsgGUID: 4NENcJhATIyYGE1TyS9Kbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35649644"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35649644"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 21:02:33 -0800
X-CSE-ConnectionGUID: EvVE49aIQDSrODwJ/nsYGQ==
X-CSE-MsgGUID: jsyikACjRTuZXvtrrmBYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100139424"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Dec 2024 21:02:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tROy5-0003rl-1e;
	Sat, 28 Dec 2024 05:02:29 +0000
Date: Sat, 28 Dec 2024 13:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/binfmt_flat.c:885 load_flat_binary() warn: we never enter this
 loop
Message-ID: <202412281226.ocayatGI-lkp@intel.com>
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
TO: Kees Cook <kees@kernel.org>
CC: "Stefan O'Rear" <sorear@fastmail.com>
CC: Damien Le Moal <dlemoal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: 3eb3cd5992f7a0c37edc8d05b4c38c98758d8671 binfmt_flat: Fix corruption when not offsetting data start
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-r072-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281226.ocayatGI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412281226.ocayatGI-lkp@intel.com/

smatch warnings:
fs/binfmt_flat.c:885 load_flat_binary() warn: we never enter this loop

vim +885 fs/binfmt_flat.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  849  
^1da177e4c3f41 Linus Torvalds    2005-04-16  850  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  851   * These are the functions used to load flat style executables and shared
^1da177e4c3f41 Linus Torvalds    2005-04-16  852   * libraries.  There is no binary dependent code anywhere else.
^1da177e4c3f41 Linus Torvalds    2005-04-16  853   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  854  
71613c3b871c5a Al Viro           2012-10-20  855  static int load_flat_binary(struct linux_binprm *bprm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  856  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  857  	struct lib_info libinfo;
71613c3b871c5a Al Viro           2012-10-20  858  	struct pt_regs *regs = current_pt_regs();
015feacf932108 Nicolas Pitre     2016-07-24  859  	unsigned long stack_len = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  860  	unsigned long start_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  861  	int res;
^1da177e4c3f41 Linus Torvalds    2005-04-16  862  	int i, j;
^1da177e4c3f41 Linus Torvalds    2005-04-16  863  
^1da177e4c3f41 Linus Torvalds    2005-04-16  864  	memset(&libinfo, 0, sizeof(libinfo));
13c3f50c914e6a Nicolas Pitre     2016-07-24  865  
^1da177e4c3f41 Linus Torvalds    2005-04-16  866  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  867  	 * We have to add the size of our arguments to our stack size
^1da177e4c3f41 Linus Torvalds    2005-04-16  868  	 * otherwise it's too easy for users to create stack overflows
^1da177e4c3f41 Linus Torvalds    2005-04-16  869  	 * by passing in a huge argument list.  And yes,  we have to be
^1da177e4c3f41 Linus Torvalds    2005-04-16  870  	 * pedantic and include space for the argv/envp array as it may have
^1da177e4c3f41 Linus Torvalds    2005-04-16  871  	 * a lot of entries.
^1da177e4c3f41 Linus Torvalds    2005-04-16  872  	 */
015feacf932108 Nicolas Pitre     2016-07-24  873  #ifndef CONFIG_MMU
015feacf932108 Nicolas Pitre     2016-07-24  874  	stack_len += PAGE_SIZE * MAX_ARG_PAGES - bprm->p; /* the strings */
015feacf932108 Nicolas Pitre     2016-07-24  875  #endif
^1da177e4c3f41 Linus Torvalds    2005-04-16  876  	stack_len += (bprm->argc + 1) * sizeof(char *);   /* the argv array */
^1da177e4c3f41 Linus Torvalds    2005-04-16  877  	stack_len += (bprm->envc + 1) * sizeof(char *);   /* the envp array */
a97d157d00cd0c Nicolas Pitre     2016-07-24  878  	stack_len = ALIGN(stack_len, FLAT_STACK_ALIGN);
^1da177e4c3f41 Linus Torvalds    2005-04-16  879  
70578ff3367dd4 Eric W. Biederman 2022-04-20  880  	res = load_flat_file(bprm, &libinfo, &stack_len);
287980e49ffc0f Arnd Bergmann     2016-05-27  881  	if (res < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  882  		return res;
^1da177e4c3f41 Linus Torvalds    2005-04-16  883  
^1da177e4c3f41 Linus Torvalds    2005-04-16  884  	/* Update data segment pointers for all libraries */
3eb3cd5992f7a0 Kees Cook         2024-08-07 @885  	for (i = 0; i < MAX_SHARED_LIBS_UPDATE; i++) {
af521f92dcf636 Nicolas Pitre     2016-07-24  886  		if (!libinfo.lib_list[i].loaded)
af521f92dcf636 Nicolas Pitre     2016-07-24  887  			continue;
af521f92dcf636 Nicolas Pitre     2016-07-24  888  		for (j = 0; j < MAX_SHARED_LIBS; j++) {
af521f92dcf636 Nicolas Pitre     2016-07-24  889  			unsigned long val = libinfo.lib_list[j].loaded ?
^1da177e4c3f41 Linus Torvalds    2005-04-16  890  				libinfo.lib_list[j].start_data : UNLOADED_LIB;
af521f92dcf636 Nicolas Pitre     2016-07-24  891  			unsigned long __user *p = (unsigned long __user *)
af521f92dcf636 Nicolas Pitre     2016-07-24  892  				libinfo.lib_list[i].start_data;
af521f92dcf636 Nicolas Pitre     2016-07-24  893  			p -= j + 1;
af521f92dcf636 Nicolas Pitre     2016-07-24  894  			if (put_user(val, p))
af521f92dcf636 Nicolas Pitre     2016-07-24  895  				return -EFAULT;
af521f92dcf636 Nicolas Pitre     2016-07-24  896  		}
af521f92dcf636 Nicolas Pitre     2016-07-24  897  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  898  
^1da177e4c3f41 Linus Torvalds    2005-04-16  899  	set_binfmt(&flat_format);
^1da177e4c3f41 Linus Torvalds    2005-04-16  900  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
