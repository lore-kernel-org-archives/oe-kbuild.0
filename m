Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6513513FD8C
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720451434; cv=none; b=QnlJWA6awXfEKaAGOq2Qzj4zIT8QNVGS4Jms/k67GYDMjO449SB+mAtC8fti3ZyzKI9+UEAlGKs5KjIALVFt0CqrDkRJ60mTvFwL4BY5z+YraRrG5tKW3DYAQmL2nYrTO6iS/mPJcO3chSPksohXORQBgaI5x4IzcJT4qaLkIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720451434; c=relaxed/simple;
	bh=NfwF9irGsGAS8zoj022CWJhp69Jbn2r+2JF/NsFWSYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bxKvMkWs4Sufr9aMvBJl4S8o2S7ZZDfYrWP+z4hV/qr+EohkmUW6BYwFLJoraP38U76bqRZsfp11+gXb9OAkwGKNz6O6QoVBTyygnqaVjlvzMkSgF2rbICfBWAol4EP3wb6yOJIUv7jIFTb4hfnjCFRnHUvg+FcW9EalrRitZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/nO+FDM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/nO+FDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720451430; x=1751987430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfwF9irGsGAS8zoj022CWJhp69Jbn2r+2JF/NsFWSYg=;
  b=N/nO+FDM97G8Z+JJkIPiQ1oG42fm5Iw+QK3lJNX5Uzo7e/xnkaK4xIfm
   QL6RaG2jY1f55ZuquJzT7efL4xQTQBgmKoy6Kh2FxU0bx7Qa2Y+hXP+hS
   jn7TFq75kW7LJEikib44CESzKu3u9Vrki0aWX5QU7lUkQ1oc0twqA2obz
   j2rpoZsSddXiq8JizVQj8JNh9unF/ZTl+HT+wNXY0PnkPWNtLX08nPLt+
   OfowPgf5CwGGm9TybVxLKp8lQnX5jsleh8O7zUOTPsDcV2tnOD3zb3jK+
   jyieaN5ic9QtOqNerokBdUJAFKYUCAZBrpz89yGD61hNg7t64NrBf+lV0
   w==;
X-CSE-ConnectionGUID: /lFNJe5aQu2SPhsqChpsYA==
X-CSE-MsgGUID: RvzZ/UoQST6D/3K7ciR3Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17366567"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="17366567"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 08:10:28 -0700
X-CSE-ConnectionGUID: x6031NPSRkG2mRkGViwY6w==
X-CSE-MsgGUID: 3MR8mmwTSTC9Y6qiC8eriA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="85080296"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jul 2024 08:10:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQq0V-000Voc-37;
	Mon, 08 Jul 2024 15:10:23 +0000
Date: Mon, 8 Jul 2024 23:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:fileWXVuyz 20/21]
 arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@4002c000:
 dma-names:0: 'tx' was expected
Message-ID: <202407082340.XiMGNMqK-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vladimir Oltean <olteanv@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileWXVuyz
head:   0f17a12787573dda66d2528fff27cd7362b34bfd
commit: 2de9ae2044c4f6490dbbfb8d93fe6b8cc60c91d1 [20/21] spi: dt-bindings: fsl-dspi: add dmas and dma-names properties
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240708/202407082340.XiMGNMqK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407082340.XiMGNMqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407082340.XiMGNMqK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@4002d000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/spi@4002d000/can@0: failed to match any schema with compatible: ['microchip,mcp2515']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40080000/nand@400e0000/nand@0: failed to match any schema with compatible: ['fsl,vf610-nfc-nandcs']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /vf50-touchscreen: failed to match any schema with compatible: ['toradex,vf50-touchscreen']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: panel: 'power-supply' is a required property
--
   arch/arm/boot/dts/nxp/vf/vfxxx.dtsi:538.24-550.6: Warning (avoid_unnecessary_addr_size): /soc/bus@40080000/spi@400ad000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@4002c000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spidev0@0: $nodename:0: '/' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spidev0@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['lwn,bk4'] is too short
   	arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spidev0@0: compatible: 'oneOf' conditional failed, one must be fixed:
   		['lwn,bk4'] is too short
   		'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   	'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
