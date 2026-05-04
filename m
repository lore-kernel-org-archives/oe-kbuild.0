Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BA537CD22
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 23:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777936910; cv=none; b=YhzUxFiFTYxFocV9ksTbMTaOhFHp0qHW3ZODHBJIT3GYT/+wWmrFNCf20H3Zh1DnpwunfUxB4V9Jt5xnKgBtf4eLyQpjzOpVRWlVfrcSM2oYQ4cw48Cfr8+p8uyYdyEJ2ErOyOBBmwk8CCM5JGvz8CGQElx30ixhrreknhogRvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777936910; c=relaxed/simple;
	bh=/hwRMYJZiPhX0g6Vl8445ocbNan7+siKRRZwbaEtzyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4ejH1wipJjxvy7ruyJczXPy4pROZ4gTvi5p19dW0A0/Q13erbIQPjIqQua97GX68dqdyQKHWjNFI73HD+KC8cMoWOwaLEUPOoemu3VFeo92/+/zWbGx0rDSXBq3d5gww0KjxWuUXOK+E8a+E96ImvQzHO/RBF5J8qylqQbbGsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6bCiPRj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6bCiPRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777936909; x=1809472909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/hwRMYJZiPhX0g6Vl8445ocbNan7+siKRRZwbaEtzyM=;
  b=L6bCiPRjU7QVA9yAKQTMd5ZRx5ebRTKfFbwQbZA+73ZIGXvwKre3KWLU
   OYAt7Gewscw7UPWMIBux9P+RuPuJLcbTehwYJLQAheCDJcbdsXuf/TLIR
   nNyEPdJXq1kh1mzPZ9cjQ9O8x2mhBGIoCudny/Q8re7bZyGLVhaIefQpk
   clTJiNPIzcBcg4JS4vTv+K2dZLJBbTrnktKtq6C/0yd6c1186nr5Db8sJ
   jQU1RLrMomNE9JsEVAxmsTk3ASYOj8agY7rgjrdeTn7hAt+YrSPy1Q/Ti
   syRxPWHov0a/eZZwLSAhjPifE47zeZkHPqOCksANYhc5F7mGXA/XOZgOQ
   w==;
X-CSE-ConnectionGUID: TGSc5NaJSy2N/LTsl/f6dQ==
X-CSE-MsgGUID: u6rOy7L8Spae+WjnDN7kug==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78704420"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78704420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 16:21:49 -0700
X-CSE-ConnectionGUID: Ly798VSIRnSOhsPOtV2LeQ==
X-CSE-MsgGUID: JAup5D6QRtGqE/gGU16D9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="229167325"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 May 2026 16:21:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK2bh-0000000060b-0LmY;
	Mon, 04 May 2026 23:21:45 +0000
Date: Tue, 5 May 2026 01:21:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 3/3] Documentation: seccomp: document
 SECCOMP_IOCTL_NOTIF_PIN_ARGS
Message-ID: <202605050129.B3YAN4S1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260504011207.539408-4-xiyou.wangcong@gmail.com>
References: <20260504011207.539408-4-xiyou.wangcong@gmail.com>
TO: Cong Wang <xiyou.wangcong@gmail.com>

Hi Cong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v7.1-rc2 next-20260504]
[cannot apply to kees/for-next/seccomp]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/seccomp-add-SECCOMP_IOCTL_NOTIF_PIN_ARGS-to-close-the-unotify-TOCTOU-race/20260504-110704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260504011207.539408-4-xiyou.wangcong%40gmail.com
patch subject: [RFC PATCH 3/3] Documentation: seccomp: document SECCOMP_IOCTL_NOTIF_PIN_ARGS
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260505/202605050129.B3YAN4S1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050129.B3YAN4S1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605050129.B3YAN4S1-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/exec.c: In function 'copy_strings_from_pin':
>> fs/exec.c:478:24: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     478 |         if (!pin || pin->kind != SECCOMP_PIN_CSTRING_ARRAY)
         |                        ^~
   fs/exec.c:481:21: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     481 |         header = pin->data;
         |                     ^~
   fs/exec.c:483:36: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     483 |         strings = (const char *)pin->data;
         |                                    ^~
   fs/exec.c:494:31: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     494 |                 if (off >= pin->size)
         |                               ^~
--
   fs/namei.c: In function 'getname_flags':
