Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D03B28DF15
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553442; cv=none; b=S4W4MU8qeGJXf+uPbhOeEx5bgnkoVcMAnkX49NwGNwkp79wfwp4BpDn/K0Z3Ab6hLKaGQRLdU17oekrVpC8Q+Jtl1Eb4ff+V4Z2aNBZrKbbsCQHGU+C4XO3nZ25hlYmyZ7YvS97fw4go8vt/z7ul/S8/ECtRb+wwOLTH7puNLQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553442; c=relaxed/simple;
	bh=ASW0tkpiB6O3qGW1LiFXFk1SyKTy3erxkXa+hV4ThZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LzeSAHEirgFU3p3EmH+RoxXNE5vPy+AD9Icsw4K7APnlMXMDvEIS404n8Ae+dbyK3ESXSd4M5DbQLc3pk6jYBOVXM53RRV0rjDXMOAD7QObuoZmUKF5w3WeagKQjq7mbe8Se4HJqkDT+/yCXX12oQ5Z+K0G2QFW3u892qJqpwxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0EY3FDa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0EY3FDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749553441; x=1781089441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ASW0tkpiB6O3qGW1LiFXFk1SyKTy3erxkXa+hV4ThZ8=;
  b=M0EY3FDa7At53ZeQwLL88Qn19ld+9KRgpqYTxQafurlHcVNT+6ntyqM7
   jhZv1BwyESzA1oXT6ZJDfMmsl5mjq9t15QZHT4ujwIe63gjbPbz5iFFZd
   r8MZ2Piz/5eY/4F+Zo9wbq0P9fhWCDi4SIfF8qRg+Eo2UMCEfwJzfYVOh
   UZaN2sFT5zHiV2UqFzeqy0oUDcOibAxL6Zv1VKbNu+ObJnxEnWbdO3j1O
   s/5lc1yjnx5c6+Rx82haG2XhE3mfIdIvytFQwt3KoGsVU9SkdEjT9eG07
   oZW0q5xqDR6I/G9vaFU+IYSnp0PmtaXOFlPH7GbGqUsQbYlMqX3xCsgKb
   g==;
X-CSE-ConnectionGUID: MU582BlzRmGPssbf/ySbFA==
X-CSE-MsgGUID: Pm7HV8/MTiCkgcRTJigqmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="61926563"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="61926563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 04:04:01 -0700
X-CSE-ConnectionGUID: lNF5vawFQeyffU/xktl5zw==
X-CSE-MsgGUID: Nh8/z4qvSpWG8iiUf+cvWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151610909"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jun 2025 04:03:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOwlo-00087B-2U;
	Tue, 10 Jun 2025 11:03:56 +0000
Date: Tue, 10 Jun 2025 19:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/3] bits: unify the non-asm GENMASK*()
Message-ID: <202506101824.clI5VYyZ-lkp@intel.com>
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
In-Reply-To: <20250609-consolidate-genmask-v2-2-b8cce8107e49@wanadoo.fr>
References: <20250609-consolidate-genmask-v2-2-b8cce8107e49@wanadoo.fr>
TO: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
TO: Yury Norov <yury.norov@gmail.com>
TO: Lucas De Marchi <lucas.demarchi@intel.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: Jani Nikula <jani.nikula@linux.intel.com>
TO: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
TO: Rodrigo Vivi <rodrigo.vivi@intel.com>
TO: Tvrtko Ursulin <tursulin@ursulin.net>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: linux-kernel@vger.kernel.org
CC: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: Andi Shyti <andi.shyti@linux.intel.com>
CC: David Laight <David.Laight@ACULAB.COM>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Anshuman Khandual <anshuman.khandual@arm.com>
CC: linux-arm-kernel@lists.infradead.org
CC: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9946fe286439c2aeaa7953b8c316efe5b83d515]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol-via-B4-Relay/bits-split-the-definition-of-the-asm-and-non-asm-GENMASK/20250609-105646
base:   d9946fe286439c2aeaa7953b8c316efe5b83d515
patch link:    https://lore.kernel.org/r/20250609-consolidate-genmask-v2-2-b8cce8107e49%40wanadoo.fr
patch subject: [PATCH v2 2/3] bits: unify the non-asm GENMASK*()
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101824.clI5VYyZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506101824.clI5VYyZ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-himax-hx8279.c:801 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_l[i] > ((((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) << (6) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) >> ((4 * 8) - 1 - (7))))) | (((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) << (0) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) >> ((4 * 8) - 1 - (5))))))) => (0-255 > 255)'
drivers/gpu/drm/panel/panel-himax-hx8279.c:807 hx8279_check_gmux_config() warn: impossible condition '(gmux->gout_r[i] > ((((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) << (6) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) >> ((4 * 8) - 1 - (7))))) | (((0) + (((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) << (0) & ((((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))) >> ((4 * 8) - 1 - (5))))))) => (0-255 > 255)'

vim +801 drivers/gpu/drm/panel/panel-himax-hx8279.c

38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  789  
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  790  static int hx8279_check_gmux_config(struct hx8279 *hx, struct device *dev)
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  791  {
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  792  	const struct hx8279_panel_desc *desc = hx->desc;
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  793  	const struct hx8279_goa_mux *gmux = desc->gmux;
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  794  	int i;
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  795  
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  796  	/* No gmux defined means we simply skip the GOA mux configuration */
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  797  	if (!gmux)
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  798  		return 0;
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  799  
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  800  	for (i = 0; i < ARRAY_SIZE(gmux->gout_l); i++) {
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14 @801  		if (gmux->gout_l[i] > (HX8279_GOUT_STB | HX8279_GOUT_SEL))
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  802  			return dev_err_probe(dev, -EINVAL,
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  803  					     "Invalid value found in gout_l[%d]\n", i);
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  804  	}
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  805  
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  806  	for (i = 0; i < ARRAY_SIZE(gmux->gout_r); i++) {
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14 @807  		if (gmux->gout_r[i] > (HX8279_GOUT_STB | HX8279_GOUT_SEL))
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  808  			return dev_err_probe(dev, -EINVAL,
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  809  					     "Invalid value found in gout_r[%d]\n", i);
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  810  	}
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  811  
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  812  	return 0;
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  813  }
38d42c261389985 AngeloGioacchino Del Regno 2025-04-14  814  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
