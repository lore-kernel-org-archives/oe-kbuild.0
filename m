Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A14487BE
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661880; cv=none; b=ZFyOVh4obxFu8Dd6eXvZvC8wjSU/NBGooF1Ml4PBgk0mM5znl7KWo9Pa3sN8AB4i2B72QQDdHr8q/a5zli28v7K7WTl4HnUsvdfkO3U3m0ohgVj3AK+ZfT5sI9AZL7zKH8mafdJwm69U9on6z01E/W2Tc6PGuaOTzT0J033iMB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661880; c=relaxed/simple;
	bh=wLwYOfsTp/Wb2re85kQvH3N/emrlIJHQ3lfUhGfnHnA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uTXfn2bPXgrour2wFBVHfjtrgaX7ZoTQepKuojq7DgMxrOMDcaoWUeTWR1X8wpaPg1hS3ee04SkQtMvdskiTRenbGY96DRrxyRejb3F4yjJtd5TNJYxTTk6eeZtTh9yRhSad+D4XEefr2c0YEIqA+aLbOuyQuXHQMmuW9bj1alQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jC/FHaSm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jC/FHaSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779661874; x=1811197874;
  h=date:from:to:cc:subject:message-id;
  bh=wLwYOfsTp/Wb2re85kQvH3N/emrlIJHQ3lfUhGfnHnA=;
  b=jC/FHaSmU1YijT9oihcGxVGAoiIdjwpySXGlSDMWBTFC0b5x7fbqss1L
   690SEV+p1WQsowGihUBDyergsxoxaCl1rVnXxuWEq+Y4N9xX6Mxq/+r+z
   WYtSgScrK+EFOL7QF1wKaCO98qFiOp+KlLrG46CvYiVJLit334asProwM
   UJQEQPinuwT6gDtAzUEzkfDAJIJwUP+/bmbh9OIbkncIs0OlfODEToh+O
   hjY/vmLL3paBWficGmLfKXHlhhqVSiDuBbkjtZ+P9FeErVb7uNzUd7Vnr
   Hz8q0lyOt9hUuVSFfV5TkY7TfU2U6ZdIn+3apIE4RN38C0lzp4kltvnuc
   A==;
X-CSE-ConnectionGUID: oD+7mUw0QxiVheb+vWZEoA==
X-CSE-MsgGUID: rOxle2Y3R/qLpmtti6/PCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="83068853"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="83068853"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 15:31:13 -0700
X-CSE-ConnectionGUID: dbS8lSwbT5KYEfkknj/mEw==
X-CSE-MsgGUID: 707KO3GCSL2lxnZNyx4gEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="279546806"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 24 May 2026 15:31:11 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRHLg-00000000C4D-2vb2;
	Sun, 24 May 2026 22:31:08 +0000
Date: Mon, 25 May 2026 00:30:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/akebono.dtb: interrupt-controller
 (chrp,open-pic): '#size-cells', 'dcr-reg' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605250034.0fRVqF4o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cbfe4502e3d4bda48eb4b83dfad8d7da3b22e90
commit: 326d2519811200da0e301dce3e93389dadd197a4 dt-bindings: powerpc: Drop duplicate fsl/mpic.txt
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-2051-20260521 (https://download.01.org/0day-ci/archive/20260525/202605250034.0fRVqF4o-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605250034.0fRVqF4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 326d25198112 ("dt-bindings: powerpc: Drop duplicate fsl/mpic.txt")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605250034.0fRVqF4o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/akebono.dts:63.9-66.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/akebono.dts:157.13-249.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/akebono.dtb: /: failed to match any schema with compatible: ['ibm,akebono', 'ibm,476gtr']
   arch/powerpc/boot/dts/akebono.dtb: /: failed to match any schema with compatible: ['ibm,akebono', 'ibm,476gtr']
   arch/powerpc/boot/dts/akebono.dtb: / (ibm,akebono): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/powerpc/boot/dts/akebono.dtb: interrupt-controller (chrp,open-pic): '#size-cells', 'dcr-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/akebono.dtb: interrupt-controller (chrp,open-pic): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/akebono.dtb: /plb: failed to match any schema with compatible: ['ibm,plb6']
   arch/powerpc/boot/dts/akebono.dtb: /plb/hsta@310000e0000: failed to match any schema with compatible: ['ibm,476gtr-hsta-msi', 'ibm,hsta-msi']
   arch/powerpc/boot/dts/akebono.dtb: /plb/hsta@310000e0000: failed to match any schema with compatible: ['ibm,476gtr-hsta-msi', 'ibm,hsta-msi']
   arch/powerpc/boot/dts/akebono.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-476gtr', 'ibm,mcmal2']
   arch/powerpc/boot/dts/akebono.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-476gtr', 'ibm,mcmal2']
   arch/powerpc/boot/dts/akebono.dtb: /plb/sd@30000000000: failed to match any schema with compatible: ['ibm,476gtr-sdhci', 'generic-sdhci']
   arch/powerpc/boot/dts/akebono.dtb: /plb/sd@30000000000: failed to match any schema with compatible: ['ibm,476gtr-sdhci', 'generic-sdhci']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/turris1x.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/turris1x.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,imx8qm-caam', 'fsl,imx8qxp-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-v1.2-msgr', 'fsl,mpic-msg']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-v1.2-msgr', 'fsl,mpic-msg']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,imx8qm-caam', 'fsl,imx8qxp-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: sdhc@2e000 (fsl,c293-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: sdhc@2e000 (fsl,c293-esdhc): compatible:0: 'fsl,c293-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,c293-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@2b000 (fsl,mpc8536-usb2-dr): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: sdhc@2e000 (fsl,mpc8536-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@2b000 (fsl,mpc8536-usb2-dr): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: sdhc@2e000 (fsl,mpc8536-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
>> arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8544-guts']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: crypto@30000 (fsl,sec2.1): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): 'big-endian', 'protected-sources' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): 'big-endian', 'protected-sources' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: sdhc@2e000 (fsl,p2020-esdhc): Unevaluated properties are not allowed ('non-removable' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,imx8qm-caam', 'fsl,imx8qxp-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,imx8qm-caam', 'fsl,imx8qxp-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,imx8qm-caam', 'fsl,imx8qxp-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: crypto@30000 (fsl,sec-v4.4): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.4', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v4.4' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,sec-v4.4' is not one of ['fsl,imx6ul-caam', 'fsl,imx8qm-caam', 'fsl,imx8qxp-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@23000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@23000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@23000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): 'big-endian', 'protected-sources' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: usb@23000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): 'big-endian', 'protected-sources' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@23000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000 (fsl,esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000 (fsl,esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000 (fsl,esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: sdhc@2e000 (fsl,p1022-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: sdhc@2e000 (fsl,p1022-esdhc): compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: sdhc@2e000 (fsl,p1022-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: sdhc@2e000 (fsl,p1022-esdhc): compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: sdhc@2e000 (fsl,p1022-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: sdhc@2e000 (fsl,p1022-esdhc): compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000: failed to match any schema with compatible: ['fsl,sec-v4.2', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic', 'fsl,sec-v4.0-rtic']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-a@0: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-b@20: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-c@40: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-d@60: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
>> arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000 (fsl,esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000 (fsl,esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000 (fsl,esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ethernet@25000 (gianfar): Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ethernet@26000 (gianfar): Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
