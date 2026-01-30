Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320A437F0FC
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jan 2026 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777950; cv=none; b=hhax1qfITgNjaNjhUOdL8IMoz3nZr93YoAtCQNCBT8JThVrWDF+iErEd1+lPnPcvGjA+Coe5qEj3SYOMZAoHbABY+pAtd2oslJfoBEMECVHMNtXgnW8dYuw/n9Tb7mN5ROdw+f0C+TVa5O+2z5bdXDJqW5FjsVDj1pAMUg1nc44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777950; c=relaxed/simple;
	bh=HoYPPblBi2yVjg4qcNrSk7DhGXtJnLbVd673INPeICY=;
	h=Date:From:To:Subject:Message-ID; b=kwYF0wCrQdIrrgIx1K9l1T6JTQ0hSgCcwl6A8ecKYM2iQva7BI0j3BURIhPuxPWtKE+Zvi13WzHNOmErTsZp7hybFFMBxQjw+4KGv0l5gdAe9C8OoMbukRUyI1aywNThEIiHVcNDgduXRzip7EQ+jXxKpHiR4n/VB97l2PdVH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lp9DwgWM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lp9DwgWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769777948; x=1801313948;
  h=date:from:to:subject:message-id;
  bh=HoYPPblBi2yVjg4qcNrSk7DhGXtJnLbVd673INPeICY=;
  b=lp9DwgWMRJkp17RcJwJV5OF8JjJAAQN/9L6uA8619zpUGmizbjQ6XFnc
   DEV3BXoDJsLDqcaHcoIGNjwKrz81R+J4s1Lt22J4SB3/iTPt3/vYQeXmF
   Qb0d3f2Cy6b4zwJD0TM1jFWqEg7y6qaTMjERRIQduAciju46FZeevHU92
   6sVNsMaxHvEDMic78EUax+6w+vukQIfBHLYYE/xVBE10sVROXpKJmmgNl
   OfqVldvflGyZ8Rv7UaTRvdteWaZbYSjGb2YHphHHifFW+z18YvyAI/5Qd
   PSyF3LYeAM/4bFuTRztId6NpFa+T4FDzrbgbN9EnViNySBZd+mVFeXDJT
   g==;
X-CSE-ConnectionGUID: dtapLNWgT7eq08jMvQSSyg==
X-CSE-MsgGUID: og5Uu3/tRhiWzznpjOoH6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81660084"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="81660084"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 04:59:07 -0800
X-CSE-ConnectionGUID: 0G7kcgD/TvytErU7De21lw==
X-CSE-MsgGUID: oN7MMNo+Sgy2tIEM6kEhpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="208090807"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Jan 2026 04:59:06 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlo5Y-000000002V5-1Awh
	for oe-kbuild@lists.linux.dev;
	Fri, 30 Jan 2026 12:59:04 +0000
Date: Fri, 30 Jan 2026 13:58:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 24/24] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601301303.fuLeVR3X-lkp@intel.com>
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
head:   ef8ce361d95d5b262a8c40a3fec8c3a08c40d22e
commit: ef8ce361d95d5b262a8c40a3fec8c3a08c40d22e [24/24] cover-letter: Add DMA-buf mapping types and convert vfio/iommufd to use them
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260130/202601301303.fuLeVR3X-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#25: 
match-making system to select the best type offered by the the exporter

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
