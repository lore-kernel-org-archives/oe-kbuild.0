Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B511C57B4
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 21:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723844541; cv=none; b=MVbIwVZC00lxEO2bXJ79Fp6dSYYK9RQjmF13r6ZWzCSt0Zd5l6BndA+K3hCq4WVwOA5gyUb96u2+qfYt9qnOae3u8GsmrvIUcRw0IHtblRIqdPkaSdLpeLifiDuIcO68RDkMecoJB4KrSAJgGfDPA+/kjryIpQ5R07vqR/gSCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723844541; c=relaxed/simple;
	bh=jZIvWfCwAIrBwsifAttyCONvSkVxH9JchDmTqlVvgMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbET3+tp37eDNRkDtn3OtOYN34ZKw89nZC4pLvyIUsY+gXZZ1hjYXvZGGk9XWCLHQRO6nOs/SJzBsYTpOuooREsRn6BQnv0dN4QftNSznxlkmD4NY4c4Fji/3zCTcUEdDGsUjkZmftRzJ6dmfCmWidu4fNooTTYatvfgNizpgwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ynmwjq3a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ynmwjq3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723844539; x=1755380539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jZIvWfCwAIrBwsifAttyCONvSkVxH9JchDmTqlVvgMc=;
  b=Ynmwjq3aGvc/SEVvPqIwjw4y/gicvXtCaNEhqSErKmgTiOZs7cnOreTR
   JNJKbVegVAGHppRKVT+gBG32seeuzcXD6uMQKMycKR/1lqMSnnPUjrhyi
   CcKFMcOYFulB4MhzyPMO0mTtBIOqo1p0u+bJzX0QnWqG9o3T91+7E4lQA
   AP2RprUqsUXk1klIylmzdh2hD2E9aEzOezYmzZPAkcVQc7WD0ggt4hUHJ
   zBUcU7qTIVcK240CdaL+XgBn8ZSAvU6JU/lGHld+M1VsCfHjUiwQW51NP
   /EMVLc04Qekt8n272I6rZcDcXEpkr3oUZyuC4mi1vpDtKA1/Owzm9e7Ui
   w==;
X-CSE-ConnectionGUID: wTUn4Tl2Qx+DTwUbMOV1Bg==
X-CSE-MsgGUID: yNhJMs48Qfq17sMj0MLzZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32786011"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="32786011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 14:42:17 -0700
X-CSE-ConnectionGUID: puqh+votRRaEIdtxP8lpEA==
X-CSE-MsgGUID: 8m5++SaOQmizHsE0WfbuAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59433667"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2024 14:42:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf4i5-0006ww-2l;
	Fri, 16 Aug 2024 21:42:13 +0000
Date: Sat, 17 Aug 2024 05:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 10/17]
 arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: ftm@400b8000: reg:
 [[1074495488, 4096], [1074499584, 4096]] is too long
Message-ID: <202408170516.c84XZ3bp-lkp@intel.com>
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
TO: Animesh Agarwal <animeshagarwal28@gmail.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   d2a97be34548fc5643b4e9536ac8789d839f7374
commit: 8fc30d8f8e86eb4d4909b37d1b114451003dc9cf [10/17] dt-bindings: timer: fsl,ftm-timer: Convert to dtschema
:::::: branch date: 27 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-053-20240814 (https://download.01.org/0day-ci/archive/20240817/202408170516.c84XZ3bp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170516.c84XZ3bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408170516.c84XZ3bp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /soc/bus@40080000/nand@400e0000/nand@0: failed to match any schema with compatible: ['fsl,vf610-nfc-nandcs']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: /vf50-touchscreen: failed to match any schema with compatible: ['toradex,vf50-touchscreen']
   arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
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
>> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40080000/nand@400e0000/nand@0: failed to match any schema with compatible: ['fsl,vf610-nfc-nandcs']
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /spi/gpio@0: failed to match any schema with compatible: ['pisosr-gpio']
--
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: /soc/bus@40080000/nand@400e0000/nand@0: failed to match any schema with compatible: ['fsl,vf610-nfc-nandcs']
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40080000/nand@400e0000/nand@0: failed to match any schema with compatible: ['fsl,vf610-nfc-nandcs']
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: sfp: 'los-gpio', 'tx-disable-gpio' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/sff,sfp.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: io-expander@20: $nodename:0: 'io-expander@20' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/i2c@400e6000/adc@4a: failed to match any schema with compatible: ['adi,adt7411']
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: i2c-mux@70: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: i2c-mux@71: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40080000/ocotp@400a5000: failed to match any schema with compatible: ['fsl,vf610-ocotp', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@400ac000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@400ac000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@400ad000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: spi@400ad000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: ftm@400b8000: reg: [[1074495488, 4096], [1074499584, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/fsl,ftm-timer.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: /soc/bus@40080000/nand@400e0000: failed to match any schema with compatible: ['fsl,vf610-nfc']
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
