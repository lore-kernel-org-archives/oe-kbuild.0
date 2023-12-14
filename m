Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257633C473
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pug8f5ec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702553681; x=1734089681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTEh7Qr1DRJyDkTlxl3o0QQiIKUtY6K3ylFEChS5CrQ=;
  b=Pug8f5ecP0rDdpa3ZjwOfksohFVOTPMR6HCz/EniZ/vhGHlDwhay5PzU
   O50in/tpb9JWRTtgCrDn8duLnzRGHnSPa9jrraI/OctBfwKyrdpH70SEt
   GOmIjmzUzL6NWEvMhFHBhVt507IgagLXTjDQtlLub99ewKFnLTHShJM1F
   5baz/GbbwHlhr9XDnZryNVoaWHeNRFk8Xm4JBjaxZJIZ1MisgEdE1ViNa
   e0ow3DHF8DCljcNFbyRWTBcAzKsTbr8aQmj/VGH0v/f/Mcp6lkAusqRkk
   k07/wYMb+hp/GEwKp+1UA4sWR+M96o3D0B3eup2AKsh0sIysWlVnR1FcT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16657372"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="16657372"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844675310"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="844675310"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Dec 2023 03:34:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDjzA-000LzX-2E;
	Thu, 14 Dec 2023 11:34:36 +0000
Date: Thu, 14 Dec 2023 19:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clocksource/arc_timer.c:171:17: sparse: sparse: cast from
 unknown type
Message-ID: <202312141938.YV7UwA88-lkp@intel.com>
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
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: c4c9a040ecb7297e011e579f5a9cc280e42d725f clocksource: import ARC timer driver
date:   7 years ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 years ago
config: arc-randconfig-r111-20231107 (https://download.01.org/0day-ci/archive/20231214/202312141938.YV7UwA88-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141938.YV7UwA88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312141938.YV7UwA88-lkp@intel.com/

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
   In file included from include/linux/kernel.h:11,
                    from include/linux/interrupt.h:5,
                    from drivers/clocksource/arc_timer.c:18:
   include/linux/log2.h:22:1: warning: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Wattributes]
      22 | int ____ilog2_NaN(void);
         | ^~~

vim +171 drivers/clocksource/arc_timer.c

