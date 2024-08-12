Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622901804F
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 23:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723506527; cv=none; b=VCR/p54QMKq58V5AgihDFv7QSjI2YaPIC4DG0rH7j6ldhGrA+h5OVkfotWSLJ+O+c5QxmvlgNDINvV4HUce07JoKOOOwy0Jr6pfnhUaqO/Tc7j29aCG/rm5hpc2987POk4ODnPe+p3VFPZLVBZN1hXmDcvHFapGej4A3xgLhJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723506527; c=relaxed/simple;
	bh=z+Aes3EfY8RTOBgptrZbXUFUdgPHtZKWZdCo/dhAQ+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SbI8nIdS/Ah/p/wfxsOOLrbIWbZ5tOtdovD8bPyya/KWMScg/BdTeUkX1F9eFCFjUsX4/+59k2VHgT2FJ6snHDvZxXoJm3Rio73sahHtAYrfiLGZ6mf9UPjbHqtHfWHYnWq7ANhekM+43lqoWL0y/ecBwj780VWFO5nBG32eH3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzWjqBYN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzWjqBYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723506525; x=1755042525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+Aes3EfY8RTOBgptrZbXUFUdgPHtZKWZdCo/dhAQ+U=;
  b=MzWjqBYNRmAdAC/ZIQIFhdwQpgFtzcayb7DWJvizYK+TSBbO9/0Jf+Rv
   Zn2HKIF8WF/55F09xTi8Kqub8b9GNM9NSVPeRYjiB0tbJufk2MsmlXqn7
   1XnL06P808EGn6ZgUep5i3J8N3oF2XSV18ymsnpSqcBsmXkW6Ah6Fe0OR
   FavZ8TIPQ3DDhij4H7AlpTA1xz/rkupm1JO8CNx6sUZgubgxMtDKxm1Kh
   TMXs8XSkNZHHiPx5JDfHzG/EUNH+3XMZROa3nIbls80VLgF97aVNbEsd0
   IXfYDcMy3pIYYQwnbLBVBdtEncqKYDwEMTjCSQMAQf5CYHjorpwTXvddc
   g==;
X-CSE-ConnectionGUID: bY16KtijRpWMEPL/1S032A==
X-CSE-MsgGUID: vgprycPmQj+Hi9PVYD/Xkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21455888"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="21455888"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 16:48:45 -0700
X-CSE-ConnectionGUID: AxtZUmB2QiKFQcRnBqmfLw==
X-CSE-MsgGUID: PKcrjjHaQh+cmxfvtGYvWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="58408221"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2024 16:48:44 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdemH-000CF9-1D;
	Mon, 12 Aug 2024 23:48:41 +0000
Date: Tue, 13 Aug 2024 07:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 40/79]
 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /odroid-reboot: failed to
 match any schema with compatible: ['odroid,reboot']
Message-ID: <202408130706.VOoQKXFD-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: ckkim <changkon12@gmail.com>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   3ad420f3e23c17d1cf883549675112ee8dd308e4
commit: ef1e460af81f037884cf497d051bae77e62583b4 [40/79] ODROID-N2/C4: arm64:dts: reboot/power off support for ODROID-N2/N2Plus/C4
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240813/202408130706.VOoQKXFD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130706.VOoQKXFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408130706.VOoQKXFD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
