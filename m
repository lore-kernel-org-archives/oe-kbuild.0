Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDFC3E1D0D
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337118; cv=none; b=dW5aivMTKrZkWDeJl9bOFq5dY0MX+ZcEcy300i6qilDn7x2UycCceb4VO9Q3iXeitish+DcT50YCOqzOlm3xItnk9Hg1W/3mazizKBL6CZAdwR0yM9hz0h62JrfUy1e9tB3p66XApxgnS6ZnlvbWOSeeKBTJG+PQacJciE68KW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337118; c=relaxed/simple;
	bh=TyLmyPs0/Vm+P+D+po2s/iYOq2yFx73q/KnW6rxGTMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPpbV4+eW9IgY3O/VX/YwM+BAmD2qhvjFvhSxo4rImiEj50L3XJGzxoDe681LD3jrdF4z7JmBbaJbxyIZ/oEZO8wkPCGe08gXX8dK78CmswKS+Q9ZuhLwgnRItr8mz9+y0JB++fVsvSBEv52QYtqQAfx0lmCj3JsPHTa/Wkom/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcUKf5wS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcUKf5wS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780337117; x=1811873117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TyLmyPs0/Vm+P+D+po2s/iYOq2yFx73q/KnW6rxGTMQ=;
  b=IcUKf5wS4T4W2MjE4p4Uf5zfImhi2x8wK3Uhsfbqj6EcUy7GfHWrzOie
   VRc7eCa42GYSUYQY7o5oxa1khKvqGLsCEvooH1iAep8U/JVTvW9wwUrHS
   mGm2TMkjaS5VW0lZra69jf8apgnf+SNP5pZRek1m7bMXsUvDHQ6n9iH4U
   OQcGF0OKcCRjMbLSiWzua9Ejck2fCTBpCE9pr26BLN2jEIK/aQ/WhaWZs
   xphP92ZgVdw4YolL5jscPCBjU+7NcOwd4yDeHpbjThL6CuBXEBVUDp/X/
   icVNfbWKVUHYrj+t4mfkC8oHaxpqDEMH4nBzqdAkdTmTdCk7+VVLk7hgO
   w==;
X-CSE-ConnectionGUID: 8KaMXGC/R/KC9S4tZUfKcg==
X-CSE-MsgGUID: Gz56T8VQSzGYJsVMAcBvDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81003272"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81003272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 11:05:17 -0700
X-CSE-ConnectionGUID: 92KfCBGnSmqsv/shFw4aVg==
X-CSE-MsgGUID: icC9dkYtRHy7ALdfymDV+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="281765582"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Jun 2026 11:05:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU70i-00000000Aus-2G94;
	Mon, 01 Jun 2026 18:05:12 +0000
Date: Tue, 2 Jun 2026 02:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] drm/logicvc: Avoid use-after-free with devm_kzalloc()
Message-ID: <202606020245.ixPLegmm-lkp@intel.com>
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
In-Reply-To: <20260601-logicvc-uaf-v1-1-8c9ca5b3429c@bootlin.com>
References: <20260601-logicvc-uaf-v1-1-8c9ca5b3429c@bootlin.com>
TO: Romain Gantois <romain.gantois@bootlin.com>
TO: Paul Kocialkowski <paulk@sys-base.io>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org
CC: Romain Gantois <romain.gantois@bootlin.com>

Hi Romain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 44e151be23deb788d9f6124de93823faf6e04e99]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Gantois/drm-logicvc-Avoid-use-after-free-with-devm_kzalloc/20260601-145835
base:   44e151be23deb788d9f6124de93823faf6e04e99
patch link:    https://lore.kernel.org/r/20260601-logicvc-uaf-v1-1-8c9ca5b3429c%40bootlin.com
patch subject: [PATCH] drm/logicvc: Avoid use-after-free with devm_kzalloc()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-051-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020245.ixPLegmm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606020245.ixPLegmm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/logicvc/logicvc_layer.c:598:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 618.

vim +/for_each_child_of_node +598 drivers/gpu/drm/logicvc/logicvc_layer.c

efeeaefe9be56e Paul Kocialkowski 2022-05-20  581  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  582  int logicvc_layers_init(struct logicvc_drm *logicvc)
efeeaefe9be56e Paul Kocialkowski 2022-05-20  583  {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  584  	struct drm_device *drm_dev = &logicvc->drm_dev;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  585  	struct device *dev = drm_dev->dev;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  586  	struct device_node *of_node = dev->of_node;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  587  	struct device_node *layer_node = NULL;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  588  	struct device_node *layers_node;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  589  	struct logicvc_layer *layer;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  590  	int ret = 0;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  591  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  592  	layers_node = of_get_child_by_name(of_node, "layers");
efeeaefe9be56e Paul Kocialkowski 2022-05-20  593  	if (!layers_node) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  594  		drm_err(drm_dev, "No layers node found in the description\n");
ed22b4429c4bc9 Romain Gantois    2026-06-01  595  		return -ENODEV;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  596  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  597  
efeeaefe9be56e Paul Kocialkowski 2022-05-20 @598  	for_each_child_of_node(layers_node, layer_node) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  599  		u32 index = 0;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  600  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  601  		if (!logicvc_of_node_is_layer(layer_node))
efeeaefe9be56e Paul Kocialkowski 2022-05-20  602  			continue;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  603  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  604  		ret = of_property_read_u32(layer_node, "reg", &index);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  605  		if (ret)
efeeaefe9be56e Paul Kocialkowski 2022-05-20  606  			continue;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  607  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  608  		layer = logicvc_layer_get_from_index(logicvc, index);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  609  		if (layer) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  610  			drm_err(drm_dev, "Duplicated entry for layer #%d\n",
efeeaefe9be56e Paul Kocialkowski 2022-05-20  611  				index);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  612  			continue;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  613  		}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  614  
efeeaefe9be56e Paul Kocialkowski 2022-05-20  615  		ret = logicvc_layer_init(logicvc, layer_node, index);
e9fcc60ddd2999 Yang Yingliang    2022-06-14  616  		if (ret) {
e9fcc60ddd2999 Yang Yingliang    2022-06-14  617  			of_node_put(layers_node);
ed22b4429c4bc9 Romain Gantois    2026-06-01 @618  			return ret;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
