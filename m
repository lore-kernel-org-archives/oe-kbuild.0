Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19854156C1
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Sep 2023 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695203514; x=1726739514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hrs9b85a+wwHiwLs5lK91y8uZaYYJXYGVFBgqtd2ctE=;
  b=fZM7uZQZTEaGeOhL4K1wF8qasvBq2okLsZ2Wplq89AafwCC2PBXioXpb
   U1HxLGWU8ggWF18vMsdTW5NBoO5mTwTxJUS31P5vQjvOyGyxUoGDJpf8j
   Jnwb5O58G2fyvQYdGTDR+/FaAliDiMhbN1rWW8uC9UJNXVZS8jqb0RJUe
   uVjJP/5XG3lW4yhXfxfN/PoIHKP9fDmnE8n82z4fdkMmHYquO70Xsp0tM
   XqeQG5pa8ZZhjf0ynQ7CNXbleS4MPQ+aDtu5ljbRG+mo07YpvbkR/O7O4
   iYoOv29b7d0oxmHv8lk/52qKH8qC29II3l+TDK3UEq07wmF0idA+FMVtT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="384024386"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="384024386"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 02:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836784968"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="836784968"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Sep 2023 02:51:52 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qits5-0008c2-2W;
	Wed, 20 Sep 2023 09:51:49 +0000
Date: Wed, 20 Sep 2023 17:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] riscv: Rearrange hwcap.h and cpufeature.h
Message-ID: <202309201711.pqj4QCCY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230920074653.2509631-2-xiao.w.wang@intel.com>
References: <20230920074653.2509631-2-xiao.w.wang@intel.com>
TO: Xiao Wang <xiao.w.wang@intel.com>
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: ardb@kernel.org
CC: anup@brainfault.org
CC: haicheng.li@intel.com
CC: ajones@ventanamicro.com
CC: linux-riscv@lists.infradead.org
CC: linux-efi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Xiao Wang <xiao.w.wang@intel.com>

Hi Xiao,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc2 next-20230920]
[cannot apply to efi/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Wang/riscv-Rearrange-hwcap-h-and-cpufeature-h/20230920-154024
base:   linus/master
patch link:    https://lore.kernel.org/r/20230920074653.2509631-2-xiao.w.wang%40intel.com
patch subject: [PATCH v2 1/2] riscv: Rearrange hwcap.h and cpufeature.h
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230920/202309201711.pqj4QCCY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201711.pqj4QCCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309201711.pqj4QCCY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clocksource/timer-riscv.c: In function 'riscv_timer_init_common':
>> drivers/clocksource/timer-riscv.c:163:13: error: implicit declaration of function 'riscv_isa_extension_available' [-Werror=implicit-function-declaration]
     163 |         if (riscv_isa_extension_available(NULL, SSTC)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clocksource/timer-riscv.c:163:49: error: 'SSTC' undeclared (first use in this function)
     163 |         if (riscv_isa_extension_available(NULL, SSTC)) {
         |                                                 ^~~~
   drivers/clocksource/timer-riscv.c:163:49: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/riscv_isa_extension_available +163 drivers/clocksource/timer-riscv.c

62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  127  
cd12d206685af0 drivers/clocksource/timer-riscv.c Sunil V L      2023-05-15  128  static int __init riscv_timer_init_common(void)
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  129  {
cd12d206685af0 drivers/clocksource/timer-riscv.c Sunil V L      2023-05-15  130  	int error;
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  131  	struct irq_domain *domain;
cd12d206685af0 drivers/clocksource/timer-riscv.c Sunil V L      2023-05-15  132  	struct fwnode_handle *intc_fwnode = riscv_get_intc_hwnode();
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  133  
cd12d206685af0 drivers/clocksource/timer-riscv.c Sunil V L      2023-05-15  134  	domain = irq_find_matching_fwnode(intc_fwnode, DOMAIN_BUS_ANY);
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  135  	if (!domain) {
cd12d206685af0 drivers/clocksource/timer-riscv.c Sunil V L      2023-05-15  136  		pr_err("Failed to find irq_domain for INTC node [%pfwP]\n",
cd12d206685af0 drivers/clocksource/timer-riscv.c Sunil V L      2023-05-15  137  		       intc_fwnode);
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  138  		return -ENODEV;
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  139  	}
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  140  
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  141  	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  142  	if (!riscv_clock_event_irq) {
cd12d206685af0 drivers/clocksource/timer-riscv.c Sunil V L      2023-05-15  143  		pr_err("Failed to map timer interrupt for node [%pfwP]\n", intc_fwnode);
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  144  		return -ENODEV;
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  145  	}
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  146  
713203e303ca9f drivers/clocksource/timer-riscv.c Atish Patra    2019-08-02  147  	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
26478b2f6a06ca drivers/clocksource/timer-riscv.c Atish Patra    2019-02-13  148  	if (error) {
cd12d206685af0 drivers/clocksource/timer-riscv.c Sunil V L      2023-05-15  149  		pr_err("RISCV timer registration failed [%d]\n", error);
26478b2f6a06ca drivers/clocksource/timer-riscv.c Atish Patra    2019-02-13  150  		return error;
26478b2f6a06ca drivers/clocksource/timer-riscv.c Atish Patra    2019-02-13  151  	}
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  152  
32d0be018f6f5e drivers/clocksource/timer-riscv.c Atish Patra    2019-03-22  153  	sched_clock_register(riscv_sched_clock, 64, riscv_timebase);
92e0d143fdef1f drivers/clocksource/riscv_timer.c Anup Patel     2018-12-04  154  
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  155  	error = request_percpu_irq(riscv_clock_event_irq,
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  156  				    riscv_timer_interrupt,
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  157  				    "riscv-timer", &riscv_clock_event);
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  158  	if (error) {
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  159  		pr_err("registering percpu irq failed [%d]\n", error);
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  160  		return error;
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  161  	}
033a65de7eced8 drivers/clocksource/timer-riscv.c Anup Patel     2020-06-01  162  
225b9596cb0227 drivers/clocksource/timer-riscv.c Matt Evans     2023-02-01 @163  	if (riscv_isa_extension_available(NULL, SSTC)) {
225b9596cb0227 drivers/clocksource/timer-riscv.c Matt Evans     2023-02-01  164  		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
225b9596cb0227 drivers/clocksource/timer-riscv.c Matt Evans     2023-02-01  165  		static_branch_enable(&riscv_sstc_available);
225b9596cb0227 drivers/clocksource/timer-riscv.c Matt Evans     2023-02-01  166  	}
225b9596cb0227 drivers/clocksource/timer-riscv.c Matt Evans     2023-02-01  167  
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  168  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  169  			 "clockevents/riscv/timer:starting",
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  170  			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  171  	if (error)
26478b2f6a06ca drivers/clocksource/timer-riscv.c Atish Patra    2019-02-13  172  		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
26478b2f6a06ca drivers/clocksource/timer-riscv.c Atish Patra    2019-02-13  173  		       error);
9f7a8ff6391fd5 drivers/clocksource/timer-riscv.c Atish Patra    2022-07-22  174  
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  175  	return error;
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  176  }
62b0194368147d drivers/clocksource/riscv_timer.c Palmer Dabbelt 2018-08-04  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
