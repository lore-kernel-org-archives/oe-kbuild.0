Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C02B9B7
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126543; cv=none; b=saCtP2KwhDrOIEQaE4kVlF3ZGdmnTs8Fma6aP6NVHOy9uO++dqZd+L4bQ/jU8/ZZPRL+n23DGVkdTeVsqQvi3HCufNoje9ra6KILAuUrG//4ga986bEDAteXrmDmVXRhLXQ0oCV5VmWkoUad//sJy3VaM0h1OiFZ3wMGwXxL9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126543; c=relaxed/simple;
	bh=aTov/aEZqyWKINlusOZUHEAY/QyYv3WdmOrkan5bEs8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CtAFS8lvs3KNl7T1FoH+Z+0tB2FhLaq8yWY2m1riLDF2iNyOC9yB4X5lPGctHvtV1SAtJNX3uip0w/5hdhMPwNUYmQpEdUEmj+Qc2WOS5AM1jWHKKGDHBCEogQrMDWWi6miIw6LfRxIQ5KM91SVqSQVluq6GNabf5s5hGIYc0aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCqe724N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCqe724N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766126543; x=1797662543;
  h=date:from:to:subject:message-id:mime-version;
  bh=aTov/aEZqyWKINlusOZUHEAY/QyYv3WdmOrkan5bEs8=;
  b=QCqe724N6YCGw465lOJCeOu2Pm58hT0TunDoClHywr8rlUbEBDReGdus
   mT2zBUIX2rBUST5/oMYTx5CWDitfUhDVhL0lI2UWqGaR7691EomrrPYfH
   D5va4z/sKnVGGN00y2JthLX4g8aYyNehAYW7051aST0ZPD/BsPvianYn0
   71pEMiecmMGrjQIayyvd1rpRRiCckk6vjTWK7srmR3Be7apHBemC2+uQm
   YhofmbUtQGxapXe8PZTQluE8lUDivWy0LQJuArlj1GYE6x/juVvkIZOhw
   KmjrRZe7tJ01jsWJxfk1dMs6j2ACUgFGYywOnRrW8GQlKO4bMM2aGn8Og
   g==;
X-CSE-ConnectionGUID: RNmQf9MIReO1dq12csYeoA==
X-CSE-MsgGUID: N7y6MdlCT4uPcnrgcZoy4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67981046"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67981046"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 22:42:22 -0800
X-CSE-ConnectionGUID: Db3gUBTfRrKiWh6m21RHjg==
X-CSE-MsgGUID: 7qQ6Mi00QYSWIPoaKy8vLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="199054700"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Dec 2025 22:42:21 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWUBu-000000004DM-3nid
	for oe-kbuild@lists.linux.dev;
	Fri, 19 Dec 2025 06:42:18 +0000
Date: Fri, 19 Dec 2025 07:42:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:spec 37/131] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'ioprio'
Message-ID: <202512190755.JKZrfdqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: b628df8464b87118e1ccd4e3f2d751a5bf87e296 [37/131] kernel/api: add API specification for sys_ioprio_get
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251219/202512190755.JKZrfdqV-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'ioprio'
#195: FILE: block/ioprio.c:657:
+ *     // Get specific thread's ioprio
+ *   ioprio = ioprio_get(IOPRIO_WHO_PGRP, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
