Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E947987B
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Aug 2026 21:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787262754; cv=none; b=DumFKkowz8o3haG7TGd6o+BRsuvE6vYgX9rTifLNE7GoxZSvtrx+QltIvnfPP64eYO6D5urJJWvdqkhGoav2hDdhDEkhTQh/nwTZWrhcqSf4CRnqyjUf0lSr56CYwbeYG0FrhVQgcjHUNbqy/LJZkBQtZw0ESlS8yS6zbjoKNBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787262754; c=relaxed/simple;
	bh=w1KJsHBp/W+tEXYnlnfyI+tLum1JchcqSwYmE980FcI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qx0ciLz+39YjMuR2RqN6EG0ZW4NgT7a88VbChY5bcc5sitlPwsgcSTEAFsviUzlEzEB+T7IzhFm/wjVMLjpE0aii2xq1c2qx//lClhEVoJk5K1EbMOzNN0T1VUE8Q4xrJ9vU+dBzYRRPAlk7KIXUVMvpJ/gE3Ryp4NMh06/FdYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DC4Xf2bl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DC4Xf2bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787262751; x=1818798751;
  h=date:from:to:cc:subject:message-id;
  bh=w1KJsHBp/W+tEXYnlnfyI+tLum1JchcqSwYmE980FcI=;
  b=DC4Xf2blor0411XZzgMd/OJl93ukRnP7D/d9Rx/C6xJeffpRyc1iIbIQ
   1XpIal+W0KD1hbYHzKWsiM1S9Xs8C3UniF97GJPAWN4YgrXCZDy7dRERs
   1ygN7y8lmpoaRQluaMl58CBFP2ycE5wpyGr9OmeVsZnqhdGQpcilNOCix
   wNPhzVRuKf1/4kyGeTKGP+OqCfLcFZJ27JCzVboCIS9Q+kf2w6uJ52bxM
   ccVDRcMz3f0HUVe2bYqc8E5XEPKQPCGMAVI30P6aQtrXanli7J7/SNcAS
   Ayq3UGabZ39iFXUr7F8tFY0tmw8tvHdDy+gszmLrw9fEmyWimr03S58jV
   Q==;
X-CSE-ConnectionGUID: DgQWTt8dSGGuV7qw5+77sA==
X-CSE-MsgGUID: RdJjJbxESD2sttQiFp3RyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87831757"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87831757"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 14:52:26 -0700
X-CSE-ConnectionGUID: GAOsJIr9SpOHKXYBKvMjJw==
X-CSE-MsgGUID: 59Ty4hs+SYemM58iAyDcmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="264854433"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 Aug 2026 14:52:25 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxAgQ-000000007Zh-43Xt;
	Thu, 20 Aug 2026 21:52:22 +0000
Date: Thu, 20 Aug 2026 23:51:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb:
 display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
Message-ID: <202608202333.T1aKXR9s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Simek <monstr@monstr.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c84d3e3130dfe1058cb27dc78e7ad8bd36f0545a
commit: 4f96c5db61f238e8a957df2b81d6343a5e38ca59 arm64: zynqmp: Add support for kd240 board
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2054-20260820 (https://download.01.org/0day-ci/archive/20260820/202608202333.T1aKXR9s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608202333.T1aKXR9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4f96c5db61f2 ("arm64: zynqmp: Add support for kd240 board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608202333.T1aKXR9s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
