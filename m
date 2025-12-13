Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C191B4138
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 00:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586029; cv=none; b=JYjV4sjTtIQ2wiQpn5iUp7HXQ2N90/knUb3ohFFYOJI3CSfZ4C6nsaLAEX3cW4HYFvAYlovCxcV/ulvRDyJ33GH/+sJy0H9opwnKuhyTQVEWku3Uc3Wng1B6IZHPzxIUIMunYH7M/QqAbQHAyUzg1kkQa1zsIXJZnAx2lKpFN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586029; c=relaxed/simple;
	bh=S6lRi9ximGjiS0hFjrAa6r/r2GMFbwaPgrsu6icMndo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CG1gA07CP2+pkRC+TAzSwywAH1N/B+cG2XD0Dd8ZhM/pk+BurDvD3wadzf3XEoxI5UD8zYBJYzz0L2XccZwu5ceniuO8dP9o2dlax0OOBLI321vMNhokPE2IszEC9ArdoV3Pa8OSpM9DSYHgtWWNj7XvoAavJKOs6pHXuQ6YhtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiolurFZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiolurFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765586027; x=1797122027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6lRi9ximGjiS0hFjrAa6r/r2GMFbwaPgrsu6icMndo=;
  b=UiolurFZ4WMYBSPKNo4Tqs8+UtnONgQNTBaq4/+wVHfCcjzZLF56kEt/
   hTM/5iGAbL5zA66bTo5Ku48I9Ju0IV8hCFkTVcTlGlzBtgOGaAUNgzEHt
   EqJqqn10fCwpkOvClDDNpSyrXONUy1sGbKjn2cZi5LvZXPYNkNNXi6aYn
   L1/K0C569NxNf2i/8tIk93YwY8X3e5o+ZQKbTMDj/1x9OYusPkKVCnDit
   qBWySev66FkKWWwvaK9l9bsm6CnyLEu2ZCCFPusGJ0ni0jdEPgI9UITKv
   lkv/8BkFZFgMF+X2ffHa+7fMSIelWOpVXmyM8UyEIfEyoE01KBYzhl1br
   A==;
X-CSE-ConnectionGUID: v718pCzsQY2UH688UV8S5Q==
X-CSE-MsgGUID: ZCGnJ10BQJyUfFe4VGLQ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66581151"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66581151"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:33:45 -0800
X-CSE-ConnectionGUID: kSWAlhHZSnWiui7nKR60hw==
X-CSE-MsgGUID: JzTihoqXTySz/mgZkS+9bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197718305"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 16:33:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDZt-000000006ph-1LsJ;
	Sat, 13 Dec 2025 00:33:41 +0000
Date: Sat, 13 Dec 2025 08:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panel/panel-himax-hx8279.c:807
 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_r[i] >
 ((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 -
 (((-1)) < 1))))) << (6) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))...
Message-ID: <202512130857.2ECJ4UeV-lkp@intel.com>
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
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 104ea1c84b91c9f452e497ba51602b903711cdd5 bits: unify the non-asm GENMASK*()
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: sparc-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130857.2ECJ4UeV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130857.2ECJ4UeV-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panel/panel-himax-hx8279.c:807 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_r[i] > ((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << (6) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) >> ((8 * 8) - 1 - (7))))) | (((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << (0) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) >> ((8 * 8) - 1 - (5))))))) => (0-255 > 255)'

Old smatch warnings:
drivers/gpu/drm/panel/panel-himax-hx8279.c:801 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_l[i] > ((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << (6) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) >> ((8 * 8) - 1 - (7))))) | (((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << (0) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) >> ((8 * 8) - 1 - (5))))))) => (0-255 > 255)'

vim +807 drivers/gpu/drm/panel/panel-himax-hx8279.c

38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  789  
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  790  static int hx8279_check_gmux_config(struct hx8279 *hx, struct device *dev)
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  791  {
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  792  	const struct hx8279_panel_desc *desc = hx->desc;
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  793  	const struct hx8279_goa_mux *gmux = desc->gmux;
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  794  	int i;
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  795  
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  796  	/* No gmux defined means we simply skip the GOA mux configuration */
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  797  	if (!gmux)
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  798  		return 0;
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  799  
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  800  	for (i = 0; i < ARRAY_SIZE(gmux->gout_l); i++) {
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  801  		if (gmux->gout_l[i] > (HX8279_GOUT_STB | HX8279_GOUT_SEL))
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  802  			return dev_err_probe(dev, -EINVAL,
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  803  					     "Invalid value found in gout_l[%d]\n", i);
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  804  	}
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  805  
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  806  	for (i = 0; i < ARRAY_SIZE(gmux->gout_r); i++) {
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14 @807  		if (gmux->gout_r[i] > (HX8279_GOUT_STB | HX8279_GOUT_SEL))
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  808  			return dev_err_probe(dev, -EINVAL,
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  809  					     "Invalid value found in gout_r[%d]\n", i);
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  810  	}
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  811  
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  812  	return 0;
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  813  }
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14  814  

:::::: The code at line 807 was first introduced by commit
:::::: 38d42c261389985e8dd4739dbd97e2dc855e8dd0 drm: panel: Add driver for Himax HX8279 DDIC panels

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Neil Armstrong <neil.armstrong@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
