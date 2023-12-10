Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A3828E3
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 19:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBUb7eAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702234865; x=1733770865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMDEKZC7tpXT0w7HZ/CEcU8O+kA/AvbtCdogBWcptxo=;
  b=nBUb7eAGBap3tj74Iz7OV/BMCGqzLntZBnyFzs8FNzFr90fjaM/hlM+M
   dsXDW+sKoDACYEEdxE5jSa927T0hUtO56PnR1V2M1olELwGMRANzE4e0Z
   1BQc7KQXBECK//y26j7WltZ2onVlonnva6auSZNk+xvOHyfnC+1XPba81
   u3Gxy5yrtWzMt+h31QrRyZyeGAXpXDhG5InK1WUpBcYEE4yojdNbIcWZk
   8HVej6lZaxY394K2QGWJ/b4UqutVvWEEzLgPRw6cVuaUSl/mWJcVRwFZR
   1eMQ5dACtISFQKsOFx6ssYRkXF4Y9cd9fSQH84EloYJfjUDBceEUH7CTQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="480758887"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="480758887"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 11:01:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="863505289"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="863505289"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Dec 2023 11:01:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCP2y-000HC1-1v;
	Sun, 10 Dec 2023 19:01:00 +0000
Date: Mon, 11 Dec 2023 03:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/31] security/tomoyo/audit.c:41:17: sparse:
 sparse: too many arguments for function __builtin_expect
