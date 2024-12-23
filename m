Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8902928DA1
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Dec 2024 19:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734982558; cv=none; b=NFkd0pKtJOPI5NpvTBrhRJKIHEtjeZWZopJn21Pkcv9IlfAkjDss1wIdYk6VfvTWsMBRxX/ZBzBofnGlASso7IRl829vqKNxCl51k9Tdfm/hHDIRXo3UetyP2O1JTSVVMcBvogi4V3n6zuzLfrPtJI72U/XEIh9y4GvzmRKWX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734982558; c=relaxed/simple;
	bh=4t0d5GymQ8qgoTFg1JSE0PxWsekDTHa+G0qm0r+Vzls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpAWTVYPVERBCo4mYMWxXrkrayfXuKZzbdNVc8IjrOHaYM082KC6n9To/LSbkfmXc0SnqkADoSM0nl2as7XhV3Q10qGKDP1J5O/9UVAAD8XYD5Z1Rc+H1SOgRcjFuTZ98n+tk0gcj7KFdd7jk4ahhHr+uyyMeLdLYMbtKI24VNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaPi5VMk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaPi5VMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734982557; x=1766518557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4t0d5GymQ8qgoTFg1JSE0PxWsekDTHa+G0qm0r+Vzls=;
  b=HaPi5VMk904cBxrSdlJKeZlyW9fxT2KGwwNrfJRs4l7n9/NdNWGYdnnp
   9OhtRE7I8uBW9Hs7+8UeOMnRS7oiFPHPAS/zjZB5IEIbDqU8/070sezG3
   MAdErjdtCSJbIhEtJD/f00THbx025/Lz/PUMDK8hB1Xis0C5D6kXyfaYx
   t9eltnulJA5vpCJKXAnTPBOWy6RslVOwIbS/QR7IRHUZ7ads8DkC/J9q1
   DIWphzGEXFP5eglQvVW8kD6+bf2CmP1/9TDktiaXzVQARwvzRuypkOh90
   7SQlr6A3JuYAucnRGf+rR6RsePvwFwst8nckJRRPLAMXT1IPXu4whwMRh
   Q==;
X-CSE-ConnectionGUID: gqPX33NRRvKuHDb/xBHYdQ==
X-CSE-MsgGUID: OnTjR9uRSi+QkfAiFz6sGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="45946830"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="45946830"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 11:35:56 -0800
X-CSE-ConnectionGUID: FGHAt0ttRFWfe5x2n6RCTw==
X-CSE-MsgGUID: hZs9xb01RnigeioQSyJcAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="99111108"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Dec 2024 11:35:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPoDY-0000a1-1m;
	Mon, 23 Dec 2024 19:35:52 +0000
Date: Tue, 24 Dec 2024 03:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 1/7] dt-bindings: can: m_can: Add wakeup properties
Message-ID: <202412240345.4b089L8w-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-053-20241221 (https://download.01.org/0day-ci/archive/20241224/202412240345.4b089L8w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240345.4b089L8w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412240345.4b089L8w-lkp@intel.com/

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
