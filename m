Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0E317165
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633036; cv=none; b=AHmwU9u31/Yt60u8Zp8UrrTvvRlTY/s++AKEWK3jwMfqkzWHizFayrFPs+GzaVrR1dt2SzH/5/R9dp7ezYRJ6OuleKUO3WWydR4F9C04nSDQgPOZMhWvId1XtkGN8LUJjzds3Lw/DKvP/4d0cJUHY/2WjC1VB9iZpeGNb9ZnU68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633036; c=relaxed/simple;
	bh=t/UbZDAKmT4t5RWlc/s1gg1JVFyk1dA0CwKrCjj6OIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uagKwBUnVh8uuYoQ7Y7K6BPu9QcsYEPbAnBfO7TjdLYr7lI995MctXMeFisqzb7edp5Q+FeXaGhYooK9/YqoENGv+rlJh2BhVdQ2pAchNODXK2SZDFqvQTXXBFnWLFliEz9abYlk9HmocSwsTNy9kJT2kIT7H9iETUyNj62F3HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKZU2pCK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKZU2pCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772633034; x=1804169034;
  h=date:from:to:cc:subject:message-id;
  bh=t/UbZDAKmT4t5RWlc/s1gg1JVFyk1dA0CwKrCjj6OIg=;
  b=nKZU2pCKe7ZDKNO8H1eK7EJXnYzJZ8AWhixv9iOeF9eLZv2PBFO2ssG9
   JWUIz7YY6oGk9mZObHy5rKwuEFLVODIqRpvRFD+nLSskNdiCbh4fmkb/b
   gEAc1kFi2eGOv4qVyFseEOhLAvcsV8zqjFMZAd8dJOneCNcBwY3MIfaSk
   OQeBoGDcJOhSiuZZdVQFmTVJ3x54H5E1jVFT+UyvvnL3FXLSqiJCdWjIK
   LNbIUbRud2HjdcQ2oC4RgeAkYmuThh3LsSwIBnU3oxdb309blv1yPHqFt
   eiEzU6NWJ62Z8JKdFiVpNR22Mg1bEsBh/YoOPMEXNRYlrdy7NSEw+v7cO
   Q==;
X-CSE-ConnectionGUID: tO0eN2DSRIqBNiY8ny8uCg==
X-CSE-MsgGUID: Yy3zsJ1aSxCKC/OeDF55/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72718289"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72718289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:03:54 -0800
X-CSE-ConnectionGUID: 9Otj48HmTR6Z6FhywepE4w==
X-CSE-MsgGUID: VsBsCNw6QEqSIqi1qISJHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="218299315"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2026 06:03:52 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmpJ-000000003o7-3Idr;
	Wed, 04 Mar 2026 14:03:49 +0000
Date: Wed, 04 Mar 2026 22:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/audit.c:2533 audit_log_nf_skb() warn: missing unwind
 goto?
