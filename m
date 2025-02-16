Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897DF13D897
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Feb 2025 06:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739686350; cv=none; b=saCp2hGuXAbKWTlnTaaKV3d6RO55QFKNl4QE7DaUZp9pHotM6MSlvVNsrzrAlPf/GnsnS6Y3HHHgLzN3W99FzcjInq7ffFV6kVzjsAGnJjhhAe8dsYJl3GJheY3aoHfsgXeviX06Tr+eIxTvOk6jHsXb/UTuAu780+qeWVvXmTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739686350; c=relaxed/simple;
	bh=WjqX1wcf1/tejNmAuvW17yxi78yHm5oXxyqD4qsb1cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHlhmxf4jwBIdJ/DXeFgU12/p1E2OpVO3cVSkI89fbDXb0y2g9O137yZidCQQz4cuh4Tg8gmfs8f47tfMVAgtNcgPIzYL73EBOyQ0fiD6f0AnOGnYuPIuSVe7Gqt/x/K4R4iwMU6HMlrudzxj9lSFnhKSydpvynPDEfBO4JPWo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJFu6Yhw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJFu6Yhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739686349; x=1771222349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WjqX1wcf1/tejNmAuvW17yxi78yHm5oXxyqD4qsb1cQ=;
  b=AJFu6YhwmIhgsWh86Z7n3UGeJIa/K22hZ6FQ46CeIXKRIWGrMLPUfcof
   VryVgDbJvuzNNmO6oUUOfHkqLlJzLIlwzDJ3krd1mz53whEXljxDGrKvK
   tR2BwRpDnRvV+9ex9ma5Q4TPYAcF632oVQY+xINAv/sSkCzq1q/q0mz2z
   zS92dQXu1jV2OfQcvxPq3VQzmaAmOTdpXmUOlvvO9WBMbXwVd+eQL3Vym
   txp6zcZNFb8OiHF8f5bHWftEe6Tb0SayUWmdNVXBoZ093XdupmXZ/xZI/
   P8iU3ocVzBvjKKDUgUdY8B3F6Visgqhj0j7vDKXmQvsaSj9gTiMT8w4U2
   Q==;
X-CSE-ConnectionGUID: wQvwmWMLQy6iNIXfCasIJw==
X-CSE-MsgGUID: 6XifrX5ZRceW3vUWMkj68Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40317309"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="40317309"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 22:12:29 -0800
X-CSE-ConnectionGUID: TweEs0f8SiCsgEEeGOfgiA==
X-CSE-MsgGUID: VRgyxQs9SBudZuuUprv4ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="113807009"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Feb 2025 22:12:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjXtA-001Bdh-2q;
	Sun, 16 Feb 2025 06:12:24 +0000
Date: Sun, 16 Feb 2025 14:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 26/26] drivers/clk/clk.c:257
 clk_enable_lock() error: uninitialized symbol 'flags'.
Message-ID: <202502161400.4zxjxlWI-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: 9c8d14ce8aff2d38bf494f5d5436a302e3236842 [26/26] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r073-20250214 (https://download.01.org/0day-ci/archive/20250216/202502161400.4zxjxlWI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502161400.4zxjxlWI-lkp@intel.com/

New smatch warnings:
drivers/clk/clk.c:257 clk_enable_lock() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/clk/clk.c:265 clk_enable_lock() error: uninitialized symbol 'flags'.
drivers/clk/clk.c:4172 clk_hw_create_clk() warn: passing zero to 'ERR_CAST'

vim +/flags +257 drivers/clk/clk.c

eab89f690ee080 Mike Turquette 2013-03-28  239  
eab89f690ee080 Mike Turquette 2013-03-28  240  static unsigned long clk_enable_lock(void)
a57aa18539f8b2 Stephen Boyd   2015-07-24  241  	__acquires(enable_lock)
eab89f690ee080 Mike Turquette 2013-03-28  242  {
eab89f690ee080 Mike Turquette 2013-03-28  243  	unsigned long flags;
533ddeb1e86f50 Mike Turquette 2013-03-28  244  
a12aa8a68dfef5 David Lechner  2018-01-04  245  	/*
a12aa8a68dfef5 David Lechner  2018-01-04  246  	 * On UP systems, spin_trylock_irqsave() always returns true, even if
a12aa8a68dfef5 David Lechner  2018-01-04  247  	 * we already hold the lock. So, in that case, we rely only on
a12aa8a68dfef5 David Lechner  2018-01-04  248  	 * reference counting.
a12aa8a68dfef5 David Lechner  2018-01-04  249  	 */
a12aa8a68dfef5 David Lechner  2018-01-04  250  	if (!IS_ENABLED(CONFIG_SMP) ||
a12aa8a68dfef5 David Lechner  2018-01-04  251  	    !spin_trylock_irqsave(&enable_lock, flags)) {
533ddeb1e86f50 Mike Turquette 2013-03-28  252  		if (enable_owner == current) {
533ddeb1e86f50 Mike Turquette 2013-03-28  253  			enable_refcnt++;
a57aa18539f8b2 Stephen Boyd   2015-07-24  254  			__acquire(enable_lock);
a12aa8a68dfef5 David Lechner  2018-01-04  255  			if (!IS_ENABLED(CONFIG_SMP))
a12aa8a68dfef5 David Lechner  2018-01-04  256  				local_save_flags(flags);
533ddeb1e86f50 Mike Turquette 2013-03-28 @257  			return flags;
533ddeb1e86f50 Mike Turquette 2013-03-28  258  		}
eab89f690ee080 Mike Turquette 2013-03-28  259  		spin_lock_irqsave(&enable_lock, flags);
533ddeb1e86f50 Mike Turquette 2013-03-28  260  	}
533ddeb1e86f50 Mike Turquette 2013-03-28  261  	WARN_ON_ONCE(enable_owner != NULL);
533ddeb1e86f50 Mike Turquette 2013-03-28  262  	WARN_ON_ONCE(enable_refcnt != 0);
533ddeb1e86f50 Mike Turquette 2013-03-28  263  	enable_owner = current;
533ddeb1e86f50 Mike Turquette 2013-03-28  264  	enable_refcnt = 1;
eab89f690ee080 Mike Turquette 2013-03-28  265  	return flags;
eab89f690ee080 Mike Turquette 2013-03-28  266  }
eab89f690ee080 Mike Turquette 2013-03-28  267  

:::::: The code at line 257 was first introduced by commit
:::::: 533ddeb1e86f506129ee388a6cc13796dcf31311 clk: allow reentrant calls into the clk framework

:::::: TO: Mike Turquette <mturquette@linaro.org>
:::::: CC: Mike Turquette <mturquette@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
