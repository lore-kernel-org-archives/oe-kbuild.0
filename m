Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA91D5CFB
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 05:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773983550; cv=none; b=gFymJ21kMGMfbXgDJWPIxoVRcvM1WMNPA3VNDTY7bz3fFqGe5LoB6mDWbQqeKg0plwrQ+DZpLoYnevnfeI2hqFBy42Iszyi/2UA30xpt2Dtbb1is1o78Jwxcqi3L2W+8DzzoFq1VVWnCpbvivQ4SBzRMHUi+1oSHiR8IY4NpxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773983550; c=relaxed/simple;
	bh=ZTVvG2Dtr8bK7bArLhekNHOCBZvOvKu26ZXB175ajQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j+ERR31QccOBqnFY7Qd5UzY58Gv3Qi0+K1F02gdeYjiQfc7qydyXLXZDZc87LuH7vi3G5JJlzNGzmyQOO44zRzeKEkrue+9gIFRoVQDBRaZZeh6kafu+lipVPcErOuTu27YD324T3I1lEPGgPjemdqD/vQnSgexAmSfLOBo82lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d47LM0E/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d47LM0E/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773983549; x=1805519549;
  h=date:from:to:cc:subject:message-id;
  bh=ZTVvG2Dtr8bK7bArLhekNHOCBZvOvKu26ZXB175ajQA=;
  b=d47LM0E/mam/FNDR/dnI5k87fRwbrm/5Gdx6+591YvUVdsctmgK08sNO
   PcAE5zIiOVU4X26qCzlMQE9wjdJfpH9tUwGIa+wfa/rMvQvAtxin1XySV
   UtFiDY+CNu0C2Gp8z8RHGxcRjuxaO8QxDwVjQs2HR2mvkbDmeO+ZA2Q3a
   mVyuQ9o8bKrIfeniXWbE3FC4BY+bfq/NqvUif5YaAAp0vkAJjyYiOiL34
   Ox05V9X9W+aoRMcSWuuIPcwjomr0HEFyaKsX4cdqVpzbx72ICr+U3m8pd
   niG+hT0nBjxPJcX2sVkypOHLFqf+gL82PmyuWZoO8q6Uy/vOl9wDRzt4f
   A==;
X-CSE-ConnectionGUID: GLf6CA8wR9aEC1nA3eAqEA==
X-CSE-MsgGUID: dPMSKgYFRPybNpJDjTlq8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86143337"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86143337"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:12:29 -0700
X-CSE-ConnectionGUID: QlnUjZzPS9OsZI5rcM0paA==
X-CSE-MsgGUID: YVQmaOwvTjCCUDanmlmxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222400094"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 19 Mar 2026 22:12:28 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3S9p-000000004yT-2isN;
	Fri, 20 Mar 2026 05:12:25 +0000
Date: Fri, 20 Mar 2026 06:12:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:bfv-dts-cleanups 1/5]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20120000
 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
Message-ID: <202603200633.J6ElKrHx-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git bfv-dts-cleanups
head:   7d73a5fcff41460198ec33e00e36161328f9019d
commit: 331be17fdd4bafef551dd6359eecda8219518f97 [1/5] riscv: dts: microchip: gpio controllers on mpfs need 2 interrupt cells
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-2051-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200633.J6ElKrHx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200633.J6ElKrHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603200633.J6ElKrHx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20120000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20121000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20122000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-disco-kit.dtb: gpio@20120000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-disco-kit.dtb: gpio@20121000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-disco-kit.dtb: gpio@20122000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: gpio@20120000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: gpio@20121000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: gpio@20122000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dtb: gpio@20120000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dtb: gpio@20121000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dtb: gpio@20122000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
--
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: can@2010c000 (microchip,mpfs-can): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mpfs-can.yaml
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20120000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20121000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20122000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20120000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20121000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20122000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20120000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20121000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20122000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: gpio@20120000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: gpio@20121000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: gpio@20122000 (microchip,mpfs-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
