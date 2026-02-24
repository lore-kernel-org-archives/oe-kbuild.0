Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D163806B3
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 11:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771934143; cv=none; b=LEt6YGdg4S2AhUc08AoMNKHfJVNyAYWqQqDn7OZoSMmnVaGG0o7t1cgyNQjvqlSEjY5K6zRcn6nWHKvX8s+nK/iEuvzJBKgOMM5l8usMV4r8VR9Z3DLeyQbWeHSooo2IzO9yJs8mPLVU1RH6+JamCUmo338hqYcmS1p/i50l4JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771934143; c=relaxed/simple;
	bh=26/xj+79HTXZtfX7y88c1LRLXfpK7YlofHl54KW0T+E=;
	h=Date:From:To:Subject:Message-ID; b=DBTnTjNVdddi6Tt17dAtACT0I/fnxaBTzmx3qTqcX6VguZyRCcQjtRnYqYyrf72qKreEkg24pWQ3DW/L9LQ/fJMNxj5CY323NHQdXEjgJnI5kkjFo2l4O0OGsbtFpbpl3oGnXH2UYsaB3JF4aauDRmvJlxdZD3n/eL4AGZuqIms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eq/MdVLE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eq/MdVLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771934142; x=1803470142;
  h=date:from:to:subject:message-id;
  bh=26/xj+79HTXZtfX7y88c1LRLXfpK7YlofHl54KW0T+E=;
  b=Eq/MdVLEhblYa5GT7JWG6x4dgycRp8SypZ5dGwaFI4k63TmAwn8zDDP0
   8B8/hWvplRl1LxYVROXVloiGV6BOkwD1NGTbTk+jI2ygJYoatBe1vDCHl
   cYWYK0LcFnecfPN9iBkgXvI1lXYVTVSyCkz5JjPW9xjzWqxHGjrJNgszJ
   M5hOCSMC/kpYVE6Tm9Cc53xlc7PecxRixM7bdVBrM0XE/IzbH0q5WJnKq
   NJErMXAxo2OV5lM8Mtwr3ZvZi8V1xXb/lqmmD+GeAEpaV4eMzAzHfsPhN
   /I4h8FeMqWkrM7B8C09QNBWpya00jG0GrxyupiohjC7CUeh5PtzJoJ/B6
   w==;
X-CSE-ConnectionGUID: EgA2cH70QXy24BfKHuejwQ==
X-CSE-MsgGUID: w5wqX/nLR5mblSO/sIZDOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83269471"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="83269471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 03:55:42 -0800
X-CSE-ConnectionGUID: S414VSvXROa6TqEhzD0S5Q==
X-CSE-MsgGUID: HSG1MMkxRnmRTW5T5OKD5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214124608"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 03:55:41 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vur0s-000000005E3-3VW0
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 11:55:38 +0000
Date: Tue, 24 Feb 2026 12:55:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 169/733] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202602241220.Pqc1rTnV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: 4a57de222b6d7a62d5241a637bf74d5cab5e637a [169/733] [SUBMITTED 20230619] [ALTERNATIVE SUBMITTED] sfc: link error
:::::: branch date: 2 hours ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241220.Pqc1rTnV-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#48: FILE: drivers/net/ethernet/sfc/ef100_netdev.c:326:
+	int err = 0;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
