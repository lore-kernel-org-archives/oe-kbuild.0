Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118521A5BAD
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 22:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738968624; cv=none; b=ZceUayRE8DXMQD7McfZJfMbJDoXtvy8JCXmjDJMI6TqqKdlkKY7Tb3VQir0bsXN0JiQRNb0EA1bK9tZczY7qGNB9jbFpVkGWu60arQRgH5E99CW4QlPp3Q9frJVApcp+3GktNDYl2JrAd6DRDLQoSOHlaN36ETxtcCLbnkIuJs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738968624; c=relaxed/simple;
	bh=lOTYiDGcb1Mygbnkj/8yim1GRydxMjXkHfyY0yMG0bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GaSGvsF8BIY5fLpHHe0xojWdmP9/Z4qp+aNnCiUx3sQJpn7azs8zEIwD0W8xBxdFY2PfMWGLLZLN5TlZytgi5jZY3InylO7CjJ40mzx010VWsKBPVuTjYjDw3J0lh40ThWnrAhGdVjrgn8vYwQCXry32YYaCewR4jygPD/zJDak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jksQVfCY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jksQVfCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738968623; x=1770504623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lOTYiDGcb1Mygbnkj/8yim1GRydxMjXkHfyY0yMG0bQ=;
  b=jksQVfCYIclszF/LVq5b1l/a30x9Uq8lCj7QqKRG5JddLT4fB49EiT0s
   TQ9jxNnScPzHHtKJHyDsGTB3SZ8cEF07YkiCRaccLV3/JQv2iCKm2ee+x
   6Oogu0GuVR8fozF2nZHR7RKQ9uzo8uW8CzxnddFKhOxFb6PfU3Lmk4DLa
   7rHsXleEhAGoQ7AUwTgRqAauvfXFU3lZcRbhzLYzKoYXKRhboGGTB7Lns
   OZpBV0MMxXYO9YLQGLyb7NdiQwx0Bnj2bxc7Ma4muSy9bk3HSMPJ5aoMj
   7CU/lcdnPmhOjWY2diERyzQRlcBLvtLdXNFc0vdUAR9g7//5nR2ctPajr
   g==;
X-CSE-ConnectionGUID: FqOKczmmTXq9ExTZSP/QHg==
X-CSE-MsgGUID: Z3LNafShQayxIOqwh+b8fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51052548"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51052548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 14:50:20 -0800
X-CSE-ConnectionGUID: UVcVBUPbRlSI3H/bfN6yag==
X-CSE-MsgGUID: Az1P6yvERqSqEWVDvkr9NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116588417"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2025 14:50:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgXAu-000z8x-1l;
	Fri, 07 Feb 2025 22:50:16 +0000
Date: Sat, 8 Feb 2025 06:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 6/9] arm64: dts: ti: k3-am62p5-sk: Enable IPC with
 remote processors
Message-ID: <202502080606.HjfK4Gms-lkp@intel.com>
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
In-Reply-To: <20250206235200.3128163-7-jm@ti.com>
References: <20250206235200.3128163-7-jm@ti.com>
TO: Judith Mendez <jm@ti.com>
TO: Nishanth Menon <nm@ti.com>
TO: Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Andrew Davis <afd@ti.com>
CC: Hari Nagalla <hnagalla@ti.com>
CC: Judith Mendez <jm@ti.com>

Hi Judith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5532b8a9ce0e80514e37a1e082824934663580a3]

url:    https://github.com/intel-lab-lkp/linux/commits/Judith-Mendez/arm64-dts-ti-k3-am62-wakeup-Add-wakeup-R5F-node/20250207-075358
base:   5532b8a9ce0e80514e37a1e082824934663580a3
patch link:    https://lore.kernel.org/r/20250206235200.3128163-7-jm%40ti.com
patch subject: [PATCH v4 6/9] arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250207 (https://download.01.org/0day-ci/archive/20250208/202502080606.HjfK4Gms-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080606.HjfK4Gms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502080606.HjfK4Gms-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: sram@79100000: 'mcu_sram1@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: sram@79100000: 'mcu_sram1@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: sram@79100000: 'mcu_sram1@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: sram@79100000: 'mcu_sram1@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: camera@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: camera@10: 'VDIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: camera@10: 'VDDL-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: sram@79100000: 'mcu_sram1@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: sram@79100000: 'mcu_sram1@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