--
   	'lwn,bk4' is not one of ['fsl,ls2088a-qds', 'fsl,ls2088a-rdb']
   	'lwn,bk4' is not one of ['fsl,lx2160a-bluebox3', 'fsl,lx2160a-bluebox3-rev-a', 'fsl,lx2160a-qds', 'fsl,lx2160a-rdb', 'fsl,lx2162a-qds']
   	'lwn,bk4' is not one of ['solidrun,clearfog-cx', 'solidrun,honeycomb']
   	'lwn,bk4' is not one of ['solidrun,lx2162a-clearfog']
   	'lwn,bk4' is not one of ['tq,lx2160a-tqmlx2160a-mblx2160a']
   	'lwn,bk4' is not one of ['nxp,s32g274a-evb', 'nxp,s32g274a-rdb2']
   	'lwn,bk4' is not one of ['nxp,s32g399a-rdb3']
   	'lwn,bk4' is not one of ['fsl,s32v234-evb']
   	'lwn,bk4' is not one of ['traverse,ten64']
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: spi@400ad000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: slave: $nodename:0: '/' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: slave: compatible: 'oneOf' conditional failed, one must be fixed:
   	['lwn,bk4'] is too short
   	arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: slave: compatible: 'oneOf' conditional failed, one must be fixed:
   		['lwn,bk4'] is too short
   		'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   	'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
--
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@4002d000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/spi@4002d000/can@0: failed to match any schema with compatible: ['microchip,mcp2515']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40080000/nand@400e0000/nand@0: failed to match any schema with compatible: ['fsl,vf610-nfc-nandcs']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /interrupt-controller@e000e100: failed to match any schema with compatible: ['arm,armv7m-nvic']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /interrupt-controller@e000e100: failed to match any schema with compatible: ['arm,armv7m-nvic']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@4002c000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0: failed to match any schema with compatible: ['atmel,at26df081a']
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40080000/nand@400e0000/nand@0: failed to match any schema with compatible: ['fsl,vf610-nfc-nandcs']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/i2c@40067000/watchdog@38: failed to match any schema with compatible: ['zii,rave-wdt']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: sfp: 'los-gpio', 'tx-disable-gpio' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/sff,sfp.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: iomuxc@40048000: i2c0grp-gpio: {'fsl,pins': [[144, 0, 0, 0, 12738, 148, 0, 0, 0, 12738]], 'phandle': [[19]]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@4002c000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: atzb-rf-233@1: xtal-trim: b'\x06' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/spi@4002c000/atzb-rf-233@1: failed to match any schema with compatible: ['atmel,at86rf233']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: iomuxc@40048000: i2c0grp-gpio: {'fsl,pins': [[144, 0, 0, 0, 12738, 148, 0, 0, 0, 12738]], 'phandle': [[25]]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@40049000: 'eth0_intrp' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: eth0_intrp: $nodename:0: 'eth0_intrp' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: sx1503@20: $nodename:0: 'sx1503@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@4002c000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@4002d000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/i2c@40067000/watchdog@38: failed to match any schema with compatible: ['zii,rave-wdt']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/i2c@40067000/adc@4a: failed to match any schema with compatible: ['adi,adt7411']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: io-expander@20: $nodename:0: 'io-expander@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/i2c@400e6000/adc@4a: failed to match any schema with compatible: ['adi,adt7411']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: i2c-mux@70: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: i2c-mux@71: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/serial@40029000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/serial@40029000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/serial@40029000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@4002d000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/i2c@40067000/watchdog@38: failed to match any schema with compatible: ['zii,rave-wdt']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/cpucfg@40001000: failed to match any schema with compatible: ['fsl,vf610-mscm-cpucfg', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/interrupt-controller@40001800: failed to match any schema with compatible: ['fsl,vf610-mscm-ir']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/serial@40028000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/serial@40028000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/serial@40028000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@4002c000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@4002c000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@4002d000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@4002d000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/pwm@40038000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/pwm@40039000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/timing-controller@4003d000: failed to match any schema with compatible: ['fsl,vf610-tcon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/anatop@40050000: failed to match any schema with compatible: ['fsl,vf610-anatop', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/dcu@40058000: failed to match any schema with compatible: ['fsl,vf610-dcu']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/i2c@40067000/watchdog@38: failed to match any schema with compatible: ['zii,rave-wdt']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/ccm@4006b000: failed to match any schema with compatible: ['fsl,vf610-ccm']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40080000/ftm@400b8000: failed to match any schema with compatible: ['fsl,ftm-timer']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
