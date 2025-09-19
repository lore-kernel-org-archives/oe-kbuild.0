Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172C62F3600
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274708; cv=none; b=SQmIE1TbCDmIQmFYbT2lyxCItawFUKANZig38ijB3yFYDGTweIBZAvfMEnVIL+MYAw2W133LMuJxWh28YY1uzCAzgofK3TXNaSKBNYGjHoNGrHJOAPc7/wvKpXft9+RV8QMLDLPtjvl87R35LHVQ6pMePT/PB9ICVnJ0ratb7Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274708; c=relaxed/simple;
	bh=ZjIsO1XSwsUpZGCAjuXvNT8L+qpY//avVwWyaP9pObY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LpEHw7cO79CTgoFqKNuFi9TaZPYZbSmbX/8LkQ0uD+OeaCcjmcvvnV90iY3+Aav46ftMQO0oCXiH6uMInl5r02yqjPm2t4vVnFlmnQjYrrJ7B00i+JjS4GgnSzpJ6tNdau+EyYVvNnwlOeH/3CHPYm1g7zGkXb6HJ5USFB4v3kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WC+4/gZd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WC+4/gZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758274697; x=1789810697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZjIsO1XSwsUpZGCAjuXvNT8L+qpY//avVwWyaP9pObY=;
  b=WC+4/gZdX/eSjPrFU+GVQW9uY1Zec1gAafJT4MpxaM9/f7hInK1AERYA
   mklQ0IQdwlrp0o8aGqnFPX/yrS5NLWjx/CL+iQutD2pRX6sF8uRd1M00I
   4LuYUmz5jenw4kVafsYIIdHOBee+GsairoiGYFlsZjbEzZ8Eice75C0O5
   kvGbFcgABXWMbhnJKUVlVCNzeffpVZIp6a8f/+N9OISAg7NV2A8x+MUGi
   HscfMA1SBWHA8/XJQ7Hn4mUn/vOsvOHNhFHDv5UHEMQOdRZG2+sLM6w6q
   ERatUKiOxjHO0HmWXGngdzQqrffEHGbZFjcHcNJHo6DFvkBj/fogRWzRE
   g==;
X-CSE-ConnectionGUID: g97O2CVMRMqpkXOa6dYPdw==
X-CSE-MsgGUID: OxubiYZ+R7KHEudg/zAfiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60315093"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="60315093"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 02:38:17 -0700
X-CSE-ConnectionGUID: c8348CSLTGuLTKBdNdFMJg==
X-CSE-MsgGUID: 1fiE/dQIRTuS6yI+4Y7rlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="206551567"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Sep 2025 02:38:14 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzXZD-0004AV-30;
	Fri, 19 Sep 2025 09:38:11 +0000
Date: Fri, 19 Sep 2025 17:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 7/7] arm64: dts: exynos990: Add HSI2C nodes for
 PERIC0/1
Message-ID: <202509191730.A5LjlKk2-lkp@intel.com>
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
In-Reply-To: <20250917-perics-add-usinodes-v3-7-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-7-a3629e4666ef@gmail.com>
TO: Denzeel Oliva <wachiturroxd150@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Sam Protsenko <semen.protsenko@linaro.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Andi Shyti <andi.shyti@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: Denzeel Oliva <wachiturroxd150@gmail.com>

Hi Denzeel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 98ee0e036cfedf543c4728a604fd7870d0000efd]

