Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DBD31282F
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 22:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766010601; cv=none; b=A1FqhUZrXfCVU8GzPg/MT3Ea0vqbR4Ap7z/aR18RHWryi9MawttLD2ix46HWh7mSwfusyYCnv2CyVqMJyPEbOkf4xA0+SCOUx60uI156rfvZlhwdqnvGhFXIsiMW6t0mkZLJpcAveLxD7x1urqKLCzv1T0xAOWzPS+NoGSq/PfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766010601; c=relaxed/simple;
	bh=lKn0XJgp6PLFo/6X+dJQe68OQZyO5yRrE1bO/k4evHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iOpu89tbxd2BJ4/gN/ZLCtHPTJQeWrB7v+2TsKAAvv3WgLO6GAYDPNmetvwofhEJRyu7vWB5y5Me9njZNtwptfni7KCjywA1y3W+xDFcwCYtOFxfYAYuLGAcuyaq7v8c5/zUP/9a0xe+DYSX3VKMwf0pFi9qqF3LFs1G5yMFa90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f86ZqhMv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f86ZqhMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766010600; x=1797546600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKn0XJgp6PLFo/6X+dJQe68OQZyO5yRrE1bO/k4evHQ=;
  b=f86ZqhMvHcqiSwl3wRpMLKYucdMkiip9DgPsI+KV/rMgycVkM3GYOt4S
   LEXKei9ZNzqN+L/Ds8x5iHshG0VGVxDBsHkGAlnpibeF0rzlSN8FwnQZZ
   3d6yPCWZN7c3YIMYmZke0iihX0AnXjhgtzrDvpBWQ9FN9PoQADHj5bBIe
   dDS5ID343kyi0aISDvTo+tE5ajWK0HAVrZmAmsTQzXk5MXsH60XGftars
   QEsjQ2WkGbFyncYk3WI8R39rVvqqmEgKMD1dpJKYPrJwjqCPZIEZOhVP8
   v1rzsJ8WCWxgTB79S+TC3pBdzVzVXlDvOk2G87R+PwySaSQmUFynvoKq6
   g==;
X-CSE-ConnectionGUID: jDtC7Z8+SPCZtINGhVV45A==
X-CSE-MsgGUID: zk/1hVA+QraOI0h2UU4CsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71589756"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71589756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 14:29:59 -0800
X-CSE-ConnectionGUID: 9Z6w7AA5Q2uxYEXlULCw4g==
X-CSE-MsgGUID: 63QoeysyR86zkBf3cRAqqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229108779"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2025 14:29:59 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW01s-000000003gu-06kX;
	Wed, 17 Dec 2025 22:29:56 +0000
Date: Wed, 17 Dec 2025 23:29:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/4] dt-bindings: media: i2c: et8ek8: document missing
 crc as optional property
Message-ID: <202512172340.R8EWPDx9-lkp@intel.com>
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
In-Reply-To: <ddb6f986cb54e513ba508fa28fc9d2c8df0e2987.1765782992.git.alex.t.tran@gmail.com>
References: <ddb6f986cb54e513ba508fa28fc9d2c8df0e2987.1765782992.git.alex.t.tran@gmail.com>
TO: Alex Tran <alex.t.tran@gmail.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Pavel Machek <pavel@kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Alex Tran <alex.t.tran@gmail.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master linus/master v6.19-rc1 next-20251216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Tran/media-i2c-et8ek8-et8ek8_driver-add-support-for-crc-configuration-via-device-tree/20251215-160804
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/ddb6f986cb54e513ba508fa28fc9d2c8df0e2987.1765782992.git.alex.t.tran%40gmail.com
patch subject: [PATCH v2 2/4] dt-bindings: media: i2c: et8ek8: document missing crc as optional property
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2052-20251215 (https://download.01.org/0day-ci/archive/20251217/202512172340.R8EWPDx9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172340.R8EWPDx9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512172340.R8EWPDx9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): power:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,twl4030-power-n900', 'ti,twl4030-power-idle-osc-off'] is too long
   	'ti,twl4030-power-n900' is not one of ['ti,twl4030-power', 'ti,twl4030-power-reset', 'ti,twl4030-power-idle', 'ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-omap3-sdp', 'ti,twl4030-power-omap3-ldp', 'ti,twl4030-power-omap3-evm']
   	'ti,twl4030-power-idle-osc-off' was expected
   	'ti,twl4030-power-omap3-evm' was expected
   	'ti,twl4030-power-idle' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-n900', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/led-controller@30: failed to match any schema with compatible: ['adi,adp1653']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/si4713@63: failed to match any schema with compatible: ['silabs,si4713']
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): 'clock-frequency', 'clock-names', 'reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): lens-focus: [[253]] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): lens-focus: [[253]] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): port:endpoint: Unevaluated properties are not allowed ('clock-inv' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): 'reset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: tsc2005@0 (ti,tsc2005): $nodename:0: 'tsc2005@0' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/spi@480ba000/wl1251@0: failed to match any schema with compatible: ['ti,wl1251']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
