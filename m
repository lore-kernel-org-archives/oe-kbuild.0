Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46D63C
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727032032; cv=none; b=I+tuAQdLoUYUuP8/ZQ8b90cuc0FZlgWt6jf01MOo/E6e6xgG1f/S+SGgg5llc6oxWxTEqXa+gFF3nS8cespWaAHwORuNG5xpubA4rVyhoEGfyhnQyyzQFpmOKyeIhugP2wHhnFq34HMVQIn0ghVxiB3DbIjzApVrDHg83B73oLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727032032; c=relaxed/simple;
	bh=L+BAgazhwmrEgwD4EQ/8U7t7f3Ic0RNnxu0uZuONNTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zms+jlPYdxpeIvo1qgrYqnw0Qdla+RQ//y8f8K6FsyuvWfh9GW3/IdBxAJ/78pc/6Gbi56Gil5IxG9/l3sNlxOQ4ZpiKKL0WaK4Ycl21kEM2vPRxMa3/Xo5E3lX+qX/7MZ0PPBiJrc1SSW5AVaiPsOe4sHf15cmcWFUUusCWKpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEC4Wzo7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEC4Wzo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727032029; x=1758568029;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=L+BAgazhwmrEgwD4EQ/8U7t7f3Ic0RNnxu0uZuONNTo=;
  b=TEC4Wzo7l9+fQuXZ5uF4y30PUm0S6xh+/dT+bAFKy2hNlV8coL1Xb+0+
   xyEhoXaLk0VduM+Cp16xggDLxXcBwyW12ITpEdltXin4IBtLPvKUWsFoG
   IAnjyFeii36EJWTyEQ8xD7uDNbdNpZe/rB/qtQwpeMZ6PUWgGN8q/OrxB
   r06P91hzr+8FdJN+7/heH54ZS+6sz1HgipvuRKrb7uQy4pRZpv23rl5Rg
   IYWQ1tlyB0Q8+AJUoaWJapVQ6pudjblArR3WctGX2oGtO+4UZF85SmnkO
   +qCHXfiLsLF47Am+IXE27NTumZVpaB0YX6/58o7wbgn1Smy/4q4k1DHde
   g==;
X-CSE-ConnectionGUID: XyCdsKSrSfKjU5GinTFUlA==
X-CSE-MsgGUID: vGKIaJ1RQLS/7c9Vp21MxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25852825"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25852825"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 12:07:09 -0700
X-CSE-ConnectionGUID: byay7+XmRcCpgw3OAunY5Q==
X-CSE-MsgGUID: LNVwQ03wSx+OD9ab0hYT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71291177"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Sep 2024 12:07:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssRvF-000GbO-0z;
	Sun, 22 Sep 2024 19:07:05 +0000
Date: Mon, 23 Sep 2024 03:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/tegra/drm.c:1155 host1x_drm_probe() warn:
 'tegra->domain' is an error pointer or valid
Message-ID: <202409230256.Zi2rKZhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af9c191ac2a0c857f59d75b6812fef078ab1cefe
commit: 45c690aea8ee5b7d012cd593bd288540a4bfdbf0 drm/tegra: Use iommu_paging_domain_alloc()
date:   12 days ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 days ago
config: microblaze-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230256.Zi2rKZhx-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230256.Zi2rKZhx-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tegra/drm.c:1155 host1x_drm_probe() warn: 'tegra->domain' is an error pointer or valid

vim +1155 drivers/gpu/drm/tegra/drm.c

