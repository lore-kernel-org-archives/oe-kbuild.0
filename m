Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3BF21CA16
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436239; cv=none; b=gnFMFsgXdQ7xTeHbwaI6M+vUMQd6h3GkFtchOZBvlA5xmqT3l6JQz1qai0ErfUJkqD5YirSQMTfz/Z5G+U18JwRl36vaYS+vADtHZGOivKb0wIFkkow/XPGGDgAyrxPw+a0fyADFhk18Ec9zV26cOikIyjBXHAGlOK9BQT+HAEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436239; c=relaxed/simple;
	bh=JMdpa4WkacDPEBi/j9AytNPpXKfMZ8ncHrVU/nImTZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcUlXd1ZRESTyXMd22wrfTzI2q4DyYYdt/JMogx0P/4cd3gLKMOZ8+BcJbHfu/dZ3XrjaysOKb0Y+sEVPqHVqMbXcwJXrMqdO21IIw6nn+Bg59xxu9UJO+pCNxeHLL03zsF4h+El7wSpxvn7J7fAcykXoM/foliRknXc5kxHvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YyUMq48k; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YyUMq48k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736436237; x=1767972237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMdpa4WkacDPEBi/j9AytNPpXKfMZ8ncHrVU/nImTZY=;
  b=YyUMq48kSqDok4rxh6yYSIiH2CwKNsvpQoSR6boc/qG6vsOewgGbLAxk
   CnGZ0spS28cBmc6+Cc0d3HvoT2cQFyD95ADZsZXs4LkQzRQTNKQUd0G+0
   iWMXEGgZbZwcdyjVsobMUxfxWm192OTr0/eDCFifivzZbjtrSkYlYcc+n
   9cau1iDoUCB0u0CYwWZnrEX0FmdLiQd3rx7T9DPxGlKMj1SU5Ifc+MyZ6
   jlgRxLgZ1fxJjOltGNHUTgvdyQ1cT4WLAlgCkLByzEIIlvszGSoxH6bV8
   NFfeJtweqGi6wFL3jWIbisZnlybdfNYW0HHTQ5lufLuRs1q8pvFxKwDyI
   g==;
X-CSE-ConnectionGUID: 5x3jkSd4T46nJiTgCuKqBA==
X-CSE-MsgGUID: 3jDbVHM8ScihXfcWCm2RuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39527322"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="39527322"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 07:23:14 -0800
X-CSE-ConnectionGUID: AwmFJDv4TreIw5Rt6zNrdQ==
X-CSE-MsgGUID: v6LGuMFbTnSkNNgQKbBHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126725971"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 07:23:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVuNK-000HjP-39;
	Thu, 09 Jan 2025 15:23:10 +0000
Date: Thu, 9 Jan 2025 23:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/7] dt-bindings: input: matrix_keypad - convert to
 YAML
Message-ID: <202501092323.S9O3nJH4-lkp@intel.com>
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
In-Reply-To: <20250107135659.185293-4-markus.burri@mt.com>
References: <20250107135659.185293-4-markus.burri@mt.com>
TO: Markus Burri <markus.burri@mt.com>
TO: linux-kernel@vger.kernel.org
CC: Markus Burri <markus.burri@mt.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Marek Vasut <marek.vasut@gmail.com>
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next linus/master v6.13-rc6 next-20250108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Burri/Input-matrix_keypad-use-fsleep-for-variable-delay-duration/20250107-221307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250107135659.185293-4-markus.burri%40mt.com
patch subject: [PATCH v3 3/7] dt-bindings: input: matrix_keypad - convert to YAML
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-054-20250108 (https://download.01.org/0day-ci/archive/20250109/202501092323.S9O3nJH4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092323.S9O3nJH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501092323.S9O3nJH4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: sram@0: 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: display: compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: display: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: display: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: matrix_keypad0: 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
--
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@47810000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: sham@0: 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@53501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@53701000/des@0: failed to match any schema with compatible: ['ti,omap4-des']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: sram@0: 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: matrix_keypad0: 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: display: compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: display: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: display: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
