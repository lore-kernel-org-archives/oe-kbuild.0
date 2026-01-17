Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B42040B6
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 11:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648616; cv=none; b=slOL80NzLvh8F9Y3kJXA6qFefWecrBIGZ6Bz0MSDUB3ZGdW1NMCLvgkpR6E+RhQZD4yMRhuOqjcUFup/I3VAVw9dywjzOKZpVrqTAu4rGwNybl0J22SUFEt2emenmX8Bf6L7r2XNeTizuUhNww8hXJCUDy4gUQ01PbJitwrTxjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648616; c=relaxed/simple;
	bh=sPxaEMiI0gntI9fhpYfLdc14dNjCgk1qjcjq2yITDbU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qeKgVC6igJ57RKNqQpOVVy7TV6InmFl7EWEjq2YU/vgZ74UpgUyTbxjgvezN5/W4Z38K8BwlKrvXGf7Q1M+lSClIOgylvS1YGqhbqj3BUyr8eaWT/5yynRFsrkkBb5oeCZCgGwQ8S4MFXI5Je86njFblUuuwFCMFcdTbFhykAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvkjD85G; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvkjD85G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768648615; x=1800184615;
  h=date:from:to:cc:subject:message-id;
  bh=sPxaEMiI0gntI9fhpYfLdc14dNjCgk1qjcjq2yITDbU=;
  b=WvkjD85GiAomMQIDdBspZRo846kXvbTtkZ/RmPqFPwWX7CpCDtRNp7l9
   2bT2OlZAnnjuARItz+oimEqfE+7P1hWuFcwFXCSjwD4YFqXy45Qem9yKe
   wvntxwmJBJRqAS4PDCUKRHZvnAPsHH6ckbEmgUA+gvgbhrtglO2RmkmU0
   x1dzmEH7cXU5By1Szvsnj6QlkxZmS7YRdrOjNquDIXtMV6sT3nOCr2L2j
   vXyyy/0rVg5Kjb+B5cnGwwbds8SMkp5pfiDhsWi3Tscs1EYIaivAtMOXB
   H4p+ZRRZOifAvGXtH5/IqfgP8pel/2JICaRv2kkwo/r785GrNIdvrQK03
   g==;
X-CSE-ConnectionGUID: q/ppiMLmRZC4wdJd8a8skA==
X-CSE-MsgGUID: vDXTBIckQm62zzJdai+9mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81388853"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="81388853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 03:16:54 -0800
X-CSE-ConnectionGUID: zQLUU8swR2G9eis06ZdKuw==
X-CSE-MsgGUID: hXNh9XNaQESdT/mQSDgOow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205873671"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2026 03:16:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh4IU-00000000LnS-3CCf;
	Sat, 17 Jan 2026 11:16:50 +0000
Date: Sat, 17 Jan 2026 19:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1433/6849]
 drivers/gpio/gpio-realtek-otto.c:464:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601171933.37gX0ptU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpio/gpio-realtek-otto.c:464:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rosen Penev <rosenp@gmail.com>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Hi Rosen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 3203d8f573af87d8c967d36e8d5016ef306ff078 [1433/6849] gpio: realtek-otto: add COMPILE_TEST
:::::: branch date: 22 hours ago
:::::: commit date: 4 weeks ago
config: csky-randconfig-r131-20260116 (https://download.01.org/0day-ci/archive/20260117/202601171933.37gX0ptU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171933.37gX0ptU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601171933.37gX0ptU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-realtek-otto.c:464:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-realtek-otto.c:464:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpio/gpio-realtek-otto.c:465:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-realtek-otto.c:465:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpio/gpio-realtek-otto.c:466:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-realtek-otto.c:466:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +464 drivers/gpio/gpio-realtek-otto.c

0d82fb1127fb7c Sander Vanheule 2021-03-30  463  
0d82fb1127fb7c Sander Vanheule 2021-03-30 @464  MODULE_DESCRIPTION("Realtek Otto GPIO support");

:::::: The code at line 464 was first introduced by commit
:::::: 0d82fb1127fb7cc8287614eb0992acb0583bc323 gpio: Add Realtek Otto GPIO support

:::::: TO: Sander Vanheule <sander@svanheule.net>
:::::: CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
