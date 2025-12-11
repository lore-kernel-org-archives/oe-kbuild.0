Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A969A2D3EC1
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765462071; cv=none; b=jaiIgMM6Tj/ZGgfEuD+O99nEzGIWH/hzh84DgHwNEyW9z+4ZPlbueu2iAItvbLlvbjfdwxM47bOsVtcOImSlOuNyE5C7dbBJRN6TxW24r0IfomPGCKNdvifpLn34yV/6n+wsjgO6erz+acxbhciHCwoDJ2XnccRcXow3bHuMN8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765462071; c=relaxed/simple;
	bh=UZGYFsxjrIxWQ7jMLoluJQvIe/Rs29RhZY0NTSmPVN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ycom+IDCzKTQbmvemStfabaaFGFCmg9+SzCLu1ALgnXxoN+sqqh3tv7XvIu6C0i9qE2rQTTvwkUc4+nX4Cvs5tuFuedoT4UYkIu9zoKT9oqdHkBIleXUT8cFLASxt42V0eialyck86FwjkH4W/E4Q9Z8PCfHyLXbG/QhMCuc7G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loDYs69y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loDYs69y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765462070; x=1796998070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZGYFsxjrIxWQ7jMLoluJQvIe/Rs29RhZY0NTSmPVN0=;
  b=loDYs69yCBRVbm86EwkJRVWPHLOZCCbt/SpVvdSC5GPchDwza673/8SD
   0tvYk8N9FOoWHTFG4M5178IkP2LUFgrXAGty1olQNn3MHriSbRXkDGSrL
   vazwhov3aZNRak+1xfW2b8QcEWvFBk0QvAct5R422Pd3L/busTBCcdMeg
   1QRXSYOZQYM+vSg5JFBLOi8ULM5OenUv/cuUBHZ0JtK6pZ5Ab1p3kbCCf
   xUKxt5dFgIvZIb+Wp7yMiaCIBvAEtnIbp2l3Y36H7ebX55vOioPnrElMB
   3ftYnY9+zWz8jQwyIoYefiMLJ4l2ATFQYvm8ZVCNOcl5z78M/PSnyj6cT
   w==;
X-CSE-ConnectionGUID: oyydzRUBQG26mlmzXB/0pQ==
X-CSE-MsgGUID: qDU8A9cWS/q+nFTmmYgEQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67330580"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67330580"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 06:07:49 -0800
X-CSE-ConnectionGUID: /y4BJxIlSIS5VEjR/H7EBQ==
X-CSE-MsgGUID: v4NHgj1cRzui7NHVY2GXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="195885522"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 11 Dec 2025 06:07:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vThKb-0000000017I-3LD6;
	Thu, 11 Dec 2025 14:07:45 +0000
Date: Thu, 11 Dec 2025 15:06:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: tools/bpf/bpftool/bpftool: No such file or
 directory
Message-ID: <202512111525.ZLIn68II-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Blaise-Boscaccy/lsm-framework-for-BPF-integrity-verification/20251211-102027
head:   f9446c46acf56c2229fb66d543f3d457a1a2951b
commit: f9446c46acf56c2229fb66d543f3d457a1a2951b selftests/hornet: Add a selftest for the Hornet LSM
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111525.ZLIn68II-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111525.ZLIn68II-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512111525.ZLIn68II-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: tools/bpf/bpftool/bpftool: No such file or directory
--
>> ../../../../scripts/hornet/gen_sig.c:17:10: fatal error: stdio.h: No such file or directory
      17 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
