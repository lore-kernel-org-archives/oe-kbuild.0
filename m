Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF8E322A2E
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755599762; cv=none; b=UokacZbwbYs9ZUIJMu1rpHtlrQ7r9+El5p8ilOxbqtVLOCt/htebqpiIxrOurViFM6MXFe7HN1+FvOceKMNSISxU/S5PceAXjwMSSACWQOnzub1jj+wwLOLkvjGAGBDOpeX3aiCwrfqpRGi3OcCXLv7fa7/eprjZQYN5ue3Jl/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755599762; c=relaxed/simple;
	bh=tatqhZ+09LlY+yMrsDUVHQUFt0AEoaB8lJrE5u9zEko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkSMHLkpb6g9sAeqT+CDmwdCsXyhbV6e3bHexcM8lN8EjlW24eDsxsSpCqHhPQNN86q+KusbIYW7PaLvyFsmP/kUkn/ZUHkbDn0qvG+utkEsRg2dmPhJbUxa8Esy31jY6Xh3pi4rOLEaomACiEeoailXvo6TPTDZt2UynelKips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxPbS9Gw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxPbS9Gw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755599761; x=1787135761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tatqhZ+09LlY+yMrsDUVHQUFt0AEoaB8lJrE5u9zEko=;
  b=kxPbS9GwNPIC3Usk9uWDpiaL/Ko2/AZtBS5YaaJWt24vFzDl1TTlAGx1
   teT41kCTpr+jpw3VoZFBQqYymjqd6xCkxRNno/u92w4YViKdyZuh5+iw9
   C2T4aLn1aA5qqZ1jUlfIWbkK03h4CiB5PL97AUuM2br00ViG4qRbFPCjx
   PLFIog2ME7hYebL8AJVgJguTFsOSlgU7LaOoaYI3Ph7FerJ5qsTfhPs91
   oYxUmAZR4n+ULWsMC1IxUV5GWetqjpVvfBAUrSjz2Zvxnrvb6wGyAErlx
   Ajc0iSL3FdJLp1S4ScpBX66OCoa9oa6Y6uUgZXNEIpaSeTvG9AWq26OP5
   A==;
X-CSE-ConnectionGUID: yFlR+AQ9Q56bKSXlDMj5pQ==
X-CSE-MsgGUID: cB/naEl+SSeM/PGVfhcrnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="83264732"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="83264732"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 03:36:00 -0700
X-CSE-ConnectionGUID: Kp4mvpasQKyt4EfJVzBmkQ==
X-CSE-MsgGUID: ylU6AlbrS92GPtfdyfbGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167320722"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2025 03:35:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoJh2-000Gkw-2H;
	Tue, 19 Aug 2025 10:35:55 +0000
Date: Tue, 19 Aug 2025 18:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/6] dt-bindings: mfd: twl: Add missing sub-nodes for
 TWL4030 & TWL603x
Message-ID: <202508191602.TsZdPLgN-lkp@intel.com>
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
In-Reply-To: <20250816021523.167049-2-jihed.chaibi.dev@gmail.com>
References: <20250816021523.167049-2-jihed.chaibi.dev@gmail.com>
TO: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
TO: linux-kernel@vger.kernel.org
CC: andreas@kemnade.info
CC: peter.ujfalusi@gmail.com
CC: dmitry.torokhov@gmail.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: lgirdwood@gmail.com
CC: tiwai@suse.com
CC: conor+dt@kernel.org
CC: lee@kernel.org
CC: ukleinek@kernel.org
CC: broonie@kernel.org
CC: gregkh@linuxfoundation.org
CC: linus.walleij@linaro.org
CC: brgl@bgdev.pl
CC: aaro.koskinen@iki.fi
CC: khilman@baylibre.com
CC: rogerq@kernel.org
CC: tony@atomide.com
CC: linux-gpio@vger.kernel.org
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: shuah@kernel.org
CC: jihed.chaibi.dev@gmail.com

Hi Jihed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on dtor-input/next dtor-input/for-linus linus/master v6.17-rc2 next-20250818]
[cannot apply to lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jihed-Chaibi/dt-bindings-mfd-twl-Add-missing-sub-nodes-for-TWL4030-TWL603x/20250816-102205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250816021523.167049-2-jihed.chaibi.dev%40gmail.com
patch subject: [PATCH v3 1/6] dt-bindings: mfd: twl: Add missing sub-nodes for TWL4030 & TWL603x
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250817 (https://download.01.org/0day-ci/archive/20250819/202508191602.TsZdPLgN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508191602.TsZdPLgN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508191602.TsZdPLgN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[6]], 'usb1v8-supply': [[7]], 'usb3v1-supply': [[4]], 'usb_mode': [1], '#phy-cells': 0} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap2-venc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: l4_wkup@49000000 (ti,omap2-l4-wkup): $nodename:0: 'l4_wkup@49000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000: failed to match any schema with compatible: ['ti,omap2-l4-wkup', 'simple-bus']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
