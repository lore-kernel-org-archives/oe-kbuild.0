Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ACF3CB541
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 10:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936639; cv=none; b=d8QuEGG6wkoSqSaY/648IdtDSlLkiwi8BOSz3jSP1p4cdlKxf70MekX8BlB7iL0pElCpOwgpBCtrLNvnbU/xvpkP/rscyPOiI4h9xu5Eadsc83lJ/TbhEToPM8GrtWYhEoLwNfYFoq02I492w/sDs4MwrsgqetgDbyXTu21FhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936639; c=relaxed/simple;
	bh=GMEjauHF0fpqdU39vtk3uMk+sk0tZAK7biTzdj+TmRE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sATNRjicEH1g5ZBqapdxM4xU3mYqTxID7ZdEFjkFAZbyvrSxX8M8iadBoa8z1rboWMZifwd1f3LcWqFTPTn/xDgNPtu/AiLsZBnsjv1TkPvElA/f3imLbtQOMDCJfan6G8tH0+7760nFlLnBEzW4Ixe+LKqZInXhMht6nn4WaZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/OI5W8N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/OI5W8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790936638; x=1822472638;
  h=date:from:to:cc:subject:message-id;
  bh=GMEjauHF0fpqdU39vtk3uMk+sk0tZAK7biTzdj+TmRE=;
  b=l/OI5W8Ni2tSWkcuZYM8e4fgDwqLpihXldzj0pEV7+Y8w8oilcN5UJ6P
   PQaNn+ltRsctgutwlfjCBQzt+/HaY9ZEvPgos0BqKwnOFOPR72YAMsk7u
   lDGmfsilTj/dkXrdH2FWGS9xq5cHISGS8s+1nrPc6CVWvYlWhHevBLByC
   d5/YbLVjavzTaiZXrRx6KD9QDU2GKxoJ8l3pU4Ok4PEG64V2RgfO6Cfrz
   VBq/XBIhBXFS7zgywnZ0OnZ/+P0m38k6vqdIqJDubyeBAQJlotA9XF+tP
   FlsieVf4NMeEQo0nh5ADR2lna80fKWc71JGEaGy9LifPXbVD5IMWOFTm9
   Q==;
X-CSE-ConnectionGUID: EMRXFmO2R32S5hGLBGumjw==
X-CSE-MsgGUID: qS546IqkR1awWE19fCP8DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102225287"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102225287"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:23:57 -0700
X-CSE-ConnectionGUID: 4PaqsX7OR+SVtgKJnBACIw==
X-CSE-MsgGUID: Yxv+YBIwSiqvZOEVje9+pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="246557"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 02 Oct 2026 03:23:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCaQj-00000000SvU-0UDx;
	Fri, 02 Oct 2026 10:23:53 +0000
Date: Fri, 02 Oct 2026 18:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/rtc/rtc-raspberrypi.c:18 cannot understand
 function prototype: 'enum'
Message-ID: <202610021858.1Kn7GpjZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Sander-Speetjens/dt-bindings-rtc-Add-missing-type-to-trickle-voltage-millivolt/20261001-213701, commit: 48694201a4e43273d47a3c5ffe2196ab5788d8d4"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Sander Speetjens <sander.speetjens@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: Jonathan Bell <jonathan@raspberrypi.com>
CC: Dom Cobley <popcornmix@gmail.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sander-Speetjens/dt-bindings-rtc-Add-missing-type-to-trickle-voltage-millivolt/20261001-213701
head:   48694201a4e43273d47a3c5ffe2196ab5788d8d4
commit: 48694201a4e43273d47a3c5ffe2196ab5788d8d4 rtc: Add Raspberry Pi 5 RTC driver
date:   15 hours ago
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021858.1Kn7GpjZ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021858.1Kn7GpjZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021858.1Kn7GpjZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/rtc/rtc-raspberrypi.c:18 cannot understand function prototype: 'enum'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
