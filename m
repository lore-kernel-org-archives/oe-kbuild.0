Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644CD2475CB
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781476677; cv=none; b=D2dvmjiw/2Atah/ou3R2AzJL2+cwlfoRZZ+qHh+lV1sPf8QHbs9eDvjDbF1WLAxFoYznZvQMhCpgYmGK7mXUNQgYBQxV57ejiSaJbP6TRWeib+gLbM0b79UELfLUSez495ksnFWsuoltR9TSeHuwxM/OYRl840pzqGaz+vgmCXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781476677; c=relaxed/simple;
	bh=N7v8DLLUlJOWyxd9OY564H+9p4/Y0YucFsWjzhp3rKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JzzlOAg2S9sYOvlfCvuq1azAoay4LN8OyJU63AJHkmw0ezTL03JSEh7h/TUUNIrb8/NtYFXemo3cQ9Fe7L5iSO4DxFH6GQm2p1WYuPVEMUb8Y6P3C1CD0t8J2uGewf2TChY0RCwXvUYmUt9OR/LRUv77vlnl+cQ8rlI/r7OwTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMtT2/A4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMtT2/A4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781476675; x=1813012675;
  h=date:from:to:cc:subject:message-id;
  bh=N7v8DLLUlJOWyxd9OY564H+9p4/Y0YucFsWjzhp3rKs=;
  b=KMtT2/A4WFpnNhHxgcanLfGcwW4hwQ2npcOg9jhB9jwcIRaG49G5M8g1
   uLYh9UTyx3Q/Oy7Xa7i4Z5L/zvKC4IgNiw9fteQ+qRbZVUVt3jvfAjScq
   sO/eOziAfKiu5V47sDlgRrz39zoGbWMwkKsBM0Od9pi4R0wDyuGWx8+9t
   yNyi+0HoowQfpkVBAU19eXNqJobeokAwnUgheDrgvpKr4G6o3c4VrP2Eu
   e/s3rb8o8Uq6Wq1vbFox1h2Liz7XWgo+MUiP9vxvIXaoTJBjC617z4JWT
   Y9FzS1mvw12yp0ODhRXmvxCv8QSFYUTRcUGrEntpUzP2i2n6gijbZAL47
   g==;
X-CSE-ConnectionGUID: gbq7rec5Rhu1NtZjkCp/yw==
X-CSE-MsgGUID: c8jpl+MLSjGD44gu8AcF0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="69761193"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="69761193"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 15:37:55 -0700
X-CSE-ConnectionGUID: Pfn4ICgrTO2WIbh+eZlmuA==
X-CSE-MsgGUID: YJOWuxiLQPqOzyR9UN0bwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="243164774"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2026 15:37:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYtSh-00000000RGA-1f8E;
	Sun, 14 Jun 2026 22:37:51 +0000
Date: Mon, 15 Jun 2026 06:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/audit.c:2533 audit_log_nf_skb() warn: missing unwind
 goto?
Message-ID: <202606150624.IhBEr4S7-lkp@intel.com>
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
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: f19590b07cb620be1fcd5474c49515e21a05d406 audit: add audit_log_nf_skb helper function
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260615/202606150624.IhBEr4S7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f19590b07cb6 ("audit: add audit_log_nf_skb helper function")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606150624.IhBEr4S7-lkp@intel.com/

smatch warnings:
kernel/audit.c:2533 audit_log_nf_skb() warn: missing unwind goto?

vim +2533 kernel/audit.c

