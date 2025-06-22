Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7688347C7
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jun 2025 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750586072; cv=none; b=U+bckBtUl8up7Mp4lEz0B+wG7N6xk5cWD9PcNObRkgDbhj4uf+2z3P6lVw4CRpnKhvyAGI7MScGqmehnLit4lW36Vg8mvUPb5B9lcYWKXIQ1AXch20RBEfFCwT0irxAxa3ktbz7czlEuAV9gzgngFBzSXQH+YgIJNW5hPVZ9wrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750586072; c=relaxed/simple;
	bh=rE7cKcC9WQgJW5rIGgWrqZRg6SrrJLqcrtxdXsVzjnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xg8WxH+SWjYDBO6Z4N3EVTPl86Sa9HgiejOWl5+spa5pGpaq1jJweQpRdU2IX7+t5hSCcJwlDlRooVkwcZ0g51bhLGpqxzq1hcNa6u1rxX5Xe9vMNrcmmLoDngEwczfEvNquGQY8OGLotUSuQ4HNHcX393tuoIDkGgdiYk/syzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bamT/y82; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bamT/y82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750586070; x=1782122070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rE7cKcC9WQgJW5rIGgWrqZRg6SrrJLqcrtxdXsVzjnU=;
  b=bamT/y82i/bcV8qWFZEq1HojYxxhyw4lS7BKcJgA1jexUnK6LOUMEjB1
   VdFHS7OBclXXCCrRDHSUjCUquLmBLwLnN3OuP0gjAMhNSJ1rsUZyyLgiF
   iEVjHEErXy/z+toZ3ZQeI8qEmuagFxzmAh2zq31EXI4M6GmnL8mv2S/Sm
   vGwyIddwt6Xda3n+bSo0TV61tIobjXoNzXgh2jZovZbaGRPCIvdKcG2lh
   UjYdGc8JVClV2oD0W11p75DkEfM7pmJeoeY7txhoebc7I0KJU7JISLycm
   biURz6X+pvygGrVvmMUFLANZLHb89+ldmj+94D5biGJtT+MNM4c6VfL57
   Q==;
X-CSE-ConnectionGUID: 9GC6Gv19QwKLq1KefkxaaQ==
X-CSE-MsgGUID: Q5Mb5e2YRyekV2EsqFuSjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52516600"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52516600"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 02:54:30 -0700
X-CSE-ConnectionGUID: FpHbOOHaSquXWNMHiQKi+A==
X-CSE-MsgGUID: GznGM0rURSmF08iG9mBV0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="182193672"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2025 02:54:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTHP8-000NBq-2Y;
	Sun, 22 Jun 2025 09:54:26 +0000
Date: Sun, 22 Jun 2025 17:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-playground:to_build 44/57]
 drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c:435:12: warning:
 stack frame size (1080) exceeds limit (1024) in
 'ipsec_fs_roce_rx_mpv_create'
