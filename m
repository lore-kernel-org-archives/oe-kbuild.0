Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BB29CE9
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416582; cv=none; b=SEn40B3b1YZFOnZGHOlxEmJCPIUE4qkw4Voh+e2+UOjDgKehJ4W6vVq7ktfKmsp+BcGvzHCKoKUq/kUtma9lm8zCPcJlO1y1etoU4K79NZTv9X73i/oTvQ9B2syhHyM0zqU29HrN7cBOs1RA4Y9j/M/+pIW1Q6/Wgpz8ootj/Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416582; c=relaxed/simple;
	bh=XKv1dLhJN7tZswiTXJwxUKRzJwZUFTksvsdY76hagY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TCV88MKnknLtl4qyz5rHp5HeJeZ/BLsUGlJ4/NBpS1cg0x5qo3kkzV9cijN86nlUjdzh9hzhEgUrHrhczfrPx/ZR2FUw0NZlDCYc1JG5tQyxmqnZ79XHwGcDoz+qS1uOaO4HyiQmO8JtUrnqsIJKFkyVP1+dTQibbeR5K98+EB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mxysyizt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mxysyizt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769416581; x=1800952581;
  h=date:from:to:cc:subject:message-id;
  bh=XKv1dLhJN7tZswiTXJwxUKRzJwZUFTksvsdY76hagY8=;
  b=Mxysyizt1h5rW8ZTVbOwiuLRQQbQLHaerXA8tIYxpu0E+EZA8eNiU8do
   lbqMnUm+aEgogytEGUSxP3pdYmyjJoLtfV7nWejDrJArAy877eBSKsCcy
   AxDH+dfgAC75TIklas1BNPjW8Ha9qqZcWuVdkjQ+tWKP/945ZpOPCycSh
   YPhJek5zWirlBEnpq7GKRC285x4qjdK3M9Yse13qN4cc6QxS6LFHP5wWD
   Tn8cT6jXa3shZUadmKVPwyWuEfXXeMDD1gKwfCDqs+05gS/83+m2E8a2v
   81/JtwJYITbvtZwvN8qRcmlOQZQ9RC9RBSaGB9wSJNYi6HscOHIn+cLvP
   g==;
X-CSE-ConnectionGUID: sz9/rkRlQLGKdSHruMVDNA==
X-CSE-MsgGUID: i0NPycPgQbmSfrCXZQUYOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74221741"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="74221741"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 00:36:20 -0800
X-CSE-ConnectionGUID: kvOU+KagRomWn4Df6FbU1Q==
X-CSE-MsgGUID: mA8XoKXETB+8rk3vKwkD/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207978575"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jan 2026 00:36:18 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkI52-000000001U5-1mjx;
	Mon, 26 Jan 2026 08:36:16 +0000
Date: Mon, 26 Jan 2026 09:35:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb:
 display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
Message-ID: <202601260949.Bo2Ur9lY-lkp@intel.com>
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
head:   63804fed149a6750ffd28610c5c1c98cce6bd377
commit: 4f96c5db61f238e8a957df2b81d6343a5e38ca59 arm64: zynqmp: Add support for kd240 board
date:   5 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260126/202601260949.Bo2Ur9lY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260949.Bo2Ur9lY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601260949.Bo2Ur9lY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
