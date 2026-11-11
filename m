Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436146;
	b=zsKwKGDyN56tm9hbGBU27Jz9iFDeknlsKJcSR/ejtEpWDVqln/UwXK9TVZD3eWHuGZG4
	 uOA+CAikxUchXI7R2VFHWQ526jzUUKVlGodNw4O4bE2QsZYqNqpqLPIJGLajwbNM/wdWF
	 g98tNQiDyxn/me0UHkOIKdqT463Fw8bleVDZFRFFXe4ZDdOCha+wLxs9DrnS/vhIzpx4l
	 zzVlZj/+rFqbBHAeh9CGZ24d7+dcUTG8wd2GctFVBw/0yaMtMUTn4Q14keQBwQWAfQwK9
	 oriFx3Q/U4LapIHK7eMjQ7dQFs2QupwKQePFN00v0szYpA43nlz0amstjW1P2fho5zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436146;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vVtS4BqsjvsvFmdZRhyc04/Fe/0rbg9F13v8GmnI6Go=;
	b=vV4YffrppzI66YxGzuksgw+QpIvjuW2Mv8rESeN+YtJD92CHFjJ+A6OYcWchOo6ILEIp
	 K82jd4zup+nu1U/+9IrCvfSq7LZclYmVH34Fr2M0GV08yHAMkGbuqnfuxU7PKG55CWOZb
	 +guU49y9uzIBetxJmCuypca1U28/lenH6/wHrGJAMFJ+KCyUmjTvK4veTuexfXn2KhLWE
	 yOvqWDwCj8h+OlJsTb/yfcDvCZs47Cvv+kmibRY7PyKdClKbrR7Jk8GhrMUzr+wkNy/+y
	 cH75UObxgmcknQ2bL1X1S4T4iaPkEQfQC7xxdFn4Gy1/eqEkrIE7iXTL7cjq7i7LdYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="j/1uKxOT";
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A36606A324
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 22:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A36606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j/1uKxOT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794436145; x=1825972145;
  h=date:from:to:cc:subject:message-id;
  bh=qguerhpQ6vxTtsYpp8kE8NlDFHzluN7HBD1/fD0eh5k=;
  b=j/1uKxOTr6nu3VU491p1fpRIYd3zFMADssWg8iKmfk2/l3NnXEhzFTtl
   PrBhjIWKKekZ+Bq2jwH0kpe1vO5hTG96b3h1CHBEi1UBoX8XoahbCDVe7
   jR+OASEKWzSWkhIx7TGvWUUVbmfeni/46zDX63NTODtKgbofN5R6unR5I
   f4R1zH5BnJGDo+Hx0kHUjtXFtwJVykxj2QZcvK95gKa4bC9U8TBxbSNyg
   kiTydH8g/kr1UV/Sit+swPZPMuR1sLft4X0aiAA61ctzGEQ8UoSEL8tks
   RPcViAlyCJMs2CVXDL4wIJxhvg0KAmz1EWJsW+pdWJT5UoVPKaH9M7Lfm
   A==;
X-CSE-ConnectionGUID: qY/jL040SjyUhHE/jE+PNQ==
X-CSE-MsgGUID: JT98hxK+SAyhy60XSEsr/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3119652"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3119652"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 14:29:04 -0800
X-CSE-ConnectionGUID: B9f1lsD/RKKVqMEMQnGrkQ==
X-CSE-MsgGUID: DjcvxJ2bSG2JtRUlFRiFlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="10288450"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 11 Nov 2026 14:29:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRGoP-000000000f9-1L5M;
	Wed, 11 Nov 2026 22:29:01 +0000
Date: Wed, 11 Nov 2026 23:28:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 87/242]
 arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611112320.87lK2DD9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   c46abf5713fa41e1574fb50c462f53392d6f5cd7
commit: da04d8c50639d4def50d7e2effd6cdbefa3c9226 [87/242] arm64: dts: apple: t6030: Add more hardware
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261111/202611112320.87lK2DD9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611112320.87lK2DD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611112320.87lK2DD9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6030.dtsi:582.28-586.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:588.32-592.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: smc@36c400000 (apple,t6030-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6030-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/smc@36c400000: failed to match any schema with compatible: ['apple,t6030-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/smc@36c400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
--
   arch/arm64/boot/dts/apple/t6030.dtsi:582.28-586.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:588.32-592.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: smc@36c400000 (apple,t6030-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6030-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/smc@36c400000: failed to match any schema with compatible: ['apple,t6030-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/smc@36c400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
