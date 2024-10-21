Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D181E573E
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729511717; cv=none; b=ZLPc05Yj3xqnjpsFEUJ/Cbtz7gjUxDwidFeviSvzL+WEiEgdr8qIA/FYXulMwX6PAjnmYeifOEGzM5+bwncXNWxgql9Isa+EuVaPNvEVOBJsHhEeqMeyZwv6fkfYEItPObxyW885h6nlrpA13r5Q88+KGepaR3RDBmQ6T2o71Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729511717; c=relaxed/simple;
	bh=GKB1LO7TuEPnk5wzxds2A4Jp6O08PhXNx+F9oe6HLno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XWYhZXAOwcKjsErFTXRRDnXHeF98h9rks2E3S2X5FBF50pCHl2O2+mmNOxaWiEU1y2a9jy2K3UhQiQcHWRhIcelLRI6LZV9wq2ePKNpa7zXuprr6C8pPufv/vyazAPWb0+sQqM2Ny3TaAPImDIumelpUcXQ20eUCYO+zM/aeh0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHY7j5f5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHY7j5f5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729511716; x=1761047716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GKB1LO7TuEPnk5wzxds2A4Jp6O08PhXNx+F9oe6HLno=;
  b=LHY7j5f5ry941p16LwEg0IMJli0USumiGBs5pPgrQKFzb1PgtmUwbfKg
   22r4/YpQvN9BqA8lGzorNAlVJe0bZMZZKshuYqp8qbi3RDBbgIIPtnqD8
   SgpesB3/IV+foOB6raabw8i5tmsrvC6HDRPDcrVUtzKnJSHPbV61/Av7F
   DhVp6kR+v+Sp/M923UcWySpzlfBS4lCjQUUQlI6Ru/m2fm29CJEVb/3Ik
   8ksCmUt4rX/gjbG7yQBuDK+33mTRz8GfDnjtPUQAiBqLSujgXKTwE3cod
   xkLDOxZv/9Aq0r3Ba3EeghOXLYCucdkPPJUNLixWqXBMZxxuN8UMllWN0
   A==;
X-CSE-ConnectionGUID: h5HCFgCERMOgW56pGi62DQ==
X-CSE-MsgGUID: ybqi/GXlT3W8BPsY0Mu2HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40361203"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="40361203"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 04:55:14 -0700
X-CSE-ConnectionGUID: KdAPpwlnSwWYQ9j9Y8FOGw==
X-CSE-MsgGUID: GHNlU6EiQniY1Efm+0qrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="116948239"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2024 04:55:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2r0A-000S5i-04;
	Mon, 21 Oct 2024 11:55:10 +0000
Date: Mon, 21 Oct 2024 19:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c:170
 ipsec_fs_roce_rx_rule_setup() warn: missing error code 'err'
