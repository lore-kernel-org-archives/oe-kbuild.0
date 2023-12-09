Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08E7F
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJhpqWOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702090790; x=1733626790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8vgTFfJdYwNN0qeaqqthnXsNqY2zU6z6zeLwRmr608=;
  b=EJhpqWOm1z9H75fXmufi/rCpo7rVGvNY1e4vwkeBHmc8hysEEqf+uiQj
   oAH4PugMdIbWiabbnHArrSjrLNigCEIt4YAUy4h7GD095y9Gebcjy6aiU
   7VUKN0ULwNEHio7EbDXGgh75DWQtM02alP74ylYhRlGdwVSS1ldtzP5t3
   sq2G1JTPdXSGV0Kb4+IeUB6kddWTbeghJ1eIvZaI5CQdEZTcgSso0QJhk
   AV28lXg1TbAKKISff5Ff0YyzKb9t/HSe1jOHrOwrLbcMZMzk6fvGOx8fk
   AgUHpgZ/pZeMGTd2rDcmZHgZLDkga8z/E/U7PFtwN5Q0vZXJO2nbNmQm4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1365173"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1365173"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 18:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="801306465"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="801306465"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 08 Dec 2023 18:59:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBnZA-000EjV-0G;
	Sat, 09 Dec 2023 02:59:44 +0000
Date: Sat, 9 Dec 2023 10:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:master 14/16] net/ipv6/xfrm6_input.c:285:21: sparse: sparse:
 too many arguments for function __builtin_expect
Message-ID: <202312091025.GO7TRv7u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: net/ipv6/xfrm6_input.c:285:21: sparse: sparse: too many arguments for function __builtin_expect"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   e88255c7a26a5807fcb13909ad012298b6073a55
commit: 6ccf283af0e43dcf3af14bab9f8587edbf089836 [14/16] Merge branch into tip/master: 'x86/percpu'
:::::: branch date: 29 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-061-20231205 (https://download.01.org/0day-ci/archive/20231209/202312091025.GO7TRv7u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091025.GO7TRv7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312091025.GO7TRv7u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   net/ipv6/xfrm6_input.c: note: in included file:
   include/net/gro.h:21:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:21:17: sparse: sparse: got }
   include/net/gro.h:30:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:30:9: sparse: sparse: got }
   include/net/gro.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:89:1: sparse: sparse: got }
   net/ipv6/xfrm6_input.c: note: in included file (through include/net/gro.h):
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
   net/ipv6/xfrm6_input.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/xfrm6_input.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/xfrm6_input.c: note: in included file (through include/linux/netfilter.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/xfrm6_input.c:211:25: sparse: sparse: using member 'proto' in incomplete struct napi_gro_cb
   net/ipv6/xfrm6_input.c:221:25: sparse: sparse: using member 'same_flow' in incomplete struct napi_gro_cb
   net/ipv6/xfrm6_input.c:222:25: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
>> net/ipv6/xfrm6_input.c:285:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/xfrm6_input.c: note: in included file:
   include/net/gro.h:129:32: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   include/net/gro.h:104:13: sparse: sparse: too many arguments for function __builtin_expect
   include/net/gro.h:105:33: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   include/net/gro.h:96:34: sparse: sparse: using member 'recursion_counter' in incomplete struct napi_gro_cb
--
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
   include/net/udp.h:495:17: sparse: sparse: Expected ; at end of declaration
   include/net/udp.h:495:17: sparse: sparse: got +=
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
   net/netfilter/xt_tcpudp.c: note: in included file (through include/linux/netfilter/x_tables.h):
   include/linux/netfilter.h:23:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/netfilter.h:23:1: sparse: sparse: got }
   include/linux/netfilter.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/netfilter.h:28:9: sparse: sparse: got !
>> include/linux/netfilter.h:28:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/netfilter.h:28:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/netfilter.h:28:9: sparse: sparse: got }
   include/linux/netfilter.h:32:17: sparse: sparse: Expected ) in function declarator
   include/linux/netfilter.h:32:17: sparse: sparse: got (
>> include/linux/netfilter.h:32:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/netfilter.h:33:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/netfilter.h:33:1: sparse: sparse: got }
   include/linux/netfilter.h:49:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/netfilter.h:49:1: sparse: sparse: got }
   include/linux/netfilter.h:64:15: sparse: sparse: Expected ; at end of declaration
   include/linux/netfilter.h:64:15: sparse: sparse: got ->
   include/linux/netfilter.h:65:15: sparse: sparse: Expected ; at end of declaration
   include/linux/netfilter.h:65:15: sparse: sparse: got ->
   include/linux/netfilter.h:66:15: sparse: sparse: Expected ; at end of declaration
   include/linux/netfilter.h:66:15: sparse: sparse: got ->
   include/linux/netfilter.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/netfilter.h:68:1: sparse: sparse: got }
   net/netfilter/xt_tcpudp.c: note: in included file:
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
   include/linux/netfilter/x_tables.h:436:24: sparse: sparse: Expected ) at end of cast operator
   include/linux/netfilter/x_tables.h:436:24: sparse: sparse: got __seg_fs
   net/netfilter/xt_tcpudp.c: note: in included file:
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
   net/netfilter/xt_tcpudp.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/netfilter/xt_tcpudp.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/netfilter/xt_tcpudp.c: note: in included file (through include/linux/ip.h, include/net/ip.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )

