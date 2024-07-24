Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65208374D4
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jul 2024 05:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721797870; cv=none; b=LGth8a51u/xx6ZTZZBAwFqXu9rDK1fjsq2kGSsDEuozp6XiycAEMrsNrHkqx0XjrWXiM3k/sXd68l71x9eimzjU106e/7ZE+JiOOTB7VJYXGQnOB8SAbhWWsK/KYI9/38jZFsKqJ2V8Yo2cv7IL2XmivBj1hmtukb3p3Q36AHAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721797870; c=relaxed/simple;
	bh=riPPSK5PNqI6it06W0eobfhZMRQI9B6IWgnHJjCbtzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xiq6EH2sI9LPfOYJHPcC1u1XAZ5lzyD5ydz1LLS1AuREUuKJuzb3Iwm53sG6fcrYqC7ThU9GsYMTClYRhsmnNaW495n+9yU6dJD03OhnMzlyg1s7C5eCv2ErKaH8RbVgNi8fbP7VHQXLpEXMkBX9sU2wniEBfknx+0MvxuqBwcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c49CAY9x; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c49CAY9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721797868; x=1753333868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=riPPSK5PNqI6it06W0eobfhZMRQI9B6IWgnHJjCbtzg=;
  b=c49CAY9xxV4Vmj4g6p6tMayX8sjbgxV7rfZ6TUMDe2TZwsy2DgaDgkGR
   1Ao/oS63ug1d5GbGQiCShzS/OyMlm9O4ED36T9Que2/394FiuFHAqYiGB
   pGI1APTkW+nPUXUjlu3zkC94QbR9MhgQMqameW592OWwGgDy5dWfrKLZk
   XA4a91fc1IyYLZR+Jj0JNgk9Iw2X/HOpjvOdZ8hh71rpPPvn2seAKH5hg
   kG0XyrpYdG1vtl/7SudH3pAmybW7x4d+U2xJLANs6hWG/DdWvkrBZ5x+h
   9Grxwf7hwYJUBLFeeJk1OItV6HqxsjUQtiFNZ5n0sPQ3jAc63WicD1ok9
   A==;
X-CSE-ConnectionGUID: pM7V92q1SOCNctDlI86DLQ==
X-CSE-MsgGUID: HGp23KnDTLuzPZVlM0La4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19329590"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="19329590"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 22:11:07 -0700
X-CSE-ConnectionGUID: QvZ9972iR2ONrEurMHZyPQ==
X-CSE-MsgGUID: 7aGD0ibvTNSrgVRacx3TQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="83469161"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2024 22:11:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWUHI-000mh0-1L;
	Wed, 24 Jul 2024 05:11:04 +0000
Date: Wed, 24 Jul 2024 13:10:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpirko-mlxsw:combined_queue 16/26] net/ipv4/nexthop.c:895
 nla_put_nh_group() warn: right shifting more than type allows 16 vs 16
Message-ID: <202407241208.PucVQezH-lkp@intel.com>
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
TO: Petr Machata <petrm@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   965a9e1af54d436b4c96de99d7b070d8c5975fdf
commit: 2ea1151c7eb7f0c76d0cea4bf605f6ff2229c074 [16/26] net: nexthop: Increase weight to u16
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-141-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241208.PucVQezH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407241208.PucVQezH-lkp@intel.com/

smatch warnings:
net/ipv4/nexthop.c:895 nla_put_nh_group() warn: right shifting more than type allows 16 vs 16

vim +895 net/ipv4/nexthop.c

