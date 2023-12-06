Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941F12E4F
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUl4zarX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701846046; x=1733382046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LihASOu1TDKINt5lYLlVnAitJbftSxf1i/ZLJIzsFyY=;
  b=LUl4zarXfKJqaQU8emjX7FP/U83lFO98SWsKjpt4AZRbMxWrYOuNQFGk
   DA4eeohCktSObUzMRfIHYY6ljFmlr2TLefdv52h5zWhTtUyXSQ6ha0eQR
   T05YgX248Xz82hnOpkqxlItfqyV7YaUOYcPGcCt9+3KhjkJOh77ZyIoKA
   5HScetIgKSliJL+PDLBCVkhYE8GECpQoJIVQAVeDXS/Di3/Q8yFK2ORfW
   COtF6muG0f8H+eOBVQlic2d+oTThLHea08dxBCOxu3xL/Juylj5UwKNOX
   klyYED7kmWRy0OMyZxXone3SgEvFgUoA+3BBLR4kK0bel1ZnE1RqnFDmB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458339931"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="458339931"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 23:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889242386"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="889242386"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 23:00:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAltg-000AR2-0k;
	Wed, 06 Dec 2023 07:00:40 +0000
Date: Wed, 6 Dec 2023 15:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/31] include/net/udplite.h:39:17: sparse: sparse:
 too many arguments for function __builtin_expect
Message-ID: <202312061402.bXZh1aBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/net/udplite.h:39:17: sparse: sparse: too many arguments for function __builtin_expect"
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
:::::: branch date: 4 days ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-122-20231206 (https://download.01.org/0day-ci/archive/20231206/202312061402.bXZh1aBr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061402.bXZh1aBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312061402.bXZh1aBr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pao_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:495:17: sparse: sparse: undefined identifier 'segs_nr'
   include/net/udp.h:495:17: sparse: sparse: symbol 'pto_tmp__' has multiple initializers (originally initialized at include/net/udp.h:495)
   include/net/udp.h:496:17: sparse: sparse: symbol 'kfree_skb' redeclared with different type (incompatible argument 1 (different base types)):
   include/net/udp.h:496:17: sparse:    int static [signed] [toplevel] kfree_skb( ... )
   net/ipv6/ip6_checksum.c: note: in included file (through include/linux/ip.h, include/net/ip.h):
   include/linux/skbuff.h:1232:20: sparse: note: previously declared as:
   include/linux/skbuff.h:1232:20: sparse:    void static inline [gnu_inline] [toplevel] kfree_skb( ... )
   net/ipv6/ip6_checksum.c: note: in included file:
>> include/net/udplite.h:39:17: sparse: sparse: too many arguments for function __builtin_expect
   include/net/udplite.h:51:17: sparse: sparse: too many arguments for function __builtin_expect
   net/ipv6/ip6_checksum.c: note: in included file (through include/net/udplite.h):
   include/net/ip6_checksum.h:41:29: sparse: sparse: undefined identifier 'csum_ipv6_magic'
   include/net/ip6_checksum.h:79:16: sparse: sparse: undefined identifier 'csum_ipv6_magic'

vim +39 include/net/udplite.h

ba4e58eca8aa94 Gerrit Renker  2006-11-27  27  
ba4e58eca8aa94 Gerrit Renker  2006-11-27  28  /*
ba4e58eca8aa94 Gerrit Renker  2006-11-27  29   * 	Checksumming routines
ba4e58eca8aa94 Gerrit Renker  2006-11-27  30   */
ba4e58eca8aa94 Gerrit Renker  2006-11-27  31  static inline int udplite_checksum_init(struct sk_buff *skb, struct udphdr *uh)
ba4e58eca8aa94 Gerrit Renker  2006-11-27  32  {
ba4e58eca8aa94 Gerrit Renker  2006-11-27  33  	u16 cscov;
ba4e58eca8aa94 Gerrit Renker  2006-11-27  34  
ba4e58eca8aa94 Gerrit Renker  2006-11-27  35          /* In UDPv4 a zero checksum means that the transmitter generated no
ba4e58eca8aa94 Gerrit Renker  2006-11-27  36           * checksum. UDP-Lite (like IPv6) mandates checksums, hence packets
ba4e58eca8aa94 Gerrit Renker  2006-11-27  37           * with a zero checksum field are illegal.                            */
ba4e58eca8aa94 Gerrit Renker  2006-11-27  38  	if (uh->check == 0) {
ba7a46f16dd29f Joe Perches    2014-11-11 @39  		net_dbg_ratelimited("UDPLite: zeroed checksum field\n");
ba4e58eca8aa94 Gerrit Renker  2006-11-27  40  		return 1;
ba4e58eca8aa94 Gerrit Renker  2006-11-27  41  	}
ba4e58eca8aa94 Gerrit Renker  2006-11-27  42  
ba4e58eca8aa94 Gerrit Renker  2006-11-27  43  	cscov = ntohs(uh->len);
ba4e58eca8aa94 Gerrit Renker  2006-11-27  44  
ba4e58eca8aa94 Gerrit Renker  2006-11-27  45  	if (cscov == 0)		 /* Indicates that full coverage is required. */
759e5d006462d5 Herbert Xu     2007-03-25  46  		;
ba4e58eca8aa94 Gerrit Renker  2006-11-27  47  	else if (cscov < 8  || cscov > skb->len) {
ba4e58eca8aa94 Gerrit Renker  2006-11-27  48  		/*
ba4e58eca8aa94 Gerrit Renker  2006-11-27  49  		 * Coverage length violates RFC 3828: log and discard silently.
ba4e58eca8aa94 Gerrit Renker  2006-11-27  50  		 */
ba7a46f16dd29f Joe Perches    2014-11-11  51  		net_dbg_ratelimited("UDPLite: bad csum coverage %d/%d\n",
ba4e58eca8aa94 Gerrit Renker  2006-11-27  52  				    cscov, skb->len);
ba4e58eca8aa94 Gerrit Renker  2006-11-27  53  		return 1;
ba4e58eca8aa94 Gerrit Renker  2006-11-27  54  
759e5d006462d5 Herbert Xu     2007-03-25  55  	} else if (cscov < skb->len) {
ba4e58eca8aa94 Gerrit Renker  2006-11-27  56          	UDP_SKB_CB(skb)->partial_cov = 1;
ba4e58eca8aa94 Gerrit Renker  2006-11-27  57  		UDP_SKB_CB(skb)->cscov = cscov;
759e5d006462d5 Herbert Xu     2007-03-25  58  		if (skb->ip_summed == CHECKSUM_COMPLETE)
ba4e58eca8aa94 Gerrit Renker  2006-11-27  59  			skb->ip_summed = CHECKSUM_NONE;
15f35d49c93f4f Alexey Kodanev 2018-02-15  60  		skb->csum_valid = 0;
ba4e58eca8aa94 Gerrit Renker  2006-11-27  61          }
ba4e58eca8aa94 Gerrit Renker  2006-11-27  62  
759e5d006462d5 Herbert Xu     2007-03-25  63  	return 0;
ba4e58eca8aa94 Gerrit Renker  2006-11-27  64  }
ba4e58eca8aa94 Gerrit Renker  2006-11-27  65  

:::::: The code at line 39 was first introduced by commit
:::::: ba7a46f16dd29f93303daeb1fee8af316c5a07f4 net: Convert LIMIT_NETDEBUG to net_dbg_ratelimited

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
