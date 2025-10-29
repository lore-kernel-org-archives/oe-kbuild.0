Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCC52ED846
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 03:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761707592; cv=none; b=oJHlwdIXt1gJKH1iMPdcI0X584jYWSGN2hgZ1H1Pt0lPU9HSbMMb1DUtFzfzUWTD4lf3y6JpYoJkDr6u/wlZBqiQTiDd6aJXnaS1NNmAeRI39wxGgAqOiV9jsmzHXgxc49nQIn4xBZZVyMgi9d84HuR5xm5SxgC2oRwc8/QZ67c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761707592; c=relaxed/simple;
	bh=hoqJMNI6I8Fd1xFOicXD4RumJXijXBwYez82H6j4/Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DAeqcLDR7XuzKN0gr7iFlTjd7yEOQstl9Ghfu+tp/6UffwmFGTHmVSbJ3O1eUE1aunv2gSfJS81XtILAtIfyRM1+IRRSl+M/5V55QgAmvhNPfA2nC4txK2zguSUyYD0pIPQM1ax+R7/+k7sCrCzp+oyU6wRXd3B8mi4m0moEUqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ln8bsS84; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ln8bsS84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761707591; x=1793243591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hoqJMNI6I8Fd1xFOicXD4RumJXijXBwYez82H6j4/Xw=;
  b=Ln8bsS84b/aE9+0a22cBvJoMSuT8rFq6WcmVSnnvzJHPQAHXNXyhRfa6
   YSIz14+FnjPmh/U8MJ6NlDVpzgqQBkgp6c2FxLYnLNEAnrzDteovXKx6T
   03b1z8iFtvAgQ2goIey6Em6BOO05VxE9Dhixq7rYldSaqmWiMxk/Qb1+D
   gFxe4YZ8NNE9QiROJ5zj0n8Vd/UT6m+Z3RuAGMOcsno/Ze6HDZhfT9HgJ
   qdYFnhBjncOMtHmsBdx3renXs8JszmHJ23fJzk59DwA7c3SQDdOrD1me8
   3dAH0S0kPFRONiFTGHKvVyjpoOb46y46lodPQQk+uHzuDMydKm56Uzr9l
   A==;
X-CSE-ConnectionGUID: fcdPShBxTKa+yTHxAJbjhQ==
X-CSE-MsgGUID: 43WtqGnPQ2GyBxpaA8016g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63026199"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="63026199"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 20:13:10 -0700
X-CSE-ConnectionGUID: DH+5KRdCTbyGqHz3EPML1w==
X-CSE-MsgGUID: 1Dep5LjPRDCmYbz3zaoSUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="184771388"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 28 Oct 2025 20:13:09 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDwcV-000000000rs-0Y2E;
	Wed, 29 Oct 2025 03:13:07 +0000
Date: Wed, 29 Oct 2025 04:12:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400
 (altr,tse-msgdma-1.0): Unevaluated properties are not allowed
 ('altr,enable-hash', 'altr,enable-sup-addr' were unexpected)
Message-ID: <202510290401.r1CJJm05-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Janne Grunau <j@jannau.net>
CC: Johannes Berg <johannes.berg@intel.com>
CC: David Heidelberg <david@ixit.cz>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: dede36400714b34bdaf79be2c84f540f07102554 dt-bindings: net: Add network-class schema for mac-address properties
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: nios2-randconfig-2052-20251024 (https://download.01.org/0day-ci/archive/20251029/202510290401.r1CJJm05-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290401.r1CJJm05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510290401.r1CJJm05-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/sysid@18001528: failed to match any schema with compatible: ['altr,sysid-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:2: 'tx_csr' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:3: 's1' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names: ['control_port', 'rx_csr', 'rx_desc', 'rx_resp', 'tx_csr', 'tx_desc'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): compatible: ['altr,tse-msgdma-1.0', 'altr,tse-1.0'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): Unevaluated properties are not allowed ('altr,enable-hash', 'altr,enable-sup-addr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@0: failed to match any schema with compatible: ['altr,pll-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@1: failed to match any schema with compatible: ['altr,pll-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/timer@18001440: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/gpio@180014d0: failed to match any schema with compatible: ['altr,pio-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/gpio@180014c0: failed to match any schema with compatible: ['altr,pio-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/timer@880: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: leds (gpio-leds): 'fpga0', 'fpga1', 'fpga2', 'fpga3' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