Message-ID: <202410211955.VBaA7XKa-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Patrisious Haddad <phaddad@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Mark Bloch <mbloch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42f7652d3eb527d03665b09edac47f85fb600924
commit: f2f0231cfe8905af217e5bf1a08bfb8e4d3b74fb net/mlx5: Configure IPsec steering for ingress RoCEv2 MPV traffic
date:   1 year, 1 month ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-r072-20241021 (https://download.01.org/0day-ci/archive/20241021/202410211955.VBaA7XKa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410211955.VBaA7XKa-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c:170 ipsec_fs_roce_rx_rule_setup() warn: missing error code 'err'

vim +/err +170 drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c

69c08efcbe7fa8 Patrisious Haddad 2023-09-21  121  
899577600b25b3 Mark Zhang        2023-01-04  122  static int
899577600b25b3 Mark Zhang        2023-01-04  123  ipsec_fs_roce_rx_rule_setup(struct mlx5_core_dev *mdev,
899577600b25b3 Mark Zhang        2023-01-04  124  			    struct mlx5_flow_destination *default_dst,
899577600b25b3 Mark Zhang        2023-01-04  125  			    struct mlx5_ipsec_rx_roce *roce)
899577600b25b3 Mark Zhang        2023-01-04  126  {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  127  	bool is_mpv_slave = mlx5_core_is_mp_slave(mdev);
899577600b25b3 Mark Zhang        2023-01-04  128  	struct mlx5_flow_destination dst = {};
899577600b25b3 Mark Zhang        2023-01-04  129  	MLX5_DECLARE_FLOW_ACT(flow_act);
899577600b25b3 Mark Zhang        2023-01-04  130  	struct mlx5_flow_handle *rule;
899577600b25b3 Mark Zhang        2023-01-04  131  	struct mlx5_flow_spec *spec;
899577600b25b3 Mark Zhang        2023-01-04  132  	int err = 0;
899577600b25b3 Mark Zhang        2023-01-04  133  
899577600b25b3 Mark Zhang        2023-01-04  134  	spec = kvzalloc(sizeof(*spec), GFP_KERNEL);
899577600b25b3 Mark Zhang        2023-01-04  135  	if (!spec)
899577600b25b3 Mark Zhang        2023-01-04  136  		return -ENOMEM;
899577600b25b3 Mark Zhang        2023-01-04  137  
899577600b25b3 Mark Zhang        2023-01-04  138  	ipsec_fs_roce_setup_udp_dport(spec, ROCE_V2_UDP_DPORT);
899577600b25b3 Mark Zhang        2023-01-04  139  
899577600b25b3 Mark Zhang        2023-01-04  140  	flow_act.action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  141  	if (is_mpv_slave) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  142  		dst.type = MLX5_FLOW_DESTINATION_TYPE_FLOW_TABLE;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  143  		dst.ft = roce->goto_alias_ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  144  	} else {
899577600b25b3 Mark Zhang        2023-01-04  145  		dst.type = MLX5_FLOW_DESTINATION_TYPE_TABLE_TYPE;
899577600b25b3 Mark Zhang        2023-01-04  146  		dst.ft = roce->ft_rdma;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  147  	}
899577600b25b3 Mark Zhang        2023-01-04  148  	rule = mlx5_add_flow_rules(roce->ft, spec, &flow_act, &dst, 1);
899577600b25b3 Mark Zhang        2023-01-04  149  	if (IS_ERR(rule)) {
899577600b25b3 Mark Zhang        2023-01-04  150  		err = PTR_ERR(rule);
899577600b25b3 Mark Zhang        2023-01-04  151  		mlx5_core_err(mdev, "Fail to add RX RoCE IPsec rule err=%d\n",
899577600b25b3 Mark Zhang        2023-01-04  152  			      err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  153  		goto out;
899577600b25b3 Mark Zhang        2023-01-04  154  	}
899577600b25b3 Mark Zhang        2023-01-04  155  
899577600b25b3 Mark Zhang        2023-01-04  156  	roce->rule = rule;
899577600b25b3 Mark Zhang        2023-01-04  157  
899577600b25b3 Mark Zhang        2023-01-04  158  	memset(spec, 0, sizeof(*spec));
899577600b25b3 Mark Zhang        2023-01-04  159  	rule = mlx5_add_flow_rules(roce->ft, spec, &flow_act, default_dst, 1);
899577600b25b3 Mark Zhang        2023-01-04  160  	if (IS_ERR(rule)) {
899577600b25b3 Mark Zhang        2023-01-04  161  		err = PTR_ERR(rule);
899577600b25b3 Mark Zhang        2023-01-04  162  		mlx5_core_err(mdev, "Fail to add RX RoCE IPsec miss rule err=%d\n",
899577600b25b3 Mark Zhang        2023-01-04  163  			      err);
899577600b25b3 Mark Zhang        2023-01-04  164  		goto fail_add_default_rule;
899577600b25b3 Mark Zhang        2023-01-04  165  	}
899577600b25b3 Mark Zhang        2023-01-04  166  
899577600b25b3 Mark Zhang        2023-01-04  167  	roce->roce_miss.rule = rule;
899577600b25b3 Mark Zhang        2023-01-04  168  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  169  	if (!is_mpv_slave)
f2f0231cfe8905 Patrisious Haddad 2023-09-21 @170  		goto out;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  171  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  172  	flow_act.action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  173  	dst.type = MLX5_FLOW_DESTINATION_TYPE_TABLE_TYPE;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  174  	dst.ft = roce->ft_rdma;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  175  	rule = mlx5_add_flow_rules(roce->nic_master_ft, NULL, &flow_act, &dst,
f2f0231cfe8905 Patrisious Haddad 2023-09-21  176  				   1);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  177  	if (IS_ERR(rule)) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  178  		err = PTR_ERR(rule);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  179  		mlx5_core_err(mdev, "Fail to add RX RoCE IPsec rule for alias err=%d\n",
f2f0231cfe8905 Patrisious Haddad 2023-09-21  180  			      err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  181  		goto fail_add_nic_master_rule;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  182  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  183  	roce->nic_master_rule = rule;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  184  
899577600b25b3 Mark Zhang        2023-01-04  185  	kvfree(spec);
899577600b25b3 Mark Zhang        2023-01-04  186  	return 0;
899577600b25b3 Mark Zhang        2023-01-04  187  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  188  fail_add_nic_master_rule:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  189  	mlx5_del_flow_rules(roce->roce_miss.rule);
899577600b25b3 Mark Zhang        2023-01-04  190  fail_add_default_rule:
899577600b25b3 Mark Zhang        2023-01-04  191  	mlx5_del_flow_rules(roce->rule);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  192  out:
899577600b25b3 Mark Zhang        2023-01-04  193  	kvfree(spec);
899577600b25b3 Mark Zhang        2023-01-04  194  	return err;
899577600b25b3 Mark Zhang        2023-01-04  195  }
899577600b25b3 Mark Zhang        2023-01-04  196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
