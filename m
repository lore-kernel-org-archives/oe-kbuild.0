Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972F1442F
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Feb 2025 06:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738476786; cv=none; b=UzI7RQ1/IciRNTbof5uH+NJglx06UPbQXH1g/wWEkX3vw+VsikSqa05kjWu8FRXqs7Ec0o+zH3TdKsMu28JjHrLl5UoC+0O0HxsoAImZOxT/teB4gLPiEsgeMIOBCjgew0n2ftdCbV543ohd3zp9uLKRNfjST5mZEiRDzb2Yrrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738476786; c=relaxed/simple;
	bh=Mv/HjoIY14kmH5SlP4UnY6geBdFHihRDo5HE4XSCVuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PbGWPU2IentVm6cVvfrYaW+5r87bgnfVVzZ0ZBQvZddQ1BxGn+EyIpsh6sl8xNxJUKhBLGopwEuG+xg/vI9Y199dcu00gKpDCcXGYM9FbYbYngkJvFGK2FGjz6W/5HSDOUVfDKLKeQHYxgUsNTOtK8FPW/wwt2wSBf6iYi0XT6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBjZN3Zb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBjZN3Zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738476784; x=1770012784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mv/HjoIY14kmH5SlP4UnY6geBdFHihRDo5HE4XSCVuM=;
  b=MBjZN3ZbsSzNJLuWyEDmGeuK4lFRY4erSZtHagq6K8t0OSNSSLVgj7bp
   8i4K1wdsSyxOUm8+3ctubXeCCHwuJkgox/P5flFLmJpFqySLFr2Qr4Nuu
   sNVZtzWu/j9z1i3GDM8hArM6is5uCncSWw08ahOXrNZrOCBOZuXDIkHps
   zXkBwbVfeqpSA6OIv827QxIrno1e8k+L/6YS4Z+0pXt3nBusZLTnU9lU/
   /TUAzNVruVtfcnANiRbP3SeO57RxF9+b/mdxBVhdfXz5RwbOeEvXIcCCQ
   dhw7okn+Rz1RhpSvy8xaMKaJooZjeKwa8qEUjY2jacxgM03+VwT43wj4d
   Q==;
X-CSE-ConnectionGUID: uBDmDtjYQg68XLVmWpWIgg==
X-CSE-MsgGUID: v6iijmgRSj+uP8YUWg3E6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42916722"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="42916722"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 22:13:03 -0800
X-CSE-ConnectionGUID: 8eDvr+hVQP+dSIonBsu8Ew==
X-CSE-MsgGUID: TjCvDfA0QZqPK2d30/IE8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109832558"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Feb 2025 22:13:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teTE3-000pK7-1m;
	Sun, 02 Feb 2025 06:12:59 +0000
Date: Sun, 2 Feb 2025 14:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: Introduce more nodes to EN7581 SoC
 evaluation board
Message-ID: <202502021344.O3LDzsdz-lkp@intel.com>
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
In-Reply-To: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
References: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7605336e9d136c14c94482ce7385de783f2f748e]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/arm64-dts-Introduce-more-nodes-to-EN7581-SoC-evaluation-board/20250201-224326
base:   7605336e9d136c14c94482ce7385de783f2f748e
patch link:    https://lore.kernel.org/r/20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6%40kernel.org
patch subject: [PATCH] arm64: dts: Introduce more nodes to EN7581 SoC evaluation board
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-051-20250202 (https://download.01.org/0day-ci/archive/20250202/202502021344.O3LDzsdz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502021344.O3LDzsdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502021344.O3LDzsdz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/airoha/en7581.dtsi:186.24-192.5: Warning (unit_address_vs_reg): /soc/i2cclock@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/airoha/en7581.dtsi:155.37-160.5: Warning (simple_bus_reg): /soc/clock-controller@1fa20000: simple-bus unit address format error, expected "1fb00000"
   arch/arm64/boot/dts/airoha/en7581.dtsi:186.24-192.5: Warning (simple_bus_reg): /soc/i2cclock@0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: soc: i2cclock@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: system-controller@1fbf0200: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: i2cclock@0: clock-frequency: 20000000 is greater than the maximum of 5000000
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: i2c0@1fbf8000: 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/mediatek,mt7621-i2c.yaml#
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: i2c1@1fbf8100: 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/mediatek,mt7621-i2c.yaml#
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: i2c1@1fbf8100: status: 'oneOf' conditional failed, one must be fixed:
   	['disable'] is not of type 'object'
   	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
