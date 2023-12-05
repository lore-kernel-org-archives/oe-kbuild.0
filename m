Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C43BB20
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3OL5037"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701773739; x=1733309739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kZcA3+iGopLJ08iaZqNZ5XzaSPGBLuQ0AoeezU00S9U=;
  b=j3OL5037deYWIG83zrgpBK53w02IVulYg44jjOj2yp5ffzCUtcikkcmF
   u1sMI/jF5uVVj7Pbsg9n/0YX75ogb/t0Ik55Ff8FKGUpHuq7R1ZVDORal
   ptL9NOLG5NfW24zwAduHKIEzy9GWXG/EXQPHFDEaBLATIOo7RLKP6nWOx
   bTwNg9e5VpyIPsduk4lcgPa5eXdIgr4/CkgCZF3YECjLzU0FERvQMJdDX
   ezNLSqDkECb+5zljl0PtkKOkMtQMXxGgyQjQd9Yitn/gIMWFDyr1707kb
   CHfmG6bhRsV6Il96QZ2GxMkk/HrUYjBzEsXUxgtQxKZ6sy8jY+fwx9zM4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="391039302"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="391039302"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 02:55:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764289214"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="764289214"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Dec 2023 02:55:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAT5Q-0008op-1R;
	Tue, 05 Dec 2023 10:55:32 +0000
Date: Tue, 5 Dec 2023 18:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/31] net/ipv4/fou_bpf.c:52:13: sparse: sparse: too
 many arguments for function __builtin_expect
