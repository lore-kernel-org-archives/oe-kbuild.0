Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE62D97B5
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915228; cv=none; b=e4xDdrvlcKlfjOKopIXvb3pXLvL5FzWY1e/6uoDvkvdEhLKz4YQfyOfWC1b3uwCCw7lBq+DvtIrVlOeGUg3tHGznsAwgp8ZGdvYyWGgeF0IIqX/4G/Z0WpmApzmWN6Vdne+mnn/c3zVE9qQsmNrbpEslXwWWGlipxdNubIbrUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915228; c=relaxed/simple;
	bh=tTwvIA6fXJwX/7+8roBKsWtlf+qjc0rNdwbZt6xyyLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tWQz63EP4QExfvc/ldUzOR1IVNTHP4/m9l9A66RR8bdEGeVXb3Hx+eXP/3YtkhKN6Fe5tuv4HFth0rQzVzXRmt3spH1ZF/3EzC01fjx/Dfb19X61V+I1C2aStZ3th8MvzsytZBUnHRCq7cjv7+xjOflcRvSeajGjueZbSphUKwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZ0tMTNU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZ0tMTNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782915226; x=1814451226;
  h=date:from:to:cc:subject:message-id;
  bh=tTwvIA6fXJwX/7+8roBKsWtlf+qjc0rNdwbZt6xyyLg=;
  b=eZ0tMTNUjgUN4O4VcJexQ8EEQhn9uXS9I5pBMl840vJXZb8jZbFXNOf/
   bxOF9pqaguNfHqx/+pxsqICJSgV0QGl4IuAGgT8ZIzsq98CHHw9tvs/No
   uYPbSxhOXMNHNC2FrmR/Bnbyz3qbQQE2OhllXyt20U+yaH6qo395F10oU
   vzJ1aAzRqAhyPXlv6qLq/HSanCGCavwZs/BiZFx/A/TEwN2UGNcABKPwH
   MoW+5VUYL2q/PPVwWIDNmNkFYhbKutCneCNI9NyrSk9ks+HSO1bRU5lOh
   6li+7NosZYONS+9KpfloBIP1uO61SR4wxKSn2zxW4vq8BBFLDa5n4oQFG
   g==;
X-CSE-ConnectionGUID: lpb6KVXkSaK3ORDO0JBSwA==
X-CSE-MsgGUID: m+VydSqGQG6cagDGLVdamw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83424527"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="83424527"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 07:13:46 -0700
X-CSE-ConnectionGUID: bgmqVz4tSqGdT2Q0RE6GvA==
X-CSE-MsgGUID: 4C2jJ3uPROSRNWrD9azRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="251537528"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2026 07:13:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wevh7-000000009Lb-3eVs;
	Wed, 01 Jul 2026 14:13:41 +0000
Date: Wed, 01 Jul 2026 22:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/bridge/synopsys/dw-dp.c:913:16-27:
 opportunity for str_plural(link -> lanes)
Message-ID: <202607012242.PBDaXI8U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chaoyi Chen <chaoyi.chen@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

