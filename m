Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C291202F70
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 21:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773608861; cv=none; b=BbcySsivI7Fo6s1KTbuPMwNKTR87OgxugZLII3cdiL256QN19Wrhs81Ja+ca4REWUtDIhx6uAqHuFcjPJko9zhgGQLCkpf+UQ9WqfLG0K9oLZ/Fh05g0gCZ28cWBwjeKsOw8jopN6GSgXnWkt95kcrjt93AP3MOcZazdGGjjAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773608861; c=relaxed/simple;
	bh=d14sVOPlg7qgrz2VK2GZNTkmk+8gmB8C5KcAKQiVA68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tpw2gEQ0EgxKW40MKRxNy3ESxFDuu8+vp5TRHshAec+V7bWXahKEZGNIKFYpna7xoDe0sxFupS+Bv30XloJ+nYrtI1GJNb+W3LQuEBanqozTbXbILcxzRVXyelikePsEQn6sAGYiQ0TRUrwiJMuBmWwfjSVBhXoZm0y0h422MI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js38xHhG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js38xHhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773608860; x=1805144860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d14sVOPlg7qgrz2VK2GZNTkmk+8gmB8C5KcAKQiVA68=;
  b=Js38xHhGOg1TaCm2oPAeCB9/NivwW700lZpiqv1wBfkXRIX/W45LhdHe
   wzmyYkoQXjijCRQ7Xlc4hqTsAUWUOkLO+AymnG/KIxGMph3QwQe6q34cG
   vg9HYHIbUn4TU5eBulnZFnN61iKnfCvzxMwZ7hyzMYIZHlb3YsCcQXscr
   TfeyhAOhMjiGkgX2guaL/v+j5u8QbDgVTjugixNtXcWv52+g8gaNXEect
   NZEearmawnjWruK57yukQ27sLGiX2I6Kcbh6+eU4E+FcBY7ZgOfJCm/9I
   XcToY+wi2yKHwfYzxryxkFBWGOkhS7kg2uhBX+Akw5mrjyTJiFOjqijQL
   g==;
X-CSE-ConnectionGUID: giEX7pG+Ro24HXqmj+9ifw==
X-CSE-MsgGUID: 4kmkcnxIRz6qWrclj9i72w==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="97241192"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="97241192"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 14:07:39 -0700
X-CSE-ConnectionGUID: kldM3ljISXyZ+90ccCtoAA==
X-CSE-MsgGUID: TbtrzytzSeyA8GMKKyOI/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="218962457"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 15 Mar 2026 14:07:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1sgR-0000000046X-3djg;
	Sun, 15 Mar 2026 21:07:35 +0000
Date: Sun, 15 Mar 2026 22:07:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3519
Message-ID: <202603152253.IGnL8PlL-lkp@intel.com>
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
In-Reply-To: <20260314-edt-ft3519-v2-1-e28c3f9c6559@machinesoul.in>
References: <20260314-edt-ft3519-v2-1-e28c3f9c6559@machinesoul.in>
TO: Bhushan Shah <bhushan.shah@machinesoul.in>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Bhushan Shah <bhushan.shah@machinesoul.in>

Hi Bhushan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhushan-Shah/dt-bindings-input-touchscreen-edt-ft5x06-Add-FocalTech-FT3519/20260315-071854
base:   0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
patch link:    https://lore.kernel.org/r/20260314-edt-ft3519-v2-1-e28c3f9c6559%40machinesoul.in
patch subject: [PATCH v2] dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT3519
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm-randconfig-2052-20260315 (https://download.01.org/0day-ci/archive/20260315/202603152253.IGnL8PlL-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603152253.IGnL8PlL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603152253.IGnL8PlL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000: failed to match any schema with compatible: ['ti,am4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: serial@0 (ti,am4372-uart): pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/ov2659@30: failed to match any schema with compatible: ['ovti,ov2659']
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: edt-ft5306@38 (edt,edt-ft5306): compatible: 'oneOf' conditional failed, one must be fixed:
   	['edt,edt-ft5306', 'edt,edt-ft5x06'] is too long
   	'focaltech,ft3519' was expected
   	'focaltech,ft3518' was expected
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/edt-ft5306@38: failed to match any schema with compatible: ['edt,edt-ft5306', 'edt,edt-ft5x06']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/interconnect@48000000/segment@0/target-module@2a000/i2c@0/lis331dlh@18: failed to match any schema with compatible: ['st,lis331dlh']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
