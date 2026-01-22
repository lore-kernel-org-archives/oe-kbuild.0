Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEE35CB86
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 01:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046330; cv=none; b=E1so5+S4Krx5jSOteiN6Gez5YkoqI7Z8h37tb3F3J5lSijA8yu5DnrwQYPbaMUAS0a1YBi9FbdjsPmTadO9RMFB86wfqVfX209Rypy2ZR+7S+HO4tFgCKXsgFu5ckrh4RIj9aGfNS6Qq05sjF1U/u6mc6Kgqix8RunQ2A+jTs8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046330; c=relaxed/simple;
	bh=NkX9AsrUWWGZW+Nc6f9QDOxqfw1R3W1kg7GwsbP0sws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oepVlZP0Mk3jKnapk4nEoaxwI1lfB69CcCxkKThWh0juhYzEta9tSvWwc7UOj85HM0QttLLxQqV0fVAOJTbyB7ZLiS0UKVwPigvX+XHF7H9oj5vOIyzaIad5PyVwHfrZqS30WOsk0VbTUPAQUTIUFuNX3Ah5706utUPr5j+tmhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daLuPC0h; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daLuPC0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769046328; x=1800582328;
  h=date:from:to:cc:subject:message-id;
  bh=NkX9AsrUWWGZW+Nc6f9QDOxqfw1R3W1kg7GwsbP0sws=;
  b=daLuPC0huNaMRMMoAHOT4MHK0uWioNBO8cpbC+NKOB1Dxvk40cwMpQRw
   7mNGE1Q2lWr8VORe0II/T4/vN6Kz7fgQTsNBmaW9EaAevMygWPhfN3GPk
   duceZNdqAdp3CYEzAmfHm/SR6ye6F+u+Q8IDjrA7ymKnelDJbMZRpZ21s
   5rAuzFRlph2kAw5UENDagxOW0mlVzRrumJZ4ssODMEC5l0w21KGZNpLBD
   EzW8JHFRPya2OB0X3eQWeMrN5EJfZnENvtzpKXxzug9nXY1GH6OhMjGCD
   rmSDxDTnO7ZMcS4R4I2gO6n8ypMP3VjLspe1bXrrkHNFiKyu0qw5I6cY9
   Q==;
X-CSE-ConnectionGUID: DyGGvpO5TNCB77PSE7CU6g==
X-CSE-MsgGUID: KRM1ayCSQhGUWXwDllbJLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70450203"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70450203"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:45:28 -0800
X-CSE-ConnectionGUID: tKoF9jnlR6iDAiD6+pe+Sw==
X-CSE-MsgGUID: Skq83zZKTRKDlgvXSLQvnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211114649"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2026 17:45:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vijlE-00000000SHV-02VL;
	Thu, 22 Jan 2026 01:45:24 +0000
Date: Thu, 22 Jan 2026 09:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:fuse-service-container 37/91]
 fs/fuse/file_iomap.c:17:1: sparse: sparse: bad integer constant expression
Message-ID: <202601220928.sk2r6bPt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/fuse/file_iomap.c:17:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   7c9264079abdd8c696eaf2f52de323ec31015a30
commit: 558a76ff9369b87357a7a15b976d228083d763b2 [37/91] fuse: implement the basic iomap mechanisms
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: s390-randconfig-r123-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220928.sk2r6bPt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220928.sk2r6bPt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601220928.sk2r6bPt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/file_iomap.c:17:1: sparse: sparse: bad integer constant expression
   fs/fuse/file_iomap.c:17:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   fs/fuse/file_iomap.c:18:1: sparse: sparse: bad integer constant expression
   fs/fuse/file_iomap.c:18:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"

vim +17 fs/fuse/file_iomap.c

558a76ff9369b8 Darrick J. Wong 2025-05-05  10  
558a76ff9369b8 Darrick J. Wong 2025-05-05  11  static bool __read_mostly enable_iomap =
558a76ff9369b8 Darrick J. Wong 2025-05-05  12  #if IS_ENABLED(CONFIG_FUSE_IOMAP_BY_DEFAULT)
558a76ff9369b8 Darrick J. Wong 2025-05-05  13  	true;
558a76ff9369b8 Darrick J. Wong 2025-05-05  14  #else
558a76ff9369b8 Darrick J. Wong 2025-05-05  15  	false;
558a76ff9369b8 Darrick J. Wong 2025-05-05  16  #endif
558a76ff9369b8 Darrick J. Wong 2025-05-05 @17  module_param(enable_iomap, bool, 0644);
558a76ff9369b8 Darrick J. Wong 2025-05-05  18  MODULE_PARM_DESC(enable_iomap, "Enable file I/O through iomap");
558a76ff9369b8 Darrick J. Wong 2025-05-05  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
