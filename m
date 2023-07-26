Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8E54CE9C
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 19:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690401556; x=1721937556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kMZihMKIOrzLUAcPc7XtRqH+uiXrmFF9yqDnN3Mq2j0=;
  b=kW658ma3hoBTGpKaWY+EBWMjv8MQvBBn+fDxdCItmmF8cl/coyasHsjM
   mkyGNwtUzrWcyQIssA+5xmD7AMRg03mwI6aQewf76ExRr4RmEMIPhwBc2
   NO3/N3BNE1TwVP6URr5UHhcr2mTkATBYCVe5h5iPAyw1SDAvhh/m6tynZ
   5x8eh0/HN0KRqrUolbwOIKBcEana4eWA0ngqp2SsBkhGEp6q6N++zAQNX
   B4IvGPuV3GdDlyVsTVsn1dlZ3dY766lsXWup2eXW3TU6bXMzdc3G4/fwm
   goKwXALFddAS3K5psXE0rat8FM8yMOWA+SHt2BzFIl0fY1BqPyFB8jw9M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399055562"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="399055562"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816819853"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="816819853"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 12:59:14 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOkfB-0001HJ-1E;
	Wed, 26 Jul 2023 19:59:13 +0000
Date: Thu, 27 Jul 2023 03:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307270322.OFhfaWfS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: block/kyber-iosched.c:269:17: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230726]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: xtensa-randconfig-r093-20230725 (https://download.01.org/0day-ci/archive/20230727/202307270322.OFhfaWfS-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270322.OFhfaWfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307270322.OFhfaWfS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/kyber-iosched.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> block/kyber-iosched.c:269:17: sparse: sparse: bad integer constant expression
>> block/kyber-iosched.c:269:17: sparse: sparse: static assertion failed: "clamp() low limit 1U greater than high limit kyber_depth[sched_domain]"
--
   block/bfq-iosched.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> block/bfq-iosched.c:1120:16: sparse: sparse: bad integer constant expression
>> block/bfq-iosched.c:1120:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(dur))(msecs_to_jiffies(3000)) greater than high limit (typeof(dur))(msecs_to_jiffies(25000))"
--
   mm/memtest.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> mm/memtest.c:79:30: sparse: sparse: bad integer constant expression
>> mm/memtest.c:79:30: sparse: sparse: static assertion failed: "clamp() low limit start greater than high limit end"
   mm/memtest.c:80:28: sparse: sparse: bad integer constant expression
   mm/memtest.c:80:28: sparse: sparse: static assertion failed: "clamp() low limit start greater than high limit end"
