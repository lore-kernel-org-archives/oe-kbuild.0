Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB0518638
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 10:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707128064; cv=none; b=ps1fX8bu2oY2eZEWTPQR7pVEYlcJ6d50KP0YNU2Qwnq1RF2viU9ucN+AvDSYJo8Pq2IQxfDfSMJ0W86Tj2Dzm7UwGM4c8j5fDmNixEvNPb4hYdqWxBTSovhPFpbaHIkjseQfumyLjXGJLzxbTZPiuUI+zy9908M8Nd5YnJGHcmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707128064; c=relaxed/simple;
	bh=FpIpnBLzKI7vtwYirzkwPRvtLdD+dQ02+Zca8nIR50E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h/Cq8gWcsKGLIkGEoqGqxuT87XOkHyioV8Lr8vkPstU6dKTIo4yLUqiRLJpVBPt5jBIvHR3Eq2lXLBT+e2N1sBQLrr2sBGdpCmWd+VlALgGVijaWjajpdb+nW3wZZeSWibyBJiim1dLuHOkGvHsJhcC7iW6HKvp16BKvkyDClPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckKP0LTU; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckKP0LTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707128062; x=1738664062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FpIpnBLzKI7vtwYirzkwPRvtLdD+dQ02+Zca8nIR50E=;
  b=ckKP0LTUIker5OwEcHlR6+9PtR8XFdlp2X3qBt7m0Nsv0pEZq43tHakz
   Uj0eFc4H1r23xctW7nfJjj8YTLzT7qfbIPHecxM/2j0T87OE5gEZzGNQT
   QU69NBsxT0nZzYpdnyqGQGyOottDr9M8aALtQJUZFwRcpkNu2b1E3DgyR
   +QG0ST6qrnuzhpL48xzu2oWXupCwzVpp0nMXPRvatRWVEj/1Hbhq0n2yk
   HAFewiIABPY/Xqexbl7xjWWI0rxe1bBaFaWeJCVKmZ8eAsJdxcnDx5p8J
   YhybsPmVjvddxeSWpYFWxjfw4Ed9GTicEys1Aas9fb80LodJpHvA8FD0W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="394914868"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="394914868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 02:14:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1002457"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2024 02:14:20 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWvzW-0000M4-1A;
	Mon, 05 Feb 2024 10:14:18 +0000
Date: Mon, 5 Feb 2024 18:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:5.4-spi 10/41] net/wireguard/compat/compat.h:
 linux/ip.h is included more than once.
Message-ID: <202402051806.Z3KZ7cWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-spi
head:   f18d6b8720893df4172d217fd074ba23ac53a7a7
commit: eb31f9fb1fa2612c9024fcd18b95e511df50a1e5 [10/41] net: wireguard: update wireguard compat
:::::: branch date: 2 years, 7 months ago
:::::: commit date: 2 years, 11 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402051806.Z3KZ7cWt-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   net/wireguard/compat/compat.h: linux/mm.h is included more than once.
   net/wireguard/compat/compat.h: net/netlink.h is included more than once.
   net/wireguard/compat/compat.h: linux/rcupdate.h is included more than once.
>> net/wireguard/compat/compat.h: linux/ip.h is included more than once.
   net/wireguard/compat/compat.h: linux/random.h is included more than once.
   net/wireguard/compat/compat.h: linux/siphash.h is included more than once.
   net/wireguard/compat/compat.h: net/genetlink.h is included more than once.
   net/wireguard/compat/compat.h: linux/skbuff.h is included more than once.
   net/wireguard/compat/compat.h: linux/slab.h is included more than once.
   net/wireguard/compat/compat.h: linux/cache.h is included more than once.
   net/wireguard/compat/compat.h: linux/vmalloc.h is included more than once.
   net/wireguard/compat/compat.h: linux/atomic.h is included more than once.
>> net/wireguard/compat/compat.h: linux/kernel.h is included more than once.
   net/wireguard/compat/compat.h: net/ipv6.h is included more than once.
   net/wireguard/compat/compat.h: linux/netdevice.h is included more than once.

