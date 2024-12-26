Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D8720EB
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 01:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735176712; cv=none; b=RcIynr+Zw1Hl7cUKfeggkBM4rf89HrOWnQ6L7HtRgLHFFM3CMXs/SFhrjL8xRPWqrvHrUiMuOIsqvq2+3113JYH2jUwTaONEWEcg/mqm1m6JKMsv9mvI2Fon2yCvLUgE5FXVtd2C8JHzvPx9sGp8U2dlUus5EUdKVWaM+6EKyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735176712; c=relaxed/simple;
	bh=ASdkR6/NHAhx2cL7czQHrbD1xAlS6wcQx7MMUol/emM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UWSJIuo3Zpvzg1EfmTsagP11l9ID8nYJJfspWNMxSSDVHP6owtlAtsUDCypvgPtNsDyTGlGBIaUAznWoox3bMHol+xoVovr36LBfO+9crkJNuopmVNEPwCfOgpOy36RJs7OoBX4mf8XGlWJ2ytkheD7d6M4n86k0OSpb+3TLLhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkVeRprY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkVeRprY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735176710; x=1766712710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ASdkR6/NHAhx2cL7czQHrbD1xAlS6wcQx7MMUol/emM=;
  b=RkVeRprYxw0oVTvrEySaABizJLXsTR/h2HyOxg58GtUJOEvo4Mnv3MWU
   BJ4xa2/LuQqE0dShLoUr8M4SPmJ3NsTO2JOGr5R35JwUoaWqBbDOGgs2C
   19gb0NUE/shyuO2QPYlOyeOvLFyB7qmmP3yAz/3Y59UczCoead2UvVNH6
   QhEAkYuXKe+N0xGwjvIfjBrgMYAVVLK79OuqGBzNtj7kiZu09QOkH4wv6
   POEu3/Egm6tKWbGVVgZK0HCo4ItvUD4OZhdKclYvfMXggScpe1RG8Ps/L
   ul4L+L/Fav88Ejz5T2a69o/fokWJ+3awZt2JVEPJrXoKA8QWx5ju2E49H
   g==;
X-CSE-ConnectionGUID: PPuYYCPfRiWkSmU7gXDehg==
X-CSE-MsgGUID: XvCMFGfESt+l6rx+CfSocA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35478792"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35478792"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 17:31:49 -0800
X-CSE-ConnectionGUID: YanYMf0VTpizerVk62gx/Q==
X-CSE-MsgGUID: fNmLpXbmQg+49khAesPCEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="99559145"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Dec 2024 17:31:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQcj4-0002GM-0K;
	Thu, 26 Dec 2024 01:31:46 +0000
Date: Thu, 26 Dec 2024 09:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 1/7] dt-bindings: can: m_can: Add wakeup properties
Message-ID: <202412260921.w4xw4IaN-lkp@intel.com>
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
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-1-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-1-1356c7f7cfda@baylibre.com>
TO: "Markus Schneider-Pargmann" <msp@baylibre.com>
TO: Chandrasekar Ramakrishnan <rcsekar@samsung.com>
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Nishanth Menon <nm@ti.com>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Tero Kristo <kristo@kernel.org>
CC: linux-can@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
CC: Vishal Mahaveer <vishalm@ti.com>
CC: Kevin Hilman <khilman@baylibre.com>
CC: Dhruva Gole <d-gole@ti.com>
CC: Simon Horman <horms@kernel.org>
CC: "Markus Schneider-Pargmann" <msp@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/dt-bindings-can-m_can-Add-wakeup-properties/20241220-040614
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-1-1356c7f7cfda%40baylibre.com
patch subject: [PATCH v6 1/7] dt-bindings: can: m_can: Add wakeup properties
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-053-20241221 (https://download.01.org/0day-ci/archive/20241226/202412260921.w4xw4IaN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260921.w4xw4IaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412260921.w4xw4IaN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: adc@48004000: adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: adc@48003000: adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: can@4400e000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: can@4400e000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: touch@44: touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: can@4400f000: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: can@4400f000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
