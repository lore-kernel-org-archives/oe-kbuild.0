Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8298256D
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766753428; cv=none; b=MbUfuSXH4Zf8BWeWKhXfNwc4IksihKHMA8KnLpB9doIBGDsgNxKc9ru6m7aSew0dQngfyJxI4BLd0BcCbjcWgw020xb8vgxWpuBirbpfj4VwUXBEHl/X+Rb8WOFaYWq8kreU4VWXbDAQg5tNWErYxl34BiA5+FPoI6G+c413qzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766753428; c=relaxed/simple;
	bh=3nniEpofidAuT75CXJxi+lHhvAXb7T9TstyItvPZ4yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T6RR4S6SCLVXCEC83hXDx0uYx77PKPE0v/OixrfvWJWB7MijjoWFRUF1kSW9IJPyozEXkeifPbtrLZV0ChhtY+YYH9URDi4ur0LbBhu29MSeXT92j4NR6/IF+3AjX/1y3/ABw4IghmHTkEChQCabUWAyafREYbn8Y4EHhJFygKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkX7XJH8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkX7XJH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766753427; x=1798289427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3nniEpofidAuT75CXJxi+lHhvAXb7T9TstyItvPZ4yU=;
  b=dkX7XJH8IZcFtFdks/nL9fYbs/ZyroxlOeqRdCyhnjq3uZ7b0N2tUjuc
   oLxBcdS9WSQguIgTLKfyaAncYShz61WC7SjGDHCMUAHE7hJb4JYj9b8s6
   z8JakX1RJepQglub2E+Ooqfpi9tXeby02ogGOCLO4C8GB86d2hLAZrSUb
   kJLXEHFmBpwhfRDX2RI4jbm0n6TaMWjRrqzq3rYDWoTqlOnws4mSMXQHb
   7xKIZIQE3SswoLj6pZDKsrGpm3z3NBN5Y+b7X2OWQJfOdC/EefzlVYZmx
   5g9Z69czfVSptyppPFIyNXyY4n+0jOhO2MI/FBTXOmuzvfhV7USy1anxd
   A==;
X-CSE-ConnectionGUID: BKZCYC/lRZWCYHKUjFduSQ==
X-CSE-MsgGUID: 11polQaeSLy1fLZmDNsB6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="72132682"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="72132682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 04:50:26 -0800
X-CSE-ConnectionGUID: vAwjbR0zT2i8Bxrk8G+WmQ==
X-CSE-MsgGUID: CJvLwH1IQbW5b9q1f2wUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="223861731"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Dec 2025 04:50:24 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ7Gw-000000006sy-11cu;
	Fri, 26 Dec 2025 12:50:22 +0000
Date: Fri, 26 Dec 2025 13:50:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] media: dt-bindings: ti,omap3isp: Convert to DT
 schema
Message-ID: <202512261346.uMaRukoD-lkp@intel.com>
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
In-Reply-To: <3c5a55cc5873e8d16bd25c5968a0d8b36e180325.1766123192.git.alex.t.tran@gmail.com>
References: <3c5a55cc5873e8d16bd25c5968a0d8b36e180325.1766123192.git.alex.t.tran@gmail.com>
TO: Alex Tran <alex.t.tran@gmail.com>
TO: mchehab@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: pavel@kernel.org
CC: sakari.ailus@linux.intel.com
CC: mehdi.djait@linux.intel.com
CC: alex.t.tran@gmail.com
CC: laurent.pinchart@ideasonboard.com
CC: hverkuil+cisco@kernel.org
CC: linux-media@vger.kernel.org

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Tran/media-dt-bindings-i2c-toshiba-et8ek8-Convert-to-DT-schema/20251221-044937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/3c5a55cc5873e8d16bd25c5968a0d8b36e180325.1766123192.git.alex.t.tran%40gmail.com
patch subject: [PATCH v1 2/2] media: dt-bindings: ti,omap3isp: Convert to DT schema
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-2052-20251223 (https://download.01.org/0day-ci/archive/20251226/202512261346.uMaRukoD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e3ef26df85c317665a2c505a0d9bc179fe67bdaf)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261346.uMaRukoD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512261346.uMaRukoD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000/hsi-client: failed to match any schema with compatible: ['nokia,n9-modem']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: isp@480bc000 (ti,omap3-isp): ports:port@2:endpoint:clock-lanes: 2 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n9.dtb: isp@480bc000 (ti,omap3-isp): ports:port@2:endpoint: Unevaluated properties are not allowed ('crc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: leds (gpio-leds): 'heartbeat' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000/hsi-client: failed to match any schema with compatible: ['nokia,n950-modem']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: isp@480bc000 (ti,omap3-isp): ports:port@2:endpoint:clock-lanes: 2 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n950.dtb: isp@480bc000 (ti,omap3-isp): ports:port@2:endpoint: Unevaluated properties are not allowed ('crc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: leds (gpio-leds): 'heartbeat' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: keys (gpio-keys): 'keypad_slide' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
