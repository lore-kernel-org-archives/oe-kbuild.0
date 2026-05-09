Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA1393DF9
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778335161; cv=none; b=CVguaW8sO7JZjWNb9GUXD2HxxjjwEzBDU5ASnpgHAGhsFRcVks3oqmokbIzNu4CAhKe5b4H+S8fhCrRA6XaxWTMCYmH5suH7WQfdNN68Dkf6IArCS+GKbi2Fd+lRebvavvWGJk+qlg8d00yDxzTlGod/82wstddlggysld/YjHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778335161; c=relaxed/simple;
	bh=siqauffrcwDWwZeSRuIZWPaV8TPTDsFogmLo0aAtRLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=milQSPC11cjPe/7cnlLhT5mMFJMY6BrV0/29OeFMlhNaxC7KInCFcbdm4YZclfNrwJIhrl9qfdyAeu/vZVTugph9Ty+8i9rcjJFxb70ncAA/QTi4jqDU9zmCQkTJ4O7pwQDv1KBfXrt62Dp0uWQrXGGuuwJRWmh54y12MiUAcTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KeD4E9Kp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeD4E9Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778335159; x=1809871159;
  h=date:from:to:cc:subject:message-id;
  bh=siqauffrcwDWwZeSRuIZWPaV8TPTDsFogmLo0aAtRLM=;
  b=KeD4E9KpThCLFJa++mgwPze5bhDRbuW3kwjGuPhocNk6uaaDaAQ+dQ7v
   pG6P42OraK+MOD1co8Ucl/w4SA9qxjS1KaJAWLmY2x4C0nz1zu8S68Y9E
   NxfGoVqOX5HKqzGTkT/R5zaQ0EJ3IvO0VI9Ksoxx1Eei/o4FPoM5ejPFc
   0FgS0QBt+q0Z6sqMsoDj+E4fE2rwlF6HT08bhD2Xj8SzeMSUUvK3CCvMl
   evAa59G4I/iagWSF3T8Jrf9b0HDnYCr2Bl3+W/xfu0/30Bv8HboQsjmYe
   6UI63Wk1yBWP9zzKV4mWA4pY6H6ot1UbRAaOj/s2narwI6+JfLeUiKB9k
   g==;
X-CSE-ConnectionGUID: yzp/Wnb8SDKpHNGyrjwKqQ==
X-CSE-MsgGUID: kj7fi+UCQxmzBQ2WMD5UuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="101961961"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="101961961"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 06:59:19 -0700
X-CSE-ConnectionGUID: lTVay4CzQKWdCR+JYM7hmA==
X-CSE-MsgGUID: Omz0U3pYSDyN5p4/4PJCEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="236050868"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 May 2026 06:59:18 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLiD4-0000000012T-073h;
	Sat, 09 May 2026 13:59:14 +0000
Date: Sat, 09 May 2026 21:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kdave-btrfs-devel:misc-next 10/49]
 include/linux/printk.h:511:44: warning: 'root_flags' may be used
 uninitialized in this function
Message-ID: <202605092100.OyG03JLb-lkp@intel.com>
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

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   14fb724334a73052528e726147a84a08c813f8c4
commit: 18b9df2ee78c2288fa19223f14a029eaff497d8e [10/49] btrfs: make more ASSERTs verbose, part 3
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: nios2-randconfig-001 (https://download.01.org/0day-ci/archive/20260509/202605092100.OyG03JLb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092100.OyG03JLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605092100.OyG03JLb-lkp@intel.com/

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
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                            ^~~~~~~
   fs/btrfs/ioctl.c:4904:13: note: 'root_flags' was declared here
    4904 |         u64 root_flags;
         |             ^~~~~~~~~~


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
