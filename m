Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3C1531C4
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Nov 2024 22:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731449901; cv=none; b=YfHCqpCleNQv/HcESe+pBNgL+/VW0SiXKmvqu05PXlg631IVdM4QGDyvpvTo32T7vW4Gm76genE/88BKdOpBTcHIS+PEkQ7fYwByzlY7WTfTjlw4difcyXNifzvOSQJ631y2xe464ig8pUYg8iz/JVgUrA2IubHWDqE1b6i+V78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731449901; c=relaxed/simple;
	bh=9xXn3/01c6ngn5174f+tTdJB3i0YPDZdxz9NaTDtSxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QOoUomAROFS/16qVF5pSvrTgi9fQbw9aMKJPFUagVkOVd6OUw8ajqKIy1rVtf2UsDe7R/v6M10Hp9gUyAV7UKzN3dkLc3ENK+bQSDVaiO/xW9D2XLGfL6nr4Db5KyLrXaEuBa+dKZETN1kzqWKO3rtohT3ChbHxKztY/U2XfncU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWnQzjV6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWnQzjV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731449899; x=1762985899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9xXn3/01c6ngn5174f+tTdJB3i0YPDZdxz9NaTDtSxI=;
  b=iWnQzjV6uGCS2PYfZ/uBrM70B7atAlUktpYuntz4jVzHyD3sib1XIOf0
   ffn1K36zl3pqR2Cj9BNlV7URWntDdT+Z023mvvcHgxJNwv0aTP4JXM/H9
   swzib8vfzvGGOF2qTpp3LN14vXQb0Tjl2L97AeBRzxUmha3I3iwIs/6LK
   QVZlK8+hfhndF2vNVonxnxcH8d+R9KvuDhoNkzKiPwVVSGJOsEjN0oNiz
   xZ7JlLfHTKBfampb2Uuu/rF6Pm2093GpAL/55Gi3gk+rpHjAq7453cvEv
   +E64ttg8MxWFqfFj4NT1RlkdXEcH+6u0lKQeU0osyRr5tMz12XnfPUYaH
   g==;
X-CSE-ConnectionGUID: igZURN7FQI6Ykqwqn11uiA==
X-CSE-MsgGUID: TpaQpxPRQgmsU81sNHLkjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35103826"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="35103826"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 14:18:19 -0800
X-CSE-ConnectionGUID: HTmvbo/3Q7OzHr0Q1b/NIg==
X-CSE-MsgGUID: x7DGjwWuS3u0lHcldXtlJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87569613"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Nov 2024 14:18:18 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAzDE-0001mT-0W;
	Tue, 12 Nov 2024 22:18:16 +0000
Date: Wed, 13 Nov 2024 06:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 37/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb:
 /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible:
 ['thead,th1520-misc-sysreg', 'syscon']
Message-ID: <202411130620.8Zel78T7-lkp@intel.com>
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
TO: Jisheng Zhang <jszhang@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: a82aae031f0bc8928a1d647ecffbc4e5e2648604 [37/48] riscv: dts: thead: Add TH1520 USB nodes
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241113/202411130620.8Zel78T7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130620.8Zel78T7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411130620.8Zel78T7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
