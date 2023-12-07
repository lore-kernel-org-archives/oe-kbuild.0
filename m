Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1F43AC2D
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDWam8is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701952556; x=1733488556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q9no+tYyM32R53LJEROgt+Lwt+Hw0pYx6k4ZrLumQrA=;
  b=gDWam8isJsfgripEY/nLDvDq4Ftb5C3+zYunngIAglWO3FRClQ0ZM4Jn
   KtllY8y7uBSheHH/ikl26axwhRcUJAeO8RyZYhjtDP42fN+Z+Ef6nQbTk
   HCZtFRwOECkIjAoEQLgs38XXRNJRI5C7WylNoK4/FGcCsEj8RD8U5vuQp
   Y7GFrQHd4EB8+Da4Fz8xDe4Mjih2UQCOyv2y3YA+dGSNur+L/Ggse+Ql7
   WB9D+3bBCdos3eO8y8ZU0ALq/Crd/izmQh+vSqyay1ih379qM+jwdLJ5Z
   nyhiMLiHMd64Zga0UgaZdAOdbkhYoREgCo7t2dG6CAng32kldHjJcWRqK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1049672"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1049672"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:35:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="765094130"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="765094130"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 07 Dec 2023 04:35:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBDbL-000CEk-1S;
	Thu, 07 Dec 2023 12:35:35 +0000
Date: Thu, 7 Dec 2023 20:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/31] include/net/udp.h:495:17: sparse: sparse:
 Trying to use reserved word 'typeof' as identifier
Message-ID: <202312072058.SfqjwVG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier"
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
:::::: branch date: 5 days ago
:::::: commit date: 9 weeks ago
config: i386-randconfig-062-20231203 (https://download.01.org/0day-ci/archive/20231207/202312072058.SfqjwVG2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072058.SfqjwVG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312072058.SfqjwVG2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/core/gso.c: note: in included file:
   include/net/gro.h:21:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:21:17: sparse: sparse: got }
   include/net/gro.h:30:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:30:9: sparse: sparse: got }
   include/net/gro.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:89:1: sparse: sparse: got }
   net/core/gso.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/core/gso.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/core/gso.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/core/gso.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/core/gso.c:45:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gso.c:93:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gso.c:126:28: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gso.c:152:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gso.c:154:20: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gso.c:156:20: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/core/netpoll.c: note: in included file:
   include/net/addrconf.h:39:42: sparse: sparse: Expected ; at end of declaration
   include/net/addrconf.h:39:42: sparse: sparse: got :
   include/net/addrconf.h:50:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/addrconf.h:50:1: sparse: sparse: got }
   net/core/netpoll.c: note: in included file:
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
--
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c:334:9: sparse: sparse: Expected ) at end of cast operator
   net/core/netpoll.c:334:9: sparse: sparse: got __seg_fs
   net/core/netpoll.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/core/netpoll.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/core/netpoll.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/core/netpoll.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/core/netpoll.c:271:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:285:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:85:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:120:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:130:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:136:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:169:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:169:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:169:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:169:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:169:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:334:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:334:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:334:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:334:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:334:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:334:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:370:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:370:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:370:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:370:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:370:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:388:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:394:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:411:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:411:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:847:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:847:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:847:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:847:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c:847:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/netpoll.c: note: in included file:
   include/trace/events/napi.h:14:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/napi.h:14:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/napi.h:14:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/napi.h:14:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/napi.h:14:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/napi.h:14:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/napi.h:14:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/napi.h:14:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/napi.h:14:1: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/core/selftests.c:30:1: sparse: sparse: Expected ; at the end of type declaration
   net/core/selftests.c:30:1: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/core/selftests.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/core/selftests.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/core/selftests.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/linux/phy.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/core/selftests.c:65:20: sparse: sparse: using member 'size' in incomplete struct net_packet_attrs
   net/core/selftests.c:67:17: sparse: sparse: using member 'tcp' in incomplete struct net_packet_attrs
   net/core/selftests.c:72:17: sparse: sparse: using member 'max_size' in incomplete struct net_packet_attrs
   net/core/selftests.c:73:28: sparse: sparse: using member 'max_size' in incomplete struct net_packet_attrs
   net/core/selftests.c:88:17: sparse: sparse: using member 'tcp' in incomplete struct net_packet_attrs
   net/core/selftests.c:95:17: sparse: sparse: using member 'src' in incomplete struct net_packet_attrs
   net/core/selftests.c:96:53: sparse: sparse: using member 'src' in incomplete struct net_packet_attrs
   net/core/selftests.c:97:17: sparse: sparse: using member 'dst' in incomplete struct net_packet_attrs
   net/core/selftests.c:98:51: sparse: sparse: using member 'dst' in incomplete struct net_packet_attrs
   net/core/selftests.c:102:17: sparse: sparse: using member 'tcp' in incomplete struct net_packet_attrs
   net/core/selftests.c:103:32: sparse: sparse: using member 'sport' in incomplete struct net_packet_attrs
