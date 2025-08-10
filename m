Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F151C267733
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754841470; cv=none; b=ECod7luId4TISMcUDQqbewDWwmCiV1/9mRXWBn+mER+ADb1HTYKp9+rBQFUGNKGKFycYm1IpXC83ILW9hGFsWklIut54HqxNUJ+RX0xLHjQnHzX7kr8Xd2fEdN3HWHCdZcPDb+luRmkyu1GzdRo2L6YVQ0QD5r658BxsOf1OwbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754841470; c=relaxed/simple;
	bh=6BUvClKk5v9U4qr88aaq8azhgH6RrliJipTvuWj7qro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eFR8hmmhdFwR3Ji3OKUF4uEZKdhS/GOOXWcZPoGDxTdqV0l5NU5olO+GEwIdb+rBTkYcDEQfq0WxRGiRJC9tPMDLqu/skZfriY634zA+l3uJtCegx7Y929w4Idl3vfLDggVgzEwdNJ3cUUglOsDsVhXHnVq/w2rYr4Agan7ReSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkI4oCr2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkI4oCr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754841468; x=1786377468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6BUvClKk5v9U4qr88aaq8azhgH6RrliJipTvuWj7qro=;
  b=IkI4oCr2BtdFoH6KKt5b1gXSzCL7VKc6bIRuO6U2CwrtuEv4Sp2uj8jE
   gx0QCwGxVIE163qb7Lc5YzYuLLXsT9dtcdUtNCeBXFZjKkMqYZxMXd8Gq
   QxshIJgyM8E13vIxjQjdF/8/GGYlJ+DjRrTQ5eDTNftiGaqZm75B2JADp
   3sy7lHOtgu0CY/6U5lniXUTvZO84bMzXR6DwYYYI0/O+pXT7Q0EeOFqUj
   atzOFKzoB6vK5PgiW9qr/wgzLZZb+mLcX8/PmjnoYxMOMvYIbM0NhRaXl
   t5WugQEhcWG21ZkwKgzIXD1mh/AqhnoKctvlNY2kGIXIlqafyzIsoj9k/
   Q==;
X-CSE-ConnectionGUID: XxhKiiuWSpe1QDdr7mDfaA==
X-CSE-MsgGUID: qCEFfCyMQhOIXG3yotnpKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57251931"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57251931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 08:57:47 -0700
X-CSE-ConnectionGUID: LuPSp5WqQ722bdK9CgaTiQ==
X-CSE-MsgGUID: 9x+cncI8QcGIu3xiSWFuZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166130728"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 10 Aug 2025 08:57:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ul8QZ-0005Ka-2N;
	Sun, 10 Aug 2025 15:57:43 +0000
Date: Sun, 10 Aug 2025 23:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 511/801] arch/powerpc/boot/dts/fsl/t1024qds.dtb:
 display@180000 (fsl,t1024-diu): compatible:0: 'fsl,t1024-diu' is not one of
 ['fsl,diu', 'fsl,mpc5121-diu']
Message-ID: <202508102309.GgKgG1J8-lkp@intel.com>
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
commit: d6a15fb7185f3b8c7d190741abe628f721cbdd81 [511/801] dt-bindings: powerpc: Convert fsl/fsl,diu to DT schema
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250810/202508102309.GgKgG1J8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508102309.GgKgG1J8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508102309.GgKgG1J8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: display@180000 (fsl,t1024-diu): compatible:0: 'fsl,t1024-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: display@180000 (fsl,t1024-diu): compatible: ['fsl,t1024-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: display@180000 (fsl,t1024-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: display@180000 (fsl,t1024-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1024-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pcie@ffe240000 (fsl,t1023-pcie): pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pcie@ffe240000 (fsl,t1023-pcie): pcie@0:interrupts:0: [20, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: sec_mon@314000 (fsl,sec-v5.0-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: display@180000 (fsl,t1024-diu): compatible:0: 'fsl,t1024-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: display@180000 (fsl,t1024-diu): compatible: ['fsl,t1024-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: display@180000 (fsl,t1024-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: display@180000 (fsl,t1024-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1024-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pcie@ffe240000 (fsl,t1023-pcie): pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pcie@ffe240000 (fsl,t1023-pcie): pcie@0:interrupts:0: [20, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: usb@210000 (fsl-usb2-mph-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: usb@211000 (fsl-usb2-dr-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: display@180000 (fsl,t1040-diu): compatible:0: 'fsl,t1040-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: display@180000 (fsl,t1040-diu): compatible: ['fsl,t1040-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: display@180000 (fsl,t1040-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: display@180000 (fsl,t1040-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sata@220000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sata@220000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sata@221000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: usb@210000 (fsl-usb2-mph-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: usb@211000 (fsl-usb2-dr-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: display@180000 (fsl,t1040-diu): compatible:0: 'fsl,t1040-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: display@180000 (fsl,t1040-diu): compatible: ['fsl,t1040-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: display@180000 (fsl,t1040-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: display@180000 (fsl,t1040-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sata@220000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sata@220000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sata@221000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: usb@210000 (fsl-usb2-mph-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: usb@211000 (fsl-usb2-dr-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: display@180000 (fsl,t1040-diu): compatible:0: 'fsl,t1040-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: display@180000 (fsl,t1040-diu): compatible: ['fsl,t1040-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: display@180000 (fsl,t1040-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: display@180000 (fsl,t1040-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sata@220000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sata@220000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sata@221000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: usb@210000 (fsl-usb2-mph-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: usb@211000 (fsl-usb2-dr-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: display@180000 (fsl,t1040-diu): compatible:0: 'fsl,t1040-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: display@180000 (fsl,t1040-diu): compatible: ['fsl,t1040-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: display@180000 (fsl,t1040-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: display@180000 (fsl,t1040-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sata@220000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sata@220000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sata@221000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: usb@210000 (fsl-usb2-mph-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: usb@211000 (fsl-usb2-dr-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: display@180000 (fsl,t1040-diu): compatible:0: 'fsl,t1040-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: display@180000 (fsl,t1040-diu): compatible: ['fsl,t1040-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: display@180000 (fsl,t1040-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: display@180000 (fsl,t1040-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sata@220000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sata@220000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sata@221000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: usb@210000 (fsl-usb2-mph-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: usb@211000 (fsl-usb2-dr-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: display@180000 (fsl,t1040-diu): compatible:0: 'fsl,t1040-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: display@180000 (fsl,t1040-diu): compatible: ['fsl,t1040-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: display@180000 (fsl,t1040-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: display@180000 (fsl,t1040-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sata@220000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sata@220000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sata@221000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: usb@210000 (fsl-usb2-mph-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: usb@211000 (fsl-usb2-dr-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: display@180000 (fsl,t1040-diu): compatible:0: 'fsl,t1040-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: display@180000 (fsl,t1040-diu): compatible: ['fsl,t1040-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: display@180000 (fsl,t1040-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: display@180000 (fsl,t1040-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sata@220000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sata@220000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sata@221000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: usb@210000 (fsl-usb2-mph-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: usb@211000 (fsl-usb2-dr-v2.5): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: display@180000 (fsl,t1040-diu): compatible:0: 'fsl,t1040-diu' is not one of ['fsl,diu', 'fsl,mpc5121-diu']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: display@180000 (fsl,t1040-diu): compatible: ['fsl,t1040-diu', 'fsl,diu'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: display@180000 (fsl,t1040-diu): interrupts: [[74, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: display@180000 (fsl,t1040-diu): reg: [[1572864, 1000]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,diu.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sata@220000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sata@220000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sata@221000 (fsl,pq-sata-v2): 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
