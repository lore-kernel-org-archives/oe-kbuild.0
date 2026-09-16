Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFFF37FF50
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 06:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540840; cv=none; b=geqqEAEcdwDr9kd36f4rEaQyfCxfx8Z2q4DxMfou7u68gWb9Y3Ix2WPTl9aHkCq4X2UqL7yYQETedXhqObvMg6vLK4KqHXF0m0wh9OnEW5Onzalp0uW7RR2LisWbeOYBht81KGJ3fjWAR76mdV2WHi8qgOGOU4Or69xUQwwDq2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540840; c=relaxed/simple;
	bh=ppC/BmaNZli+oG9n218bsTYS6nwU/ZODf3yoVK3n4Jg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TUXpwIXpyou5i8pcDjRyAKNrBDr30K0fgiIrfLyflDS4gsTw2HISSPnGbxXO2+1FhSCmlAUwBPOCMh9hU5mVWEYTVsVkCapOG+fjeKDT2Qpyf1dvCQoTodyEdpSQ/jeOE0VVuDycZkqfYZuf7O8l5o3cXYo6MLnfZyZO5Q/T7xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBNMbuEv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBNMbuEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789540838; x=1821076838;
  h=date:from:to:cc:subject:message-id;
  bh=ppC/BmaNZli+oG9n218bsTYS6nwU/ZODf3yoVK3n4Jg=;
  b=EBNMbuEvefVvS1ItzZWxuEeT10jaF2xECsTIHKZGE5SJO/i5J/UlgJn1
   llV72LZUZX5GnLyf2rSqFFb+5I77lfB1G0e1NgNvPXYwHr4X7miwMj5uq
   VLOYjoRHoXzswlSsyXS+mNnVoH0ihmYyUwo7Puek34FgY1K8T+X1b30o0
   AvVGg27EHlyLWcFMSNCrNprPAP+fo/mKNBizOzBO5vd7Pxx7ShR1Kp35h
   dcav0hrbV9HMId5gOXKKepatEQU2o0UsbXgid6rrw20LTlUnHzwkSh5Aj
   j7F9Qy8vCtA7IdAC3UZlQ3ej3cOvhTCGH15B1lQlLn7l9jGn6cuuUSYdz
   g==;
X-CSE-ConnectionGUID: CyfUOj8QTqqkuSZ95hQcvA==
X-CSE-MsgGUID: Sk4xXkWnSuOeL85/N+XnDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101256631"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101256631"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 23:40:37 -0700
X-CSE-ConnectionGUID: GQlSuBg0SfOnSLC38/gKiQ==
X-CSE-MsgGUID: CW0cHetAQPaEq/8NGGKCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311517267"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 23:40:37 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6jJq-000000000xL-0awb;
	Wed, 16 Sep 2026 06:40:34 +0000
Date: Wed, 16 Sep 2026 08:39:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/gf/p8700-boston.dtb:
 /pci@14000000/pci2_root@0,0: failed to match any schema with compatible:
 ['pci10ee,7021', 'pci-bridge']
Message-ID: <202609160842.NQKMOwij-lkp@intel.com>
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
TO: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
CC: 0day robot <lkp@intel.com>
CC: Djordje Todorovic <djordje.todorovic@htecgroup.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aleksa-Paunovic-via-B4-Relay/dt-bindings-vendor-prefixes-Add-GlobalFoundries-Inc/20260914-155549
head:   568e71e95163b244dbf120d1b736cc14735ba1d8
commit: 4ccd7b4744948e81d51c827871dc523886b24fd6 riscv: dts: gf: Initial support for the P8700 Boston board
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-2051-20260915 (https://download.01.org/0day-ci/archive/20260916/202609160842.NQKMOwij-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160842.NQKMOwij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609160842.NQKMOwij-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/gf/p8700-boston.dtb: /pci@14000000/pci2_root@0,0: failed to match any schema with compatible: ['pci10ee,7021', 'pci-bridge']
>> arch/riscv/boot/dts/gf/p8700-boston.dtb: /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: failed to match any schema with compatible: ['pci8086,8800', 'pci-bridge']
>> arch/riscv/boot/dts/gf/p8700-boston.dtb: /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0/eg20t_mac@2,0,1: failed to match any schema with compatible: ['pci8086,8802', 'intel,pch-gbe']
>> arch/riscv/boot/dts/gf/p8700-boston.dtb: /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0/eg20t_gpio@2,0,2: failed to match any schema with compatible: ['pci8086,8803', 'intel,eg20t-gpio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
