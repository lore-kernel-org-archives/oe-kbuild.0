Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7322618A924
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727427610; cv=none; b=A9SkwIyU3u+13Y4Gz5lC7dFyO9ATohVMPMiiOon/IayXhF9HkXRVbhhnZR1Jfe93C+UUxd2cr9WW9nLRSzOVKxM3bwP9zz+sX9akB/sg1mH1IOMvth+FD719SOf+Dc7MtNfF8LI173SxLOY5o2/v4gLqsmEIQz2E99mUdgTTMMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727427610; c=relaxed/simple;
	bh=fbdBQanFJCCSlkWmOkkz7rqP891thkYrfx8O6dao1Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEqggwU1Z0SHbUYZb0UN/m2Wm5nzxdVMPbx/EURWrT0PZDoeybJtDfzV8D9DNtWZGRL8x9Bw/PB0eI/rBv1+Sd+aTynBZD6mTbRpBKLZZU9KMyrL/8aUY8V3tpqYZm4RdWQZIJhqt2XgXNyRY7l12YFw4a4JBASzy2knua8nex8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xet+jXO3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xet+jXO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727427608; x=1758963608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fbdBQanFJCCSlkWmOkkz7rqP891thkYrfx8O6dao1Gk=;
  b=Xet+jXO3SuVVRoK4uarAkIF6AwFtbFn+ZJdgNmxJ8UQ07d6qLrWddkKN
   16D6rjGoDyZrsB5tf2bJRm8Bb8vHBgpQUA9Y4ZMYrX+lra4I/Q7a0bDyz
   7+AB4gPcQrnIDcSQu8LlCgUTWcM1FUegZRQP7bgt9wIrzjs36KSbcDJiL
   uuKQc/Ijlo7zPzk985YIMchC0QQLvHF/V6NTt0gcbJT+bAXJtfYkY04CC
   c/xKkJtFv42N3D+py7qyFDea5ZJeU8qUIpno01u3LdXLqhM6xV5Ild6oj
   LpBuF5vWBeaxpA74RhLvcIQCP92K/upVoYwXpY+5y5GSbXJ1FRqDfzwnh
   Q==;
X-CSE-ConnectionGUID: sIvxH9eWQ9ax/2p7A4shIQ==
X-CSE-MsgGUID: fOWF+blVQMOjebH1WABsfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30356120"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="30356120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:00:07 -0700
X-CSE-ConnectionGUID: lP7J7D6GReuGRFaSPZ83PA==
X-CSE-MsgGUID: ZPW+MMaCTdKe2xHFZanoAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77254609"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Sep 2024 02:00:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su6pY-000LjD-1H;
	Fri, 27 Sep 2024 09:00:04 +0000
Date: Fri, 27 Sep 2024 16:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip 3959/9999]
 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb:
 Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address
 (also used in node /soc/pcie-ep@fe000000)
Message-ID: <202409271618.SMgLH6L6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   95b722b3ebb739e01ce712254a92789f843917e3
commit: b99c0f465b6398b36ed3bef6fac8ad2078cd3bfc [3959/9999] arm64: dts: renesas: r8a774a1: Add PCIe EP nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 years, 11 months ago
config: arm64-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271618.SMgLH6L6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271618.SMgLH6L6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409271618.SMgLH6L6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
