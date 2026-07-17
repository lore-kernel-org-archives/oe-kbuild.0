Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA5D43F08A
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 22:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327381; cv=none; b=W33KQUSspklYGLeGK2sH9Hw0eKAR/Zd3Y5/Ht/0U6hVxROXPiEwk8i/mhlybNNq1S7L1dKMgD96QLwxH0OpN15WSrgmmNjaIE2o6Oc7SxehnSCWwHtcXLvWGivbw0Q+qKGiyvY5fHr+oCPKplNV2cxNJSjBkYHH3JpoXw0vDe44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327381; c=relaxed/simple;
	bh=Eu2APkJBNhTdwmrtKjCtFcmSWKgoG9pQXoeyIRq6mjA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OJqhifneC3eNOyab+8TrfwU7qt5Iikyc30uOc/Z3WRCpFZtOJmDK5ya5KlLb3UmBiVH729wFFrKLxDK4mz1HAMA22JatKNpnObXm6snWgQ08Gby+q19aQuSaUa9z/zVnc8TAUwxSvVxc9x3WNWhxLZL3469r57kgbr3R28Aby04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaWt1smd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaWt1smd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784327380; x=1815863380;
  h=date:from:to:cc:subject:message-id;
  bh=Eu2APkJBNhTdwmrtKjCtFcmSWKgoG9pQXoeyIRq6mjA=;
  b=LaWt1smdqQj1vUksdsn1yCI/z/5d2bPdZLH3zciZYK2tbJuB/zwB/we8
   ZVCcnX2w6vVOLAFXDbind8axYuWG4Ty/TAwIN7Fi5pWOVrZkKC0+aouLb
   jA28uJJG0ER0aG2oD9N40QldeLmB/3OWktAizKbgvGa8HceAv5hEDBmVH
   fMPNOowJ/CZQzvnUmHeIVHgbeMfHqs1Is1+OgRys7bvuuBddTTLJOKjz5
   Zbir6bgbbQLwMYK0/0cM47C+OSsnNS1EY0vqIXDBPNp4RY+ko5BccQEmG
   gZ+A1G82jRR12Xb6KebQXUiYvvk8XMU9h/+f3xtJ6eedvuCb/VAjEWbXk
   Q==;
X-CSE-ConnectionGUID: qc/0QkfrQ/G1F5BI6MsBNg==
X-CSE-MsgGUID: dXfeYRAgSAy0JLmkomVo2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="110555044"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="110555044"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 15:29:39 -0700
X-CSE-ConnectionGUID: JPrOeGGwQayhk+sWXJM9KA==
X-CSE-MsgGUID: sa8pBlErRvCBMzHs/z1iJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255731341"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Jul 2026 15:29:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkr3W-00000000TCH-0Obk;
	Fri, 17 Jul 2026 22:29:26 +0000
Date: Sat, 18 Jul 2026 06:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:2159
 mlx5_esw_spfs_init() warn: missing error code 'err'
Message-ID: <202607180633.eUvzLbUZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Moshe Shemesh <moshe@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Tariq Toukan <tariqt@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af5e34a41cd607c00ef752e00331736570992354
commit: ed9671b8bd4f084b9b2798d3892c3c83f3c1010c net/mlx5: Add satellite PF vport support
date:   8 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: powerpc64-randconfig-r071-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180633.eUvzLbUZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ed9671b8bd4f ("net/mlx5: Add satellite PF vport support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607180633.eUvzLbUZ-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:2159 mlx5_esw_spfs_init() warn: missing error code 'err'

vim +/err +2159 drivers/net/ethernet/mellanox/mlx5/core/eswitch.c

ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2137  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2138  static int mlx5_esw_spfs_init(struct mlx5_eswitch *esw)
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2139  {
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2140  	struct mlx5_esw_functions *esw_funcs = &esw->esw_funcs;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2141  	struct mlx5_core_dev *dev = esw->dev;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2142  	int num_entries;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2143  	const u8 *entry;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2144  	const u32 *out;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2145  	int err = 0;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2146  	int pf_type;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2147  	u16 vhca_id;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2148  	int i;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2149  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2150  	if (!MLX5_CAP_GEN(dev, query_host_net_function_v1))
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2151  		return 0;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2152  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2153  	out = mlx5_esw_query_functions(dev);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2154  	if (IS_ERR(out))
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2155  		return PTR_ERR(out);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2156  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2157  	num_entries = MLX5_GET(query_esw_functions_out, out, net_function_num);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2158  	if (!num_entries)
ed9671b8bd4f08 Moshe Shemesh 2026-05-21 @2159  		goto out_free;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2160  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2161  	esw_funcs->spfs = kcalloc(num_entries, sizeof(*esw_funcs->spfs),
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2162  				  GFP_KERNEL);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2163  	if (!esw_funcs->spfs) {
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2164  		err = -ENOMEM;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2165  		goto out_free;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2166  	}
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2167  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2168  	entry = MLX5_ADDR_OF(query_esw_functions_out, out, net_function_params);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2169  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2170  	for (i = 0; i < num_entries; i++) {
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2171  		u16 vport_num;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2172  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2173  		pf_type = MLX5_GET(network_function_params, entry, pci_pf_type);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2174  		if (pf_type != MLX5_PCI_PF_TYPE_SATELLITE_PF) {
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2175  			entry += MLX5_UN_SZ_BYTES(net_function_params);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2176  			continue;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2177  		}
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2178  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2179  		if (!MLX5_GET(network_function_params, entry,
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2180  			      esw_vport_manual)) {
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2181  			esw_warn(dev, "Satellite PF without esw_vport_manual is not supported\n");
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2182  			entry += MLX5_UN_SZ_BYTES(net_function_params);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2183  			continue;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2184  		}
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2185  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2186  		vhca_id = MLX5_GET(network_function_params, entry, vhca_id);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2187  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2188  		err = mlx5_esw_create_esw_vport(dev, vhca_id, &vport_num);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2189  		if (err) {
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2190  			esw_warn(dev, "Failed to create satellite PF vport for vhca_id 0x%x, err %d\n",
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2191  				 vhca_id, err);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2192  			goto spfs_cleanup;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2193  		}
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2194  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2195  		esw_funcs->spfs[esw_funcs->num_spfs].vport_num = vport_num;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2196  		esw_funcs->spfs[esw_funcs->num_spfs].vhca_id = vhca_id;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2197  		esw_funcs->num_spfs++;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2198  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2199  		entry += MLX5_UN_SZ_BYTES(net_function_params);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2200  	}
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2201  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2202  	if (!esw_funcs->num_spfs) {
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2203  		kfree(esw_funcs->spfs);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2204  		esw_funcs->spfs = NULL;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2205  	}
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2206  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2207  	kvfree(out);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2208  	return 0;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2209  
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2210  spfs_cleanup:
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2211  	mlx5_esw_spfs_cleanup(esw);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2212  out_free:
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2213  	kvfree(out);
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2214  	return err;
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2215  }
ed9671b8bd4f08 Moshe Shemesh 2026-05-21  2216  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
