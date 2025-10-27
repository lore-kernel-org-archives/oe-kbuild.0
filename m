Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9930925486D
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556284; cv=none; b=EbhgvlajQQ6UOm+rEIWSKw9FWZaNvran++lrvlnyiDyGF8ThW89N1SdJ1bAN2BNaUpy8Pov86nca4DzG3/v6idcz0mw6jc8mFKJinjxpGByxVlw+iEcyr2MLF0dgZoPPHq4tHZvyLMD7v2VwKUZXTHeR02mPcKRpMDRy2fF2qJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556284; c=relaxed/simple;
	bh=nSQV4ZJpt8eEoHC2lTuhrYZ785ZPKoLJm0ViyH6G9lM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cmi339l9/vshfqrWZc5F09q2qTwJ9+LlvV4KP3BJV6Z43sdt1kbC1IuuaFXwoRGYZeH0ZSItIAkvj+vXQJ1Zlgyh94EbepWuuEElPAWpaWwjFYRzs06JOgYFLzqvnGUxnM1ppc9ZpJXs9Dvlu/Klcx6/0ZNl/X9ozmNZu3uRAMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihHcztxp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihHcztxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761556283; x=1793092283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nSQV4ZJpt8eEoHC2lTuhrYZ785ZPKoLJm0ViyH6G9lM=;
  b=ihHcztxpvDQBU72MPqMilNy80YAAVysYv70CdEv9UcQdeFDVcsqR4OaC
   7ioa0KlVQ/KJfJ77goVDXe9zAACrnTjT/xJkxFmBWdL90czPqaAo+5Huk
   4eLGHtFgVVl5ualo5wo9lH0dNd7dxTFmz6WkcHIBh8k0LWFovft4eMsRI
   P1dgTMM96GXtzFnGp5avwSheSNaoemwsGJ0PZ9+NGn2OzIcsuMaVuQsHS
   JF5ewi1JQUeGP1iiSgUNUvxlL6gL7rnhGqFEUgAUFJokodbBfB5zkqswG
   URmsPhzZGuB1Dv04lhE1PQuG5tABuJRWqHwfyzlfXzLAaZTR7MKyYe1Zf
   w==;
X-CSE-ConnectionGUID: MyP0VlGGTWaJPBKo1s2mSg==
X-CSE-MsgGUID: nhVs/DQpRPiRJKI9c7ly9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66246019"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="66246019"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:11:22 -0700
X-CSE-ConnectionGUID: KimKoAxUTsuTv2fax31VsQ==
X-CSE-MsgGUID: 3JcsBzQfSDK/xQpLjcDLxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="222204121"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Oct 2025 02:11:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDJG2-000GeT-0W;
	Mon, 27 Oct 2025 09:11:18 +0000
Date: Mon, 27 Oct 2025 17:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c:808
 mlx5e_xfrm_add_state() warn: missing error code 'err'
