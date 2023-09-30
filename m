Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50984156C9
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Sep 2023 19:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696101546; x=1727637546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qAYoVpOmCClqmUXpEs7w6yxkeD1HmuA37nzmiM0wXQM=;
  b=CWtMaEfYBRodQADmjDRusJxYpJUvKtPQZUq1IEnGNLVSazY6HsZ4bugS
   PC9VvFfkkg0jgMkGaBDex2K31XqrIaRLdnwJtVMpvrwZq/BLnzrFeD99O
   +2x3FmsyLLK+lr72yIP0ZTzH7l1w7krOcuTprJDEaQLEC1BtaKz5t4FvD
   4gIi6xUlSbKaOnlINsRqv8KZDE8b2hf7BI9GWGljXeM2+SRpDom2iIm6J
   M6Ufsr4NXgOnUR42uKu56P4pPCjAw2v0ezB9edJ3dyeAfYTxg7ARcCoqz
   le73oI+TKs7F0euEbr/LWCiHVqSuYJvuGxWSd+lS5rCdLqaVRHBhh82Vy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="361848959"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="361848959"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 12:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="753681252"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="753681252"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Sep 2023 12:19:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmfUT-0004O1-1p;
	Sat, 30 Sep 2023 19:19:01 +0000
Date: Sun, 1 Oct 2023 03:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 4/4] tracing/timer: use __print_sym()
Message-ID: <202310010306.v3XTbHaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/trace/events/timer.h:398:1: sparse: sparse: unknown escape sequence: '\/'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230921105129.e76b17c18447.I5e112e423a69704fa05db74a05a6ebaad45d4f6e@changeid>
References: <20230921105129.e76b17c18447.I5e112e423a69704fa05db74a05a6ebaad45d4f6e@changeid>
TO: Johannes Berg <johannes@sipsolutions.net>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on arnd-asm-generic/master net/main net-next/main linus/master v6.6-rc3 next-20230929]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/tracing-add-__print_sym-to-replace-__print_symbolic/20230922-013527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20230921105129.e76b17c18447.I5e112e423a69704fa05db74a05a6ebaad45d4f6e%40changeid
patch subject: [RFC PATCH 4/4] tracing/timer: use __print_sym()
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-061-20230930 (https://download.01.org/0day-ci/archive/20231001/202310010306.v3XTbHaU-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010306.v3XTbHaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310010306.v3XTbHaU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/time/timer.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/timer.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   kernel/time/timer.c: note: in included file (through include/trace/syscall.h, include/linux/syscalls.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   kernel/time/timer.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/timer.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   kernel/time/timer.c: note: in included file (through include/trace/syscall.h, include/linux/syscalls.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   kernel/time/timer.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/timer.h):
>> include/trace/events/timer.h:398:1: sparse: sparse: unknown escape sequence: '/'
>> include/trace/events/timer.h:398:1: sparse: sparse: unknown escape sequence: '/'

vim +398 include/trace/events/timer.h

e6e6cc22e067a6 Frederic Weisbecker 2015-12-11  394  
e6e6cc22e067a6 Frederic Weisbecker 2015-12-11  395  #define show_tick_dep_name(val)				\
1a5ceabe01e333 Johannes Berg       2023-09-21  396  	__print_sym(val, tick_dep_names)
e6e6cc22e067a6 Frederic Weisbecker 2015-12-11  397  
cb41a29076e9f9 Frederic Weisbecker 2013-04-20 @398  TRACE_EVENT(tick_stop,
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  399  
e6e6cc22e067a6 Frederic Weisbecker 2015-12-11  400  	TP_PROTO(int success, int dependency),
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  401  
e6e6cc22e067a6 Frederic Weisbecker 2015-12-11  402  	TP_ARGS(success, dependency),
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  403  
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  404  	TP_STRUCT__entry(
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  405  		__field( int ,		success	)
e6e6cc22e067a6 Frederic Weisbecker 2015-12-11  406  		__field( int ,		dependency )
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  407  	),
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  408  
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  409  	TP_fast_assign(
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  410  		__entry->success	= success;
e6e6cc22e067a6 Frederic Weisbecker 2015-12-11  411  		__entry->dependency	= dependency;
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  412  	),
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  413  
e6e6cc22e067a6 Frederic Weisbecker 2015-12-11  414  	TP_printk("success=%d dependency=%s",  __entry->success, \
e6e6cc22e067a6 Frederic Weisbecker 2015-12-11  415  			show_tick_dep_name(__entry->dependency))
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  416  );
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  417  #endif
cb41a29076e9f9 Frederic Weisbecker 2013-04-20  418  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