vim +939 net/wireguard/compat/compat.h

   934	
   935	#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0) && LINUX_VERSION_CODE >= KERNEL_VERSION(5, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 102) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 178) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 223) && LINUX_VERSION_CODE > KERNEL_VERSION(4, 10, 0)) || LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 259) || defined(ISRHEL8) || defined(ISUBUNTU1804)
   936	#include <linux/icmpv6.h>
   937	#include <net/icmp.h>
   938	#if IS_ENABLED(CONFIG_NF_NAT)
 > 939	#include <linux/ip.h>
   940	#include <net/ipv6.h>
   941	#include <net/netfilter/nf_conntrack.h>
   942	#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 0) && !defined(ISRHEL8)
   943	#include <net/netfilter/nf_nat_core.h>
   944	#endif
   945	static inline void __compat_icmp_ndo_send(struct sk_buff *skb_in, int type, int code, __be32 info)
   946	{
   947		struct sk_buff *cloned_skb = NULL;
   948		enum ip_conntrack_info ctinfo;
   949		struct nf_conn *ct;
   950		__be32 orig_ip;
   951	
   952		ct = nf_ct_get(skb_in, &ctinfo);
   953		if (!ct || !(ct->status & IPS_SRC_NAT)) {
   954			memset(skb_in->cb, 0, sizeof(skb_in->cb));
   955			icmp_send(skb_in, type, code, info);
   956			return;
   957		}
   958	
   959		if (skb_shared(skb_in))
   960			skb_in = cloned_skb = skb_clone(skb_in, GFP_ATOMIC);
   961	
   962		if (unlikely(!skb_in || skb_network_header(skb_in) < skb_in->head ||
   963		    (skb_network_header(skb_in) + sizeof(struct iphdr)) >
   964		    skb_tail_pointer(skb_in) || skb_ensure_writable(skb_in,
   965		    skb_network_offset(skb_in) + sizeof(struct iphdr))))
   966			goto out;
   967	
   968		orig_ip = ip_hdr(skb_in)->saddr;
   969		ip_hdr(skb_in)->saddr = ct->tuplehash[0].tuple.src.u3.ip;
   970		memset(skb_in->cb, 0, sizeof(skb_in->cb));
   971		icmp_send(skb_in, type, code, info);
   972		ip_hdr(skb_in)->saddr = orig_ip;
   973	out:
   974		consume_skb(cloned_skb);
   975	}
   976	static inline void __compat_icmpv6_ndo_send(struct sk_buff *skb_in, u8 type, u8 code, __u32 info)
   977	{
   978		struct sk_buff *cloned_skb = NULL;
   979		enum ip_conntrack_info ctinfo;
   980		struct in6_addr orig_ip;
   981		struct nf_conn *ct;
   982	
   983		ct = nf_ct_get(skb_in, &ctinfo);
   984		if (!ct || !(ct->status & IPS_SRC_NAT)) {
   985			memset(skb_in->cb, 0, sizeof(skb_in->cb));
   986			icmpv6_send(skb_in, type, code, info);
   987			return;
   988		}
   989	
   990		if (skb_shared(skb_in))
   991			skb_in = cloned_skb = skb_clone(skb_in, GFP_ATOMIC);
   992	
   993		if (unlikely(!skb_in || skb_network_header(skb_in) < skb_in->head ||
   994		    (skb_network_header(skb_in) + sizeof(struct ipv6hdr)) >
   995		    skb_tail_pointer(skb_in) || skb_ensure_writable(skb_in,
   996		    skb_network_offset(skb_in) + sizeof(struct ipv6hdr))))
   997			goto out;
   998	
   999		orig_ip = ipv6_hdr(skb_in)->saddr;
  1000		ipv6_hdr(skb_in)->saddr = ct->tuplehash[0].tuple.src.u3.in6;
  1001		memset(skb_in->cb, 0, sizeof(skb_in->cb));
  1002		icmpv6_send(skb_in, type, code, info);
  1003		ipv6_hdr(skb_in)->saddr = orig_ip;
  1004	out:
  1005		consume_skb(cloned_skb);
  1006	}
  1007	#else
  1008	static inline void __compat_icmp_ndo_send(struct sk_buff *skb_in, int type, int code, __be32 info)
  1009	{
  1010		memset(skb_in->cb, 0, sizeof(skb_in->cb));
  1011		icmp_send(skb_in, type, code, info);
  1012	}
  1013	static inline void __compat_icmpv6_ndo_send(struct sk_buff *skb_in, u8 type, u8 code, __u32 info)
  1014	{
  1015		memset(skb_in->cb, 0, sizeof(skb_in->cb));
  1016		icmpv6_send(skb_in, type, code, info);
  1017	}
  1018	#endif
  1019	#define icmp_ndo_send __compat_icmp_ndo_send
  1020	#define icmpv6_ndo_send __compat_icmpv6_ndo_send
  1021	#endif
  1022	
  1023	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 10, 0)
  1024	#define COMPAT_CANNOT_USE_MAX_MTU
  1025	#endif
  1026	
  1027	#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 14) && LINUX_VERSION_CODE >= KERNEL_VERSION(5, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 29) && !defined(ISUBUNTU1910) && !defined(ISUBUNTU1904) && !defined(ISRHEL8))
  1028	#include <linux/skbuff.h>
  1029	#include <net/sch_generic.h>
  1030	static inline void skb_reset_redirect(struct sk_buff *skb)
  1031	{
  1032	#ifdef CONFIG_NET_SCHED
  1033		skb_reset_tc(skb);
  1034	#endif
  1035	}
  1036	#endif
  1037	
  1038	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0) && !defined(ISRHEL7)
  1039	#define skb_get_hash skb_get_rxhash
  1040	#endif
  1041	
  1042	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 15, 0) && !defined(ISRHEL7)
  1043	#define hash rxhash
  1044	#define l4_hash l4_rxhash
  1045	#endif
  1046	
  1047	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0) && !defined(ISRHEL7)
  1048	#define sw_hash ignore_df = 0; skb->nf_trace = skb->ooo_okay
  1049	#endif
  1050	
  1051	#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 3, 0)
  1052	#define pre_exit exit
  1053	#endif
  1054	
  1055	#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
  1056	#include <linux/skbuff.h>
> 1057	#include <linux/ip.h>
  1058	#include <linux/ipv6.h>
  1059	static inline __be16 ip_tunnel_parse_protocol(const struct sk_buff *skb)
  1060	{
  1061		if (skb_network_header(skb) >= skb->head &&
  1062		    (skb_network_header(skb) + sizeof(struct iphdr)) <= skb_tail_pointer(skb) &&
  1063		    ip_hdr(skb)->version == 4)
  1064			return htons(ETH_P_IP);
  1065		if (skb_network_header(skb) >= skb->head &&
  1066		    (skb_network_header(skb) + sizeof(struct ipv6hdr)) <= skb_tail_pointer(skb) &&
  1067		    ipv6_hdr(skb)->version == 6)
  1068			return htons(ETH_P_IPV6);
  1069		return 0;
  1070	}
  1071	#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 1, 0) || defined(ISRHEL8)
  1072	static const struct header_ops ip_tunnel_header_ops = { .parse_protocol = ip_tunnel_parse_protocol };
  1073	#else
  1074	#define header_ops hard_header_len
  1075	#define ip_tunnel_header_ops *(char *)0 - (char *)0
  1076	#endif
  1077	#endif
  1078	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