--
   fs/btrfs/async-thread.c: note: in included file (through arch/xtensa/include/asm/thread_info.h, arch/xtensa/include/asm/current.h, include/linux/sched.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> fs/btrfs/async-thread.c:197:30: sparse: sparse: bad integer constant expression
>> fs/btrfs/async-thread.c:197:30: sparse: sparse: static assertion failed: "clamp() low limit (typeof(new_current_active))(1) greater than high limit (typeof(new_current_active))(wq->limit_active)"
--
   fs/btrfs/discard.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> fs/btrfs/discard.c:621:17: sparse: sparse: bad integer constant expression
>> fs/btrfs/discard.c:621:17: sparse: sparse: static assertion failed: "clamp() low limit min_delay greater than high limit (1000UL)"
--
   fs/gfs2/rgrp.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> fs/gfs2/rgrp.c:1586:26: sparse: sparse: bad integer constant expression
>> fs/gfs2/rgrp.c:1586:26: sparse: sparse: static assertion failed: "clamp() low limit (u32)32 greater than high limit free_blocks"
--
   drivers/clk/xilinx/xlnx_vcu.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/clk/xilinx/xlnx_vcu.c:317:16: sparse: sparse: bad integer constant expression
>> drivers/clk/xilinx/xlnx_vcu.c:317:16: sparse: sparse: static assertion failed: "clamp() low limit (unsigned long)(pll->fvco_min) greater than high limit (unsigned long)(pll->fvco_max)"
--
   drivers/regulator/rtmv20-regulator.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/regulator/rtmv20-regulator.c:192:22: sparse: sparse: bad integer constant expression
>> drivers/regulator/rtmv20-regulator.c:192:22: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(min) greater than high limit (typeof(val))(max)"
--
   drivers/nvme/host/core.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/nvme/host/core.c:3064:42: sparse: sparse: bad integer constant expression
>> drivers/nvme/host/core.c:3064:42: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(shutdown_timeout) greater than high limit (unsigned int)(60)"
--
   drivers/md/bcache/sysfs.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/md/bcache/sysfs.c:315:9: sparse: sparse: bad integer constant expression
>> drivers/md/bcache/sysfs.c:315:9: sparse: sparse: static assertion failed: "clamp() low limit (typeof(v))(0) greater than high limit (typeof(v))(bch_cutoff_writeback)"
   drivers/md/bcache/sysfs.c:341:9: sparse: sparse: bad integer constant expression
>> drivers/md/bcache/sysfs.c:341:9: sparse: sparse: static assertion failed: "clamp() low limit (typeof(v))(1) greater than high limit (typeof(v))(dc->writeback_rate_fp_term_mid - 1)"
   drivers/md/bcache/sysfs.c:344:9: sparse: sparse: bad integer constant expression
>> drivers/md/bcache/sysfs.c:344:9: sparse: sparse: static assertion failed: "clamp() low limit (typeof(v))(dc->writeback_rate_fp_term_low + 1) greater than high limit (typeof(v))(dc->writeback_rate_fp_term_high - 1)"
   drivers/md/bcache/sysfs.c:348:9: sparse: sparse: bad integer constant expression
>> drivers/md/bcache/sysfs.c:348:9: sparse: sparse: static assertion failed: "clamp() low limit (typeof(v))(dc->writeback_rate_fp_term_mid + 1) greater than high limit (typeof(v))((~0U))"
--
   drivers/md/bcache/writeback.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/md/bcache/writeback.c:149:20: sparse: sparse: bad integer constant expression
>> drivers/md/bcache/writeback.c:149:20: sparse: sparse: static assertion failed: "clamp() low limit (int32_t)(dc->writeback_rate_minimum) greater than high limit (int32_t)(1000000000L)"
--
   drivers/video/backlight/lv5207lp.c: note: in included file (through arch/xtensa/include/asm/thread_info.h, arch/xtensa/include/asm/current.h, include/linux/sched.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/video/backlight/lv5207lp.c:109:28: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/lv5207lp.c:109:28: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(0) greater than high limit (unsigned int)(props.max_brightness)"

vim +269 block/kyber-iosched.c

00e043936e9a1c Omar Sandoval     2017-04-14  265  
6e25cb01ea2063 Omar Sandoval     2018-09-27  266  static void kyber_resize_domain(struct kyber_queue_data *kqd,
6e25cb01ea2063 Omar Sandoval     2018-09-27  267  				unsigned int sched_domain, unsigned int depth)
6e25cb01ea2063 Omar Sandoval     2018-09-27  268  {
00e043936e9a1c Omar Sandoval     2017-04-14 @269  	depth = clamp(depth, 1U, kyber_depth[sched_domain]);
6c3b7af1c975b8 Omar Sandoval     2018-09-27  270  	if (depth != kqd->domain_tokens[sched_domain].sb.depth) {
00e043936e9a1c Omar Sandoval     2017-04-14  271  		sbitmap_queue_resize(&kqd->domain_tokens[sched_domain], depth);
c41108049d1433 Christoph Hellwig 2021-10-12  272  		trace_kyber_adjust(kqd->dev, kyber_domain_names[sched_domain],
6c3b7af1c975b8 Omar Sandoval     2018-09-27  273  				   depth);
6c3b7af1c975b8 Omar Sandoval     2018-09-27  274  	}
00e043936e9a1c Omar Sandoval     2017-04-14  275  }
00e043936e9a1c Omar Sandoval     2017-04-14  276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
