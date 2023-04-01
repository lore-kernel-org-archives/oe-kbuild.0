Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D05256
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680373658; x=1711909658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+cORIDTfVYgAfOiB8GsLOLTyrNT8DBqmjneoYDpBe0U=;
  b=SutsTd/KNZlqUJS0vc7z1bfPlb8Ol0Ifb7oeZk+SGHCDhyvjUKWg9vv2
   NkL0WyibkrTnViXT2xggECnBCMUsgwjQjHZLURwP8aky+JIfmUmHfA76D
   5H1iaD/tdMm7A9RTENHF1d7JSrPbPVkFFcgoleyL4+55cU7uFNKHB5c2D
   DqHRGrj0appBEGfsvo4yeYJMtq3dWZOpWMyy/mx7yf2gfR2ESDrxe376b
   sA8nJFSdjPdzo0M2WCXNoRET/GkhOEBG4H5GYapYTLtAWCeDToOxzbk3m
   9cAHpq6C94dUVUMs2lP0cy0OMs8QzJDvdt8dquICiXQTERB5P/kra7K1S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="341693264"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="341693264"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 11:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="715798574"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="715798574"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Apr 2023 11:27:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pifwt-000Mxl-29;
	Sat, 01 Apr 2023 18:27:35 +0000
Date: Sun, 2 Apr 2023 02:26:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [trace:trace/for-next 22/36] kernel/trace/trace_output.c:966:25-29:
 ERROR: invalid reference to the index variable of the iterator on line 949
Message-ID: <202304020250.H2zbwBjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   88fe1ec75fcb296579e05eaf3807da3ee83137e4
commit: 80a76994b2d88161697bd92b8b6367d9040dbe2a [22/36] tracing: Add "fields" option to show raw trace event fields
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: csky-randconfig-c032-20230329 (https://download.01.org/0day-ci/archive/20230402/202304020250.H2zbwBjs-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304020250.H2zbwBjs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/trace/trace_output.c:966:25-29: ERROR: invalid reference to the index variable of the iterator on line 949

vim +966 kernel/trace/trace_output.c

80a76994b2d881 Steven Rostedt (Google  2023-03-28  937) 
80a76994b2d881 Steven Rostedt (Google  2023-03-28  938) enum print_line_t print_event_fields(struct trace_iterator *iter,
80a76994b2d881 Steven Rostedt (Google  2023-03-28  939) 				     struct trace_event *event)
80a76994b2d881 Steven Rostedt (Google  2023-03-28  940) {
80a76994b2d881 Steven Rostedt (Google  2023-03-28  941) 	struct trace_event_call *call;
80a76994b2d881 Steven Rostedt (Google  2023-03-28  942) 	struct list_head *head;
80a76994b2d881 Steven Rostedt (Google  2023-03-28  943) 
80a76994b2d881 Steven Rostedt (Google  2023-03-28  944) 	/* ftrace defined events have separate call structures */
80a76994b2d881 Steven Rostedt (Google  2023-03-28  945) 	if (event->type <= __TRACE_LAST_TYPE) {
80a76994b2d881 Steven Rostedt (Google  2023-03-28  946) 		bool found = false;
80a76994b2d881 Steven Rostedt (Google  2023-03-28  947) 
80a76994b2d881 Steven Rostedt (Google  2023-03-28  948) 		down_read(&trace_event_sem);
80a76994b2d881 Steven Rostedt (Google  2023-03-28 @949) 		list_for_each_entry(call, &ftrace_events, list) {
80a76994b2d881 Steven Rostedt (Google  2023-03-28  950) 			if (call->event.type == event->type) {
80a76994b2d881 Steven Rostedt (Google  2023-03-28  951) 				found = true;
80a76994b2d881 Steven Rostedt (Google  2023-03-28  952) 				break;
80a76994b2d881 Steven Rostedt (Google  2023-03-28  953) 			}
80a76994b2d881 Steven Rostedt (Google  2023-03-28  954) 			/* No need to search all events */
80a76994b2d881 Steven Rostedt (Google  2023-03-28  955) 			if (call->event.type > __TRACE_LAST_TYPE)
80a76994b2d881 Steven Rostedt (Google  2023-03-28  956) 				break;
80a76994b2d881 Steven Rostedt (Google  2023-03-28  957) 		}
80a76994b2d881 Steven Rostedt (Google  2023-03-28  958) 		up_read(&trace_event_sem);
80a76994b2d881 Steven Rostedt (Google  2023-03-28  959) 		if (!found) {
80a76994b2d881 Steven Rostedt (Google  2023-03-28  960) 			trace_seq_printf(&iter->seq, "UNKNOWN TYPE %d\n", event->type);
80a76994b2d881 Steven Rostedt (Google  2023-03-28  961) 			goto out;
80a76994b2d881 Steven Rostedt (Google  2023-03-28  962) 		}
80a76994b2d881 Steven Rostedt (Google  2023-03-28  963) 	} else {
80a76994b2d881 Steven Rostedt (Google  2023-03-28  964) 		call = container_of(event, struct trace_event_call, event);
80a76994b2d881 Steven Rostedt (Google  2023-03-28  965) 	}
80a76994b2d881 Steven Rostedt (Google  2023-03-28 @966) 	head = trace_get_fields(call);
80a76994b2d881 Steven Rostedt (Google  2023-03-28  967) 
80a76994b2d881 Steven Rostedt (Google  2023-03-28  968) 	trace_seq_printf(&iter->seq, "%s:", trace_event_name(call));
80a76994b2d881 Steven Rostedt (Google  2023-03-28  969) 
80a76994b2d881 Steven Rostedt (Google  2023-03-28  970) 	if (head && !list_empty(head))
80a76994b2d881 Steven Rostedt (Google  2023-03-28  971) 		print_fields(iter, call, head);
80a76994b2d881 Steven Rostedt (Google  2023-03-28  972) 	else
80a76994b2d881 Steven Rostedt (Google  2023-03-28  973) 		trace_seq_puts(&iter->seq, "No fields found\n");
80a76994b2d881 Steven Rostedt (Google  2023-03-28  974) 
80a76994b2d881 Steven Rostedt (Google  2023-03-28  975)  out:
80a76994b2d881 Steven Rostedt (Google  2023-03-28  976) 	return trace_handle_return(&iter->seq);
80a76994b2d881 Steven Rostedt (Google  2023-03-28  977) }
80a76994b2d881 Steven Rostedt (Google  2023-03-28  978) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
