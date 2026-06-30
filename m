Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A1B8472
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jun 2026 06:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782799336; cv=none; b=gedjcnxJ6kbM16125Ukkw6MdZQ5TXSk7bR46BM5Z3FVqTBy9cx3+LvPBTlCEtEaS3uaCQ/ANWq1DgFPYAlSGKcqp2KNc9G4jrkqZZ6kg+VdfUFUT2vAgWWnOQ+e45vHzRqHjb9ozRO3FzPCKKDoYlRxZv+iziEOnI42vnuSOfY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782799336; c=relaxed/simple;
	bh=B7JfPpFCxlFhL99uBvp+RvHcSEJYB/2nAVQwcn8saAo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZJFZ+fzyYmB57PzD9/lUJrNFqPik/YadVbgn6CkXlxwhhHC876VJUwE/ywY5P/yRd6S9Sacr/5v/Agfc6DDNh4DoJauMz7i3YFvsHJgRmjTXl+u4crwDwqLKctrM03RLwZhWS4z1tsStuy2YYRRvJ2npIt+iS1UzoOxGpbtIjN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxgUWERc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxgUWERc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782799335; x=1814335335;
  h=date:from:to:cc:subject:message-id;
  bh=B7JfPpFCxlFhL99uBvp+RvHcSEJYB/2nAVQwcn8saAo=;
  b=AxgUWERcbRnqxgkhjDRvMFJgIj6JY0ekYwVDBgV87fhvAQnkERAo+r3q
   vtFRGy+ekosNnYnQvt/Croi2Qqu8FutzWlC+KSSDEOGlXhLwMS+ueLyoi
   oNCK6ehoU3nYWRvIwjNaa2i6GWkWJbf+7o9SrQ6DYBgXda3ElJj8vBM7j
   XvWKZJyVPVcYZKAIEZUhXfRzLNIXw8ay0ba0fRh0HaiRMvusPLmh9yN5l
   E0eq8pHXBHTaemGWK6qnoby8t4MsIVfax4xv5Vh9CbD3TMtytQ08is96x
   GTc3yhCl3aWytAEZwR8bLZ6YUDqtykCzG1VBDl5/D03tzJQVz12Uv3I/G
   A==;
X-CSE-ConnectionGUID: Mc2Z0TsFR9KO9rcpWcoqeA==
X-CSE-MsgGUID: Db668DgFRCa3Pj0p1jXaCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="95011173"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="95011173"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 23:02:15 -0700
X-CSE-ConnectionGUID: Rt6WT47dTxCPUGzbr6G1Ig==
X-CSE-MsgGUID: Ig0fXCIgRTyIguLeAju2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="256559042"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 Jun 2026 23:02:14 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weRXu-000000000Mb-3jmg;
	Tue, 30 Jun 2026 06:02:10 +0000
Date: Tue, 30 Jun 2026 08:01:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 116/117]
 arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): Unevaluated
 properties are not allowed ('SDZ-supply' was unexpected)
Message-ID: <202606300745.QqizSRUc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: James Calligeros <jcalligeros99@gmail.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   99c4b512cb31202c213d72e2422577adbe1324d6
commit: 23222697835edf01bf50a1cd09c9e6de67f57c59 [116/117] arm64: dts: apple: t8103: Use new codec bus keeper config
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300745.QqizSRUc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300745.QqizSRUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606300745.QqizSRUc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j313', 'apple,panel']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j313', 'apple,panel']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8103-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8103-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
