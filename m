Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EE73A1E90
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766663653; cv=none; b=LHixcgb9uWo4azJNcNXaYkTOWq2fi8DCCzf2A+1UpFRHCIM8ljlKRP9KNxoDDQ8XifE5PvpmjFO5lti+BCJ36MK24xFMKJ+qraxhudCIj8tDiRNC5k2Xm18OYw3ozwNS8bjT8hei6f9ymAQNhJqDt95Bf7iYfQrFoyIc5P36emk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766663653; c=relaxed/simple;
	bh=ikHylHhHvu9mwk+wunCZ94Ni4ZQqfzNa0n44TCufbeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ED13odgMOcYYzxa4JJx+6TITGQZrYFN/A/3kesjWCMUEVAyKJIYPjgilQBSafHpnfOUIaQMNXuvcZP7njO0jHOXtZNEA9awjKhD2Xg2gy/fxQTS5pGdys/M8fIdl3uvzsjZrhykfHI+ERU7P6531qclDdjH4OGOlCqy7v4kqnuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHIYHte/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHIYHte/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766663652; x=1798199652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ikHylHhHvu9mwk+wunCZ94Ni4ZQqfzNa0n44TCufbeg=;
  b=fHIYHte/p09qXSqGp7Ro4SVcjpBAUseZ+EUh32tgw1vt0jh2gc/EvOQ6
   RM4bvCD3a3DU4ZcFjKcMpphWqbt2wHmLwhdanCcnx36MeZpkZ5siIkYhJ
   zU1LEubrcCFiA/MOUUcdiFSxShv9itPPipppfwUhyBeKXoQu276f5h03v
   aldi7Ev+/FI6pRSnnvjTe0QKYzUZvezLK1EjRh9Qsr1+Pjs19jNS67xn9
   JKMQws245Nq0+YCWjvJ2PErVh1++U1JOxHzMtnFq0rIj/2xz0xao1qSWd
   9L5Bib0adlS2Y+1+NyJEZY6/aZuT+91rlwyQYIgipzZMXjw1sovNd/fEy
   Q==;
X-CSE-ConnectionGUID: aNDEcdDXRXmVk4YstUfxHw==
X-CSE-MsgGUID: qYxhwRn5SHSADqXu3xTi5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72321307"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="72321307"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 03:54:11 -0800
X-CSE-ConnectionGUID: UV/sHc4gQQqJjHsH29U5sg==
X-CSE-MsgGUID: OotX66JsSe+tTV0wcRcH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="200686744"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Dec 2025 03:54:10 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYjux-000000006Z6-2Wg2;
	Thu, 25 Dec 2025 11:54:07 +0000
Date: Thu, 25 Dec 2025 12:53:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
Message-ID: <202512251226.fVI6u0kh-lkp@intel.com>
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
In-Reply-To: <6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran@gmail.com>
References: <6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran@gmail.com>
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
patch link:    https://lore.kernel.org/r/6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran%40gmail.com
patch subject: [PATCH v1 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert to DT schema
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-2052-20251223 (https://download.01.org/0day-ci/archive/20251225/202512251226.fVI6u0kh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e3ef26df85c317665a2c505a0d9bc179fe67bdaf)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251226.fVI6u0kh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512251226.fVI6u0kh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['brcm,bcm2048-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/serial@4806c000/bluetooth: failed to match any schema with compatible: ['brcm,bcm2048-nokia', 'nokia,h4p-bluetooth']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/led-controller@30: failed to match any schema with compatible: ['adi,adp1653']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/si4713@63: failed to match any schema with compatible: ['silabs,si4713']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): 'clock-frequency', 'clock-names', 'reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): lens-focus: [[253]] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): lens-focus: [[253]] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): port:endpoint: Unevaluated properties are not allowed ('clock-inv', 'crc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: camera@3e (toshiba,et8ek8): 'reset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: tsc2005@0 (ti,tsc2005): $nodename:0: 'tsc2005@0' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/spi@480ba000/wl1251@0: failed to match any schema with compatible: ['ti,wl1251']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
