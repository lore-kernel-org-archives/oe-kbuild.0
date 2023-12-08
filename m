Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA25E111BA
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Dec 2023 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mmu1YiBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702026493; x=1733562493;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vlIMCLr2wMa2ksGbQvlqSmxF5Dhdk0mNlkik9Zd/gL8=;
  b=Mmu1YiBnveEItq0uTefeBylo1CZXj7scz39YCy9oeGQFobcLl/DNN/NF
   UsOfYm+JuIZbKwdyN0IEdwyNUcTBdgIe+xt5odCCRfEDwkS0YUG9kvKjA
   sTNMk6Ewaf0s6RyRl4VZiUEyFJUbHc/4OlZWHcea0U79/NCdsLiJmhrBB
   1bJn5LzVF/tHaP+Q3Q9JYZDNmH2dum7CCsRCsTIu8VAY9X3ALxXBHV4Nc
   yK2NjPMDMhL27cQnxUJUDTjgqK82xnvozmS9sKFdNxlQ8kka5Cqgn+apc
   iHv1Jb6kyFcY8Lx4kxV4GwBNL+wa8kyIs8z2HqULnTpErzsWP20SQ5yxh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="425514554"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="425514554"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 01:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748277019"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="748277019"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Dec 2023 01:08:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBWq8-000DY1-11;
	Fri, 08 Dec 2023 09:08:08 +0000
Date: Fri, 8 Dec 2023 17:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/31] net/8021q/vlan_core.c:23:13: sparse: sparse:
 too many arguments for function __builtin_expect
Message-ID: <202312081716.O9RNbQJF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: net/8021q/vlan_core.c:23:13: sparse: sparse: too many arguments for function __builtin_expect"
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
:::::: branch date: 6 days ago
:::::: commit date: 9 weeks ago
config: i386-randconfig-061-20231205 (https://download.01.org/0day-ci/archive/20231208/202312081716.O9RNbQJF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312081716.O9RNbQJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312081716.O9RNbQJF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   net/8021q/vlan_core.c: note: in included file:
   include/net/gro.h:21:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:21:17: sparse: sparse: got }
   include/net/gro.h:30:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:30:9: sparse: sparse: got }
   include/net/gro.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:89:1: sparse: sparse: got }
   net/8021q/vlan_core.c:63:20: sparse: sparse: Expected ) at end of cast operator
   net/8021q/vlan_core.c:63:20: sparse: sparse: got __seg_fs
   net/8021q/vlan_core.c: note: in included file (through include/net/gro.h):
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
   net/8021q/vlan_core.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/8021q/vlan_core.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/8021q/vlan_core.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/8021q/vlan_core.c:23:13: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:26:13: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:33:13: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:236:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:236:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:236:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:236:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:236:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:325:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:325:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:325:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:325:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:325:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:376:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:403:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:403:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:403:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:403:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:403:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:433:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:433:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:433:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:433:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:433:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:448:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:448:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:448:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:448:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:448:9: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:471:13: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:485:36: sparse: sparse: using member 'same_flow' in incomplete struct napi_gro_cb
   net/8021q/vlan_core.c:490:39: sparse: sparse: using member 'same_flow' in incomplete struct napi_gro_cb
   net/8021q/vlan_core.c:496:14: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c:496:14: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   net/8021q/vlan_core.c: note: in included file:
>> net/8021q/vlan.h:47:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/8021q/vlan.h:47:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/8021q/vlan.h:47:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/8021q/vlan.h:47:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/8021q/vlan.h:47:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/8021q/vlan.h:47:17: sparse: sparse: too many arguments for function __builtin_expect
   net/8021q/vlan_core.c: note: in included file:
   include/net/gro.h:129:32: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   include/net/gro.h:145:32: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   include/net/gro.h:150:32: sparse: sparse: using member 'frag0_len' in incomplete struct napi_gro_cb
   include/net/gro.h:155:25: sparse: sparse: using member 'frag0' in incomplete struct napi_gro_cb
   include/net/gro.h:156:25: sparse: sparse: using member 'frag0_len' in incomplete struct napi_gro_cb
   include/net/gro.h:139:25: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
   include/net/gro.h:197:29: sparse: sparse: using member 'csum_valid' in incomplete struct napi_gro_cb
   include/net/gro.h:198:33: sparse: sparse: using member 'csum' in incomplete struct napi_gro_cb
   include/net/gro.h:199:77: sparse: sparse: using member 'csum' in incomplete struct napi_gro_cb
   include/net/gro.h:96:34: sparse: sparse: using member 'recursion_counter' in incomplete struct napi_gro_cb
   include/net/gro.h:357:33: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
