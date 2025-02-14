Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453CC2EF
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 02:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739500386; cv=none; b=VLG8mtxump2njT0nTihCqv82p8wJSz8TvbkudLA80yvd2a1i9FrCh6yXO5iibg2+/Fe00cPdyCjMISQznSyhyxAMVRJasEdWnudLJB74PYTe8rVtb0YN543rPzL14HbPyqp/J9RiG+K4KLf2xO+Yt5qjTAYRFRrQ2M+31qYWgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739500386; c=relaxed/simple;
	bh=LLJM9zPu5Y1We5/HZ7pZSJ5GTFUlTvb2fUL/zo2chPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LiZ7xAXLAqs3568eNjUvLmL0Abh1//mpsYCzpqPfvXk1rFb7QqC4mGUicw8/VCOOsbEkqr6Y1trpm1MVBmZVLvqD+B/15h9HpBC2YK2SbhJlnlO7c5jIVbv9h6c9PBKFj9CFPfx0/ApzOHOOYUlHD44QhI9XHtuxUAyhXU9bf18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQJwvGCI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQJwvGCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739500384; x=1771036384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLJM9zPu5Y1We5/HZ7pZSJ5GTFUlTvb2fUL/zo2chPc=;
  b=WQJwvGCIVHlfV1sNqY3SP11CUFOeaqGXhj66PpO/FKDM5l0rI/QxAM4A
   /rEyl+5VlH7lGULdgrWZzZt/SkatO2zTqt7uEipYp5+JyZJtAIv8lksQI
   SyIvbbWBlsH1ZeFFYydAlp7OGs5a25c5MyLz2yCjyooCTRE5axPg33ow1
   nP9q8Pn2/svvbN8AY879D1JuLg/XBDniyPRZkSjTG0l2vsehxgVsBPshI
   eJS9qRSefmGwvXMgfL5D+1sC+wrd1alZSxvGy+XshaK1k5CyPTZLIZ+Vo
   ru6/I9qXr4+5V6MqbkpA5hnyyqqKT1HSqY/dYg/eNAWX3KfBcPeE92U2C
   w==;
X-CSE-ConnectionGUID: mMGwkzUqQUe2sXboOQmbfw==
X-CSE-MsgGUID: YKxFZXyUQ7S7QdZKFdeO/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43069961"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="43069961"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 18:33:03 -0800
X-CSE-ConnectionGUID: xNh0V5ZsToO2agbtCq6wJA==
X-CSE-MsgGUID: RZviskfqT7WxjivamOtzsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113285376"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Feb 2025 18:33:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tilVk-0018yR-01;
	Fri, 14 Feb 2025 02:33:00 +0000
Date: Fri, 14 Feb 2025 10:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] ARM: dts: microchip: sama7d65: Add flexcom 10 node
Message-ID: <202502141014.IE3EnV0T-lkp@intel.com>
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
In-Reply-To: <20250211143302.4102-2-mihai.sain@microchip.com>
References: <20250211143302.4102-2-mihai.sain@microchip.com>
TO: Mihai Sain <mihai.sain@microchip.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: nicolas.ferre@microchip.com
TO: alexandre.belloni@bootlin.com
TO: claudiu.beznea@tuxon.dev
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Mihai Sain <mihai.sain@microchip.com>

Hi Mihai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on febbc555cf0fff895546ddb8ba2c9a523692fb55]

url:    https://github.com/intel-lab-lkp/linux/commits/Mihai-Sain/ARM-dts-microchip-sama7d65-Add-flexcom-10-node/20250211-223701
base:   febbc555cf0fff895546ddb8ba2c9a523692fb55
patch link:    https://lore.kernel.org/r/20250211143302.4102-2-mihai.sain%40microchip.com
patch subject: [PATCH 1/2] ARM: dts: microchip: sama7d65: Add flexcom 10 node
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250213 (https://download.01.org/0day-ci/archive/20250214/202502141014.IE3EnV0T-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141014.IE3EnV0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502141014.IE3EnV0T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,sama7d65-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected
   	'atmel,at91rm9200-usart' was expected
   	'microchip,sam9x60-usart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: serial@200: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/flexcom@e2020000/serial@200: failed to match any schema with compatible: ['microchip,sama7d65-usart', 'atmel,at91sam9260-usart']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e2824000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom'] is too long
   	'atmel,sama5d2-flexcom' was expected
   	'microchip,sam9x7-flexcom' was expected
   	'microchip,sama7g5-flexcom' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/flexcom@e2824000: failed to match any schema with compatible: ['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
