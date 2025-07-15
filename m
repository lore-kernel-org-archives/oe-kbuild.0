Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962B381C4
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752583634; cv=none; b=XeRaIpY/r1vLy9u6pi88Hw2RDkrq87VWFEYkZBOaFyBHlYOyjnAspgwd/9GdCWVOfVFWykBlLb+JbbPK6cD4GWAWU4MdDse4+47pqPL1dH7/aFuxekCUAnIlniWHVvjmbdU/ChDjW3v/seHclQpk7b+4sv7KUzPJIekEBWEA5DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752583634; c=relaxed/simple;
	bh=thppFNRPYWCQM6czSg5YEDAmSs4JxFK/Z5cp1azm8a4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JAI6OwBomMXNf7NsqNW7Sv864mib6hFEhwijQjUzPGT7450+3Slspa+bB/7Nbw1APNwGDaGe4MB5LVH/6OBfbqzV4+6BkGSlv7DFno/w/5l84wrRrz3IhkPmA8ZVosbpNzaDu5X8Q3gTRlscrk6+Ba61xryeVPf4sJhh+XgztK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWayuB6b; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWayuB6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752583632; x=1784119632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thppFNRPYWCQM6czSg5YEDAmSs4JxFK/Z5cp1azm8a4=;
  b=lWayuB6bGuEbSKmIa3bVaunDeZdeEtFWnj8bbYAgFDv0wLc78s/yUYoL
   yIQIhLciuaN9JdB7BOHcjKIRP5fx/hPFXDNkTVJMrEr3zGN2GhJlN4jMr
   dYP8E1OVhjIF38xeUoH4KSHCEfV710CeGxJe97dsDxJ+7/xf3UtIUYDaK
   qw0R+Ni9bry+O8NfH581Q0lRK6KL9yzdItcjZLaE7YZVO3mwzCZgF4hXC
   80n/Bzxtl7m03lceYdrq21cBEuJDpCIDwetPn7Mk11QRIReHZYfElQVt1
   jzSWEoJR+kTMgn6pAklwOOu3PeApHXPL78o87zM8aghp0qKlQCBDVOzp4
   Q==;
X-CSE-ConnectionGUID: kKdClGtrSby+w2ffb72wZw==
X-CSE-MsgGUID: 3hXPAxgQTZWstMymdOBEYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72377297"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="72377297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 05:47:12 -0700
X-CSE-ConnectionGUID: BReU7RG3TeCpzlw+VTomhA==
X-CSE-MsgGUID: 19I/OM9TSkKSvbyULRZkmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157721367"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jul 2025 05:47:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubf3s-000A47-0g;
	Tue, 15 Jul 2025 12:47:08 +0000
Date: Tue, 15 Jul 2025 20:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: gpio: Convert altr,pio-1.0 to DT schema
Message-ID: <202507152029.OXPGayM5-lkp@intel.com>
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
In-Reply-To: <20250714202905.3012386-1-robh@kernel.org>
References: <20250714202905.3012386-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: Marek Vasut <marex@denx.de>
TO: Mathieu Malaterre <malat@debian.org>
TO: Hock Loh <thloh@altera.com>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.16-rc6 next-20250715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-gpio-Convert-altr-pio-1-0-to-DT-schema/20250715-043615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250714202905.3012386-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: gpio: Convert altr,pio-1.0 to DT schema
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: nios2-randconfig-052-20250715 (https://download.01.org/0day-ci/archive/20250715/202507152029.OXPGayM5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507152029.OXPGayM5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507152029.OXPGayM5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:3: 's1' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names: ['control_port', 'rx_csr', 'rx_desc', 'rx_resp', 'tx_csr', 'tx_desc'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): compatible: ['altr,tse-msgdma-1.0', 'altr,tse-1.0'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): Unevaluated properties are not allowed ('altr,enable-hash', 'altr,enable-sup-addr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@0: failed to match any schema with compatible: ['altr,pll-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@1: failed to match any schema with compatible: ['altr,pll-1.0']
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014d0 (altr,pio-1.0): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml#
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014d0 (altr,pio-1.0): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml#
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014d0 (altr,pio-1.0): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml#
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014c0 (altr,pio-1.0): 'edge_type', 'level_trigger' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml#
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014c0 (altr,pio-1.0): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml#
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014c0 (altr,pio-1.0): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: leds (gpio-leds): 'fpga0', 'fpga1', 'fpga2', 'fpga3' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
