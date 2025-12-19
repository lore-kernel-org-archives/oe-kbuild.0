Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48AD2701D9
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 23:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766188175; cv=none; b=l8KtwBsFHIJEyNg+uEagknH7qqnQ+5C+1v/8eH3b68gZvRW5B4ZkBeFIreNwOWfqlP1PWCP8fNLa7J6IF4D4PN9rQqYSGL0R0w+C3yj9AXklD9krFXp3e3Fds7RsoMCxau7Y6pcpzkdLKCpvQ9iBj41718p9dxtvWOkaks0v+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766188175; c=relaxed/simple;
	bh=tv2RWoSP72yv0uPKG6LnUufqhxW7AijKVHcrbdtUIBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEMj7CLBEA/O8ZX3YdOmKD2vtyHrC/AvDLt/qN7VGPK2XzOgggbA7stv1/xLlGPEiDW4JFAgta9pqVOoMcGDf6YBNn27BxP4ByAqE/Ixj0abPGzLA7TQXl69Sr5E3BAIE7ASOOeQCF+ri1uYwAU/SksQUMnieH9X2wl1P6Mpdrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C183YT2/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C183YT2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766188173; x=1797724173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tv2RWoSP72yv0uPKG6LnUufqhxW7AijKVHcrbdtUIBk=;
  b=C183YT2/houEHXiCXx911CAo5ry/tLuU5BvNZOy0d/Iycfn83+98xB2J
   wYANbV9WZdfyRg2Ac882+oEqH0YhSWXWvsYt5E7Ewii0NRLcUyIlo0MVY
   lgmpDDHhrfHlmGxXK5RWTuI73HZS50zUeGyXU4y4LH3qB95solj9QVX4M
   aJWt/ZGVnJHszTiLhcWSaX85G6HB4SFRB4yvx+U1vgwHM6nQ5BUl4AqYJ
   T5suA2mN/c0xrLYk0R1wQqaGlDwlrRqQPgpzsoj7VtUwFEgGNrHS0BFkZ
   VGXOjdiBAeKTx7w/wtk/0B/jlmB6EEk9a2gpCm8sPb17tHZyAzO7qvJ00
   g==;
X-CSE-ConnectionGUID: /cZVcFK3QFmRkaaiK32kfA==
X-CSE-MsgGUID: bLf0K144Q+mCbIqsDgTIew==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68229075"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="68229075"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 15:49:32 -0800
X-CSE-ConnectionGUID: RWS/VYoUQze+hR8SOeeSHg==
X-CSE-MsgGUID: DzjpSy34T8WzyrNtbUoXLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="203139395"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 Dec 2025 15:49:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWkDw-000000004Pc-0Z9h;
	Fri, 19 Dec 2025 23:49:28 +0000
Date: Sat, 20 Dec 2025 00:48:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] dt-bindings: media: omap3isp: document missing
 crc as optional property
Message-ID: <202512200053.PW6D54Gb-lkp@intel.com>
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
In-Reply-To: <99fea6935f255661a2c41adc11ba5f85d17e3bf4.1765782992.git.alex.t.tran@gmail.com>
References: <99fea6935f255661a2c41adc11ba5f85d17e3bf4.1765782992.git.alex.t.tran@gmail.com>
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
[also build test WARNING on linuxtv-media-pending/master linus/master v6.19-rc1 next-20251218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Tran/media-i2c-et8ek8-et8ek8_driver-add-support-for-crc-configuration-via-device-tree/20251215-160804
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/99fea6935f255661a2c41adc11ba5f85d17e3bf4.1765782992.git.alex.t.tran%40gmail.com
patch subject: [PATCH v2 4/4] dt-bindings: media: omap3isp: document missing crc as optional property
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-2052-20251215 (https://download.01.org/0day-ci/archive/20251220/202512200053.PW6D54Gb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200053.PW6D54Gb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512200053.PW6D54Gb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/target-module@480ab000/usb@0: failed to match any schema with compatible: ['ti,omap3-musb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: isp@480bc000 (ti,omap3-isp): ports:port@0:endpoint: Unevaluated properties are not allowed ('ti,isp-clock-divisor', 'ti,strobe-mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/target-module@480ab000/usb@0: failed to match any schema with compatible: ['ti,omap3-musb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: isp@480bc000 (ti,omap3-isp): ports:port@0:endpoint: Unevaluated properties are not allowed ('ti,isp-clock-divisor', 'ti,strobe-mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/target-module@480ab000/usb@0: failed to match any schema with compatible: ['ti,omap3-musb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: isp@480bc000 (ti,omap3-isp): ports:port@0:endpoint: Unevaluated properties are not allowed ('ti,isp-clock-divisor', 'ti,strobe-mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/target-module@480ab000/usb@0: failed to match any schema with compatible: ['ti,omap3-musb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: isp@480bc000 (ti,omap3-isp): ports:port@0:endpoint: Unevaluated properties are not allowed ('ti,isp-clock-divisor', 'ti,strobe-mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
--
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@480ab000/usb@0: failed to match any schema with compatible: ['ti,omap3-musb']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000/hsi-client: failed to match any schema with compatible: ['nokia,n900-modem']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: isp@480bc000 (ti,omap3-isp): 'vdds_csib-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: isp@480bc000 (ti,omap3-isp): ports:port@1:endpoint:clock-lanes: 1 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: isp@480bc000 (ti,omap3-isp): ports:port@1:endpoint:data-lanes:0: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: isp@480bc000 (ti,omap3-isp): ports:port@1:endpoint: Unevaluated properties are not allowed ('lane-polarity' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap34xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: gpio_keys (gpio-keys): 'camera_capture', 'camera_focus', 'camera_lens_cover', 'keypad_slide', 'lock_button', 'machine_cover', 'proximity_sensor' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /isp1707: failed to match any schema with compatible: ['nxp,isp1707']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /n900-audio: failed to match any schema with compatible: ['nokia,n900-audio']
--
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000/hsi-client: failed to match any schema with compatible: ['nokia,n9-modem']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
>> arch/arm/boot/dts/ti/omap/omap3-n9.dtb: isp@480bc000 (ti,omap3-isp): ports:port@2:endpoint:clock-lanes: 2 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: leds (gpio-leds): 'heartbeat' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000/hsi-client: failed to match any schema with compatible: ['nokia,n950-modem']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
>> arch/arm/boot/dts/ti/omap/omap3-n950.dtb: isp@480bc000 (ti,omap3-isp): ports:port@2:endpoint:clock-lanes: 2 is not of type 'array'
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