>> net/core/selftests.c:103:32: sparse: sparse: cast from unknown type
   net/core/selftests.c:104:30: sparse: sparse: using member 'dport' in incomplete struct net_packet_attrs
   net/core/selftests.c:104:30: sparse: sparse: cast from unknown type
   net/core/selftests.c:108:32: sparse: sparse: using member 'sport' in incomplete struct net_packet_attrs
   net/core/selftests.c:108:32: sparse: sparse: cast from unknown type
   net/core/selftests.c:109:30: sparse: sparse: using member 'dport' in incomplete struct net_packet_attrs
   net/core/selftests.c:109:30: sparse: sparse: cast from unknown type
   net/core/selftests.c:110:29: sparse: sparse: using member 'size' in incomplete struct net_packet_attrs
   net/core/selftests.c:110:29: sparse: sparse: cast from unknown type
   net/core/selftests.c:111:25: sparse: sparse: using member 'max_size' in incomplete struct net_packet_attrs
   net/core/selftests.c:112:37: sparse: sparse: using member 'max_size' in incomplete struct net_packet_attrs
   net/core/selftests.c:112:37: sparse: sparse: cast from unknown type
   net/core/selftests.c:120:17: sparse: sparse: using member 'tcp' in incomplete struct net_packet_attrs
   net/core/selftests.c:124:53: sparse: sparse: using member 'size' in incomplete struct net_packet_attrs
   net/core/selftests.c:125:17: sparse: sparse: using member 'tcp' in incomplete struct net_packet_attrs
   net/core/selftests.c:130:17: sparse: sparse: using member 'max_size' in incomplete struct net_packet_attrs
   net/core/selftests.c:131:29: sparse: sparse: using member 'max_size' in incomplete struct net_packet_attrs
   net/core/selftests.c:135:23: sparse: sparse: using member 'ip_src' in incomplete struct net_packet_attrs
   net/core/selftests.c:135:23: sparse: sparse: cast from unknown type
   net/core/selftests.c:136:23: sparse: sparse: using member 'ip_dst' in incomplete struct net_packet_attrs
   net/core/selftests.c:136:23: sparse: sparse: cast from unknown type
   net/core/selftests.c:144:13: sparse: sparse: using member 'id' in incomplete struct net_packet_attrs
   net/core/selftests.c:147:17: sparse: sparse: using member 'size' in incomplete struct net_packet_attrs
   net/core/selftests.c:148:34: sparse: sparse: using member 'size' in incomplete struct net_packet_attrs
   net/core/selftests.c:149:17: sparse: sparse: using member 'max_size' in incomplete struct net_packet_attrs
   net/core/selftests.c:150:34: sparse: sparse: using member 'max_size' in incomplete struct net_packet_attrs
   net/core/selftests.c:154:17: sparse: sparse: using member 'tcp' in incomplete struct net_packet_attrs
   net/core/selftests.c:176:49: sparse: sparse: using member 'src' in incomplete struct net_packet_attrs
   net/core/selftests.c:177:49: sparse: sparse: using member 'dst' in incomplete struct net_packet_attrs
   net/core/selftests.c:208:26: sparse: sparse: using member 'tcp' in incomplete struct net_packet_attrs
   net/core/selftests.c:213:35: sparse: sparse: using member 'dport' in incomplete struct net_packet_attrs
   net/core/selftests.c:213:35: sparse: sparse: cast from unknown type
   net/core/selftests.c:222:35: sparse: sparse: using member 'dport' in incomplete struct net_packet_attrs
   net/core/selftests.c:222:35: sparse: sparse: cast from unknown type
   net/core/selftests.c:230:26: sparse: sparse: using member 'id' in incomplete struct net_packet_attrs
   net/core/selftests.c:267:40: sparse: sparse: using member 'queue_mapping' in incomplete struct net_packet_attrs
   net/core/selftests.c:275:18: sparse: sparse: using member 'timeout' in incomplete struct net_packet_attrs
   net/core/selftests.c:276:21: sparse: sparse: using member 'timeout' in incomplete struct net_packet_attrs
   net/core/selftests.c:278:55: sparse: sparse: using member 'timeout' in incomplete struct net_packet_attrs
   net/core/selftests.c:317:13: sparse: sparse: using member 'dst' in incomplete struct net_packet_attrs
   net/core/selftests.c:325:13: sparse: sparse: using member 'dst' in incomplete struct net_packet_attrs
   net/core/selftests.c:326:13: sparse: sparse: using member 'max_size' in incomplete struct net_packet_attrs
   net/core/selftests.c:334:13: sparse: sparse: using member 'dst' in incomplete struct net_packet_attrs
   net/core/selftests.c:335:13: sparse: sparse: using member 'tcp' in incomplete struct net_packet_attrs
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/core/dev.c: note: in included file:
   include/net/gro.h:21:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:21:17: sparse: sparse: got }
   include/net/gro.h:30:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:30:9: sparse: sparse: got }
   include/net/gro.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:89:1: sparse: sparse: got }
   net/core/dev.c: note: in included file:
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
   include/trace/events/napi.h:14:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/napi.h:14:1: sparse: sparse: got __seg_fs