Message-ID: <202312110236.kM3kCHxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: security/tomoyo/audit.c:41:17: sparse: sparse: too many arguments for function __builtin_expect"
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
:::::: branch date: 8 days ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-063-20231210 (https://download.01.org/0day-ci/archive/20231211/202312110236.kM3kCHxV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110236.kM3kCHxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312110236.kM3kCHxV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
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
   include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
   include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/audit.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/audit.c: note: in included file (through security/tomoyo/common.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   security/tomoyo/audit.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h, security/tomoyo/common.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> security/tomoyo/audit.c:41:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/audit.c:41:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/audit.c:41:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/audit.c:41:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/audit.c:41:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:80:49: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:80:49: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:80:49: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:80:49: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:80:49: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:83:41: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:83:41: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:83:41: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:83:41: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:83:41: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:92:49: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:92:49: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:92:49: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:92:49: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/audit.c:92:49: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
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
   include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
   include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/condition.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/condition.c: note: in included file (through security/tomoyo/common.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   security/tomoyo/condition.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h, security/tomoyo/common.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> security/tomoyo/condition.c:659:17: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
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
   include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
   include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/domain.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/domain.c: note: in included file (through security/tomoyo/common.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   security/tomoyo/domain.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h, security/tomoyo/common.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> security/tomoyo/domain.c:484:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/domain.c:484:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/domain.c:484:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/domain.c:484:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/domain.c:484:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:567:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:567:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:567:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:567:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:567:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:935:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:935:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:935:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:935:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/domain.c:935:17: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
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
   include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
   include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/memory.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/memory.c: note: in included file (through security/tomoyo/common.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   security/tomoyo/memory.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h, security/tomoyo/common.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> security/tomoyo/memory.c:79:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/memory.c:79:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/memory.c:79:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/memory.c:79:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/memory.c:79:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/memory.c:176:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/memory.c:176:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/memory.c:176:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/memory.c:176:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/memory.c:176:17: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
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
   include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
   include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/network.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/network.c: note: in included file (through security/tomoyo/common.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   security/tomoyo/network.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h, security/tomoyo/common.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> security/tomoyo/network.c:71:25: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/network.c:71:25: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/network.c:71:25: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/network.c:71:25: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/network.c:71:25: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
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
   include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
   include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/realpath.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/realpath.c: note: in included file (through security/tomoyo/common.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   security/tomoyo/realpath.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h, security/tomoyo/common.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> security/tomoyo/realpath.c:172:25: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/realpath.c:172:25: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/realpath.c:172:25: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/realpath.c:172:25: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/realpath.c:172:25: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:202:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:202:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:202:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:202:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:202:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:214:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:214:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:214:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:214:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/realpath.c:214:17: sparse: sparse: too many arguments for function __builtin_expect
--
   include/net/udp.h:495:17: sparse: sparse: got __seg_fs
   include/net/udp.h:495:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp.h:495:17: sparse: sparse: got }
   include/net/udp.h:495:17: sparse: sparse: Expected ) in function declarator
   include/net/udp.h:495:17: sparse: sparse: got *
   include/net/udp.h:495:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
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
   include/net/udp.h:495:17: sparse:    int [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: note: previously declared as:
   include/net/udp.h:495:17: sparse:    bad type [addressable] [toplevel] __dummy2
   include/net/udp.h:495:17: sparse: sparse: symbol 'arch_local_irq_restore' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:495:17: sparse:    int static [signed] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/common.c: note: in included file (through include/linux/irqflags.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   security/tomoyo/common.c: note: in included file (through security/tomoyo/common.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   security/tomoyo/common.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h, security/tomoyo/common.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> security/tomoyo/common.c:257:17: sparse: sparse: too many arguments for function __builtin_expect
>> security/tomoyo/common.c:257:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:283:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:283:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:907:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:907:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:907:9: sparse:    struct list_head *
   security/tomoyo/common.c:907:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:907:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:907:9: sparse:    struct list_head *
   security/tomoyo/common.c:1592:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1592:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1592:9: sparse:    struct list_head *
   security/tomoyo/common.c:1592:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1592:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1592:9: sparse:    struct list_head *
   security/tomoyo/common.c:1614:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1614:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1614:9: sparse:    struct list_head *
   security/tomoyo/common.c:1614:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1614:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1614:9: sparse:    struct list_head *
   security/tomoyo/common.c:1795:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1795:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1795:9: sparse:    struct list_head *
   security/tomoyo/common.c:1799:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1799:17: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1799:17: sparse:    struct list_head *
   security/tomoyo/common.c:1799:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1799:17: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1799:17: sparse:    struct list_head *
   security/tomoyo/common.c:1795:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1795:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1795:9: sparse:    struct list_head *
   security/tomoyo/common.c:1854:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1854:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1854:9: sparse:    struct list_head *
   security/tomoyo/common.c:1854:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   security/tomoyo/common.c:1854:9: sparse:    struct list_head [noderef] __rcu *
   security/tomoyo/common.c:1854:9: sparse:    struct list_head *
   security/tomoyo/common.c:2615:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2615:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2615:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2615:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2615:17: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2625:33: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2625:33: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2625:33: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2625:33: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2625:33: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2673:25: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2673:25: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2673:25: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2673:25: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2673:25: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2679:21: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2776:25: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2776:25: sparse: sparse: too many arguments for function __builtin_expect
   security/tomoyo/common.c:2776:25: sparse: sparse: too many arguments for function __builtin_expect

vim +41 security/tomoyo/audit.c

eadd99cc85347b Tetsuo Handa 2011-06-26   10  
5b636857fee642 Tetsuo Handa 2011-07-08   11  /**
5b636857fee642 Tetsuo Handa 2011-07-08   12   * tomoyo_print_bprm - Print "struct linux_binprm" for auditing.
5b636857fee642 Tetsuo Handa 2011-07-08   13   *
5b636857fee642 Tetsuo Handa 2011-07-08   14   * @bprm: Pointer to "struct linux_binprm".
5b636857fee642 Tetsuo Handa 2011-07-08   15   * @dump: Pointer to "struct tomoyo_page_dump".
5b636857fee642 Tetsuo Handa 2011-07-08   16   *
5b636857fee642 Tetsuo Handa 2011-07-08   17   * Returns the contents of @bprm on success, NULL otherwise.
5b636857fee642 Tetsuo Handa 2011-07-08   18   *
5b636857fee642 Tetsuo Handa 2011-07-08   19   * This function uses kzalloc(), so caller must kfree() if this function
5b636857fee642 Tetsuo Handa 2011-07-08   20   * didn't return NULL.
5b636857fee642 Tetsuo Handa 2011-07-08   21   */
5b636857fee642 Tetsuo Handa 2011-07-08   22  static char *tomoyo_print_bprm(struct linux_binprm *bprm,
5b636857fee642 Tetsuo Handa 2011-07-08   23  			       struct tomoyo_page_dump *dump)
5b636857fee642 Tetsuo Handa 2011-07-08   24  {
5b636857fee642 Tetsuo Handa 2011-07-08   25  	static const int tomoyo_buffer_len = 4096 * 2;
5b636857fee642 Tetsuo Handa 2011-07-08   26  	char *buffer = kzalloc(tomoyo_buffer_len, GFP_NOFS);
5b636857fee642 Tetsuo Handa 2011-07-08   27  	char *cp;
5b636857fee642 Tetsuo Handa 2011-07-08   28  	char *last_start;
5b636857fee642 Tetsuo Handa 2011-07-08   29  	int len;
5b636857fee642 Tetsuo Handa 2011-07-08   30  	unsigned long pos = bprm->p;
5b636857fee642 Tetsuo Handa 2011-07-08   31  	int offset = pos % PAGE_SIZE;
5b636857fee642 Tetsuo Handa 2011-07-08   32  	int argv_count = bprm->argc;
5b636857fee642 Tetsuo Handa 2011-07-08   33  	int envp_count = bprm->envc;
5b636857fee642 Tetsuo Handa 2011-07-08   34  	bool truncated = false;
cdcf6723add57a Tetsuo Handa 2019-01-24   35  
5b636857fee642 Tetsuo Handa 2011-07-08   36  	if (!buffer)
5b636857fee642 Tetsuo Handa 2011-07-08   37  		return NULL;
5b636857fee642 Tetsuo Handa 2011-07-08   38  	len = snprintf(buffer, tomoyo_buffer_len - 1, "argv[]={ ");
5b636857fee642 Tetsuo Handa 2011-07-08   39  	cp = buffer + len;
5b636857fee642 Tetsuo Handa 2011-07-08   40  	if (!argv_count) {
5b636857fee642 Tetsuo Handa 2011-07-08  @41  		memmove(cp, "} envp[]={ ", 11);
5b636857fee642 Tetsuo Handa 2011-07-08   42  		cp += 11;
5b636857fee642 Tetsuo Handa 2011-07-08   43  	}
5b636857fee642 Tetsuo Handa 2011-07-08   44  	last_start = cp;
5b636857fee642 Tetsuo Handa 2011-07-08   45  	while (argv_count || envp_count) {
5b636857fee642 Tetsuo Handa 2011-07-08   46  		if (!tomoyo_dump_page(bprm, pos, dump))
5b636857fee642 Tetsuo Handa 2011-07-08   47  			goto out;
5b636857fee642 Tetsuo Handa 2011-07-08   48  		pos += PAGE_SIZE - offset;
5b636857fee642 Tetsuo Handa 2011-07-08   49  		/* Read. */
5b636857fee642 Tetsuo Handa 2011-07-08   50  		while (offset < PAGE_SIZE) {
5b636857fee642 Tetsuo Handa 2011-07-08   51  			const char *kaddr = dump->data;
5b636857fee642 Tetsuo Handa 2011-07-08   52  			const unsigned char c = kaddr[offset++];
cdcf6723add57a Tetsuo Handa 2019-01-24   53  
5b636857fee642 Tetsuo Handa 2011-07-08   54  			if (cp == last_start)
5b636857fee642 Tetsuo Handa 2011-07-08   55  				*cp++ = '"';
5b636857fee642 Tetsuo Handa 2011-07-08   56  			if (cp >= buffer + tomoyo_buffer_len - 32) {
5b636857fee642 Tetsuo Handa 2011-07-08   57  				/* Reserve some room for "..." string. */
5b636857fee642 Tetsuo Handa 2011-07-08   58  				truncated = true;
5b636857fee642 Tetsuo Handa 2011-07-08   59  			} else if (c == '\\') {
5b636857fee642 Tetsuo Handa 2011-07-08   60  				*cp++ = '\\';
5b636857fee642 Tetsuo Handa 2011-07-08   61  				*cp++ = '\\';
5b636857fee642 Tetsuo Handa 2011-07-08   62  			} else if (c > ' ' && c < 127) {
5b636857fee642 Tetsuo Handa 2011-07-08   63  				*cp++ = c;
5b636857fee642 Tetsuo Handa 2011-07-08   64  			} else if (!c) {
5b636857fee642 Tetsuo Handa 2011-07-08   65  				*cp++ = '"';
5b636857fee642 Tetsuo Handa 2011-07-08   66  				*cp++ = ' ';
5b636857fee642 Tetsuo Handa 2011-07-08   67  				last_start = cp;
5b636857fee642 Tetsuo Handa 2011-07-08   68  			} else {
5b636857fee642 Tetsuo Handa 2011-07-08   69  				*cp++ = '\\';
5b636857fee642 Tetsuo Handa 2011-07-08   70  				*cp++ = (c >> 6) + '0';
5b636857fee642 Tetsuo Handa 2011-07-08   71  				*cp++ = ((c >> 3) & 7) + '0';
5b636857fee642 Tetsuo Handa 2011-07-08   72  				*cp++ = (c & 7) + '0';
5b636857fee642 Tetsuo Handa 2011-07-08   73  			}
5b636857fee642 Tetsuo Handa 2011-07-08   74  			if (c)
5b636857fee642 Tetsuo Handa 2011-07-08   75  				continue;
5b636857fee642 Tetsuo Handa 2011-07-08   76  			if (argv_count) {
5b636857fee642 Tetsuo Handa 2011-07-08   77  				if (--argv_count == 0) {
5b636857fee642 Tetsuo Handa 2011-07-08   78  					if (truncated) {
5b636857fee642 Tetsuo Handa 2011-07-08   79  						cp = last_start;
5b636857fee642 Tetsuo Handa 2011-07-08   80  						memmove(cp, "... ", 4);
5b636857fee642 Tetsuo Handa 2011-07-08   81  						cp += 4;
5b636857fee642 Tetsuo Handa 2011-07-08   82  					}
5b636857fee642 Tetsuo Handa 2011-07-08   83  					memmove(cp, "} envp[]={ ", 11);
5b636857fee642 Tetsuo Handa 2011-07-08   84  					cp += 11;
5b636857fee642 Tetsuo Handa 2011-07-08   85  					last_start = cp;
5b636857fee642 Tetsuo Handa 2011-07-08   86  					truncated = false;
5b636857fee642 Tetsuo Handa 2011-07-08   87  				}
5b636857fee642 Tetsuo Handa 2011-07-08   88  			} else if (envp_count) {
5b636857fee642 Tetsuo Handa 2011-07-08   89  				if (--envp_count == 0) {
5b636857fee642 Tetsuo Handa 2011-07-08   90  					if (truncated) {
5b636857fee642 Tetsuo Handa 2011-07-08   91  						cp = last_start;
5b636857fee642 Tetsuo Handa 2011-07-08   92  						memmove(cp, "... ", 4);
5b636857fee642 Tetsuo Handa 2011-07-08   93  						cp += 4;
5b636857fee642 Tetsuo Handa 2011-07-08   94  					}
5b636857fee642 Tetsuo Handa 2011-07-08   95  				}
5b636857fee642 Tetsuo Handa 2011-07-08   96  			}
5b636857fee642 Tetsuo Handa 2011-07-08   97  			if (!argv_count && !envp_count)
5b636857fee642 Tetsuo Handa 2011-07-08   98  				break;
5b636857fee642 Tetsuo Handa 2011-07-08   99  		}
5b636857fee642 Tetsuo Handa 2011-07-08  100  		offset = 0;
5b636857fee642 Tetsuo Handa 2011-07-08  101  	}
5b636857fee642 Tetsuo Handa 2011-07-08  102  	*cp++ = '}';
5b636857fee642 Tetsuo Handa 2011-07-08  103  	*cp = '\0';
5b636857fee642 Tetsuo Handa 2011-07-08  104  	return buffer;
5b636857fee642 Tetsuo Handa 2011-07-08  105  out:
5b636857fee642 Tetsuo Handa 2011-07-08  106  	snprintf(buffer, tomoyo_buffer_len - 1,
5b636857fee642 Tetsuo Handa 2011-07-08  107  		 "argv[]={ ... } envp[]= { ... }");
5b636857fee642 Tetsuo Handa 2011-07-08  108  	return buffer;
5b636857fee642 Tetsuo Handa 2011-07-08  109  }
5b636857fee642 Tetsuo Handa 2011-07-08  110  

:::::: The code at line 41 was first introduced by commit
:::::: 5b636857fee642694e287e3a181b523b16098c93 TOMOYO: Allow using argv[]/envp[] of execve() as conditions.

:::::: TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