--
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
   net/ipv4/udp_tunnel_core.c: note: in included file:
   include/net/udp_tunnel.h:34:50: sparse: sparse: Expected ; at end of declaration
   include/net/udp_tunnel.h:34:50: sparse: sparse: got :
   include/net/udp_tunnel.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp_tunnel.h:38:1: sparse: sparse: got }
   net/ipv4/udp_tunnel_core.c: note: in included file:
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
   net/ipv4/udp_tunnel_core.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv4/udp_tunnel_core.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv4/udp_tunnel_core.c: note: in included file (through include/net/dst_metadata.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv4/udp_tunnel_core.c:21:16: sparse: sparse: using member 'bind_ifindex' in incomplete struct udp_port_cfg
   net/ipv4/udp_tunnel_core.c:22:53: sparse: sparse: using member 'bind_ifindex' in incomplete struct udp_port_cfg
   net/ipv4/udp_tunnel_core.c:28:32: sparse: sparse: using member 'local_ip' in incomplete struct udp_port_cfg
   net/ipv4/udp_tunnel_core.c:29:32: sparse: sparse: using member 'local_udp_port' in incomplete struct udp_port_cfg
   net/ipv4/udp_tunnel_core.c:35:16: sparse: sparse: using member 'peer_udp_port' in incomplete struct udp_port_cfg
   net/ipv4/udp_tunnel_core.c:37:40: sparse: sparse: using member 'peer_ip' in incomplete struct udp_port_cfg
   net/ipv4/udp_tunnel_core.c:38:40: sparse: sparse: using member 'peer_udp_port' in incomplete struct udp_port_cfg
   net/ipv4/udp_tunnel_core.c:45:40: sparse: sparse: using member 'use_udp_checksums' in incomplete struct udp_port_cfg
>> net/ipv4/udp_tunnel_core.c:71:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv4/udp_tunnel_core.c:71:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv4/udp_tunnel_core.c:71:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv4/udp_tunnel_core.c:71:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_core.c:178:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_core.c:178:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_core.c:178:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_core.c:178:9: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/ipv4/udp_tunnel_nic.c: note: in included file:
   include/net/udp_tunnel.h:34:50: sparse: sparse: Expected ; at end of declaration
   include/net/udp_tunnel.h:34:50: sparse: sparse: got :
   include/net/udp_tunnel.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp_tunnel.h:38:1: sparse: sparse: got }
   net/ipv4/udp_tunnel_nic.c: note: in included file (through include/net/udp_tunnel.h):
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
   net/ipv4/udp_tunnel_nic.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv4/udp_tunnel_nic.c: note: in included file (through include/net/udp_tunnel.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv4/udp_tunnel_nic.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/ipv4/udp_tunnel_nic.c:191:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv4/udp_tunnel_nic.c:191:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:374:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:374:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:557:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:557:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:557:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:557:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:557:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:573:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:573:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:675:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:675:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:780:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:780:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:781:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:781:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:782:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:782:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:785:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:785:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:795:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:795:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:902:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:902:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:920:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c:920:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/udp_tunnel_nic.c: note: in included file:
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:143:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:143:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:143:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:143:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:143:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udp_tunnel.h:135:9: sparse: sparse: too many arguments for function __builtin_expect
--
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
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
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
   net/ipv4/esp4.c: note: in included file:
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
   net/ipv4/esp4.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv4/esp4.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv4/esp4.c: note: in included file (through include/linux/ip.h, include/net/ip.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/ipv4/esp4.c:482:29: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:581:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:591:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:609:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:622:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:622:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:622:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:622:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:622:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:755:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:759:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:780:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:780:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:941:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1108:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1108:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1108:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1108:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1108:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1112:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1130:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1130:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1130:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1130:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv4/esp4.c:1130:9: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/ipv6/ip6_udp_tunnel.c: note: in included file (through include/linux/if_tunnel.h, include/net/ip_tunnels.h, include/net/udp_tunnel.h):
   include/uapi/linux/if_tunnel.h:56:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/if_tunnel.h:56:1: sparse: sparse: got }
   net/ipv6/ip6_udp_tunnel.c: note: in included file (through include/net/udp_tunnel.h):
   include/net/ip_tunnels.h:479:51: sparse: sparse: Expected ) at end of cast operator
   include/net/ip_tunnels.h:479:51: sparse: sparse: got __seg_fs
   net/ipv6/ip6_udp_tunnel.c: note: in included file:
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
   net/ipv6/ip6_udp_tunnel.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/ip6_udp_tunnel.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/ip6_udp_tunnel.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/net/inet_sock.h, ...):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/ipv6/ip6_udp_tunnel.c:39:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv6/ip6_udp_tunnel.c:39:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv6/ip6_udp_tunnel.c:39:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv6/ip6_udp_tunnel.c:39:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv6/ip6_udp_tunnel.c:39:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_udp_tunnel.c:50:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_udp_tunnel.c:50:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_udp_tunnel.c:50:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_udp_tunnel.c:50:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_udp_tunnel.c:50:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_udp_tunnel.c: note: in included file:
