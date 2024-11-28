Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9EC70807
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 03:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732766167; cv=none; b=IazGQ/5dg0tdYI5XHFiefcn6S78cYRa0hEivfcB7+rxS/KgNXIHTRgDjQkrssBsAYzmKY7WBGp4QV3fFoRNrPkVyR8LMXd/TXoPiZvpGhwkzeVeNd7e3wSUNg3F5VqdsQAIRFgbRF4dmmuKYa1BeIQc1p+2v2w+m/qRVhPFTHhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732766167; c=relaxed/simple;
	bh=Jn1ujHpSfbonzQFt4YE63DxKRO2E/b72XdUkE75j8G4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EnFPtUTVGyQobZomzKfGF+tuIY78jnXXwZCAx+pJ0/1dkadt34o8qAeAhVOfy2I6ugqYaFSR+m0APKw7c4GcPsGKI5QMKAWD+biNvebjbpOHr5BrMbjw3mawdGQGnPS7RQ6nbFSEMw5gC3sry7VpOxRZQnFscdGhN4TEDEYpfrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qvbg7mvs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qvbg7mvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732766165; x=1764302165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jn1ujHpSfbonzQFt4YE63DxKRO2E/b72XdUkE75j8G4=;
  b=Qvbg7mvsaaP67fip//kSJtS2jB9EbIhGz7SoqFjeJdYiyXHBciQZk9fM
   xpV/8ar1YxBkNEkm2ljWshoqg7drHMyirlpYi6aKZ7+iP5fv7ZuAJDUBA
   PwYmET1N6iv4uZfxIL0mNZzS7sGxI4p1XbFO1TTz7ibYdmTjfS1ev2DmQ
   gCgym8URVdN6gc3ZneUgqo+BJVbAG5/zMBRHqfCcXfKEP8/0zjytmUwce
   oW9Xoiq1z4sHjf4TeyUT/tU4Ahc/x168EIEmBohZGqPegtPU3XWu5aABt
   +HaQiAMOwbgP3bxjc5xv081aSX1AMnVHeQ/cDF2rCb7HCBJsDuKOa/hZr
   g==;
X-CSE-ConnectionGUID: ElXX3kUqSbe0uyhCIabpsA==
X-CSE-MsgGUID: ubbXjT3IRNu84c9wORE9pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43599640"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="43599640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 19:56:04 -0800
X-CSE-ConnectionGUID: yTNmP4sURZC82lwK1DFEhg==
X-CSE-MsgGUID: yLho4vsSQ7yYyRQ/wcXlyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="92958848"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 19:56:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGVdI-0008wU-1R;
	Thu, 28 Nov 2024 03:56:00 +0000
Date: Thu, 28 Nov 2024 11:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2490/2490] drivers/net/macsec.c:2616
 macsec_upd_offload() warn: missing error code 'ret'
