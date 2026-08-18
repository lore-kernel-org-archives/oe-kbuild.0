Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61703376A0B
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069755; cv=none; b=DHIzOXx0M5Kjrqct7ee87478pbUz8xsPh3WqXXun3N37P9TD6ROldKqZp73JtmAJR4tnXVWMEv8lE6dJNZruf9jz7MTT+E80wjz6kMaies63NzHssffQ7OYx1tFpY+dPVrXvUhS3XBW5CyGc+N2/Zoq2xkrhgFL/HGbhtenHG2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069755; c=relaxed/simple;
	bh=PXJ2a0dDofQyX+yhKk2yljHS8FCOJTBd3ZuJD0k3VwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sYKFxrCWgTR5ry7iJpbDBtBqJVVJ3aPzNnwpUTkCYudk9vNCDyC+2d9gJobq0J7jp4PLqGEbpZelWnGtjKvNa2VSNWCGc3VUIsBgp06KhVYHNUGSSTbph2xkfOzcKIKPrAi6ubkmr97Y7KZtZEc0KaxRUwxIeMx1uMrqg6yy3fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnidwdB7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnidwdB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787069754; x=1818605754;
  h=date:from:to:cc:subject:message-id;
  bh=PXJ2a0dDofQyX+yhKk2yljHS8FCOJTBd3ZuJD0k3VwU=;
  b=lnidwdB7lNDKoZJx/uYRsGnC1+m5rXdO+nLL/UN23b5tDxzDKnJFL9Qx
   wgVhL7ZfBdIK00y0GPz9eS3e7yXc00XFwhrv6d8WkMNDLSWg+Ot9vwjTu
   3Cp+Vg53n/yb2QTHRfJkNH6slXNlDh5m7vJ0iUu97mSqwVNTS4/drSjfq
   TJDcjh5UvGLnz8EXDkEA9ZfhPgM02zl0b8FhIliidoQUUQWvDuIDZlmjc
   nYO2SbEOi2erhsOeOcaBMAR/4iMFx6rk7tjQEN+B+puMors8bDcnAJ83p
   GobTzd2Tdyqf0QpttJH+Gh9wZYaYAhJO/yyfk/Rv06Zi7769WO1AOFzUp
   g==;
X-CSE-ConnectionGUID: MxIPqOKiT9uFQHEqdQ2Zig==
X-CSE-MsgGUID: pe0/p9mYTAmhUbxBCm3B1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87772301"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87772301"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:15:53 -0700
X-CSE-ConnectionGUID: Xa7WADCjRpCKF/i8Avt4VA==
X-CSE-MsgGUID: rh+TLFs/QKeWbaYSlzXNaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="303491249"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 Aug 2026 09:15:52 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwMTe-00000000777-0UUG;
	Tue, 18 Aug 2026 16:15:50 +0000
Date: Tue, 18 Aug 2026 18:14:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/samsung/exynos5250-snow.dtb: sound
 (google,snow-audio-max98095): codec:sound-dai: [[102], [0], [81]] is too long
Message-ID: <202608181841.APpFt1zN-lkp@intel.com>
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
TO: "H. Nikolaus Schaller" <hns@goldelico.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/H-Nikolaus-Schaller/dt-bindings-twl-regulator-Add-bindings-for-exposing-ti-twl4030-regen/20260812-201259
head:   4f5559ad82b8debd2be982b089e18240288940e9
commit: 44971f13cae7486e3643ba685ac319be100b42ae ASoC: dt-bindings: add OpenPandora Sound Card
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-2051-20260816 (https://download.01.org/0day-ci/archive/20260818/202608181841.APpFt1zN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181841.APpFt1zN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608181841.APpFt1zN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/samsung/exynos5250-snow.dtb: fet3: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/samsung/exynos5250-snow.dtb: fet4: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/samsung/exynos5250-snow.dtb: fet5: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/samsung/exynos5250-snow.dtb: fet6: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/samsung/exynos5250-snow.dtb: fet7: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/samsung/exynos5250-snow.dtb: sound (google,snow-audio-max98095): codec:sound-dai: [[102], [0], [81]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/samsung,snow.yaml
>> arch/arm/boot/dts/samsung/exynos5250-snow.dtb: sound (google,snow-audio-max98095): cpu:sound-dai: [[62], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/samsung,snow.yaml
--
   arch/arm/boot/dts/samsung/exynos5250-snow-rev5.dtb: fet3: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/samsung/exynos5250-snow-rev5.dtb: fet4: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/samsung/exynos5250-snow-rev5.dtb: fet5: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/samsung/exynos5250-snow-rev5.dtb: fet6: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/samsung/exynos5250-snow-rev5.dtb: fet7: ti,overcurrent-wait: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/samsung/exynos5250-snow-rev5.dtb: sound (google,snow-audio-max98090): cpu:sound-dai: [[62], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/samsung,snow.yaml
--
   arch/arm/boot/dts/samsung/exynos5420-peach-pit.dtb: /soc/spi@12d40000/cros-ec@0/i2c-tunnel/power-regulator@48: failed to match any schema with compatible: ['ti,tps65090']
>> arch/arm/boot/dts/samsung/exynos5420-peach-pit.dtb: sound (google,snow-audio-max98090): cpu:sound-dai: [[79], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/samsung,snow.yaml
--
   arch/arm/boot/dts/samsung/exynos5800-peach-pi.dtb: /soc/spi@12d40000/cros-ec@0/i2c-tunnel/power-regulator@48: failed to match any schema with compatible: ['ti,tps65090']
>> arch/arm/boot/dts/samsung/exynos5800-peach-pi.dtb: sound (google,snow-audio-max98091): cpu:sound-dai: [[78], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/samsung,snow.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
