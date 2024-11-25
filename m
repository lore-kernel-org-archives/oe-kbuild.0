Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B11E517
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 06:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732517324; cv=none; b=NFb0aWVPtmaNpcphTloTBJr+6gl2hNODi6iW0vtgCCelQyXatfF8iYsVTau6gjV423YMFOPgEf5O++BNFWSfl6RYMbvUTXSMhuYCvuxyqgP3q6eEgABR5g4iikQQKLmIMH+kkSX3ZNL40bIELjJyzdwRm/V+BGflhcvNiATnoxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732517324; c=relaxed/simple;
	bh=zwIlYiUK1qb9YRdAGL0U30uQBhBPLpUe3iEihHOv/j4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=calJuHrTcMS+KM3oplJaQctbTgzncHS8oPLXfe+jPB/XuHtY1iVJbtveF4yM1gi/rurViwBzCGk48gXOJPTmINJIX884StY82IHFIMPe5olLgdzmgJyGtj4wY7YMWsndvpqQL0R9VwF36cbo2/pZDQ/db55U5i9guxlXYwURx5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XE7bqrmG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XE7bqrmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732517322; x=1764053322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwIlYiUK1qb9YRdAGL0U30uQBhBPLpUe3iEihHOv/j4=;
  b=XE7bqrmGXj+VfmSfxZHPZgdAOIIcvtAkPxXzO/uO69jo0XhDnUHx/41l
   mImWuhNITrYkxklY/5MlUxiTKPnGTk5AT2i2Nl0LI8oZwow5YLRQ1wvMV
   cXIYyXeqXoOcMwisXyPwdWP3i5676wZh4M2kiVwW91e1PCLvzUkvs3UvI
   NhGW6Ckx97hbKWvStZZNPYC+nps230iKJn3ZOFWmXgEZ+PbW2yxffak8I
   wX6TK+MtBg/vKDUfXY3imJvBQIZ088DONflOSqRDsNUk0kpgYICxAvAVl
   OWzXruB/PSz8Z0lorRTUBZywCNsc/wIkB0bv8p+PSxUD7KrNa+dk2ThVz
   Q==;
X-CSE-ConnectionGUID: ZJy/LCLUQ4uLpRe0L141Jw==
X-CSE-MsgGUID: AVam9b7sSzGfWmYXbpoN1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32550383"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="32550383"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 22:48:41 -0800
X-CSE-ConnectionGUID: NoomE50vSkazoC7oviJXKQ==
X-CSE-MsgGUID: Hh7uI5IqSzenliLY0ThQ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="128685765"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Nov 2024 22:48:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFSth-0005zR-37;
	Mon, 25 Nov 2024 06:48:37 +0000
Date: Mon, 25 Nov 2024 14:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 46/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb:
 /soc/reset-controller@ffff015000: failed to match any schema with
 compatible: ['thead,th1520-reset-ap']
Message-ID: <202411251453.zPK7cCzs-lkp@intel.com>
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
TO: Emil Renner Berthing <kernel@esmil.dk>

tree:   https://github.com/esmil/linux th1520
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: 7db57db617e392f554cd3837bff0749d249c6160 [46/48] riscv: dts: thead: Add TH1520 AON and AP reset controllers
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241125/202411251453.zPK7cCzs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251453.zPK7cCzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411251453.zPK7cCzs-lkp@intel.com/

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
