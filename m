Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1011EDA0B
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989174; cv=none; b=i/1PElwTt2J1nw1fyWjNVD3/ezVB6aKjQes8W/ksm6O1OnZb3tFLIgTsWELz3f7FRhdodIkXbTrZATVZBwLl/yObqVPJcO3octbNyUgy1L4o5BhOXKhqSrzyBk/UH9E14aAc6hnI1oEbZo1/z+8417BrfPPMxPTcAiYTPZ4YvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989174; c=relaxed/simple;
	bh=+40L5UZhjbr8mYaMm1gW/ugl/DV1VT72ReNOw93bmiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGW/bW/jqZWV4rrGGlwhzjhFazvDSSDiPup6aEn2bMneiTcMn1dgyS80N4eP213YYGNBaOFkH5yHG53YSjzWvNGrWGeYmRi4rWOprlcE6P241uHtWvlo7ItMfYMOWdZIWDdhnIKi+YTFIPTL5F1pKB2i8ii2+hYHZIlH0bBAyB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E1vcpxAh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1vcpxAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760989171; x=1792525171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+40L5UZhjbr8mYaMm1gW/ugl/DV1VT72ReNOw93bmiw=;
  b=E1vcpxAh4fdbtwLvOaPiIBILcHceU9fRtpynnpd50Eo+PJCW4OTwPy8p
   pjlyWZWEEHZ8zP2UqC0WeKIrhwO6vkDSUNK3Hm1onTrl76cuPi9V2EPTJ
   avf8I0SFnDt3EUIB+OJFIwHzJrTifkoO9zJJUwM/cmFcjVWOfsLQVMwp7
   6opzDO4pyZw1JwUxEzSw4ZtXVWoptm5v5yipjwaVGLNjNQ7NESQOIjG38
   zBnvYZEBKOI7onEwaD8r+I57nypX5ITNqpnZ36OnmVw/Thfp49yrzQ8WT
   EoGpApWOhiaRs4ieMc/syFPfFvm5iyjBhwmhzCiYgjcl81anJguCFp/TI
   w==;
X-CSE-ConnectionGUID: iDQJsT/kTh+3Su4FtohzuA==
X-CSE-MsgGUID: j5lHnazBTtmT9PYRAXCUKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62813839"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="62813839"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 12:39:31 -0700
X-CSE-ConnectionGUID: F7qD/uZgRB29Q+MkcEIx2w==
X-CSE-MsgGUID: sdYyjjQITnKEj6fKDo0emw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="214026677"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Oct 2025 12:39:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAvj5-000A7J-36;
	Mon, 20 Oct 2025 19:39:27 +0000
Date: Tue, 21 Oct 2025 03:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: accelerometer@1d
 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts-extended'
Message-ID: <202510210333.D41drhxK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lothar Rubusch <l.rubusch@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   211ddde0823f1442e4ad052a2f30f050145ccada
commit: ebf0aa3ed1dc94f2f66e19e5ea320eeacbbd518f dt-bindings: iio: accel: adxl345: add interrupt-names
date:   10 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-051-20251020 (https://download.01.org/0day-ci/archive/20251021/202510210333.D41drhxK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210333.D41drhxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510210333.D41drhxK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: cache-controller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml#
>> arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: accelerometer@1d (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts-extended'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: accelerometer@1d (adi,adxl345): interrupts-extended: [[18, 2, 4], [18, 3, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: accelerometer@1d (adi,adxl345): Unevaluated properties are not allowed ('interrupts-extended' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: bus@fec10000 (renesas,bsc-sh73a0): Unevaluated properties are not allowed ('ethernet@10000000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/bus/renesas,bsc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
