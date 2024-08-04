Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A4AD59
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 21:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722805829; cv=none; b=NLvXiaAyzSDy9ZinmCBw06vsbqiQXn07HgwPPsOmqcloqTH1yiSXGXhgZ2nkdUkGX/DJFiWTtzTEEMJW+bhOIJcl1FfZwEZxcwVnNYMyFbZm+pGi54lJK9OQfDmlux4MdivPgZjdik/ZvpoC/T7SFk+m5+deTe3nwcO48gfFe9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722805829; c=relaxed/simple;
	bh=Nv0QsiaJQdejyBP46q6OlKslJ5LrZjQ+gxxhMGhHSnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Do5quCNm3NdLMh85tBknazHEB21b/GDUn+GxHYEwJl8wQK9Due0O3h5jNzyk1vNNi13sm7FcNClGIbUPFnEI6A+l20KiZgIUivrPJcz0belcWN3Dlqyg68/Pxsdxw2OuEVs1MhAtv64Ht13xU/lJBTaaAXLsDNj27lAEyGaYFho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4pURE4s; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4pURE4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722805827; x=1754341827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nv0QsiaJQdejyBP46q6OlKslJ5LrZjQ+gxxhMGhHSnE=;
  b=Z4pURE4saEE64dvm+iUWcbce3QtivTUgwkn6NErLJfv+clpJYeaehK2N
   yKpWwHSsOI5gy5S+XIIbupw2trkw3HU0pGKREs9AwipPAQJS3zB2qbk8v
   RsYOdt9HAc5r8clPxUWgR141ZDKhk7+zaQWQpb4kQ0QBXQCON6PeR0x+k
   znLbNJI7pK+g7LQB/ARyimv7m2ZcEfMXzFOkqvE/SsHw/y2x4sTrePGkv
   PsxMY7eTldGBlu1UPMr28ZrPUaq2WA2ZahPQ+BeBB86czF2Jzig8YqeFq
   VWrcahEye+ZnUcByxvxv6MO9O7Ywhj2CgGeb9xcmQAsaYQv7Sm3rd9W/P
   Q==;
X-CSE-ConnectionGUID: 9/NJZigXSkK9aKaDeQjAeg==
X-CSE-MsgGUID: PNH+zAAWSvi0z7SslZ5F9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20919784"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="20919784"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 14:10:27 -0700
X-CSE-ConnectionGUID: TWWd/rQMTTm0PT8y7pbF7g==
X-CSE-MsgGUID: SWrVjXOjTfa5yF5j9CLQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="60800421"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2024 14:10:25 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saiUh-0001bs-0u;
	Sun, 04 Aug 2024 21:10:23 +0000
Date: Mon, 5 Aug 2024 05:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hverkuil-media-tree:hdmi-dbg 13/16]
 arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: ds1307@68: $nodename:0:
 'ds1307@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202408050511.zmkJjHcr-lkp@intel.com>
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
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   fb9bd29c9b3fa46c8397ce10dbde59ef09b127b7
commit: 78e065c6e2a57012bcdd1a41be1c8e16ac8d36ce [13/16] bcm2711-rpi-4-b.dts: adjust for HDMI debug shield
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20240803 (https://download.01.org/0day-ci/archive/20240805/202408050511.zmkJjHcr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050511.zmkJjHcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408050511.zmkJjHcr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: soc: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/timer@7e003000: failed to match any schema with compatible: ['brcm,bcm2835-system-timer']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/cprman@7e101000: failed to match any schema with compatible: ['brcm,bcm2711-cprman']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/gpio@7e200000: failed to match any schema with compatible: ['brcm,bcm2711-gpio']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/aux@7e215000: failed to match any schema with compatible: ['brcm,bcm2835-aux']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/spi@7e215080: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/spi@7e2150c0: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: ds1307@68: $nodename:0: 'ds1307@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/rtc-ds1307.yaml#
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/i2c@7e804000/pca9685@40: failed to match any schema with compatible: ['nxp,pca9685-pwm']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/interrupt-controller@40000000: failed to match any schema with compatible: ['brcm,bcm2836-l1-intc']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/avs-monitor@7d5d2000: failed to match any schema with compatible: ['brcm,bcm2711-avs-monitor', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: emmc2bus: $nodename:0: 'emmc2bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: scb: $nodename:0: 'scb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: cec-gpio-to-source: $nodename:0: 'cec-gpio-to-source' does not match '^cec(@[0-9a-f]+|-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/media/cec/cec-gpio.yaml#
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: cec-gpio-to-sink: $nodename:0: 'cec-gpio-to-sink' does not match '^cec(@[0-9a-f]+|-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/media/cec/cec-gpio.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: soc: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/timer@7e003000: failed to match any schema with compatible: ['brcm,bcm2835-system-timer']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/cprman@7e101000: failed to match any schema with compatible: ['brcm,bcm2711-cprman']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/gpio@7e200000: failed to match any schema with compatible: ['brcm,bcm2711-gpio']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/aux@7e215000: failed to match any schema with compatible: ['brcm,bcm2835-aux']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/spi@7e215080: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/spi@7e2150c0: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: ds1307@68: $nodename:0: 'ds1307@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/rtc-ds1307.yaml#
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/i2c@7e804000/pca9685@40: failed to match any schema with compatible: ['nxp,pca9685-pwm']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/interrupt-controller@40000000: failed to match any schema with compatible: ['brcm,bcm2836-l1-intc']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/avs-monitor@7d5d2000: failed to match any schema with compatible: ['brcm,bcm2711-avs-monitor', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: emmc2bus: $nodename:0: 'emmc2bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: scb: $nodename:0: 'scb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: cec-gpio-to-source: $nodename:0: 'cec-gpio-to-source' does not match '^cec(@[0-9a-f]+|-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/media/cec/cec-gpio.yaml#
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: cec-gpio-to-sink: $nodename:0: 'cec-gpio-to-sink' does not match '^cec(@[0-9a-f]+|-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/media/cec/cec-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