Message-ID: <202510271649.uwsIxD6O-lkp@intel.com>
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
TO: Carolina Jubran <cjubran@nvidia.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Jianbo Liu <jianbol@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Tariq Toukan <tariqt@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
commit: 22239eb258bc1e6ccdb2d3502fce1cc2b2a88386 net/mlx5e: Prevent tunnel reformat when tunnel mode not allowed
date:   3 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-r072-20251026 (https://download.01.org/0day-ci/archive/20251027/202510271649.uwsIxD6O-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510271649.uwsIxD6O-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c:808 mlx5e_xfrm_add_state() warn: missing error code 'err'

vim +/err +808 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c

b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  769  
43eca05b6a3b91 Cosmin Ratiu    2025-04-11  770  static int mlx5e_xfrm_add_state(struct net_device *dev,
43eca05b6a3b91 Cosmin Ratiu    2025-04-11  771  				struct xfrm_state *x,
7681a4f58fb9c3 Leon Romanovsky 2023-01-24  772  				struct netlink_ext_ack *extack)
547eede070eb98 Ilan Tayari     2017-04-18  773  {
547eede070eb98 Ilan Tayari     2017-04-18  774  	struct mlx5e_ipsec_sa_entry *sa_entry = NULL;
22239eb258bc1e Carolina Jubran 2025-10-05  775  	bool allow_tunnel_mode = false;
403b383a3ce3eb Leon Romanovsky 2022-12-02  776  	struct mlx5e_ipsec *ipsec;
547eede070eb98 Ilan Tayari     2017-04-18  777  	struct mlx5e_priv *priv;
aa8bd0c9518cc5 Raed Salem      2023-03-14  778  	gfp_t gfp;
547eede070eb98 Ilan Tayari     2017-04-18  779  	int err;
547eede070eb98 Ilan Tayari     2017-04-18  780  
43eca05b6a3b91 Cosmin Ratiu    2025-04-11  781  	priv = netdev_priv(dev);
021a429bdbde93 Leon Romanovsky 2022-03-01  782  	if (!priv->ipsec)
021a429bdbde93 Leon Romanovsky 2022-03-01  783  		return -EOPNOTSUPP;
547eede070eb98 Ilan Tayari     2017-04-18  784  
403b383a3ce3eb Leon Romanovsky 2022-12-02  785  	ipsec = priv->ipsec;
aa8bd0c9518cc5 Raed Salem      2023-03-14  786  	gfp = (x->xso.flags & XFRM_DEV_OFFLOAD_FLAG_ACQ) ? GFP_ATOMIC : GFP_KERNEL;
aa8bd0c9518cc5 Raed Salem      2023-03-14  787  	sa_entry = kzalloc(sizeof(*sa_entry), gfp);
902812b81604dd Leon Romanovsky 2023-01-24  788  	if (!sa_entry)
902812b81604dd Leon Romanovsky 2023-01-24  789  		return -ENOMEM;
547eede070eb98 Ilan Tayari     2017-04-18  790  
547eede070eb98 Ilan Tayari     2017-04-18  791  	sa_entry->x = x;
43eca05b6a3b91 Cosmin Ratiu    2025-04-11  792  	sa_entry->dev = dev;
403b383a3ce3eb Leon Romanovsky 2022-12-02  793  	sa_entry->ipsec = ipsec;
aa8bd0c9518cc5 Raed Salem      2023-03-14  794  	/* Check if this SA is originated from acquire flow temporary SA */
aa8bd0c9518cc5 Raed Salem      2023-03-14  795  	if (x->xso.flags & XFRM_DEV_OFFLOAD_FLAG_ACQ)
aa8bd0c9518cc5 Raed Salem      2023-03-14  796  		goto out;
aa8bd0c9518cc5 Raed Salem      2023-03-14  797  
aa8bd0c9518cc5 Raed Salem      2023-03-14  798  	err = mlx5e_xfrm_validate_state(priv->mdev, x, extack);
aa8bd0c9518cc5 Raed Salem      2023-03-14  799  	if (err)
aa8bd0c9518cc5 Raed Salem      2023-03-14  800  		goto err_xfrm;
547eede070eb98 Ilan Tayari     2017-04-18  801  
8efd7b17a3b032 Leon Romanovsky 2023-08-24  802  	if (!mlx5_eswitch_block_ipsec(priv->mdev)) {
8efd7b17a3b032 Leon Romanovsky 2023-08-24  803  		err = -EBUSY;
8efd7b17a3b032 Leon Romanovsky 2023-08-24  804  		goto err_xfrm;
8efd7b17a3b032 Leon Romanovsky 2023-08-24  805  	}
8efd7b17a3b032 Leon Romanovsky 2023-08-24  806  
22239eb258bc1e Carolina Jubran 2025-10-05  807  	if (mlx5_eswitch_block_mode(priv->mdev))
22239eb258bc1e Carolina Jubran 2025-10-05 @808  		goto unblock_ipsec;
22239eb258bc1e Carolina Jubran 2025-10-05  809  
22239eb258bc1e Carolina Jubran 2025-10-05  810  	if (x->props.mode == XFRM_MODE_TUNNEL &&
22239eb258bc1e Carolina Jubran 2025-10-05  811  	    x->xso.type == XFRM_DEV_OFFLOAD_PACKET) {
22239eb258bc1e Carolina Jubran 2025-10-05  812  		allow_tunnel_mode = mlx5e_ipsec_fs_tunnel_allowed(sa_entry);
22239eb258bc1e Carolina Jubran 2025-10-05  813  		if (!allow_tunnel_mode) {
22239eb258bc1e Carolina Jubran 2025-10-05  814  			NL_SET_ERR_MSG_MOD(extack,
22239eb258bc1e Carolina Jubran 2025-10-05  815  					   "Packet offload tunnel mode is disabled due to encap settings");
22239eb258bc1e Carolina Jubran 2025-10-05  816  			err = -EINVAL;
22239eb258bc1e Carolina Jubran 2025-10-05  817  			goto unblock_mode;
22239eb258bc1e Carolina Jubran 2025-10-05  818  		}
22239eb258bc1e Carolina Jubran 2025-10-05  819  	}
22239eb258bc1e Carolina Jubran 2025-10-05  820  
cb01008390bb06 Aviad Yehezkel  2018-01-18  821  	/* check esn */
f4979e2667c56f Leon Romanovsky 2023-03-30  822  	if (x->props.flags & XFRM_STATE_ESN)
cb01008390bb06 Aviad Yehezkel  2018-01-18  823  		mlx5e_ipsec_update_esn_state(sa_entry);
7f95b0247764ac Leon Romanovsky 2025-01-15  824  	else
7f95b0247764ac Leon Romanovsky 2025-01-15  825  		/* According to RFC4303, section "3.3.3. Sequence Number Generation",
7f95b0247764ac Leon Romanovsky 2025-01-15  826  		 * the first packet sent using a given SA will contain a sequence
7f95b0247764ac Leon Romanovsky 2025-01-15  827  		 * number of 1.
7f95b0247764ac Leon Romanovsky 2025-01-15  828  		 */
7f95b0247764ac Leon Romanovsky 2025-01-15  829  		sa_entry->esn_state.esn = 1;
cb01008390bb06 Aviad Yehezkel  2018-01-18  830  
b73e67287b8051 Leon Romanovsky 2022-03-09  831  	mlx5e_ipsec_build_accel_xfrm_attrs(sa_entry, &sa_entry->attrs);
4562116f8a565f Leon Romanovsky 2023-03-30  832  
4562116f8a565f Leon Romanovsky 2023-03-30  833  	err = mlx5_ipsec_create_work(sa_entry);
4562116f8a565f Leon Romanovsky 2023-03-30  834  	if (err)
22239eb258bc1e Carolina Jubran 2025-10-05  835  		goto unblock_encap;
4562116f8a565f Leon Romanovsky 2023-03-30  836  
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  837  	err = mlx5e_ipsec_create_dwork(sa_entry);
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  838  	if (err)
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  839  		goto release_work;
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  840  
d6c4f0298cec8c Aviad Yehezkel  2018-01-18  841  	/* create hw context */
b73e67287b8051 Leon Romanovsky 2022-03-09  842  	err = mlx5_ipsec_create_sa_ctx(sa_entry);
b73e67287b8051 Leon Romanovsky 2022-03-09  843  	if (err)
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  844  		goto release_dwork;
547eede070eb98 Ilan Tayari     2017-04-18  845  
c7049ca6213732 Leon Romanovsky 2022-12-02  846  	err = mlx5e_accel_ipsec_fs_add_rule(sa_entry);
5e466345291a91 Huy Nguyen      2020-06-05  847  	if (err)
5e466345291a91 Huy Nguyen      2020-06-05  848  		goto err_hw_ctx;
5e466345291a91 Huy Nguyen      2020-06-05  849  
403b383a3ce3eb Leon Romanovsky 2022-12-02  850  	/* We use *_bh() variant because xfrm_timer_handler(), which runs
403b383a3ce3eb Leon Romanovsky 2022-12-02  851  	 * in softirq context, can reach our state delete logic and we need
403b383a3ce3eb Leon Romanovsky 2022-12-02  852  	 * xa_erase_bh() there.
403b383a3ce3eb Leon Romanovsky 2022-12-02  853  	 */
403b383a3ce3eb Leon Romanovsky 2022-12-02  854  	err = xa_insert_bh(&ipsec->sadb, sa_entry->ipsec_obj_id, sa_entry,
403b383a3ce3eb Leon Romanovsky 2022-12-02  855  			   GFP_KERNEL);
7dfee4b1d79e18 Raed Salem      2019-10-23  856  	if (err)
5e466345291a91 Huy Nguyen      2020-06-05  857  		goto err_add_rule;
403b383a3ce3eb Leon Romanovsky 2022-12-02  858  
f4979e2667c56f Leon Romanovsky 2023-03-30  859  	mlx5e_ipsec_set_esn_ops(sa_entry);
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  860  
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  861  	if (sa_entry->dwork)
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  862  		queue_delayed_work(ipsec->wq, &sa_entry->dwork->dwork,
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  863  				   MLX5_IPSEC_RESCHED);
4c24272b4e2bef Leon Romanovsky 2023-04-13  864  
22239eb258bc1e Carolina Jubran 2025-10-05  865  	if (allow_tunnel_mode) {
2c3688090f8a1f Leon Romanovsky 2025-01-15  866  		xa_lock_bh(&ipsec->sadb);
2c3688090f8a1f Leon Romanovsky 2025-01-15  867  		__xa_set_mark(&ipsec->sadb, sa_entry->ipsec_obj_id,
4c24272b4e2bef Leon Romanovsky 2023-04-13  868  			      MLX5E_IPSEC_TUNNEL_SA);
2c3688090f8a1f Leon Romanovsky 2025-01-15  869  		xa_unlock_bh(&ipsec->sadb);
2c3688090f8a1f Leon Romanovsky 2025-01-15  870  	}
4c24272b4e2bef Leon Romanovsky 2023-04-13  871  
aa8bd0c9518cc5 Raed Salem      2023-03-14  872  out:
547eede070eb98 Ilan Tayari     2017-04-18  873  	x->xso.offload_handle = (unsigned long)sa_entry;
22239eb258bc1e Carolina Jubran 2025-10-05  874  	if (allow_tunnel_mode)
22239eb258bc1e Carolina Jubran 2025-10-05  875  		mlx5_eswitch_unblock_encap(priv->mdev);
22239eb258bc1e Carolina Jubran 2025-10-05  876  
22239eb258bc1e Carolina Jubran 2025-10-05  877  	mlx5_eswitch_unblock_mode(priv->mdev);
22239eb258bc1e Carolina Jubran 2025-10-05  878  
403b383a3ce3eb Leon Romanovsky 2022-12-02  879  	return 0;
547eede070eb98 Ilan Tayari     2017-04-18  880  
5e466345291a91 Huy Nguyen      2020-06-05  881  err_add_rule:
c7049ca6213732 Leon Romanovsky 2022-12-02  882  	mlx5e_accel_ipsec_fs_del_rule(sa_entry);
7dfee4b1d79e18 Raed Salem      2019-10-23  883  err_hw_ctx:
b73e67287b8051 Leon Romanovsky 2022-03-09  884  	mlx5_ipsec_free_sa_ctx(sa_entry);
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  885  release_dwork:
b2f7b01d36a9b9 Leon Romanovsky 2023-03-30  886  	kfree(sa_entry->dwork);
4562116f8a565f Leon Romanovsky 2023-03-30  887  release_work:
94edec448479e3 Leon Romanovsky 2023-04-20  888  	if (sa_entry->work)
4562116f8a565f Leon Romanovsky 2023-03-30  889  		kfree(sa_entry->work->data);
4562116f8a565f Leon Romanovsky 2023-03-30  890  	kfree(sa_entry->work);
22239eb258bc1e Carolina Jubran 2025-10-05  891  unblock_encap:
22239eb258bc1e Carolina Jubran 2025-10-05  892  	if (allow_tunnel_mode)
22239eb258bc1e Carolina Jubran 2025-10-05  893  		mlx5_eswitch_unblock_encap(priv->mdev);
22239eb258bc1e Carolina Jubran 2025-10-05  894  unblock_mode:
22239eb258bc1e Carolina Jubran 2025-10-05  895  	mlx5_eswitch_unblock_mode(priv->mdev);
8efd7b17a3b032 Leon Romanovsky 2023-08-24  896  unblock_ipsec:
8efd7b17a3b032 Leon Romanovsky 2023-08-24  897  	mlx5_eswitch_unblock_ipsec(priv->mdev);
d6c4f0298cec8c Aviad Yehezkel  2018-01-18  898  err_xfrm:
547eede070eb98 Ilan Tayari     2017-04-18  899  	kfree(sa_entry);
697b3518ebfd1d Leon Romanovsky 2023-04-20  900  	NL_SET_ERR_MSG_WEAK_MOD(extack, "Device failed to offload this state");
547eede070eb98 Ilan Tayari     2017-04-18  901  	return err;
547eede070eb98 Ilan Tayari     2017-04-18  902  }
547eede070eb98 Ilan Tayari     2017-04-18  903  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
