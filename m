Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F23023A99E
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763199708; cv=none; b=Y22uH4rbsZwdvI24q+13GxOmgpSRowD5bTlV58NWZIykfeamGQ37nQsbsYEEnlVtxNo2Et60DRhrWbPnPIucPgJqVQxZzfqQ2ayFTi+gI4V4KiyjSs9O3lz3nmY0yS1qd42IMHXHq5WNI4XEB7ZP7MnWdEXgByJ6pPbglCL3OMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763199708; c=relaxed/simple;
	bh=d993GpahFTqh1hMb/dT4BH3jsytfkqRfc343ZscWArw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ytp3JVYupuquFlA9YwYrJFhtKmnH3tt3rZrJQpmwzcf8rec7u7AykFPvLxn/LxfPYKxk8uVLKg9QoB5EOZWb+ayO5mcnJ8YjiPb4TXt1DVCTqT2o71qYb4SoQS70NyX7T/ao4eqgejXazPd8XRPaKl1GOtN7qLxed3up+n+HR6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkUY/M3w; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkUY/M3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763199706; x=1794735706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d993GpahFTqh1hMb/dT4BH3jsytfkqRfc343ZscWArw=;
  b=IkUY/M3wXUIXmj8H/IxMfHf2I+K7b8AVsRLiTtu0qhG0XgXyKJIcoGi3
   cZEu4CGzyZJDR+bt9Iv05CX4XvjW/iarhCUweCKZLJknk3BT584EABAJd
   iZ7jGybi45ySEuV11wrH/Nflwe3P4CEjUWU7TvE8XpKTFcU4422Yv9XZB
   1nfrsyniUtjPsbXvTMQnB+uqwk0FTnxQYIAnhf7O3sDCb+8hSEfXr2UmA
   +buPcxLlOV9tX/Gd2zeeqnCUL88p3ROENfbFZR2ZuJmCpvbB2pwkWhlCh
   BBtFzLSlW2wnJ2f81so5A52IvE1XDWYcMIw49stQocloXtBfqJzvKSR8h
   w==;
X-CSE-ConnectionGUID: aYM2y9X1QYeE72kxkYROqA==
X-CSE-MsgGUID: LoFrJ4D+QdaylEjjGFP0qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65313700"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65313700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 01:41:46 -0800
X-CSE-ConnectionGUID: AGM87VknSQ+edjSSaN3EuA==
X-CSE-MsgGUID: viuVk4CGShqjat9ebRM6tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189670213"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Nov 2025 01:41:44 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKCms-0007r1-1i;
	Sat, 15 Nov 2025 09:41:42 +0000
