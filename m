Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5CE1EBFEB
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733230197; cv=none; b=P87G1L39RtdFFSxpJ9hmA+oZVTk1XSzXizUt8WGUD/wPoo/ZRtuT2Cr3ZLhcYUzfDDdzcb+ZPKuTaBBmFUH/jHXvXhSEA0uUhjtbk6+eqhXOo31yI7hnSfoaln2Av9ZQpXhGNhwkpNSx/AjbM2qrlCwFhiiNWJzwKbYTojVHYXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733230197; c=relaxed/simple;
	bh=xsj8zjCyyWvLqQrZju/we/mx8eApZviY4V93872nVpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZuLxdiQlppHDdeSEIGGDUcumsVPIVcuARg7ICqUznLDtWIC3Fq+RMLpA88kfRfS1rortwE6szbD5Iu9CDB1tBe5VmfZEbCQ8ID9mZiAbhAnk4aDUiqEcIIh3/d9uyjancB3icSt0RsyC/z7bp4Hyg3ndqHA6h37v+9YixATGS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxifNmIV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxifNmIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733230195; x=1764766195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsj8zjCyyWvLqQrZju/we/mx8eApZviY4V93872nVpo=;
  b=IxifNmIVmk6V7I+b6hZLgDP/pRn03msAv27yCYe4WcGLdeKEeqpDHq4u
   1y8hSARGmjmwd+ZtAg1ciTKXf8jwXeoRVju9hf8ZVLNLSw63h+EP9ZmRy
   +1hz8Hj0907vG7bxrJjdyldJhik+/OJjqzpOZVHxQSyJNLn1xAZoKaPQ+
   C4tzA+4tU/6LJfmCJOujd35iPRAkyn9Cb/41xq5eledzytgnMmdccm2Xy
   fxvzclyA1r2gYV5lz72iG6JUSSl3xIgiz9pBhpP+TVNHuTiyz32MQmvjF
   0MJlOy/CIQBDRYMrM+aIcOWrh49x2fo8aZmaWUhO/tbZz9qTe4JtDH974
   A==;
X-CSE-ConnectionGUID: xAPPLcwsT6CneNLM9wZ5lA==
X-CSE-MsgGUID: nnCaMA+1Qaiy/m9n4u1nFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32798039"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="32798039"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 04:49:52 -0800
X-CSE-ConnectionGUID: 2DpF4jaZQDuq8D28GLi1ig==
X-CSE-MsgGUID: PWkj4DS3QNaTyTFX0Zi0qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="98511199"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Dec 2024 04:49:51 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tISLd-0000fs-0l;
	Tue, 03 Dec 2024 12:49:49 +0000
Date: Tue, 3 Dec 2024 20:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ralink/vocore2.dtb: /reset-controller: failed to
 match any schema with compatible: ['ralink,rt2880-reset']
Message-ID: <202412032026.ZXEbTvKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: ef8795f3f1cef2b2d2cd5dfab3758a7601898bc9 dt-bindings: kbuild: Use DTB files for validation
date:   2 years, 9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 2 years, 9 months ago
config: mips-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241203/202412032026.ZXEbTvKJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412032026.ZXEbTvKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412032026.ZXEbTvKJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ralink/vocore2.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mti,mips24KEc']
>> arch/mips/boot/dts/ralink/vocore2.dtb: /reset-controller: failed to match any schema with compatible: ['ralink,rt2880-reset']
   arch/mips/boot/dts/ralink/vocore2.dtb: /interrupt-controller: failed to match any schema with compatible: ['mti,cpu-interrupt-controller']
>> arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/system-controller@0: failed to match any schema with compatible: ['ralink,mt7620a-sysc', 'syscon']
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/pinmux@60: failed to match any schema with compatible: ['pinctrl-single']
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/watchdog@100: failed to match any schema with compatible: ['mediatek,mt7621-wdt']
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/interrupt-controller@200: failed to match any schema with compatible: ['ralink,rt2880-intc']
>> arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/memory-controller@300: failed to match any schema with compatible: ['ralink,mt7620a-memc']
>> arch/mips/boot/dts/ralink/vocore2.dtb: gpio@600: 'gpio-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/mediatek,mt7621-gpio.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/spi@b00: failed to match any schema with compatible: ['ralink,mt7621-spi']
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/i2c@900: failed to match any schema with compatible: ['mediatek,mt7621-i2c']
>> arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00: $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/vocore2.dtb: uart1@d00: $nodename:0: 'uart1@d00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/vocore2.dtb: uart1@d00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/vocore2.dtb: uart2@e00: $nodename:0: 'uart2@e00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/vocore2.dtb: uart2@e00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: /usb-phy@10120000: failed to match any schema with compatible: ['mediatek,mt7628-usbphy']
--
>> arch/mips/boot/dts/ralink/omega2p.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['onion,omega2+', 'ralink,mt7688a-soc', 'ralink,mt7628a-soc'] is too long
   	'onion,omega2+' is not one of ['ralink,rt2880-eval-board']
   	'ralink,rt3050-soc' was expected
   	'onion,omega2+' is not one of ['ralink,rt3052-eval-board']
   	'ralink,rt3350-soc' was expected
   	'ralink,rt3352-soc' was expected
   	'onion,omega2+' is not one of ['ralink,rt3883-eval-board']
   	'ralink,rt5350-soc' was expected
   	'onion,omega2+' is not one of ['ralink,mt7620a-eval-board']
   	'ralink,mt7620n-soc' was expected
   	'onion,omega2+' is not one of ['gnubee,gb-pc1', 'gnubee,gb-pc2']
   	'ralink,rt2880-soc' was expected
   	'ralink,rt3052-soc' was expected
   	'ralink,rt3383-soc' was expected
   	'ralink,mt7620a-soc' was expected
   	'ralink,mt7628a-soc' was expected
   	'mediatek,mt7621-soc' was expected
   	from schema $id: http://devicetree.org/schemas/mips/ralink.yaml#
>> arch/mips/boot/dts/ralink/omega2p.dtb: /: failed to match any schema with compatible: ['onion,omega2+', 'ralink,mt7688a-soc', 'ralink,mt7628a-soc']
   arch/mips/boot/dts/ralink/omega2p.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mti,mips24KEc']
>> arch/mips/boot/dts/ralink/omega2p.dtb: /reset-controller: failed to match any schema with compatible: ['ralink,rt2880-reset']
   arch/mips/boot/dts/ralink/omega2p.dtb: /interrupt-controller: failed to match any schema with compatible: ['mti,cpu-interrupt-controller']
>> arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/system-controller@0: failed to match any schema with compatible: ['ralink,mt7620a-sysc', 'syscon']
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/pinmux@60: failed to match any schema with compatible: ['pinctrl-single']
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/watchdog@100: failed to match any schema with compatible: ['mediatek,mt7621-wdt']
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/interrupt-controller@200: failed to match any schema with compatible: ['ralink,rt2880-intc']
>> arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/memory-controller@300: failed to match any schema with compatible: ['ralink,mt7620a-memc']
>> arch/mips/boot/dts/ralink/omega2p.dtb: gpio@600: 'gpio-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/mediatek,mt7621-gpio.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/spi@b00: failed to match any schema with compatible: ['ralink,mt7621-spi']
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/i2c@900: failed to match any schema with compatible: ['mediatek,mt7621-i2c']
>> arch/mips/boot/dts/ralink/omega2p.dtb: uartlite@c00: $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/omega2p.dtb: uartlite@c00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/omega2p.dtb: uart1@d00: $nodename:0: 'uart1@d00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/omega2p.dtb: uart1@d00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/omega2p.dtb: uart2@e00: $nodename:0: 'uart2@e00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/omega2p.dtb: uart2@e00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: /usb-phy@10120000: failed to match any schema with compatible: ['mediatek,mt7628-usbphy']
--
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mips,mips24KEc']
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /cpuintc: failed to match any schema with compatible: ['mti,cpu-interrupt-controller']
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /palmbus@10000000/sysc@0: failed to match any schema with compatible: ['ralink,rt3052-sysc', 'ralink,rt3050-sysc']
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /palmbus@10000000/sysc@0: failed to match any schema with compatible: ['ralink,rt3052-sysc', 'ralink,rt3050-sysc']
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: /palmbus@10000000/intc@200: failed to match any schema with compatible: ['ralink,rt3052-intc', 'ralink,rt2880-intc']
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: /palmbus@10000000/intc@200: failed to match any schema with compatible: ['ralink,rt3052-intc', 'ralink,rt2880-intc']
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: /palmbus@10000000/memc@300: failed to match any schema with compatible: ['ralink,rt3052-memc', 'ralink,rt3050-memc']
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: /palmbus@10000000/memc@300: failed to match any schema with compatible: ['ralink,rt3052-memc', 'ralink,rt3050-memc']
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: uartlite@c00: $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: uartlite@c00: 'anyOf' conditional failed, one must be fixed:
   	'clock-frequency' is a required property
   	'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ralink,rt3050-usb', 'snps,dwc2'] is too long
   	['ralink,rt3050-usb', 'snps,dwc2'] is too short
   	'brcm,bcm2835-usb' was expected
   	'hisilicon,hi6220-usb' was expected
   	'rockchip,rk3066-usb' was expected
   	'ralink,rt3050-usb' is not one of ['rockchip,px30-usb', 'rockchip,rk3036-usb', 'rockchip,rk3188-usb', 'rockchip,rk3228-usb', 'rockchip,rk3288-usb', 'rockchip,rk3308-usb', 'rockchip,rk3328-usb', 'rockchip,rk3368-usb', 'rockchip,rv1108-usb']
   	'lantiq,arx100-usb' was expected
   	'lantiq,xrx200-usb' was expected
   	'ralink,rt3050-usb' is not one of ['amlogic,meson8-usb', 'amlogic,meson8b-usb', 'amlogic,meson-gxbb-usb', 'amlogic,meson-g12a-usb']
   	'amcc,dwc-otg' was expected
   	'apm,apm82181-dwc-otg' was expected
   	'snps,dwc2' was expected
   	'st,stm32f4x9-fsotg' was expected
   	'st,stm32f4x9-hsotg' was expected
   	'st,stm32f7-hsotg' was expected
   	'st,stm32mp15-fsotg' was expected
   	'st,stm32mp15-hsotg' was expected
   	'samsung,s3c6400-hsotg' was expected
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: /usb@101c0000: failed to match any schema with compatible: ['ralink,rt3050-usb', 'snps,dwc2']
--
>> arch/mips/boot/dts/ralink/rt2880_eval.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/mips/boot/dts/ralink/rt2880_eval.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/mips/boot/dts/ralink/rt2880_eval.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mips,mips4KEc']
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: /cpuintc: failed to match any schema with compatible: ['mti,cpu-interrupt-controller']
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: /palmbus@300000/sysc@0: failed to match any schema with compatible: ['ralink,rt2880-sysc']
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: /palmbus@300000/intc@200: failed to match any schema with compatible: ['ralink,rt2880-intc']
>> arch/mips/boot/dts/ralink/rt2880_eval.dtb: /palmbus@300000/memc@300: failed to match any schema with compatible: ['ralink,rt2880-memc']
>> arch/mips/boot/dts/ralink/rt2880_eval.dtb: uartlite@c00: $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/rt2880_eval.dtb: uartlite@c00: 'anyOf' conditional failed, one must be fixed:
   	'clock-frequency' is a required property
   	'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
--
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/ralink/mt7620a_eval.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mips,mips24KEc']
   arch/mips/boot/dts/ralink/mt7620a_eval.dtb: /cpuintc: failed to match any schema with compatible: ['mti,cpu-interrupt-controller']
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: /palmbus@10000000/sysc@0: failed to match any schema with compatible: ['ralink,mt7620a-sysc']
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: /palmbus@10000000/intc@200: failed to match any schema with compatible: ['ralink,mt7620a-intc', 'ralink,rt2880-intc']
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: /palmbus@10000000/intc@200: failed to match any schema with compatible: ['ralink,mt7620a-intc', 'ralink,rt2880-intc']
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: /palmbus@10000000/memc@300: failed to match any schema with compatible: ['ralink,mt7620a-memc', 'ralink,rt3050-memc']
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: /palmbus@10000000/memc@300: failed to match any schema with compatible: ['ralink,mt7620a-memc', 'ralink,rt3050-memc']
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: uartlite@c00: $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/mt7620a_eval.dtb: uartlite@c00: 'anyOf' conditional failed, one must be fixed:
   	'clock-frequency' is a required property
   	'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
