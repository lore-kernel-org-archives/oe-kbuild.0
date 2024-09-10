Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292FB524F
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 02:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725934545; cv=none; b=FviapcK6v7niGfDDaNqJWF7U1bS1VOQDTJzUUi0fMNbfrfe3fM5YaTHGgjzkcIn15Ca3uZUw6fgb9w2SJVvlA0/GzfHXYs7/dypLmFa2mcSjkZdHPRB+3Wmut0uRKG1NGyF/9N6toF5VeATSrYWdUVoU9FpOK7x20P/5mOaHVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725934545; c=relaxed/simple;
	bh=5uVmti8kjykZEaIUpFH0h44ctDZTaO1CAv/SFL6zz/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PX7ceY0XvB5PGqRLN3rFn3jYusXfPBBrRYjlv7rt0HR/dG6A2XsoNUK+c1bS4zndMg2mIhQXM8uZPbxC/EfmRmAgczKhTIjMfuTU2gn0hFnWG+gfYxuIexoFpCe1pk4AUr4JKJLYTySryIp4NP3tgOFncA7Ejvt/XtXgO53jZiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsW9JGPQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsW9JGPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725934543; x=1757470543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5uVmti8kjykZEaIUpFH0h44ctDZTaO1CAv/SFL6zz/Y=;
  b=YsW9JGPQmFrR0ovSCjcUD7rbJdoh/nzg5QPWHKYNTTH80K0lA7f7wFmp
   JheE1Dycu6pPogUponKwaQ1KQM+ZiByrjlndRwR7Onbhy6nogB609E9Gk
   6Dz1rLnV+msa0/zNhSbmxzfbCeueIAMWcUv+IS/t/R1EKHRYGj9QGME4i
   H423vCcvgqzMQpmKmULRonTi2fDJ+derHvqSfeNMul4PGU6YOuy900dOE
   Xe/n/Ds8Bl5bC/fEMRfqPjWGer2NpdZvuB6LqdwUR8PYTG+8CDIhhAChH
   q4wnXe3nOwKaRhEvWHxPAlyiGTuyJZwcXENsXs/1iIg0NTJIgzNRA9k7y
   w==;
X-CSE-ConnectionGUID: O/t7dj5aQXy9R8DxhKpacw==
X-CSE-MsgGUID: D32iEJfXTbu5Fl/uQ5uljA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36041885"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="36041885"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 19:15:42 -0700
X-CSE-ConnectionGUID: pb8bW09uS5KjZ9CqYUrJag==
X-CSE-MsgGUID: w9ijQpPkRja7I2D5FGNhFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66921288"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2024 19:15:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snqPr-000FWq-1w;
	Tue, 10 Sep 2024 02:15:39 +0000
Date: Tue, 10 Sep 2024 10:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pinchartl:nxp/v6.11/dev/rpi-cam/next 90/113]
 arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:9.3-16: Warning
 (reg_format): /fragment@0/__overlay__/controller@10:reg: property has
 invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202409101006.PuZlfDKA-lkp@intel.com>
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
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git nxp/v6.11/dev/rpi-cam/next
head:   905f41cde8d4a41258060c2ff02fcafcf2c1ebff
commit: 5af6e43d6c7a03ba27710d35fae363da55b9902c [90/113] arm64: dts: freescale: Add IMX296 camera overlays for Variscite DART
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-003-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101006.PuZlfDKA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101006.PuZlfDKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409101006.PuZlfDKA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:9.3-16: Warning (reg_format): /fragment@0/__overlay__/controller@10:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:16.3-16: Warning (reg_format): /fragment@0/__overlay__/camera@1a:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:45.10-50.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:7.27-12.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/controller@10: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:7.27-12.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/controller@10: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:14.12-34.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/camera@1a: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:14.12-34.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/camera@1a: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:9.3-16: Warning (reg_format): /fragment@0/__overlay__/controller@10:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:16.3-16: Warning (reg_format): /fragment@0/__overlay__/camera@1a:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:45.10-50.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:7.27-12.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/controller@10: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:7.27-12.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/controller@10: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:14.12-34.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/camera@1a: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:14.12-34.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/camera@1a: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

vim +9 arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi

5af6e43d6c7a03 Laurent Pinchart 2023-02-18  @7  	VC_CTRL: controller@10 {
5af6e43d6c7a03 Laurent Pinchart 2023-02-18   8  		compatible = "vision-components,mipi-module";
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  @9  		reg = <0x10>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  10  		#clock-cells = <0>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  11  		clock-frequency = <54000000>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  12  	};
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  13  
5af6e43d6c7a03 Laurent Pinchart 2023-02-18 @14  	camera@1a {
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  15  		compatible = "sony,imx296lq";
5af6e43d6c7a03 Laurent Pinchart 2023-02-18 @16  		reg = <0x1a>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  17  
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  18  		clocks = <&VC_CTRL>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  19  		clock-names = "inck";
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  20  
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  21  		avdd-supply = <&VC_CTRL>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  22  		dvdd-supply = <&VC_CTRL>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  23  		ovdd-supply = <&VC_CTRL>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  24  
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  25  		orientation = <0>;	/* Front */
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  26  		rotation = <0>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  27  
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  28  		port {
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  29  			IMX296_EP: endpoint {
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  30  				data-lanes = <1>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  31  				remote-endpoint = <&CSI_EP>;
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  32  			};
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  33  		};
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  34  	};
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  35  };
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  36  
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  37  &isi_0 {
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  38  	status = "okay";
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  39  };
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  40  
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  41  &CSI {
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  42  	status = "okay";
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  43  
5af6e43d6c7a03 Laurent Pinchart 2023-02-18  44  	ports {
5af6e43d6c7a03 Laurent Pinchart 2023-02-18 @45  		port@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
