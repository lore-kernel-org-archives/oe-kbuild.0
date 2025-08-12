Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44862227B8E
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 23:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755040726; cv=none; b=Eelro8ILzibny681VVi7RmbVn47M6zYnSqrqkbQRPgVpUWrl0/quAys4DrUwEOtqrISFk8ztg8r5bD2ncnv5Kf5umEEp2C8MgIpBten/CinNdoh0FQ1xPPUN7G2dtdFpagX/BRxIa5DmetJHmO+9tC8Gpd6RrZc+QMZNoIbngr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755040726; c=relaxed/simple;
	bh=53JWtJ9J+ZSM5wMm/9Q1yDpXNrk0pvoi3N0jEYR1acQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3O1c7mju5EwnW4X7C7T0CL6qv2noybi7YeyuTh+ynpxmIPm9UYIU6UdAgYWtkJxKqvjb1bECtVdtpCOCDk9ZO0CKrl2rHCAVv9mXlMoAffD7YpvDEih6OYl66UOiVF+NBC/WNrrX5mfrCdXC9sdUASHE8dM5frTuuIbPfE7Eig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3fpyAAu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3fpyAAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755040722; x=1786576722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53JWtJ9J+ZSM5wMm/9Q1yDpXNrk0pvoi3N0jEYR1acQ=;
  b=N3fpyAAucb08V9Nw4ALEaXwdpLNypO9g4LUakAaaxm/7L9V4Bu/9urSU
   vJmkJCZ/ayz52hb0QPGDj19M5UamoUrB72gPoMWNp+JWViCc8tON01sLt
   /Q30g4wMN6mu0jFFSwUxNbmtQtliZRh/vPCUHiUgv8vhjLnxVN8DYgLLp
   fmG42lDPbw6K7dLBxpwJiPItb2ReeM8mcc4xZFYnWL0MepTTVVK6IaYMG
   pJcVgOwhh5rwXOdrAbEecXO4jDOB8324fzyp2n+QpGPrIXCiVZ4sqEY0q
   0YGIvVm66VaiSB5puZp9LYdQHiWx4zmSS8t6zarCFm236yJNcaZuacskm
   w==;
X-CSE-ConnectionGUID: lDLbSXdIScqVz2BHUlk/dQ==
X-CSE-MsgGUID: 7ZF/N4JMSJCyTjM43PNmuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56353343"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56353343"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 16:18:41 -0700
X-CSE-ConnectionGUID: dGjMgMzWSCeMbe9UYo9npQ==
X-CSE-MsgGUID: mAyMQBDNRQG5qrVnAa/7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="197307628"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Aug 2025 16:18:40 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulyG4-0009NI-37;
	Tue, 12 Aug 2025 23:18:25 +0000
Date: Wed, 13 Aug 2025 07:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 521/801]
 arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic):
 'device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508130728.i2lAe9vm-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: b674c6f3754f323f8c3cfd0d34593e393ea860f3 [521/801] dt-bindings: powerpc: Convert fsl/fsl,mpic to DT schema
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250813/202508130728.i2lAe9vm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130728.i2lAe9vm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508130728.i2lAe9vm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): 'device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
--
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
--
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
--
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5040-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5040-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0']
--
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): 'device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@eb000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@eb000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t4240-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t4240-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