72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   58  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   59  static cycle_t arc_read_gfrc(struct clocksource *cs)
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   60  {
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   61  	unsigned long flags;
2cd690ea6d6b34 arch/arc/kernel/time.c Vineet Gupta   2016-11-03   62  	u32 l, h;
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   63  
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   64  	local_irq_save(flags);
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   65  
d584f0fb041d86 arch/arc/kernel/time.c Vineet Gupta   2016-01-22   66  	__mcip_cmd(CMD_GFRC_READ_LO, 0);
2cd690ea6d6b34 arch/arc/kernel/time.c Vineet Gupta   2016-11-03  @67  	l = read_aux_reg(ARC_REG_MCIP_READBACK);
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   68  
d584f0fb041d86 arch/arc/kernel/time.c Vineet Gupta   2016-01-22   69  	__mcip_cmd(CMD_GFRC_READ_HI, 0);
2cd690ea6d6b34 arch/arc/kernel/time.c Vineet Gupta   2016-11-03   70  	h = read_aux_reg(ARC_REG_MCIP_READBACK);
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   71  
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   72  	local_irq_restore(flags);
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   73  
2cd690ea6d6b34 arch/arc/kernel/time.c Vineet Gupta   2016-11-03   74  	return (((cycle_t)h) << 32) | l;
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   75  }
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   76  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   77  static struct clocksource arc_counter_gfrc = {
d584f0fb041d86 arch/arc/kernel/time.c Vineet Gupta   2016-01-22   78  	.name   = "ARConnect GFRC",
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   79  	.rating = 400,
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   80  	.read   = arc_read_gfrc,
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   81  	.mask   = CLOCKSOURCE_MASK(64),
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   82  	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   83  };
72d72880612705 arch/arc/kernel/time.c Vineet Gupta   2014-12-24   84  
43d7560494a264 arch/arc/kernel/time.c Daniel Lezcano 2016-06-15   85  static int __init arc_cs_setup_gfrc(struct device_node *node)
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   86  {
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31   87  	struct mcip_bcr mp;
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   88  	int ret;
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   89  
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31   90  	READ_BCR(ARC_REG_MCIP_BCR, mp);
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31   91  	if (!mp.gfrc) {
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31   92  		pr_warn("Global-64-bit-Ctr clocksource not detected");
43d7560494a264 arch/arc/kernel/time.c Daniel Lezcano 2016-06-15   93  		return -ENXIO;
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31   94  	}
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   95  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   96  	ret = arc_get_timer_clk(node);
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   97  	if (ret)
43d7560494a264 arch/arc/kernel/time.c Daniel Lezcano 2016-06-15   98  		return ret;
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01   99  
43d7560494a264 arch/arc/kernel/time.c Daniel Lezcano 2016-06-15  100  	return clocksource_register_hz(&arc_counter_gfrc, arc_timer_freq);
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  101  }
177cf6e52b0a1a arch/arc/kernel/time.c Daniel Lezcano 2016-06-07  102  CLOCKSOURCE_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  103  
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  104  #define AUX_RTC_CTRL	0x103
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  105  #define AUX_RTC_LOW	0x104
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  106  #define AUX_RTC_HIGH	0x105
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  107  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  108  static cycle_t arc_read_rtc(struct clocksource *cs)
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  109  {
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  110  	unsigned long status;
2cd690ea6d6b34 arch/arc/kernel/time.c Vineet Gupta   2016-11-03  111  	u32 l, h;
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  112  
922cc171998ac3 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  113  	/*
922cc171998ac3 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  114  	 * hardware has an internal state machine which tracks readout of
922cc171998ac3 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  115  	 * low/high and updates the CTRL.status if
922cc171998ac3 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  116  	 *  - interrupt/exception taken between the two reads
922cc171998ac3 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  117  	 *  - high increments after low has been read
922cc171998ac3 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  118  	 */
922cc171998ac3 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  119  	do {
2cd690ea6d6b34 arch/arc/kernel/time.c Vineet Gupta   2016-11-03  120  		l = read_aux_reg(AUX_RTC_LOW);
2cd690ea6d6b34 arch/arc/kernel/time.c Vineet Gupta   2016-11-03  121  		h = read_aux_reg(AUX_RTC_HIGH);
922cc171998ac3 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  122  		status = read_aux_reg(AUX_RTC_CTRL);
922cc171998ac3 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  123  	} while (!(status & _BITUL(31)));
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  124  
2cd690ea6d6b34 arch/arc/kernel/time.c Vineet Gupta   2016-11-03  125  	return (((cycle_t)h) << 32) | l;
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  126  }
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  127  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  128  static struct clocksource arc_counter_rtc = {
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  129  	.name   = "ARCv2 RTC",
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  130  	.rating = 350,
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  131  	.read   = arc_read_rtc,
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  132  	.mask   = CLOCKSOURCE_MASK(64),
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  133  	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  134  };
aa93e8ef984712 arch/arc/kernel/time.c Vineet Gupta   2013-11-07  135  
43d7560494a264 arch/arc/kernel/time.c Daniel Lezcano 2016-06-15  136  static int __init arc_cs_setup_rtc(struct device_node *node)
d8005e6b95268c arch/arc/kernel/time.c Vineet Gupta   2013-01-18  137  {
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  138  	struct bcr_timer timer;
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  139  	int ret;
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  140  
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  141  	READ_BCR(ARC_REG_TIMERS_BCR, timer);
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  142  	if (!timer.rtc) {
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  143  		pr_warn("Local-64-bit-Ctr clocksource not detected");
43d7560494a264 arch/arc/kernel/time.c Daniel Lezcano 2016-06-15  144  		return -ENXIO;
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  145  	}
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  146  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  147  	/* Local to CPU hence not usable in SMP */
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  148  	if (IS_ENABLED(CONFIG_SMP)) {
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  149  		pr_warn("Local-64-bit-Ctr not usable in SMP");
43d7560494a264 arch/arc/kernel/time.c Daniel Lezcano 2016-06-15  150  		return -EINVAL;
ec7cb87bf99844 arch/arc/kernel/time.c Vineet Gupta   2016-10-31  151  	}
d8005e6b95268c arch/arc/kernel/time.c Vineet Gupta   2013-01-18  152  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  153  	ret = arc_get_timer_clk(node);
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  154  	if (ret)
43d7560494a264 arch/arc/kernel/time.c Daniel Lezcano 2016-06-15  155  		return ret;
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  156  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  157  	write_aux_reg(AUX_RTC_CTRL, 1);
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  158  
43d7560494a264 arch/arc/kernel/time.c Daniel Lezcano 2016-06-15  159  	return clocksource_register_hz(&arc_counter_rtc, arc_timer_freq);
d8005e6b95268c arch/arc/kernel/time.c Vineet Gupta   2013-01-18  160  }
177cf6e52b0a1a arch/arc/kernel/time.c Daniel Lezcano 2016-06-07  161  CLOCKSOURCE_OF_DECLARE(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  162  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  163  #endif
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  164  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  165  /*
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  166   * 32bit TIMER1 to keep counting monotonically and wraparound
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  167   */
d8005e6b95268c arch/arc/kernel/time.c Vineet Gupta   2013-01-18  168  
e608b53ea863a9 arch/arc/kernel/time.c Vineet Gupta   2016-01-01  169  static cycle_t arc_read_timer1(struct clocksource *cs)
d8005e6b95268c arch/arc/kernel/time.c Vineet Gupta   2013-01-18  170  {
d8005e6b95268c arch/arc/kernel/time.c Vineet Gupta   2013-01-18 @171  	return (cycle_t) read_aux_reg(ARC_REG_TIMER1_CNT);
d8005e6b95268c arch/arc/kernel/time.c Vineet Gupta   2013-01-18  172  }
d8005e6b95268c arch/arc/kernel/time.c Vineet Gupta   2013-01-18  173  

:::::: The code at line 171 was first introduced by commit
:::::: d8005e6b95268cbb50db3773d5f180c32a9434fe ARC: Timers/counters/delay management

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
