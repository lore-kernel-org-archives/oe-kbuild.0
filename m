Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F332324A058
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 18:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757527248; cv=none; b=kxNuDcGnssO0fhLa2aI4lIdRn+RNWgh6QUJ1k+OdTAuNYiKa3tWkGjiajyd5M6r7FT4QGcAi1JMHvoyqrJx4tBNISIbT3NOwTly8nN2Tcl14rg284KLFEztK2nUe2n4Yf3S3aV9OcjST+bdBJN0Fb/r08m5z4RO4noMIadbfLA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757527248; c=relaxed/simple;
	bh=o/sp7jNWT92vB2JtkTB558LQ5NXZuKAlwPXskwZTY24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IoVL6ueOVCpgvtiTDX7Qj/oWeyaPHXHGsFVwm5+36j4lodFjutWvPYm4pBYgkGtWnruyr3qb5DTU6J+mFiKQWm8zqcG7USqUYaylHYUcgNmw0DBNG4iPfb6imNstvqlrvBh0zWUoO+R6ksLpF+8DvEpT6cgY7IjTtwIVEYLs6f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ah0BSlho; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ah0BSlho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757527247; x=1789063247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/sp7jNWT92vB2JtkTB558LQ5NXZuKAlwPXskwZTY24=;
  b=Ah0BSlhoWDdmlRuLCCM4hdk9ABv2teqcDwJchAa6503mX3PiieRvCYT8
   jOmu2Cai/EsnoHiX3RIYtxq37SsrCLbkcwDKGy5H3Ikoy8RAXfSVXfG/k
   5zs64R9Jl7MAYLHgdJduQPAnIOPRQVQkWZvMP3CRhaY8Xxfpoir0vpMmQ
   Zun9uxMkalj6uIhXjKRJcvZLXBt0RsQzKYoSCCpasWg96h1GVAuYGCvad
   FLecZlK5i4tm+/u9cw4MeOEOVikae9yo5pDbZTjcXiYbBxXYwQErMu/I9
   /3sb9T1SkVt4KEc2df9xtnwZFklYUPmmOcE6Tm9TfGvx5AMvErYsDP2p8
   w==;
X-CSE-ConnectionGUID: BSxVWaZ5QOyi9naVPVtL4A==
X-CSE-MsgGUID: APKn314STbCWdq7iaY5vtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63483023"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="63483023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 11:00:47 -0700
X-CSE-ConnectionGUID: KeeRAkPIT5CNNCw+Z993KA==
X-CSE-MsgGUID: VNwxowTGSJu5s/KrPs6itA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="178661078"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2025 11:00:46 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwP7b-0006Br-0O;
	Wed, 10 Sep 2025 18:00:43 +0000
Date: Thu, 11 Sep 2025 02:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: maxtouch: add common
 touchscreen properties
Message-ID: <202509110137.j7PxzqTS-lkp@intel.com>
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
In-Reply-To: <20250909054903.11519-2-clamor95@gmail.com>
References: <20250909054903.11519-2-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Nick Dyer <nick@shmanahar.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Henrik Rydberg <rydberg@bitmath.org>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Linus Walleij <linus.walleij@linaro.org>
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next linus/master v6.17-rc5 next-20250909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-input-maxtouch-add-common-touchscreen-properties/20250909-135223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250909054903.11519-2-clamor95%40gmail.com
patch subject: [PATCH v2 1/2] dt-bindings: input: maxtouch: add common touchscreen properties
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-053-20250909 (https://download.01.org/0day-ci/archive/20250911/202509110137.j7PxzqTS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110137.j7PxzqTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509110137.j7PxzqTS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: tmp105@48 (ti,tmp105): interrupts-extended: False schema does not allow [[114, 18, 2], [111, 334]]
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: tmp105@48 (ti,tmp105): interrupts-extended: [[114, 18, 2], [111, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/led-controller@38: failed to match any schema with compatible: ['ti,lm3532']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: touchscreen@4a (atmel,maxtouch): interrupts-extended: [[114, 23, 8], [111, 352]] is too long
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: touchscreen@4a (atmel,maxtouch): Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended' were unexpected)
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/regulator: failed to match any schema with compatible: ['motorola,mapphone-cpcap-regulator']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/rtc: failed to match any schema with compatible: ['motorola,cpcap-rtc']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: tmp105@48 (ti,tmp105): interrupts-extended: False schema does not allow [[114, 18, 2], [111, 334]]
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: tmp105@48 (ti,tmp105): interrupts-extended: [[114, 18, 2], [111, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: tmp105@48 (ti,tmp105): Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/hwmon/lm75.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/led-controller@38: failed to match any schema with compatible: ['ti,lm3532']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: touchscreen@4a (atmel,maxtouch): interrupts-extended: [[114, 23, 8], [111, 352]] is too long
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: touchscreen@4a (atmel,maxtouch): Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended' were unexpected)
   	from schema $id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0: failed to match any schema with compatible: ['motorola,cpcap', 'st,6556002']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/regulator: failed to match any schema with compatible: ['motorola,mapphone-cpcap-regulator']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/rtc: failed to match any schema with compatible: ['motorola,cpcap-rtc']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
