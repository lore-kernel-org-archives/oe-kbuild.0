Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D591E517
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 05:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732513031; cv=none; b=J/bv9HLXRRAlsPbWAIzqARESe1jgj3Uku0urpKjJJ1EuWQQuH+VNybTvqHKODMoTqngmsHzo7GWvPE1moSKIHymrRn2nK/j3fFegw6x3EDlXsOze0TymQgIHl7cBEJ0YpaqDrKqCrrVnESqA0cgAqifVVmxMp6tKLsRW5FuK6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732513031; c=relaxed/simple;
	bh=mb5wJTsrrDuQG9iMmj0WuwAXniiWdPN26KwKv65zmNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n+WFcFSEEUjzhkdvP76q/Ki8Qai0X/ycPXahzPDCgVwstQ7lvJJ9E/HFl1i09bw3Kj6CQ89xyFxtPhBDDB3kX8f2UQY5UcckUwOjulR3yY+79ojs9TPmVq7B2V64o+w9vKbH6A9QFJowu8zCbaiehcbL3IR/ifj4EarhDjJft8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQO7TQoV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQO7TQoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732513030; x=1764049030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mb5wJTsrrDuQG9iMmj0WuwAXniiWdPN26KwKv65zmNs=;
  b=IQO7TQoVYJwobrv32xEL+qpBDLZ7zS76D4UiKYKsZFzZEnOe4v5hDgiK
   M3QmBHM2Q6NHFCMrBMY3vEzu2g8Kk9XZdWDJl5YEuYWa1SGQ11Y4G99Px
   8md2KwoLE7FHUg3P+0i8/XVjuLcoE+dvHsNvW7RZ315ZT2K35ofIzDgfz
   zSMq/HH9/dI3ezkU6uEcXnMhCRowqPEWsz2HaZQagYtFPGiZqPxdP7lzr
   /OsP3sazdQkPUvD+XmRj7iJvxiOjP1b5qyRmIEV1wwhspra9JfiYELftG
   5N5EaIq5qZDvQJ0DAk2R1FmKZj2xMTJhtL0mkXA69BXqUW/HgHZB51R3m
   g==;
X-CSE-ConnectionGUID: qEIA15qfSgGhTl42blcA1A==
X-CSE-MsgGUID: tcobuTJVQTq+Gsg2ODmgIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43982141"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43982141"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 21:37:09 -0800
X-CSE-ConnectionGUID: Z40yd1HiQVWfIeaoiuF3Cw==
X-CSE-MsgGUID: fniJnpjcQ6WjgqQ0EACV2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91506614"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Nov 2024 21:37:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFRmT-0005vN-13;
	Mon, 25 Nov 2024 05:37:05 +0000
Date: Mon, 25 Nov 2024 13:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 39/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000:
 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes:
 '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
Message-ID: <202411251345.pwdjvcVI-lkp@intel.com>
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
commit: 4aeb151b4e0dd319591bbbe106a259b48128eb5d [39/48] riscv: dts: thead: Enable Lichee Pi 4A USB
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241125/202411251345.pwdjvcVI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251345.pwdjvcVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411251345.pwdjvcVI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
