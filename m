Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1CF12E55
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720390969; cv=none; b=qllnkAETSOZmWM7DgBC2hhPVPTyNOZwzRJp39HSrETJvFQvERxE+P1k548FZef2MZDITwO0a/hdv78TGe4CbCDOPn+8CCVtAEx1wLLnrL/xjg2VHFOGnKrNI8QY4C4s1r61sDslbmaQtWmNyW9EupsK3SC9p4IL+ZknaJaqObo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720390969; c=relaxed/simple;
	bh=jLv0bIwO3mgRSB4AokcHFIStdbPRSgpSyBLohlNoVyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qDZmbv8P4kaa1H99lrH9SOfvtz4Lyy+EEv+ee+knL6kunYkvlZpT7vpN5dhRde8n826P1hqVMgftZAh+PVGsTuDwyPHuwnF8r9MHSaa5PqWXOcYnuT6nyBF/TH3rryVmQrzWnLZebdZW1jejepLxwkSRUcsh3BfbYiRSzxS2AuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBwpW90d; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBwpW90d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720390967; x=1751926967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jLv0bIwO3mgRSB4AokcHFIStdbPRSgpSyBLohlNoVyE=;
  b=lBwpW90djpCSP468gqXznx8U4LmgIfYHL9evLzz/BQIFUTZoE7EwCYCj
   ey9560wJvKgvUpsdpM73DmnY6sH9IEWTFgghqaqI8cuxewITuBXruZNCU
   2o8ubFpVXtjoQNTOTuU34rDGXUzHh6kPi6VCJZNB0tuVwYTjq+3GccI7P
   GIee9Dwqse7+xiTmfTmSaqJypIsieC/m08Li0osVnGnhgWDggKyOtZghS
   wTgAZf1zAIDn3hAxPZNB1guGmGFvVoqJt0fVaUpdIyk9bNBWcmu2TzFgx
   61wcwIDtrxUfegXNeQX9YmTyUQiuVgbTWCgiUSd0Qz1qjVYIFs3uKjYPN
   Q==;
X-CSE-ConnectionGUID: tWDOfy0pQZSo5EkJClA0vA==
X-CSE-MsgGUID: sYOUOGNiTaGtRiF+yNf/hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17538550"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17538550"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 15:22:47 -0700
X-CSE-ConnectionGUID: 1mUagwLWTcmC/mTENHwRUA==
X-CSE-MsgGUID: TOu5mcF1SQuQgNlhobpSGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="78074979"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2024 15:22:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQaHL-000VJn-2t;
	Sun, 07 Jul 2024 22:22:43 +0000
Date: Mon, 8 Jul 2024 06:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/mvme2500.dtb: mram@0,0: $nodename:0:
 'mram@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
Message-ID: <202407080655.yPnzpCOP-lkp@intel.com>
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
TO: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a4bd506ddad75f1f2711cfbcf7551a5504e3f1e
commit: da787688a5a08ece05a2f752d38b281fab8df846 dt-bindings: mtd: Accept nand related node names
date:   1 year, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240708/202407080655.yPnzpCOP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080655.yPnzpCOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407080655.yPnzpCOP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: serial@1,0: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: serial@2,0: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: serial@3,0: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: serial@4,0: Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: mram@0,0: $nodename:0: 'mram@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: mram@0,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everspin,mram', 'mtd-ram'] is too long
   	'everspin,mram' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   	'everspin,mram' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   	'everspin,mram' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	'mtd-ram' is not one of ['cfi-flash', 'jedec-flash']
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /localbus@ffe05000/mram@0,0: failed to match any schema with compatible: ['everspin,mram', 'mtd-ram']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /localbus@ffe05000/board-control@5,0: failed to match any schema with compatible: ['artesyn,mvme2500-fpga']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