Message-ID: <202603042138.70Qc4Pu2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ricardo Robaina <rrobaina@redhat.com>
CC: Paul Moore <paul@paul-moore.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
commit: f19590b07cb620be1fcd5474c49515e21a05d406 audit: add audit_log_nf_skb helper function
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20260304 (https://download.01.org/0day-ci/archive/20260304/202603042138.70Qc4Pu2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603042138.70Qc4Pu2-lkp@intel.com/

smatch warnings:
kernel/audit.c:2533 audit_log_nf_skb() warn: missing unwind goto?

vim +2533 kernel/audit.c

a51d9eaa41866ab Kees Cook       2012-07-25  2492  
f19590b07cb620b Ricardo Robaina 2025-11-14  2493  int audit_log_nf_skb(struct audit_buffer *ab,
f19590b07cb620b Ricardo Robaina 2025-11-14  2494  		     const struct sk_buff *skb, u8 nfproto)
f19590b07cb620b Ricardo Robaina 2025-11-14  2495  {
f19590b07cb620b Ricardo Robaina 2025-11-14  2496  	/* find the IP protocol in the case of NFPROTO_BRIDGE */
f19590b07cb620b Ricardo Robaina 2025-11-14  2497  	if (nfproto == NFPROTO_BRIDGE) {
f19590b07cb620b Ricardo Robaina 2025-11-14  2498  		switch (eth_hdr(skb)->h_proto) {
f19590b07cb620b Ricardo Robaina 2025-11-14  2499  		case htons(ETH_P_IP):
f19590b07cb620b Ricardo Robaina 2025-11-14  2500  			nfproto = NFPROTO_IPV4;
f19590b07cb620b Ricardo Robaina 2025-11-14  2501  			break;
f19590b07cb620b Ricardo Robaina 2025-11-14  2502  		case htons(ETH_P_IPV6):
f19590b07cb620b Ricardo Robaina 2025-11-14  2503  			nfproto = NFPROTO_IPV6;
f19590b07cb620b Ricardo Robaina 2025-11-14  2504  			break;
f19590b07cb620b Ricardo Robaina 2025-11-14  2505  		default:
f19590b07cb620b Ricardo Robaina 2025-11-14  2506  			goto unknown_proto;
f19590b07cb620b Ricardo Robaina 2025-11-14  2507  		}
f19590b07cb620b Ricardo Robaina 2025-11-14  2508  	}
f19590b07cb620b Ricardo Robaina 2025-11-14  2509  
f19590b07cb620b Ricardo Robaina 2025-11-14  2510  	switch (nfproto) {
f19590b07cb620b Ricardo Robaina 2025-11-14  2511  	case NFPROTO_IPV4: {
f19590b07cb620b Ricardo Robaina 2025-11-14  2512  		struct iphdr iph;
f19590b07cb620b Ricardo Robaina 2025-11-14  2513  		const struct iphdr *ih;
f19590b07cb620b Ricardo Robaina 2025-11-14  2514  
f19590b07cb620b Ricardo Robaina 2025-11-14  2515  		ih = skb_header_pointer(skb, skb_network_offset(skb),
f19590b07cb620b Ricardo Robaina 2025-11-14  2516  					sizeof(iph), &iph);
f19590b07cb620b Ricardo Robaina 2025-11-14  2517  		if (!ih)
f19590b07cb620b Ricardo Robaina 2025-11-14  2518  			return -ENOMEM;
f19590b07cb620b Ricardo Robaina 2025-11-14  2519  
f19590b07cb620b Ricardo Robaina 2025-11-14  2520  		audit_log_format(ab, " saddr=%pI4 daddr=%pI4 proto=%hhu",
f19590b07cb620b Ricardo Robaina 2025-11-14  2521  				 &ih->saddr, &ih->daddr, ih->protocol);
f19590b07cb620b Ricardo Robaina 2025-11-14  2522  		break;
f19590b07cb620b Ricardo Robaina 2025-11-14  2523  	}
f19590b07cb620b Ricardo Robaina 2025-11-14  2524  	case NFPROTO_IPV6: {
f19590b07cb620b Ricardo Robaina 2025-11-14  2525  		struct ipv6hdr iph;
f19590b07cb620b Ricardo Robaina 2025-11-14  2526  		const struct ipv6hdr *ih;
f19590b07cb620b Ricardo Robaina 2025-11-14  2527  		u8 nexthdr;
f19590b07cb620b Ricardo Robaina 2025-11-14  2528  		__be16 frag_off;
f19590b07cb620b Ricardo Robaina 2025-11-14  2529  
f19590b07cb620b Ricardo Robaina 2025-11-14  2530  		ih = skb_header_pointer(skb, skb_network_offset(skb),
f19590b07cb620b Ricardo Robaina 2025-11-14  2531  					sizeof(iph), &iph);
f19590b07cb620b Ricardo Robaina 2025-11-14  2532  		if (!ih)
f19590b07cb620b Ricardo Robaina 2025-11-14 @2533  			return -ENOMEM;
f19590b07cb620b Ricardo Robaina 2025-11-14  2534  
f19590b07cb620b Ricardo Robaina 2025-11-14  2535  		nexthdr = ih->nexthdr;
f19590b07cb620b Ricardo Robaina 2025-11-14  2536  		ipv6_skip_exthdr(skb, skb_network_offset(skb) + sizeof(iph),
f19590b07cb620b Ricardo Robaina 2025-11-14  2537  				 &nexthdr, &frag_off);
f19590b07cb620b Ricardo Robaina 2025-11-14  2538  
f19590b07cb620b Ricardo Robaina 2025-11-14  2539  		audit_log_format(ab, " saddr=%pI6c daddr=%pI6c proto=%hhu",
f19590b07cb620b Ricardo Robaina 2025-11-14  2540  				 &ih->saddr, &ih->daddr, nexthdr);
f19590b07cb620b Ricardo Robaina 2025-11-14  2541  		break;
f19590b07cb620b Ricardo Robaina 2025-11-14  2542  	}
f19590b07cb620b Ricardo Robaina 2025-11-14  2543  	default:
f19590b07cb620b Ricardo Robaina 2025-11-14  2544  		goto unknown_proto;
f19590b07cb620b Ricardo Robaina 2025-11-14  2545  	}
f19590b07cb620b Ricardo Robaina 2025-11-14  2546  
f19590b07cb620b Ricardo Robaina 2025-11-14  2547  	return 0;
f19590b07cb620b Ricardo Robaina 2025-11-14  2548  
f19590b07cb620b Ricardo Robaina 2025-11-14  2549  unknown_proto:
f19590b07cb620b Ricardo Robaina 2025-11-14  2550  	audit_log_format(ab, " saddr=? daddr=? proto=?");
f19590b07cb620b Ricardo Robaina 2025-11-14  2551  	return -EPFNOSUPPORT;
f19590b07cb620b Ricardo Robaina 2025-11-14  2552  }
f19590b07cb620b Ricardo Robaina 2025-11-14  2553  EXPORT_SYMBOL(audit_log_nf_skb);
f19590b07cb620b Ricardo Robaina 2025-11-14  2554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
