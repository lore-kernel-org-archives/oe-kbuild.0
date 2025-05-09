Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ED1F507
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 03:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746762271; cv=none; b=JZY1ZjvZekcwqAP7z53QoY9iabEqlglY54/oNOKb3tEO6z7wFphWnOLHjZkzrgkbtO9YiKPChxFeSSil4vBp98W4LTgDoYXcrvG65jAqp/avzJZCTWhFo91iAleqN5RRUYvbfL6IqtaBR1lRsBlMBHRYta0EJsr/pSP7OvmauZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746762271; c=relaxed/simple;
	bh=MoobisjWOD9SM2rvpa/Ag3Z0J5LG+PhlteGixIdswzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AhjAnp6lnBHU6gVEdxP+Vy54nTOIJPF6q+TzriRPRJfNDAUrysG3MUn3Kc72C7InerSXzAwRbPqCUGUVVTVPtQtK4zRRAsDZGIUBAQgBzJ2a5mdkoPn/ZiVWe1rGYkmJ850lGOYyq9BqoouXw5ke7I8UmsBj215jQBGV8sjWNB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFJdQ2ZS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFJdQ2ZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746762269; x=1778298269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MoobisjWOD9SM2rvpa/Ag3Z0J5LG+PhlteGixIdswzo=;
  b=kFJdQ2ZSJJACRodDiDt6W7OGpy+dWC9liu3KjKxf9KRo0w2Wu4kclXE7
   30ZklLHuzSO3X+vkHnYZvLF6S49nWMdlba6kxTIkA3wRXsqvDEh3HCEE6
   HefIwwKfa6O7KFmkm2rrj0YX6+FP13oIPrGHbKmQcCWTyl1bw0UEVxWuM
   QK3sjVvUJQk5b8HQ8LdXPe/wKg+ITjW8Vtm2+O+lgieqB2Wk3BnYXDBwk
   e8zety3cESAgkq9zx7sPdhg4iw29RS0R+MnBicaapnD3RL0UVMzrwvpBo
   a0pM7wlfDaMTf2iSrj8JnrIQE2zhU/XrD/ynJLO/j5qTqW6QvPFVa5hJN
   w==;
X-CSE-ConnectionGUID: UrfE2vqjTZujfOaaaPFEZA==
X-CSE-MsgGUID: NXt3g7uGRd2gzP8bCwdthw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48446957"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48446957"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 20:44:28 -0700
X-CSE-ConnectionGUID: 1IHy8JOdRNWKSrUDceC+dw==
X-CSE-MsgGUID: 1IgpDki2S5Gxr/lfymskJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="159797166"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 20:44:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDEen-000Bdf-08;
	Fri, 09 May 2025 03:44:17 +0000
Date: Fri, 9 May 2025 11:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3904/9729]
 drivers/gpu/drm/panel/panel-himax-hx8279.c:801 hx8279_check_gmux_config()
 warn: impossible condition '(gmux->gout_l[i] > (((0) + (((~((0))) << (6)) &
 (~((0)) >> (32 - 1 - (7))))) | ((0) + (((~((0))) << (0)) & (~((0)) >> (32 -
 1 - (5))))))) => (0-255 > 255...
Message-ID: <202505091159.PizrDYwj-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: 38d42c261389985e8dd4739dbd97e2dc855e8dd0 [3904/9729] drm: panel: Add driver for Himax HX8279 DDIC panels
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/archive/20250509/202505091159.PizrDYwj-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505091159.PizrDYwj-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panel/panel-himax-hx8279.c:801 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_l[i] > (((0) + (((~((0))) << (6)) & (~((0)) >> (32 - 1 - (7))))) | ((0) + (((~((0))) << (0)) & (~((0)) >> (32 - 1 - (5))))))) => (0-255 > 255)'
drivers/gpu/drm/panel/panel-himax-hx8279.c:807 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_r[i] > (((0) + (((~((0))) << (6)) & (~((0)) >> (32 - 1 - (7))))) | ((0) + (((~((0))) << (0)) & (~((0)) >> (32 - 1 - (5))))))) => (0-255 > 255)'

Old smatch warnings:
drivers/gpu/drm/panel/panel-himax-hx8279.c:842 hx8279_check_goa_config() error: uninitialized symbol 'goa_odd_valid'.
drivers/gpu/drm/panel/panel-himax-hx8279.c:842 hx8279_check_goa_config() error: uninitialized symbol 'goa_even_valid'.

vim +801 drivers/gpu/drm/panel/panel-himax-hx8279.c

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
38d42c26138998 AngeloGioacchino Del Regno 2025-04-14 @801  		if (gmux->gout_l[i] > (HX8279_GOUT_STB | HX8279_GOUT_SEL))
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
