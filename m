Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2A01D5CEB
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 21:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730843513; cv=none; b=lwgc+mzav/QI0FNr45Lp9NXsQkYHO1AqKJv55bDVYkOuuPwec8aRfOu2Lr9v5TVYb2dhVIhdRLIrS3RBZL8z3RVuR2cLl6neTWzmedS3jbFHMtVI4GqBmOOgx5Ybu/pl6iJHovlWX8S7NiaCCaGBR7qhz1X1bndOe11OZULv/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730843513; c=relaxed/simple;
	bh=bdEs8QwouLkiLnlgoV9SVmlTCOh1x3C6mz3mae44DKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eer4Q4WA9JPuvZGLZJSZH72iGtMAvD6Ri6LaUyqbTbAsr5YNQsRwRLbQggORRLQo+GQ5r7xlfKPSPMPHX/TLzSSS7+tAZuDKs9GJrICdB8XLRFdD8biGVbk0tbm77Pg3OsNdiFtBa54PkwUgGizbuu1PM4/MI1QFEOyJXKsQ9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hsi9qEGN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hsi9qEGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730843512; x=1762379512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bdEs8QwouLkiLnlgoV9SVmlTCOh1x3C6mz3mae44DKc=;
  b=Hsi9qEGNtar90cKSUONgl5z5IACe+eybYeLX/Qe7l3AusaqspfCYsPSo
   sQEnGuG9plkk/y+JLX1+J16G6OgHvlHeNLTEQ6OjH4SZePtBxzj5dP35l
   eur/eI5D1Ehf19pGQfa53OvYlizEGbURbAU4VdsjkDuD21e/6Bi6tnm/9
   0zNxfYds3rqIoUsZbuwDc5nl+J0FUWys+w/CavuIJD0C8YDEJvZ2SXyGt
   RQwsGGjNHremqgP/Jyi3DyOtOAZQao+Kdoqxyvitt8lyy4NIDp/EMCUWg
   qiId9uuSype98hZRBNrrUz9Ozk3IAuEqkJ7hjfrIY+Fr7VnIVi9UmRCY9
   g==;
X-CSE-ConnectionGUID: gY+PKLPIQfuR9hjZfd4DmA==
X-CSE-MsgGUID: Wzq/6DX7TwyMcbq6t0NGCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53185303"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53185303"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 13:51:51 -0800
X-CSE-ConnectionGUID: r1o5jUADQZSO/2h/2nP4/Q==
X-CSE-MsgGUID: oqWQL+fxQy26Gz67AjgfiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="85011159"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2024 13:51:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8RSl-000mVj-2C;
	Tue, 05 Nov 2024 21:51:47 +0000
Date: Wed, 6 Nov 2024 05:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <202411060511.cI4VWUr3-lkp@intel.com>
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
In-Reply-To: <20241105130322.213623-5-markus.burri@mt.com>
References: <20241105130322.213623-5-markus.burri@mt.com>
TO: Markus Burri <markus.burri@mt.com>
TO: linux-kernel@vger.kernel.org
CC: Markus Burri <markus.burri@mt.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Marek Vasut <marek.vasut@gmail.com>
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/for-linus]
[also build test WARNING on robh/for-next linus/master v6.12-rc6 next-20241105]
[cannot apply to dtor-input/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Burri/Input-matrix_keypad-use-fsleep-for-variable-delay-duration/20241105-211348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
patch link:    https://lore.kernel.org/r/20241105130322.213623-5-markus.burri%40mt.com
patch subject: [PATCH v2 4/7] dt-bindings: input: matrix_keypad - add missing property
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: powerpc-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241106/202411060511.cI4VWUr3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060511.cI4VWUr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411060511.cI4VWUr3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11700: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11700: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11800: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11900: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11a00: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11b00: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/pscfifo@11f00: failed to match any schema with compatible: ['fsl,mpc5121-psc-fifo']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/dma@14000: failed to match any schema with compatible: ['fsl,mpc5121-dma']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/axe-base@2000: failed to match any schema with compatible: ['fsl,mpc5121-axe-base']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/axe-app: failed to match any schema with compatible: ['fsl,mpc5121-axe-app']
>> arch/powerpc/boot/dts/ac14xx.dtb: matrix_keypad@0: 'col-gpios-binary', 'col-switch-delay-ms' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
   arch/powerpc/boot/dts/ac14xx.dtb: /pci@80008500: failed to match any schema with compatible: ['fsl,mpc5121-pci']
   arch/powerpc/boot/dts/ac14xx.dtb: leds: 'backlight', 'green', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
