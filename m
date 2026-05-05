Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E196939903C
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997770; cv=none; b=lCX1ZjBu6OOjgKHHXX+gO5IDA0iW/s2AxGvXqAKYDS0KYJ/94KX48wsw/rCEJMk9F9Jxed960MZcTyl6clzJh1GafW3xabXhUEV6QLZJZaodeS4ZpCkM6xzUwPn89V69XT24lbXMYCoXarm498PS3S0GezdwfXCGTMGQWp7/p/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997770; c=relaxed/simple;
	bh=jX+qs5O5fvlMrPAr/nqbQlnzB0jA5eJuujvDlkiuPMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CoYA1Ag8+2xQnB55V8PTuNvkNZ9dETygwrmwTDbguIidrbayQ9pwT8+0Z09w6Q/0A+wKf15aueMUYhvKF9EvK60D4Avet+q4ULkuqWZ+idPx5jF7a0MB1KwgzJENpLRsRj0+oSDXkY+6nLwjjeQOgm4fY/UI1Za7QOx7jgAc1eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2EphLi5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2EphLi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777997765; x=1809533765;
  h=date:from:to:cc:subject:message-id;
  bh=jX+qs5O5fvlMrPAr/nqbQlnzB0jA5eJuujvDlkiuPMk=;
  b=J2EphLi55QQlc6HyT/ptrV60b9Op9Y1ZB1zHBTfAdAs+r0QmTMsO3l4U
   V0JNjwqlyjKRSKh2Pbjx8nKoFzqKBNGf2fb9Os1lUf0FQ8mGtqaNh2Sx/
   lSy639byGNgCXSBP+HGhU9KMg1V3TawdlwZgop16UuX+kxdM4aRsgrphU
   wTZ1W0Xre1J7zzuiK3k3uKg02cPC0Ozynezt8GNg1QSGioXd44AHzWwF5
   5SY+ATdSJhFFLUeDBb5lpdOMpKetiTlgK9pOndakftAeonAz/VuwLGSZV
   kNQyKW7utyJkdxfnFGmpzBAz509gjSfbNs7ShY//ChLz0ZKS7z+HF9Za9
   w==;
X-CSE-ConnectionGUID: r9/BASMXT2CDhtOxpLjjkw==
X-CSE-MsgGUID: 7aMBvta0QL+W8yLbrPMy+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78897360"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78897360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 09:16:01 -0700
X-CSE-ConnectionGUID: BHE1WMMcSe6v6w9pHcn75w==
X-CSE-MsgGUID: Zlbq9O1VRyShfCFDfEdmsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="229372253"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 May 2026 09:16:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKIRD-000000006Gh-07Es;
	Tue, 05 May 2026 16:15:59 +0000
Date: Tue, 05 May 2026 18:15:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb:
 display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
Message-ID: <202605051829.7huuD92G-lkp@intel.com>
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
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: 4f96c5db61f238e8a957df2b81d6343a5e38ca59 arm64: zynqmp: Add support for kd240 board
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260505/202605051829.7huuD92G-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051829.7huuD92G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4f96c5db61f2 ("arm64: zynqmp: Add support for kd240 board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605051829.7huuD92G-lkp@intel.com/

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