>> include/net/ip6_tunnel.h:164:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_udp_tunnel.c: note: in included file (through include/net/udp_tunnel.h):
   include/net/ip_tunnels.h:485:17: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/ipv6/esp6_offload.c: note: in included file:
   include/net/gro.h:21:17: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:21:17: sparse: sparse: got }
   include/net/gro.h:30:9: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:30:9: sparse: sparse: got }
   include/net/gro.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/gro.h:89:1: sparse: sparse: got }
   net/ipv6/esp6_offload.c: note: in included file (through include/net/gro.h):
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
   net/ipv6/esp6_offload.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/esp6_offload.c: note: in included file (through include/net/gro.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/esp6_offload.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/ipv6/esp6_offload.c:37:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6_offload.c:114:25: sparse: sparse: using member 'same_flow' in incomplete struct napi_gro_cb
   net/ipv6/esp6_offload.c:115:25: sparse: sparse: using member 'flush' in incomplete struct napi_gro_cb
   net/ipv6/esp6_offload.c:164:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6_offload.c:209:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6_offload.c: note: in included file:
   include/net/gro.h:129:32: sparse: sparse: using member 'data_offset' in incomplete struct napi_gro_cb
--
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
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
   include/net/tcp.h:2158:9: sparse: sparse: Expected ) at end of cast operator
   include/net/tcp.h:2158:9: sparse: sparse: got __seg_fs
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
   net/ipv6/esp6.c: note: in included file:
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
   net/ipv6/esp6.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/esp6.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/esp6.c: note: in included file (through include/linux/ip.h, include/net/ip.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/ipv6/esp6.c:517:29: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:618:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:628:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:646:21: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:659:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:659:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:659:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:659:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:659:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:792:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:796:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:827:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:827:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:842:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:842:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:842:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:842:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:842:25: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:989:13: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1151:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1151:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1151:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1151:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1151:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1155:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1173:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1173:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1173:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1173:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:1173:9: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/esp6.c:757:9: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/netfilter/nft_inner.c: note: in included file (through include/net/geneve.h):
   include/net/udp_tunnel.h:34:50: sparse: sparse: Expected ; at end of declaration
   include/net/udp_tunnel.h:34:50: sparse: sparse: got :
   include/net/udp_tunnel.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp_tunnel.h:38:1: sparse: sparse: got }
   net/netfilter/nft_inner.c:251:45: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/nft_inner.c:251:45: sparse: sparse: got __seg_fs
   net/netfilter/nft_inner.c: note: in included file (through include/net/udp_tunnel.h, include/net/geneve.h):
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
   net/netfilter/nft_inner.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/netfilter/nft_inner.c: note: in included file (through include/net/udp_tunnel.h, include/net/geneve.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/netfilter/nft_inner.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/linux/if_vlan.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/netfilter/nft_inner.c:269:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/netfilter/nft_inner.c:269:17: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/netfilter/nft_tunnel.c: note: in included file (through include/net/vxlan.h):
   include/net/udp_tunnel.h:34:50: sparse: sparse: Expected ; at end of declaration
   include/net/udp_tunnel.h:34:50: sparse: sparse: got :
   include/net/udp_tunnel.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp_tunnel.h:38:1: sparse: sparse: got }
   net/netfilter/nft_tunnel.c: note: in included file (through include/net/udp_tunnel.h, include/net/vxlan.h):
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
   net/netfilter/nft_tunnel.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/netfilter/nft_tunnel.c: note: in included file (through include/net/udp_tunnel.h, include/net/vxlan.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/netfilter/nft_tunnel.c: note: in included file (through include/linux/netlink.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/netfilter/nft_tunnel.c:63:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/netfilter/nft_tunnel.c:63:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:236:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:236:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:236:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:236:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:236:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:241:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:241:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:241:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:241:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:241:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:365:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:365:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:365:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:365:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:365:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:510:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:510:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:510:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:510:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/nft_tunnel.c:510:9: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/openvswitch/flow_netlink.c: note: in included file (through include/net/geneve.h):
   include/net/udp_tunnel.h:34:50: sparse: sparse: Expected ; at end of declaration
   include/net/udp_tunnel.h:34:50: sparse: sparse: got :
   include/net/udp_tunnel.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp_tunnel.h:38:1: sparse: sparse: got }
   net/openvswitch/flow_netlink.c: note: in included file (through include/net/udp_tunnel.h, include/net/geneve.h):
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
   net/openvswitch/flow_netlink.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/openvswitch/flow_netlink.c: note: in included file (through include/net/udp_tunnel.h, include/net/geneve.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/openvswitch/flow_netlink.c: note: in included file (through include/linux/netlink.h, net/openvswitch/flow.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/openvswitch/flow_netlink.c:579:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:635:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:662:9: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:987:13: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1244:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1265:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1268:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1326:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1326:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1326:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1326:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1326:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1333:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1333:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1333:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1333:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1333:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1372:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1372:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1372:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1372:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1372:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1373:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1373:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1373:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1373:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1373:25: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1400:13: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1400:13: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1523:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1525:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1600:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1600:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1600:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1600:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1600:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1600:17: sparse: sparse: too many arguments for function __builtin_expect
   net/openvswitch/flow_netlink.c:1600:17: sparse: sparse: too many arguments for function __builtin_expect
--
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   net/rxrpc/local_object.c: note: in included file:
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
   net/rxrpc/local_object.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/rxrpc/local_object.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/rxrpc/local_object.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/rxrpc/local_object.c:129:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/rxrpc/local_object.c:129:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/rxrpc/local_object.c:129:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/rxrpc/local_object.c:129:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/rxrpc/local_object.c:129:17: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:143:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:160:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:178:17: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:225:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:248:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:298:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:307:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:312:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:417:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:427:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c:464:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/local_object.c: note: in included file (through net/rxrpc/ar-internal.h):
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
>> include/trace/events/rxrpc.h:559:1: sparse: sparse: too many arguments for function __builtin_expect
--
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1927:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: Expected ) at end of cast operator
   include/trace/events/rxrpc.h:1944:1: sparse: sparse: got __seg_fs
   net/rxrpc/output.c: note: in included file:
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
   net/rxrpc/output.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/rxrpc/output.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/rxrpc/output.c: note: in included file:
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/rxrpc/output.c:109:25: sparse: sparse: too many arguments for function __builtin_expect
>> net/rxrpc/output.c:109:25: sparse: sparse: too many arguments for function __builtin_expect
>> net/rxrpc/output.c:109:25: sparse: sparse: too many arguments for function __builtin_expect
>> net/rxrpc/output.c:109:25: sparse: sparse: too many arguments for function __builtin_expect
>> net/rxrpc/output.c:109:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:111:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:111:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:111:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:111:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:111:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:112:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:112:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:112:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:112:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:112:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:137:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:137:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:137:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:137:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:137:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:334:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:483:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:488:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:571:17: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:657:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:694:9: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c:724:25: sparse: sparse: too many arguments for function __builtin_expect
   net/rxrpc/output.c: note: in included file (through net/rxrpc/ar-internal.h):
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1247:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1119:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1119:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1119:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1119:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1119:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1119:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1119:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1119:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1119:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1734:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1048:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1848:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1848:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1848:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1848:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/rxrpc.h:1848:1: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/sctp/protocol.c: note: in included file:
   include/net/udp_tunnel.h:34:50: sparse: sparse: Expected ; at end of declaration
   include/net/udp_tunnel.h:34:50: sparse: sparse: got :
   include/net/udp_tunnel.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp_tunnel.h:38:1: sparse: sparse: got }
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c:1071:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/protocol.c:1071:9: sparse: sparse: got __seg_fs
   net/sctp/protocol.c: note: in included file (through include/net/udp_tunnel.h):
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
   net/sctp/protocol.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/sctp/protocol.c: note: in included file (through include/net/udp_tunnel.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/sctp/protocol.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/sctp/protocol.c:189:25: sparse: sparse: too many arguments for function __builtin_expect
>> net/sctp/protocol.c:189:25: sparse: sparse: too many arguments for function __builtin_expect
>> net/sctp/protocol.c:189:25: sparse: sparse: too many arguments for function __builtin_expect
>> net/sctp/protocol.c:189:25: sparse: sparse: too many arguments for function __builtin_expect
>> net/sctp/protocol.c:189:25: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:456:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:456:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:456:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:456:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:456:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:521:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:521:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:521:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:521:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:521:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:531:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:531:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:531:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:531:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:531:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c:870:17: sparse: sparse: using member 'family' in incomplete struct udp_port_cfg
   net/sctp/protocol.c:871:17: sparse: sparse: using member 'local_ip' in incomplete struct udp_port_cfg
   net/sctp/protocol.c:872:17: sparse: sparse: using member 'local_udp_port' in incomplete struct udp_port_cfg
   net/sctp/protocol.c:888:17: sparse: sparse: using member 'family' in incomplete struct udp_port_cfg
   net/sctp/protocol.c:889:17: sparse: sparse: using member 'local_ip6' in incomplete struct udp_port_cfg
   net/sctp/protocol.c:890:17: sparse: sparse: using member 'local_udp_port' in incomplete struct udp_port_cfg
   net/sctp/protocol.c:891:17: sparse: sparse: using member 'use_udp6_rx_checksums' in incomplete struct udp_port_cfg
   net/sctp/protocol.c:892:17: sparse: sparse: using member 'ipv6_v6only' in incomplete struct udp_port_cfg
   net/sctp/protocol.c:1071:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/protocol.c: note: in included file:
   include/net/udp_tunnel.h:58:16: sparse: sparse: using member 'family' in incomplete struct udp_port_cfg
   include/net/udp_tunnel.h:61:16: sparse: sparse: using member 'family' in incomplete struct udp_port_cfg
   include/net/udp_tunnel.h:58:16: sparse: sparse: using member 'family' in incomplete struct udp_port_cfg
   include/net/udp_tunnel.h:61:16: sparse: sparse: using member 'family' in incomplete struct udp_port_cfg
--
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
   net/sctp/ipv6.c: note: in included file:
   include/net/udp_tunnel.h:34:50: sparse: sparse: Expected ; at end of declaration
   include/net/udp_tunnel.h:34:50: sparse: sparse: got :
   include/net/udp_tunnel.h:38:1: sparse: sparse: Expected ; at the end of type declaration
   include/net/udp_tunnel.h:38:1: sparse: sparse: got }
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:182:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:182:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:203:17: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:203:17: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c:243:9: sparse: sparse: Expected ) at end of cast operator
   net/sctp/ipv6.c:243:9: sparse: sparse: got __seg_fs
   net/sctp/ipv6.c: note: in included file (through include/net/udp_tunnel.h):
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
   net/sctp/ipv6.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/sctp/ipv6.c: note: in included file (through include/net/udp_tunnel.h):
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/sctp/ipv6.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/sctp/ipv6.c:182:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:203:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:243:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:330:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:330:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:330:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:330:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:330:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:356:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:356:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:356:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:356:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:356:33: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:396:25: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:396:25: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:396:25: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:396:25: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:396:25: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:411:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:411:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:411:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:411:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:411:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:796:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:796:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:796:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:796:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sctp/ipv6.c:796:9: sparse: sparse: too many arguments for function __builtin_expect
--
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got if
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got do
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got 0
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got pto_tmp__
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got 4
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got 0
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got pao_tmp__
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got if
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'else' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got do
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got 0
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got pto_tmp__
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got 8
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'void' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got __vpp_verify
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ) in nested declarator
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got {
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ) at end of cast operator
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got __seg_fs
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got *
>> net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'default' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got :
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Trying to use reserved word 'break' as identifier
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1382:17: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1383:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   net/sunrpc/xprtsock.c:1383:22: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1383:22: sparse: sparse: got out_unpin
   net/sunrpc/xprtsock.c:1384:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1384:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1389:21: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1389:21: sparse: sparse: got &
   net/sunrpc/xprtsock.c:1390:19: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1390:19: sparse: sparse: got &
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ) in nested declarator
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got {
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got {
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got __vpp_verify
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got (
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'switch' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got 0
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got pao_tmp__
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got if
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got do
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got 0
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got pto_tmp__
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'break' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'case' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at end of declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got 2
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ) in function declarator
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got 0
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at the end of type declaration
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: got }
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   net/sunrpc/xprtsock.c:1392:9: sparse: sparse: Expected ; at end of declaration
--
   net/sunrpc/xprtsock.c:1586:9: sparse:    int [addressable] [toplevel] transport
   net/sunrpc/xprtsock.c:1509:26: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1509:26: sparse:    struct sock_xprt *[addressable] [toplevel] transport
   net/sunrpc/xprtsock.c:1589:9: sparse: sparse: symbol 'xs_run_error_worker' redeclared with different type (incompatible argument 1 (different base types)):
   net/sunrpc/xprtsock.c:1589:9: sparse:    int static [signed] [toplevel] xs_run_error_worker( ... )
   net/sunrpc/xprtsock.c:1191:13: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1191:13: sparse:    void static [toplevel] xs_run_error_worker( ... )
   net/sunrpc/xprtsock.c:1590:9: sparse: sparse: symbol 'sk' redeclared with different type (different base types):
   net/sunrpc/xprtsock.c:1590:9: sparse:    int [addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1402:21: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1402:21: sparse:    struct sock *[addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1630:36: sparse: sparse: cannot dereference this type
   net/sunrpc/xprtsock.c:1630:21: sparse: sparse: symbol 'sk' redeclared with different type (different base types):
   net/sunrpc/xprtsock.c:1630:21: sparse:    struct sock *[addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1590:9: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1590:9: sparse:    int [addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1634:17: sparse: sparse: symbol 'sk' redeclared with different type (different base types):
   net/sunrpc/xprtsock.c:1634:17: sparse:    int [addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1630:21: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1630:21: sparse:    struct sock *[addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1638:17: sparse: sparse: symbol 'sk' redeclared with different type (different base types):
   net/sunrpc/xprtsock.c:1638:17: sparse:    int [addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1630:21: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1630:21: sparse:    struct sock *[addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1639:17: sparse: sparse: symbol 'sk' redeclared with different type (different base types):
   net/sunrpc/xprtsock.c:1639:17: sparse:    int [addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1630:21: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1630:21: sparse:    struct sock *[addressable] [toplevel] sk
   net/sunrpc/xprtsock.c:1655:9: sparse: sparse: symbol 'transport' redeclared with different type (different base types):
   net/sunrpc/xprtsock.c:1655:9: sparse:    int [addressable] [toplevel] transport
   net/sunrpc/xprtsock.c:1509:26: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1509:26: sparse:    struct sock_xprt *[addressable] [toplevel] transport
   net/sunrpc/xprtsock.c:1658:9: sparse: sparse: symbol 'transport' redeclared with different type (different base types):
   net/sunrpc/xprtsock.c:1658:9: sparse:    int [addressable] [toplevel] transport
   net/sunrpc/xprtsock.c:1509:26: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1509:26: sparse:    struct sock_xprt *[addressable] [toplevel] transport
   net/sunrpc/xprtsock.c:1676:9: sparse: sparse: symbol 'spin_unlock' redeclared with different type (different argument counts):
   net/sunrpc/xprtsock.c:1676:9: sparse:    int static [signed] [toplevel] spin_unlock( ... )
   net/sunrpc/xprtsock.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/spinlock.h:389:29: sparse: note: previously declared as:
   include/linux/spinlock.h:389:29: sparse:    void static inline [gnu_inline] [toplevel] spin_unlock( ... )
   net/sunrpc/xprtsock.c:1687:17: sparse: sparse: undefined identifier 'max'
   net/sunrpc/xprtsock.c:1687:23: sparse: sparse: undefined identifier 'min'
   net/sunrpc/xprtsock.c:1687:9: sparse: sparse: symbol 'range' redeclared with different type (different type sizes):
   net/sunrpc/xprtsock.c:1687:9: sparse:    int [addressable] [toplevel] range
   net/sunrpc/xprtsock.c:1682:24: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1682:24: sparse:    unsigned short [addressable] [toplevel] range
   net/sunrpc/xprtsock.c:1688:9: sparse: sparse: symbol 'rand' redeclared with different type (different type sizes):
   net/sunrpc/xprtsock.c:1688:9: sparse:    int [addressable] [toplevel] rand
   net/sunrpc/xprtsock.c:1683:24: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1683:24: sparse:    unsigned short [addressable] [toplevel] rand
   net/sunrpc/xprtsock.c:1720:9: sparse: sparse: symbol 'rpc_set_port' redeclared with different type (incompatible argument 1 (different base types)):
   net/sunrpc/xprtsock.c:1720:9: sparse:    int static [signed] [toplevel] rpc_set_port( ... )
   net/sunrpc/xprtsock.c: note: in included file:
   include/linux/sunrpc/addr.h:34:20: sparse: note: previously declared as:
   include/linux/sunrpc/addr.h:34:20: sparse:    void static inline [gnu_inline] [toplevel] rpc_set_port( ... )
   net/sunrpc/xprtsock.c:1721:9: sparse: sparse: symbol 'xs_update_peer_port' redeclared with different type (incompatible argument 1 (different base types)):
   net/sunrpc/xprtsock.c:1721:9: sparse:    int static [signed] [toplevel] xs_update_peer_port( ... )
   net/sunrpc/xprtsock.c:317:13: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:317:13: sparse:    void static [toplevel] xs_update_peer_port( ... )
   net/sunrpc/xprtsock.c:1757:13: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at net/sunrpc/xprtsock.c:1742)
   net/sunrpc/xprtsock.c:1757:13: sparse: sparse: symbol 'ret' redeclared with different type (different type sizes):
   net/sunrpc/xprtsock.c:1757:13: sparse:    int [addressable] [toplevel] ret
   net/sunrpc/xprtsock.c:1742:24: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1742:24: sparse:    unsigned short [addressable] [toplevel] ret
   net/sunrpc/xprtsock.c:1783:20: sparse: sparse: undefined identifier 'xs_get_srcport'
   net/sunrpc/xprtsock.c:1783:13: sparse: sparse: symbol 'port' has multiple initializers (originally initialized at net/sunrpc/xprtsock.c:1695)
   net/sunrpc/xprtsock.c:1783:13: sparse: sparse: symbol 'port' redeclared with different type (different type sizes):
   net/sunrpc/xprtsock.c:1783:13: sparse:    int [addressable] [toplevel] port
   net/sunrpc/xprtsock.c:1695:24: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1695:24: sparse:    unsigned short [addressable] [toplevel] port
   net/sunrpc/xprtsock.c:1804:9: sparse: sparse: undefined identifier 'myaddr'
   net/sunrpc/xprtsock.c:1804:9: sparse: sparse: cannot dereference this type
   net/sunrpc/xprtsock.c:1804:9: sparse: sparse: undefined identifier 'myaddr'
   net/sunrpc/xprtsock.c:1804:9: sparse: sparse: cannot dereference this type
   net/sunrpc/xprtsock.c:1804:9: sparse: sparse: undefined identifier '__ret_do_once'
   net/sunrpc/xprtsock.c:1804:9: sparse: sparse: symbol '__ret_once' has multiple initializers (originally initialized at net/sunrpc/xprtsock.c:1804)
   net/sunrpc/xprtsock.c:1804:9: sparse: sparse: symbol '__ret_once' redeclared with different type (different type sizes):
   net/sunrpc/xprtsock.c:1804:9: sparse:    int [addressable] [toplevel] __ret_once
   net/sunrpc/xprtsock.c:1804:9: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1804:9: sparse:    bool [addressable] [toplevel] [usertype] __ret_once
   net/sunrpc/xprtsock.c:1807:35: sparse: sparse: undefined identifier 'sock'
   net/sunrpc/xprtsock.c:1815:24: sparse: sparse: undefined identifier 'xs_next_srcport'
   net/sunrpc/xprtsock.c:1815:17: sparse: sparse: symbol 'port' has multiple initializers (originally initialized at net/sunrpc/xprtsock.c:1783)
   net/sunrpc/xprtsock.c:1815:17: sparse: sparse: symbol 'port' redeclared with different type (different type sizes):
   net/sunrpc/xprtsock.c:1815:17: sparse:    int [addressable] [toplevel] port
   net/sunrpc/xprtsock.c:1695:24: sparse: note: previously declared as:
   net/sunrpc/xprtsock.c:1695:24: sparse:    unsigned short [addressable] [toplevel] port
   net/sunrpc/xprtsock.c:1917:15: sparse: sparse: undefined identifier 'xs_bind'
   net/sunrpc/xprtsock.c:1947:37: sparse: sparse: undefined identifier 'xs_data_ready'
   net/sunrpc/xprtsock.c:1948:38: sparse: sparse: undefined identifier 'xs_udp_write_space'
   net/sunrpc/xprtsock.c:1949:39: sparse: sparse: undefined identifier 'xs_local_state_change'
   net/sunrpc/xprtsock.c:2150:37: sparse: sparse: undefined identifier 'xs_data_ready'
   net/sunrpc/xprtsock.c:2151:38: sparse: sparse: undefined identifier 'xs_udp_write_space'
   net/sunrpc/xprtsock.c:2284:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2284:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2284:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2284:9: sparse: sparse: too many arguments for function __warn_printk
   net/sunrpc/xprtsock.c:2284:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2284:9: sparse: sparse: too many arguments for function __builtin_expect
>> net/sunrpc/xprtsock.c:2284:9: sparse: sparse: too many arguments for function __builtin_memcpy
   net/sunrpc/xprtsock.c:2290:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2290:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2290:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2290:9: sparse: sparse: too many arguments for function __warn_printk
   net/sunrpc/xprtsock.c:2290:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2290:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2290:9: sparse: sparse: too many arguments for function __builtin_memcpy
   net/sunrpc/xprtsock.c:2301:18: sparse: sparse: too many arguments for function spin_lock
   net/sunrpc/xprtsock.c:2306:16: sparse: sparse: too many arguments for function set_bit
   net/sunrpc/xprtsock.c:2307:20: sparse: sparse: too many arguments for function spin_unlock
   net/sunrpc/xprtsock.c:2337:37: sparse: sparse: undefined identifier 'xs_data_ready'
   net/sunrpc/xprtsock.c:2338:39: sparse: sparse: undefined identifier 'xs_tcp_state_change'
   net/sunrpc/xprtsock.c:2339:38: sparse: sparse: undefined identifier 'xs_tcp_write_space'
   net/sunrpc/xprtsock.c:2363:16: sparse: sparse: too many arguments for function set_bit
   net/sunrpc/xprtsock.c:2414:24: sparse: sparse: too many arguments for function set_bit
   net/sunrpc/xprtsock.c:2447:9: sparse: sparse: undefined identifier 'xs_tcp_force_close'
   net/sunrpc/xprtsock.c:2506:17: sparse: sparse: too many arguments for function mutex_lock_nested
   net/sunrpc/xprtsock.c:2514:29: sparse: sparse: too many arguments for function mutex_unlock
   net/sunrpc/xprtsock.c:2524:26: sparse: sparse: too many arguments for function clear_bit
   net/sunrpc/xprtsock.c:2530:36: sparse: sparse: too many arguments for function xs_run_error_worker
   net/sunrpc/xprtsock.c:2567:16: sparse: sparse: too many arguments for function set_bit
   net/sunrpc/xprtsock.c:2601:18: sparse: sparse: too many arguments for function clear_bit
   net/sunrpc/xprtsock.c:2662:26: sparse: sparse: too many arguments for function clear_bit
   net/sunrpc/xprtsock.c:2665:36: sparse: sparse: too many arguments for function xs_run_error_worker
   net/sunrpc/xprtsock.c:2688:26: sparse: sparse: too many arguments for function clear_bit
   net/sunrpc/xprtsock.c:2694:36: sparse: sparse: too many arguments for function xs_run_error_worker
   net/sunrpc/xprtsock.c:2711:9: sparse: sparse: undefined identifier 'xs_tcp_force_close'
   net/sunrpc/xprtsock.c:2735:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2735:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2756:17: sparse: sparse: undefined identifier 'xs_tcp_force_close'
   net/sunrpc/xprtsock.c:2771:9: sparse: sparse: too many arguments for function mutex_lock_nested
   net/sunrpc/xprtsock.c:2780:21: sparse: sparse: too many arguments for function mutex_unlock
   net/sunrpc/xprtsock.c:2897:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2897:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2897:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2897:17: sparse: sparse: too many arguments for function __warn_printk
   net/sunrpc/xprtsock.c:2897:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2897:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:2975:9: sparse: sparse: too many arguments for function mutex_lock_nested
   net/sunrpc/xprtsock.c:2980:21: sparse: sparse: too many arguments for function mutex_unlock
   net/sunrpc/xprtsock.c:3015:35: sparse: sparse: undefined identifier 'xs_local_rpcbind'
   net/sunrpc/xprtsock.c:3016:35: sparse: sparse: undefined identifier 'xs_local_set_port'
   net/sunrpc/xprtsock.c:3031:35: sparse: sparse: undefined identifier 'xs_udp_set_buffer_size'
   net/sunrpc/xprtsock.c:3037:35: sparse: sparse: undefined identifier 'xs_set_port'
   net/sunrpc/xprtsock.c:3039:35: sparse: sparse: undefined identifier 'xs_sock_srcaddr'
   net/sunrpc/xprtsock.c:3040:35: sparse: sparse: undefined identifier 'xs_sock_srcport'
   net/sunrpc/xprtsock.c:3045:35: sparse: sparse: undefined identifier 'xs_udp_timer'
   net/sunrpc/xprtsock.c:3061:35: sparse: sparse: undefined identifier 'xs_set_port'
   net/sunrpc/xprtsock.c:3063:35: sparse: sparse: undefined identifier 'xs_sock_srcaddr'
   net/sunrpc/xprtsock.c:3064:35: sparse: sparse: undefined identifier 'xs_sock_srcport'
   net/sunrpc/xprtsock.c:3122:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3122:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3122:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3122:17: sparse: sparse: too many arguments for function __warn_printk
   net/sunrpc/xprtsock.c:3122:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3122:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3122:17: sparse: sparse: too many arguments for function __builtin_memcpy
   net/sunrpc/xprtsock.c:3125:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3125:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3125:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3125:17: sparse: sparse: too many arguments for function __warn_printk
   net/sunrpc/xprtsock.c:3125:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3125:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3125:17: sparse: sparse: too many arguments for function __builtin_memcpy
   net/sunrpc/xprtsock.c:3156:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3156:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3156:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3156:9: sparse: sparse: too many arguments for function __warn_printk
   net/sunrpc/xprtsock.c:3156:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3156:9: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3156:9: sparse: sparse: too many arguments for function __builtin_memcpy
   net/sunrpc/xprtsock.c:3159:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3159:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3159:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3159:17: sparse: sparse: too many arguments for function __warn_printk
   net/sunrpc/xprtsock.c:3159:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3159:17: sparse: sparse: too many arguments for function __builtin_expect
   net/sunrpc/xprtsock.c:3159:17: sparse: sparse: too many arguments for function __builtin_memcpy
   net/sunrpc/xprtsock.c:3278:9: sparse: sparse: undefined identifier 'xs_udp_data_receive_workfn'
   net/sunrpc/xprtsock.c: note: in included file:
   include/trace/events/sunrpc.h:1348:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1348:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1348:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1348:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1348:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1348:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1348:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1348:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1348:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1321:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1321:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1321:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1321:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1321:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1321:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1321:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1321:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:1321:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:957:1: sparse: sparse: too many arguments for function __builtin_expect
   include/trace/events/sunrpc.h:957:1: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/ipv6/netfilter/nf_tproxy_ipv6.c:17:13: sparse: sparse: Expected ) in function declarator
   net/ipv6/netfilter/nf_tproxy_ipv6.c:17:13: sparse: sparse: got !
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:17:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   net/ipv6/netfilter/nf_tproxy_ipv6.c:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:22:13: sparse: sparse: missing type declaration for parameter 'indev'
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:24:17: sparse: sparse: cannot dereference this type
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:24:17: sparse: sparse: cannot dereference this type
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:34:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   net/ipv6/netfilter/nf_tproxy_ipv6.c:34:16: sparse: sparse: Expected ; at end of declaration
   net/ipv6/netfilter/nf_tproxy_ipv6.c:34:16: sparse: sparse: got laddr
   net/ipv6/netfilter/nf_tproxy_ipv6.c:35:1: sparse: sparse: Expected ; at the end of type declaration
   net/ipv6/netfilter/nf_tproxy_ipv6.c:35:1: sparse: sparse: got }
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
   net/ipv6/netfilter/nf_tproxy_ipv6.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv6/netfilter/nf_tproxy_ipv6.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/netfilter/nf_tproxy_ipv6.c: note: in included file (through include/linux/tcp.h, include/net/tcp.h, include/net/netfilter/nf_tproxy.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/netfilter/nf_tproxy_ipv6.c:19:9: sparse: sparse: symbol 'laddr' redeclared with different type (different base types):
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:19:9: sparse:    int [addressable] [toplevel] laddr
   net/ipv6/netfilter/nf_tproxy_ipv6.c:15:25: sparse: note: previously declared as:
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:15:25: sparse:    struct in6_addr *[addressable] [toplevel] laddr
   net/ipv6/netfilter/nf_tproxy_ipv6.c:21:31: sparse: sparse: undefined identifier 'skb'
   net/ipv6/netfilter/nf_tproxy_ipv6.c:23:17: sparse: sparse: cannot dereference this type
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:24:17: sparse: sparse: cannot dereference this type
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:24:17: sparse: sparse: cannot dereference this type
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:24:17: sparse: sparse: cast from unknown type
   net/ipv6/netfilter/nf_tproxy_ipv6.c:31:17: sparse: sparse: cannot dereference this type
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:140:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv6/netfilter/nf_tproxy_ipv6.c:140:17: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/ipv4/netfilter/nf_tproxy_ipv4.c: note: in included file:
   include/linux/inetdevice.h:21:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/inetdevice.h:21:1: sparse: sparse: got }
   net/ipv4/netfilter/nf_tproxy_ipv4.c: note: in included file:
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
   net/ipv4/netfilter/nf_tproxy_ipv4.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/ipv4/netfilter/nf_tproxy_ipv4.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv4/netfilter/nf_tproxy_ipv4.c: note: in included file (through include/linux/tcp.h, include/net/tcp.h, include/net/netfilter/nf_tproxy.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/ipv4/netfilter/nf_tproxy_ipv4.c:139:17: sparse: sparse: too many arguments for function __builtin_expect
>> net/ipv4/netfilter/nf_tproxy_ipv4.c:139:17: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file (through include/linux/icmp.h, include/net/icmp.h):
   include/uapi/linux/icmp.h:105:1: sparse: sparse: Expected ; at the end of type declaration
   include/uapi/linux/icmp.h:105:1: sparse: sparse: got }
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file (through include/net/netfilter/nf_conntrack_tuple.h, include/linux/netfilter/nf_conntrack_proto_gre.h, ...):
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
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file (through include/linux/sched/isolation.h, include/net/ip_vs.h):
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_fs
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_fs
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_fs
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_xmit.c:289:25: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_xmit.c:289:25: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file:
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
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file (through include/linux/tcp.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/netfilter/ipvs/ip_vs_xmit.c:320:21: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:363:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:370:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:380:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:764:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:191:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:242:21: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:671:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file:
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:671:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:640:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:671:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:607:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:671:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:671:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_xmit.c:640:13: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
   include/linux/netfilter.h:249:17: sparse: sparse: too many arguments for function __builtin_expect
--
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
   net/netfilter/ipvs/ip_vs_core.c: note: in included file (through include/linux/sched/isolation.h, include/net/ip_vs.h):
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_fs
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_fs
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_fs
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c:133:21: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_core.c:133:21: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c:140:21: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_core.c:140:21: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c:146:21: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_core.c:146:21: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c:169:21: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_core.c:169:21: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c:176:21: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_core.c:176:21: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c:182:21: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_core.c:182:21: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c:201:13: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_core.c:201:13: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c:206:13: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_core.c:206:13: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c:211:13: sparse: sparse: Expected ) at end of cast operator
   net/netfilter/ipvs/ip_vs_core.c:211:13: sparse: sparse: got __seg_fs
   net/netfilter/ipvs/ip_vs_core.c: note: in included file:
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
   net/netfilter/ipvs/ip_vs_core.c: note: in included file (through include/linux/irqflags.h, arch/x86/include/asm/special_insns.h, arch/x86/include/asm/processor.h, ...):
   arch/x86/include/asm/irqflags.h:132:29: sparse: note: previously declared as:
   arch/x86/include/asm/irqflags.h:132:29: sparse:    void static inline [gnu_inline] [toplevel] arch_local_irq_restore( ... )
   net/netfilter/ipvs/ip_vs_core.c: note: in included file:
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/netfilter/ipvs/ip_vs_core.c: note: in included file (through include/linux/ip.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
>> net/netfilter/ipvs/ip_vs_core.c:268:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:461:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:595:17: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:651:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:969:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1346:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1353:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1372:21: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1381:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1389:21: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1403:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1415:29: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1486:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1636:21: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1658:21: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1690:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1791:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1928:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1939:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1946:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1965:21: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1976:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1997:21: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:1998:21: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:2047:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:2107:13: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c: note: in included file:
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:225:13: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:225:13: sparse: sparse: too many arguments for function __builtin_expect
>> include/net/ip_vs.h:207:9: sparse: sparse: too many arguments for function __builtin_expect
   net/netfilter/ipvs/ip_vs_core.c:225:13: sparse: sparse: too many arguments for function __builtin_expect

vim +23 net/8021q/vlan_core.c

7750f403cbe5697 Patrick McHardy   2008-07-08   9  
48cc32d38a52d0b Florian Zumbiehl  2012-10-07  10  bool vlan_do_receive(struct sk_buff **skbp)
7750f403cbe5697 Patrick McHardy   2008-07-08  11  {
3701e51382a026c Jesse Gross       2010-10-20  12  	struct sk_buff *skb = *skbp;
86a9bad3ab6b6f8 Patrick McHardy   2013-04-19  13  	__be16 vlan_proto = skb->vlan_proto;
df8a39defad46b8 Jiri Pirko        2015-01-13  14  	u16 vlan_id = skb_vlan_tag_get_id(skb);
ad1afb00393915a Pedro Garcia      2010-07-18  15  	struct net_device *vlan_dev;
4af429d29b341bb Eric Dumazet      2010-11-10  16  	struct vlan_pcpu_stats *rx_stats;
e1c096e251e5277 Herbert Xu        2009-01-06  17  
86a9bad3ab6b6f8 Patrick McHardy   2013-04-19  18  	vlan_dev = vlan_find_dev(skb->dev, vlan_proto, vlan_id);
48cc32d38a52d0b Florian Zumbiehl  2012-10-07  19  	if (!vlan_dev)
3701e51382a026c Jesse Gross       2010-10-20  20  		return false;
9b22ea560957de1 Patrick McHardy   2008-11-04  21  
3701e51382a026c Jesse Gross       2010-10-20  22  	skb = *skbp = skb_share_check(skb, GFP_ATOMIC);
3701e51382a026c Jesse Gross       2010-10-20 @23  	if (unlikely(!skb))
3701e51382a026c Jesse Gross       2010-10-20  24  		return false;
e769fcec6bc4bdd Vishakha Narvekar 2017-10-03  25  
e769fcec6bc4bdd Vishakha Narvekar 2017-10-03  26  	if (unlikely(!(vlan_dev->flags & IFF_UP))) {
e769fcec6bc4bdd Vishakha Narvekar 2017-10-03  27  		kfree_skb(skb);
e769fcec6bc4bdd Vishakha Narvekar 2017-10-03  28  		*skbp = NULL;
e769fcec6bc4bdd Vishakha Narvekar 2017-10-03  29  		return false;
e769fcec6bc4bdd Vishakha Narvekar 2017-10-03  30  	}
bc1d0411b804ad1 Patrick McHardy   2008-07-14  31  
3701e51382a026c Jesse Gross       2010-10-20  32  	skb->dev = vlan_dev;
375f67df2811aaf dingtianhong      2014-03-07  33  	if (unlikely(skb->pkt_type == PACKET_OTHERHOST)) {
0b5c9db1b11d317 Jiri Pirko        2011-06-10  34  		/* Our lower layer thinks this is not local, let's make sure.
0b5c9db1b11d317 Jiri Pirko        2011-06-10  35  		 * This allows the VLAN to have a different MAC than the
0b5c9db1b11d317 Jiri Pirko        2011-06-10  36  		 * underlying device, and still route correctly. */
be14cc98e9fd541 dingtianhong      2014-03-07  37  		if (ether_addr_equal_64bits(eth_hdr(skb)->h_dest, vlan_dev->dev_addr))
0b5c9db1b11d317 Jiri Pirko        2011-06-10  38  			skb->pkt_type = PACKET_HOST;
0b5c9db1b11d317 Jiri Pirko        2011-06-10  39  	}
0b5c9db1b11d317 Jiri Pirko        2011-06-10  40  
28f9ee22bcdd847 Vlad Yasevich     2015-11-16  41  	if (!(vlan_dev_priv(vlan_dev)->flags & VLAN_FLAG_REORDER_HDR) &&
28f9ee22bcdd847 Vlad Yasevich     2015-11-16  42  	    !netif_is_macvlan_port(vlan_dev) &&
28f9ee22bcdd847 Vlad Yasevich     2015-11-16  43  	    !netif_is_bridge_port(vlan_dev)) {
0b5c9db1b11d317 Jiri Pirko        2011-06-10  44  		unsigned int offset = skb->data - skb_mac_header(skb);
0b5c9db1b11d317 Jiri Pirko        2011-06-10  45  
0b5c9db1b11d317 Jiri Pirko        2011-06-10  46  		/*
0b5c9db1b11d317 Jiri Pirko        2011-06-10  47  		 * vlan_insert_tag expect skb->data pointing to mac header.
0b5c9db1b11d317 Jiri Pirko        2011-06-10  48  		 * So change skb->data before calling it and change back to
0b5c9db1b11d317 Jiri Pirko        2011-06-10  49  		 * original position later
0b5c9db1b11d317 Jiri Pirko        2011-06-10  50  		 */
0b5c9db1b11d317 Jiri Pirko        2011-06-10  51  		skb_push(skb, offset);
cbe7128c4b92e20 Toshiaki Makita   2018-03-13  52  		skb = *skbp = vlan_insert_inner_tag(skb, skb->vlan_proto,
cbe7128c4b92e20 Toshiaki Makita   2018-03-13  53  						    skb->vlan_tci, skb->mac_len);
0b5c9db1b11d317 Jiri Pirko        2011-06-10  54  		if (!skb)
0b5c9db1b11d317 Jiri Pirko        2011-06-10  55  			return false;
0b5c9db1b11d317 Jiri Pirko        2011-06-10  56  		skb_pull(skb, offset + VLAN_HLEN);
0b5c9db1b11d317 Jiri Pirko        2011-06-10  57  		skb_reset_mac_len(skb);
0b5c9db1b11d317 Jiri Pirko        2011-06-10  58  	}
0b5c9db1b11d317 Jiri Pirko        2011-06-10  59  
3701e51382a026c Jesse Gross       2010-10-20  60  	skb->priority = vlan_get_ingress_priority(vlan_dev, skb->vlan_tci);
418a976d6c68d08 Michał Mirosław   2018-11-09  61  	__vlan_hwaccel_clear_tag(skb);
7750f403cbe5697 Patrick McHardy   2008-07-08  62  
7da82c06ded105b Jiri Pirko        2011-12-08  63  	rx_stats = this_cpu_ptr(vlan_dev_priv(vlan_dev)->vlan_pcpu_stats);
9793241fe92f7d9 Eric Dumazet      2009-11-17  64  
9618e2ffd78aaa4 Eric Dumazet      2010-06-24  65  	u64_stats_update_begin(&rx_stats->syncp);
09cca53c1656960 Eric Dumazet      2022-06-08  66  	u64_stats_inc(&rx_stats->rx_packets);
09cca53c1656960 Eric Dumazet      2022-06-08  67  	u64_stats_add(&rx_stats->rx_bytes, skb->len);
0b5c9db1b11d317 Jiri Pirko        2011-06-10  68  	if (skb->pkt_type == PACKET_MULTICAST)
09cca53c1656960 Eric Dumazet      2022-06-08  69  		u64_stats_inc(&rx_stats->rx_multicast);
9618e2ffd78aaa4 Eric Dumazet      2010-06-24  70  	u64_stats_update_end(&rx_stats->syncp);
3701e51382a026c Jesse Gross       2010-10-20  71  
3701e51382a026c Jesse Gross       2010-10-20  72  	return true;
7750f403cbe5697 Patrick McHardy   2008-07-08  73  }
22d1ba74bbafa96 Patrick McHardy   2008-07-08  74  

:::::: The code at line 23 was first introduced by commit
:::::: 3701e51382a026cba10c60b03efabe534fba4ca4 vlan: Centralize handling of hardware acceleration.

:::::: TO: Jesse Gross <jesse@nicira.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
