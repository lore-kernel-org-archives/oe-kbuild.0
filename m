Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A383101C8
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190118; cv=none; b=FvYByvpdOmVg0fvZR+zMRw5vkTIEXejRB2+JQJkYH7xiE+BpoKeQl2kgcxNQbacX21EAHQXc2lpEKa96da5jYhA+uw25dPHDe1mqiow8MSom2lRjwVbBbf/oiy9Pf8BDjCrL2v3w53hN0JQC+5a2xe9mO1DkxNoZ4P9sdNo18M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190118; c=relaxed/simple;
	bh=n8E88LSHgwr7UFIVUU+6g8AcLOuCZChhUGFQEtWHf8g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CEXqoKe2qCprH9Ra0TD0gShDeJfUlXFyGJrngsSmFLcCXGCPWASNex65BMZDwoO7SDRelU+zrr5X8WtBOoWVGLHiYKGj8VnHkQXm5zDaeh/3prTzitNBAnUso+HizD4O+F2K9iZyq7+MOfkRo/U0/0uXMAAKptaz68AyXOchUTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgOi0T3Q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgOi0T3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781190116; x=1812726116;
  h=date:from:to:cc:subject:message-id;
  bh=n8E88LSHgwr7UFIVUU+6g8AcLOuCZChhUGFQEtWHf8g=;
  b=jgOi0T3Qvt+/kA+WzMfl5YQ/P3Xwa7VcKfGzlSCZixYMeAhjI5tfpPmi
   8wZU5rWYvoHLpa8DvsrMDB/0RSNyfO9H/s4vAunP5dMR0Mz0JWPaAKgkD
   GoZhMmrRy429TcJEBSdtgByMTMnFzn3REcWl1Osv0pDVfSJI7fzPn40K9
   G4Fc312w+fxyqVYFvAxO/nYdrVDnvlr3MZa0J2KrBZVx5GxtK3sj3NT1N
   80ZyYn74oCycJY6Yt1EnFqeTK/tTN2uKD1zXq2+qRiQWKKEbsBxLWNdp5
   qvRGXx8fmuVomd5OB5sW3Sgn09/sjKLppJreNZ1Qk6i2VpapHrSqqSU2M
   Q==;
X-CSE-ConnectionGUID: zHnWPscSSnW0Pu2Cfu4/bg==
X-CSE-MsgGUID: OkL5GjazTtC9mb5BIW/uFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69550102"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="69550102"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:01:49 -0700
X-CSE-ConnectionGUID: 3nbM0zr2SIGb5M5F1Q4emA==
X-CSE-MsgGUID: NcK4i+UbSq+B/52HUd09Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251593171"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 08:01:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXguf-00000000NH6-1OIw;
	Thu, 11 Jun 2026 15:01:45 +0000
Date: Thu, 11 Jun 2026 23:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11410/13002]
 include/linux/printk.h:511:44: warning: 'root_flags' may be used
 uninitialized in this function
Message-ID: <202606112245.MoLYDw1w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: 3fc0803f1c644e60b24cdb175109fcae83b2849a [11410/13002] btrfs: make more ASSERTs verbose, part 3
:::::: branch date: 23 hours ago
:::::: commit date: 3 days ago
config: nios2-randconfig-r072-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112245.MoLYDw1w-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112245.MoLYDw1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606112245.MoLYDw1w-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from include/asm-generic/bitops.h:31,
                    from ./arch/nios2/include/generated/asm/bitops.h:1,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from fs/btrfs/ioctl.c:6:
   fs/btrfs/ioctl.c: In function 'btrfs_ioctl_subvol_sync':
>> include/linux/printk.h:511:44: warning: 'root_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                               ^~~~~~~
   fs/btrfs/ioctl.c:4904:6: note: 'root_flags' was declared here
     u64 root_flags;
         ^~~~~~~~~~


vim +/root_flags +511 include/linux/printk.h

