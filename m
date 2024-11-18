Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5901474AF
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 06:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731912261; cv=none; b=KzGaNr/KbhFvyhtF19c8dj+53m+Lk245iEDD+Cxw1RR7UAO1SbO2IdYlLBQWvxiLYo1c0grhq7UiRMdZRfN4JmntKccO9GXY6fSDPhJCWLjJXUbRvX8TgcbAlToA5MZGG4hV5Sn9E3706boZHOrHThPFIaSIU7hoo+pYq6VGHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731912261; c=relaxed/simple;
	bh=Law4oBxoGxZgc2Sejt3GJhehP1th9Ytm5zhW/L6ZKqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ruh6OLKfDAv3pDsFI/Urwq1yM3jlZm3RpqtYtlhiN9PNoG5fCO68LlcyOrsrZ1Oh0Mg2n3O8oP8N2KkXiFYadw/ZtlgEYiNV1TbzNSFIzZmXxBvhGOGj3stuHpF5xtAk0JR29WDTvpOZ9QAstsRhlszhm5Cn4FxWMnE4KYt5dC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhKR2vLT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhKR2vLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731912260; x=1763448260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Law4oBxoGxZgc2Sejt3GJhehP1th9Ytm5zhW/L6ZKqI=;
  b=PhKR2vLTm1F8ueZ53bM3bauYSWTLHXAvLFO7ay7CfFo35DchPN/wv5Xn
   2qUMRcOj7/UQ/NyVpT5CATDYF5lERo8ee7vf0STmZncYu7fwd4nuqXwsE
   y6wUxmPpiNp9sNBHG0HOIyNaDDOrWSijcS9gYEmvDZr2cz+Y7x2xiI3Zp
   F98jxW8ecepRO9P9aSaA9rm6GbYYs2azbWpyWJHm/o8IzmeVEL6cfbJoV
   VzgN3nsBiMGglw1O/Avx19TjkYdfWj8RG6/Zi/UpcPXl1lti6eoLLuQHm
   ARMk/9fF91yZ3xQC6BPisl5QeguVz9XsN64SaIYwTnA/0SCLmHoG1g391
   g==;
X-CSE-ConnectionGUID: xjKG06bhQFOKAqVsbq1aUw==
X-CSE-MsgGUID: GEwKEnNTSkSRxQ6+YhYBWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49383564"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="49383564"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 22:44:18 -0800
X-CSE-ConnectionGUID: ohj0V4q8RCW43LppOPGcmw==
X-CSE-MsgGUID: VBzHS1VgTFeBTZjWf9+ocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89043956"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2024 22:44:17 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCvUc-0002J5-1E;
	Mon, 18 Nov 2024 06:44:14 +0000
Date: Mon, 18 Nov 2024 14:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/trace/trace_output.c:966:25-29: ERROR: invalid reference to
 the index variable of the iterator on line 949
Message-ID: <202411181424.bgB79BhO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   adc218676eef25575469234709c2d87185ca223a
commit: 80a76994b2d88161697bd92b8b6367d9040dbe2a tracing: Add "fields" option to show raw trace event fields
date:   1 year, 8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 8 months ago
config: i386-randconfig-r062-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181424.bgB79BhO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411181424.bgB79BhO-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
