Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234CE15E5B5
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720785685; cv=none; b=PSBOXvmLxzcR5kytkUZDWHWxr3CDJ0fl01iiLsndlKgnTfOrAMNzRkNalADp0HI4jMeGkcbEqy7zVG6wremgPHf8qQsSpYpLIBBbo9Rrwv8/sYlPeq8BMMr/cNAyw3QGzVGN+rDrJHYth/LpVhmru+Hf06jWKl22Dac7rpub+ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720785685; c=relaxed/simple;
	bh=7jTFkeh2/fcxFBJL5V8cezqEEv2kSQDrH/Xh4+y4Mg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=asRpWfbyVlZFnZ6nVMLE9GP+C5wWf5G9nBxqNCJYAKf0KJviGvD1Yasv4QjvFtoyX/MZGFiirC490Hyg2jWBSzBPtDl1m7q3BKjA2U38wsHEmh4Ov3RyeIKzh0FqCn23vU+RCjcJUUy8EMsbMVagBLQwrqzwEn7IbEaLYYw06ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faxGQ7FG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faxGQ7FG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720785684; x=1752321684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7jTFkeh2/fcxFBJL5V8cezqEEv2kSQDrH/Xh4+y4Mg0=;
  b=faxGQ7FG7vrMIg3s2g/cHK1ONs36hcXZiNzg/NMR4yuBbj8qhgjCS5Z1
   h3WVPgNUpAGYYRRHbvzQ1wW+TdqCws9zv3Ya4Q578CeDWcESGb2KXB/gl
   48xnTKrknFSVkDyS9atZvDpyBsQo/Bqay+p4SyQ7oxaLsJjw2e0UWJpSY
   3e3xldXoc2OssqSrOWT5lIu9Y6ok/uEX0p5zgvHUf4qxtckWrwukZ9zy0
   RcLoHxLrHfFrsSmmWEdWfT5ZMSUiOM2OWc3mD8HFhOwOwAYMjdYfB4lrQ
   q/IFsm+ITfVaudiP08h4wKlrsLXMt6gzS0fSqPBTDT3S7fy4E2tdq49n3
   g==;
X-CSE-ConnectionGUID: iuYETcQEQe2bKSt8H45prg==
X-CSE-MsgGUID: xD4b3hYXSAqoCKfJiTkQOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29617032"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="29617032"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 05:01:24 -0700
X-CSE-ConnectionGUID: lQ/BWY3qS4evYn8/UiN7cQ==
X-CSE-MsgGUID: SnX+tfviQB6QC9CwDaPm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="54076249"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jul 2024 05:01:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSExk-000ajQ-19;
	Fri, 12 Jul 2024 12:01:20 +0000
Date: Fri, 12 Jul 2024 20:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-2.0.x-imx 2975/11383]
 arch/mips/boot/dts/ingenic/gcw0.dtb: gpu@13040000: compatible:0:
 'vivante,gc' is not one of ['fsl,imx6q-gpu', 'fsl,imx8-gpu',
 'fsl,imx8-gpu-ss', 'fsl,imx8mm-gpu', 'fsl,imx8mn-gpu', 'fsl,imx8mp-gpu',
 'fsl,imx8mq-gpu', 'fsl,imx8qm-gpu', 'fsl,imx8qxp-gpu', '...
Message-ID: <202407121931.rpOTb19d-lkp@intel.com>
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
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   a9adc0280d6e8fde5718caf259e89692ba67a9ea
commit: 8b209e8532a11e93f1cf1af2324b3b478d28820b [2975/11383] LF-2784-1 dt-bindings: gpu: add gpu compatible
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240712/202407121931.rpOTb19d-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121931.rpOTb19d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407121931.rpOTb19d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10032000: 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10032000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: serial@10033000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,jz4770-uart'] is too short
   	'ingenic,jz4770-uart' is not one of ['ingenic,jz4740-uart', 'ingenic,jz4750-uart', 'ingenic,jz4760-uart', 'ingenic,jz4780-uart', 'ingenic,x1000-uart']
   	'ingenic,jz4725b-uart' was expected
   	'ingenic,jz4755-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml#
>> arch/mips/boot/dts/ingenic/gcw0.dtb: gpu@13040000: compatible:0: 'vivante,gc' is not one of ['fsl,imx6q-gpu', 'fsl,imx8-gpu', 'fsl,imx8-gpu-ss', 'fsl,imx8mm-gpu', 'fsl,imx8mn-gpu', 'fsl,imx8mp-gpu', 'fsl,imx8mq-gpu', 'fsl,imx8qm-gpu', 'fsl,imx8qxp-gpu', 'fsl,ls1028a-gpu']
   	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
>> arch/mips/boot/dts/ingenic/gcw0.dtb: gpu@13040000: compatible: ['vivante,gc'] is too short
   	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: usb@13440000: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ingenic,musb.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: memory@1fc00000: $nodename:0: 'memory@1fc00000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: analog-amplifier@0: 'enable-delay-ms' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-audio-amplifier.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
