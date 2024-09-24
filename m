Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3781537C9
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727166985; cv=none; b=GHCwoxCOOYYLurqltrMO2X3tjoV1EFYv1CiNKsSF7Z16rN5C/P8SitmUeikyk947PDG6FYNN8UTUss9VDe6TSOzifHP0ZefXbSnStemTgrtCGfSN4MkleXZJ/SxPaxZJR5DYPrqPgRVyCYIGI45sGcomvwu/yy2T6/33MHIlJdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727166985; c=relaxed/simple;
	bh=Tn1h+DMD79oNDuVQlB9a76kPR58evy8f1TbpU0dWl7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lwsK3SUeAzB0CZQbmM9iUDr7zRcSZzG2lzbrJuTpFdPa1cIFqe1GV5nJsNsTW9QIXhPVOe7eZoVrQWNIR5EzXpZh5VV1fgvNvIZnMEMV2UFCJCuPNMvhhiscxyx4sQ2vtOUH9fhblH7tfKPUW90nXUKxbobbFPD1u0WoIGxeGl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1IZO04u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1IZO04u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727166984; x=1758702984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tn1h+DMD79oNDuVQlB9a76kPR58evy8f1TbpU0dWl7Q=;
  b=n1IZO04uucO7f3An73ErskZ0cqQZEujcd+0yb3HUJHPTqQ/Rd0RTDzHB
   4HoNvlVfmMIJgRgW2uS7YzfKCl810DjMiNU1b4m/+Z2gnmUAhdMNlFZIq
   DJ/Kdo0iCd5AmgkoB86mkkFPgt3ozg8fAox5tvgxbWez2KxDFhwLCoJF3
   k6uZ9DUF4sO+w5Ptwu9oL9yPBcqAfcY7ZihfsowsBBlooQs8lVgz5hlwm
   eGxMSJsB8zo01MwH8gfIYQ6Xyr/8aGKZOsHZch8mV7BSN2mAl3y/MOobr
   RRelx2ZfwafeOnlahNMEO9bZzGfFEQ6pvQraHSwnQDF3HtjJh/ZDm+8sy
   g==;
X-CSE-ConnectionGUID: hJavsXKmT0OP2wYFumpQIA==
X-CSE-MsgGUID: ldBEfBtdSMi22Im48sGDYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26265854"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="26265854"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 01:36:12 -0700
X-CSE-ConnectionGUID: 7LivTqv2RtWszAL04K1UMg==
X-CSE-MsgGUID: z0FuXNZrSs+1Vj95CROtdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="76114025"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2024 01:36:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st11i-000I7P-1h;
	Tue, 24 Sep 2024 08:36:06 +0000
Date: Tue, 24 Sep 2024 16:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [nf-next:testing 4/5] net/netfilter/nf_nat_masquerade.c:273
 nf_nat_masquerade_ipv6() error: uninitialized symbol 'ret'.
Message-ID: <202409241626.EESO3ZDw-lkp@intel.com>
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
CC: netfilter-devel@vger.kernel.org
CC: coreteam@netfilter.org
TO: Florian Westphal <fw@strlen.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git testing
head:   eb5a3496084f9a3ea3fb4c4d22b4c661d46a2743
commit: ecc701a3bd9890f83ea89337c64d4f14aba9f091 [4/5] netfilter: nf_nat: use skb_drop_reason
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r073-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241626.EESO3ZDw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409241626.EESO3ZDw-lkp@intel.com/

smatch warnings:
net/netfilter/nf_nat_masquerade.c:273 nf_nat_masquerade_ipv6() error: uninitialized symbol 'ret'.

vim +/ret +273 net/netfilter/nf_nat_masquerade.c

