Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668DB4EB57
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Smir3nM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701454603; x=1732990603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/DxSO3BQucjAt7wwc7yDJfiUB4jStijMe6gUGtpjM0=;
  b=Smir3nM2Ma/aLdnLTCOJ3x+RSj2qJzqqpyi/14tjH/64FTjpbbFq+n3P
   KJRzJxZP16bmz0XtmsLdyiZumwU6j8X908Wa5VJksnHfifJFP9v8e8pAp
   geo38716pxP7QL7I5xN0VyFxMKSr6lkspqwd1QIzoKp6H5zkyM6L2hWGQ
   rpxcfD9WA56XR0C92me11S+Em5orBtYY/RDQOnXrbyTWfm+2/5mJWFp1h
   Lu2mMaYVI0sWtZok57Q3AdPOeXX85DZkyoiNMc1OGYfsVKZ9LRzL8ObbV
   xF5tNVwBGtQwHdOM9Hb1s4PThHQhzJpzFOSRsXHF7TNMObIv4iktNFGXj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="6818502"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="6818502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 10:16:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="17844272"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Dec 2023 10:16:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9846-00048K-0r;
	Fri, 01 Dec 2023 18:16:38 +0000
Date: Sat, 2 Dec 2023 02:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clocksource/arc_timer.c:171:17: sparse: sparse: cast from
 unknown type
Message-ID: <202312020221.PC4PTB56-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clocksource/arc_timer.c:171:17: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vineet Gupta <vgupta@synopsys.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: c4c9a040ecb7297e011e579f5a9cc280e42d725f clocksource: import ARC timer driver
date:   7 years ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 years ago
config: arc-randconfig-r111-20231107 (https://download.01.org/0day-ci/archive/20231202/202312020221.PC4PTB56-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020221.PC4PTB56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020221.PC4PTB56-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/clocksource/arc_timer.c:67:13: sparse: sparse: undefined identifier '__builtin_arc_lr'
   drivers/clocksource/arc_timer.c:70:13: sparse: sparse: undefined identifier '__builtin_arc_lr'
   drivers/clocksource/arc_timer.c:90:9: sparse: sparse: undefined identifier '__builtin_arc_lr'
   drivers/clocksource/arc_timer.c:120:21: sparse: sparse: undefined identifier '__builtin_arc_lr'
   drivers/clocksource/arc_timer.c:121:21: sparse: sparse: undefined identifier '__builtin_arc_lr'
   drivers/clocksource/arc_timer.c:122:26: sparse: sparse: undefined identifier '__builtin_arc_lr'
   drivers/clocksource/arc_timer.c:141:9: sparse: sparse: undefined identifier '__builtin_arc_lr'
   drivers/clocksource/arc_timer.c:157:9: sparse: sparse: undefined identifier '__builtin_arc_sr'
   drivers/clocksource/arc_timer.c:171:26: sparse: sparse: undefined identifier '__builtin_arc_lr'
>> drivers/clocksource/arc_timer.c:171:17: sparse: sparse: cast from unknown type
   drivers/clocksource/arc_timer.c:194:9: sparse: sparse: undefined identifier '__builtin_arc_sr'
   drivers/clocksource/arc_timer.c:195:9: sparse: sparse: undefined identifier '__builtin_arc_sr'
   drivers/clocksource/arc_timer.c:196:9: sparse: sparse: undefined identifier '__builtin_arc_sr'
   drivers/clocksource/arc_timer.c:211:9: sparse: sparse: undefined identifier '__builtin_arc_sr'
   drivers/clocksource/arc_timer.c:212:9: sparse: sparse: undefined identifier '__builtin_arc_sr'
   drivers/clocksource/arc_timer.c:214:9: sparse: sparse: undefined identifier '__builtin_arc_sr'
   drivers/clocksource/arc_timer.c:258:9: sparse: sparse: undefined identifier '__builtin_arc_sr'
   drivers/clocksource/arc_timer.c:305:59: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void [noderef] <asn:3> *percpu_dev_id @@     got struct clock_event_device *evt @@
   drivers/clocksource/arc_timer.c:305:59: sparse:     expected void [noderef] <asn:3> *percpu_dev_id
   drivers/clocksource/arc_timer.c:305:59: sparse:     got struct clock_event_device *evt
   drivers/clocksource/arc_timer.c: note: in included file:
   include/soc/arc/mcip.h:88:9: sparse: sparse: undefined identifier '__builtin_arc_sr'

vim +171 drivers/clocksource/arc_timer.c

e608b53ea863a92 arch/arc/kernel/time.c Vineet Gupta 2016-01-01  164  
e608b53ea863a92 arch/arc/kernel/time.c Vineet Gupta 2016-01-01  165  /*
e608b53ea863a92 arch/arc/kernel/time.c Vineet Gupta 2016-01-01  166   * 32bit TIMER1 to keep counting monotonically and wraparound
e608b53ea863a92 arch/arc/kernel/time.c Vineet Gupta 2016-01-01  167   */
d8005e6b95268cb arch/arc/kernel/time.c Vineet Gupta 2013-01-18  168  
e608b53ea863a92 arch/arc/kernel/time.c Vineet Gupta 2016-01-01  169  static cycle_t arc_read_timer1(struct clocksource *cs)
d8005e6b95268cb arch/arc/kernel/time.c Vineet Gupta 2013-01-18  170  {
d8005e6b95268cb arch/arc/kernel/time.c Vineet Gupta 2013-01-18 @171  	return (cycle_t) read_aux_reg(ARC_REG_TIMER1_CNT);
d8005e6b95268cb arch/arc/kernel/time.c Vineet Gupta 2013-01-18  172  }
d8005e6b95268cb arch/arc/kernel/time.c Vineet Gupta 2013-01-18  173  

:::::: The code at line 171 was first introduced by commit
:::::: d8005e6b95268cbb50db3773d5f180c32a9434fe ARC: Timers/counters/delay management

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
