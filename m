Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB5338758D
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778315486; cv=none; b=bFaTABNOZ3Y8UnetIPOzU4b359O5hytwDboqWnWk9Trb42yhJqAOcHnRp4AZdAEFIOCnRJB3Av4hhs/qC7OqnAlkgYmH6hbTVIVGi5r2lTaJk271d50Et7qQufmbprMFgAUTBR9fcDx3HxfRLD+/qmMJlJue2bKT24aU8HnPNyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778315486; c=relaxed/simple;
	bh=uKO4NorVvLEQmciWb4UOtku75rRNidRJNAgX78mr5do=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R8mX5qmAtkw56YYv3w7ozFLuKW+PMVhUtFr/HYOsiXN0xaxOtCGuJAD8Yc9xtrdvoMKni/EIuw/up1YEcEt+0G7jmBM1oB7BA7pADlZXlSqXkTUQxzB6CZvHoGTiQHClvEYsH7wjBC5NHh0V4v0raSt9IzkZXhd+XhHY/AuHjsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KL+ELoam; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KL+ELoam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778315484; x=1809851484;
  h=date:from:to:cc:subject:message-id;
  bh=uKO4NorVvLEQmciWb4UOtku75rRNidRJNAgX78mr5do=;
  b=KL+ELoampXSXFmQ8U7jEauJmaNlZWPTuc6xMBWyqPiRqry92hPe3hIJ7
   YGdDELabk2143NH5aKljF1sgN9vHWHo0vXFQRpA1NcqdsDkOD2SDamahY
   qZcCJ1PRTFjZxqhmeQNz9AuagXzH9uKGkBg5CJGOl7x4yCSdOaWtE3I0J
   siSo1jBfWZVyjAxSfUY3O+rTU3TlPzMUriZp/hQp0Pob2tTcfRhoOpnMI
   51AiUr4NvBxzzrncOdqz5KhNfR8tOyIA6/SUIH0OhbPVtecXkQJZjHPZJ
   I1VLdh9sxgZ51NtWHkwtCxG/F19ENQf0LqS9GJeP+wzTruxbu+rEmkglO
   Q==;
X-CSE-ConnectionGUID: xzqMIqHIS9qAK5MZ/4I5qg==
X-CSE-MsgGUID: 6+KS0Zh/RxeBCKYh6jChwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="96706745"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="96706745"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 01:31:24 -0700
X-CSE-ConnectionGUID: +ED7VPIwT8ykW5j71amiEw==
X-CSE-MsgGUID: UqkaxfyrQDmCvBHDTNqjTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="236918107"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2026 01:31:23 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLd5k-000000007Nx-3KHp;
	Sat, 09 May 2026 08:31:20 +0000
Date: Sat, 09 May 2026 10:30:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb:
 display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
Message-ID: <202605091007.pGYU5bi3-lkp@intel.com>
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
head:   70390501d1944d4e5b8f7352be180fceb3a44132
commit: 4f96c5db61f238e8a957df2b81d6343a5e38ca59 arm64: zynqmp: Add support for kd240 board
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260509/202605091007.pGYU5bi3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091007.pGYU5bi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4f96c5db61f2 ("arm64: zynqmp: Add support for kd240 board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605091007.pGYU5bi3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml
--
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
