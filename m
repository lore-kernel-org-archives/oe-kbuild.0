Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A231FCFFC
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 01:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786757935; cv=none; b=KJVIm3bJKZLVX7bS9P5qQnGiAQRcFMfxBQDqHFTQoGfWUkar75/FyTJl7ec6qpyYZZJomkkbSZRS1l7rfd3Nn+r0+FdJx0gWM3LFijAG3wZb6ButH4zfyPGcTQJ10cJkDOsgDXyoHmkmcSlYi/W12ng9gohOb6snPxqNsgg/2Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786757935; c=relaxed/simple;
	bh=eC7RZ53uzQAZ6gkP6jFqZN6Adv85UzfyyEaGPs7r+IY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cQ+FRnsccn6F72Du7ExCHPK3yEfqcCcG2pB+6qaufQilpOFf8xPxBw2mpQl1/ev7T4E3PU8MhPmUjbR2ovNwb0DqxkAkwwVNGuB9JONZhoVOpiLCUkfETQmMBN67vDgugxaPOAHXgtqmtSi31wLMTs9Hpl+Hv2dgF8zoi3rO/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kypuvifn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kypuvifn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786757933; x=1818293933;
  h=date:from:to:cc:subject:message-id;
  bh=eC7RZ53uzQAZ6gkP6jFqZN6Adv85UzfyyEaGPs7r+IY=;
  b=KypuvifnuTVueVukG01oVZtkfqWDk5r1WuzTw5Up0tY8C+ZBhkcp79qZ
   MbdJbypRmc7XAswk+haqfHMrgI7+SqiiGBxOydEW55Kg3qlOnvb/ysOfs
   FhqIRSyIvabQq3SsoHnoV6523BIYXytY+INEF8ga+adVHAZMtIrWueGy+
   Ky7/IaGK0aIdSdMUXb9dZHcm1AiSdoxqdoOslF9BwT3Wl9pqvOuBHBCMa
   uK7RrmsUPDfa7SWYhdJEcem+/3VDNccRR0mpZ/CmrAVyvePeKyulg6dIT
   /UEAezEUQq9Rpw/6uakV1CEhIYvf3kpINyjLdrR+tIGCH4Ih0jn82CVWw
   Q==;
X-CSE-ConnectionGUID: M4QfU9riR4ecMYdIToRQcw==
X-CSE-MsgGUID: 8wUb9h0HSRizR9unOt5eug==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="89854062"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="89854062"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 18:38:53 -0700
X-CSE-ConnectionGUID: Tk7PMeMJTqOuZf0u17quJA==
X-CSE-MsgGUID: NlMSNyVjTkWMHcW9qTJzGw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2026 18:38:52 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv3MI-000000006MT-0bMm;
	Sat, 15 Aug 2026 01:38:50 +0000
Date: Sat, 15 Aug 2026 03:38:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb:
 display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
Message-ID: <202608150316.mSlKvCBk-lkp@intel.com>
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
head:   dac3e89a2c90c2feeb471e1f22a2512ad424b792
commit: 4f96c5db61f238e8a957df2b81d6343a5e38ca59 arm64: zynqmp: Add support for kd240 board
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260815/202608150316.mSlKvCBk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150316.mSlKvCBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4f96c5db61f2 ("arm64: zynqmp: Add support for kd240 board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608150316.mSlKvCBk-lkp@intel.com/

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
