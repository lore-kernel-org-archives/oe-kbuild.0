Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C15EAD27
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Sep 2023 21:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696109576; x=1727645576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+J5ERgPXLUC/GOMXLVf0WCTE5GwRHQ/RSAZk5Z4ufc=;
  b=Tgn8qM1+rHiqaxDCaqdTvF/X3HTUZ9cjSYCmfHLT5TiqoCtQBQvsdGhh
   p6PPrcFGDM2vAlnB6e5xaginJQ+noP7TMfyfVu3W4PNSOovdm6btJhRHc
   kmlWI01cv1sTnrO2UOpYY08lmPa50oQHK7vuSys/qGvANNgRq0d/GT+ao
   6AEnoT96jbXx6DuBIJstNHvSDkP6iarxufHf4nXSAHy1u5M3J/EFXBr+U
   teGw6qW2YjNmD8Tjs00lTtiBMJw65lBfQomPqdc5UdJnlIy5cp3FoFT0g
   Eva4TzH9BySfa3zHxSCWDsvtKd41LJUiVctgjvMBxXEbERYcRpWMR9z9f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="372827160"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="372827160"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 14:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="815900922"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="815900922"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Sep 2023 14:32:50 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmhZw-0004UL-2F;
	Sat, 30 Sep 2023 21:32:48 +0000
Date: Sun, 1 Oct 2023 05:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 2/4] net: dropreason: use new __print_sym() in tracing
Message-ID: <202310010544.vN1uSJRp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/trace/events/skb.h:18:1: sparse: sparse: unknown escape sequence: '\/'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230921105129.2f2774a87760.I075de1ac698b47710b94c631afdfb328f07be961@changeid>
References: <20230921105129.2f2774a87760.I075de1ac698b47710b94c631afdfb328f07be961@changeid>
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
patch link:    https://lore.kernel.org/r/20230921105129.2f2774a87760.I075de1ac698b47710b94c631afdfb328f07be961%40changeid
patch subject: [RFC PATCH 2/4] net: dropreason: use new __print_sym() in tracing
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-062-20230930 (https://download.01.org/0day-ci/archive/20231001/202310010544.vN1uSJRp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010544.vN1uSJRp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310010544.vN1uSJRp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/skb.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/skb.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/net.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/net.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/napi.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/napi.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/sock.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/sock.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/udp.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/udp.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/tcp.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/tcp.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/fib.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/fib.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/qdisc.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/qdisc.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/page_pool.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/page_pool.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/neigh.h):
   include/trace/stages/init.h:30:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_FNS redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:130:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/neigh.h):
   include/trace/stages/init.h:54:9: sparse: sparse: preprocessor token TRACE_DEFINE_SYM_LIST redefined
   net/core/net-traces.c: note: in included file (through include/trace/events/skb.h):
   include/linux/tracepoint.h:131:9: sparse: this was the original definition
   net/core/net-traces.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/skb.h):
>> include/trace/events/skb.h:18:1: sparse: sparse: unknown escape sequence: '/'
>> include/trace/events/skb.h:18:1: sparse: sparse: unknown escape sequence: '/'

vim +18 include/trace/events/skb.h

9cb252c4c1c53a include/trace/events/skb.h Menglong Dong      2022-09-05  14  
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  15  /*
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  16   * Tracepoint for free an sk_buff:
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  17   */
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10 @18  TRACE_EVENT(kfree_skb,
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  19  
c504e5c2f9648a include/trace/events/skb.h Menglong Dong      2022-01-09  20  	TP_PROTO(struct sk_buff *skb, void *location,
c504e5c2f9648a include/trace/events/skb.h Menglong Dong      2022-01-09  21  		 enum skb_drop_reason reason),
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  22  
c504e5c2f9648a include/trace/events/skb.h Menglong Dong      2022-01-09  23  	TP_ARGS(skb, location, reason),
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  24  
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  25  	TP_STRUCT__entry(
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  26  		__field(void *,		skbaddr)
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  27  		__field(void *,		location)
ca9da2dd63b0b3 include/trace/events/skb.h David Sharp        2010-12-03  28  		__field(unsigned short,	protocol)
c504e5c2f9648a include/trace/events/skb.h Menglong Dong      2022-01-09  29  		__field(enum skb_drop_reason,	reason)
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  30  	),
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  31  
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  32  	TP_fast_assign(
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  33  		__entry->skbaddr = skb;
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  34  		__entry->location = location;
ca9da2dd63b0b3 include/trace/events/skb.h David Sharp        2010-12-03  35  		__entry->protocol = ntohs(skb->protocol);
c504e5c2f9648a include/trace/events/skb.h Menglong Dong      2022-01-09  36  		__entry->reason = reason;
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  37  	),
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  38  
14e5f71e31ff39 include/trace/events/skb.h Stanislav Fomichev 2022-11-22  39  	TP_printk("skbaddr=%p protocol=%u location=%pS reason: %s",
c504e5c2f9648a include/trace/events/skb.h Menglong Dong      2022-01-09  40  		  __entry->skbaddr, __entry->protocol, __entry->location,
f3ff481eeacc8e include/trace/events/skb.h Johannes Berg      2023-09-21  41  		  __print_sym(__entry->reason, drop_reason ))
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  42  );
ea20d9293ce423 include/trace/skb.h        Steven Rostedt     2009-04-10  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
