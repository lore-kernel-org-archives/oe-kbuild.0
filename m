Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27781E4929
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Apr 2025 04:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745729956; cv=none; b=binTLtpWy2ls10vuYy0Y+256Sm6nhboxrhV2TFL4WCu4lR0LgMAZwYowEvRfWVZo1MJq0jglEKk7o07kstCRLfdpG44PpoFrc2jxsJ/Fuu30W7DEYYD0haYJ38lLv1DDD0NgA96NjyMuRSQqEH5SbD/8wfzCmkQkNPXo254q438=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745729956; c=relaxed/simple;
	bh=V5AWwxbT6RDjLcLOv/RrdmwsWr3eSWUk0wLT74Jor2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Icq+VvTuaWsKMC0KFSijekkGiscckUNq1EUEauwR3s13r33Pawu0Td6+d+j8Z4OjAhxT4GzCvP55k70ZocyVvOZykHIGchBmArnSSxwGyaWnEAaW/aCXG+2Du4u7xqBqsvRHfx1Az4QN408y7awyv+bn4P7i3uSQ2kVZNbE+wBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCC139Up; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCC139Up"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745729955; x=1777265955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V5AWwxbT6RDjLcLOv/RrdmwsWr3eSWUk0wLT74Jor2U=;
  b=cCC139UpKkSTT8fV45qAmkwdkuO9f219Zzg0jJfU/zO1RN4gnBlXwem6
   hTw5x3kVIG+BxLP+R5xRVhdHfsrHLFItz88NdQObTaWdXfdG5oKRcAMQG
   ot5GKYmvRMDuKx3PUzQ43ukZXsEAOru4Q6hjzTrueoNEVYw92ppF4ZoEm
   58++NBB9KE7Ky3QN4WiiyTNYqF0hB39hNeOZystCaVSIDagM0PR2sy5SP
   42g69DyGDXzEN2cvm0HClq2xHF9vhpZbkhEXQQpDOn1WIP2R2zcazg3dH
   2xaCLeFWcZYHKY7qaTOfeDZBwT38avPmL6DWXszyTOXSxOALUczDIp128
   w==;
X-CSE-ConnectionGUID: zJy3bSLeRI6WhFPQgXMWZQ==
X-CSE-MsgGUID: AI8iEte0T0uwM8AObcZMaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="49992892"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="49992892"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 21:59:13 -0700
X-CSE-ConnectionGUID: a88QKLGfQGCPQjWJXwIbaw==
X-CSE-MsgGUID: sZ6ynwmeRJiMCU10CNpdcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="133138931"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Apr 2025 21:59:13 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8u6f-00067p-2v;
	Sun, 27 Apr 2025 04:59:09 +0000
Date: Sun, 27 Apr 2025 12:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/memcontrol-v1.o: warning: objtool: mem_cgroup_reset+0x64:
 unreachable instruction
Message-ID: <202504271244.e6Sj5Rhh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Roman Gushchin <roman.gushchin@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: ea1e879631ffdf640bfcb11439d61a151067bb39 mm: memcg: move cgroup v1 interface files to memcontrol-v1.c
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r111-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271244.e6Sj5Rhh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250427/202504271244.e6Sj5Rhh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504271244.e6Sj5Rhh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol-v1.o: warning: objtool: mem_cgroup_reset+0x64: unreachable instruction
>> mm/memcontrol-v1.o: warning: objtool: mem_cgroup_read_u64+0xac: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
