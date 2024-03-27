Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF1B20322
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Mar 2024 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711505113; cv=none; b=LkXD4nuXR9s1MKVDrZsXIyIRp3tSjJuG6g4qWcxNUeo/t7Yo72NX77psad0ZDaKjxkgVuoisEVQ/ovg7gdGEiGXcWVcooRcf1Y7zLjMK9j9vAKVexDPW74UmbfzFjHwni26IJ22TEQIHV7F6ALXbAP9HysFKfvn5dixv34kCdj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711505113; c=relaxed/simple;
	bh=1NXi9NupduElFSxRD8h77vqQNOIy8XGTCZsxY0/6qqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ITpJzMmVdj/j4FJ3F0t0deTuCOtE1o1XTpR4fi/v/3z0UIyioYqZJ7Q6m1Do/Le2vaRtZtdtN4WokFnqYhzMR/AoK3tyUVvdFB4Uctjdr0n3KE2zyzrfq6J3RWOwErcvM5bwIX2Xz11OjF26SoarTdyxIxmRSwEcDp376of/cZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFO1J4E1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFO1J4E1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711505112; x=1743041112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1NXi9NupduElFSxRD8h77vqQNOIy8XGTCZsxY0/6qqs=;
  b=LFO1J4E114zJkSsX26+3k+7WYdQfys9683nP0uKIDuPrAFE00S4lBHrS
   ZmsZQAdO0+fnV81cqryYsxYrXKkS1Au7qKP3tpk3LMufuq5mfLc4+btVM
   jepBhELjWI4CEkHMxqZciuJs4o5FBuMCg5zfru9OWruihG8c06heAf8y2
   0EIcJBl9RUDfHr+ZSvSfbtQA/FecCZKKiXa0JhotNyFVKQymwEgvrQeFI
   khYB4JM4jL9ZnHS5ix05bwlETKA9aQW88971S2/ZrfAobD7YcsAM0yGiU
   X/1PpFyK7iqyZolHDSHRmcSaTC9+XveGP3SonMqO1GeG8bfyV+6bjqBPI
   g==;
X-CSE-ConnectionGUID: r+woO1F3Sxm6z2G3Rfw9bg==
X-CSE-MsgGUID: 42GQbfC+Qn2hXL1i6nhIEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6697649"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6697649"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 19:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="47154844"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2024 19:05:10 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpIf5-0000dm-2O;
	Wed, 27 Mar 2024 02:05:07 +0000
Date: Wed, 27 Mar 2024 10:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] net: core: use guard/__free in core dev code
Message-ID: <202403270904.XeGQ4kVC-lkp@intel.com>
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
In-Reply-To: <20240325233905.09e8c19d4207.I203795c6b809819c98532e5d6186c700a6c1c760@changeid>
References: <20240325233905.09e8c19d4207.I203795c6b809819c98532e5d6186c700a6c1c760@changeid>
TO: Johannes Berg <johannes@sipsolutions.net>
TO: netdev@vger.kernel.org
CC: Johannes Berg <johannes.berg@intel.com>

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.9-rc1 next-20240326]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/rtnetlink-add-guard-for-RTNL/20240326-064044
base:   net/main
patch link:    https://lore.kernel.org/r/20240325233905.09e8c19d4207.I203795c6b809819c98532e5d6186c700a6c1c760%40changeid
patch subject: [PATCH 3/3] net: core: use guard/__free in core dev code
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/archive/20240327/202403270904.XeGQ4kVC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403270904.XeGQ4kVC-lkp@intel.com/

smatch warnings:
net/core/dev.c:9577 bpf_xdp_link_attach() error: uninitialized symbol 'err'.
net/core/dev.c:9578 bpf_xdp_link_attach() error: uninitialized symbol 'link'.

vim +/err +9577 net/core/dev.c

aa8d3a716b59db Andrii Nakryiko 2020-07-21  9541  
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9542  int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9543  {
0b17071af397a0 Johannes Berg   2024-03-25  9544  	/* link itself doesn't hold dev's refcnt to not complicate shutdown */
0b17071af397a0 Johannes Berg   2024-03-25  9545  	struct net_device *dev __free(dev_put) = NULL;
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9546  	struct net *net = current->nsproxy->net_ns;
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9547  	struct bpf_link_primer link_primer;
bf4ea1d0b2cb22 Leon Hwang      2023-08-01  9548  	struct netlink_ext_ack extack = {};
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9549  	struct bpf_xdp_link *link;
0b17071af397a0 Johannes Berg   2024-03-25  9550  	int err;
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9551  
0b17071af397a0 Johannes Berg   2024-03-25  9552  	scoped_guard(rtnl) {
0b17071af397a0 Johannes Berg   2024-03-25  9553  		dev = dev_get_by_index(net,
0b17071af397a0 Johannes Berg   2024-03-25  9554  				       attr->link_create.target_ifindex);
0b17071af397a0 Johannes Berg   2024-03-25  9555  		if (!dev)
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9556  			return -EINVAL;
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9557  
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9558  		link = kzalloc(sizeof(*link), GFP_USER);
0b17071af397a0 Johannes Berg   2024-03-25  9559  		if (!link)
0b17071af397a0 Johannes Berg   2024-03-25  9560  			return -ENOMEM;
0b17071af397a0 Johannes Berg   2024-03-25  9561  
0b17071af397a0 Johannes Berg   2024-03-25  9562  		bpf_link_init(&link->link, BPF_LINK_TYPE_XDP,
0b17071af397a0 Johannes Berg   2024-03-25  9563  			      &bpf_xdp_link_lops, prog);
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9564  
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9565  		link->dev = dev;
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9566  		link->flags = attr->link_create.flags;
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9567  
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9568  		err = bpf_link_prime(&link->link, &link_primer);
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9569  		if (err) {
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9570  			kfree(link);
0b17071af397a0 Johannes Berg   2024-03-25  9571  			return err;
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9572  		}
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9573  
bf4ea1d0b2cb22 Leon Hwang      2023-08-01  9574  		err = dev_xdp_attach_link(dev, &extack, link);
0b17071af397a0 Johannes Berg   2024-03-25  9575  	}
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9576  
aa8d3a716b59db Andrii Nakryiko 2020-07-21 @9577  	if (err) {
5acc7d3e8d3428 Xuan Zhuo       2021-07-10 @9578  		link->dev = NULL;
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9579  		bpf_link_cleanup(&link_primer);
bf4ea1d0b2cb22 Leon Hwang      2023-08-01  9580  		trace_bpf_xdp_link_attach_failed(extack._msg);
0b17071af397a0 Johannes Berg   2024-03-25  9581  		return err;
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9582  	}
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9583  
0b17071af397a0 Johannes Berg   2024-03-25  9584  	return bpf_link_settle(&link_primer);
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9585  }
aa8d3a716b59db Andrii Nakryiko 2020-07-21  9586  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