337015573718b16 Chris Down      2021-06-15  459  
337015573718b16 Chris Down      2021-06-15  460  /*
337015573718b16 Chris Down      2021-06-15  461   * Some subsystems have their own custom printk that applies a va_format to a
337015573718b16 Chris Down      2021-06-15  462   * generic format, for example, to include a device number or other metadata
337015573718b16 Chris Down      2021-06-15  463   * alongside the format supplied by the caller.
337015573718b16 Chris Down      2021-06-15  464   *
337015573718b16 Chris Down      2021-06-15  465   * In order to store these in the way they would be emitted by the printk
337015573718b16 Chris Down      2021-06-15  466   * infrastructure, the subsystem provides us with the start, fixed string, and
337015573718b16 Chris Down      2021-06-15  467   * any subsequent text in the format string.
337015573718b16 Chris Down      2021-06-15  468   *
337015573718b16 Chris Down      2021-06-15  469   * We take a variable argument list as pr_fmt/dev_fmt/etc are sometimes passed
337015573718b16 Chris Down      2021-06-15  470   * as multiple arguments (eg: `"%s: ", "blah"`), and we must only take the
337015573718b16 Chris Down      2021-06-15  471   * first one.
337015573718b16 Chris Down      2021-06-15  472   *
337015573718b16 Chris Down      2021-06-15  473   * subsys_fmt_prefix must be known at compile time, or compilation will fail
337015573718b16 Chris Down      2021-06-15  474   * (since this is a mistake). If fmt or level is not known at compile time, no
337015573718b16 Chris Down      2021-06-15  475   * index entry will be made (since this can legitimately happen).
337015573718b16 Chris Down      2021-06-15  476   */
337015573718b16 Chris Down      2021-06-15  477  #define printk_index_subsys_emit(subsys_fmt_prefix, level, fmt, ...) \
337015573718b16 Chris Down      2021-06-15  478  	__printk_index_emit(fmt, level, subsys_fmt_prefix)
337015573718b16 Chris Down      2021-06-15  479  
337015573718b16 Chris Down      2021-06-15  480  #define printk_index_wrap(_p_func, _fmt, ...)				\
337015573718b16 Chris Down      2021-06-15  481  	({								\
337015573718b16 Chris Down      2021-06-15  482  		__printk_index_emit(_fmt, NULL, NULL);			\
337015573718b16 Chris Down      2021-06-15  483  		_p_func(_fmt, ##__VA_ARGS__);				\
337015573718b16 Chris Down      2021-06-15  484  	})
337015573718b16 Chris Down      2021-06-15  485  
337015573718b16 Chris Down      2021-06-15  486  
7d9e2661f268585 Jonathan Corbet 2021-07-25  487  /**
7d9e2661f268585 Jonathan Corbet 2021-07-25  488   * printk - print a kernel message
7d9e2661f268585 Jonathan Corbet 2021-07-25  489   * @fmt: format string
7d9e2661f268585 Jonathan Corbet 2021-07-25  490   *
7d9e2661f268585 Jonathan Corbet 2021-07-25  491   * This is printk(). It can be called from any context. We want it to work.
7d9e2661f268585 Jonathan Corbet 2021-07-25  492   *
7d9e2661f268585 Jonathan Corbet 2021-07-25  493   * If printk indexing is enabled, _printk() is called from printk_index_wrap.
7d9e2661f268585 Jonathan Corbet 2021-07-25  494   * Otherwise, printk is simply #defined to _printk.
7d9e2661f268585 Jonathan Corbet 2021-07-25  495   *
7d9e2661f268585 Jonathan Corbet 2021-07-25  496   * We try to grab the console_lock. If we succeed, it's easy - we log the
7d9e2661f268585 Jonathan Corbet 2021-07-25  497   * output and call the console drivers.  If we fail to get the semaphore, we
7d9e2661f268585 Jonathan Corbet 2021-07-25  498   * place the output into the log buffer and return. The current holder of
7d9e2661f268585 Jonathan Corbet 2021-07-25  499   * the console_sem will notice the new output in console_unlock(); and will
7d9e2661f268585 Jonathan Corbet 2021-07-25  500   * send it to the consoles before releasing the lock.
7d9e2661f268585 Jonathan Corbet 2021-07-25  501   *
7d9e2661f268585 Jonathan Corbet 2021-07-25  502   * One effect of this deferred printing is that code which calls printk() and
7d9e2661f268585 Jonathan Corbet 2021-07-25  503   * then changes console_loglevel may break. This is because console_loglevel
7d9e2661f268585 Jonathan Corbet 2021-07-25  504   * is inspected when the actual printing occurs.
7d9e2661f268585 Jonathan Corbet 2021-07-25  505   *
7d9e2661f268585 Jonathan Corbet 2021-07-25  506   * See also:
7d9e2661f268585 Jonathan Corbet 2021-07-25  507   * printf(3)
7d9e2661f268585 Jonathan Corbet 2021-07-25  508   *
7d9e2661f268585 Jonathan Corbet 2021-07-25  509   * See the vsnprintf() documentation for format string extensions over C99.
7d9e2661f268585 Jonathan Corbet 2021-07-25  510   */
337015573718b16 Chris Down      2021-06-15 @511  #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
337015573718b16 Chris Down      2021-06-15  512  #define printk_deferred(fmt, ...)					\
337015573718b16 Chris Down      2021-06-15  513  	printk_index_wrap(_printk_deferred, fmt, ##__VA_ARGS__)
337015573718b16 Chris Down      2021-06-15  514  

:::::: The code at line 511 was first introduced by commit
:::::: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format indexing support

:::::: TO: Chris Down <chris@chrisdown.name>
:::::: CC: Petr Mladek <pmladek@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