95fedd7685912f9 Ido Schimmel 2024-03-06  866  
95fedd7685912f9 Ido Schimmel 2024-03-06  867  static int nla_put_nh_group(struct sk_buff *skb, struct nexthop *nh,
360a094e12892e2 Petr Machata 2024-07-23  868  			    u32 op_flags, u32 *resp_op_flags)
430a049190de3c9 David Ahern  2019-05-24  869  {
95fedd7685912f9 Ido Schimmel 2024-03-06  870  	struct nh_group *nhg = rtnl_dereference(nh->nh_grp);
430a049190de3c9 David Ahern  2019-05-24  871  	struct nexthop_grp *p;
430a049190de3c9 David Ahern  2019-05-24  872  	size_t len = nhg->num_nh * sizeof(*p);
430a049190de3c9 David Ahern  2019-05-24  873  	struct nlattr *nla;
430a049190de3c9 David Ahern  2019-05-24  874  	u16 group_type = 0;
2ea1151c7eb7f0c Petr Machata 2024-07-23  875  	u16 weight;
430a049190de3c9 David Ahern  2019-05-24  876  	int i;
430a049190de3c9 David Ahern  2019-05-24  877  
360a094e12892e2 Petr Machata 2024-07-23  878  	*resp_op_flags |= NHA_OP_FLAG_RESP_GRP_RESVD_0;
360a094e12892e2 Petr Machata 2024-07-23  879  
de1d1ee3e3e9f02 Petr Machata 2021-03-26  880  	if (nhg->hash_threshold)
430a049190de3c9 David Ahern  2019-05-24  881  		group_type = NEXTHOP_GRP_TYPE_MPATH;
a2601e2b1e7ecd3 Petr Machata 2021-03-11  882  	else if (nhg->resilient)
a2601e2b1e7ecd3 Petr Machata 2021-03-11  883  		group_type = NEXTHOP_GRP_TYPE_RES;
430a049190de3c9 David Ahern  2019-05-24  884  
430a049190de3c9 David Ahern  2019-05-24  885  	if (nla_put_u16(skb, NHA_GROUP_TYPE, group_type))
430a049190de3c9 David Ahern  2019-05-24  886  		goto nla_put_failure;
430a049190de3c9 David Ahern  2019-05-24  887  
430a049190de3c9 David Ahern  2019-05-24  888  	nla = nla_reserve(skb, NHA_GROUP, len);
430a049190de3c9 David Ahern  2019-05-24  889  	if (!nla)
430a049190de3c9 David Ahern  2019-05-24  890  		goto nla_put_failure;
430a049190de3c9 David Ahern  2019-05-24  891  
430a049190de3c9 David Ahern  2019-05-24  892  	p = nla_data(nla);
430a049190de3c9 David Ahern  2019-05-24  893  	for (i = 0; i < nhg->num_nh; ++i) {
2ea1151c7eb7f0c Petr Machata 2024-07-23  894  		weight = nhg->nh_entries[i].weight - 1;
2ea1151c7eb7f0c Petr Machata 2024-07-23 @895  		WARN_ON_ONCE(!!(weight >> 16));
2ea1151c7eb7f0c Petr Machata 2024-07-23  896  
8b06dd4ec057d91 Petr Machata 2024-07-18  897  		*p++ = (struct nexthop_grp) {
8b06dd4ec057d91 Petr Machata 2024-07-18  898  			.id = nhg->nh_entries[i].nh->id,
2ea1151c7eb7f0c Petr Machata 2024-07-23  899  			.weight = weight,
2ea1151c7eb7f0c Petr Machata 2024-07-23  900  			.weight_high = weight >> 8,
8b06dd4ec057d91 Petr Machata 2024-07-18  901  		};
430a049190de3c9 David Ahern  2019-05-24  902  	}
430a049190de3c9 David Ahern  2019-05-24  903  
a2601e2b1e7ecd3 Petr Machata 2021-03-11  904  	if (nhg->resilient && nla_put_nh_group_res(skb, nhg))
a2601e2b1e7ecd3 Petr Machata 2021-03-11  905  		goto nla_put_failure;
a2601e2b1e7ecd3 Petr Machata 2021-03-11  906  
95fedd7685912f9 Ido Schimmel 2024-03-06  907  	if (op_flags & NHA_OP_FLAG_DUMP_STATS &&
746c19a52ec50b8 Ido Schimmel 2024-03-06  908  	    (nla_put_u32(skb, NHA_HW_STATS_ENABLE, nhg->hw_stats) ||
5072ae00aea434d Ido Schimmel 2024-03-06  909  	     nla_put_nh_group_stats(skb, nh, op_flags)))
95fedd7685912f9 Ido Schimmel 2024-03-06  910  		goto nla_put_failure;
95fedd7685912f9 Ido Schimmel 2024-03-06  911  
430a049190de3c9 David Ahern  2019-05-24  912  	return 0;
430a049190de3c9 David Ahern  2019-05-24  913  
430a049190de3c9 David Ahern  2019-05-24  914  nla_put_failure:
430a049190de3c9 David Ahern  2019-05-24  915  	return -EMSGSIZE;
430a049190de3c9 David Ahern  2019-05-24  916  }
430a049190de3c9 David Ahern  2019-05-24  917  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