Date: Sat, 15 Nov 2025 17:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 1/2] audit: add audit_log_nf_skb helper function
Message-ID: <202511151759.0Bs9YatW-lkp@intel.com>
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
In-Reply-To: <e5a5be5997fc2b8f7cc5f92e48b6d42158aff2c3.1763122537.git.rrobaina@redhat.com>
References: <e5a5be5997fc2b8f7cc5f92e48b6d42158aff2c3.1763122537.git.rrobaina@redhat.com>
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
[also build test WARNING on netfilter-nf/main linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Robaina/audit-add-audit_log_nf_skb-helper-function/20251114-204406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git next
patch link:    https://lore.kernel.org/r/e5a5be5997fc2b8f7cc5f92e48b6d42158aff2c3.1763122537.git.rrobaina%40redhat.com
patch subject: [PATCH v7 1/2] audit: add audit_log_nf_skb helper function
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: sh-randconfig-r071-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151759.0Bs9YatW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511151759.0Bs9YatW-lkp@intel.com/

smatch warnings:
kernel/audit.c:2533 audit_log_nf_skb() warn: missing unwind goto?

vim +2533 kernel/audit.c

a51d9eaa41866a Kees Cook       2012-07-25  2492  
4fde464da4ac67 Ricardo Robaina 2025-11-14  2493  int audit_log_nf_skb(struct audit_buffer *ab,
4fde464da4ac67 Ricardo Robaina 2025-11-14  2494  		     const struct sk_buff *skb, u8 nfproto)
4fde464da4ac67 Ricardo Robaina 2025-11-14  2495  {
4fde464da4ac67 Ricardo Robaina 2025-11-14  2496  	/* find the IP protocol in the case of NFPROTO_BRIDGE */
4fde464da4ac67 Ricardo Robaina 2025-11-14  2497  	if (nfproto == NFPROTO_BRIDGE) {
4fde464da4ac67 Ricardo Robaina 2025-11-14  2498  		switch (eth_hdr(skb)->h_proto) {
4fde464da4ac67 Ricardo Robaina 2025-11-14  2499  		case htons(ETH_P_IP):
4fde464da4ac67 Ricardo Robaina 2025-11-14  2500  			nfproto = NFPROTO_IPV4;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2501  			break;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2502  		case htons(ETH_P_IPV6):
4fde464da4ac67 Ricardo Robaina 2025-11-14  2503  			nfproto = NFPROTO_IPV6;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2504  			break;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2505  		default:
4fde464da4ac67 Ricardo Robaina 2025-11-14  2506  			goto unknown_proto;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2507  		}
4fde464da4ac67 Ricardo Robaina 2025-11-14  2508  	}
4fde464da4ac67 Ricardo Robaina 2025-11-14  2509  
4fde464da4ac67 Ricardo Robaina 2025-11-14  2510  	switch (nfproto) {
4fde464da4ac67 Ricardo Robaina 2025-11-14  2511  	case NFPROTO_IPV4: {
4fde464da4ac67 Ricardo Robaina 2025-11-14  2512  		struct iphdr iph;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2513  		const struct iphdr *ih;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2514  
4fde464da4ac67 Ricardo Robaina 2025-11-14  2515  		ih = skb_header_pointer(skb, skb_network_offset(skb),
4fde464da4ac67 Ricardo Robaina 2025-11-14  2516  					sizeof(iph), &iph);
4fde464da4ac67 Ricardo Robaina 2025-11-14  2517  		if (!ih)
4fde464da4ac67 Ricardo Robaina 2025-11-14  2518  			return -ENOMEM;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2519  
4fde464da4ac67 Ricardo Robaina 2025-11-14  2520  		audit_log_format(ab, " saddr=%pI4 daddr=%pI4 proto=%hhu",
4fde464da4ac67 Ricardo Robaina 2025-11-14  2521  				 &ih->saddr, &ih->daddr, ih->protocol);
4fde464da4ac67 Ricardo Robaina 2025-11-14  2522  		break;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2523  	}
4fde464da4ac67 Ricardo Robaina 2025-11-14  2524  	case NFPROTO_IPV6: {
4fde464da4ac67 Ricardo Robaina 2025-11-14  2525  		struct ipv6hdr iph;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2526  		const struct ipv6hdr *ih;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2527  		u8 nexthdr;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2528  		__be16 frag_off;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2529  
4fde464da4ac67 Ricardo Robaina 2025-11-14  2530  		ih = skb_header_pointer(skb, skb_network_offset(skb),
4fde464da4ac67 Ricardo Robaina 2025-11-14  2531  					sizeof(iph), &iph);
4fde464da4ac67 Ricardo Robaina 2025-11-14  2532  		if (!ih)
4fde464da4ac67 Ricardo Robaina 2025-11-14 @2533  			return -ENOMEM;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2534  
4fde464da4ac67 Ricardo Robaina 2025-11-14  2535  		nexthdr = ih->nexthdr;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2536  		ipv6_skip_exthdr(skb, skb_network_offset(skb) + sizeof(iph),
4fde464da4ac67 Ricardo Robaina 2025-11-14  2537  				 &nexthdr, &frag_off);
4fde464da4ac67 Ricardo Robaina 2025-11-14  2538  
4fde464da4ac67 Ricardo Robaina 2025-11-14  2539  		audit_log_format(ab, " saddr=%pI6c daddr=%pI6c proto=%hhu",
4fde464da4ac67 Ricardo Robaina 2025-11-14  2540  				 &ih->saddr, &ih->daddr, nexthdr);
4fde464da4ac67 Ricardo Robaina 2025-11-14  2541  		break;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2542  	}
4fde464da4ac67 Ricardo Robaina 2025-11-14  2543  	default:
4fde464da4ac67 Ricardo Robaina 2025-11-14  2544  		goto unknown_proto;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2545  	}
4fde464da4ac67 Ricardo Robaina 2025-11-14  2546  
4fde464da4ac67 Ricardo Robaina 2025-11-14  2547  	return 0;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2548  
4fde464da4ac67 Ricardo Robaina 2025-11-14  2549  unknown_proto:
4fde464da4ac67 Ricardo Robaina 2025-11-14  2550  	audit_log_format(ab, " saddr=? daddr=? proto=?");
4fde464da4ac67 Ricardo Robaina 2025-11-14  2551  	return -EPFNOSUPPORT;
4fde464da4ac67 Ricardo Robaina 2025-11-14  2552  }
4fde464da4ac67 Ricardo Robaina 2025-11-14  2553  EXPORT_SYMBOL(audit_log_nf_skb);
4fde464da4ac67 Ricardo Robaina 2025-11-14  2554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
