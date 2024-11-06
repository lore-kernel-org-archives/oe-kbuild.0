Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E822AA47
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 02:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730861166; cv=none; b=VIPonwKuSw+/0f85t0adZPgGkomxCqr9Yr1bCFhGq+vqubZg+PpMXDOxu8ABH9Q3vDXbFh/PcbwiTDmOQH9r4njJasB6//gNhqqe7i8bNyDDa7I/a03Zx5Iftbz7Xg3GziLIgZ8Y+a6Tz6MyvLdU4GbYOEGLZwsIpZMaUxx8C7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730861166; c=relaxed/simple;
	bh=a6v9OXkV0szaAAKuI+zmFAAlPvAiLJAD1e7sLveY4g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M0v3H+TN7z25iUjcL0wkDsqRMLH2bDNCG9Hgb1WaOomjA5WlGzpprRV81iAUOy3rpIRA+3tWPhHrSA2klh1kyEC3GxMaWxs0BvGs2gVuHzLd2MlS+5M0qAvcybUn8rOap91VNXWk+1p+7YBuIkC6DgGsMycLD1bwPlOIu82lbjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2IX/LIP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2IX/LIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730861163; x=1762397163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a6v9OXkV0szaAAKuI+zmFAAlPvAiLJAD1e7sLveY4g4=;
  b=m2IX/LIPEHL/imCu9cIvLSB16sVoSQY0gcv/LzvBSZ7C5KDqKf5IC1wa
   X5glmqtmFByPkFqmXqqy7SsKikQV7ftGMN2wDDFOQLrnunfunUsP4GOir
   5+hB3xPsZkN6P6BWD3sPwNkIyiIgN+R5s0jX5WjPHa7CWTqcexEqI+8/1
   SkvcL+Gv0FkfpGU1RS2iFo4mtLGie1WJJaPg6gqzbDOzJHNGcFlJNEqpb
   HJDC3BOzNEuM2hV3i/WJc4MNWAQKfO3ixOUjiA7unxe+R5Mn2JXzMapRd
   AhvbiBk9kYFzgbQRsCA9BizsmXNLNlviFsYANiKXzOJA3w9XsUJi8dqHO
   Q==;
X-CSE-ConnectionGUID: 9Gmoi3/eTPivPby4u7bpgg==
X-CSE-MsgGUID: fFJf+VxnQxeULrSTd05tEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30747492"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30747492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:46:02 -0800
X-CSE-ConnectionGUID: 64MFmWrRRPixyK5TZWJHHA==
X-CSE-MsgGUID: LgONmLGuQq+VG33aM9hPsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84395922"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2024 18:46:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8W3T-000mrI-1Y;
	Wed, 06 Nov 2024 02:45:59 +0000
Date: Wed, 6 Nov 2024 10:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-mfd:for-mfd-next 29/49]
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: backlight:
 False schema does not allow {'compatible': ['zii,rave-sp-backlight']}
Message-ID: <202411061048.gr8Gz7Au-lkp@intel.com>
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
CC: Lee Jones <lee@kernel.org>
TO: Frank Li <Frank.Li@nxp.com>
CC: Lee Jones <lee@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   76c6217c31266e800b67a476bba59dfeb9858a90
commit: 38d09a34b422230dedc76abca578da370d5f03d4 [29/49] dt-bindings: mfd: Convert zii,rave-sp.txt to yaml format
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-051-20241105 (https://download.01.org/0day-ci/archive/20241106/202411061048.gr8Gz7Au-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061048.gr8Gz7Au-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411061048.gr8Gz7Au-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: watchdog: False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: backlight: False schema does not allow {'compatible': ['zii,rave-sp-backlight']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: pwrbutton: False schema does not allow {'compatible': ['zii,rave-sp-pwrbutton']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: eeprom@a3: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[163, 16384]], 'zii,eeprom-name': ['dds-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: eeprom@a4: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[164, 16384]], '#address-cells': 1, '#size-cells': 1, 'zii,eeprom-name': ['main-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: mcu: Unevaluated properties are not allowed ('backlight', 'pwrbutton', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: pcie-ep@33c00000: reg: [[868220928, 4194304], [536870912, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: watchdog: False schema does not allow {'compatible': ['zii,rave-sp-watchdog']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: backlight: False schema does not allow {'compatible': ['zii,rave-sp-backlight']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: pwrbutton: False schema does not allow {'compatible': ['zii,rave-sp-pwrbutton']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: eeprom@a3: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[163, 16384]], 'zii,eeprom-name': ['dds-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: eeprom@a4: False schema does not allow {'compatible': ['zii,rave-sp-eeprom'], 'reg': [[164, 16384]], '#address-cells': 1, '#size-cells': 1, 'zii,eeprom-name': ['main-eeprom']}
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: mcu: Unevaluated properties are not allowed ('backlight', 'pwrbutton', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: pcie-ep@33c00000: reg: [[868220928, 4194304], [536870912, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: pcie-ep@33c00000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
