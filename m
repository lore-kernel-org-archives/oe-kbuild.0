Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120321DFEF
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718621; cv=none; b=mUzBg8peDjpMcC3IuIJlxZry1RLHnrnjBQafC3lIXAyTVTzvG6oYNc2gDmohRfUBdsk8e1fxqHzanhRygZh5UtZWcAbpnhZD05vbycEnUvmYZuSuc7+Ze5iX5K00GZFy/w9VzOFJ/O8kue8HhW0dSLt4lkGizrlqJn4aijr7dMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718621; c=relaxed/simple;
	bh=Ihm8Jk6wc1bdr7cp52sAYbaQqVaEUdcS1xwrUROhI5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F76nztSOOspEwMNyiYJS9lDrohk1FI1cEKL8TjmJHxApaLNhgvgUp4NuXaVvy9q9/EO3w7U48DOftiCqQ5ZhwPKp4U33nwOJTP4mftm7ntJO1zP/af1ej5mpiQS/d2pGF28D+8Hqim2oNvPKuFPFuiCqyqg0HiHr6xhbiRQOfSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTfkCAvw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTfkCAvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718620; x=1765254620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ihm8Jk6wc1bdr7cp52sAYbaQqVaEUdcS1xwrUROhI5M=;
  b=YTfkCAvwlpYpsPUp5EdVmQZ5AyHeIN4ppYdTSPtMdVqoSNkU5ROdPTui
   zQ6l+hMH583lhbMzKTeIh/OXZSUdVT+T87Bhs/4OpMwO276F/ghpxksrm
   TsUzrOpsHi93U1IdpuJrShe/Q5BOg+auQkY0WHz+rplWmL6cYdDX4oPUG
   ecMVVrRpUyp2zcjVKKG8YBL3JVVRJPiqRmvJQ2K9SZbA2sVE3AnOylgsx
   3a9Rqlnv5smLq0sVj7cNOuPmnpoq7qbmJc9GyB834qFgnGb7+HgBA7QvU
   e2/g6Mi0K+pnU0oyFEEyXZjaM1XUS0thvEaNUjwWKg35+mE3dIocXhFPC
   A==;
X-CSE-ConnectionGUID: 8lMMgXbcSIuMMQaS4DmiAQ==
X-CSE-MsgGUID: raD2fTKgSc+C49sFlYrP3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33331739"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33331739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:30:20 -0800
X-CSE-ConnectionGUID: pOU4TWqgSQGf4StdfqgNAQ==
X-CSE-MsgGUID: dGcEmN67TDeK2rUB9FCZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="100009081"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2024 20:30:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVPU-0003rh-05;
	Mon, 09 Dec 2024 04:30:16 +0000
Date: Mon, 9 Dec 2024 12:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: mmc: atmel,hsmci: Convert to json schema
Message-ID: <202412080407.yBNWJmVp-lkp@intel.com>
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
In-Reply-To: <20241205-hsmci-v1-1-5a25e622dfed@microchip.com>
References: <20241205-hsmci-v1-1-5a25e622dfed@microchip.com>
TO: Dharma Balasubiramani <dharma.b@microchip.com>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Nicolas Ferre <nicolas.ferre@microchip.com>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Claudiu Beznea <claudiu.beznea@tuxon.dev>
TO: Aubin Constans <aubin.constans@microchip.com>
CC: linux-mmc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Dharma Balasubiramani <dharma.b@microchip.com>

Hi Dharma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on feffde684ac29a3b7aec82d2df850fbdbdee55e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Dharma-Balasubiramani/dt-bindings-mmc-atmel-hsmci-Convert-to-json-schema/20241205-180956
base:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
patch link:    https://lore.kernel.org/r/20241205-hsmci-v1-1-5a25e622dfed%40microchip.com
patch subject: [PATCH] dt-bindings: mmc: atmel,hsmci: Convert to json schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20241205 (https://download.01.org/0day-ci/archive/20241208/202412080407.yBNWJmVp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080407.yBNWJmVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412080407.yBNWJmVp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'atmel,sama5' was expected
   	'microchip,sama7' was expected
   	'microchip,lan966' was expected
   	'atmel,samv7' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /: failed to match any schema with compatible: ['laird,gatwick', 'laird,wb50n', 'atmel,sama5d31', 'atmel,sama5d3', 'atmel,sama5']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /: failed to match any schema with compatible: ['laird,gatwick', 'laird,wb50n', 'atmel,sama5d31', 'atmel,sama5d3', 'atmel,sama5']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/ssc@f0008000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/isi@f0034000: failed to match any schema with compatible: ['atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/sfr@f0038000: failed to match any schema with compatible: ['atmel,sama5d3-sfr', 'syscon']
>> arch/arm/boot/dts/microchip/at91-gatwick.dtb: mmc@f8000000: 'anyOf' conditional failed, one must be fixed:
   	'slot@0' is a required property
   	'slot@1' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,hsmci.yaml#
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/mmc@f8000000/atheros@0: failed to match any schema with compatible: ['atheros,ath6kl']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/ssc@f800c000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/adc@f8018000: failed to match any schema with compatible: ['atmel,sama5d3-adc']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/hsmc@ffffc000: failed to match any schema with compatible: ['atmel,sama5d3-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/hsmc@ffffc000/ecc-engine@ffffc070: failed to match any schema with compatible: ['atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/dma-controller@ffffe600: failed to match any schema with compatible: ['atmel,at91sam9g45-dma']
   arch/arm/boot/dts/microchip/at91-gatwick.dtb: /ahb/apb/dma-controller@ffffe800: failed to match any schema with compatible: ['atmel,at91sam9g45-dma']
--
   	'atmel,sama5' was expected
   	'atmel,sama5d31' was expected
   	'microchip,sama7' was expected
   	'microchip,lan966' was expected
   	'atmel,samv7' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /: failed to match any schema with compatible: ['laird,wb50n', 'atmel,sama5d31', 'atmel,sama5d3', 'atmel,sama5']
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/ssc@f0008000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/isi@f0034000: failed to match any schema with compatible: ['atmel,at91sam9g45-isi']
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/sfr@f0038000: failed to match any schema with compatible: ['atmel,sama5d3-sfr', 'syscon']
>> arch/arm/boot/dts/microchip/at91-wb50n.dtb: mmc@f8000000: 'anyOf' conditional failed, one must be fixed:
   	'slot@0' is a required property
   	'slot@1' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/atmel,hsmci.yaml#
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/mmc@f8000000/atheros@0: failed to match any schema with compatible: ['atheros,ath6kl']
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/ssc@f800c000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/adc@f8018000: failed to match any schema with compatible: ['atmel,sama5d3-adc']
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/hsmc@ffffc000: failed to match any schema with compatible: ['atmel,sama5d3-smc', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/hsmc@ffffc000/ecc-engine@ffffc070: failed to match any schema with compatible: ['atmel,at91sam9g45-pmecc']
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/dma-controller@ffffe600: failed to match any schema with compatible: ['atmel,at91sam9g45-dma']
   arch/arm/boot/dts/microchip/at91-wb50n.dtb: /ahb/apb/dma-controller@ffffe800: failed to match any schema with compatible: ['atmel,at91sam9g45-dma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
