Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1851922F5
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 01:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780708531; cv=none; b=hIPApT2Tpr76HX1uL9Fl5QwnKZZsIXT0BJhSzVg26MGx2JmjyZWWmTGQF/GPfO7tDWhNEb925wKhTlcdTf7dibIj+AwFGcvTJI01RpW+il9BBtvr0bw43QWgI17JZCiG9G750oIP2XsYDfN9jXSuolXQv9f7JQM4Z4WqFdArjgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780708531; c=relaxed/simple;
	bh=GA5k9tlJv3qgWYm98Fn7mFHZJe3PRjOhm/emTEM95RY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JMiuYi/4NFzWmKkkBv1YNbFVq8rV7Y6RYgLs1KwQE7s4u+x1fLYclK4FAfO6J8nk3jNAjFaYm4UtQMU4Xa9dT9R8rFPmknjB//x5RGqKX2bVYX2rsHfhGR0G2LDNJdCaT9IxJCUfOuTH908XnFTUxCZmvu+3vgH1b43tw0/Qq+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEBWtd4q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEBWtd4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780708530; x=1812244530;
  h=date:from:to:cc:subject:message-id;
  bh=GA5k9tlJv3qgWYm98Fn7mFHZJe3PRjOhm/emTEM95RY=;
  b=jEBWtd4qmyeHqWdd43peG0hdLdIL7IU/VXufY3l2hFmubulyOdFVuqmY
   Krimj5tWHflIPPhBt2nrKXJWWR0nM2tkzpVZ4wdQ/ERHTUfBPjzi96bRO
   GtoW1O8vfYlE2t0z+JBb7yi6oGD0GFy1AEl2XodIu0hmkebG6B89/Q5GP
   068fNUMPgX82Az0YXvwhsoBuA9QAeNrsB0GxFz/bgoBsUhmYmss5vnO5t
   GJYgQhNvgG5c0hdIaBBzrL3cRKAWFN29P+tCrGooPR4YAOPR0Hk2wHUJ8
   CCnhkDnuheK7LnIGg6Cq9E2TMvG0Srmm9WVKMe+a2KejZTihcZRXkU+n9
   A==;
X-CSE-ConnectionGUID: FrZZVG91RdaVNEOjYSXcDA==
X-CSE-MsgGUID: uU1H/96jSY+dJ57ZxS6FFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="106982385"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="106982385"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 18:15:29 -0700
X-CSE-ConnectionGUID: iEw2blWwSZimSOvCi/TsFQ==
X-CSE-MsgGUID: HzajDLBYS7KLED/w+Mbf3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="238632830"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2026 18:15:28 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVfdG-000000002il-2LxT;
	Sat, 06 Jun 2026 01:15:26 +0000
Date: Sat, 06 Jun 2026 03:14:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v7.3 85/95]
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14400800
 (renesas,riic-r9a09g047): 'clock-frequency' is a required property
Message-ID: <202606060306.LT7o86XO-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: John Madieu <john.madieu.xa@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.3
head:   039608fad80827cc1db55aed77478bf807093582
commit: f7bacadaf539b90a02ba1de6a598804cd00b90f3 [85/95] arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-2053-20260605 (https://download.01.org/0day-ci/archive/20260606/202606060306.LT7o86XO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060306.LT7o86XO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606060306.LT7o86XO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: clock-controller@10420000 (renesas,r9a09g047-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: clock-controller@10420000 (renesas,r9a09g047-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14400800 (renesas,riic-r9a09g047): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g047-fcpvd', 'renesas,fcpv'] is too long
   	'renesas,r9a09g047-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	'renesas,r9a09g047-fcpvd' is not one of ['renesas,r9a07g043u-fcpvd', 'renesas,r9a07g044-fcpvd', 'renesas,r9a07g054-fcpvd', 'renesas,r9a09g056-fcpvd', 'renesas,r9a09g057-fcpvd']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: clock-controller@10420000 (renesas,r9a09g047-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: clock-controller@10420000 (renesas,r9a09g047-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: i2c@14400800 (renesas,riic-r9a09g047): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g047-fcpvd', 'renesas,fcpv'] is too long
   	'renesas,r9a09g047-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	'renesas,r9a09g047-fcpvd' is not one of ['renesas,r9a07g043u-fcpvd', 'renesas,r9a07g044-fcpvd', 'renesas,r9a07g054-fcpvd', 'renesas,r9a09g056-fcpvd', 'renesas,r9a09g057-fcpvd']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
