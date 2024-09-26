Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A32A17335C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Sep 2024 07:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335876; cv=none; b=aujjTdWMBNKtd4QuMk5F5fzR/7s16yHCzmCFPSjxuodAQ66pQ9eN6YUA12id1+/Jr4MGyI7cZ5knJM7qvRAFBRzMfM3pWT6yuh8BtYm41FuH4uqKULy2+A+sACN54GlXUEcf3owNbH9G+vpMKiKxLaxSUT/BUiGCeGw/3T3MYsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335876; c=relaxed/simple;
	bh=EH3I6i4MfzCjtij8yh7kvb/J+kWryptnxz/WVA1NiLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hIYWcxPFxEYLsQ3Q4+ugWBvt4CHsLNJ0TZzsBbdkLfqE8uV+kVHU0/dmzjgbmc7woiyUg1PSIkjKcIkplO2TZY/VY72kO9CC9TUdcFARS1yqwGZkeYHA8BBWr7F+F9MxvzUmFPE6/7MinCqQ5Ca4fPanmflJ/Y8vw2w+cEiz8/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fimKp7Or; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fimKp7Or"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727335875; x=1758871875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EH3I6i4MfzCjtij8yh7kvb/J+kWryptnxz/WVA1NiLw=;
  b=fimKp7OrIsOj+cuD6bgiXSingELSJqWSO8SCcZIXmV388VfUpKzo6bfx
   cPxl51W6iJhG57xrajo3PitgQAyhGw03DS4CFtwTx2HQBETkVmqaNyCSy
   yEBtBcJePRPXbpnT2Nt8XgmL0EQ6+QVB04PREOBNsvp2WZ6XLQ0csT/6I
   rk8aALOlNlPmXUETuiNGZoCLuVhZOz0fCMIYSdzAMdp8BWlVqMOMAaPTf
   jGTK9lgfb1CEJhuk4/Nn6nAsxqgqFmDswwQuGRamDaNZHmZ8UqKnx8746
   017qXP2MgXqYsZX/T5oxwXOjMufLM57LKnpu++5pcgZSAnLsfp4hSpzpw
   g==;
X-CSE-ConnectionGUID: PnSK3r8OT0CEj5CuFIkDSQ==
X-CSE-MsgGUID: ovPSS95BT3usedFNDE14SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37086360"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="37086360"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 00:31:06 -0700
X-CSE-ConnectionGUID: yo6sRRqQSTmiCiiPmHowuw==
X-CSE-MsgGUID: tnsdLvBNSvavS6wMZWDPKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="71925878"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Sep 2024 00:31:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stixn-000KOn-1Y;
	Thu, 26 Sep 2024 07:30:59 +0000
Date: Thu, 26 Sep 2024 15:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip-rt 124/30000] kernel/printk/printk.c:415:17:
 warning: function 'early_vprintk' might be a candidate for 'gnu_printf'
 format attribute
Message-ID: <202409261500.4GoYJbab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 14d0aafe24db413554d33f9ec8e3a69f5a488881 [124/30000] printk: Add a printk kill switch
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409261500.4GoYJbab-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261500.4GoYJbab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409261500.4GoYJbab-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:59:
   kernel/printk/internal.h:66:20: warning: no previous prototype for 'vprintk_func' [-Wmissing-prototypes]
      66 | __printf(1, 0) int vprintk_func(const char *fmt, va_list args) { return 0; }
         |                    ^~~~~~~~~~~~
   kernel/printk/printk.c:156:5: warning: no previous prototype for 'devkmsg_sysctl_set_loglvl' [-Wmissing-prototypes]
     156 | int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c: In function 'early_vprintk':
>> kernel/printk/printk.c:415:17: warning: function 'early_vprintk' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     415 |                 int n = vscnprintf(buf, sizeof(buf), fmt, ap);
         |                 ^~~


vim +415 kernel/printk/printk.c

14d0aafe24db41 Ingo Molnar 2011-07-22  410  
14d0aafe24db41 Ingo Molnar 2011-07-22  411  static void early_vprintk(const char *fmt, va_list ap)
14d0aafe24db41 Ingo Molnar 2011-07-22  412  {
14d0aafe24db41 Ingo Molnar 2011-07-22  413  	if (early_console) {
14d0aafe24db41 Ingo Molnar 2011-07-22  414  		char buf[512];
14d0aafe24db41 Ingo Molnar 2011-07-22 @415  		int n = vscnprintf(buf, sizeof(buf), fmt, ap);
14d0aafe24db41 Ingo Molnar 2011-07-22  416  
14d0aafe24db41 Ingo Molnar 2011-07-22  417  		early_console->write(early_console, buf, n);
14d0aafe24db41 Ingo Molnar 2011-07-22  418  	}
14d0aafe24db41 Ingo Molnar 2011-07-22  419  }
14d0aafe24db41 Ingo Molnar 2011-07-22  420  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
