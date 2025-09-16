Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C1127280A
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758057780; cv=none; b=JSqQScZKKl5647nzwdWKyCpIeTTzMulsorCNujN5FZFBLTeWbRYaDWG23OQmNRvhrXggg+1r3nX5khQvH+1FEtqp0tEMagSiKh73oapql5a4KAba4NN5nOkjLpxSeQkBwKaElIHdt3c3ZYkqeasHeWnjoG+REkllCKNTl/JNzn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758057780; c=relaxed/simple;
	bh=kE46KUO+nX+5Qx1ecoRIOvB9JrI4tYxjcDji5LHxgow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RKzzZOu80uyhnikFhBaDvVwMbou8hNJSJbMCYEjS9v7R8tVfBFzkcF0OgEO086JtsuvIuPw716/o+0PNCW2AI7wO8bWoB3HQ5swW/OeCOaRsWJGAVg0VnMljis5QHpQmSEy6RWYnQQaY/UcRNV1yGCszo7Gbi+xWOtvcus3F48M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWtp9ZeR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWtp9ZeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758057779; x=1789593779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kE46KUO+nX+5Qx1ecoRIOvB9JrI4tYxjcDji5LHxgow=;
  b=GWtp9ZeRPK6TF9kTEFaCOYIFM6I5UsHMc0fGhXZZT8zWbZvtuK2Z8VV7
   29VwMs8UAJoIiex9r948u5bbnrmk5ReHn503gNzQZ9Pg9Qrod9v5AfdRw
   YJDRITLj4DoSIDCoT+I8GKBNNlnlUEnEMLblSw9FibwjI2UDOm6hAqdV3
   rORa//GRRItg8dGoBJUW2kA0b82oEhP2ieLL/xS3VmfGrex1O02brAycp
   8Ka35T/sUb+gfXE41GupfP6CPB6PlBddH6JoUqvPK06zRMs0n1j0OTggN
   rSzi9n8oBAxF8hak/GzxG3imJrB887+lFU/CCa//LYkMXqenGXvw//qz5
   A==;
X-CSE-ConnectionGUID: vam1tM9FSfGypJkf6p0SPA==
X-CSE-MsgGUID: 3eb636ujR7mF3zfiAUO29w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60301120"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60301120"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 14:22:58 -0700
X-CSE-ConnectionGUID: Inb0kN+oR/6LwtvEVB4ckw==
X-CSE-MsgGUID: 9IJH6CQeQPy70NK2TMYNYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="175833688"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2025 14:22:56 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyd8Y-0000kR-2j;
	Tue, 16 Sep 2025 21:22:54 +0000
Date: Wed, 17 Sep 2025 05:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] dt-bindings: display: simple: Add
 innolux,n133hse-ea1 and nlt,nl12880bc20-spwg-24
Message-ID: <202509170553.dsR0cCJf-lkp@intel.com>
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
In-Reply-To: <20250915155123.3250823-1-Frank.Li@nxp.com>
References: <20250915155123.3250823-1-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
TO: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
CC: imx@lists.linux.dev

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc6 next-20250916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-display-simple-Add-innolux-n133hse-ea1-and-nlt-nl12880bc20-spwg-24/20250915-235347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250915155123.3250823-1-Frank.Li%40nxp.com
patch subject: [PATCH v2 1/1] dt-bindings: display: simple: Add innolux,n133hse-ea1 and nlt,nl12880bc20-spwg-24
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm-randconfig-051-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170553.dsR0cCJf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170553.dsR0cCJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509170553.dsR0cCJf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: pcf8523@68 (nxp,pcf8523): $nodename:0: 'pcf8523@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf8523.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): 'blocks', 'id', 'irq-gpio', 'irq-trigger', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: sata@2200000 (fsl,imx6q-ahci): 'target-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: panel (innolux,n133hse-ea1): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
