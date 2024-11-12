Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4321A6EE
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Nov 2024 23:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731455614; cv=none; b=ie/x8xhhULggUQIhrsdgIGOdmbY7kN3eDXHVERfmYZZ2Gf8HdR/D8Y9WZXfZyAzrfRrrfOpRq5iwJyfrdqGoegpxI7QJWWQqflIFFdL++tNbdMewSCybmGegRCzZD/fqC5mYWBWcnFz8aqRYMpB15IF5mi5pCs6Wzeb/Yl/k6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731455614; c=relaxed/simple;
	bh=NKQy3RIMJ5dE6+LYbn/AMPmiaQRvT85cOm2NEO0BeyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AkLvVNTN/RuLsOqfeudKY4p1rHWSZPNwR9y3GawOK1vJtLSiw9KjxViyvuyGOBEoLy+9XhMrJxzRHUh0Kf4Qc2dpaMKWwtpNLb3yaGLyjVWWUJFhhmS3fWc8yTkhXQU4esq0LzmuhP9bc6xY5517f7/W9qhFg/9kR3Tj6/25tfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cU9371A/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cU9371A/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731455612; x=1762991612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NKQy3RIMJ5dE6+LYbn/AMPmiaQRvT85cOm2NEO0BeyU=;
  b=cU9371A/52haq9w1q+4bO2i1MpjwBL+nHeSXMTV40hNXJuYAvmzGDjVy
   FJ94yg4Py//fnNfvhx4z/hYgb6rZwwZJ1lrp1S9tJijp2cLKcGQveK45u
   m8CW9kJq+OO+Why/lwjXYqWb59D665hvJiPsPW+X/ANtSEWy98NBN5Lq4
   93OW3DNMEGP8CkZliBzbfQX+qme77kzt+Mhn6KZdPAxuaQ6h/per8lSCf
   trIp62k139ws3vQOvK5r6pA5Rys9Zf1qJMPsAhLzqE7TNVBNSy+RPravp
   02PSegQiFxI6H19PzUIhftB/mk9ZsCk1NPgo50zHbxYmjgzkSY/WOa9No
   Q==;
X-CSE-ConnectionGUID: 7eo7qIYzShW2ZiB3V4kczA==
X-CSE-MsgGUID: UgWfrpMOQL+T1WfzgeuCFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48831688"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="48831688"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 15:53:32 -0800
X-CSE-ConnectionGUID: q54u4lzWQXy/iGNQ7kx1EA==
X-CSE-MsgGUID: z06SDzDDQyW0ENeiF7oWyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="88104717"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2024 15:53:31 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB0hN-0001qV-0B;
	Tue, 12 Nov 2024 23:53:29 +0000
Date: Wed, 13 Nov 2024 07:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 46/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb:
 /soc/reset-controller@ffff015000: failed to match any schema with
 compatible: ['thead,th1520-reset-ap']
Message-ID: <202411130747.9fx3WNk8-lkp@intel.com>
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
TO: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: 7db57db617e392f554cd3837bff0749d249c6160 [46/48] riscv: dts: thead: Add TH1520 AON and AP reset controllers
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241113/202411130747.9fx3WNk8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130747.9fx3WNk8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411130747.9fx3WNk8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/reset-controller@ffff015000: failed to match any schema with compatible: ['thead,th1520-reset-ap']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/reset-controller@fffff44000: failed to match any schema with compatible: ['thead,th1520-reset-aon']
--
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/reset-controller@ffff015000: failed to match any schema with compatible: ['thead,th1520-reset-ap']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/reset-controller@fffff44000: failed to match any schema with compatible: ['thead,th1520-reset-aon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
