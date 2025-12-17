Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECCB2C21D4
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765957642; cv=none; b=tJ49h+QbAbhuY9gyvVQuaydZEj9ZXdgpQnI9AAsYIzqODdQvyq3UdjlW4FCQo2yE1y3SG5mNJm6MgYQDMg2jIMDYFjd6DKvJkEcZududb2UhXqmaaoO7Q0P3rku5Y+AP0BEYUSdtciNcBmQB1YMZKnNKpAud2iyesyzpBVeVnyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765957642; c=relaxed/simple;
	bh=JsOnO9RVKUtP4OzrftOJJEyGbw2dwzA0qnhvXWMgY/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GBxdhwWSOcOpuUceVO6OpAVP2tZeeTkjgXQrSRObtBgcYZp/bqI5c0JjasjSt1IN/POS1amAVRSlCVr9fZUPTZc5wMJ0Kidwi1ineLfLLvYCShcFIIkR0XQOEIWQtQdH642z55/OtLB4YPHV2UvPTq8SbimADez7Az8bUw/Vjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KF1S470I; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KF1S470I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765957641; x=1797493641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JsOnO9RVKUtP4OzrftOJJEyGbw2dwzA0qnhvXWMgY/g=;
  b=KF1S470IxD0e+/YsbcY4xVH5fvmg+gxCZwhjlh4JBi5rZu8epq49bsQl
   R4X8scu5RHl9SDjrxPeJG01j5eSL8fEr+znQ73IqBtWZBqc7wu6cTMO5U
   x7dVc8JoOyUzcW6xABVyqynBFz3DdnP+QT3TJVqJ3RwmOTfwkN8cXdcUv
   /mRZYy9Bbrygs8qp5odxcrq40JVNKc01YWKXvAlkd9iLGIy7CeNrqsosj
   w0Rk4nEZhtU+rpw1ttw+UN0GCckCM9ArV+fXijVAUj88Nn1npiDQYmNx9
   StdS6ipp3STyRTk66qboQDOL71EKuXzL8fTI8TWvk2Kgnl0+zOE+e/oAV
   Q==;
X-CSE-ConnectionGUID: Ehc4BUjURGevIw6gUHxwQQ==
X-CSE-MsgGUID: gLuupHdbRvm6wuo5Zoj6Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67642362"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="67642362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 23:47:20 -0800
X-CSE-ConnectionGUID: IToaNReRTHiivddo0iZPEA==
X-CSE-MsgGUID: V2iZwCQVSKOtnfrQQSuh4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="221616938"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Dec 2025 23:47:18 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVmFg-000000000B7-33D9;
	Wed, 17 Dec 2025 07:47:16 +0000
Date: Wed, 17 Dec 2025 15:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <202512171538.GYAjmdmM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/soc/renesas/rzn1_irqmux.c:125:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251215142836.167101-8-herve.codina@bootlin.com>
References: <20251215142836.167101-8-herve.codina@bootlin.com>
TO: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on robh/for-next tip/irq/core linus/master v6.19-rc1 next-20251217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-Schneider-Electric/of-irq-Introduce-for_each_of_imap_item/20251215-234427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20251215142836.167101-8-herve.codina%40bootlin.com
patch subject: [PATCH v7 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r123-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171538.GYAjmdmM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171538.GYAjmdmM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512171538.GYAjmdmM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/renesas/rzn1_irqmux.c:125:1: sparse: sparse: bad integer constant expression
   drivers/soc/renesas/rzn1_irqmux.c:125:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/soc/renesas/rzn1_irqmux.c:126:1: sparse: sparse: bad integer constant expression
   drivers/soc/renesas/rzn1_irqmux.c:126:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/soc/renesas/rzn1_irqmux.c:127:1: sparse: sparse: bad integer constant expression
   drivers/soc/renesas/rzn1_irqmux.c:127:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/soc/renesas/rzn1_irqmux.c:127:1: sparse: sparse: bad integer constant expression
   drivers/soc/renesas/rzn1_irqmux.c:127:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +125 drivers/soc/renesas/rzn1_irqmux.c

3c5e50a791f4bb Herve Codina (Schneider Electric  2025-12-15  124) 
3c5e50a791f4bb Herve Codina (Schneider Electric  2025-12-15 @125) MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