Message-ID: <202312051820.g9UAXdhp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: net/ipv4/fou_bpf.c:52:13: sparse: sparse: too many arguments for function __builtin_expect"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Nadav Amit <namit@vmware.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Uros Bizjak <ubizjak@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   fc50065325f8b88d6986f089ae103b5db858ab96
commit: 9a462b9eafa6dda16ea8429b151edb1fb535d744 [11/31] x86/percpu: Use compiler segment prefix qualifier
:::::: branch date: 3 days ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-r121-20231205 (https://download.01.org/0day-ci/archive/20231205/202312051820.g9UAXdhp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051820.g9UAXdhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312051820.g9UAXdhp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got if
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got do
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pto_tmp__
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'default' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got :
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:497:24: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:497:24: sparse: sparse: got (
   include/net/udp.h:497:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:498:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:498:9: sparse: sparse: got }
   include/net/udp.h:501:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:501:16: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:501:16: sparse: sparse: got segs
   include/net/udp.h:502:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:502:1: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got (
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got !
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:522:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:522:9: sparse: sparse: got udp_skb_cb
   include/net/udp.h:522:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   include/net/udp.h:523:16: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:523:16: sparse: sparse: got ->
   include/net/udp.h:523:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:525:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:525:1: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv4/fou_bpf.c: note: in included file (through include/net/dst_metadata.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/ipv4/fou_bpf.c:52:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_bpf.c:55:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_bpf.c:94:13: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got if
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got do
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pto_tmp__
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'default' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got :
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:497:24: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:497:24: sparse: sparse: got (
   include/net/udp.h:497:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:498:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:498:9: sparse: sparse: got }
   include/net/udp.h:501:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:501:16: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:501:16: sparse: sparse: got segs
   include/net/udp.h:502:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:502:1: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got (
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got !
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:522:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:522:9: sparse: sparse: got udp_skb_cb
   include/net/udp.h:522:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   include/net/udp.h:523:16: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:523:16: sparse: sparse: got ->
   include/net/udp.h:523:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:525:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:525:1: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv4/esp4_offload.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/ipv4/esp4_offload.c:130:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4_offload.c:171:13: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got if
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got do
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pto_tmp__
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'default' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got :
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:497:24: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:497:24: sparse: sparse: got (
   include/net/udp.h:497:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:498:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:498:9: sparse: sparse: got }
   include/net/udp.h:501:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:501:16: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:501:16: sparse: sparse: got segs
   include/net/udp.h:502:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:502:1: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got (
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got !
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:522:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:522:9: sparse: sparse: got udp_skb_cb
   include/net/udp.h:522:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   include/net/udp.h:523:16: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:523:16: sparse: sparse: got ->
   include/net/udp.h:523:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:525:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:525:1: sparse: sparse: got }
   net/ipv4/fou_core.c: note: in included file (through include/net/fou.h):
   include/net/ip_tunnels.h:479:51: sparse: sparse: Expected ) at end of cast operator
   include/net/ip_tunnels.h:479:51: sparse: sparse: got __seg_gs
   net/ipv4/fou_core.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv4/fou_core.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/ipv4/fou_core.c:214:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c:272:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c:272:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c:329:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c:356:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c:360:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c:436:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c:436:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c:480:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c:480:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c: note: in included file (through include/net/fou.h):
   include/net/ip_tunnels.h:466:21: sparse: sparse: too many arguments for function __builtin_expect
   include/net/ip_tunnels.h:466:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/fou_core.c: note: in included file:
   include/net/gro.h:104:13: sparse: sparse: too many arguments for function __builtin_expect
   include/net/gro.h:314:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/gro.h:104:13: sparse: sparse: too many arguments for function __builtin_expect
--
   net/l2tp/trace.h:157:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:157:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:157:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:162:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:162:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:162:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:162:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:162:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:162:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:162:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:162:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:162:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:162:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:162:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:162:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:162:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:162:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:162:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:162:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:189:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:189:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:189:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:189:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:189:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:189:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:189:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:189:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:189:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:189:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:189:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:189:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:189:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:189:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:189:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:189:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:194:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:194:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:194:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:194:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:194:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:194:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:194:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:194:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:194:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:194:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:194:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:194:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:194:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:194:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:194:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:194:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:199:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:199:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:199:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:199:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:199:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:199:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:199:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:199:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:199:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:199:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:199:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:199:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:199:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:199:1: sparse: sparse: got __seg_gs
   net/l2tp/trace.h:199:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/trace.h:199:1: sparse: sparse: got __seg_gs
   net/l2tp/l2tp_core.c: note: in included file (through include/linux/trace_events.h, include/trace/trace_events.h, include/trace/define_trace.h, ...):
   include/linux/perf_event.h:1436:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/perf_event.h:1436:32: sparse: sparse: got __seg_gs
   net/l2tp/l2tp_core.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, net/l2tp/trace.h):
   net/l2tp/./trace.h:27:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/./trace.h:27:1: sparse: sparse: got __seg_gs
   net/l2tp/./trace.h:39:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/./trace.h:39:1: sparse: sparse: got __seg_gs
   net/l2tp/./trace.h:51:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/./trace.h:51:1: sparse: sparse: got __seg_gs
   net/l2tp/./trace.h:90:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/./trace.h:90:1: sparse: sparse: got __seg_gs
   net/l2tp/./trace.h:138:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/./trace.h:138:1: sparse: sparse: got __seg_gs
   net/l2tp/./trace.h:167:1: sparse: sparse: Expected ) at end of cast operator
   net/l2tp/./trace.h:167:1: sparse: sparse: got __seg_gs
   net/l2tp/l2tp_core.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/l2tp/l2tp_core.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/l2tp/l2tp_core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, net/l2tp/trace.h):
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, net/l2tp/trace.h):
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c: note: in included file (through include/trace/bpf_probe.h, include/trace/define_trace.h, net/l2tp/trace.h):
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/./trace.h:27:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:39:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:138:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/./trace.h:167:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/l2tp_core.c:171:21: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/l2tp_core.c:171:21: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:909:13: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:909:13: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:975:17: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:975:17: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:975:17: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:975:17: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:975:17: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1291:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1291:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1291:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1291:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1291:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1293:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1293:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1293:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1293:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1293:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1328:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1328:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1328:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1328:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1328:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1337:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1337:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1337:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1337:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1337:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1488:9: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1488:9: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1488:9: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1488:9: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1620:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1620:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1620:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1620:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1620:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1622:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1622:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1622:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1622:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1622:25: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1675:17: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c:1675:17: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, net/l2tp/trace.h):
>> include/linux/trace_events.h:743:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/trace_events.h:748:13: sparse: sparse: too many arguments for function __builtin_expect
>> include/linux/trace_events.h:743:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/trace_events.h:748:13: sparse: sparse: too many arguments for function __builtin_expect
>> include/linux/trace_events.h:743:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/trace_events.h:748:13: sparse: sparse: too many arguments for function __builtin_expect
>> include/linux/trace_events.h:743:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/trace_events.h:748:13: sparse: sparse: too many arguments for function __builtin_expect
>> include/linux/trace_events.h:743:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/trace_events.h:748:13: sparse: sparse: too many arguments for function __builtin_expect
>> include/linux/trace_events.h:743:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/trace_events.h:748:13: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/l2tp_core.c: note: in included file:
>> net/l2tp/trace.h:85:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/trace.h:85:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/trace.h:85:1: sparse: sparse: too many arguments for function __builtin_expect
>> net/l2tp/trace.h:85:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:123:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:123:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:123:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:123:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:90:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:189:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:189:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:189:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:189:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:162:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:162:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:162:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:162:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:194:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:194:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:194:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:194:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:199:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:199:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:199:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:199:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:128:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:128:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:128:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:128:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:133:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:133:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:133:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:133:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:157:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:51:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:80:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:80:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:80:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:80:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:118:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:118:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:118:1: sparse: sparse: too many arguments for function __builtin_expect
   net/l2tp/trace.h:118:1: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got if
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got do
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pto_tmp__
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'default' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got :
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:497:24: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:497:24: sparse: sparse: got (
   include/net/udp.h:497:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:498:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:498:9: sparse: sparse: got }
   include/net/udp.h:501:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:501:16: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:501:16: sparse: sparse: got segs
   include/net/udp.h:502:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:502:1: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got (
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got !
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:522:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:522:9: sparse: sparse: got udp_skb_cb
   include/net/udp.h:522:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   include/net/udp.h:523:16: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:523:16: sparse: sparse: got ->
   include/net/udp.h:523:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:525:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:525:1: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/sched/act_nat.c: note: in included file (through include/linux/netfilter.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/sched/act_nat.c:141:13: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got if
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got do
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pto_tmp__
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'default' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got :
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:497:24: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:497:24: sparse: sparse: got (
   include/net/udp.h:497:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:498:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:498:9: sparse: sparse: got }
   include/net/udp.h:501:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/net/udp.h:501:16: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:501:16: sparse: sparse: got segs
   include/net/udp.h:502:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:502:1: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got (
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:507:9: sparse: sparse: got !
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:522:9: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:522:9: sparse: sparse: got udp_skb_cb
   include/net/udp.h:522:9: sparse: sparse: Trying to use reserved word 'struct' as identifier
   include/net/udp.h:523:16: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:523:16: sparse: sparse: got ->
   include/net/udp.h:523:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:525:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:525:1: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/sched/cls_flower.c: note: in included file (through include/linux/if_ether.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/sched/cls_flower.c:372:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/sched/cls_flower.c:372:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1261:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1261:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1261:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1261:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1261:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1998:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1998:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1998:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1998:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:1998:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:2558:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:2558:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:2558:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:2558:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sched/cls_flower.c:2558:9: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/sch_generic.h:912:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:912:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:912:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:912:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:912:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:912:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:912:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:912:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:912:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:912:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:937:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:937:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1122:17: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1122:17: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1290:23: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1290:23: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   include/net/sch_generic.h:1295:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:1295:9: sparse: sparse: got __seg_gs
   drivers/infiniband/sw/rxe/rxe_net.c: note: in included file (through include/net/udp_tunnel.h):
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   drivers/infiniband/sw/rxe/rxe_net.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> drivers/infiniband/sw/rxe/rxe_net.c:33:9: sparse: sparse: too many arguments for function __builtin_expect
>> drivers/infiniband/sw/rxe/rxe_net.c:33:9: sparse: sparse: too many arguments for function __builtin_expect
>> drivers/infiniband/sw/rxe/rxe_net.c:33:9: sparse: sparse: too many arguments for function __builtin_expect
>> drivers/infiniband/sw/rxe/rxe_net.c:33:9: sparse: sparse: too many arguments for function __builtin_expect
>> drivers/infiniband/sw/rxe/rxe_net.c:33:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:34:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:34:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:34:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:34:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:34:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:57:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:57:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:57:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:57:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:57:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:58:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:58:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:58:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:58:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:58:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:69:13: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:352:13: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:382:13: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:402:13: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:402:13: sparse: sparse: too many arguments for function __builtin_expect
   drivers/infiniband/sw/rxe/rxe_net.c:488:13: sparse: sparse: too many arguments for function __builtin_expect

vim +52 net/ipv4/fou_bpf.c

c50e96099edb13 Christian Ehrig 2023-04-07  24  
c50e96099edb13 Christian Ehrig 2023-04-07  25  __diag_push();
c50e96099edb13 Christian Ehrig 2023-04-07  26  __diag_ignore_all("-Wmissing-prototypes",
c50e96099edb13 Christian Ehrig 2023-04-07  27  		  "Global functions as their definitions will be in BTF");
c50e96099edb13 Christian Ehrig 2023-04-07  28  
c50e96099edb13 Christian Ehrig 2023-04-07  29  /* bpf_skb_set_fou_encap - Set FOU encap parameters
c50e96099edb13 Christian Ehrig 2023-04-07  30   *
c50e96099edb13 Christian Ehrig 2023-04-07  31   * This function allows for using GUE or FOU encapsulation together with an
c50e96099edb13 Christian Ehrig 2023-04-07  32   * ipip device in collect-metadata mode.
c50e96099edb13 Christian Ehrig 2023-04-07  33   *
c50e96099edb13 Christian Ehrig 2023-04-07  34   * It is meant to be used in BPF tc-hooks and after a call to the
c50e96099edb13 Christian Ehrig 2023-04-07  35   * bpf_skb_set_tunnel_key helper, responsible for setting IP addresses.
c50e96099edb13 Christian Ehrig 2023-04-07  36   *
c50e96099edb13 Christian Ehrig 2023-04-07  37   * Parameters:
c50e96099edb13 Christian Ehrig 2023-04-07  38   * @skb_ctx	Pointer to ctx (__sk_buff) in TC program. Cannot be NULL
c50e96099edb13 Christian Ehrig 2023-04-07  39   * @encap	Pointer to a `struct bpf_fou_encap` storing UDP src and
c50e96099edb13 Christian Ehrig 2023-04-07  40   * 		dst ports. If sport is set to 0 the kernel will auto-assign a
c50e96099edb13 Christian Ehrig 2023-04-07  41   * 		port. This is similar to using `encap-sport auto`.
c50e96099edb13 Christian Ehrig 2023-04-07  42   * 		Cannot be NULL
c50e96099edb13 Christian Ehrig 2023-04-07  43   * @type	Encapsulation type for the packet. Their definitions are
c50e96099edb13 Christian Ehrig 2023-04-07  44   * 		specified in `enum bpf_fou_encap_type`
c50e96099edb13 Christian Ehrig 2023-04-07  45   */
c50e96099edb13 Christian Ehrig 2023-04-07  46  __bpf_kfunc int bpf_skb_set_fou_encap(struct __sk_buff *skb_ctx,
c50e96099edb13 Christian Ehrig 2023-04-07  47  				      struct bpf_fou_encap *encap, int type)
c50e96099edb13 Christian Ehrig 2023-04-07  48  {
c50e96099edb13 Christian Ehrig 2023-04-07  49  	struct sk_buff *skb = (struct sk_buff *)skb_ctx;
c50e96099edb13 Christian Ehrig 2023-04-07  50  	struct ip_tunnel_info *info = skb_tunnel_info(skb);
c50e96099edb13 Christian Ehrig 2023-04-07  51  
c50e96099edb13 Christian Ehrig 2023-04-07 @52  	if (unlikely(!encap))
c50e96099edb13 Christian Ehrig 2023-04-07  53  		return -EINVAL;
c50e96099edb13 Christian Ehrig 2023-04-07  54  
c50e96099edb13 Christian Ehrig 2023-04-07  55  	if (unlikely(!info || !(info->mode & IP_TUNNEL_INFO_TX)))
c50e96099edb13 Christian Ehrig 2023-04-07  56  		return -EINVAL;
c50e96099edb13 Christian Ehrig 2023-04-07  57  
c50e96099edb13 Christian Ehrig 2023-04-07  58  	switch (type) {
c50e96099edb13 Christian Ehrig 2023-04-07  59  	case FOU_BPF_ENCAP_FOU:
c50e96099edb13 Christian Ehrig 2023-04-07  60  		info->encap.type = TUNNEL_ENCAP_FOU;
c50e96099edb13 Christian Ehrig 2023-04-07  61  		break;
c50e96099edb13 Christian Ehrig 2023-04-07  62  	case FOU_BPF_ENCAP_GUE:
c50e96099edb13 Christian Ehrig 2023-04-07  63  		info->encap.type = TUNNEL_ENCAP_GUE;
c50e96099edb13 Christian Ehrig 2023-04-07  64  		break;
c50e96099edb13 Christian Ehrig 2023-04-07  65  	default:
c50e96099edb13 Christian Ehrig 2023-04-07  66  		info->encap.type = TUNNEL_ENCAP_NONE;
c50e96099edb13 Christian Ehrig 2023-04-07  67  	}
c50e96099edb13 Christian Ehrig 2023-04-07  68  
c50e96099edb13 Christian Ehrig 2023-04-07  69  	if (info->key.tun_flags & TUNNEL_CSUM)
c50e96099edb13 Christian Ehrig 2023-04-07  70  		info->encap.flags |= TUNNEL_ENCAP_FLAG_CSUM;
c50e96099edb13 Christian Ehrig 2023-04-07  71  
c50e96099edb13 Christian Ehrig 2023-04-07  72  	info->encap.sport = encap->sport;
c50e96099edb13 Christian Ehrig 2023-04-07  73  	info->encap.dport = encap->dport;
c50e96099edb13 Christian Ehrig 2023-04-07  74  
c50e96099edb13 Christian Ehrig 2023-04-07  75  	return 0;
c50e96099edb13 Christian Ehrig 2023-04-07  76  }
c50e96099edb13 Christian Ehrig 2023-04-07  77  

:::::: The code at line 52 was first introduced by commit
:::::: c50e96099edb134bf107fafc02715fbc4aa2277f bpf,fou: Add bpf_skb_{set,get}_fou_encap kfuncs

:::::: TO: Christian Ehrig <cehrig@cloudflare.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
