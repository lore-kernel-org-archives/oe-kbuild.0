Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA77C22129B
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 21:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461768; cv=none; b=t1UC+1Upo/06DVLUv7V+vCWXc2AGA+WSPV0xJxlzezZbcdnfKOk/yXkxsqtMASKc8uDwr6XSihtgYeK7wSOlL2XfDhMmcm+8tJCBAy4vxI/vYmgD6S7GP4X6UohgikVDYvAy9pQYwMr2EmBkjE5Y7qGJRpbj7/17lR7xBKKaAZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461768; c=relaxed/simple;
	bh=Eso9dB9xRzFb6VFX8i9SjudtAJ5K8l3CvrLWCbof3P8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kOe5koWMANqpEjasGazpzTlP5BP+oFsWVKDTj71zieOYJrlzN6oOzeJyfGEd4pCgLoy9w/hiw+A+1qilmlJ8iiudPjrMIAcl0LU3o9AEiOpe7Bl1Nj5T+SU3pitvruqbKIy9GGLZl4iEQyjZICtEe5n+R8RcNwzDDNhViR/DPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zf47x4YW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zf47x4YW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769461766; x=1800997766;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Eso9dB9xRzFb6VFX8i9SjudtAJ5K8l3CvrLWCbof3P8=;
  b=Zf47x4YWIQfgbG/hw35sQVzdpzCJw5nTp4JO4Mr62M3bJQ9FhjCuWDSp
   dwMMXFBHqBUXJTKF4dF+phmmkWDIU4lk/xKWbOOYssdevF+d+g4QfGv8K
   yAiILoyR1OpLad76weTcayMObmqPYtOnAkYMz7IhubeGp8k+TPTIivusZ
   LCzvVixF8wwE/xcX/laYRS8Op9+Ufv49WOSeocq0qs3XmMsJl6nITSUZk
   PpMkpdIiYhi89X2NxQXcOQG1hxiZv4bma9I4pTeGd/9iXVfz2k2HsIi6h
   j/KZkRH3Dx0yTL0+la4Rx4ZQfvW5mMWXqJ9/kRp2ZnYJ0TxEXTbSTVYkO
   A==;
X-CSE-ConnectionGUID: cg1POBOfSCKAdGAGR3Hx1w==
X-CSE-MsgGUID: 7NkpFpbERRawEJgEcm0yxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70737565"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70737565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 13:09:25 -0800
X-CSE-ConnectionGUID: bwrSnwJ1QQi+5kFCSiyUGw==
X-CSE-MsgGUID: 8OUNNt6gTa+IuLREjsa+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="245390794"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2026 13:09:24 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkTpp-000000001bV-3ZXY;
	Mon, 26 Jan 2026 21:09:21 +0000
Date: Mon, 26 Jan 2026 22:09:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/3] ARM: tegra: lg-x3: add USB and power related nodes
Message-ID: <202601262238.4W6TnGIJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260122152713.8311-3-clamor95@gmail.com>
References: <20260122152713.8311-3-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: "Jonas Schwöbel" <jonasschwoebel@yahoo.de>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.19-rc7 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/ARM-tegra-lg-x3-add-panel-and-bridge-nodes/20260123-000951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260122152713.8311-3-clamor95%40gmail.com
patch subject: [PATCH v1 2/3] ARM: tegra: lg-x3: add USB and power related nodes
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2051-20260123 (https://download.01.org/0day-ci/archive/20260126/202601262238.4W6TnGIJ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262238.4W6TnGIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601262238.4W6TnGIJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: dsi@2 (solomon,ssd2825): ports:port@0:endpoint: Unevaluated properties are not allowed ('data-lines' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: panel@1 (jdi,dx12d100vm0eaa): 'backlight' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/renesas,r69328.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: sound (lg,tegra-audio-max98089-p880): nvidia,audio-routing:13: 'Mic Jack' is not one of ['Int Spk', 'Headphone Jack', 'Earpiece', 'Headset Mic', 'Internal Mic 1', 'Internal Mic 2', 'HPL', 'HPR', 'SPKL', 'SPKR', 'RECL', 'RECR', 'INA1', 'INA2', 'INB1', 'INB2', 'MIC1', 'MIC2', 'MICBIAS']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max9808x.yaml
>> arch/arm/boot/dts/nvidia/tegra30-lg-p880.dtb: thermal-sensor-battery (generic-adc-thermal): Unevaluated properties are not allowed ('#io-channel-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/generic-adc-thermal.yaml
--
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: gpio-leds (gpio-leds): led-power:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'battery-charging' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'battery-charging' does not match '^cpu[0-9]*$'
   	'battery-charging' does not match '^hci[0-9]+-power$'
   	'battery-charging' does not match '^mmc[0-9]+$'
   	'battery-charging' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: sound (lg,tegra-audio-max98089-p895): nvidia,audio-routing:13: 'Mic Jack' is not one of ['Int Spk', 'Headphone Jack', 'Earpiece', 'Headset Mic', 'Internal Mic 1', 'Internal Mic 2', 'HPL', 'HPR', 'SPKL', 'SPKR', 'RECL', 'RECR', 'INA1', 'INA2', 'INB1', 'INB2', 'MIC1', 'MIC2', 'MICBIAS']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max9808x.yaml
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: thermal-sensor-battery (generic-adc-thermal): Unevaluated properties are not allowed ('#io-channel-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/generic-adc-thermal.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