>> fs/namei.c:239:23: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     239 |         if (pin && pin->kind == SECCOMP_PIN_CSTRING) {
         |                       ^~
   fs/namei.c:240:24: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     240 |                 if (pin->size <= 1 && !(flags & LOOKUP_EMPTY))
         |                        ^~
   fs/namei.c:242:42: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     242 |                 return getname_kernel(pin->data);
         |                                          ^~
--
   lib/iov_iter.c: In function 'import_ubuf':
>> lib/iov_iter.c:1461:23: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
    1461 |         if (pin && pin->kind == SECCOMP_PIN_FIXED) {
         |                       ^~
   In file included from ./include/linux/nodemask.h:92,
                    from ./include/linux/numa.h:6,
                    from ./include/linux/cpumask.h:15,
                    from ./arch/x86/include/asm/paravirt.h:19,
                    from ./arch/x86/include/asm/irqflags.h:100,
                    from ./include/linux/irqflags.h:18,
                    from ./arch/x86/include/asm/special_insns.h:10,
                    from ./arch/x86/include/asm/processor.h:25,
                    from ./arch/x86/include/asm/timex.h:5,
                    from ./include/linux/timex.h:67,
                    from ./include/linux/time32.h:13,
                    from ./include/linux/time.h:60,
                    from ./include/linux/stat.h:19,
                    from ./include/linux/fs_dirent.h:5,
                    from ./include/linux/fs/super_types.h:5,
                    from ./include/linux/fs/super.h:5,
                    from ./include/linux/fs.h:5,
                    from ./include/linux/highmem.h:5,
                    from ./include/linux/bvec.h:10,
                    from lib/iov_iter.c:3:
   lib/iov_iter.c:1464:58: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
    1464 |                         size_t n = min_t(size_t, len, pin->size);
         |                                                          ^~
   ./include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   ./include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
     161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ^~~~~~~~~~
   lib/iov_iter.c:1464:36: note: in expansion of macro 'min_t'
    1464 |                         size_t n = min_t(size_t, len, pin->size);
         |                                    ^~~~~
--
   In file included from ./include/linux/nodemask.h:92,
                    from ./include/linux/numa.h:6,
                    from ./include/linux/cpumask.h:15,
                    from ./include/linux/alloc_tag.h:13,
                    from ./include/linux/workqueue.h:9,
                    from ./include/linux/bpf.h:11,
                    from ./include/linux/bpf-cgroup.h:5,
                    from net/socket.c:55:
   net/socket.c: In function 'move_addr_to_kernel':
>> net/socket.c:265:59: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     265 |                 size_t n = min_t(size_t, (size_t)ulen, pin->size);
         |                                                           ^~
   ./include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   ./include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
     161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ^~~~~~~~~~
   net/socket.c:265:28: note: in expansion of macro 'min_t'
     265 |                 size_t n = min_t(size_t, (size_t)ulen, pin->size);
         |                            ^~~~~
   In file included from ./include/linux/string.h:386,
                    from ./include/linux/bitmap.h:13,
                    from ./include/linux/cpumask.h:11:
   net/socket.c:267:34: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     267 |                 memcpy(kaddr, pin->data, n);
         |                                  ^~
   ./include/linux/fortify-string.h:627:34: note: in definition of macro '__fortify_memcpy_chk'
     627 |         const size_t __q_size = (q_size);                               \
         |                                  ^~~~~~
   ./include/linux/fortify-string.h:689:35: note: in expansion of macro '__struct_size'
     689 |                 __struct_size(p), __struct_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   net/socket.c:267:17: note: in expansion of macro 'memcpy'
     267 |                 memcpy(kaddr, pin->data, n);
         |                 ^~~~~~
   net/socket.c:267:34: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     267 |                 memcpy(kaddr, pin->data, n);
         |                                  ^~
   ./include/linux/fortify-string.h:629:40: note: in definition of macro '__fortify_memcpy_chk'
     629 |         const size_t __q_size_field = (q_size_field);                   \
         |                                        ^~~~~~~~~~~~
   ./include/linux/fortify-string.h:690:35: note: in expansion of macro '__member_size'
     690 |                 __member_size(p), __member_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   net/socket.c:267:17: note: in expansion of macro 'memcpy'
     267 |                 memcpy(kaddr, pin->data, n);
         |                 ^~~~~~
   net/socket.c:267:34: error: invalid use of undefined type 'const struct seccomp_pinned_arg'
     267 |                 memcpy(kaddr, pin->data, n);
         |                                  ^~
   ./include/linux/fortify-string.h:643:30: note: in definition of macro '__fortify_memcpy_chk'
     643 |         __underlying_##op(p, q, __copy_size);                           \
         |                              ^
   net/socket.c:267:17: note: in expansion of macro 'memcpy'
     267 |                 memcpy(kaddr, pin->data, n);
         |                 ^~~~~~


vim +478 fs/exec.c

655c16a8ce9c15 Oleg Nesterov  2019-01-03  443  
^1da177e4c3f41 Linus Torvalds 2005-04-16  444  /*
b6a2fea39318e4 Ollie Wild     2007-07-19  445   * 'copy_strings()' copies argument/environment strings from the old
b6a2fea39318e4 Ollie Wild     2007-07-19  446   * processes's memory to the new process's stack.  The call to get_user_pages()
b6a2fea39318e4 Ollie Wild     2007-07-19  447   * ensures the destination page is created and not swapped out.
^1da177e4c3f41 Linus Torvalds 2005-04-16  448   */
896399121ebc7e Cong Wang      2026-05-03  449  /*
896399121ebc7e Cong Wang      2026-05-03  450   * If a seccomp PIN_ARGS snapshot covers this argv/envp pointer table,
896399121ebc7e Cong Wang      2026-05-03  451   * push each pinned string onto the bprm stack directly via
896399121ebc7e Cong Wang      2026-05-03  452   * copy_string_kernel(), bypassing the per-string strnlen_user() and
896399121ebc7e Cong Wang      2026-05-03  453   * copy_from_user() that would otherwise re-read mutated user memory.
896399121ebc7e Cong Wang      2026-05-03  454   *
896399121ebc7e Cong Wang      2026-05-03  455   * Returns 0 on success, a negative errno on failure, or +1 if no pin
896399121ebc7e Cong Wang      2026-05-03  456   * applied and the caller should run the normal user-memory walk.
896399121ebc7e Cong Wang      2026-05-03  457   */
896399121ebc7e Cong Wang      2026-05-03  458  static int copy_strings_from_pin(struct user_arg_ptr argv,
896399121ebc7e Cong Wang      2026-05-03  459  				 struct linux_binprm *bprm)
896399121ebc7e Cong Wang      2026-05-03  460  {
896399121ebc7e Cong Wang      2026-05-03  461  	const struct seccomp_pinned_arg *pin;
896399121ebc7e Cong Wang      2026-05-03  462  	const u32 *header;
896399121ebc7e Cong Wang      2026-05-03  463  	const char *strings;
896399121ebc7e Cong Wang      2026-05-03  464  	u32 count, i;
896399121ebc7e Cong Wang      2026-05-03  465  	u64 user_argv;
896399121ebc7e Cong Wang      2026-05-03  466  
896399121ebc7e Cong Wang      2026-05-03  467  #ifdef CONFIG_COMPAT
896399121ebc7e Cong Wang      2026-05-03  468  	user_argv = (u64)(uintptr_t)(argv.is_compat ?
896399121ebc7e Cong Wang      2026-05-03  469  		(const void __user *)argv.ptr.compat :
896399121ebc7e Cong Wang      2026-05-03  470  		(const void __user *)argv.ptr.native);
896399121ebc7e Cong Wang      2026-05-03  471  #else
896399121ebc7e Cong Wang      2026-05-03  472  	user_argv = (u64)(uintptr_t)argv.ptr.native;
896399121ebc7e Cong Wang      2026-05-03  473  #endif
896399121ebc7e Cong Wang      2026-05-03  474  	if (!user_argv)
896399121ebc7e Cong Wang      2026-05-03  475  		return 1;
896399121ebc7e Cong Wang      2026-05-03  476  
896399121ebc7e Cong Wang      2026-05-03  477  	pin = seccomp_pin_lookup_current(user_argv);
896399121ebc7e Cong Wang      2026-05-03 @478  	if (!pin || pin->kind != SECCOMP_PIN_CSTRING_ARRAY)
896399121ebc7e Cong Wang      2026-05-03  479  		return 1;
896399121ebc7e Cong Wang      2026-05-03  480  
896399121ebc7e Cong Wang      2026-05-03  481  	header = pin->data;
896399121ebc7e Cong Wang      2026-05-03  482  	count = header[0];
896399121ebc7e Cong Wang      2026-05-03  483  	strings = (const char *)pin->data;
896399121ebc7e Cong Wang      2026-05-03  484  
896399121ebc7e Cong Wang      2026-05-03  485  	/*
896399121ebc7e Cong Wang      2026-05-03  486  	 * copy_strings() processes argv backwards (highest index first)
896399121ebc7e Cong Wang      2026-05-03  487  	 * because it grows the bprm stack downward. Match that ordering
896399121ebc7e Cong Wang      2026-05-03  488  	 * so the resulting stack layout is identical.
896399121ebc7e Cong Wang      2026-05-03  489  	 */
896399121ebc7e Cong Wang      2026-05-03  490  	for (i = count; i-- > 0; ) {
896399121ebc7e Cong Wang      2026-05-03  491  		u32 off = header[1 + i];
896399121ebc7e Cong Wang      2026-05-03  492  		int ret;
896399121ebc7e Cong Wang      2026-05-03  493  
896399121ebc7e Cong Wang      2026-05-03  494  		if (off >= pin->size)
896399121ebc7e Cong Wang      2026-05-03  495  			return -EINVAL;
896399121ebc7e Cong Wang      2026-05-03  496  		ret = copy_string_kernel(strings + off, bprm);
896399121ebc7e Cong Wang      2026-05-03  497  		if (ret < 0)
896399121ebc7e Cong Wang      2026-05-03  498  			return ret;
896399121ebc7e Cong Wang      2026-05-03  499  		if (fatal_signal_pending(current))
896399121ebc7e Cong Wang      2026-05-03  500  			return -ERESTARTNOHAND;
896399121ebc7e Cong Wang      2026-05-03  501  		cond_resched();
896399121ebc7e Cong Wang      2026-05-03  502  	}
896399121ebc7e Cong Wang      2026-05-03  503  	return 0;
896399121ebc7e Cong Wang      2026-05-03  504  }
896399121ebc7e Cong Wang      2026-05-03  505  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
