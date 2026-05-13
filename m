Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F9236EA98
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 03:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778644180; cv=none; b=uO/PE2HjWoELnOZMmkRa44MNe284ECd8jpCvhwZyuc2HMERI8fFFt6Btn4s0w2X7A8P4LoftuTqRaonOwHE7RK1hi+E+xqY3GrlgNzySQP1s2WkgSO0P6wX494anVOigSAhs8zYYcLHXhXY51t41tihlHV+wNrHxNFaKmh8FPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778644180; c=relaxed/simple;
	bh=/bU4HxbKNSfNbVqHwMC5O+jtK8d8MmjoJIQcEH8fRJA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MxOKbZewEsqU9ILhOFtdg1jAa//r+NYlKzNFXWMXa4lFaybs8fTBYgTqqzXGiVAAXjZBVdeTmR9P6273dq7EIPfjd36By5668g0YvIb9iOa0Q2Kpmg2WFCof30Zc4SQep3mz1Zh4sLY/wo+QIZIHx5z8rz6rUH1nuIWeTHpFL90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqwiS6nT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqwiS6nT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778644178; x=1810180178;
  h=date:from:to:cc:subject:message-id;
  bh=/bU4HxbKNSfNbVqHwMC5O+jtK8d8MmjoJIQcEH8fRJA=;
  b=cqwiS6nTyw04vvNFn8BZSkVHC46ebyCZ4u+yQj1ZOJd+Z2m1aoTZXtDO
   8FV3nF98aCAhz885CeOxEsQJl30kkB2Ab8oCrk8gzs2knVyn98oL6u3qw
   eZf1xnvWBO8QAxjqrfE5UoyBVj8zJwcqSo5hyZLr/xEHhj1WtQa1w2rKg
   xkk2RD7AAmK5lcalCl6rYqmLzwyJyqlE4fBNo2idO7BfkGZGW0GvcY8ht
   PZNC8y3JUzWgCtpN9pCT1BnMLDaq0z701V9D0Ru7eri1tuvhGANt8Z4p+
   VDhSnFA+ZYftxNg5WXCVH7GQYUNHDJx+hAiDqMF8gj0rBpzVOnhHL+SQG
   A==;
X-CSE-ConnectionGUID: E4B8acPTT+KlApmCcUWKcw==
X-CSE-MsgGUID: F9e0QBNqSwS0zvRx/jb+Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79515972"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79515972"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 20:49:38 -0700
X-CSE-ConnectionGUID: 3jQdttbXSwe7RLkE9RIbIA==
X-CSE-MsgGUID: jm9aOyycRCeZja/cNcTgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237881774"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 May 2026 20:49:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN0bG-000000008SX-2zly;
	Wed, 13 May 2026 03:49:34 +0000
Date: Wed, 13 May 2026 05:48:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/dt-for-7.2 3/4]
 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb:
 /soc/hstimer@3005000: failed to match any schema with compatible:
 ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
Message-ID: <202605130511.3zCUePLC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Michal Piekos <michal.piekos@mmpsystems.pl>
CC: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/dt-for-7.2
head:   cb8eba42e31854c07f7891a0c9955e7ae8be2d93
commit: 2d2c7e532ec325240068ac8d53d94cc0133c06f6 [3/4] arm64: dts: allwinner: h616: add hstimer node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130511.3zCUePLC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130511.3zCUePLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130511.3zCUePLC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
--
   	'allwinner,sun50i-a64-sram-c' was expected
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-a3-a4', 'allwinner,sun7i-a20-sram-a3-a4']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,sun5i-a13-sram-c1', 'allwinner,sun7i-a20-sram-c1', 'allwinner,sun8i-a23-sram-c1', 'allwinner,sun8i-h3-sram-c1', 'allwinner,sun8i-r40-sram-c1', 'allwinner,sun50i-a64-sram-c1', 'allwinner,sun50i-h5-sram-c1', 'allwinner,sun50i-h6-sram-c1']
   	'allwinner,sun50i-h616-ve-sram' is not one of ['allwinner,suniv-f1c100s-sram-d', 'allwinner,sun5i-a13-sram-d', 'allwinner,sun7i-a20-sram-d']
   	'allwinner,sun50i-h6-sram-c' was expected
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/syscon@3000000/sram@28000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-sram-c', 'allwinner,sun50i-a64-sram-c']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: sram@1a00000 (mmio-sram): sram-section@0:compatible: ['allwinner,sun50i-h616-ve-sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/syscon@3000000/sram@1a00000/sram-section@0: failed to match any schema with compatible: ['allwinner,sun50i-h616-ve-sram']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/hstimer@3005000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hstimer', 'allwinner,sun20i-d1-hstimer']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
