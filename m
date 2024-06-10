Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BE136A
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 00:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717979032; cv=none; b=Ry2daIgbmDTThtcJx1qiHYdFO1YQCACNxnz6/ZK9Kd+oE5ESeBCt7IXh5UWW6HWyHvOx0p3hzb6KTqK46Hdx/hTSfJ4MaY+IG2rCscF4E/YReX7H29IpotoFHnwpv+ahj6arllWr0AnrwDlEUGcmyhXtGe2cRmum/MvFp2q5chw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717979032; c=relaxed/simple;
	bh=w0XRJ92y+b7RwOzU2Toa/dm3Oq6OuicCqwp5ZkfbSQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvCanTd18Uzs5UBrvdc3PlMgbM0g2n2wdZsmrEX3uVnt6z5NjYnc5SrlExlwh6n0KrkLPVsEce5ZXlmRkqvUBFiYDFVIGqPzEDkzeULOY1NuF0rTCOtf7j69svEnnuV9wvOPfXVcnK2VZ4tJ27zbZh6+XYhCCpxia+NDRvDJ1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzCWqGT9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzCWqGT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717979031; x=1749515031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w0XRJ92y+b7RwOzU2Toa/dm3Oq6OuicCqwp5ZkfbSQA=;
  b=PzCWqGT9f2JqOEgQchsRDxaAAHCL/jwavuXFxzwpaeMGkPBidkEfqXpg
   9NlaKbBC2R1G0Ax98+hSQnmbVSwZAhPU8Hms6zXCVFD3/eqaGXSbptknX
   mXSKz/wdP8fBwrKm056oi44iZNiTY+2Ep69I7Jz/ljHN9/n0ZXbMsJrN1
   7+houfT+GUrEJNxUfO2pptLPZTk7XdC/RdFpOCbGIHnbKrE8HqPjy8PPL
   ZUy0h2WkEhB1PJuI6dTHOnoyCrbUIkyQqZIeJkle7WytVnqyfFoCqAwC+
   WhFDSPud1B+c7ZoTDa18kIzb6tiLNyNbpafqGpm+j6VfZqpV0aYZAM1HB
   A==;
X-CSE-ConnectionGUID: QfAvGjKtRRqzG+xN0JGgOQ==
X-CSE-MsgGUID: q6sEzHocQ9yRVZuENkp2HQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14425609"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="14425609"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 17:23:50 -0700
X-CSE-ConnectionGUID: m742HSJYTtSHzfwGWVvAmA==
X-CSE-MsgGUID: fWzTTG/eStKKCJwSCrfo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="38982166"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jun 2024 17:23:50 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGSp9-0001iU-1t;
	Mon, 10 Jun 2024 00:23:47 +0000
Date: Mon, 10 Jun 2024 08:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip 3958/9999]
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406100859.Ex1FIvzp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 5d63770a26dcbf9965903c2df51f1aaf176c53f8 [3958/9999] arm64: dts: renesas: r8a774c0: Add PCIe EP node
:::::: branch date: 4 days ago
:::::: commit date: 3 years, 7 months ago
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100859.Ex1FIvzp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100859.Ex1FIvzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406100859.Ex1FIvzp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
