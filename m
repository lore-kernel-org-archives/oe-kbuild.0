Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377783ACA6C
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jul 2026 20:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784925882; cv=none; b=Kw4fgdGfFXQ4O03nIPRn9u1kqj0dVymwqujLEErGCLOMnr71n2jzxMgi8i8kw+fWMG7q9GbjuQJ0vFWPqeiV+lwrLiVbAXRMuqOcArHAdItUP7AU60S9a/wCMLc5gGv0vGJeeAD8ZaUwiwpsXMtsJn1GxLIgZ2KfSApSS0L2ouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784925882; c=relaxed/simple;
	bh=d3qs8D7eF3oplMeWurZzJ2VRfXztM3wX2xW2XTXC39o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TixXr9WbfwLFXiO8G35hVm85N6K5l/5RNx7o2gqIk7cAIypHztg9PXfJFFW3UyBF94pBdMpQIZDC+Gp0gRup12Xe1DESXREH+V/cygV6j4ZUrSAoNpXb0J87zm1WkKPCNBGRU7dCyqcd1Ts+ydCbUkRAK4Kwz1nr1MmnPMcqjJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCysmSfB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCysmSfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784925880; x=1816461880;
  h=date:from:to:cc:subject:message-id;
  bh=d3qs8D7eF3oplMeWurZzJ2VRfXztM3wX2xW2XTXC39o=;
  b=CCysmSfBKQWpPPQKbd7NfqANeVQdRPwcmi3zF2E/TzVmOFRUGl7lqUo0
   +/ItLhbQyUygwmRYZ87vPUmf6jGknllDAltQM/4F9Sut7TOQQzA2eMbrO
   wAunHxFQ3JwXtTaVh/X/F1bQi5N/FRelxBEpuGXCoFit5ccy12xq+3tIQ
   YU5dHCBWj1ag+i78dwLA+mYMEFI+gy4XYIYJIkaCujRUifa81G8kNQpe2
   2sakeClrguFyUKs8XSFuX1xTu2eMqARdAU4RdATbHKLWE93pnEu9mxL3e
   j3EoAhN8IA/t1PNU4wQ5nSQmz5Hdy8mBS66W2EUiD641jub2q1KundJaY
   g==;
X-CSE-ConnectionGUID: DcWRyJGOTvm06OfDySzm0w==
X-CSE-MsgGUID: SOQfDHWbT5emxxNM08oJlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="111140905"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="111140905"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 13:44:39 -0700
X-CSE-ConnectionGUID: EsIykJeMRWShL5vHFDquvg==
X-CSE-MsgGUID: DKv04t04TV2ym1u7JH1ujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="283315379"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jul 2026 13:44:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnMl2-00000000bDD-0Q6b;
	Fri, 24 Jul 2026 20:44:36 +0000
Date: Sat, 25 Jul 2026 04:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panel/panel-himax-hx8279.c:807
 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_r[i] >
 ((((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 -
 (((-1)) < 1))))) << (6) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))...
Message-ID: <202607250403.PZ2oQ3dC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 104ea1c84b91c9f452e497ba51602b903711cdd5 bits: unify the non-asm GENMASK*()
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: riscv-randconfig-r071-20260723 (https://download.01.org/0day-ci/archive/20260725/202607250403.PZ2oQ3dC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 104ea1c84b91 ("bits: unify the non-asm GENMASK*()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607250403.PZ2oQ3dC-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panel/panel-himax-hx8279.c:807 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_r[i] > ((((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) << (6) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) >> ((4 * 8) - 1 - (7))))) | (((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) << (0) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) >> ((4 * 8) - 1 - (5))))))) => (0-255 > 255)'

Old smatch warnings:
drivers/gpu/drm/panel/panel-himax-hx8279.c:801 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_l[i] > ((((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) << (6) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) >> ((4 * 8) - 1 - (7))))) | (((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) << (0) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) >> ((4 * 8) - 1 - (5))))))) => (0-255 > 255)'

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