2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1135  
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1136  static int host1x_drm_probe(struct host1x_device *dev)
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1137  {
45c690aea8ee5b7 drivers/gpu/drm/tegra/drm.c  Lu Baolu          2024-09-02  1138  	struct device *dma_dev = dev->dev.parent;
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1139  	struct tegra_drm *tegra;
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1140  	struct drm_device *drm;
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1141  	int err;
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1142  
70a59dd82959f82 drivers/gpu/drm/tegra/drm.c  Daniel Vetter     2020-11-04  1143  	drm = drm_dev_alloc(&tegra_drm_driver, &dev->dev);
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1144  	if (IS_ERR(drm))
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1145  		return PTR_ERR(drm);
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1146  
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1147  	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1148  	if (!tegra) {
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1149  		err = -ENOMEM;
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1150  		goto put;
2d9384ff91770a7 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1151  	}
fa6661b7aa0b520 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1152  
45c690aea8ee5b7 drivers/gpu/drm/tegra/drm.c  Lu Baolu          2024-09-02  1153  	if (host1x_drm_wants_iommu(dev) && device_iommu_mapped(dma_dev)) {
45c690aea8ee5b7 drivers/gpu/drm/tegra/drm.c  Lu Baolu          2024-09-02  1154  		tegra->domain = iommu_paging_domain_alloc(dma_dev);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28 @1155  		if (!tegra->domain) {
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1156  			err = -ENOMEM;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1157  			goto free;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1158  		}
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1159  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1160  		err = iova_cache_get();
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1161  		if (err < 0)
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1162  			goto domain;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1163  	}
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1164  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1165  	mutex_init(&tegra->clients_lock);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1166  	INIT_LIST_HEAD(&tegra->clients);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1167  
9910f5c455de10f drivers/gpu/drm/tegra/drm.c  Thierry Reding    2014-05-22  1168  	dev_set_drvdata(&dev->dev, drm);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1169  	drm->dev_private = tegra;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1170  	tegra->drm = drm;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1171  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1172  	drm_mode_config_init(drm);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1173  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1174  	drm->mode_config.min_width = 0;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1175  	drm->mode_config.min_height = 0;
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1176  	drm->mode_config.max_width = 0;
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1177  	drm->mode_config.max_height = 0;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1178  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1179  	drm->mode_config.normalize_zpos = true;
9910f5c455de10f drivers/gpu/drm/tegra/drm.c  Thierry Reding    2014-05-22  1180  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1181  	drm->mode_config.funcs = &tegra_drm_mode_config_funcs;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1182  	drm->mode_config.helper_private = &tegra_drm_mode_config_helpers;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1183  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1184  	drm_kms_helper_poll_init(drm);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1185  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1186  	err = host1x_device_init(dev);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1187  	if (err < 0)
71ec16f45ef8d10 drivers/gpu/drm/tegra/drm.c  Thomas Zimmermann 2023-03-30  1188  		goto poll;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1189  
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1190  	/*
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1191  	 * Now that all display controller have been initialized, the maximum
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1192  	 * supported resolution is known and the bitmask for horizontal and
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1193  	 * vertical bitfields can be computed.
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1194  	 */
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1195  	tegra->hmask = drm->mode_config.max_width - 1;
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1196  	tegra->vmask = drm->mode_config.max_height - 1;
042c0bd76d7b053 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2021-03-26  1197  
fa6661b7aa0b520 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1198  	if (tegra->use_explicit_iommu) {
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1199  		u64 carveout_start, carveout_end, gem_start, gem_end;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1200  		u64 dma_mask = dma_get_mask(&dev->dev);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1201  		dma_addr_t start, end;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1202  		unsigned long order;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1203  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1204  		start = tegra->domain->geometry.aperture_start & dma_mask;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1205  		end = tegra->domain->geometry.aperture_end & dma_mask;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1206  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1207  		gem_start = start;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1208  		gem_end = end - CARVEOUT_SZ;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1209  		carveout_start = gem_end + 1;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1210  		carveout_end = end;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1211  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1212  		order = __ffs(tegra->domain->pgsize_bitmap);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1213  		init_iova_domain(&tegra->carveout.domain, 1UL << order,
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1214  				 carveout_start >> order);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1215  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1216  		tegra->carveout.shift = iova_shift(&tegra->carveout.domain);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1217  		tegra->carveout.limit = carveout_end >> tegra->carveout.shift;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1218  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1219  		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1220  		mutex_init(&tegra->mm_lock);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1221  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1222  		DRM_DEBUG_DRIVER("IOMMU apertures:\n");
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1223  		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1224  		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1225  				 carveout_end);
fa6661b7aa0b520 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1226  	} else if (tegra->domain) {
fa6661b7aa0b520 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1227  		iommu_domain_free(tegra->domain);
fa6661b7aa0b520 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1228  		tegra->domain = NULL;
fa6661b7aa0b520 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1229  		iova_cache_put();
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1230  	}
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1231  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1232  	if (tegra->hub) {
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1233  		err = tegra_display_hub_prepare(tegra->hub);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1234  		if (err < 0)
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1235  			goto device;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1236  	}
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1237  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1238  	/* syncpoints are used for full 32-bit hardware VBLANK counters */
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1239  	drm->max_vblank_count = 0xffffffff;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1240  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1241  	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1242  	if (err < 0)
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1243  		goto hub;
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1244  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1245  	drm_mode_config_reset(drm);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1246  
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1247  	/*
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1248  	 * Only take over from a potential firmware framebuffer if any CRTCs
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1249  	 * have been registered. This must not be a fatal error because there
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1250  	 * are other accelerators that are exposed via this driver.
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1251  	 *
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1252  	 * Another case where this happens is on Tegra234 where the display
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1253  	 * hardware is no longer part of the host1x complex, so this driver
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1254  	 * will not expose any modesetting features.
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1255  	 */
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1256  	if (drm->mode_config.num_crtc > 0) {
62aeaeaa1b267c5 drivers/gpu/drm/tegra/drm.c  Daniel Vetter     2023-04-06  1257  		err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1258  		if (err < 0)
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1259  			goto hub;
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1260  	} else {
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1261  		/*
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1262  		 * Indicate to userspace that this doesn't expose any display
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1263  		 * capabilities.
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1264  		 */
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1265  		drm->driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
86bf8cfda6d2a67 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2024-02-23  1266  	}
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1267  
71ec16f45ef8d10 drivers/gpu/drm/tegra/drm.c  Thomas Zimmermann 2023-03-30  1268  	err = drm_dev_register(drm, 0);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1269  	if (err < 0)
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1270  		goto hub;
6e4228fbaf0fce0 drivers/gpu/drm/tegra/drm.c  Michał Mirosław   2018-09-01  1271  
71ec16f45ef8d10 drivers/gpu/drm/tegra/drm.c  Thomas Zimmermann 2023-03-30  1272  	tegra_fbdev_setup(drm);
9910f5c455de10f drivers/gpu/drm/tegra/drm.c  Thierry Reding    2014-05-22  1273  
9910f5c455de10f drivers/gpu/drm/tegra/drm.c  Thierry Reding    2014-05-22  1274  	return 0;
9910f5c455de10f drivers/gpu/drm/tegra/drm.c  Thierry Reding    2014-05-22  1275  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1276  hub:
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1277  	if (tegra->hub)
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1278  		tegra_display_hub_cleanup(tegra->hub);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1279  device:
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1280  	if (tegra->domain) {
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1281  		mutex_destroy(&tegra->mm_lock);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1282  		drm_mm_takedown(&tegra->mm);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1283  		put_iova_domain(&tegra->carveout.domain);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1284  		iova_cache_put();
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1285  	}
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1286  
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1287  	host1x_device_exit(dev);
71ec16f45ef8d10 drivers/gpu/drm/tegra/drm.c  Thomas Zimmermann 2023-03-30  1288  poll:
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1289  	drm_kms_helper_poll_fini(drm);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1290  	drm_mode_config_cleanup(drm);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1291  domain:
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1292  	if (tegra->domain)
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1293  		iommu_domain_free(tegra->domain);
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1294  free:
a7303f7735717c9 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1295  	kfree(tegra);
9c942096baeb37c drivers/gpu/drm/tegra/drm.c  Thomas Zimmermann 2018-09-26  1296  put:
9c942096baeb37c drivers/gpu/drm/tegra/drm.c  Thomas Zimmermann 2018-09-26  1297  	drm_dev_put(drm);
9910f5c455de10f drivers/gpu/drm/tegra/drm.c  Thierry Reding    2014-05-22  1298  	return err;
776dc38403676f4 drivers/gpu/host1x/drm/drm.c Thierry Reding    2013-10-14  1299  }
776dc38403676f4 drivers/gpu/host1x/drm/drm.c Thierry Reding    2013-10-14  1300  

:::::: The code at line 1155 was first introduced by commit
:::::: a7303f7735717c95bf5f65c18c901c72e91dc55b drm/tegra: Do not use ->load() and ->unload() callbacks

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
