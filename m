Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8AD38DF9
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731135521; cv=none; b=jCGtch6w8zoRiX8C+sNnKnVUCwR7ucLsE9xDRClaN6CCZ2nKAZAAblmXnwLACnRFEqIJIMl93taRNBK05Eh/yt6+L6cTmhYz6BrwvjMiS1Y2pl5wHli7kZjsMVlbl970d7gb9GiOfoiTF3JC9NgQzL+0D5IBdJA986TAjMLN5f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731135521; c=relaxed/simple;
	bh=SpEIltgrImYRzxT9kcsQMl03OL6JPVLV65kDd46USRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKROJKFyHGh/Hj1nTSRj/fFSoExFUJxUoh6rnGW6kZZfOnpyKzbRpZwqMwnd0jG2m3QdYQnf6KN07x/8t2a+oAxaR1yedd/GwWcOeptNvOMsRpa/zhd5aAnaenXVlZO+FJqMAo3ZqTYQNek2WsgDEoAADmlvqWdhdPN8XnylWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yqzul+9+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yqzul+9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731135519; x=1762671519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SpEIltgrImYRzxT9kcsQMl03OL6JPVLV65kDd46USRI=;
  b=Yqzul+9+J0QVPIlHKcS/ifMJunHcQROB0MESe8bUxyzt4gxKAMO9Wj8V
   vS5k+nFSImpBMm/vfn3tudl7UUtN60cPqWa/Z/tjxjKY0klRCN+YWymtK
   zhQJqKbNVldHgf7pb5AgSLxwhX+EZIigwQHaxi4xJtTF8Bd/fcAXkeQpK
   DFfb+SioPOLE6MpdTxYsNAcO2txVLHY7xg6FzjhRKMqMy/cNfGoBj70DN
   3/gFNhifmXgjxLEQZNuyJh7rD9gSasIewXNuq1vmnziUWVr7lruCr2epp
   /+BT3au+RsevA1y7RI451Nzk5OPmcpRJWIssIDfE5uGkZdMvHh9iFTK2q
   w==;
X-CSE-ConnectionGUID: C4Ju73T5STu6r/htqq3nBw==
X-CSE-MsgGUID: FP6g/L40RcSVfTeY9ci4Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30435338"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="30435338"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 22:58:37 -0800
X-CSE-ConnectionGUID: /userXTqQW+nsHdfb3eQRw==
X-CSE-MsgGUID: xNt94eiZR0OggCOi+DFFeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="86296850"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Nov 2024 22:58:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9fQY-000s9k-1O;
	Sat, 09 Nov 2024 06:58:34 +0000
Date: Sat, 9 Nov 2024 14:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [at91:at91-dt 13/13]
 arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb:
 /apb/dma-controller@f0008000: failed to match any schema with compatible:
 ['microchip,sam9x7-dma', 'atmel,sama5d4-dma']
Message-ID: <202411091413.DRaeUmv7-lkp@intel.com>
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
TO: Varshini Rajendran <varshini.rajendran@microchip.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git at91-dt
head:   371a47c9a58a13e339fce2a3118c9ee6a8422258
commit: 371a47c9a58a13e339fce2a3118c9ee6a8422258 [13/13] ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241109/202411091413.DRaeUmv7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091413.DRaeUmv7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411091413.DRaeUmv7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/dma-controller@f0008000: failed to match any schema with compatible: ['microchip,sam9x7-dma', 'atmel,sama5d4-dma']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/dma-controller@f0008000: failed to match any schema with compatible: ['microchip,sam9x7-dma', 'atmel,sama5d4-dma']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ssc@f0010000: failed to match any schema with compatible: ['microchip,sam9x7-ssc', 'atmel,at91sam9g45-ssc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ssc@f0010000: failed to match any schema with compatible: ['microchip,sam9x7-ssc', 'atmel,at91sam9g45-ssc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f0028000: failed to match any schema with compatible: ['microchip,sam9x7-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f0028000: failed to match any schema with compatible: ['microchip,sam9x7-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f0040000: failed to match any schema with compatible: ['microchip,sam9x7-pit64b', 'microchip,sam9x60-pit64b']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f0040000: failed to match any schema with compatible: ['microchip,sam9x7-pit64b', 'microchip,sam9x60-pit64b']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: timer@f8008000: compatible:0: 'microchip,sam9x7-tcb' is not one of ['atmel,at91rm9200-tcb', 'atmel,at91sam9x5-tcb', 'atmel,sama5d2-tcb']
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: timer@f8008000: compatible:1: 'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: timer@f8008000: compatible:2: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: timer@f8008000: compatible: ['microchip,sam9x7-tcb', 'atmel,sama5d2-tcb', 'simple-mfd', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/timer@f8008000: failed to match any schema with compatible: ['microchip,sam9x7-tcb', 'atmel,sama5d2-tcb', 'simple-mfd', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/matrix@ffffde00: failed to match any schema with compatible: ['microchip,sam9x7-matrix', 'atmel,at91sam9x5-matrix', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/matrix@ffffde00: failed to match any schema with compatible: ['microchip,sam9x7-matrix', 'atmel,at91sam9x5-matrix', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/ecc-engine@ffffe000: failed to match any schema with compatible: ['microchip,sam9x7-pmecc', 'atmel,at91sam9g45-pmecc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/mpddrc@ffffe800: failed to match any schema with compatible: ['microchip,sam9x7-ddramc', 'atmel,sama5d3-ddramc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/mpddrc@ffffe800: failed to match any schema with compatible: ['microchip,sam9x7-ddramc', 'atmel,sama5d3-ddramc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x7-smc', 'atmel,at91sam9260-smc', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/smc@ffffea00: failed to match any schema with compatible: ['microchip,sam9x7-smc', 'atmel,at91sam9260-smc', 'syscon']
   arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/interrupt-controller@fffff100: failed to match any schema with compatible: ['microchip,sam9x7-aic']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: reset-controller@fffffe00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x7-rstc', 'microchip,sam9x60-rstc'] is too long
   	'microchip,sam9x7-rstc' is not one of ['atmel,at91sam9260-rstc', 'atmel,at91sam9g45-rstc', 'atmel,sama5d3-rstc', 'microchip,sam9x60-rstc', 'microchip,sama7g5-rstc']
   	'atmel,sama5d3-rstc' was expected
   	'atmel,at91sam9g45-rstc' was expected
   	from schema $id: http://devicetree.org/schemas/reset/atmel,at91sam9260-reset.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/reset-controller@fffffe00: failed to match any schema with compatible: ['microchip,sam9x7-rstc', 'microchip,sam9x60-rstc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: poweroff@fffffe10: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sam9x7-shdwc', 'microchip,sam9x60-shdwc'] is too long
   	'microchip,sama7g5-shdwc' was expected
   	'microchip,sam9x7-shdwc' is not one of ['atmel,sama5d2-shdwc', 'microchip,sam9x60-shdwc']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/power/reset/atmel,sama5d2-shdwc.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/poweroff@fffffe10: failed to match any schema with compatible: ['microchip,sam9x7-shdwc', 'microchip,sam9x60-shdwc']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/syscon@fffffe60: failed to match any schema with compatible: ['microchip,sam9x7-gpbr', 'atmel,at91sam9260-gpbr', 'syscon']
>> arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dtb: /apb/syscon@fffffe60: failed to match any schema with compatible: ['microchip,sam9x7-gpbr', 'atmel,at91sam9260-gpbr', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
