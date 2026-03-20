Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F793371884
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994773; cv=none; b=p2iAOVs++iSjM8YDAnnOIHkh/q3PoBf9ve4rasL2nFuTfg2XDnJN0nn/QACkgXRPXcQKT//YHEqcelYKLUp+izDknSbITKEkJbA0e3el0vytty40oGNomgi/3Y+OsaFdOzF6XyY7MrEc4RKO9AEVh4BFBOFokBaJ1jUskA5V3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994773; c=relaxed/simple;
	bh=c07/6e2aF6AyocZhahPw/voBu4BUW2WwKZnAqK5pAAw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nH1+9tEm/sUhfO4RJPZyBWqi/NLFv49dqVdBQ0ySzoz68cOPaPETi4lbXCoEgCd5t0SdXUdzFg1os/NXsMS2r3csn7Fy6/dDtIWNgs4tVyedMT1vkF5Jp0jpsAThsJAxOntkikH37q4jH1wR6nWF6jMrI2oDtFAuhtW6vubOg5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JL38cQNv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JL38cQNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773994771; x=1805530771;
  h=date:from:to:cc:subject:message-id;
  bh=c07/6e2aF6AyocZhahPw/voBu4BUW2WwKZnAqK5pAAw=;
  b=JL38cQNvvLYHuav+r0a6j/NHqHz/w3mFdxZ2I/84LsrlrBpGED43BzmW
   VKAgQ/FJnJ8ir1yqzmAiNMoDt00VUpTMQLyL7gJ9eA7LKGPzJ5PsZ6ApK
   fWor/xZJCOAbxfJmwyd7aDWVYwzW/EOtn45WYz3fGs/AClp3nyObdiTVT
   tMvefrDIIE9keXWhgy5xuJetZRv0WVYTeMcF7wbzsv5UdFlGED+sx5bNL
   1efUhw0FdfkU0mhmnrH28BitHCkwaJuOk37HvL2xwXQ8D3O3EO56TqAv0
   5bDCAzEGBVzsE5VQ1BCDv2+O0M8t/d60oe+TBWHd7Cq26jg6Q/jHNr/CL
   w==;
X-CSE-ConnectionGUID: 6MFD1SuiRqiwqHy6URa7RA==
X-CSE-MsgGUID: hX9AdPIkRqCm2ri2H67Pig==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78935145"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78935145"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:19:31 -0700
X-CSE-ConnectionGUID: lyrCz00qQpaWKHRS6NvbqQ==
X-CSE-MsgGUID: MptRvG4KR9euzfnd5U7JZg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Mar 2026 01:19:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3V4p-0000000050D-35sM;
	Fri, 20 Mar 2026 08:19:27 +0000
Date: Fri, 20 Mar 2026 09:18:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [at91:at91-dt 7/7]
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: serial@200
 (microchip,lan9691-usart): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202603200911.oshimUAL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Robert Marko <robert.marko@sartura.hr>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git at91-dt
head:   b5788817a793dfdcc64b7fa75d55f70fe8a0db8d
commit: b5788817a793dfdcc64b7fa75d55f70fe8a0db8d [7/7] arm64: dts: microchip: add EV23X71A board
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2052-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200911.oshimUAL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200911.oshimUAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603200911.oshimUAL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/microchip/lan9691.dtsi:367.29-370.5: Warning (unique_unit_address_if_enabled): /axi/syscon@e00c0000: duplicate unit-address (also used in node /axi/switch@e00c0000)
>> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: serial@200 (microchip,lan9691-usart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,lan9691-usart', 'atmel,at91sam9260-usart'] is too long
   	['microchip,lan9691-usart', 'atmel,at91sam9260-usart'] is too short
   	'microchip,lan9691-usart' is not one of ['atmel,at91rm9200-usart', 'atmel,at91sam9260-usart']
   	'atmel,at91rm9200-dbgu' was expected
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,lan9691-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart', 'microchip,sama7d65-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected
   	'atmel,at91rm9200-usart' was expected
   	'microchip,sam9x60-usart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: /axi/flexcom@e0040000/serial@200: failed to match any schema with compatible: ['microchip,lan9691-usart', 'atmel,at91sam9260-usart']
>> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: serial@200 (microchip,lan9691-usart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,lan9691-usart', 'atmel,at91sam9260-usart'] is too long
   	['microchip,lan9691-usart', 'atmel,at91sam9260-usart'] is too short
   	'microchip,lan9691-usart' is not one of ['atmel,at91rm9200-usart', 'atmel,at91sam9260-usart']
   	'atmel,at91rm9200-dbgu' was expected
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,lan9691-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart', 'microchip,sama7d65-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected
   	'atmel,at91rm9200-usart' was expected
   	'microchip,sam9x60-usart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: /axi/flexcom@e0044000/serial@200: failed to match any schema with compatible: ['microchip,lan9691-usart', 'atmel,at91sam9260-usart']
   arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: rng@e0048000 (microchip,lan9691-trng): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,lan9691-trng', 'atmel,at91sam9g45-trng'] is too long
   	'microchip,lan9691-trng' is not one of ['atmel,at91sam9g45-trng', 'microchip,sam9x60-trng']
   	'microchip,lan9691-trng' is not one of ['microchip,sama7g5-trng']
   	'microchip,lan9691-trng' is not one of ['microchip,sam9x7-trng', 'microchip,sama7d65-trng']
   	'microchip,sam9x60-trng' was expected
   	from schema $id: http://devicetree.org/schemas/rng/atmel,at91-trng.yaml
   arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: /axi/rng@e0048000: failed to match any schema with compatible: ['microchip,lan9691-trng', 'atmel,at91sam9g45-trng']
>> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: serial@200 (microchip,lan9691-usart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,lan9691-usart', 'atmel,at91sam9260-usart'] is too long
   	['microchip,lan9691-usart', 'atmel,at91sam9260-usart'] is too short
   	'microchip,lan9691-usart' is not one of ['atmel,at91rm9200-usart', 'atmel,at91sam9260-usart']
   	'atmel,at91rm9200-dbgu' was expected
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,lan9691-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart', 'microchip,sama7d65-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected
   	'atmel,at91rm9200-usart' was expected
   	'microchip,sam9x60-usart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: /axi/flexcom@e0060000/serial@200: failed to match any schema with compatible: ['microchip,lan9691-usart', 'atmel,at91sam9260-usart']
>> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: serial@200 (microchip,lan9691-usart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,lan9691-usart', 'atmel,at91sam9260-usart'] is too long
   	['microchip,lan9691-usart', 'atmel,at91sam9260-usart'] is too short
   	'microchip,lan9691-usart' is not one of ['atmel,at91rm9200-usart', 'atmel,at91sam9260-usart']
   	'atmel,at91rm9200-dbgu' was expected
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,lan9691-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart', 'microchip,sama7d65-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected
   	'atmel,at91rm9200-usart' was expected
   	'microchip,sam9x60-usart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml
>> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb: /axi/flexcom@e0064000/serial@200: failed to match any schema with compatible: ['microchip,lan9691-usart', 'atmel,at91sam9260-usart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