Message-ID: <202506221717.XWeMwsJt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   45965d80ee21635e7f04e6d7fd6caa929820b219
commit: 276c406d6c7bd470813f8fc95affe88be9632beb [44/57] Kbuild: reduce per-function stack usage in kasan/kmsan
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250622/202506221717.XWeMwsJt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221717.XWeMwsJt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506221717.XWeMwsJt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c:4:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/fs_core.h:37:
   In file included from include/linux/mlx5/fs.h:36:
   In file included from include/linux/mlx5/driver.h:38:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c:435:12: warning: stack frame size (1080) exceeds limit (1024) in 'ipsec_fs_roce_rx_mpv_create' [-Wframe-larger-than]
     435 | static int ipsec_fs_roce_rx_mpv_create(struct mlx5_core_dev *mdev,
         |            ^
   2 warnings generated.


vim +/ipsec_fs_roce_rx_mpv_create +435 drivers/net/ethernet/mellanox/mlx5/core/lib/ipsec_fs_roce.c

f2f0231cfe8905 Patrisious Haddad 2023-09-21  434  
f2f0231cfe8905 Patrisious Haddad 2023-09-21 @435  static int ipsec_fs_roce_rx_mpv_create(struct mlx5_core_dev *mdev,
f2f0231cfe8905 Patrisious Haddad 2023-09-21  436  				       struct mlx5_ipsec_fs *ipsec_roce,
f2f0231cfe8905 Patrisious Haddad 2023-09-21  437  				       struct mlx5_flow_namespace *ns,
f2f0231cfe8905 Patrisious Haddad 2023-09-21  438  				       u32 family, u32 level, u32 prio)
f2f0231cfe8905 Patrisious Haddad 2023-09-21  439  {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  440  	struct mlx5_flow_namespace *roce_ns, *nic_ns;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  441  	struct mlx5_flow_table_attr ft_attr = {};
f2f0231cfe8905 Patrisious Haddad 2023-09-21  442  	struct mlx5_devcom_comp_dev *tmp = NULL;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  443  	struct mlx5_ipsec_rx_roce *roce;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  444  	struct mlx5_flow_table next_ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  445  	struct mlx5_flow_table *ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  446  	struct mlx5_flow_group *g;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  447  	struct mlx5e_priv *peer_priv;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  448  	int ix = 0;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  449  	u32 *in;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  450  	int err;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  451  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  452  	roce = (family == AF_INET) ? &ipsec_roce->ipv4_rx :
f2f0231cfe8905 Patrisious Haddad 2023-09-21  453  				     &ipsec_roce->ipv6_rx;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  454  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  455  	if (!mlx5_devcom_for_each_peer_begin(*ipsec_roce->devcom))
f2f0231cfe8905 Patrisious Haddad 2023-09-21  456  		return -EOPNOTSUPP;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  457  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  458  	peer_priv = mlx5_devcom_get_next_peer_data(*ipsec_roce->devcom, &tmp);
607e1df7bd47fe Patrisious Haddad 2024-08-15  459  	if (!peer_priv || !peer_priv->ipsec) {
607e1df7bd47fe Patrisious Haddad 2024-08-15  460  		mlx5_core_err(mdev, "IPsec not supported on master device\n");
f2f0231cfe8905 Patrisious Haddad 2023-09-21  461  		err = -EOPNOTSUPP;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  462  		goto release_peer;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  463  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  464  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  465  	roce_ns = mlx5_get_flow_namespace(peer_priv->mdev, MLX5_FLOW_NAMESPACE_RDMA_RX_IPSEC);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  466  	if (!roce_ns) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  467  		err = -EOPNOTSUPP;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  468  		goto release_peer;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  469  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  470  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  471  	nic_ns = mlx5_get_flow_namespace(peer_priv->mdev, MLX5_FLOW_NAMESPACE_KERNEL);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  472  	if (!nic_ns) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  473  		err = -EOPNOTSUPP;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  474  		goto release_peer;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  475  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  476  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  477  	in = kvzalloc(MLX5_ST_SZ_BYTES(create_flow_group_in), GFP_KERNEL);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  478  	if (!in) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  479  		err = -ENOMEM;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  480  		goto release_peer;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  481  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  482  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  483  	ft_attr.level = (family == AF_INET) ? MLX5_IPSEC_RX_IPV4_FT_LEVEL :
f2f0231cfe8905 Patrisious Haddad 2023-09-21  484  					      MLX5_IPSEC_RX_IPV6_FT_LEVEL;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  485  	ft_attr.max_fte = 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  486  	ft = mlx5_create_flow_table(roce_ns, &ft_attr);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  487  	if (IS_ERR(ft)) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  488  		err = PTR_ERR(ft);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  489  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx ft at rdma master err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  490  		goto free_in;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  491  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  492  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  493  	roce->ft_rdma = ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  494  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  495  	ft_attr.max_fte = 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  496  	ft_attr.prio = prio;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  497  	ft_attr.level = level + 2;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  498  	ft = mlx5_create_flow_table(nic_ns, &ft_attr);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  499  	if (IS_ERR(ft)) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  500  		err = PTR_ERR(ft);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  501  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx ft at NIC master err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  502  		goto destroy_ft_rdma;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  503  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  504  	roce->nic_master_ft = ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  505  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  506  	MLX5_SET_CFG(in, start_flow_index, ix);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  507  	ix += 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  508  	MLX5_SET_CFG(in, end_flow_index, ix - 1);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  509  	g = mlx5_create_flow_group(roce->nic_master_ft, in);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  510  	if (IS_ERR(g)) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  511  		err = PTR_ERR(g);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  512  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx group aliased err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  513  		goto destroy_nic_master_ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  514  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  515  	roce->nic_master_group = g;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  516  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  517  	err = ipsec_fs_create_aliased_ft(peer_priv->mdev, mdev, roce->nic_master_ft,
82f9378c443c20 Patrisious Haddad 2023-09-21  518  					 &roce->alias_id, roce->key, false);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  519  	if (err) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  520  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx alias FT err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  521  		goto destroy_group;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  522  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  523  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  524  	next_ft.id = roce->alias_id;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  525  	ft_attr.max_fte = 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  526  	ft_attr.prio = prio;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  527  	ft_attr.level = roce->ft->level + 1;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  528  	ft_attr.flags = MLX5_FLOW_TABLE_UNMANAGED;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  529  	ft_attr.next_ft = &next_ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  530  	ft = mlx5_create_flow_table(ns, &ft_attr);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  531  	if (IS_ERR(ft)) {
f2f0231cfe8905 Patrisious Haddad 2023-09-21  532  		err = PTR_ERR(ft);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  533  		mlx5_core_err(mdev, "Fail to create RoCE IPsec rx ft at NIC slave err=%d\n", err);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  534  		goto destroy_alias;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  535  	}
f2f0231cfe8905 Patrisious Haddad 2023-09-21  536  	roce->goto_alias_ft = ft;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  537  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  538  	kvfree(in);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  539  	mlx5_devcom_for_each_peer_end(*ipsec_roce->devcom);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  540  	return 0;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  541  
f2f0231cfe8905 Patrisious Haddad 2023-09-21  542  destroy_alias:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  543  	mlx5_cmd_alias_obj_destroy(mdev, roce->alias_id,
f2f0231cfe8905 Patrisious Haddad 2023-09-21  544  				   MLX5_GENERAL_OBJECT_TYPES_FLOW_TABLE_ALIAS);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  545  destroy_group:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  546  	mlx5_destroy_flow_group(roce->nic_master_group);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  547  destroy_nic_master_ft:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  548  	mlx5_destroy_flow_table(roce->nic_master_ft);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  549  destroy_ft_rdma:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  550  	mlx5_destroy_flow_table(roce->ft_rdma);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  551  free_in:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  552  	kvfree(in);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  553  release_peer:
f2f0231cfe8905 Patrisious Haddad 2023-09-21  554  	mlx5_devcom_for_each_peer_end(*ipsec_roce->devcom);
f2f0231cfe8905 Patrisious Haddad 2023-09-21  555  	return err;
f2f0231cfe8905 Patrisious Haddad 2023-09-21  556  }
f2f0231cfe8905 Patrisious Haddad 2023-09-21  557  

:::::: The code at line 435 was first introduced by commit
:::::: f2f0231cfe8905af217e5bf1a08bfb8e4d3b74fb net/mlx5: Configure IPsec steering for ingress RoCEv2 MPV traffic

:::::: TO: Patrisious Haddad <phaddad@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
