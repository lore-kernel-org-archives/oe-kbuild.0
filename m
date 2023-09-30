Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA503D79
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Sep 2023 20:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696105250; x=1727641250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SumJtGH3HQXfE5jxGUn8kzMdUKVDfWN+WmR5WKbZSIw=;
  b=gbeCyLYl6WhNHh5IHAseFKYxl6B+Q/wPkHQsFCTGUYjjiiMAiVvrmGuC
   iSlqeMfu7Cv28BpDdx0CEWNoBxr3i7YJeDLv+GvyaT81y4wYD+5iVPHIY
   Y7YQKU0P9mPEgsrCEYV/zlYf2G1C5XnMUxIMxhSDXgjd1Vp7aDjME4S5w
   I2vObINg1cRB8Pr/ijK6PUzsqao4EtUc+TC1R5BO+pmZ1F9yiIYPWreRC
   X+9W7usiYwwM7kNBRdqCfitfhcwvFKp2SUfLqW9MZuOBG/ebI4Bm9JVMB
   oDaYn7X25PFs/GOqcS1zwWborwEPv7RXf4gCJjYEqEwXKcUL6vEebELoP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="413378036"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="413378036"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 13:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="893768067"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="893768067"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Sep 2023 13:19:31 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmgSE-0004QG-0A;
	Sat, 30 Sep 2023 20:20:46 +0000
Date: Sun, 1 Oct 2023 04:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 1/4] tracing: add __print_sym() to replace
 __print_symbolic()
Message-ID: <202310010408.Lw4ClCzK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/tracepoint.h:130:9: sparse: this was the original definition"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230921105129.cd040deee13e.I9bd2617499f0d170df58471bc51379742190f92d@changeid>
References: <20230921105129.cd040deee13e.I9bd2617499f0d170df58471bc51379742190f92d@changeid>
TO: Johannes Berg <johannes@sipsolutions.net>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on arnd-asm-generic/master net/main net-next/main linus/master horms-ipvs/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/tracing-add-__print_sym-to-replace-__print_symbolic/20230922-013527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20230921105129.cd040deee13e.I9bd2617499f0d170df58471bc51379742190f92d%40changeid
patch subject: [RFC PATCH 1/4] tracing: add __print_sym() to replace __print_symbolic()
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-062-20230930 (https://download.01.org/0day-ci/archive/20231001/202310010408.Lw4ClCzK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010408.Lw4ClCzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310010408.Lw4ClCzK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpio/gpiolib.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/gpio.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   drivers/gpio/gpiolib.c: note: in included file (through include/trace/events/gpio.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   drivers/gpio/gpiolib.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/gpio.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   drivers/gpio/gpiolib.c: note: in included file (through include/trace/events/gpio.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
--
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/skb.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/skb.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/net.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/net.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/napi.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/napi.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/sock.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/sock.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/udp.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/udp.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/tcp.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/tcp.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/fib.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/fib.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/qdisc.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/qdisc.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/page_pool.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/page_pool.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/neigh.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
>> include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/neigh.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition

vim +130 include/linux/tracepoint.h

2e26ca7150a4f2 Steven Rostedt           2010-05-05  127  
0c564a538aa934 Steven Rostedt (Red Hat  2015-03-24  128) #define TRACE_DEFINE_ENUM(x)
4f0dfd76e9cc92 Jeremy Linton            2017-05-31  129  #define TRACE_DEFINE_SIZEOF(x)
3cfd0b35899800 Johannes Berg            2023-09-21 @130  #define TRACE_DEFINE_SYM_FNS(...)
3cfd0b35899800 Johannes Berg            2023-09-21  131  #define TRACE_DEFINE_SYM_LIST(...)
0c564a538aa934 Steven Rostedt (Red Hat  2015-03-24  132) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
