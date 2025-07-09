Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665CD22126A
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Jul 2025 17:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752082922; cv=none; b=iJzsgcUECtWRr/VcmCUHTDv9b7EWQP0uXe2r5hU9o2tBEuarL/GfwY2tHG09ecPPgd0dofKbn4NrHGYEeBPtOwDJBAlGiJ0TYErgg1IpY42FdonQMkckMan6V6n6SUOXIO32SS9aGmNh3WOMgUoY7ZBCsK12PIS81GZz5bxA6D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752082922; c=relaxed/simple;
	bh=axeLH8f0c2BgYYOi1NsohpyHxzqvrvH6c7YMv9oU5K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cSuqH0U8mphmmMREL7GMxBAMgeXwjfUkshMAljZ5vo0vGC5ucWlViXR+SHylPb/4XqwlYMKkUu2oyoxyohLEEB79Wgvj74ak2IHPuKIMK2UDRX5Sd2f6GhYxqdHzHYGF8l29xUOUOpdPeecg6RJUC8f3iToegrcC81vZefQUYqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LR1ENhIi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LR1ENhIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752082920; x=1783618920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axeLH8f0c2BgYYOi1NsohpyHxzqvrvH6c7YMv9oU5K0=;
  b=LR1ENhIiryf05x+LFPIXnUpnzxcACMAGp9VUcWV7dhAgBmS32jZOk0pe
   GVVZAYIK6RUiI70sB3fn+PdOJ7mcXGRfRnD6bpETAtTViR7YX69UGr7Qb
   gh2IZp0IfmJ1HF2rv1IptphRfAlrKZ9P0x+0SaqTnvqOTlwg8Cx30kXAg
   iCxvW3dXl64U3xrtDa3gf+QbiCLw5V8DwU/q1vjh8sxSQr230SrDCGhzd
   ZaEuepKVOqaWlP/xzbUoM1tbvZ2ndyP9h79jjuBxQ9VXQxuRDGzR2EUw8
   5WSai7GTp/BsePG86I6Tt0mwR98iTWa4LVbjuqMTltv1LF2Rxxz6tKc4v
   Q==;
X-CSE-ConnectionGUID: iSzEMVhvTmqla0j7hWesWQ==
X-CSE-MsgGUID: Fbtc2zxcTf2d8uEscon6NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64609567"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="64609567"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 10:42:00 -0700
X-CSE-ConnectionGUID: +NtwN5O/TfG4VJlIzTK4tg==
X-CSE-MsgGUID: WOi3qmgwQk+5jAGV7+wkHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="160369551"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2025 10:41:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZYns-0003qR-1H;
	Wed, 09 Jul 2025 17:41:56 +0000
Date: Thu, 10 Jul 2025 01:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 7/7] ARM: dts: sunxi: add support for NetCube Systems
 Nagami Keypad Carrier
Message-ID: <202507100101.1oZvFQvE-lkp@intel.com>
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
In-Reply-To: <20250705213900.3614963-8-lukas.schmid@netcube.li>
References: <20250705213900.3614963-8-lukas.schmid@netcube.li>
TO: Lukas Schmid <lukas.schmid@netcube.li>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
TO: Maxime Ripard <mripard@kernel.org>
CC: Lukas Schmid <lukas.schmid@netcube.li>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Hi Lukas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16-rc5 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Schmid/dt-bindings-arm-sunxi-Add-NetCube-Systems-Nagami-SoM/20250706-054253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250705213900.3614963-8-lukas.schmid%40netcube.li
patch subject: [PATCH v1 7/7] ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-054-20250706 (https://download.01.org/0day-ci/archive/20250710/202507100101.1oZvFQvE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100101.1oZvFQvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507100101.1oZvFQvE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: dcxo-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: gpio@20 (microchip,mcp23008): Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml#
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: usb@4100000 (allwinner,sun20i-d1-musb): dr_mode:0: 'device' is not one of ['host', 'otg', 'peripheral']
   	from schema $id: http://devicetree.org/schemas/usb/allwinner,sun4i-a10-musb.yaml#
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: status-led (leds-group-multicolor): $nodename:0: 'status-led' does not match '^multi-led(@[0-9a-f])?$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: status-led (leds-group-multicolor): Unevaluated properties are not allowed ('color', 'function' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
