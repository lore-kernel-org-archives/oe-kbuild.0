Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF972E284D
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Aug 2025 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755725360; cv=none; b=VBTv9D1E5Tjn9zV1CADiPPCYdpw0rJIeHXoXLj0bzpGvtOggi1in3o+ogCAil9pcoo5Tjj1d0LRGsSqU2AVJCb5UHqOkAxmlos25pgsTbFWh60Xy6rSIP2C8y1VF47NqLx47abX0qWXMmaVCvPD07RtOybTxX8iBPqqKVCELwG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755725360; c=relaxed/simple;
	bh=ACz4cAyOwePYk86mxlzCNgGqDRyZzlo+4z2Lg9oewmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkuotuLTj7vhKMeBLTfS+Ls/EtrTiafR4QLMz3ROqopemRBy9NhB7v6qTZuSKthZNArBScWRdtoZIuvUqGw4ZBc7OM38qfQUH4ptorxqktLjgGEFHl6E8iB1ABXFY0zTpKn6GOUBgANt4eI8UssFRH5xCsdl/7zzu1DI0JIwFDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9PJjDiI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9PJjDiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755725359; x=1787261359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ACz4cAyOwePYk86mxlzCNgGqDRyZzlo+4z2Lg9oewmM=;
  b=D9PJjDiI7ncklG7tQ41N4IyDrdO0Ns1vazZ9bRZvY3NtPZ6ZujuFfhRM
   dGWvXZamJb0MnmPQSK3Bm9twe6EmL+/c3rMfbzokiJbT/9Pd+bBPsgCHQ
   lDxTUmuSmo+qNgcRxoWzF7JvYOJQpYujtNXTzgEpF6alu2pptaVuUXvo6
   mkCLrXaF/6V9j8zpCMK2aAD1AJU+SthEL0QVp3Nm074NNqphEvMku8gYa
   eXjPNHOGICbPtqm9AA+Dy23TQpal0Ub4T/t2xNSdyulK0cYRW+/PmYgVy
   R8JvdTsWeDBcGLCylLqxWKevKfGuGxqAe8OfVO5T9FoAaylAxbwEwvEOK
   Q==;
X-CSE-ConnectionGUID: tMFyPXl5TY2oSp2CGwh07Q==
X-CSE-MsgGUID: hFZrL2S1T4q1o/DtApWldQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="60632044"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="60632044"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 14:29:18 -0700
X-CSE-ConnectionGUID: TjgyW6rLSEiSuy/p9chD3w==
X-CSE-MsgGUID: 7IrhEd/aQyeCTlfywt9P0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168640338"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 Aug 2025 14:29:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoqMs-000Jgx-1W;
	Wed, 20 Aug 2025 21:29:14 +0000
Date: Thu, 21 Aug 2025 05:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/6] input: dt-bindings: ti,twl4030-keypad: convert to
 DT schema
Message-ID: <202508210542.04dLBy9E-lkp@intel.com>
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
In-Reply-To: <20250816021523.167049-4-jihed.chaibi.dev@gmail.com>
References: <20250816021523.167049-4-jihed.chaibi.dev@gmail.com>
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
[also build test WARNING on dtor-input/next dtor-input/for-linus linus/master v6.17-rc2 next-20250820]
[cannot apply to lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jihed-Chaibi/dt-bindings-mfd-twl-Add-missing-sub-nodes-for-TWL4030-TWL603x/20250816-102205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250816021523.167049-4-jihed.chaibi.dev%40gmail.com
patch subject: [PATCH v3 3/6] input: dt-bindings: ti,twl4030-keypad: convert to DT schema
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-051-20250817 (https://download.01.org/0day-ci/archive/20250821/202508210542.04dLBy9E-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210542.04dLBy9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508210542.04dLBy9E-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/1w@480b2000: failed to match any schema with compatible: ['ti,omap2420-1w']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[6]], 'usb1v8-supply': [[7]], 'usb3v1-supply': [[4]], 'usb_mode': [1], '#phy-cells': 0} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap2-venc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: l4_wkup@49000000 (ti,omap2-l4-wkup): $nodename:0: 'l4_wkup@49000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000: failed to match any schema with compatible: ['ti,omap2-l4-wkup', 'simple-bus']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000: failed to match any schema with compatible: ['ti,omap2-prcm']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/prcm@6000/clocks/dpll_ck@500: failed to match any schema with compatible: ['ti,omap2-dpll-core-clock']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
