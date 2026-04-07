Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0E3375F9C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534378; cv=none; b=SJDOGE0a83LPyirb5wf/f+w5qMIWyy4CbQSRURQMgOcysYCQPi8YckSOeUBXLVPA3vwd+BQe+FY9IXlVNt3OBDaXoun9NZ+pzdlXGOZijDjuQdbVodowBs4oNlSIcXf/dCRMZEJes8S/f2xq+zO/vgE2K2ynn/xeuQKTC7CSEGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534378; c=relaxed/simple;
	bh=ikiyXDE588mYej/0xaDzXX0rX9Q9SGgGwWE56lFYHZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMEiDkghLpW2giTmM9AVeg95QqZAEjryETW/auWSKKwze9azgVSMyYvbuY8JDa8xm3CUuR96/c/QYOD27wyYJcSgZxnmZUL6x+oTb0OR7+o41/xD1WwY++2KOo1TOE1eTV+NAbZBRizboBPixsffCS//3Np7aSPY1tjFtKbf6a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HO86Ar+Q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HO86Ar+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534376; x=1807070376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ikiyXDE588mYej/0xaDzXX0rX9Q9SGgGwWE56lFYHZs=;
  b=HO86Ar+QyqARIDyata8Jn3av+0QPYJ4MA6N+NCeW8Z6MOlHRDApuBcEZ
   +9Xy3zmzPHet2cTRDA1Gnp/hrMEVdqcsl/Bxd1hMJWlglbD+PeJ8ZBJUa
   ljrZrxXC9xDz2vGicNKmJrW45R9BZyNoYQSGdh1NRuJ1XjzBNy2pkzC3H
   X90Hh2mXKQyxPwRvmoy9J4GEVf6Z9VJwttPz6+9zoWVtQfbC7XU1DPx18
   fVTqyQrsaFbh5tvJ92aD6IG4/d9mwu0zXBrajjA9yQ+Iqm0Zxh/Shs1Sj
   nyioTxJoZeT7wKDcBSzCePObHAQJhCBZYuo7F03eRmWy0yQnOizAxh6ss
   w==;
X-CSE-ConnectionGUID: 3ayomVEHRZquVQ3AbTd24w==
X-CSE-MsgGUID: S5E3YjIDRWGeXbgYLRrLmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76204317"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76204317"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:59:36 -0700
X-CSE-ConnectionGUID: mx7c9yDUTzqOAvyW/dZoDg==
X-CSE-MsgGUID: 3Tk6zFMLTi+FwI7ohgIedQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251193020"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:59:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xbB-0000000006b-0x7h;
	Tue, 07 Apr 2026 03:59:33 +0000
