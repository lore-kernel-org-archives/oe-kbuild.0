Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FD3171B0
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718614578; cv=none; b=s15eQ65BTys8iEqyN3gi2yrT/VOpb48HYnGaXupJlyBaapi3xZVFRzIsjXt6iwNac5SvPpzl5ltVrQJgEjL3i70O0DObfoJkpaQAsvCpRMpuSs+svaVIeFRG3+w9RL8ulULOhad0HHcd0NR3h5fMDwmDDaNoxJkAOB7+VPInMao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718614578; c=relaxed/simple;
	bh=VGKu9dGIVsZliLTgN5nb71t+pD0PWbNqiEGCo+dH6M0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VWXHCMhWxloUPxYx9jr4qlrEGAkrB2ObyoyOif0EPYN48pET0+Lhr1QQHXgUm+v2txY9CK4xf0XOWByQhYmp+p6gfm5yLh+JG0oH6fnRtEfWz9I/f871V/gFJ0HIAPVIuad63+UBFNMC4in9JNykY3b8hBLcIuLjOkRE8UK6w4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPs9g1rL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPs9g1rL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718614576; x=1750150576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VGKu9dGIVsZliLTgN5nb71t+pD0PWbNqiEGCo+dH6M0=;
  b=cPs9g1rLH1/wVY6V/EvPDBZfFXvq0yIUnZtDOwvyp91QVzZoYifnG3WZ
   M1komXhZH9kSsNfQS0FZY+g2RaFQqM9NArtH72b8H+IeyaH82KAMwIFKQ
   thyhJMw4PeeuuvqJlhLZftkdgwbMmKUIo6hcr1B208ok6HOYdj2n3NuKd
   ZSJkw8VnepIxPA7A7PXNBD1sc3KpezF6YrpRqZDGwQHtRGG4wvh3kQXl9
   fTDZ3CMELSlxQZEGCSdYjihBj30Ho4+7oXPrJ0NnSEzzmkyt+ewx9gE6L
   X4UPAIHTLG4TBT4HQfCrb88v9swkTYz/BQls8T/5Ypc2gbMY8KGcejh/8
   A==;
X-CSE-ConnectionGUID: xhKE4hfdSnCRRQCC3bSzLQ==
X-CSE-MsgGUID: Mao65OJ+SpKjxdvQGjmCHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="18350302"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="18350302"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 01:56:15 -0700
X-CSE-ConnectionGUID: KJAlsE4nSyWKsk2ePkTZCw==
X-CSE-MsgGUID: pL7P2WFEQNewoZ+m5VTuvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41602740"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jun 2024 01:56:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ89r-00044U-3D;
	Mon, 17 Jun 2024 08:56:11 +0000
Date: Mon, 17 Jun 2024 16:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/mediatek/mtk_drm_drv.c:360:1-23: WARNING: Function
 "for_each_child_of_node" should have of_node_put() before break around line
 380.
Message-ID: <202406171638.nCXqmqA0-lkp@intel.com>
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
TO: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
CC: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>
CC: Alexandre Mergnat <amergnat@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6ba59ff4227927d3a8530fc2973b80e94b54d58f
commit: d761b9450e31e5abd212f0085d424ed32760de5a drm/mediatek: Add cnt checking for coverity issue
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r052-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171638.nCXqmqA0-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406171638.nCXqmqA0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:360:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before break around line 380.

vim +/for_each_child_of_node +360 drivers/gpu/drm/mediatek/mtk_drm_drv.c

1ef7ed48356cd5 Nancy.Lin    2023-03-21  348  
1ef7ed48356cd5 Nancy.Lin    2023-03-21  349  static bool mtk_drm_get_all_drm_priv(struct device *dev)
1ef7ed48356cd5 Nancy.Lin    2023-03-21  350  {
1ef7ed48356cd5 Nancy.Lin    2023-03-21  351  	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
1ef7ed48356cd5 Nancy.Lin    2023-03-21  352  	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
1ef7ed48356cd5 Nancy.Lin    2023-03-21  353  	struct device_node *phandle = dev->parent->of_node;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  354  	const struct of_device_id *of_id;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  355  	struct device_node *node;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  356  	struct device *drm_dev;
d761b9450e31e5 Jason-JH.Lin 2023-07-14  357  	unsigned int cnt = 0;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  358  	int i, j;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  359  
1ef7ed48356cd5 Nancy.Lin    2023-03-21 @360  	for_each_child_of_node(phandle->parent, node) {
1ef7ed48356cd5 Nancy.Lin    2023-03-21  361  		struct platform_device *pdev;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  362  
1ef7ed48356cd5 Nancy.Lin    2023-03-21  363  		of_id = of_match_node(mtk_drm_of_ids, node);
1ef7ed48356cd5 Nancy.Lin    2023-03-21  364  		if (!of_id)
1ef7ed48356cd5 Nancy.Lin    2023-03-21  365  			continue;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  366  
1ef7ed48356cd5 Nancy.Lin    2023-03-21  367  		pdev = of_find_device_by_node(node);
1ef7ed48356cd5 Nancy.Lin    2023-03-21  368  		if (!pdev)
1ef7ed48356cd5 Nancy.Lin    2023-03-21  369  			continue;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  370  
1ef7ed48356cd5 Nancy.Lin    2023-03-21  371  		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
1ef7ed48356cd5 Nancy.Lin    2023-03-21  372  		if (!drm_dev || !dev_get_drvdata(drm_dev))
1ef7ed48356cd5 Nancy.Lin    2023-03-21  373  			continue;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  374  
1ef7ed48356cd5 Nancy.Lin    2023-03-21  375  		all_drm_priv[cnt] = dev_get_drvdata(drm_dev);
1ef7ed48356cd5 Nancy.Lin    2023-03-21  376  		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
1ef7ed48356cd5 Nancy.Lin    2023-03-21  377  			cnt++;
d761b9450e31e5 Jason-JH.Lin 2023-07-14  378  
d761b9450e31e5 Jason-JH.Lin 2023-07-14  379  		if (cnt == MAX_CRTC)
d761b9450e31e5 Jason-JH.Lin 2023-07-14 @380  			break;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  381  	}
1ef7ed48356cd5 Nancy.Lin    2023-03-21  382  
1ef7ed48356cd5 Nancy.Lin    2023-03-21  383  	if (drm_priv->data->mmsys_dev_num == cnt) {
1ef7ed48356cd5 Nancy.Lin    2023-03-21  384  		for (i = 0; i < cnt; i++)
1ef7ed48356cd5 Nancy.Lin    2023-03-21  385  			for (j = 0; j < cnt; j++)
1ef7ed48356cd5 Nancy.Lin    2023-03-21  386  				all_drm_priv[j]->all_drm_private[i] = all_drm_priv[i];
1ef7ed48356cd5 Nancy.Lin    2023-03-21  387  
1ef7ed48356cd5 Nancy.Lin    2023-03-21  388  		return true;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  389  	}
1ef7ed48356cd5 Nancy.Lin    2023-03-21  390  
1ef7ed48356cd5 Nancy.Lin    2023-03-21  391  	return false;
1ef7ed48356cd5 Nancy.Lin    2023-03-21  392  }
1ef7ed48356cd5 Nancy.Lin    2023-03-21  393  

:::::: The code at line 360 was first introduced by commit
:::::: 1ef7ed48356cd5f9af2b7671956991b658d8c2ba drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support

:::::: TO: Nancy.Lin <nancy.lin@mediatek.com>
:::::: CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
