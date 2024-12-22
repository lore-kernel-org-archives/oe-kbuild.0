Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08703186616
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734853122; cv=none; b=t3xnp6RMHMYufHemqGyEJBaj+FkwlBaCjPqOkBzeGQJgMFdYlxXoy+RjzeikkCBTXTD1Y9zcN8tSF9mkKsDAnKq9myvWoifFT4zZ+xmXAjeukmtKuzYciRR++GQ5UoicEU5v7LaRwLt3zsGlb05cnSAK3QkfyFn+ckF1USz8jl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734853122; c=relaxed/simple;
	bh=eNMpBnwNWb5HdR2Z/NqhFrhsYBWmPj/zC6vIynLiUMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNcGoIaKnQM51FQLAFvFUeiigi154kyl+JgCRiQRfBpt/aWOylCLYNnTaUfDSFNVu9oTUlr04VRNI1oe0NGVZ7Al2iz4Qrw3f/dfpikiJIAL1ptvVOxahrwVclOTrAxEPpRIVVQZ2Atsl7X6gAdWL442NaHQ3IzSwi8Wp8fjmVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsJ64ZMd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsJ64ZMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734853119; x=1766389119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eNMpBnwNWb5HdR2Z/NqhFrhsYBWmPj/zC6vIynLiUMQ=;
  b=jsJ64ZMdt7yFp2QMl6a3U+WgAeqRI+J30/bESIA8l+U+YcHa+9pHHh3n
   vZkwWNJehBYPL9YuDMmSXQAeSUVENOn71yvlHl7cy7e/okTVl4CMC764c
   TIyCKmzehgG42GThMgqD2ie/HpIIqwZNrcpTCzlpYrOshxPouhJwbOlf2
   1dAY3HNLSEPNuUI1w5puYth6Ht1/g9Eu6YKDXiSIRyjftZXNFH2lTt205
   JHkBM/UmfrFecTOVTwXEcD8GZOMKQ2/VO6UvhqwH0aaDZiTB+oONWbGXg
   s3+X8jWddMu4XWMB2H5eimBf/FUZHuBKUv2KrvrAORmCujD3vkP8UOQDM
   g==;
X-CSE-ConnectionGUID: 34j5WrQhTX2sEk9n/wrpXA==
X-CSE-MsgGUID: pYNmfeq9QP25sJPGwYYwvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="22940007"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="22940007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 23:38:37 -0800
X-CSE-ConnectionGUID: 1CFlNsjIRCqu1vUqf334LA==
X-CSE-MsgGUID: 0dB2IepIRUmjtrg5oU4/pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99135807"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2024 23:38:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPGXq-0002n1-1J;
	Sun, 22 Dec 2024 07:38:34 +0000
Date: Sun, 22 Dec 2024 15:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 6/7] arm64: dts: ti: k3-am62a-mcu: Mark mcu_mcan0/1 as
 wakeup-source
Message-ID: <202412221551.0y2PxoaP-lkp@intel.com>
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
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-6-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-6-1356c7f7cfda@baylibre.com>
TO: "Markus Schneider-Pargmann" <msp@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/dt-bindings-can-m_can-Add-wakeup-properties/20241220-040614
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-6-1356c7f7cfda%40baylibre.com
patch subject: [PATCH v6 6/7] arm64: dts: ti: k3-am62a-mcu: Mark mcu_mcan0/1 as wakeup-source
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241222/202412221551.0y2PxoaP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221551.0y2PxoaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412221551.0y2PxoaP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: camera@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: camera@10: 'VDIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: camera@10: 'VDDL-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
