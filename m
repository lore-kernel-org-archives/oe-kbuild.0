Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E241F1537
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Nov 2025 01:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762046799; cv=none; b=PH3Uibk2lvjs1TSVAtTjkecrzy2tUM+P7GU8Ts8LeXqx0R7xOmvt9N7xsUK3F6oAZ3GaVy26Bh+/nvzpdiajBHNijneQP2ttb9WFqSGhm46hUEWoltSYIrtrW04/Hml7hNxxA4Mvs9lUqnVP9tKqB85rHsikmhF7ehFhCyCPuV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762046799; c=relaxed/simple;
	bh=0EiiXzw8WwWRp8JZE0l/joV2Eawhgc+EXMBS9VuAc9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WaxLNIr7ozx/BIbSYle0rxTKwqamXBWfZlplis39lUBvHauz5hcfFQM/8Ur7+pvjqlqpDKDLCNEwpRPxSZZZHRrutNOWHuRBbGsVYtF6ey7UO0yj1N33wTeJXirbINGWLFXEdN/SolCmLksR7oVCdYlAKGV8qw1tq8wFdSvJ6b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFEWww3s; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFEWww3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762046797; x=1793582797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0EiiXzw8WwWRp8JZE0l/joV2Eawhgc+EXMBS9VuAc9s=;
  b=nFEWww3suk2sWJlXvBuqyMSoHFd3LUhLvZQvheuGRuU5s8uvzxkrCvFq
   wZ8ASAnBGOIHWX98TOaqm53uzjjmnB39x60sV3rops/vVQBKwjYXJYg/W
   UFeFp+6BHLS+spWbOn115iznMZEq1Ao7RZtTTaZpTWyTYqM4W4jtMJs7y
   2Dv5NkpGgrxAR826o0KiXe8Gfpyd2vGOBQN9dCp2vY30C/9GIU7nS6GHD
   fFyfCYwAEuogW1spDwC003kfYgTmdWX+1VjMfVCbJQp7CC5msydiVWk1I
   fkRwVqxdAODyBrzvT0OUCB+k4V0MDNwGUyUxHQ1yn+OxmbggQKuc25+OE
   w==;
X-CSE-ConnectionGUID: kHrSQfVDShSshUAbYRtPag==
X-CSE-MsgGUID: 9lAVOSfERhe/CFpFGdlKFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64266004"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="64266004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 18:26:36 -0700
X-CSE-ConnectionGUID: myMM6PgFSNmaV/mOhQR8zw==
X-CSE-MsgGUID: eCKt/jgUSdWW+wIecmsR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="187004191"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Nov 2025 18:26:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFMrU-000OsO-0t;
	Sun, 02 Nov 2025 01:26:29 +0000
Date: Sun, 2 Nov 2025 09:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/2] audit: include source and destination ports to
 NETFILTER_PKT
Message-ID: <202511020905.3A5Sbhb2-lkp@intel.com>
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
In-Reply-To: <6ac2baf0d5ae176cbd3279a4dff9e2c7750c6d45.1761918165.git.rrobaina@redhat.com>
References: <6ac2baf0d5ae176cbd3279a4dff9e2c7750c6d45.1761918165.git.rrobaina@redhat.com>
TO: Ricardo Robaina <rrobaina@redhat.com>
TO: audit@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: netfilter-devel@vger.kernel.org
TO: coreteam@netfilter.org
CC: paul@paul-moore.com
CC: eparis@redhat.com
CC: fw@strlen.de
CC: pablo@netfilter.org
CC: kadlec@netfilter.org
CC: Ricardo Robaina <rrobaina@redhat.com>

