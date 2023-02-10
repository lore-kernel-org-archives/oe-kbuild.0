Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB34369
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Feb 2023 00:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675988234; x=1707524234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SYdS8FVjH/LV1qAkKAvYNdwf90H6MlEGtrzcMrs7cGc=;
  b=LFWXp7UuhiCnmdTH8dv8JlTaJj/KY3rrvGjOXFt+YSpdn/wLpgZNRpNA
   kZDaRIDWwf9rKieKvMBA2gckAmoJ21iE96Tu6nc7WBMAzL7VemvLalNLQ
   05jjHRY4TKOKyIlKPvL3dTf2RzJIcpQxLv3hiM4UkUUKnMO9daDgxQHF9
   PL27C+LtRXngsrQvg6AEW4Ay3lovb8emWhWWMFkCmkn2IGi0PY298BY7T
   72U0gKKXG2Fml24p2NwB4zy+A6RXjS2HTViuVmhOjGyJurMHU7zh/stip
   lOvEK7GSOBbkAkqKE1dlumYxlUDYANILM8S+rrUp25pf1HgOE63JJGeol
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="332431680"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="332431680"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 16:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="698226948"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="698226948"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Feb 2023 16:17:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQH6G-0005Oc-0G;
	Fri, 10 Feb 2023 00:17:12 +0000
Date: Fri, 10 Feb 2023 08:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/trace_events.c:2657 add_str_to_module() warn: possible
 memory leak of 'modstr'
Message-ID: <202302100827.DSKdAFYJ-lkp@intel.com>
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
head:   e544a07438522ab3688416e6e2e34bf0ee6d8755
commit: 795301d3c28996219d555023ac6863401b6076bc tracing: Have type enum modifications copy the strings
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-m041-20230208 (https://download.01.org/0day-ci/archive/20230210/202302100827.DSKdAFYJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302100827.DSKdAFYJ-lkp@intel.com/

smatch warnings:
kernel/trace/trace_events.c:2657 add_str_to_module() warn: possible memory leak of 'modstr'

vim +/modstr +2657 kernel/trace/trace_events.c

0c564a538aa934 Steven Rostedt (Red Hat  2015-03-24  2643) 
795301d3c28996 Steven Rostedt (Google   2022-03-18  2644) static void add_str_to_module(struct module *module, char *str)
795301d3c28996 Steven Rostedt (Google   2022-03-18  2645) {
795301d3c28996 Steven Rostedt (Google   2022-03-18  2646) 	struct module_string *modstr;
795301d3c28996 Steven Rostedt (Google   2022-03-18  2647) 
795301d3c28996 Steven Rostedt (Google   2022-03-18  2648) 	modstr = kmalloc(sizeof(*modstr), GFP_KERNEL);
795301d3c28996 Steven Rostedt (Google   2022-03-18  2649) 
795301d3c28996 Steven Rostedt (Google   2022-03-18  2650) 	/*
795301d3c28996 Steven Rostedt (Google   2022-03-18  2651) 	 * If we failed to allocate memory here, then we'll just
795301d3c28996 Steven Rostedt (Google   2022-03-18  2652) 	 * let the str memory leak when the module is removed.
795301d3c28996 Steven Rostedt (Google   2022-03-18  2653) 	 * If this fails to allocate, there's worse problems than
795301d3c28996 Steven Rostedt (Google   2022-03-18  2654) 	 * a leaked string on module removal.
795301d3c28996 Steven Rostedt (Google   2022-03-18  2655) 	 */
795301d3c28996 Steven Rostedt (Google   2022-03-18  2656) 	if (WARN_ON_ONCE(!modstr))
795301d3c28996 Steven Rostedt (Google   2022-03-18 @2657) 		return;
795301d3c28996 Steven Rostedt (Google   2022-03-18  2658) 
795301d3c28996 Steven Rostedt (Google   2022-03-18  2659) 	modstr->module = module;
795301d3c28996 Steven Rostedt (Google   2022-03-18  2660) 	modstr->str = str;
795301d3c28996 Steven Rostedt (Google   2022-03-18  2661) 
795301d3c28996 Steven Rostedt (Google   2022-03-18  2662) 	list_add(&modstr->next, &module_strings);
795301d3c28996 Steven Rostedt (Google   2022-03-18  2663) }
795301d3c28996 Steven Rostedt (Google   2022-03-18  2664) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