--
   net/core/dev.c:4209:35: sparse: sparse: got __seg_fs
   net/core/dev.c:4209:35: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4209:35: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:4433:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:4433:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:5338:9: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:5338:9: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c:6265:25: sparse: sparse: Expected ) at end of cast operator
   net/core/dev.c:6265:25: sparse: sparse: got __seg_fs
   net/core/dev.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/core/dev.c: note: in included file (through include/linux/irqflags.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/core/dev.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/core/dev.c: note: in included file (through include/linux/if_ether.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/core/dev.c:5030:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:5035:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:385:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:385:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:385:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:385:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:385:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:394:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:394:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:406:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:406:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:406:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:406:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:406:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:670:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:681:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:681:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:697:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:697:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:697:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:697:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:697:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:710:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:710:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:907:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:907:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1007:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1007:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1007:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1007:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1007:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1133:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1163:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1194:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1194:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1194:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1194:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1194:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1195:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1206:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1206:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1206:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1206:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1206:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1224:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1224:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1224:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1224:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1224:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1252:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1252:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1252:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1252:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1252:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1253:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1253:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1253:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1253:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1253:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1286:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1286:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1286:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1286:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1286:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1372:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1372:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1372:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1372:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1372:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1422:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1422:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1422:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1422:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1422:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1501:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1501:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1501:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1501:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1501:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1608:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1609:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1609:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1629:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1630:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1630:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1961:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1961:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1961:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1961:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1961:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1993:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1993:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1993:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/dev.c:1993:9: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/core/rtnetlink.c: note: in included file (through include/net/tcp.h):
   include/net/inet_hashtables.h:41:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/inet_hashtables.h:41:1: sparse: sparse: got }
   net/core/rtnetlink.c: note: in included file (through include/linux/filter.h, include/net/sock_reuseport.h, include/net/tcp.h):
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:897:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:897:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:897:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:897:9: sparse: sparse: got __seg_fs
--
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   net/core/rtnetlink.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/core/rtnetlink.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/core/rtnetlink.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/core/rtnetlink.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/core/rtnetlink.c:135:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:135:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:221:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:246:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:246:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:249:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:249:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:252:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:252:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:256:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:256:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:334:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:367:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:444:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:444:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:587:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:587:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:587:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:587:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:587:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1329:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1329:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1329:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1329:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1329:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1330:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1330:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1330:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1330:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1330:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1473:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1473:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1473:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1473:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1473:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1788:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1788:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1788:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1788:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:1788:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:2248:37: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:2826:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:2826:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:2826:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:2826:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:2826:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3044:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3383:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3383:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3383:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3383:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3383:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3826:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3826:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3869:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:3869:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:4045:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:4045:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5048:45: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5064:45: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5125:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5125:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5208:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5208:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5208:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5208:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5208:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5284:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5284:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5284:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5284:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5284:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5578:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5578:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5578:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5578:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5578:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5946:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:5946:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:6004:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:6004:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:6032:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:6032:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:6032:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:6032:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:6032:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:192:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/rtnetlink.c:192:9: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/core/filter.c: note: in included file (through include/linux/bpf_trace.h):
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:29:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:29:1: sparse: sparse: Expected ) at end of cast operator
--
   include/trace/events/xdp.h:408:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:408:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:408:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:408:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:408:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:408:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:408:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:408:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:408:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:408:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:408:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:408:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:408:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:408:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:408:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:408:1: sparse: sparse: got __seg_fs
   include/trace/events/xdp.h:408:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/xdp.h:408:1: sparse: sparse: got __seg_fs
   net/core/filter.c: note: in included file (through include/net/netfilter/nf_conntrack_tuple.h, include/linux/netfilter/nf_conntrack_proto_gre.h, ...):
   include/linux/netfilter/x_tables.h:372:19: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:372:19: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:372:19: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:372:19: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:372:19: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:372:19: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:372:19: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:372:19: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:379:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:397:9: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:135:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:135:17: sparse: sparse: got __seg_fs
   net/core/filter.c:2231:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:2231:17: sparse: sparse: got __seg_fs
   net/core/filter.c:2231:17: sparse: sparse: Expected ) at end of cast operator
   net/core/filter.c:2231:17: sparse: sparse: got __seg_fs
   net/core/filter.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/core/filter.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/core/filter.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/core/filter.c: note: in included file (through include/linux/filter.h, include/linux/bpf_verifier.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/core/filter.c:135:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:462:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:875:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:875:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:875:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:875:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:875:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:897:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:1374:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:1374:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:1374:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:1374:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:1374:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2140:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2166:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2202:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2217:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2231:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2266:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2302:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2324:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2373:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2398:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2478:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2483:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:2487:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3186:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3186:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3186:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3186:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3186:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3204:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3210:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3210:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3210:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3210:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3210:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3225:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3242:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3259:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3263:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3289:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3293:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3429:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3460:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3523:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3536:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3540:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3911:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3914:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3914:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3914:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3914:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3914:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3932:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3932:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3932:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3932:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3932:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3956:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3959:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:3962:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4056:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4071:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4095:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4222:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4379:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4386:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4397:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4426:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4432:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4492:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4495:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4495:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4495:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4495:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:4495:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5261:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5261:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5261:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5261:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5261:25: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5766:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5771:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5803:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5856:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5869:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5877:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5877:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5877:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5877:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5877:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5878:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/filter.c:5878:9: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/core/gro.c: note: in included file:
   include/net/gro.h:21:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:21:17: sparse: sparse: got }
   include/net/gro.h:30:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:30:9: sparse: sparse: got }
   include/net/gro.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:89:1: sparse: sparse: got }
   net/core/gro.c: note: in included file (through include/linux/filter.h, include/net/xdp.h, include/net/busy_poll.h):
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
--
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:302:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:302:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:302:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:302:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:302:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:302:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:302:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:302:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:302:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:302:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   include/trace/events/net.h:309:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/net.h:309:1: sparse: sparse: got __seg_fs
   net/core/gro.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/core/gro.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/core/gro.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/core/gro.c: note: in included file (through include/linux/ip.h, include/net/gro.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/core/gro.c:122:13: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   net/core/gro.c:125:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:126:37: sparse: sparse: using member 'proto' in incomplete struct napi_gro_cb
   net/core/gro.c:133:32: sparse: sparse: using member 'count' in incomplete struct napi_gro_cb
   net/core/gro.c:134:28: sparse: sparse: using member 'last' in incomplete struct napi_gro_cb
   net/core/gro.c:167:33: sparse: sparse: using member 'free' in incomplete struct napi_gro_cb
   net/core/gro.c:187:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:187:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:187:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:187:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:187:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:193:33: sparse: sparse: using member 'free' in incomplete struct napi_gro_cb
   net/core/gro.c:213:27: sparse: sparse: using member 'last' in incomplete struct napi_gro_cb
   net/core/gro.c:216:31: sparse: sparse: using member 'last' in incomplete struct napi_gro_cb
   net/core/gro.c:217:23: sparse: sparse: using member 'last' in incomplete struct napi_gro_cb
   net/core/gro.c:222:23: sparse: sparse: using member 'count' in incomplete struct napi_gro_cb
   net/core/gro.c:231:25: sparse: sparse: using member 'same_flow' in incomplete struct napi_gro_cb
   net/core/gro.c:245:29: sparse: sparse: using member 'count' in incomplete struct napi_gro_cb
   net/core/gro.c:263:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:263:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:269:51: sparse: sparse: using member 'count' in incomplete struct napi_gro_cb
   net/core/gro.c:279:50: sparse: sparse: using member 'age' in incomplete struct napi_gro_cb
   net/core/gro.c:335:31: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   net/core/gro.c:338:39: sparse: sparse: using member 'same_flow' in incomplete struct napi_gro_cb
   net/core/gro.c:358:31: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:366:31: sparse: sparse: using member 'same_flow' in incomplete struct napi_gro_cb
   net/core/gro.c:393:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:395:9: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   net/core/gro.c:395:9: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   net/core/gro.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:395:9: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:395:9: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   net/core/gro.c:403:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:405:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:405:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:405:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:405:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:405:17: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:427:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:427:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:464:9: sparse: sparse: using member 'zeroed' in incomplete struct napi_gro_cb
>> net/core/gro.c:465:9: sparse: sparse: unknown member
>> net/core/gro.c:465:9: sparse: sparse: unknown member
>> net/core/gro.c:465:9: sparse: sparse: incompatible types for operation (-):
>> net/core/gro.c:465:9: sparse:    bad type
>> net/core/gro.c:465:9: sparse:    int
   net/core/gro.c:467:34: sparse: sparse: using member 'zeroed' in incomplete struct napi_gro_cb
>> net/core/gro.c:467:11: sparse: sparse: cast from unknown type
>> net/core/gro.c:467:9: sparse: sparse: cannot dereference this type
   net/core/gro.c:468:25: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   net/core/gro.c:469:25: sparse: sparse: using member 'is_atomic' in incomplete struct napi_gro_cb
   net/core/gro.c:470:25: sparse: sparse: using member 'count' in incomplete struct napi_gro_cb
   net/core/gro.c:471:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:472:33: sparse: sparse: using member 'count' in incomplete struct napi_gro_cb
   net/core/gro.c:476:41: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   net/core/gro.c:482:33: sparse: sparse: using member 'csum' in incomplete struct napi_gro_cb
   net/core/gro.c:483:33: sparse: sparse: using member 'csum_valid' in incomplete struct napi_gro_cb
   net/core/gro.c:486:33: sparse: sparse: using member 'csum_cnt' in incomplete struct napi_gro_cb
   net/core/gro.c:501:37: sparse: sparse: using member 'same_flow' in incomplete struct napi_gro_cb
   net/core/gro.c:502:31: sparse: sparse: using member 'free' in incomplete struct napi_gro_cb
   net/core/gro.c:513:29: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   net/core/gro.c:516:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:523:25: sparse: sparse: using member 'age' in incomplete struct napi_gro_cb
   net/core/gro.c:524:25: sparse: sparse: using member 'last' in incomplete struct napi_gro_cb
   net/core/gro.c:583:37: sparse: sparse: using member 'free' in incomplete struct napi_gro_cb
   net/core/gro.c:618:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:635:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:674:37: sparse: sparse: using member 'free' in incomplete struct napi_gro_cb
   net/core/gro.c:703:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:705:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:714:33: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   net/core/gro.c:715:33: sparse: sparse: using member 'frag0_len' in incomplete struct napi_gro_cb
   net/core/gro.c:754:50: sparse: sparse: using member 'csum' in incomplete struct napi_gro_cb
   net/core/gro.c:756:13: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:757:21: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:762:25: sparse: sparse: using member 'csum' in incomplete struct napi_gro_cb
   net/core/gro.c:763:25: sparse: sparse: using member 'csum_valid' in incomplete struct napi_gro_cb
   net/core/gro.c: note: in included file:
   include/net/gro.h:129:32: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   include/net/gro.h:134:43: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   include/net/gro.h:129:32: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   include/net/gro.h:129:32: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   include/net/gro.h:134:43: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   net/core/gro.c: note: in included file:
   include/trace/events/net.h:236:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:236:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:236:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:236:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:236:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:236:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:236:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:236:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:236:1: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:375:25: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   net/core/gro.c:376:25: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   net/core/gro.c:377:25: sparse: sparse: using member 'frag0_len' in incomplete struct napi_gro_cb
   net/core/gro.c:382:33: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   net/core/gro.c:383:33: sparse: sparse: using member 'frag0_len' in incomplete struct napi_gro_cb
   include/trace/events/net.h:288:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:288:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:288:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:288:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:288:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:288:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:288:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:288:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:288:1: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c:375:25: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   net/core/gro.c:376:25: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   net/core/gro.c:377:25: sparse: sparse: using member 'frag0_len' in incomplete struct napi_gro_cb
   net/core/gro.c:382:33: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   net/core/gro.c:383:33: sparse: sparse: using member 'frag0_len' in incomplete struct napi_gro_cb
   net/core/gro.c: note: in included file:
   include/net/gro.h:150:32: sparse: sparse: using member 'frag0_len' in incomplete struct napi_gro_cb
   include/net/gro.h:155:25: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   include/net/gro.h:156:25: sparse: sparse: using member 'frag0_len' in incomplete struct napi_gro_cb
   net/core/gro.c: note: in included file:
   include/trace/events/net.h:229:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:229:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:229:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:229:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:229:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:229:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:229:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:229:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:229:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:281:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:281:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:281:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:281:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:281:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:281:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:281:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:281:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/net.h:281:1: sparse: sparse: too many arguments for function __builtin_expect
   net/core/gro.c: note: in included file:
   include/net/gro.h:129:32: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   include/net/gro.h:134:43: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/ip6_input.c: note: in included file:
   include/net/protocol.h:43:42: sparse: sparse: Expected ; at end of declaration
   include/net/protocol.h:43:42: sparse: sparse: got :
   include/net/protocol.h:49:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/protocol.h:49:1: sparse: sparse: got }
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:166:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:166:9: sparse: sparse: Expected ) at end of cast operator
--
   net/ipv6/ip6_input.c:457:33: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:457:33: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:457:33: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:467:25: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:467:25: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:467:25: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:467:25: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:474:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:474:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:474:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:474:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c:504:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ip6_input.c:504:9: sparse: sparse: got __seg_fs
   net/ipv6/ip6_input.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ip6_input.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ip6_input.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/ip6_input.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/ip6_input.c:166:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:170:22: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:171:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:172:29: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:192:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:202:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:268:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:280:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:294:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:452:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:457:33: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:467:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:474:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:504:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c:584:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_input.c: note: in included file (through include/net/ip6_route.h):