Message-ID: <202411281126.4dLuT65j-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: zhaoxiaoqiang11 <zhaoxiaoqiang11@jd.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a0d38e859312d55415b596dc57d4ac3f260f49e4
commit: a93d4233e0498373fef7fb7e4de42dd969f9c1b1 [2490/2490] net: macsec: fix net device access prior to holding a lock
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 4 months ago
config: x86_64-randconfig-161-20241127 (https://download.01.org/0day-ci/archive/20241128/202411281126.4dLuT65j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411281126.4dLuT65j-lkp@intel.com/

smatch warnings:
drivers/net/macsec.c:2616 macsec_upd_offload() warn: missing error code 'ret'

vim +/ret +2616 drivers/net/macsec.c

dcb780fb279514 Antoine Tenart  2020-01-13  2576  
dcb780fb279514 Antoine Tenart  2020-01-13  2577  static int macsec_upd_offload(struct sk_buff *skb, struct genl_info *info)
dcb780fb279514 Antoine Tenart  2020-01-13  2578  {
dcb780fb279514 Antoine Tenart  2020-01-13  2579  	struct nlattr *tb_offload[MACSEC_OFFLOAD_ATTR_MAX + 1];
dcb780fb279514 Antoine Tenart  2020-01-13  2580  	enum macsec_offload offload, prev_offload;
dcb780fb279514 Antoine Tenart  2020-01-13  2581  	int (*func)(struct macsec_context *ctx);
dcb780fb279514 Antoine Tenart  2020-01-13  2582  	struct nlattr **attrs = info->attrs;
a249f8050624f9 Dmitry Bogdanov 2020-03-25  2583  	struct net_device *dev;
dcb780fb279514 Antoine Tenart  2020-01-13  2584  	const struct macsec_ops *ops;
dcb780fb279514 Antoine Tenart  2020-01-13  2585  	struct macsec_context ctx;
dcb780fb279514 Antoine Tenart  2020-01-13  2586  	struct macsec_dev *macsec;
a93d4233e04983 Emeel Hakim     2022-12-11  2587  	int ret = 0;
dcb780fb279514 Antoine Tenart  2020-01-13  2588  
dcb780fb279514 Antoine Tenart  2020-01-13  2589  	if (!attrs[MACSEC_ATTR_IFINDEX])
dcb780fb279514 Antoine Tenart  2020-01-13  2590  		return -EINVAL;
dcb780fb279514 Antoine Tenart  2020-01-13  2591  
dcb780fb279514 Antoine Tenart  2020-01-13  2592  	if (!attrs[MACSEC_ATTR_OFFLOAD])
dcb780fb279514 Antoine Tenart  2020-01-13  2593  		return -EINVAL;
dcb780fb279514 Antoine Tenart  2020-01-13  2594  
dcb780fb279514 Antoine Tenart  2020-01-13  2595  	if (nla_parse_nested_deprecated(tb_offload, MACSEC_OFFLOAD_ATTR_MAX,
dcb780fb279514 Antoine Tenart  2020-01-13  2596  					attrs[MACSEC_ATTR_OFFLOAD],
dcb780fb279514 Antoine Tenart  2020-01-13  2597  					macsec_genl_offload_policy, NULL))
dcb780fb279514 Antoine Tenart  2020-01-13  2598  		return -EINVAL;
dcb780fb279514 Antoine Tenart  2020-01-13  2599  
a93d4233e04983 Emeel Hakim     2022-12-11  2600  	rtnl_lock();
a93d4233e04983 Emeel Hakim     2022-12-11  2601  
dcb780fb279514 Antoine Tenart  2020-01-13  2602  	dev = get_dev_from_nl(genl_info_net(info), attrs);
a93d4233e04983 Emeel Hakim     2022-12-11  2603  	if (IS_ERR(dev)) {
a93d4233e04983 Emeel Hakim     2022-12-11  2604  		ret = PTR_ERR(dev);
a93d4233e04983 Emeel Hakim     2022-12-11  2605  		goto out;
a93d4233e04983 Emeel Hakim     2022-12-11  2606  	}
dcb780fb279514 Antoine Tenart  2020-01-13  2607  	macsec = macsec_priv(dev);
dcb780fb279514 Antoine Tenart  2020-01-13  2608  
a93d4233e04983 Emeel Hakim     2022-12-11  2609  	if (!tb_offload[MACSEC_OFFLOAD_ATTR_TYPE]) {
a93d4233e04983 Emeel Hakim     2022-12-11  2610  		ret = -EINVAL;
a93d4233e04983 Emeel Hakim     2022-12-11  2611  		goto out;
a93d4233e04983 Emeel Hakim     2022-12-11  2612  	}
aa81700cf2326e Davide Caratti  2020-04-06  2613  
dcb780fb279514 Antoine Tenart  2020-01-13  2614  	offload = nla_get_u8(tb_offload[MACSEC_OFFLOAD_ATTR_TYPE]);
dcb780fb279514 Antoine Tenart  2020-01-13  2615  	if (macsec->offload == offload)
a93d4233e04983 Emeel Hakim     2022-12-11 @2616  		goto out;
dcb780fb279514 Antoine Tenart  2020-01-13  2617  
dcb780fb279514 Antoine Tenart  2020-01-13  2618  	/* Check if the offloading mode is supported by the underlying layers */
dcb780fb279514 Antoine Tenart  2020-01-13  2619  	if (offload != MACSEC_OFFLOAD_OFF &&
a93d4233e04983 Emeel Hakim     2022-12-11  2620  	    !macsec_check_offload(offload, macsec)) {
a93d4233e04983 Emeel Hakim     2022-12-11  2621  		ret = -EOPNOTSUPP;
a93d4233e04983 Emeel Hakim     2022-12-11  2622  		goto out;
a93d4233e04983 Emeel Hakim     2022-12-11  2623  	}
dcb780fb279514 Antoine Tenart  2020-01-13  2624  
dcb780fb279514 Antoine Tenart  2020-01-13  2625  	/* Check if the net device is busy. */
a93d4233e04983 Emeel Hakim     2022-12-11  2626  	if (netif_running(dev)) {
a93d4233e04983 Emeel Hakim     2022-12-11  2627  		ret = -EBUSY;
a93d4233e04983 Emeel Hakim     2022-12-11  2628  		goto out;
a93d4233e04983 Emeel Hakim     2022-12-11  2629  	}
dcb780fb279514 Antoine Tenart  2020-01-13  2630  
dcb780fb279514 Antoine Tenart  2020-01-13  2631  	prev_offload = macsec->offload;
dcb780fb279514 Antoine Tenart  2020-01-13  2632  	macsec->offload = offload;
dcb780fb279514 Antoine Tenart  2020-01-13  2633  
dcb780fb279514 Antoine Tenart  2020-01-13  2634  	/* Check if the device already has rules configured: we do not support
dcb780fb279514 Antoine Tenart  2020-01-13  2635  	 * rules migration.
dcb780fb279514 Antoine Tenart  2020-01-13  2636  	 */
dcb780fb279514 Antoine Tenart  2020-01-13  2637  	if (macsec_is_configured(macsec)) {
dcb780fb279514 Antoine Tenart  2020-01-13  2638  		ret = -EBUSY;
dcb780fb279514 Antoine Tenart  2020-01-13  2639  		goto rollback;
dcb780fb279514 Antoine Tenart  2020-01-13  2640  	}
dcb780fb279514 Antoine Tenart  2020-01-13  2641  
dcb780fb279514 Antoine Tenart  2020-01-13  2642  	ops = __macsec_get_ops(offload == MACSEC_OFFLOAD_OFF ? prev_offload : offload,
dcb780fb279514 Antoine Tenart  2020-01-13  2643  			       macsec, &ctx);
dcb780fb279514 Antoine Tenart  2020-01-13  2644  	if (!ops) {
dcb780fb279514 Antoine Tenart  2020-01-13  2645  		ret = -EOPNOTSUPP;
dcb780fb279514 Antoine Tenart  2020-01-13  2646  		goto rollback;
dcb780fb279514 Antoine Tenart  2020-01-13  2647  	}
dcb780fb279514 Antoine Tenart  2020-01-13  2648  
dcb780fb279514 Antoine Tenart  2020-01-13  2649  	if (prev_offload == MACSEC_OFFLOAD_OFF)
dcb780fb279514 Antoine Tenart  2020-01-13  2650  		func = ops->mdo_add_secy;
dcb780fb279514 Antoine Tenart  2020-01-13  2651  	else
dcb780fb279514 Antoine Tenart  2020-01-13  2652  		func = ops->mdo_del_secy;
dcb780fb279514 Antoine Tenart  2020-01-13  2653  
dcb780fb279514 Antoine Tenart  2020-01-13  2654  	ctx.secy = &macsec->secy;
dcb780fb279514 Antoine Tenart  2020-01-13  2655  	ret = macsec_offload(func, &ctx);
dcb780fb279514 Antoine Tenart  2020-01-13  2656  	if (ret)
dcb780fb279514 Antoine Tenart  2020-01-13  2657  		goto rollback;
dcb780fb279514 Antoine Tenart  2020-01-13  2658  
29ca3cdfe13b27 Antoine Tenart  2020-05-06  2659  	rtnl_unlock();
dcb780fb279514 Antoine Tenart  2020-01-13  2660  	return 0;
dcb780fb279514 Antoine Tenart  2020-01-13  2661  
dcb780fb279514 Antoine Tenart  2020-01-13  2662  rollback:
dcb780fb279514 Antoine Tenart  2020-01-13  2663  	macsec->offload = prev_offload;
a93d4233e04983 Emeel Hakim     2022-12-11  2664  out:
dcb780fb279514 Antoine Tenart  2020-01-13  2665  	rtnl_unlock();
dcb780fb279514 Antoine Tenart  2020-01-13  2666  	return ret;
dcb780fb279514 Antoine Tenart  2020-01-13  2667  }
dcb780fb279514 Antoine Tenart  2020-01-13  2668  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