Date: Tue, 7 Apr 2026 11:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] btrfs: make more ASSERTs verbose, part 3
Message-ID: <202604051438.4BSUbQVi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260331223659.2098718-1-dsterba@suse.com>
References: <20260331223659.2098718-1-dsterba@suse.com>
TO: David Sterba <dsterba@suse.com>
TO: linux-btrfs@vger.kernel.org
CC: David Sterba <dsterba@suse.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20260403]
[cannot apply to linus/master v7.0-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Sterba/btrfs-make-more-ASSERTs-verbose-part-3/20260402-233149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20260331223659.2098718-1-dsterba%40suse.com
patch subject: [PATCH] btrfs: make more ASSERTs verbose, part 3
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-001-20260405 (https://download.01.org/0day-ci/archive/20260405/202604051438.4BSUbQVi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051438.4BSUbQVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604051438.4BSUbQVi-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:245,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from fs/btrfs/ioctl.c:6:
   fs/btrfs/ioctl.c: In function 'btrfs_ioctl_subvol_sync':
>> include/linux/printk.h:511:44: warning: 'root_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                            ^~~~~~~
   fs/btrfs/ioctl.c:4984:13: note: 'root_flags' was declared here
    4984 |         u64 root_flags;
         |             ^~~~~~~~~~


vim +/root_flags +511 include/linux/printk.h

337015573718b1 Chris Down      2021-06-15  459  
337015573718b1 Chris Down      2021-06-15  460  /*
337015573718b1 Chris Down      2021-06-15  461   * Some subsystems have their own custom printk that applies a va_format to a
337015573718b1 Chris Down      2021-06-15  462   * generic format, for example, to include a device number or other metadata
337015573718b1 Chris Down      2021-06-15  463   * alongside the format supplied by the caller.
337015573718b1 Chris Down      2021-06-15  464   *
337015573718b1 Chris Down      2021-06-15  465   * In order to store these in the way they would be emitted by the printk
337015573718b1 Chris Down      2021-06-15  466   * infrastructure, the subsystem provides us with the start, fixed string, and
337015573718b1 Chris Down      2021-06-15  467   * any subsequent text in the format string.
337015573718b1 Chris Down      2021-06-15  468   *
337015573718b1 Chris Down      2021-06-15  469   * We take a variable argument list as pr_fmt/dev_fmt/etc are sometimes passed
337015573718b1 Chris Down      2021-06-15  470   * as multiple arguments (eg: `"%s: ", "blah"`), and we must only take the
337015573718b1 Chris Down      2021-06-15  471   * first one.
337015573718b1 Chris Down      2021-06-15  472   *
337015573718b1 Chris Down      2021-06-15  473   * subsys_fmt_prefix must be known at compile time, or compilation will fail
337015573718b1 Chris Down      2021-06-15  474   * (since this is a mistake). If fmt or level is not known at compile time, no
337015573718b1 Chris Down      2021-06-15  475   * index entry will be made (since this can legitimately happen).
337015573718b1 Chris Down      2021-06-15  476   */
337015573718b1 Chris Down      2021-06-15  477  #define printk_index_subsys_emit(subsys_fmt_prefix, level, fmt, ...) \
337015573718b1 Chris Down      2021-06-15  478  	__printk_index_emit(fmt, level, subsys_fmt_prefix)
337015573718b1 Chris Down      2021-06-15  479  
337015573718b1 Chris Down      2021-06-15  480  #define printk_index_wrap(_p_func, _fmt, ...)				\
337015573718b1 Chris Down      2021-06-15  481  	({								\
337015573718b1 Chris Down      2021-06-15  482  		__printk_index_emit(_fmt, NULL, NULL);			\
337015573718b1 Chris Down      2021-06-15  483  		_p_func(_fmt, ##__VA_ARGS__);				\
337015573718b1 Chris Down      2021-06-15  484  	})
337015573718b1 Chris Down      2021-06-15  485  
337015573718b1 Chris Down      2021-06-15  486  
7d9e2661f26858 Jonathan Corbet 2021-07-25  487  /**
7d9e2661f26858 Jonathan Corbet 2021-07-25  488   * printk - print a kernel message
7d9e2661f26858 Jonathan Corbet 2021-07-25  489   * @fmt: format string
7d9e2661f26858 Jonathan Corbet 2021-07-25  490   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  491   * This is printk(). It can be called from any context. We want it to work.
7d9e2661f26858 Jonathan Corbet 2021-07-25  492   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  493   * If printk indexing is enabled, _printk() is called from printk_index_wrap.
7d9e2661f26858 Jonathan Corbet 2021-07-25  494   * Otherwise, printk is simply #defined to _printk.
7d9e2661f26858 Jonathan Corbet 2021-07-25  495   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  496   * We try to grab the console_lock. If we succeed, it's easy - we log the
7d9e2661f26858 Jonathan Corbet 2021-07-25  497   * output and call the console drivers.  If we fail to get the semaphore, we
7d9e2661f26858 Jonathan Corbet 2021-07-25  498   * place the output into the log buffer and return. The current holder of
7d9e2661f26858 Jonathan Corbet 2021-07-25  499   * the console_sem will notice the new output in console_unlock(); and will
7d9e2661f26858 Jonathan Corbet 2021-07-25  500   * send it to the consoles before releasing the lock.
7d9e2661f26858 Jonathan Corbet 2021-07-25  501   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  502   * One effect of this deferred printing is that code which calls printk() and
7d9e2661f26858 Jonathan Corbet 2021-07-25  503   * then changes console_loglevel may break. This is because console_loglevel
7d9e2661f26858 Jonathan Corbet 2021-07-25  504   * is inspected when the actual printing occurs.
7d9e2661f26858 Jonathan Corbet 2021-07-25  505   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  506   * See also:
7d9e2661f26858 Jonathan Corbet 2021-07-25  507   * printf(3)
7d9e2661f26858 Jonathan Corbet 2021-07-25  508   *
7d9e2661f26858 Jonathan Corbet 2021-07-25  509   * See the vsnprintf() documentation for format string extensions over C99.
7d9e2661f26858 Jonathan Corbet 2021-07-25  510   */
337015573718b1 Chris Down      2021-06-15 @511  #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
337015573718b1 Chris Down      2021-06-15  512  #define printk_deferred(fmt, ...)					\
337015573718b1 Chris Down      2021-06-15  513  	printk_index_wrap(_printk_deferred, fmt, ##__VA_ARGS__)
337015573718b1 Chris Down      2021-06-15  514  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