>> include/net/addrconf.h:342:13: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/af_inet6.c: note: in included file (through include/net/udplite.h):
   include/net/ip6_checksum.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:44:1: sparse: sparse: got }
   include/net/ip6_checksum.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:52:1: sparse: sparse: got }
   include/net/ip6_checksum.h:60:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:60:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:61:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:61:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:62:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:62:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:63:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:63:1: sparse: sparse: got }
   include/net/ip6_checksum.h:70:14: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:70:14: sparse: sparse: got ->
   include/net/ip6_checksum.h:71:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:71:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:72:1: sparse: sparse: got }
   include/net/ip6_checksum.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:80:1: sparse: sparse: got }
   net/ipv6/af_inet6.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/af_inet6.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/af_inet6.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/af_inet6.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/af_inet6.c: note: in included file (through include/net/udplite.h):
   include/net/ip6_checksum.h:68:23: sparse: sparse: symbol 'th' redeclared with different type (different base types):
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   include/net/ip6_checksum.h:60:9: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:60:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:71:9: sparse: sparse: symbol 'th' redeclared with different type (different base types):
   include/net/ip6_checksum.h:71:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:68:23: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   net/ipv6/af_inet6.c:189:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/af_inet6.c:189:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/af_inet6.c:650:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/af_inet6.c:669:13: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/udplite.c: note: in included file (through include/net/udplite.h, net/ipv6/udp_impl.h):
   include/net/ip6_checksum.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:44:1: sparse: sparse: got }
   include/net/ip6_checksum.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:52:1: sparse: sparse: got }
   include/net/ip6_checksum.h:60:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:60:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:61:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:61:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:62:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:62:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:63:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:63:1: sparse: sparse: got }
   include/net/ip6_checksum.h:70:14: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:70:14: sparse: sparse: got ->
   include/net/ip6_checksum.h:71:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:71:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:72:1: sparse: sparse: got }
   include/net/ip6_checksum.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:80:1: sparse: sparse: got }
   net/ipv6/udplite.c: note: in included file (through net/ipv6/udp_impl.h):
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/udplite.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/udplite.c: note: in included file (through net/ipv6/udp_impl.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/udplite.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/net/inet_sock.h, ...):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/udplite.c: note: in included file (through include/net/udplite.h, net/ipv6/udp_impl.h):
   include/net/ip6_checksum.h:68:23: sparse: sparse: symbol 'th' redeclared with different type (different base types):
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   include/net/ip6_checksum.h:60:9: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:60:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:71:9: sparse: sparse: symbol 'th' redeclared with different type (different base types):
   include/net/ip6_checksum.h:71:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:68:23: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   net/ipv6/udplite.c:21:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udplite.c:21:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udplite.c:21:9: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:654:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:654:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:660:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:660:17: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:660:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:660:17: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:669:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:669:9: sparse: sparse: got __seg_fs
   net/ipv6/raw.c:669:9: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/raw.c:669:9: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/raw.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/raw.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/raw.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/raw.c:569:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:578:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:646:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:654:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:654:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:654:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:654:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:654:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:660:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:669:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:712:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:712:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:712:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:712:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:712:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:962:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:968:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:1060:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/raw.c:1085:13: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/ipv6_sockglue.c: note: in included file (through include/net/udplite.h):
   include/net/ip6_checksum.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:44:1: sparse: sparse: got }
   include/net/ip6_checksum.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:52:1: sparse: sparse: got }
   include/net/ip6_checksum.h:60:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:60:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:61:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:61:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:62:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:62:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:63:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:63:1: sparse: sparse: got }
   include/net/ip6_checksum.h:70:14: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:70:14: sparse: sparse: got ->
   include/net/ip6_checksum.h:71:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:71:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:72:1: sparse: sparse: got }
   include/net/ip6_checksum.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:80:1: sparse: sparse: got }
   net/ipv6/ipv6_sockglue.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ipv6_sockglue.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ipv6_sockglue.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/ipv6_sockglue.c: note: in included file (through include/linux/pim.h, include/linux/mroute6.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/ipv6_sockglue.c: note: in included file (through include/net/udplite.h):
   include/net/ip6_checksum.h:68:23: sparse: sparse: symbol 'th' redeclared with different type (different base types):
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   include/net/ip6_checksum.h:60:9: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:60:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:71:9: sparse: sparse: symbol 'th' redeclared with different type (different base types):
   include/net/ip6_checksum.h:71:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:68:23: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   net/ipv6/ipv6_sockglue.c:347:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ipv6_sockglue.c:425:13: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   net/ipv6/ping.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/ping.c:182:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ping.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ping.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/ping.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h, include/net/addrconf.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/ping.c:182:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ping.c:182:17: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/udp.c: note: in included file:
   include/net/gro.h:21:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:21:17: sparse: sparse: got }
   include/net/gro.h:30:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:30:9: sparse: sparse: got }
   include/net/gro.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:89:1: sparse: sparse: got }
   net/ipv6/udp.c: note: in included file:
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
   include/trace/events/skb.h:24:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/skb.h:24:1: sparse: sparse: got __seg_fs