url:    https://github.com/intel-lab-lkp/linux/commits/Denzeel-Oliva/dt-bindings-soc-samsung-exynos-sysreg-Add-Exynos990-PERIC0-1-compatibles/20250918-050906
base:   98ee0e036cfedf543c4728a604fd7870d0000efd
patch link:    https://lore.kernel.org/r/20250917-perics-add-usinodes-v3-7-a3629e4666ef%40gmail.com
patch subject: [PATCH v3 7/7] arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250918 (https://download.01.org/0day-ci/archive/20250919/202509191730.A5LjlKk2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191730.A5LjlKk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509191730.A5LjlKk2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105500c0 (samsung,exynos990-usi): i2c@10550000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10550000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105500c0/i2c@10550000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105600c0 (samsung,exynos990-usi): i2c@10560000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10560000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105600c0/i2c@10560000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105700c0 (samsung,exynos990-usi): i2c@10570000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10570000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105700c0/i2c@10570000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105800c0 (samsung,exynos990-usi): i2c@10580000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10580000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105800c0/i2c@10580000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105900c0 (samsung,exynos990-usi): i2c@10590000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10590000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105900c0/i2c@10590000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105a00c0 (samsung,exynos990-usi): i2c@105a0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105a00c0/i2c@105a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105b00c0 (samsung,exynos990-usi): i2c@105b0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105b00c0/i2c@105b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105c00c0 (samsung,exynos990-usi): i2c@105c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105c00c0/i2c@105c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105d00c0 (samsung,exynos990-usi): i2c@105d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105d00c0/i2c@105d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105e00c0 (samsung,exynos990-usi): i2c@105e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105e00c0/i2c@105e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@105f00c0 (samsung,exynos990-usi): i2c@105f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@105f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@105f00c0/i2c@105f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106000c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106000c0 (samsung,exynos990-usi): i2c@10600000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10600000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106000c0/i2c@10600000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106300c0 (samsung,exynos990-usi): i2c@10630000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10630000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106300c0/i2c@10630000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106400c0 (samsung,exynos990-usi): i2c@10640000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10640000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106400c0/i2c@10640000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106500c0 (samsung,exynos990-usi): i2c@10650000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10650000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106500c0/i2c@10650000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106600c0 (samsung,exynos990-usi): i2c@10660000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10660000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106600c0/i2c@10660000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106700c0 (samsung,exynos990-usi): i2c@10670000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10670000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106700c0/i2c@10670000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@106800c0 (samsung,exynos990-usi): i2c@10680000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10680000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@106800c0/i2c@10680000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108a00c0 (samsung,exynos990-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108b00c0 (samsung,exynos990-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108c00c0 (samsung,exynos990-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108d00c0 (samsung,exynos990-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108e00c0 (samsung,exynos990-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@108f00c0 (samsung,exynos990-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@108f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109000c0 (samsung,exynos990-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10900000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109100c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109100c0 (samsung,exynos990-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10910000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109200c0 (samsung,exynos990-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10920000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109300c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109300c0 (samsung,exynos990-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10930000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109400c0 (samsung,exynos990-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10940000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109500c0 (samsung,exynos990-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10950000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109c00c0 (samsung,exynos990-usi): i2c@109c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@109c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109c00c0/i2c@109c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109d00c0 (samsung,exynos990-usi): i2c@109d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@109d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109d00c0/i2c@109d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109600c0 (samsung,exynos990-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10960000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109700c0 (samsung,exynos990-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10970000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109900c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109a00c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109a00c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109e00c0 (samsung,exynos990-usi): i2c@109e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@109e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109e00c0/i2c@109e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: usi@109f00c0 (samsung,exynos990-usi): i2c@109f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: i2c@109f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/usi@109f00c0/i2c@109f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
--
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105500c0 (samsung,exynos990-usi): i2c@10550000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10550000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105500c0/i2c@10550000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105600c0 (samsung,exynos990-usi): i2c@10560000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10560000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105600c0/i2c@10560000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105700c0 (samsung,exynos990-usi): i2c@10570000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10570000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105700c0/i2c@10570000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105800c0 (samsung,exynos990-usi): i2c@10580000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10580000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105800c0/i2c@10580000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105900c0 (samsung,exynos990-usi): i2c@10590000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10590000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105900c0/i2c@10590000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105a00c0 (samsung,exynos990-usi): i2c@105a0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105a00c0/i2c@105a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105b00c0 (samsung,exynos990-usi): i2c@105b0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105b00c0/i2c@105b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105c00c0 (samsung,exynos990-usi): i2c@105c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105c00c0/i2c@105c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105d00c0 (samsung,exynos990-usi): i2c@105d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105d00c0/i2c@105d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105e00c0 (samsung,exynos990-usi): i2c@105e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105e00c0/i2c@105e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@105f00c0 (samsung,exynos990-usi): i2c@105f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@105f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@105f00c0/i2c@105f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106000c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106000c0 (samsung,exynos990-usi): i2c@10600000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10600000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106000c0/i2c@10600000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106300c0 (samsung,exynos990-usi): i2c@10630000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10630000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106300c0/i2c@10630000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106400c0 (samsung,exynos990-usi): i2c@10640000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10640000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106400c0/i2c@10640000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106500c0 (samsung,exynos990-usi): i2c@10650000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10650000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106500c0/i2c@10650000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106600c0 (samsung,exynos990-usi): i2c@10660000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10660000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106600c0/i2c@10660000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106700c0 (samsung,exynos990-usi): i2c@10670000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10670000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106700c0/i2c@10670000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@106800c0 (samsung,exynos990-usi): i2c@10680000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10680000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@106800c0/i2c@10680000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108a00c0 (samsung,exynos990-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108b00c0 (samsung,exynos990-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108c00c0 (samsung,exynos990-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108d00c0 (samsung,exynos990-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108e00c0 (samsung,exynos990-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@108f00c0 (samsung,exynos990-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@108f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109000c0 (samsung,exynos990-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10900000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109100c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109100c0 (samsung,exynos990-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10910000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109200c0 (samsung,exynos990-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10920000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109300c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109300c0 (samsung,exynos990-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10930000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109400c0 (samsung,exynos990-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10940000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109500c0 (samsung,exynos990-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10950000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109c00c0 (samsung,exynos990-usi): i2c@109c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@109c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109c00c0/i2c@109c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109d00c0 (samsung,exynos990-usi): i2c@109d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@109d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109d00c0/i2c@109d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109600c0 (samsung,exynos990-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10960000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109700c0 (samsung,exynos990-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10970000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109900c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109a00c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109a00c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109e00c0 (samsung,exynos990-usi): i2c@109e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@109e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109e00c0/i2c@109e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: usi@109f00c0 (samsung,exynos990-usi): i2c@109f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: i2c@109f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/usi@109f00c0/i2c@109f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
--
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105500c0 (samsung,exynos990-usi): i2c@10550000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10550000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105500c0/i2c@10550000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105600c0 (samsung,exynos990-usi): i2c@10560000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10560000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105600c0/i2c@10560000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105700c0 (samsung,exynos990-usi): i2c@10570000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10570000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105700c0/i2c@10570000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105800c0 (samsung,exynos990-usi): i2c@10580000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10580000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105800c0/i2c@10580000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105900c0 (samsung,exynos990-usi): i2c@10590000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10590000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105900c0/i2c@10590000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105a00c0 (samsung,exynos990-usi): i2c@105a0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105a00c0/i2c@105a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105b00c0 (samsung,exynos990-usi): i2c@105b0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105b00c0/i2c@105b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105c00c0 (samsung,exynos990-usi): i2c@105c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105c00c0/i2c@105c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105d00c0 (samsung,exynos990-usi): i2c@105d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105d00c0/i2c@105d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105e00c0 (samsung,exynos990-usi): i2c@105e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105e00c0/i2c@105e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@105f00c0 (samsung,exynos990-usi): i2c@105f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@105f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@105f00c0/i2c@105f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106000c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106000c0 (samsung,exynos990-usi): i2c@10600000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10600000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106000c0/i2c@10600000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106300c0 (samsung,exynos990-usi): i2c@10630000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10630000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106300c0/i2c@10630000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106400c0 (samsung,exynos990-usi): i2c@10640000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10640000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106400c0/i2c@10640000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106500c0 (samsung,exynos990-usi): i2c@10650000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10650000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106500c0/i2c@10650000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106600c0 (samsung,exynos990-usi): i2c@10660000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10660000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106600c0/i2c@10660000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106700c0 (samsung,exynos990-usi): i2c@10670000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10670000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106700c0/i2c@10670000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@106800c0 (samsung,exynos990-usi): i2c@10680000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10680000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@106800c0/i2c@10680000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108a00c0 (samsung,exynos990-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108b00c0 (samsung,exynos990-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108c00c0 (samsung,exynos990-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108d00c0 (samsung,exynos990-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108e00c0 (samsung,exynos990-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@108f00c0 (samsung,exynos990-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@108f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109000c0 (samsung,exynos990-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10900000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109100c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109100c0 (samsung,exynos990-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10910000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109200c0 (samsung,exynos990-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10920000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109300c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109300c0 (samsung,exynos990-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10930000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109400c0 (samsung,exynos990-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10940000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109500c0 (samsung,exynos990-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10950000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109c00c0 (samsung,exynos990-usi): i2c@109c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@109c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109c00c0/i2c@109c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109d00c0 (samsung,exynos990-usi): i2c@109d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@109d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109d00c0/i2c@109d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109600c0 (samsung,exynos990-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10960000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109700c0 (samsung,exynos990-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10970000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109900c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109a00c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109a00c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109e00c0 (samsung,exynos990-usi): i2c@109e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@109e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109e00c0/i2c@109e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: usi@109f00c0 (samsung,exynos990-usi): i2c@109f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: i2c@109f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/usi@109f00c0/i2c@109f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
--
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105500c0 (samsung,exynos990-usi): i2c@10550000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10550000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105500c0/i2c@10550000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105600c0 (samsung,exynos990-usi): i2c@10560000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10560000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105600c0/i2c@10560000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105700c0 (samsung,exynos990-usi): i2c@10570000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10570000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105700c0/i2c@10570000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105800c0 (samsung,exynos990-usi): i2c@10580000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10580000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105800c0/i2c@10580000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105900c0 (samsung,exynos990-usi): i2c@10590000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10590000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105900c0/i2c@10590000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105a00c0 (samsung,exynos990-usi): i2c@105a0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105a00c0/i2c@105a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105b00c0 (samsung,exynos990-usi): i2c@105b0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105b00c0/i2c@105b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105c00c0 (samsung,exynos990-usi): i2c@105c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105c00c0/i2c@105c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105d00c0 (samsung,exynos990-usi): i2c@105d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105d00c0/i2c@105d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105e00c0 (samsung,exynos990-usi): i2c@105e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105e00c0/i2c@105e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@105f00c0 (samsung,exynos990-usi): i2c@105f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@105f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@105f00c0/i2c@105f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106000c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106000c0 (samsung,exynos990-usi): i2c@10600000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10600000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106000c0/i2c@10600000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106300c0 (samsung,exynos990-usi): i2c@10630000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10630000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106300c0/i2c@10630000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106400c0 (samsung,exynos990-usi): i2c@10640000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10640000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106400c0/i2c@10640000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106500c0 (samsung,exynos990-usi): i2c@10650000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10650000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106500c0/i2c@10650000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106600c0 (samsung,exynos990-usi): i2c@10660000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10660000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106600c0/i2c@10660000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106700c0 (samsung,exynos990-usi): i2c@10670000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10670000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106700c0/i2c@10670000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@106800c0 (samsung,exynos990-usi): i2c@10680000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10680000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@106800c0/i2c@10680000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108a00c0 (samsung,exynos990-usi): i2c@108a0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108a0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108a00c0/i2c@108a0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108b00c0 (samsung,exynos990-usi): i2c@108b0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108b0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108b00c0/i2c@108b0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108c00c0 (samsung,exynos990-usi): i2c@108c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108c00c0/i2c@108c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108d00c0 (samsung,exynos990-usi): i2c@108d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108d00c0/i2c@108d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108e00c0 (samsung,exynos990-usi): i2c@108e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108e00c0/i2c@108e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@108f00c0 (samsung,exynos990-usi): i2c@108f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@108f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@108f00c0/i2c@108f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109000c0 (samsung,exynos990-usi): i2c@10900000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10900000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109000c0/i2c@10900000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109100c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109100c0 (samsung,exynos990-usi): i2c@10910000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10910000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109100c0/i2c@10910000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109200c0 (samsung,exynos990-usi): i2c@10920000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10920000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109200c0/i2c@10920000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109300c0 (samsung,exynos990-usi): 'rsnges' does not match any of the regexes: '^i2c@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^serial@[0-9a-f]+$', '^spi@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109300c0 (samsung,exynos990-usi): i2c@10930000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10930000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109300c0/i2c@10930000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109400c0 (samsung,exynos990-usi): i2c@10940000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10940000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109400c0/i2c@10940000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109500c0 (samsung,exynos990-usi): i2c@10950000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10950000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109500c0/i2c@10950000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109c00c0 (samsung,exynos990-usi): i2c@109c0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@109c0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109c00c0/i2c@109c0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109d00c0 (samsung,exynos990-usi): i2c@109d0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@109d0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109d00c0/i2c@109d0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109600c0 (samsung,exynos990-usi): i2c@10960000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10960000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109600c0/i2c@10960000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109700c0 (samsung,exynos990-usi): i2c@10970000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10970000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109700c0/i2c@10970000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109900c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109900c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109a00c0 (samsung,exynos990-usi): i2c@10990000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
   arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@10990000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109a00c0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109e00c0 (samsung,exynos990-usi): i2c@109e0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@109e0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109e00c0/i2c@109e0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: usi@109f00c0 (samsung,exynos990-usi): i2c@109f0000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: i2c@109f0000 (samsung,exynos990-hsi2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c'] is too long
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5250-hsi2c', 'samsung,exynos5260-hsi2c', 'samsung,exynos7-hsi2c', 'samsung,exynos8895-hsi2c', 'samsung,exynosautov9-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['samsung,exynos5433-hsi2c', 'samsung,exynos7870-hsi2c', 'tesla,fsd-hsi2c']
   	'samsung,exynos990-hsi2c' is not one of ['google,gs101-hsi2c', 'samsung,exynos2200-hsi2c', 'samsung,exynos850-hsi2c']
   	'samsung,exynos5-hsi2c' was expected
   	'samsung,exynos7-hsi2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-exynos5.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/usi@109f00c0/i2c@109f0000: failed to match any schema with compatible: ['samsung,exynos990-hsi2c', 'samsung,exynosautov9-hsi2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
