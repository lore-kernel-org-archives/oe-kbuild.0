Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264681F37D3
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749373608; cv=none; b=gGsz/9mLvwVRvS56e0bPNJXE2kH5gKC+MZRcXGQvdWcV1lTWzwkvD9ipJ9yaly+oSYfalVOou9caIk7wMj1jnd3Akwq+L1XJJcbTRZ0jvGaYqDDzOyu8fp8In33HsXHb7gtGwQYIxkbXWri+HzymoUdRxq765wCY6KhABoZGF14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749373608; c=relaxed/simple;
	bh=GVQWMRgJqQnF34ymVQ1siRwbnHPZDCNEDA4ubx7eVZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LsFO0cuE74aUrJ4dBdbz2nTUtDqQr++Q6iepBTqi5q9ox0C/5Jdtb7kFhlCcSVNdd5bn/FKjhEIOgleY1vi1rV3gffI+y5NwZzoKPVIJUTWFhM/ZPp7TtalhLba3CikDE0rRnjOoYa6RriikTsvxw7if6Cl0te1YfkjEWBswUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSjOiQq6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSjOiQq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749373606; x=1780909606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVQWMRgJqQnF34ymVQ1siRwbnHPZDCNEDA4ubx7eVZo=;
  b=gSjOiQq68F6YNG2G9rEvrJyBoOdqxZ/g9giKFoj7a7UWjXwxaNFJ+BPF
   bPSiVxWiFiZ8jjpt+i80JErytwJHGf/KNnP5RdBwoVZOHx9qhE1rCN9+c
   a7OBQiW8yX7Db17RxV49gQP414C89oHSoFa57u610P6B/riKVoTKlHwNC
   CjaR97Jek/xqA1QXYmudykcJRYoBIreG7nBV9XcYVAUOpb2zgnZlOPXQf
   eDaKPTmSt6z/jrwIUTQ464nLSUCaAx4S24bbVwNJvpYEAUDwWgmalps9I
   +XrR/WmYLSxpeB03IvLGpFGFtdW2bFcMxwd6BhWIDXO9VlsbcbcXWSrPL
   Q==;
X-CSE-ConnectionGUID: RXHcAg7pTDq1nPLF/rBtug==
X-CSE-MsgGUID: bcoK6RIWTLaGU9jVGC8qdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="50577530"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="50577530"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 02:06:45 -0700
X-CSE-ConnectionGUID: HGOcYRGxQROOUexvsiZrxw==
X-CSE-MsgGUID: JCOevU2BTlClul+wwDYIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="146224341"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jun 2025 02:06:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOBzF-0006IL-2M;
	Sun, 08 Jun 2025 09:06:41 +0000
Date: Sun, 8 Jun 2025 17:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [norov:bitmap-for-next 1/1]
 drivers/gpu/drm/panel/panel-himax-hx8279.c:801 hx8279_check_gmux_config()
 warn: impossible condition '(gmux->gout_l[i] > (((0) + (((~((0))) << (6)) &
 (~((0)) >> ((8 * 4) - 1 - (7))))) | ((0) + (((~((0))) << (0)) & (~((0)) >>
 ((8 * 4) - 1 - (5))))))) => (0...
Message-ID: <202506081621.wAaLkHfG-lkp@intel.com>
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
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux bitmap-for-next
head:   11fcf368506d347088e613edf6cd2604d70c454f
commit: 11fcf368506d347088e613edf6cd2604d70c454f [1/1] uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-r072-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081621.wAaLkHfG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506081621.wAaLkHfG-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-himax-hx8279.c:801 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_l[i] > (((0) + (((~((0))) << (6)) & (~((0)) >> ((8 * 4) - 1 - (7))))) | ((0) + (((~((0))) << (0)) & (~((0)) >> ((8 * 4) - 1 - (5))))))) => (0-255 > 255)'
drivers/gpu/drm/panel/panel-himax-hx8279.c:807 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_r[i] > (((0) + (((~((0))) << (6)) & (~((0)) >> ((8 * 4) - 1 - (7))))) | ((0) + (((~((0))) << (0)) & (~((0)) >> ((8 * 4) - 1 - (5))))))) => (0-255 > 255)'

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

:::::: The code at line 801 was first introduced by commit
:::::: 38d42c261389985e8dd4739dbd97e2dc855e8dd0 drm: panel: Add driver for Himax HX8279 DDIC panels

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Neil Armstrong <neil.armstrong@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
