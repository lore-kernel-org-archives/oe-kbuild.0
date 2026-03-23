Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612F63A9DAB
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271845; cv=none; b=jOzEV7QHyq7cqA8dDh7vFR7r2h5ug1//3Hpb7Kuy24GxZv3lK92pafKjgE6Kwlzddd/Gu7O7Zulyffpe5eEna4EixaQZbfw+qd/mQr1L0vleUVmWdaXg5idNaxJGmhJzs0+PPGYCjKBrnyDNFANv3VzK7MmzFmNYPiuDXeo3r5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271845; c=relaxed/simple;
	bh=fTxj2vAS+IEv+F6kPwMyQzlZTaswG32RuiQcK2ZoQNY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fiXyQm/dw5LmEKI7ipZlcdGKn9/auE0gbDveaC0cvL6AOpWKnGp7Sf5V/rDIr8wNk27VslHoaEuS+lH/KaIu7oEwzH8RVa2OJ27SvmErR8RtRxYyak2GEh0KXWsmSqhfqVhIAy51TkcT+krKlAj/ITZOFFVB3vIRcU/p6FxxZUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1EDItBJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1EDItBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774271845; x=1805807845;
  h=date:from:to:cc:subject:message-id;
  bh=fTxj2vAS+IEv+F6kPwMyQzlZTaswG32RuiQcK2ZoQNY=;
  b=a1EDItBJOOEC/JWqzo4w+6fAKBj23qMU2fiqcU47UO0I7Fi+5QSlA0HR
   3BhatJT0rnAZ0hSYj26UepoAm2XOmYIleRC7C9Z/vuDOXyBpG7W1r61Hz
   3pmB1u1U/RULG0o82alW2JtXemN9LjYXUcQJK2mnykG7Xu0wT5hTyCTOX
   IaNce/NfK6mxvqmMAyVx7FtRlI9B2bf2ATQyWLPnN7Czgl+o7yQ6ohGxE
   YoI6wCic3qJ3fU07RCWg+ofqsvthANYCIU0JT+J6F3uKonJX3wLCqbXEX
   tk5Ij/oFQ6IiabT1e69xJWyHnJquqK3LABmIhDlNn4fZPnOGilp52g/HH
   A==;
X-CSE-ConnectionGUID: csXmgiuTS2WV1362T88Qng==
X-CSE-MsgGUID: rrDDvDGxSiKe55OxUOoyfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85579487"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="85579487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:17:24 -0700
X-CSE-ConnectionGUID: dHqpFiauSQmYXYbFl+ajrQ==
X-CSE-MsgGUID: jeqO3mGASTa3QjvwnZb1nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="220757600"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Mar 2026 06:17:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4f9j-000000000dl-3r1F;
	Mon, 23 Mar 2026 13:17:19 +0000
Date: Mon, 23 Mar 2026 21:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panel/panel-himax-hx8279.c:807
 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_r[i] >
 ((((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 -
 (((-1)) < 1))))) << (6) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))...
Message-ID: <202603232130.qpAvbdVw-lkp@intel.com>
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
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 104ea1c84b91c9f452e497ba51602b903711cdd5 bits: unify the non-asm GENMASK*()
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20260323 (https://download.01.org/0day-ci/archive/20260323/202603232130.qpAvbdVw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603232130.qpAvbdVw-lkp@intel.com/

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