Hi Chaoyi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   665159e246749578d4e4bfe106ee3b74edcdab18
commit: 0244539f9a4f3b564604dfe4d639f61cecec381a drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
date:   6 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
config: csky-randconfig-r063-20260701 (https://download.01.org/0day-ci/archive/20260701/202607012242.PBDaXI8U-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0244539f9a4f ("drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607012242.PBDaXI8U-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/synopsys/dw-dp.c:913:16-27: opportunity for str_plural(link -> lanes)
   drivers/gpu/drm/bridge/synopsys/dw-dp.c:972:16-27: opportunity for str_plural(link -> lanes)

vim +913 drivers/gpu/drm/bridge/synopsys/dw-dp.c

86eecc3a9c2e06 Andy Yan 2025-08-22  903  
86eecc3a9c2e06 Andy Yan 2025-08-22  904  static int dw_dp_link_train_full(struct dw_dp *dp)
86eecc3a9c2e06 Andy Yan 2025-08-22  905  {
86eecc3a9c2e06 Andy Yan 2025-08-22  906  	struct dw_dp_link *link = &dp->link;
86eecc3a9c2e06 Andy Yan 2025-08-22  907  	int ret;
86eecc3a9c2e06 Andy Yan 2025-08-22  908  
86eecc3a9c2e06 Andy Yan 2025-08-22  909  retry:
86eecc3a9c2e06 Andy Yan 2025-08-22  910  	dw_dp_link_train_init(&link->train);
86eecc3a9c2e06 Andy Yan 2025-08-22  911  
86eecc3a9c2e06 Andy Yan 2025-08-22  912  	dev_dbg(dp->dev, "full-training link: %u lane%s at %u MHz\n",
86eecc3a9c2e06 Andy Yan 2025-08-22 @913  		link->lanes, (link->lanes > 1) ? "s" : "", link->rate / 100);
86eecc3a9c2e06 Andy Yan 2025-08-22  914  
86eecc3a9c2e06 Andy Yan 2025-08-22  915  	ret = dw_dp_link_configure(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  916  	if (ret < 0) {
86eecc3a9c2e06 Andy Yan 2025-08-22  917  		dev_err(dp->dev, "failed to configure DP link: %d\n", ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  918  		return ret;
86eecc3a9c2e06 Andy Yan 2025-08-22  919  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  920  
86eecc3a9c2e06 Andy Yan 2025-08-22  921  	ret = dw_dp_link_clock_recovery(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  922  	if (ret < 0) {
86eecc3a9c2e06 Andy Yan 2025-08-22  923  		dev_err(dp->dev, "clock recovery failed: %d\n", ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  924  		goto out;
86eecc3a9c2e06 Andy Yan 2025-08-22  925  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  926  
86eecc3a9c2e06 Andy Yan 2025-08-22  927  	if (!link->train.clock_recovered) {
86eecc3a9c2e06 Andy Yan 2025-08-22  928  		dev_err(dp->dev, "clock recovery failed, downgrading link\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  929  
86eecc3a9c2e06 Andy Yan 2025-08-22  930  		ret = dw_dp_link_downgrade(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  931  		if (ret < 0)
86eecc3a9c2e06 Andy Yan 2025-08-22  932  			goto out;
86eecc3a9c2e06 Andy Yan 2025-08-22  933  		else
86eecc3a9c2e06 Andy Yan 2025-08-22  934  			goto retry;
86eecc3a9c2e06 Andy Yan 2025-08-22  935  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  936  
86eecc3a9c2e06 Andy Yan 2025-08-22  937  	dev_dbg(dp->dev, "clock recovery succeeded\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  938  
86eecc3a9c2e06 Andy Yan 2025-08-22  939  	ret = dw_dp_link_channel_equalization(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  940  	if (ret < 0) {
86eecc3a9c2e06 Andy Yan 2025-08-22  941  		dev_err(dp->dev, "channel equalization failed: %d\n", ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  942  		goto out;
86eecc3a9c2e06 Andy Yan 2025-08-22  943  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  944  
86eecc3a9c2e06 Andy Yan 2025-08-22  945  	if (!link->train.channel_equalized) {
86eecc3a9c2e06 Andy Yan 2025-08-22  946  		dev_err(dp->dev, "channel equalization failed, downgrading link\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  947  
86eecc3a9c2e06 Andy Yan 2025-08-22  948  		ret = dw_dp_link_downgrade(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  949  		if (ret < 0)
86eecc3a9c2e06 Andy Yan 2025-08-22  950  			goto out;
86eecc3a9c2e06 Andy Yan 2025-08-22  951  		else
86eecc3a9c2e06 Andy Yan 2025-08-22  952  			goto retry;
86eecc3a9c2e06 Andy Yan 2025-08-22  953  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  954  
86eecc3a9c2e06 Andy Yan 2025-08-22  955  	dev_dbg(dp->dev, "channel equalization succeeded\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  956  
86eecc3a9c2e06 Andy Yan 2025-08-22  957  out:
86eecc3a9c2e06 Andy Yan 2025-08-22  958  	dw_dp_link_train_set_pattern(dp, DP_TRAINING_PATTERN_DISABLE);
86eecc3a9c2e06 Andy Yan 2025-08-22  959  	return ret;
86eecc3a9c2e06 Andy Yan 2025-08-22  960  }
86eecc3a9c2e06 Andy Yan 2025-08-22  961  

:::::: The code at line 913 was first introduced by commit
:::::: 86eecc3a9c2e06462f6a273fcd24150b6da787de drm/bridge: synopsys: Add DW DPTX Controller support library

:::::: TO: Andy Yan <andy.yan@rock-chips.com>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
