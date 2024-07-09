Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C3D43147
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538739; cv=none; b=IXmwGItou621pGwkmpbKlpPCknQHx2yMOXSqABWA85vFTOLLs5hPsS9XPm/gZlrc7UEvlUjCwpilA/1zSgYWZKAzhXztS9XqgCR+0rEE+vN/tDzcwbp5tFrB+WI8SvM08Rgd11ciOAM3Ft5pIxh4f6mYgpNZMYZ7OIz9gfJhsAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538739; c=relaxed/simple;
	bh=74i4lRA+ch1rTbBen/u0NOu6yfqptOg8O1BHdMU5A68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UqDupzEhlupidlmyxWgawsWd+TVCdYLdoYdN4eUR+lfP285lvyK2tqziDKYg5u5QkBtxBR0lqa7eSWAum1tCugPLPYw1xPbUpvOH0rsooG0ebN7tJyPpnLVio94dptznlcvkXkVB/MOCrUSAzuerUOm5eaHegLGOT82Zq8nuEF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ji6JF1Cj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji6JF1Cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720538737; x=1752074737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74i4lRA+ch1rTbBen/u0NOu6yfqptOg8O1BHdMU5A68=;
  b=Ji6JF1CjMwyn47qOoQ3avNAlPrhTkN+y31IkGwUDnIjfr4+S/t1rEW6Z
   s+12QXcwawGkkajxSGIjn7CpKdc5c/69MZpoMUvz60UHES3MBwq/FWVf6
   SL+8BYhXzEACiAerJ4nODbJA6T/+NU2WjOipx7NOnPRU53tunQ0p+lBKu
   NTs85qpZeRNxtsrOPYig7Ifxfxu55dUeEE2JTcDHQFjDtgHOKAf3lxh5a
   WtYCdRFzg76btFD3whr5CTS3D4gzkDRgYxZiLl56BWgdkpRDmsFc25gL9
   BBqBznrG94rJ3I/wBrg0nMIENHCuwU+zYubMlrsd6OMdFCzPxidVfDDz1
   g==;
X-CSE-ConnectionGUID: slHqYrfaRsWtHGBzeXVJ8A==
X-CSE-MsgGUID: VeeUQg3QT5mhGBj4c5byVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17758526"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="17758526"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 08:25:36 -0700
X-CSE-ConnectionGUID: aE4FKdYARDeeOBdhenDjbg==
X-CSE-MsgGUID: elRte4AdRyukymfgAqBvUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="52291236"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jul 2024 08:25:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRCij-000WnS-1f;
	Tue, 09 Jul 2024 15:25:33 +0000
Date: Tue, 9 Jul 2024 23:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.6.y-cicd 13/14]
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: video-codec@30210000:
 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202407092323.5wnoy7gy-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Brandon Brnich <b-brnich@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>
CC: Prasanth Babu Mantena <p-mantena@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   32fb3aae72f286cd0d023455b5fc9e4c6b9859f5
commit: d8ade9d10bac6dc2f0658aa8e60a8378fafe187c [13/14] arm64: dts: ti: k3-am62a-main: Add OPP table to the VPU codec node
:::::: branch date: 17 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240709/202407092323.5wnoy7gy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092323.5wnoy7gy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407092323.5wnoy7gy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[27]], 'interrupts-extended': [[1, 0, 178, 4], [28, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[129]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: {'compatible': ['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interrupts': [[0, 178, 4]], 'power-domains': [[3, 146, 1]], 'clocks': [[2, 146, 0]], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'], 'pinctrl-0': [[27]], 'interrupts-extended': [[1, 0, 178, 4], [28, 456]], 'interrupt-names': ['irq', 'wakeup'], 'phandle': [[129]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@a40000: 'cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: video-codec@30210000: 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /reserved-memory/edgeai_shared-memories: failed to match any schema with compatible: ['dma-heap-carveout']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
