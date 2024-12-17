Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8AB1F03FC
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734440298; cv=none; b=eCus2tTLLo0lMhHg1HcrJ0qaMzmwaVQDULJs8+a5IAa9+CgQ/3ChbmXKuEq4HDUKJnKuHhgxPzCEG4QQM4XXNWDZlHHEuASatSeBF3zkkUOcCWs53dWTJOp9XflIM9B2ECGTdpt9w62xhCbpm/gbpIob5vBPY5i0r0yYBV/USQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734440298; c=relaxed/simple;
	bh=4kPsxn8lywPwzlwxzGn8GxTialXOFW1+iUfkHJN8/iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agdEsJBSDkae7O0sRfSLYHVH6+COJrLfJ4rIDc1Bn00jWF/+Z8KCvNUqCLxQpfMMJltyp0Op0hpXbOy4p+dM1jKi6e+p6RRPOO+m6bHqI9J5VDS+NdHwuWzzly+fJMMjbWo4n7wjVCi/OA6PrSy4xQOlQWD9J9QumFChKIyYQDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VB01U4dU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VB01U4dU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734440296; x=1765976296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kPsxn8lywPwzlwxzGn8GxTialXOFW1+iUfkHJN8/iQ=;
  b=VB01U4dUvuNZJV5ZvpRoiG2UheKdhcjSFojwfgtNhNGk0O8q9U0XcFxr
   031GVwIKRU0vIVwFByZag8RQrfUMUXJt9elXjuHZi9ohbxYTZh8giBhFM
   ClEUzas6AF0nEznjzzxiD9iqzl7CV47uoJKXsrdDDKpQABCEU99wgk4rS
   dt6VIjZSCMKX5fSJ3uWDOZ8mZIjapcJj4tQp3RU/Ox/GG/sXFhlOMDEWz
   d41ScClwLfH8h1JZvEHMQJK7ffagGcZ2sr0GeDZC9NBcty3s1fUbTPW19
   cOzO9zghc9DpplnuZyazoXXavcDPW6ICAMCeqsU8Eoul3SFHbhKKBxPLJ
   w==;
X-CSE-ConnectionGUID: wt4ZeK9iRbaRRm1m17B1MA==
X-CSE-MsgGUID: cR1OaUCkRUqnVh9lvxuvoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52272077"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="52272077"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 04:54:16 -0800
X-CSE-ConnectionGUID: AXkEqlyCTG6gnsU6TgdPiA==
X-CSE-MsgGUID: MOEIJud8S4q4dCZCyoHpuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="97566667"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Dec 2024 04:54:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNX5Y-000F0S-2C;
	Tue, 17 Dec 2024 12:54:12 +0000
Date: Tue, 17 Dec 2024 20:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/reboot.c:224: warning: Function parameter or struct member
 'cmd' not described in 'do_kernel_restart'
Message-ID: <202412172006.A8nHNHKz-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f44d154d6e3d633d4c49a5d6aed8a0e4684ae25e
commit: 2cd3271b7a310b1199aa36bfd536ca67d3c2d5f2 kbuild: avoid duplicate warning options
date:   1 year, 4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 4 months ago
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20241217/202412172006.A8nHNHKz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412172006.A8nHNHKz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412172006.A8nHNHKz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/reboot.c:224: warning: Function parameter or struct member 'cmd' not described in 'do_kernel_restart'
>> kernel/reboot.c:948: warning: Function parameter or struct member 'poweroff_delay_ms' not described in 'hw_failure_emergency_poweroff'
--
   lib/vsprintf.c: In function 'va_format':
>> lib/vsprintf.c:1681:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1681 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
>> lib/hweight.c:14: warning: Function parameter or struct member 'w' not described in '__sw_hweight32'
>> lib/hweight.c:14: warning: expecting prototype for hweightN(). Prototype was for __sw_hweight32() instead
--
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
>> drivers/clk/clkdev.c:173:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     173 |                 vscnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~~~~~~~~


vim +224 kernel/reboot.c

b63adb979583ef Guenter Roeck 2014-09-26  211  
b63adb979583ef Guenter Roeck 2014-09-26  212  /**
b63adb979583ef Guenter Roeck 2014-09-26  213   *	do_kernel_restart - Execute kernel restart handler call chain
b63adb979583ef Guenter Roeck 2014-09-26  214   *
b63adb979583ef Guenter Roeck 2014-09-26  215   *	Calls functions registered with register_restart_handler.
b63adb979583ef Guenter Roeck 2014-09-26  216   *
b63adb979583ef Guenter Roeck 2014-09-26  217   *	Expected to be called from machine_restart as last step of the restart
b63adb979583ef Guenter Roeck 2014-09-26  218   *	sequence.
b63adb979583ef Guenter Roeck 2014-09-26  219   *
b63adb979583ef Guenter Roeck 2014-09-26  220   *	Restarts the system immediately if a restart handler function has been
b63adb979583ef Guenter Roeck 2014-09-26  221   *	registered. Otherwise does nothing.
b63adb979583ef Guenter Roeck 2014-09-26  222   */
b63adb979583ef Guenter Roeck 2014-09-26  223  void do_kernel_restart(char *cmd)
b63adb979583ef Guenter Roeck 2014-09-26 @224  {
b63adb979583ef Guenter Roeck 2014-09-26  225  	atomic_notifier_call_chain(&restart_handler_list, reboot_mode, cmd);
b63adb979583ef Guenter Roeck 2014-09-26  226  }
b63adb979583ef Guenter Roeck 2014-09-26  227  

:::::: The code at line 224 was first introduced by commit
:::::: b63adb979583ef185718d774d8162387db5589c0 kernel: add support for kernel restart handler call chain

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
