Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA3182D3
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754672673; cv=none; b=FU+zWP+FK80V9CRJXNgb7My9h7Lme7rzRJ6LQv7PCyv5YtRpDRwVUYorE6iFSBQ3XP8TLacayw1S5dvaEKNtugQqM/oemKmamdGuVHaIc7gQKGPchxKHsYZyreSyDc7vwQNsd+vwNyr5IvUhtfEnBASm0dCnPSPD+Fh456OFokc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754672673; c=relaxed/simple;
	bh=Yuz3isxT8Hf8Bnp1XotAf+mhFWQ3RH8HTFauWOOAET0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXNAUCUIheOumOrk8+VddAkrRQZKU5pK3m89YvYuJ1wCsZkASPkHEsA6zg3BvfyG1nFZxV3zmK0YAZhI7tUf29bb//Q1M5t3G+9p6Msi5+qaRJHNhcZKLuKl1vbH7mLK8CBXIfcIV8n0o6RzNpp//v6sBw7LUBTxzHdXL2p1Ogs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtKChdis; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtKChdis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754672670; x=1786208670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yuz3isxT8Hf8Bnp1XotAf+mhFWQ3RH8HTFauWOOAET0=;
  b=UtKChdishz3u/372njGX7XOJRoJpReI1k4krfYyXu1RMuRA2uV4FdkA4
   ccYmo1B7h3kvNT15Q8j6U1DfHVqKh4xok5rpkgf4uMHR4Y1gF5oXBH5wL
   bRgNZdyD6ypF7XEe012aK8S9vMLj6/Mys5IQrFLY7lrBc64Hua/8HDKzh
   4vesy5tY3aFh5gocpDEvgHMUIEx186BgQB8MtiqsKk8P/ofSpdI8W1J3Z
   fbAHKHaj+s8BcJWZEhrmISfXWX7lIEqz7Fj9hGHqC/Vcwn83b8XdI/jgg
   ZrKKlLgZ1YW78RY21PfDwz2KatltVDpZD8GwxIbeMQMN04SjSkN3uWWwI
   Q==;
X-CSE-ConnectionGUID: JYmMORxCRDmPB1ddRD2Slw==
X-CSE-MsgGUID: CYWYBGoCR5aQjnDI6J2uTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57092356"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="57092356"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 10:02:35 -0700
X-CSE-ConnectionGUID: /bsAe3wPRyaBYBwud66s8Q==
X-CSE-MsgGUID: eyvQg39oQJ+QbXYJp032mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="196192406"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Aug 2025 10:02:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukQTo-000492-1G;
	Fri, 08 Aug 2025 17:02:20 +0000
Date: Sat, 9 Aug 2025 01:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 391/801] arch/powerpc/boot/dts/fsl/p2041rdb.dtb:
 ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202508090001.eVTUileK-lkp@intel.com>
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
commit: 77eac44e4aff61b159329a6cff9a3179ee680ed4 [391/801] dt-bindings: net: Convert broadcom-bcm87xx to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250809/202508090001.eVTUileK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090001.eVTUileK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508090001.eVTUileK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: usb@211000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: usb@211000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: i2c@119100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: ethernet-phy@4 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: i2c@119100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: ethernet-phy@4 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
--
   	'fsl,p5040ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p5040ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p5040ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,p5040ds-fpga', 'fsl,fpga-ngpixis']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): Unevaluated properties are not allowed ('rgmii-mdio@8', 'sgmii-mdio@28', 'sgmii-mdio@38', 'sgmii-mdio@48', 'sgmii-mdio@68' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: mdio-mux-emi2 (mdio-mux-mmioreg): Unevaluated properties are not allowed ('hydra-xg-slot1@0', 'hydra-xg-slot2@2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: ethernet-phy@4 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p5040-pcie', 'fsl,qoriq-pcie-v2.4']
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet-phy@2 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@e3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet-phy@2 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet-phy@3 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@f1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@f1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c45'] is too short
   	'broadcom,bcm8706' was expected
   	'broadcom,bcm8727' was expected
   	from schema $id: http://devicetree.org/schemas/broadcom-bcm87xx.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet-phy@2 (ethernet-phy-ieee802.3-c45): compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
