Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9189F3FC7
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 03:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754451529; cv=none; b=afNICEF/7qGBrhoIWC4rl5TuP0ccyIRRoZm5fOczcO3XSaJK/BEaQAOiayT43sEyNgbk9j1apCxBDtXEjPs0pEBNf1Xs2pL/jyAAmX7o7FvYwZPj5UolJbKPcc7hmInL9NKdcfzQqH1qxP6/z6YBT+vAYK8LGdRfwE9L5tzF5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754451529; c=relaxed/simple;
	bh=HfUMZpz+MBW70BEik7ySgudQTMp8jjYUPiFP7mtFs70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcvplKyKelvbYX9wsI5j97+oyV0/MjuJKLFDVHisqgGFRht4bwmil2DtffOgw7zHlovq/v2wZpfv8Jz0tAePeyXK+FVxBisIUpdc/bKC4RoRBIUsQONkXwHrtAy87uNMDd0s5VeTHN+VafTM2L5sM3/v27nUJgwlS7mQyG0LwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyazrMz+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyazrMz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754451523; x=1785987523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HfUMZpz+MBW70BEik7ySgudQTMp8jjYUPiFP7mtFs70=;
  b=HyazrMz+7FApgaszeBijad4yOw9sxh6kQS+Bc97CVBjmdxhsr8aJFlL6
   PQpwNcJRtBb6n0TKDcsrNYGpRmmQFBYT6WfqCMpxCYpvazdYw5SphsxMW
   EVvt5Vu0gC31VzeB565oa41DojR/8Kucm+jOz6zykch5v6T+rQcQpMFLs
   YjnHZ8a4IQ+YNn5NPk4e4N484J9I29zRivzj1LitC13KYM+pV/7QuCWaq
   wTyf+bmr4c1EFaSqBK4YOkak5O3p+YXaH6J8wzeZHKqBy76tctV4p0b5y
   luQW+Rf7juzQL0dZkr+xM7slLaJs/DM9uETvM3X3HXajBQrxXL5NH1wEl
   A==;
X-CSE-ConnectionGUID: pTpGKSJBSqSC1jToL/yNdQ==
X-CSE-MsgGUID: 2iAEbhrLQK2Pmlpd+agrug==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56471033"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56471033"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 20:38:42 -0700
X-CSE-ConnectionGUID: 2ZCC7oDhRkiX29TR2yrCMA==
X-CSE-MsgGUID: lVQPbgHzT3SHz0/53utsTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164566137"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2025 20:38:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujUyx-00016E-1F;
	Wed, 06 Aug 2025 03:38:31 +0000
Date: Wed, 6 Aug 2025 11:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 13/15] ARM: dts: microchip: sama7d65: add cells for
 temperature calibration
Message-ID: <202508061105.cqviYGnl-lkp@intel.com>
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
In-Reply-To: <20250804100219.63325-14-varshini.rajendran@microchip.com>
References: <20250804100219.63325-14-varshini.rajendran@microchip.com>
TO: Varshini Rajendran <varshini.rajendran@microchip.com>
TO: eugen.hristev@linaro.org
TO: jic23@kernel.org
TO: dlechner@baylibre.com
TO: nuno.sa@analog.com
TO: andy@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: nicolas.ferre@microchip.com
TO: alexandre.belloni@bootlin.com
TO: claudiu.beznea@tuxon.dev
TO: srini@kernel.org
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: varshini.rajendran@microchip.com

Hi Varshini,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on jic23-iio/togreg v6.16]
[cannot apply to linus/master next-20250805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Varshini-Rajendran/ARM-dts-microchip-sama7d65-add-cpu-opps/20250804-180839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250804100219.63325-14-varshini.rajendran%40microchip.com
patch subject: [PATCH 13/15] ARM: dts: microchip: sama7d65: add cells for temperature calibration
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250805 (https://download.01.org/0day-ci/archive/20250806/202508061105.cqviYGnl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061105.cqviYGnl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508061105.cqviYGnl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d000 (microchip,sama7d65-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-wdt', 'microchip,sama7g5-wdt'] is too long
   	'microchip,sama7d65-wdt' is not one of ['atmel,sama5d4-wdt', 'microchip,sam9x60-wdt', 'microchip,sama7g5-wdt']
   	'microchip,sam9x7-wdt' was expected
   	'microchip,sam9x60-wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: watchdog@e001d000 (microchip,sama7d65-wdt): Unevaluated properties are not allowed ('clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/watchdog@e001d000: failed to match any schema with compatible: ['microchip,sama7d65-wdt', 'microchip,sama7g5-wdt']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/chipid@e0020000: failed to match any schema with compatible: ['microchip,sama7d65-chipid']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: adc@e1000000 (microchip,sama7d65-adc): 'nvmem-cell-names', 'nvmem-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/atmel,sama5d2-adc.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ethernet@e1618000 (microchip,sama7d65-gem): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-gem', 'microchip,sama7g5-gem'] is too short
   	['microchip,sama7d65-gem', 'microchip,sama7g5-gem'] is too long
   	'microchip,sama7d65-gem' is not one of ['cdns,at91rm9200-emac']
   	'microchip,sama7d65-gem' is not one of ['cdns,zynq-gem', 'cdns,zynqmp-gem']
   	'microchip,sama7d65-gem' is not one of ['xlnx,versal-gem', 'xlnx,zynq-gem', 'xlnx,zynqmp-gem']
   	'microchip,sama7d65-gem' is not one of ['cdns,at91sam9260-macb', 'cdns,sam9x60-macb', 'microchip,mpfs-macb']
   	'microchip,sama7d65-gem' is not one of ['atmel,sama5d3-macb']
   	'microchip,sama7d65-gem' is not one of ['atmel,sama5d29-gem', 'atmel,sama5d2-gem', 'atmel,sama5d3-gem', 'atmel,sama5d4-gem', 'cdns,np4-macb', 'microchip,sama7g5-emac', 'microchip,sama7g5-gem', 'sifive,fu540-c000-gem', 'cdns,emac', 'cdns,gem', 'cdns,macb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