vim +285 net/ipv6/xfrm6_input.c

7159039a128fa0 YOSHIFUJI Hideaki 2007-02-22  233  
63c43787d35e45 Nicolas Dichtel   2016-09-19  234  int xfrm6_rcv(struct sk_buff *skb)
63c43787d35e45 Nicolas Dichtel   2016-09-19  235  {
63c43787d35e45 Nicolas Dichtel   2016-09-19  236  	return xfrm6_rcv_tnl(skb, NULL);
63c43787d35e45 Nicolas Dichtel   2016-09-19  237  }
63c43787d35e45 Nicolas Dichtel   2016-09-19  238  EXPORT_SYMBOL(xfrm6_rcv);
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  239  int xfrm6_input_addr(struct sk_buff *skb, xfrm_address_t *daddr,
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  240  		     xfrm_address_t *saddr, u8 proto)
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  241  {
59c9940ed0ef02 Alexey Dobriyan   2008-11-25  242  	struct net *net = dev_net(skb->dev);
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  243  	struct xfrm_state *x = NULL;
0ca64da128b816 Florian Westphal  2018-12-18  244  	struct sec_path *sp;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  245  	int i = 0;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  246  
0ca64da128b816 Florian Westphal  2018-12-18  247  	sp = secpath_set(skb);
0ca64da128b816 Florian Westphal  2018-12-18  248  	if (!sp) {
59c9940ed0ef02 Alexey Dobriyan   2008-11-25  249  		XFRM_INC_STATS(net, LINUX_MIB_XFRMINERROR);
9473e1f631de33 Masahide NAKAMURA 2007-12-20  250  		goto drop;
9473e1f631de33 Masahide NAKAMURA 2007-12-20  251  	}
9473e1f631de33 Masahide NAKAMURA 2007-12-20  252  
0ca64da128b816 Florian Westphal  2018-12-18  253  	if (1 + sp->len == XFRM_MAX_DEPTH) {
59c9940ed0ef02 Alexey Dobriyan   2008-11-25  254  		XFRM_INC_STATS(net, LINUX_MIB_XFRMINBUFFERERROR);
9473e1f631de33 Masahide NAKAMURA 2007-12-20  255  		goto drop;
9473e1f631de33 Masahide NAKAMURA 2007-12-20  256  	}
9473e1f631de33 Masahide NAKAMURA 2007-12-20  257  
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  258  	for (i = 0; i < 3; i++) {
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  259  		xfrm_address_t *dst, *src;
a002c6fd714b17 YOSHIFUJI Hideaki 2008-02-19  260  
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  261  		switch (i) {
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  262  		case 0:
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  263  			dst = daddr;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  264  			src = saddr;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  265  			break;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  266  		case 1:
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  267  			/* lookup state with wild-card source address */
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  268  			dst = daddr;
a002c6fd714b17 YOSHIFUJI Hideaki 2008-02-19  269  			src = (xfrm_address_t *)&in6addr_any;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  270  			break;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  271  		default:
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  272  			/* lookup state with wild-card addresses */
a002c6fd714b17 YOSHIFUJI Hideaki 2008-02-19  273  			dst = (xfrm_address_t *)&in6addr_any;
a002c6fd714b17 YOSHIFUJI Hideaki 2008-02-19  274  			src = (xfrm_address_t *)&in6addr_any;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  275  			break;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  276  		}
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  277  
bd55775c8dd656 Jamal Hadi Salim  2010-02-22  278  		x = xfrm_state_lookup_byaddr(net, skb->mark, dst, src, proto, AF_INET6);
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  279  		if (!x)
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  280  			continue;
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  281  
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  282  		spin_lock(&x->lock);
fbd9a5b47ee9c3 Masahide NAKAMURA 2006-08-23  283  
a002c6fd714b17 YOSHIFUJI Hideaki 2008-02-19  284  		if ((!i || (x->props.flags & XFRM_STATE_WILDRECV)) &&
a002c6fd714b17 YOSHIFUJI Hideaki 2008-02-19 @285  		    likely(x->km.state == XFRM_STATE_VALID) &&

:::::: The code at line 285 was first introduced by commit
:::::: a002c6fd714b1710aaf64e26db3f3f18bf8e8384 [XFRM] IPV6: Optimize xfrm6_input_addr().

:::::: TO: YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>
:::::: CC: YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
