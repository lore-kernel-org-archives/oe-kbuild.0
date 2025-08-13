Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B931DF98D
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 15:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755099253; cv=none; b=ADVNfpqujJ6fVhT98QYBXFFm73qOnSZy4qawQ9s9NsTorrjUSSLviAtv0G7WXIYETlq0QcSIr6P/uzY3E/FKFeMFywA2V2C/VIEMTwqFDGSnD5MnOPKre11mL3h6jkGYbqTbLlEudUspn9sm4YhdwI5HDy8rBw7KcxLQOOPHIoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755099253; c=relaxed/simple;
	bh=KqHU3QaAP1UdDoYfMQjkfZK8vEiJUaU90n6pTNi4aoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FMTDCaB2LOXgVOQ2PBpk+iGSVWQJLqu/CMSaLO1UE+beifftsZieCWLL2P2wLioY2loK0T0UdxTnba2yqRz8fX3oNc8d6lUew71FgjWpx92BvSdtuqSUt/uVN0+/p4L3ZmyY149hPE9ZQrAgxVnyQIo7KzDPHtHGZxVDTpRUGqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7xMM27Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7xMM27Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755099251; x=1786635251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KqHU3QaAP1UdDoYfMQjkfZK8vEiJUaU90n6pTNi4aoI=;
  b=M7xMM27ZdAMS5OU2PNsiE72o0241J0EVWR8ALCsS5bjTNHwifFx3Tqdy
   rUp5ECfpp+5F7bcgXTBfcRtSwfX+dbHXicO7WPHwVbdxH0ddLYlOmgP69
   sFwMpdNoYwprmRR/QvqZqdoV8/Pdgvg7ktK006vgn8BB5W9GRj/uMem/J
   LWjIm6Qv/oE0tPp0vboSghakIzlDBJNVijwEiOVfAsJKRBYP+3JkmzAIr
   CaPo8V+yVC9FiqLC3Cw3b6diuK4bkwiKFbebDYsw2vZUifDmN2cGCG6hu
   bvVsrMRpWC9kOqNT8QI3wIWyamn+s6dGeHfp4qeT9OaKMBeb69dLjrHoX
   g==;
X-CSE-ConnectionGUID: GE5b7ROuQnKSkKksxsgljA==
X-CSE-MsgGUID: MPdDydJnRca6JrEHYLQ5GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67672113"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="67672113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 08:34:09 -0700
X-CSE-ConnectionGUID: XnVlLRoCSsW5v7BZo0pgag==
X-CSE-MsgGUID: YHZTqxUxRq25flu52GtAzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="203675265"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2025 08:34:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umDUF-000A2Y-0d;
	Wed, 13 Aug 2025 15:34:02 +0000
Date: Wed, 13 Aug 2025 23:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 522/801] arch/powerpc/boot/dts/fsl/p2041rdb.dtb:
 iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 16384]] is too short
Message-ID: <202508132325.zYqglUqE-lkp@intel.com>
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
commit: f88f9ebac8c3206c5de0012983ba9ecad53f2361 [522/801] dt-bindings: powerpc: Convert fsl/fsl,pamu-v1.0 to DT schema
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250813/202508132325.zYqglUqE-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132325.zYqglUqE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508132325.zYqglUqE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5040-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5040-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 20480]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@f1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 12288]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@f1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 12288]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio@f1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: iommu@20000 (fsl,pamu-v1.0): ranges: [[0, 131072, 12288]] is too short
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@eb000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@eb000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t4240-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: iommu@20000 (fsl,pamu-v1.0): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: mdio@f1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t4240-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: iommu@20000 (fsl,pamu-v1.0): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,pamu-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