--
   net/ipv6/udp.c:1285:25: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1285:25: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1285:25: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1285:25: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1285:25: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1285:25: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1285:25: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1285:25: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1285:25: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1285:25: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1285:25: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1290:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1290:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c:1627:17: sparse: sparse: Expected ) at end of cast operator
   net/ipv6/udp.c:1627:17: sparse: sparse: got __seg_fs
   net/ipv6/udp.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/udp.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/udp.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/udp.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/net/sock.h, ...):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/udp.c:87:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:87:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:89:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:89:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:159:47: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:159:47: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:234:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:313:16: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:380:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:383:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:389:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:441:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:442:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:576:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:586:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:654:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:654:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:658:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:658:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:662:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:662:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:691:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:774:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:782:17: sparse: sparse: undefined identifier 'udp_post_segment_fix_csum'
   net/ipv6/udp.c:868:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:980:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1285:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1285:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1290:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1290:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1409:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1410:29: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1582:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1605:18: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1627:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1627:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c:1666:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:495:17: sparse: sparse: cannot dereference this type
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'else'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'else'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/udp_offload.c: note: in included file:
   include/net/ip6_checksum.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:44:1: sparse: sparse: got }
   include/net/ip6_checksum.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:52:1: sparse: sparse: got }
   include/net/ip6_checksum.h:60:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:60:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:61:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:61:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:62:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:62:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:63:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:63:1: sparse: sparse: got }
   include/net/ip6_checksum.h:70:14: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:70:14: sparse: sparse: got ->
   include/net/ip6_checksum.h:71:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:71:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:72:1: sparse: sparse: got }
   include/net/ip6_checksum.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:80:1: sparse: sparse: got }
   net/ipv6/udp_offload.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/udp_offload.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/udp_offload.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/udp_offload.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/udp_offload.c: note: in included file:
   include/net/ip6_checksum.h:68:23: sparse: sparse: symbol 'th' redeclared with different type (different base types):
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   include/net/ip6_checksum.h:60:9: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:60:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:71:9: sparse: sparse: symbol 'th' redeclared with different type (different base types):
   include/net/ip6_checksum.h:71:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:68:23: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   net/ipv6/udp_offload.c:50:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp_offload.c:62:29: sparse: sparse: undefined identifier 'udp_v6_check'
   net/ipv6/udp_offload.c:95:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp_offload.c:95:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp_offload.c:95:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp_offload.c:95:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp_offload.c:95:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp_offload.c:137:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp_offload.c:154:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/udp_offload.c:189:30: sparse: sparse: undefined identifier 'udp_v6_check'
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/proc.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/proc.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/proc.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/proc.c:45:50: sparse: sparse: undefined identifier 'rawv6_prot'
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/ip6_checksum.c: note: in included file (through include/net/udplite.h):
   include/net/ip6_checksum.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:44:1: sparse: sparse: got }
   include/net/ip6_checksum.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:52:1: sparse: sparse: got }
   include/net/ip6_checksum.h:60:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:60:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:61:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:61:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:62:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:62:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:63:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:63:1: sparse: sparse: got }
   include/net/ip6_checksum.h:70:14: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:70:14: sparse: sparse: got ->
   include/net/ip6_checksum.h:71:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:71:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:72:1: sparse: sparse: got }
   include/net/ip6_checksum.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:80:1: sparse: sparse: got }
   net/ipv6/ip6_checksum.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ip6_checksum.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ip6_checksum.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/ip6_checksum.c: note: in included file (through include/linux/ip.h, include/net/ip.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/ip6_checksum.c: note: in included file (through include/net/udplite.h):
   include/net/ip6_checksum.h:68:23: sparse: sparse: symbol 'th' redeclared with different type (different base types):
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   include/net/ip6_checksum.h:60:9: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:60:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:71:9: sparse: sparse: symbol 'th' redeclared with different type (different base types):
   include/net/ip6_checksum.h:71:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:68:23: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   net/ipv6/ip6_checksum.c:78:37: sparse: sparse: undefined identifier 'ip6_compute_pseudo'
   net/ipv6/ip6_checksum.c:91:28: sparse: sparse: undefined identifier 'ip6_compute_pseudo'
   net/ipv6/ip6_checksum.c:124:30: sparse: sparse: undefined identifier 'udp_v6_check'
   net/ipv6/ip6_checksum.c:127:29: sparse: sparse: undefined identifier 'udp_v6_check'
   net/ipv6/ip6_checksum.c:134:30: sparse: sparse: undefined identifier 'udp_v6_check'
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/sit.c: note: in included file:
   include/net/icmp.h:25:22: sparse: sparse: Expected ; at end of declaration
   include/net/icmp.h:25:22: sparse: sparse: got :
   include/net/icmp.h:26:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/icmp.h:26:1: sparse: sparse: got }
   net/ipv6/sit.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/sit.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/sit.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/sit.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/sit.c:833:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:833:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:833:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:833:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:833:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:208:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:208:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:208:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:208:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:208:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:359:54: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:428:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:428:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:428:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:428:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:428:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:657:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:664:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:712:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1149:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1149:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1149:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1149:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1149:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1279:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1279:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1279:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1279:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c:1279:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c: note: in included file (through include/net/inet_ecn.h, include/net/ip_tunnels.h):
   include/linux/if_vlan.h:604:29: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/if_vlan.h:604:29: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/if_vlan.h:614:29: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/if_vlan.h:604:29: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/if_vlan.h:604:29: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/if_vlan.h:614:29: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/if_vlan.h:604:29: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/if_vlan.h:604:29: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/if_vlan.h:614:29: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/sit.c: note: in included file:
   include/net/ip_tunnels.h:398:13: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/ip6_offload.c: note: in included file (through include/net/gro.h):
   include/net/ip6_checksum.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:44:1: sparse: sparse: got }
   include/net/ip6_checksum.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:52:1: sparse: sparse: got }
   include/net/ip6_checksum.h:60:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:60:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:61:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:61:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:62:12: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:62:12: sparse: sparse: got ->
   include/net/ip6_checksum.h:63:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:63:1: sparse: sparse: got }
   include/net/ip6_checksum.h:70:14: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:70:14: sparse: sparse: got ->
   include/net/ip6_checksum.h:71:11: sparse: sparse: Expected ; at end of declaration
   include/net/ip6_checksum.h:71:11: sparse: sparse: got ->
   include/net/ip6_checksum.h:72:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:72:1: sparse: sparse: got }
   include/net/ip6_checksum.h:80:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/ip6_checksum.h:80:1: sparse: sparse: got }
   net/ipv6/ip6_offload.c: note: in included file:
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ip6_offload.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ip6_offload.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/ip6_offload.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/ip6_offload.c: note: in included file (through include/net/gro.h):
   include/net/ip6_checksum.h:68:23: sparse: sparse: symbol 'th' redeclared with different type (different base types):
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   include/net/ip6_checksum.h:60:9: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:60:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:71:9: sparse: sparse: symbol 'th' redeclared with different type (different base types):
   include/net/ip6_checksum.h:71:9: sparse:    int [addressable] [toplevel] th
   include/net/ip6_checksum.h:68:23: sparse: note: previously declared as:
>> include/net/ip6_checksum.h:68:23: sparse:    struct tcphdr *[addressable] [toplevel] th
   net/ipv6/ip6_offload.c:51:29: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:58:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:64:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:95:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:118:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:176:29: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:205:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:260:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:282:14: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:334:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:339:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:339:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:339:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:339:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:339:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:363:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_offload.c:363:13: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   net/ipv6/tcpv6_offload.c: note: in included file:
   include/net/gro.h:21:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:21:17: sparse: sparse: got }
   include/net/gro.h:30:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:30:9: sparse: sparse: got }
   include/net/gro.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:89:1: sparse: sparse: got }
   net/ipv6/tcpv6_offload.c: note: in included file (through include/linux/filter.h, include/net/sock_reuseport.h, include/net/tcp.h):
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
   include/net/sch_generic.h:885:9: sparse: sparse: Expected ) at end of cast operator
   include/net/sch_generic.h:885:9: sparse: sparse: got __seg_fs
--
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1635:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1635:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1636:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1636:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1637:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1637:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:1638:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:1638:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2310:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2310:9: sparse: sparse: got __seg_fs
   net/ipv6/tcpv6_offload.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/tcpv6_offload.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/tcpv6_offload.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/tcpv6_offload.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/tcpv6_offload.c:20:30: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   net/ipv6/tcpv6_offload.c:23:33: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   net/ipv6/tcpv6_offload.c:54:13: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 4
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got 0
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got pao_tmp__
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
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got 8
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got __vpp_verify
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in nested declarator
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) at end of cast operator
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
>> include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got &
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got 1
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got {
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
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
   include/net/udp.h:507:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:507:9: sparse: sparse: got }
   include/net/udp.h:507:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/net/udp.h:507:9: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:507:9: sparse: sparse: got {
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
   drivers/net/ethernet/amd/xgbe/xgbe-drv.c: note: in included file (through include/net/vxlan.h):
   include/net/udp_tunnel.h:34:50: sparse: sparse: Expected ; at end of declaration
   include/net/udp_tunnel.h:34:50: sparse: sparse: got :
   include/net/udp_tunnel.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp_tunnel.h:38:1: sparse: sparse: got }
   drivers/net/ethernet/amd/xgbe/xgbe-drv.c: note: in included file (through include/net/udp_tunnel.h, include/net/vxlan.h):
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier '__flags'
   include/net/udp.h:495:17: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
