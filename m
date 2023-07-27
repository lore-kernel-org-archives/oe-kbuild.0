Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615967C
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 01:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690420358; x=1721956358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AF523TIyV18r15wer9nZAUweXejC4j8fgzFeDBmWLgg=;
  b=N/cs4mxXLmm65p8c8IhvYzuk6Ut59vEoLrhawJBmCCUQ4kuqG6m3eU+b
   83GgjFS6UlacS/aZoExq8ddwnqu1rLwp+r73hjnKk27MJCZrhbnohXmRi
   k5t/pPY0PSszZd/RsKNB2ICXqaaAg4xFKoz12W8HNqhaNMDQBKJmpZ5Rx
   DWRx1Hlw4OiCXB5mPurM9nFuEaJzvn8gnLukJfCpKCVz713LfSLeL+D6C
   sTUj8r0wh71/LHC044kfzeA8pZhcTlUrZ82C9HZjQPuhjptoi7eOoLf/r
   +fUYOyA9uTFq5Z4UszGD+MSiE9n3YqrTPS9OPkNSFZrNvBmQ0I/92sg3I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353075651"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="353075651"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 18:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756446187"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="756446187"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 26 Jul 2023 18:12:36 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOpYS-0001Vj-0P;
	Thu, 27 Jul 2023 01:12:36 +0000
Date: Thu, 27 Jul 2023 09:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 4/5] minmax: Allow comparisons of 'int'
 against 'unsigned char/short'.
Message-ID: <202307270849.FK0gYKJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/kernel/cpu/cacheinfo.c:341:24: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a3309fcd947a4fb3826f1e8b8b9da585@AcuMS.aculab.com>
References: <a3309fcd947a4fb3826f1e8b8b9da585@AcuMS.aculab.com>
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
patch link:    https://lore.kernel.org/r/a3309fcd947a4fb3826f1e8b8b9da585%40AcuMS.aculab.com
patch subject: [PATCH next resend 4/5] minmax: Allow comparisons of 'int' against 'unsigned char/short'.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r071-20230725 (https://download.01.org/0day-ci/archive/20230727/202307270849.FK0gYKJu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270849.FK0gYKJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307270849.FK0gYKJu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/cacheinfo.c:341:24: sparse: sparse: too long token expansion
>> arch/x86/kernel/cpu/cacheinfo.c:341:24: sparse: sparse: too long token expansion

vim +341 arch/x86/kernel/cpu/cacheinfo.c

0d55ba46bfbee6 arch/x86/kernel/cpu/intel_cacheinfo.c Sudeep Holla       2015-03-04  317  
048a8774ca4348 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-01-22  318  /*
ba06edb63f5ef2 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-04-22  319   * L3 cache descriptors
048a8774ca4348 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-01-22  320   */
148f9bb87745ed arch/x86/kernel/cpu/intel_cacheinfo.c Paul Gortmaker     2013-06-18  321  static void amd_calc_l3_indices(struct amd_northbridge *nb)
ba06edb63f5ef2 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-04-22  322  {
d2946041ff3cbe arch/x86/kernel/cpu/intel_cacheinfo.c Thomas Gleixner    2011-07-24  323  	struct amd_l3_cache *l3 = &nb->l3_cache;
048a8774ca4348 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-01-22  324  	unsigned int sc0, sc1, sc2, sc3;
cb19060abfdeca arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-02-18  325  	u32 val = 0;
048a8774ca4348 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-01-22  326  
d2946041ff3cbe arch/x86/kernel/cpu/intel_cacheinfo.c Thomas Gleixner    2011-07-24  327  	pci_read_config_dword(nb->misc, 0x1C4, &val);
048a8774ca4348 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-01-22  328  
048a8774ca4348 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-01-22  329  	/* calculate subcache sizes */
9350f982e4fe53 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-04-22  330  	l3->subcaches[0] = sc0 = !(val & BIT(0));
9350f982e4fe53 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-04-22  331  	l3->subcaches[1] = sc1 = !(val & BIT(4));
77e75fc764baf6 arch/x86/kernel/cpu/intel_cacheinfo.c Frank Arnold       2011-05-18  332  
77e75fc764baf6 arch/x86/kernel/cpu/intel_cacheinfo.c Frank Arnold       2011-05-18  333  	if (boot_cpu_data.x86 == 0x15) {
77e75fc764baf6 arch/x86/kernel/cpu/intel_cacheinfo.c Frank Arnold       2011-05-18  334  		l3->subcaches[0] = sc0 += !(val & BIT(1));
77e75fc764baf6 arch/x86/kernel/cpu/intel_cacheinfo.c Frank Arnold       2011-05-18  335  		l3->subcaches[1] = sc1 += !(val & BIT(5));
77e75fc764baf6 arch/x86/kernel/cpu/intel_cacheinfo.c Frank Arnold       2011-05-18  336  	}
77e75fc764baf6 arch/x86/kernel/cpu/intel_cacheinfo.c Frank Arnold       2011-05-18  337  
9350f982e4fe53 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-04-22  338  	l3->subcaches[2] = sc2 = !(val & BIT(8))  + !(val & BIT(9));
9350f982e4fe53 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-04-22  339  	l3->subcaches[3] = sc3 = !(val & BIT(12)) + !(val & BIT(13));
9350f982e4fe53 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-04-22  340  
732eacc0542d0a arch/x86/kernel/cpu/intel_cacheinfo.c Hagen Paul Pfeifer 2010-10-26 @341  	l3->indices = (max(max3(sc0, sc1, sc2), sc3) << 10) - 1;
ba06edb63f5ef2 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-04-22  342  }
ba06edb63f5ef2 arch/x86/kernel/cpu/intel_cacheinfo.c Borislav Petkov    2010-04-22  343  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
