Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD52E11C7
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273235; cv=none; b=cAPSC+1YHH4tXDyNYNq3boAa1r2ya8vjkTytvZsTN7zNXYodPK1JmWs+y5s89ZmjciSMkv2q1dmTedh/EQy2xj8tXXsD2ZxRPlbL249JDkdqG8Dv8tCem69aIjE+L1WdiE5Z7/CrYmGxXoFGPNzfGEjpfEGbIv57bGlqNc3do9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273235; c=relaxed/simple;
	bh=SFMocnlak7RWmgBvjuXfkgbFQrOFer94ZtRaYINRIx0=;
	h=Date:From:To:Subject:Message-ID; b=SAOWv8CB+gLLf1oPiNOcJxYCLNHMbchB+vSixEuA+eVHiTGDa4ivhkkiq/2RpnxZwxNeoP1UaaXLRpix7HLqqHrLxC5hPftiGarhT5yEAEN3Mqe8ddwI8flH6KO/bog+bud4uLT80ukv1AwDZCjxEQBBHgKGY7N1sFjPX+nIpBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXJyg4LV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXJyg4LV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771273234; x=1802809234;
  h=date:from:to:subject:message-id;
  bh=SFMocnlak7RWmgBvjuXfkgbFQrOFer94ZtRaYINRIx0=;
  b=MXJyg4LVKusAV0Lq86CA8jFv/mmzJBk3MZG3RDEjAynALRNy+idMCyqm
   SNbljGU8PSEcHBDRkXahSDXtne98A614EZWt4ZSvlp0k6c7Qoxudj/CVR
   t72n/9Gr87nZtjVJIXeF3GWqbbgeuxsOYBvYZBm5F8QnkbBatZi0iirQB
   /xq/jyO6UXv7VZZyz/Cx4delqit79DyDZysFrW+59bhfUx75C+hSYe92y
   CpFWb9pQEpWOlUSmGFs6J1Tr0UYpgsplL8mnR+4c7BPCJhHv5hcs8wYa2
   fX0svMgLS8uT+F/yOfjif3Ztk+PPk1/S9cn0z4O3fgdqCkslfXrkyA2PM
   w==;
X-CSE-ConnectionGUID: cm05Ca2LTXCY26viZ22KxA==
X-CSE-MsgGUID: R7DBnUyFSCSyoYsM8jYp8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72347154"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72347154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 12:20:33 -0800
X-CSE-ConnectionGUID: mocmokMbQIaTYQ49rjchUQ==
X-CSE-MsgGUID: ErjMy5OhRiakl1KDNtx/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="217667633"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 12:20:32 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs554-000000002ZZ-1PhO
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Feb 2026 20:20:30 +0000
Date: Mon, 16 Feb 2026 21:20:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 23/34] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'that'
Message-ID: <202602162145.RPtZBQ9D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   b8045146761f68620f4271ddd60f43e4db85ac18
commit: dff7d4e156c95ded1e255e9db7323c7cc6bce96c [23/34] dma-buf: Remove unused SGT stuff from the common structures
:::::: branch date: 45 minutes ago
:::::: commit date: 45 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602162145.RPtZBQ9D-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#179: FILE: include/linux/dma-buf-mapping.h:147:
+	 * Note that for non-dynamic exporters the driver must guarantee that
+	 * that the memory is available for use and cleared of any old data by

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
