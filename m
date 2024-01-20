Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F98E14283
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 23:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705794543; cv=none; b=YoB1NkBRj+HewvERwOd4uWFTq9s71DgbIfepzIXEPa8skD2TLFyuKtM7Zbzu2BOEY+9XmSACnuBb40Dk+tAHM0vmqzUlddf4VE0UhyrwXyEBx40p6FxioinIq3IrO+hkLeqFce5fp+Mcmxx5saaWtbCcPakQmjyeVi/DylYs5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705794543; c=relaxed/simple;
	bh=HIyle1GijD3bUqGm9Q3829+VzOz6K80uzoegR2yO+/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1iMzRja8xEQDfYLTUmsEH+n/kqYmrInk5TOJlwNtlybUq7Kifr+ud7UQYet5+hk/rtcUe2m/kOVspkDyoiGIdOIxzyA07P4jE9N1W++rXBm4E+Gr7/afpMEL5daQ2qfguuiZgzmKLNOb+yGwvKQOteeNNAqumYV31wvMw9BcSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKJcOQTz; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKJcOQTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705794540; x=1737330540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HIyle1GijD3bUqGm9Q3829+VzOz6K80uzoegR2yO+/s=;
  b=LKJcOQTzeVaiNM0anpIyI+FWlzUWdXje/ZzUdpIGHF6B3CMWosL4lz/F
   ywZ3BbNOAq5OYS2x2vuMUJgcMqIhbjsZ9OgXbIQwBOYkAFolH9a5O63ec
   uwpM1UuhsQa9jiCVwNG5rNjUlERmjOktlxSC/Od4mgfeMY8DNRYhZioX/
   3UpUhF82FYVOx4e8l0ypbHFwgIrT/ThRw0kZWqH+oRvh3JLcvNZFNU/Tc
   /7iBKfZ98OnBaVTojsVlSQJyfb9ckFofXHU1UMMXa53Vz0sHTmmUMU+iO
   km/mtxhDBUcuonn+wsOz01j9u824NUkz7JqEbd7l1XR1ZJINMA0sTwA+Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="467358626"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="467358626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 15:48:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="27038336"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2024 15:48:58 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRL54-0005X4-1y;
	Sat, 20 Jan 2024 23:48:54 +0000
Date: Sun, 21 Jan 2024 07:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c:170
 ipsec_fs_roce_rx_rule_setup() warn: missing error code 'err'
Message-ID: <202401210739.xiykyqPN-lkp@intel.com>
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
head:   80fc600fafee8ba981da6ed41a572800c8e11de6
commit: f2f0231cfe8905af217e5bf1a08bfb8e4d3b74fb net/mlx5: Configure IPsec steering for ingress RoCEv2 MPV traffic
date:   4 months ago
:::::: branch date: 83 minutes ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210739.xiykyqPN-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401210739.xiykyqPN-lkp@intel.com/

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
