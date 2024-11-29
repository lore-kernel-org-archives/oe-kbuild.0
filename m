Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DE1184F
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Nov 2024 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732862964; cv=none; b=SSL8vAjtlpFGkJAR4cTpoX0WJScTzV1UV/QUO9gFpuJucCuEHYKnzBQJMWaRXY7xrmt3nSOMKmy+gSeGGZVA3vpj5/8V0qLrPyjqpxHrG4Z/XVu2EsA7ByEMbfRxh5wCtMjb0rkVo/uBa1bgSr8GJldb7CbYhqLYnSjoXq7Rllg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732862964; c=relaxed/simple;
	bh=Ka2Tpk/LHO7bZhlVZCrMWoWoEtUobmFdApMdIRBNdE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XemhlXMMbUQHBv20byYjBTtG0XqAVRATq6My2rzM0mFsifRWoLKHYfwwi5zMZRQ86Gz044oJIUZAHz+iW0pqmeXsI/rQUwu/lP14mjD8EVH67msKFNpWDIhDF3Hq6G3Gb0Oe7ZxXPu8Ye/IMivanrdnbFUudMhpohaxAhogGxx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHcajW7H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHcajW7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732862962; x=1764398962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ka2Tpk/LHO7bZhlVZCrMWoWoEtUobmFdApMdIRBNdE8=;
  b=dHcajW7HveT5xGZh+7LZdyrpjPW0ZoygW1b2dwY8D3Q9F71f9XKrisdC
   VDD6EKJYmom2VhHAVw5EocnzAtavGCwDbkUHYwTAwBzZ77sxUNuZIQhti
   7fB6cV79DlmH+BbHtbd+i4BC8S4AzwBd0jVABiEQ73jWsF5or0I1i1c85
   X9HQtLcJPKA1ndLNTRAZLr0Q3zo3OaBovHtqrfAComjqahjBfB9DpL0dt
   RNHqYk4vgLNkFRcmTEkYCQM5uLp7PqAWMgaxPv6QQuL7BTQTuI37mzIAM
   GKmp/ngyK3HyVmSYF+MBXR2N2wXH43KVKh0XCJugJ4NM0soj0duELjB06
   Q==;
X-CSE-ConnectionGUID: 2C+y4ZHjQQi5FSU71i5dJg==
X-CSE-MsgGUID: Vbwvou6eSWytxOAodK2lJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="50497809"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="50497809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 22:49:21 -0800
X-CSE-ConnectionGUID: LrCT3WmPTD+FTVuE4YOKfQ==
X-CSE-MsgGUID: sX9FnTHGR1CyREsqVOC25A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="115690762"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2024 22:49:21 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGuoY-00006V-12;
	Fri, 29 Nov 2024 06:49:18 +0000
Date: Fri, 29 Nov 2024 14:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 12/15] ARM: dts: microchip: add support for
 sama7d65_curiosity board
Message-ID: <202411291401.Uvey4TjI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <7877f8c4cce78de34a6bdcc13fc78f5f0ebde06b.1732030972.git.Ryan.Wanner@microchip.com>
References: <7877f8c4cce78de34a6bdcc13fc78f5f0ebde06b.1732030972.git.Ryan.Wanner@microchip.com>
TO: Ryan.Wanner@microchip.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: nicolas.ferre@microchip.com
TO: alexandre.belloni@bootlin.com
TO: claudiu.beznea@tuxon.dev
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: arnd@arndb.de
CC: dharma.b@microchip.com
CC: mihai.sain@microchip.com
CC: romain.sioen@microchip.com
CC: varshini.rajendran@microchip.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-mmc@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-spi@vger.kernel.org
CC: linux-serial@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on soc/for-next linus/master v6.12 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Wanner-microchip-com/dt-bindings-ARM-at91-Document-Microchip-SAMA7D65-Curiosity/20241121-132438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/7877f8c4cce78de34a6bdcc13fc78f5f0ebde06b.1732030972.git.Ryan.Wanner%40microchip.com
patch subject: [PATCH 12/15] ARM: dts: microchip: add support for sama7d65_curiosity board
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241129/202411291401.Uvey4TjI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291401.Uvey4TjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411291401.Uvey4TjI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1800000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/timer@e1804000: failed to match any schema with compatible: ['microchip,sama7d65-pit64b', 'microchip,sam9x60-pit64b']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