>> include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
>> include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
>> include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   drivers/net/ethernet/amd/xgbe/xgbe-drv.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
>> arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   drivers/net/ethernet/amd/xgbe/xgbe-drv.c: note: in included file (through include/net/udp_tunnel.h, include/net/vxlan.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   drivers/net/ethernet/amd/xgbe/xgbe-drv.c: note: in included file (through include/linux/tcp.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> drivers/net/ethernet/amd/xgbe/xgbe-drv.c:1633:9: sparse: sparse: too many arguments for function __builtin_expect
>> drivers/net/ethernet/amd/xgbe/xgbe-drv.c:1633:9: sparse: sparse: too many arguments for function __builtin_expect
>> drivers/net/ethernet/amd/xgbe/xgbe-drv.c:1633:9: sparse: sparse: too many arguments for function __builtin_expect
>> drivers/net/ethernet/amd/xgbe/xgbe-drv.c:1633:9: sparse: sparse: too many arguments for function __builtin_expect
>> drivers/net/ethernet/amd/xgbe/xgbe-drv.c:1633:9: sparse: sparse: too many arguments for function __builtin_expect

vim +/typeof +495 include/net/udp.h

dddb64bcb34615 Subash Abhinov Kasiviswanathan 2017-03-23  463  
cf329aa42b6659 Paolo Abeni                    2018-11-07  464  static inline struct sk_buff *udp_rcv_segment(struct sock *sk,
cf329aa42b6659 Paolo Abeni                    2018-11-07  465  					      struct sk_buff *skb, bool ipv4)
cf329aa42b6659 Paolo Abeni                    2018-11-07  466  {
f2696099c6c619 Sean Tranchetti                2019-05-28  467  	netdev_features_t features = NETIF_F_SG;
cf329aa42b6659 Paolo Abeni                    2018-11-07  468  	struct sk_buff *segs;
cf329aa42b6659 Paolo Abeni                    2018-11-07  469  
f2696099c6c619 Sean Tranchetti                2019-05-28  470  	/* Avoid csum recalculation by skb_segment unless userspace explicitly
f2696099c6c619 Sean Tranchetti                2019-05-28  471  	 * asks for the final checksum values
f2696099c6c619 Sean Tranchetti                2019-05-28  472  	 */
f2696099c6c619 Sean Tranchetti                2019-05-28  473  	if (!inet_get_convert_csum(sk))
f2696099c6c619 Sean Tranchetti                2019-05-28  474  		features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
f2696099c6c619 Sean Tranchetti                2019-05-28  475  
d0208bf4da97f7 Willem de Bruijn               2020-01-29  476  	/* UDP segmentation expects packets of type CHECKSUM_PARTIAL or
d0208bf4da97f7 Willem de Bruijn               2020-01-29  477  	 * CHECKSUM_NONE in __udp_gso_segment. UDP GRO indeed builds partial
d0208bf4da97f7 Willem de Bruijn               2020-01-29  478  	 * packets in udp_gro_complete_segment. As does UDP GSO, verified by
d0208bf4da97f7 Willem de Bruijn               2020-01-29  479  	 * udp_send_skb. But when those packets are looped in dev_loopback_xmit
9122a70a633370 Cyril Strejc                   2021-10-24  480  	 * their ip_summed CHECKSUM_NONE is changed to CHECKSUM_UNNECESSARY.
9122a70a633370 Cyril Strejc                   2021-10-24  481  	 * Reset in this specific case, where PARTIAL is both correct and
9122a70a633370 Cyril Strejc                   2021-10-24  482  	 * required.
d0208bf4da97f7 Willem de Bruijn               2020-01-29  483  	 */
6cd021a58c18a1 Willem de Bruijn               2020-01-27  484  	if (skb->pkt_type == PACKET_LOOPBACK)
6cd021a58c18a1 Willem de Bruijn               2020-01-27  485  		skb->ip_summed = CHECKSUM_PARTIAL;
6cd021a58c18a1 Willem de Bruijn               2020-01-27  486  
cf329aa42b6659 Paolo Abeni                    2018-11-07  487  	/* the GSO CB lays after the UDP one, no need to save and restore any
cf329aa42b6659 Paolo Abeni                    2018-11-07  488  	 * CB fragment
cf329aa42b6659 Paolo Abeni                    2018-11-07  489  	 */
f2696099c6c619 Sean Tranchetti                2019-05-28  490  	segs = __skb_gso_segment(skb, features, false);
974ceb21fcf9c0 Denis Efremov                  2019-08-29  491  	if (IS_ERR_OR_NULL(segs)) {
cf329aa42b6659 Paolo Abeni                    2018-11-07  492  		int segs_nr = skb_shinfo(skb)->gso_segs;
cf329aa42b6659 Paolo Abeni                    2018-11-07  493  
cf329aa42b6659 Paolo Abeni                    2018-11-07  494  		atomic_add(segs_nr, &sk->sk_drops);
cf329aa42b6659 Paolo Abeni                    2018-11-07 @495  		SNMP_ADD_STATS(__UDPX_MIB(sk, ipv4), UDP_MIB_INERRORS, segs_nr);
cf329aa42b6659 Paolo Abeni                    2018-11-07  496  		kfree_skb(skb);
cf329aa42b6659 Paolo Abeni                    2018-11-07  497  		return NULL;
cf329aa42b6659 Paolo Abeni                    2018-11-07  498  	}
cf329aa42b6659 Paolo Abeni                    2018-11-07  499  
cf329aa42b6659 Paolo Abeni                    2018-11-07  500  	consume_skb(skb);
cf329aa42b6659 Paolo Abeni                    2018-11-07  501  	return segs;
cf329aa42b6659 Paolo Abeni                    2018-11-07  502  }
cf329aa42b6659 Paolo Abeni                    2018-11-07  503  

:::::: The code at line 495 was first introduced by commit
:::::: cf329aa42b6659204fee865bbce0ea20462552eb udp: cope with UDP GRO packet misdirection

:::::: TO: Paolo Abeni <pabeni@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