Hi Ricardo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on netfilter-nf/main linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Robaina/audit-add-audit_log_packet_ip4-and-audit_log_packet_ip6-helper-functions/20251031-220605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git next
patch link:    https://lore.kernel.org/r/6ac2baf0d5ae176cbd3279a4dff9e2c7750c6d45.1761918165.git.rrobaina%40redhat.com
patch subject: [PATCH v4 2/2] audit: include source and destination ports to NETFILTER_PKT
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-141-20251102 (https://download.01.org/0day-ci/archive/20251102/202511020905.3A5Sbhb2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511020905.3A5Sbhb2-lkp@intel.com/

smatch warnings:
kernel/audit.c:2555 audit_log_packet_ip4() warn: statement has no effect 'struct'
kernel/audit.c:2616 audit_log_packet_ip6() warn: statement has no effect 'struct'

vim +/struct +2555 kernel/audit.c

4b7d248b3a1de4 Richard Guy Briggs 2019-01-22  2543  
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2544  bool audit_log_packet_ip4(struct audit_buffer *ab, struct sk_buff *skb)
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2545  {
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2546  	struct iphdr _iph;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2547  	const struct iphdr *ih;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2548  
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2549  	ih = skb_header_pointer(skb, skb_network_offset(skb), sizeof(_iph), &_iph);
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2550  	if (!ih)
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2551  		return false;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2552  
3139583951cf29 Ricardo Robaina    2025-10-31  2553  	switch (ih->protocol) {
3139583951cf29 Ricardo Robaina    2025-10-31  2554  	case IPPROTO_TCP:
3139583951cf29 Ricardo Robaina    2025-10-31 @2555  		struct tcphdr _tcph;
3139583951cf29 Ricardo Robaina    2025-10-31  2556  		const struct tcphdr *th;
3139583951cf29 Ricardo Robaina    2025-10-31  2557  
3139583951cf29 Ricardo Robaina    2025-10-31  2558  		th = skb_header_pointer(skb, skb_transport_offset(skb), sizeof(_tcph), &_tcph);
3139583951cf29 Ricardo Robaina    2025-10-31  2559  		if (!th)
3139583951cf29 Ricardo Robaina    2025-10-31  2560  			return false;
3139583951cf29 Ricardo Robaina    2025-10-31  2561  
3139583951cf29 Ricardo Robaina    2025-10-31  2562  		audit_log_format(ab, " saddr=%pI4 daddr=%pI4 proto=%hhu sport=%hu dport=%hu",
3139583951cf29 Ricardo Robaina    2025-10-31  2563  				 &ih->saddr, &ih->daddr, ih->protocol,
3139583951cf29 Ricardo Robaina    2025-10-31  2564  				 ntohs(th->source), ntohs(th->dest));
3139583951cf29 Ricardo Robaina    2025-10-31  2565  		break;
3139583951cf29 Ricardo Robaina    2025-10-31  2566  	case IPPROTO_UDP:
3139583951cf29 Ricardo Robaina    2025-10-31  2567  	case IPPROTO_UDPLITE:
3139583951cf29 Ricardo Robaina    2025-10-31  2568  		struct udphdr _udph;
3139583951cf29 Ricardo Robaina    2025-10-31  2569  		const struct udphdr *uh;
3139583951cf29 Ricardo Robaina    2025-10-31  2570  
3139583951cf29 Ricardo Robaina    2025-10-31  2571  		uh = skb_header_pointer(skb, skb_transport_offset(skb), sizeof(_udph), &_udph);
3139583951cf29 Ricardo Robaina    2025-10-31  2572  		if (!uh)
3139583951cf29 Ricardo Robaina    2025-10-31  2573  			return false;
3139583951cf29 Ricardo Robaina    2025-10-31  2574  
3139583951cf29 Ricardo Robaina    2025-10-31  2575  		audit_log_format(ab, " saddr=%pI4 daddr=%pI4 proto=%hhu sport=%hu dport=%hu",
3139583951cf29 Ricardo Robaina    2025-10-31  2576  				 &ih->saddr, &ih->daddr, ih->protocol,
3139583951cf29 Ricardo Robaina    2025-10-31  2577  				 ntohs(uh->source), ntohs(uh->dest));
3139583951cf29 Ricardo Robaina    2025-10-31  2578  		break;
3139583951cf29 Ricardo Robaina    2025-10-31  2579  	case IPPROTO_SCTP:
3139583951cf29 Ricardo Robaina    2025-10-31  2580  		struct sctphdr _sctph;
3139583951cf29 Ricardo Robaina    2025-10-31  2581  		const struct sctphdr *sh;
3139583951cf29 Ricardo Robaina    2025-10-31  2582  
3139583951cf29 Ricardo Robaina    2025-10-31  2583  		sh = skb_header_pointer(skb, skb_transport_offset(skb), sizeof(_sctph), &_sctph);
3139583951cf29 Ricardo Robaina    2025-10-31  2584  		if (!sh)
3139583951cf29 Ricardo Robaina    2025-10-31  2585  			return false;
3139583951cf29 Ricardo Robaina    2025-10-31  2586  
3139583951cf29 Ricardo Robaina    2025-10-31  2587  		audit_log_format(ab, " saddr=%pI4 daddr=%pI4 proto=%hhu sport=%hu dport=%hu",
3139583951cf29 Ricardo Robaina    2025-10-31  2588  				 &ih->saddr, &ih->daddr, ih->protocol,
3139583951cf29 Ricardo Robaina    2025-10-31  2589  				 ntohs(sh->source), ntohs(sh->dest));
3139583951cf29 Ricardo Robaina    2025-10-31  2590  		break;
3139583951cf29 Ricardo Robaina    2025-10-31  2591  	default:
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2592  		audit_log_format(ab, " saddr=%pI4 daddr=%pI4 proto=%hhu",
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2593  				 &ih->saddr, &ih->daddr, ih->protocol);
3139583951cf29 Ricardo Robaina    2025-10-31  2594  	}
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2595  
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2596  	return true;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2597  }
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2598  EXPORT_SYMBOL(audit_log_packet_ip4);
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2599  
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2600  bool audit_log_packet_ip6(struct audit_buffer *ab, struct sk_buff *skb)
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2601  {
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2602  	struct ipv6hdr _ip6h;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2603  	const struct ipv6hdr *ih;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2604  	u8 nexthdr;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2605  	__be16 frag_off;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2606  
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2607  	ih = skb_header_pointer(skb, skb_network_offset(skb), sizeof(_ip6h), &_ip6h);
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2608  	if (!ih)
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2609  		return false;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2610  
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2611  	nexthdr = ih->nexthdr;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2612  	ipv6_skip_exthdr(skb, skb_network_offset(skb) + sizeof(_ip6h), &nexthdr, &frag_off);
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2613  
3139583951cf29 Ricardo Robaina    2025-10-31  2614  	switch (nexthdr) {
3139583951cf29 Ricardo Robaina    2025-10-31  2615  	case IPPROTO_TCP:
3139583951cf29 Ricardo Robaina    2025-10-31 @2616  		struct tcphdr _tcph;
3139583951cf29 Ricardo Robaina    2025-10-31  2617  		const struct tcphdr *th;
3139583951cf29 Ricardo Robaina    2025-10-31  2618  
3139583951cf29 Ricardo Robaina    2025-10-31  2619  		th = skb_header_pointer(skb, skb_transport_offset(skb), sizeof(_tcph), &_tcph);
3139583951cf29 Ricardo Robaina    2025-10-31  2620  		if (!th)
3139583951cf29 Ricardo Robaina    2025-10-31  2621  			return false;
3139583951cf29 Ricardo Robaina    2025-10-31  2622  
3139583951cf29 Ricardo Robaina    2025-10-31  2623  		audit_log_format(ab, " saddr=%pI6c daddr=%pI6c proto=%hhu sport=%hu dport=%hu",
3139583951cf29 Ricardo Robaina    2025-10-31  2624  				 &ih->saddr, &ih->daddr, nexthdr,
3139583951cf29 Ricardo Robaina    2025-10-31  2625  				 ntohs(th->source), ntohs(th->dest));
3139583951cf29 Ricardo Robaina    2025-10-31  2626  		break;
3139583951cf29 Ricardo Robaina    2025-10-31  2627  	case IPPROTO_UDP:
3139583951cf29 Ricardo Robaina    2025-10-31  2628  	case IPPROTO_UDPLITE:
3139583951cf29 Ricardo Robaina    2025-10-31  2629  		struct udphdr _udph;
3139583951cf29 Ricardo Robaina    2025-10-31  2630  		const struct udphdr *uh;
3139583951cf29 Ricardo Robaina    2025-10-31  2631  
3139583951cf29 Ricardo Robaina    2025-10-31  2632  		uh = skb_header_pointer(skb, skb_transport_offset(skb), sizeof(_udph), &_udph);
3139583951cf29 Ricardo Robaina    2025-10-31  2633  		if (!uh)
3139583951cf29 Ricardo Robaina    2025-10-31  2634  			return false;
3139583951cf29 Ricardo Robaina    2025-10-31  2635  
3139583951cf29 Ricardo Robaina    2025-10-31  2636  		audit_log_format(ab, " saddr=%pI6c daddr=%pI6c proto=%hhu sport=%hu dport=%hu",
3139583951cf29 Ricardo Robaina    2025-10-31  2637  				 &ih->saddr, &ih->daddr, nexthdr,
3139583951cf29 Ricardo Robaina    2025-10-31  2638  				 ntohs(uh->source), ntohs(uh->dest));
3139583951cf29 Ricardo Robaina    2025-10-31  2639  		break;
3139583951cf29 Ricardo Robaina    2025-10-31  2640  	case IPPROTO_SCTP:
3139583951cf29 Ricardo Robaina    2025-10-31  2641  		struct sctphdr _sctph;
3139583951cf29 Ricardo Robaina    2025-10-31  2642  		const struct sctphdr *sh;
3139583951cf29 Ricardo Robaina    2025-10-31  2643  
3139583951cf29 Ricardo Robaina    2025-10-31  2644  		sh = skb_header_pointer(skb, skb_transport_offset(skb), sizeof(_sctph), &_sctph);
3139583951cf29 Ricardo Robaina    2025-10-31  2645  		if (!sh)
3139583951cf29 Ricardo Robaina    2025-10-31  2646  			return false;
3139583951cf29 Ricardo Robaina    2025-10-31  2647  
3139583951cf29 Ricardo Robaina    2025-10-31  2648  		audit_log_format(ab, " saddr=%pI6c daddr=%pI6c proto=%hhu sport=%hu dport=%hu",
3139583951cf29 Ricardo Robaina    2025-10-31  2649  				 &ih->saddr, &ih->daddr, nexthdr,
3139583951cf29 Ricardo Robaina    2025-10-31  2650  				 ntohs(sh->source), ntohs(sh->dest));
3139583951cf29 Ricardo Robaina    2025-10-31  2651  		break;
3139583951cf29 Ricardo Robaina    2025-10-31  2652  	default:
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2653  		audit_log_format(ab, " saddr=%pI6c daddr=%pI6c proto=%hhu",
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2654  				 &ih->saddr, &ih->daddr, nexthdr);
3139583951cf29 Ricardo Robaina    2025-10-31  2655  	}
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2656  
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2657  	return true;
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2658  }
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2659  EXPORT_SYMBOL(audit_log_packet_ip6);
3280a1e8d8a110 Ricardo Robaina    2025-10-31  2660  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