d1aca8ab3104aa Florian Westphal 2019-02-19  243  
d1aca8ab3104aa Florian Westphal 2019-02-19  244  unsigned int
d1aca8ab3104aa Florian Westphal 2019-02-19  245  nf_nat_masquerade_ipv6(struct sk_buff *skb, const struct nf_nat_range2 *range,
d1aca8ab3104aa Florian Westphal 2019-02-19  246  		       const struct net_device *out)
d1aca8ab3104aa Florian Westphal 2019-02-19  247  {
d1aca8ab3104aa Florian Westphal 2019-02-19  248  	enum ip_conntrack_info ctinfo;
d1aca8ab3104aa Florian Westphal 2019-02-19  249  	struct nf_conn_nat *nat;
d1aca8ab3104aa Florian Westphal 2019-02-19  250  	struct in6_addr src;
d1aca8ab3104aa Florian Westphal 2019-02-19  251  	struct nf_conn *ct;
d1aca8ab3104aa Florian Westphal 2019-02-19  252  	struct nf_nat_range2 newrange;
ecc701a3bd9890 Florian Westphal 2023-05-14  253  	int ret;
d1aca8ab3104aa Florian Westphal 2019-02-19  254  
d1aca8ab3104aa Florian Westphal 2019-02-19  255  	ct = nf_ct_get(skb, &ctinfo);
d1aca8ab3104aa Florian Westphal 2019-02-19  256  	WARN_ON(!(ct && (ctinfo == IP_CT_NEW || ctinfo == IP_CT_RELATED ||
d1aca8ab3104aa Florian Westphal 2019-02-19  257  			 ctinfo == IP_CT_RELATED_REPLY)));
d1aca8ab3104aa Florian Westphal 2019-02-19  258  
d1aca8ab3104aa Florian Westphal 2019-02-19  259  	if (nat_ipv6_dev_get_saddr(nf_ct_net(ct), out,
d1aca8ab3104aa Florian Westphal 2019-02-19  260  				   &ipv6_hdr(skb)->daddr, 0, &src) < 0)
ecc701a3bd9890 Florian Westphal 2023-05-14  261  		return NF_DROP_REASON(skb, SKB_DROP_REASON_NETFILTER_DROP, EADDRNOTAVAIL);
d1aca8ab3104aa Florian Westphal 2019-02-19  262  
d1aca8ab3104aa Florian Westphal 2019-02-19  263  	nat = nf_ct_nat_ext_add(ct);
d1aca8ab3104aa Florian Westphal 2019-02-19  264  	if (nat)
d1aca8ab3104aa Florian Westphal 2019-02-19  265  		nat->masq_index = out->ifindex;
d1aca8ab3104aa Florian Westphal 2019-02-19  266  
d1aca8ab3104aa Florian Westphal 2019-02-19  267  	newrange.flags		= range->flags | NF_NAT_RANGE_MAP_IPS;
d1aca8ab3104aa Florian Westphal 2019-02-19  268  	newrange.min_addr.in6	= src;
d1aca8ab3104aa Florian Westphal 2019-02-19  269  	newrange.max_addr.in6	= src;
d1aca8ab3104aa Florian Westphal 2019-02-19  270  	newrange.min_proto	= range->min_proto;
d1aca8ab3104aa Florian Westphal 2019-02-19  271  	newrange.max_proto	= range->max_proto;
d1aca8ab3104aa Florian Westphal 2019-02-19  272  
ecc701a3bd9890 Florian Westphal 2023-05-14 @273  	if (ret == NF_DROP)
ecc701a3bd9890 Florian Westphal 2023-05-14  274  		return NF_DROP_REASON(skb, SKB_DROP_REASON_NETFILTER_DROP, EPERM);
ecc701a3bd9890 Florian Westphal 2023-05-14  275  
ecc701a3bd9890 Florian Westphal 2023-05-14  276  	return ret;
d1aca8ab3104aa Florian Westphal 2019-02-19  277  }
d1aca8ab3104aa Florian Westphal 2019-02-19  278  EXPORT_SYMBOL_GPL(nf_nat_masquerade_ipv6);
d1aca8ab3104aa Florian Westphal 2019-02-19  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
