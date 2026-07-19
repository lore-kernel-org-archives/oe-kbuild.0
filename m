Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40B88834
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jul 2026 00:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784421488; cv=none; b=dLcJ9Fo8CpWGh5WOYRbSViZtRIvwqxq4K43xUu8mVIS9W2JeoOt7Io9G8aTIFjxcRp6qijB2DzVyVkQZwIi8oUz36gUMBd5ykGfuKvFd2w8fL6Or/rzxlv/Mzrd7qTcx2eVGHe1yxPd2WJdr+2sumirZb2M/jpWh7iWRa2F7iqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784421488; c=relaxed/simple;
	bh=RxCS8o6hke2ajaVQbJLXZ5b8/uVIIGuHl5p+1ttFusc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XFMQfOk8xXk7nvIbExTEoasJOexgrcgllj6ofzNubbvKUimcHajCw+Tp/xG38UJ5z+/NFyM6rvlbkW3Dl5vRNt06Y4b9H0UFkRnNFMZgfLKq3NYGxca64nESFvfuVzC6bEyKU1TIl55eWJViEq/+QcpMdVhRdnsyVFZQhCiOk6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFn/KkZG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFn/KkZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784421485; x=1815957485;
  h=date:from:to:cc:subject:message-id;
  bh=RxCS8o6hke2ajaVQbJLXZ5b8/uVIIGuHl5p+1ttFusc=;
  b=HFn/KkZGVG/xPlBsWkcgtZC9SDE+A6pJNYTvyNVb6BPxNleUUI0sWkYf
   KyARE/FQ5MEQ8mB6pC38bQO6IS+u5iUdUQul0OuyHVlZa2U2/pgy7GETt
   vYdJPnf3Oebg36Ad5MZaK9kERrXkGzq7uIVN4B0amp3PzpY+YJsEzwGHx
   eVkEjtA+qLDVJwGbhonYS93lCDxrIk1kq+K+GQLBptiuL9OUoT40smjga
   3k20Zr3mdHrVbvu5TtscJS+jXVC5LQxyw+bRR9YoyYAMB3ZYUTZqJT+Jv
   tFw4hlv+BUQN4DqtTP1sN/x3dJbV0CrGdPSH0WZ5WGvoX5khNbZURniiy
   Q==;
X-CSE-ConnectionGUID: tHGQXM1fTOqHhJE+XOVKIA==
X-CSE-MsgGUID: k+SJZdMyR6WVkTZrMjxAMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="107832062"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="107832062"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 17:38:04 -0700
X-CSE-ConnectionGUID: c9IHawC6SYa7DZv31sQUaw==
X-CSE-MsgGUID: a57Cn1VlRciHI1AoLl4u6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="262078087"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jul 2026 17:38:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlFXc-00000000VEA-3KhF;
	Sun, 19 Jul 2026 00:38:00 +0000
Date: Sun, 19 Jul 2026 08:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 28/28]
 net/netfilter/nf_conntrack_core.c:1660 nf_conntrack_free() error: double free
 of 'ct' (line 1656)
Message-ID: <202607190800.564VPYEV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   ced98912a0d86b6d7c7365664b2df779bf159018
commit: 88ca8a6cd68201e0b3ee0dc7ce4f8a98d9be0d19 [28/28] ANDROID: GKI: net: add vendor hooks for 'struct nf_conn' lifecycle
:::::: branch date: 3 days ago
:::::: commit date: 4 years ago
config: x86_64-randconfig-161-20260717 (https://download.01.org/0day-ci/archive/20260719/202607190800.564VPYEV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607190800.564VPYEV-lkp@intel.com/

smatch warnings:
net/netfilter/nf_conntrack_core.c:1660 nf_conntrack_free() error: double free of 'ct' (line 1656)

vim +/ct +1660 net/netfilter/nf_conntrack_core.c

9fb9cbb1082d6b Yasuyuki Kozakai        2005-11-09  1644  
c88130bcd546e7 Patrick McHardy         2008-01-31  1645  void nf_conntrack_free(struct nf_conn *ct)
76507f69c44ed1 Patrick McHardy         2008-01-31  1646  {
1d45209d89e647 Eric Dumazet            2009-03-24  1647  	struct net *net = nf_ct_net(ct);
c53bd0e96662c2 Florian Westphal        2021-04-12  1648  	struct nf_conntrack_net *cnet;
1d45209d89e647 Eric Dumazet            2009-03-24  1649  
e53376bef2cd97 Pablo Neira Ayuso       2014-02-03  1650  	/* A freed object has refcnt == 0, that's
5f0d5a3ae7cff0 Paul E. McKenney        2017-01-18  1651  	 * the golden rule for SLAB_TYPESAFE_BY_RCU
e53376bef2cd97 Pablo Neira Ayuso       2014-02-03  1652  	 */
bcba40bd36d705 Florian Westphal        2022-01-07  1653  	WARN_ON(refcount_read(&ct->ct_general.use) != 0);
e53376bef2cd97 Pablo Neira Ayuso       2014-02-03  1654  
ceeff7541e5a4b Patrick McHardy         2008-06-11  1655  	nf_ct_ext_destroy(ct);
0c5366b3a8c77f Florian Westphal        2016-05-09 @1656  	kmem_cache_free(nf_conntrack_cachep, ct);
0418b989a46788 Pablo Neira Ayuso       2021-06-02  1657  	cnet = nf_ct_pernet(net);
c53bd0e96662c2 Florian Westphal        2021-04-12  1658  
4e857c58efeb99 Peter Zijlstra          2014-03-17  1659  	smp_mb__before_atomic();
88ca8a6cd68201 Vignesh Saravanaperumal 2021-07-08 @1660  	trace_android_rvh_nf_conn_free(ct);
c53bd0e96662c2 Florian Westphal        2021-04-12  1661  	atomic_dec(&cnet->count);
76507f69c44ed1 Patrick McHardy         2008-01-31  1662  }
13b18339102052 Patrick McHardy         2006-12-02  1663  EXPORT_SYMBOL_GPL(nf_conntrack_free);
9fb9cbb1082d6b Yasuyuki Kozakai        2005-11-09  1664  
c539f01717c239 Florian Westphal        2013-01-11  1665  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