a51d9eaa41866a Kees Cook       2012-07-25  2492  
f19590b07cb620 Ricardo Robaina 2025-11-14  2493  int audit_log_nf_skb(struct audit_buffer *ab,
f19590b07cb620 Ricardo Robaina 2025-11-14  2494  		     const struct sk_buff *skb, u8 nfproto)
f19590b07cb620 Ricardo Robaina 2025-11-14  2495  {
f19590b07cb620 Ricardo Robaina 2025-11-14  2496  	/* find the IP protocol in the case of NFPROTO_BRIDGE */
f19590b07cb620 Ricardo Robaina 2025-11-14  2497  	if (nfproto == NFPROTO_BRIDGE) {
f19590b07cb620 Ricardo Robaina 2025-11-14  2498  		switch (eth_hdr(skb)->h_proto) {
f19590b07cb620 Ricardo Robaina 2025-11-14  2499  		case htons(ETH_P_IP):
f19590b07cb620 Ricardo Robaina 2025-11-14  2500  			nfproto = NFPROTO_IPV4;
f19590b07cb620 Ricardo Robaina 2025-11-14  2501  			break;
f19590b07cb620 Ricardo Robaina 2025-11-14  2502  		case htons(ETH_P_IPV6):
f19590b07cb620 Ricardo Robaina 2025-11-14  2503  			nfproto = NFPROTO_IPV6;
f19590b07cb620 Ricardo Robaina 2025-11-14  2504  			break;
f19590b07cb620 Ricardo Robaina 2025-11-14  2505  		default:
f19590b07cb620 Ricardo Robaina 2025-11-14  2506  			goto unknown_proto;
f19590b07cb620 Ricardo Robaina 2025-11-14  2507  		}
f19590b07cb620 Ricardo Robaina 2025-11-14  2508  	}
f19590b07cb620 Ricardo Robaina 2025-11-14  2509  
f19590b07cb620 Ricardo Robaina 2025-11-14  2510  	switch (nfproto) {
f19590b07cb620 Ricardo Robaina 2025-11-14  2511  	case NFPROTO_IPV4: {
f19590b07cb620 Ricardo Robaina 2025-11-14  2512  		struct iphdr iph;
f19590b07cb620 Ricardo Robaina 2025-11-14  2513  		const struct iphdr *ih;
f19590b07cb620 Ricardo Robaina 2025-11-14  2514  
f19590b07cb620 Ricardo Robaina 2025-11-14  2515  		ih = skb_header_pointer(skb, skb_network_offset(skb),
f19590b07cb620 Ricardo Robaina 2025-11-14  2516  					sizeof(iph), &iph);
f19590b07cb620 Ricardo Robaina 2025-11-14  2517  		if (!ih)
f19590b07cb620 Ricardo Robaina 2025-11-14  2518  			return -ENOMEM;
f19590b07cb620 Ricardo Robaina 2025-11-14  2519  
f19590b07cb620 Ricardo Robaina 2025-11-14  2520  		audit_log_format(ab, " saddr=%pI4 daddr=%pI4 proto=%hhu",
f19590b07cb620 Ricardo Robaina 2025-11-14  2521  				 &ih->saddr, &ih->daddr, ih->protocol);
f19590b07cb620 Ricardo Robaina 2025-11-14  2522  		break;
f19590b07cb620 Ricardo Robaina 2025-11-14  2523  	}
f19590b07cb620 Ricardo Robaina 2025-11-14  2524  	case NFPROTO_IPV6: {
f19590b07cb620 Ricardo Robaina 2025-11-14  2525  		struct ipv6hdr iph;
f19590b07cb620 Ricardo Robaina 2025-11-14  2526  		const struct ipv6hdr *ih;
f19590b07cb620 Ricardo Robaina 2025-11-14  2527  		u8 nexthdr;
f19590b07cb620 Ricardo Robaina 2025-11-14  2528  		__be16 frag_off;
f19590b07cb620 Ricardo Robaina 2025-11-14  2529  
f19590b07cb620 Ricardo Robaina 2025-11-14  2530  		ih = skb_header_pointer(skb, skb_network_offset(skb),
f19590b07cb620 Ricardo Robaina 2025-11-14  2531  					sizeof(iph), &iph);
f19590b07cb620 Ricardo Robaina 2025-11-14  2532  		if (!ih)
f19590b07cb620 Ricardo Robaina 2025-11-14 @2533  			return -ENOMEM;
f19590b07cb620 Ricardo Robaina 2025-11-14  2534  
f19590b07cb620 Ricardo Robaina 2025-11-14  2535  		nexthdr = ih->nexthdr;
f19590b07cb620 Ricardo Robaina 2025-11-14  2536  		ipv6_skip_exthdr(skb, skb_network_offset(skb) + sizeof(iph),
f19590b07cb620 Ricardo Robaina 2025-11-14  2537  				 &nexthdr, &frag_off);
f19590b07cb620 Ricardo Robaina 2025-11-14  2538  
f19590b07cb620 Ricardo Robaina 2025-11-14  2539  		audit_log_format(ab, " saddr=%pI6c daddr=%pI6c proto=%hhu",
f19590b07cb620 Ricardo Robaina 2025-11-14  2540  				 &ih->saddr, &ih->daddr, nexthdr);
f19590b07cb620 Ricardo Robaina 2025-11-14  2541  		break;
f19590b07cb620 Ricardo Robaina 2025-11-14  2542  	}
f19590b07cb620 Ricardo Robaina 2025-11-14  2543  	default:
f19590b07cb620 Ricardo Robaina 2025-11-14  2544  		goto unknown_proto;
f19590b07cb620 Ricardo Robaina 2025-11-14  2545  	}
f19590b07cb620 Ricardo Robaina 2025-11-14  2546  
f19590b07cb620 Ricardo Robaina 2025-11-14  2547  	return 0;
f19590b07cb620 Ricardo Robaina 2025-11-14  2548  
f19590b07cb620 Ricardo Robaina 2025-11-14  2549  unknown_proto:
f19590b07cb620 Ricardo Robaina 2025-11-14  2550  	audit_log_format(ab, " saddr=? daddr=? proto=?");
f19590b07cb620 Ricardo Robaina 2025-11-14  2551  	return -EPFNOSUPPORT;
f19590b07cb620 Ricardo Robaina 2025-11-14  2552  }
f19590b07cb620 Ricardo Robaina 2025-11-14  2553  EXPORT_SYMBOL(audit_log_nf_skb);
f19590b07cb620 Ricardo Robaina 2025-11-14  2554  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
