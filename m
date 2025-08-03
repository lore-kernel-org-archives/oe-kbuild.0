Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8888462
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Aug 2025 02:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754188873; cv=none; b=XCmRVGiy9w7Sp3GFHGdgkO5krJc4/BkqU2IFl0NzKjVux9AeNPk8SrR91NLPRHVMnIw4T9FnSiWrmxQhAxjQT68WsFtBZQoYlEDRqjOuo9BhLKpd2FlONiTuy35rPPUfEjMTcK+rJLX/MvasWGs1FEXOMEWQZWGZzF00a8XbOq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754188873; c=relaxed/simple;
	bh=5TeXt8bXiHAkWOqAK/bgDALPrvMTXdkPyoUI6SL1Bds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DzkWKamr2liq8IkNM8eXYpaNIOIhNeC4CkubafIjPPZtLl/lUIJxsnpYDNQVztVK9KvE4NoYL0CECPhIDCg4WJNiou3N/HLw0OfC9M+tj2L6tZBVyW9mSmTpzrph8aN8mwIKEGBVb2A9vaCj7biiaL9a6DxBJREoA31p72i+IFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TS6a2adB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TS6a2adB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754188870; x=1785724870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5TeXt8bXiHAkWOqAK/bgDALPrvMTXdkPyoUI6SL1Bds=;
  b=TS6a2adBBjB6eAzNyMlfVudxu735Db/IH+eryPCZ4o0CO1pwNZe3vhyN
   tzIulr1xttUnY6/ioyD8woI+1rTSQA7sTDZg9ERm3DqUVQ6cPQk1c4nhp
   rw7fZ3Ll/yZ3wd3Jtu513j8UaF3nlH/4Dlfu9RdPi6LhQh6+XgH8oe7o0
   MPyO0pdndd3TgBu8hPxi2gB8FCSG87QHGqA7RV86UL32lf4TDr7GlKcBP
   JLCfMIfh0ZzRLHWw5iefb9V6qQYMQb3ba0E+sEXxRCT6VqvFEXyQrnRQS
   9WqLlYW9J5SzeLiW7ySlARyNQRWWlIJAf904/uw7Zr2h4MMgSbIVkUYPD
   g==;
X-CSE-ConnectionGUID: LkbCbOMeQ6auWKCRakFEhw==
X-CSE-MsgGUID: 4+27u+l3QCulsKQSNHJ2zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="73946448"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="73946448"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 19:41:09 -0700
X-CSE-ConnectionGUID: Wz4hXDJgQtalK/1+OXhW7A==
X-CSE-MsgGUID: T8TWTPatRlmMmi182XEG6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194826105"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Aug 2025 19:41:08 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiOen-0005jY-3A;
	Sun, 03 Aug 2025 02:41:05 +0000
Date: Sun, 3 Aug 2025 10:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 12/60]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd
 (lincolntech,lcd185-101ct): 'power-supply' is a required property
Message-ID: <202508031010.hVUG8Qf6-lkp@intel.com>
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
TO: Aradhya Bhatia <a-bhatia1@ti.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: 0a3beea5c650fcd3363683e7c5b7008de0a0bcbe [12/60] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-053-20250802 (https://download.01.org/0day-ci/archive/20250803/202508031010.hVUG8Qf6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508031010.hVUG8Qf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508031010.hVUG8Qf6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): compatible: ['lincolntech,lcd185-101ct', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: /lcd: failed to match any schema with compatible: ['lincolntech,lcd185-101ct', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
