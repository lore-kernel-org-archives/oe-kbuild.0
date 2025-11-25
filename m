Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D327B353
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764109728; cv=none; b=iAQn5sq8hrBTtkxK33zTrqxU46qTdTm+c8s+dv7mB/biBZNM6quCboJD6Wqj1ST/kq8ixR0HQlG9LpR8i6MLoiwpBGJ0onHYaJDBVG6UxQo7Z4R4+8NnXOE6erOomN9EPfDRoXWuuzlHikNkJUr95rhTd/z6rCQVIFOKbE7sSwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764109728; c=relaxed/simple;
	bh=vKD8KFGq8e5hqiWorqHF0rhtEOAz8bmNVkcHMhjUdRM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WrNj/MUfMAkrWfYgPjqR+a9L8aZ39vsx0d5NKmZcnMdI85aHhe9ovR5VKWDySMJBKLWoH3VCZnCeSvfHG1dVErLmrQ6DsI0Htf9sI8Vdn63iTtS2/JzyMWtr8d3QpoOtS6SsUuwtnxmP6yclVyf6fQy8KZXDmolDn6kUee9P4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxL15JUl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxL15JUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764109727; x=1795645727;
  h=date:from:to:subject:message-id:mime-version;
  bh=vKD8KFGq8e5hqiWorqHF0rhtEOAz8bmNVkcHMhjUdRM=;
  b=QxL15JUlNjgh5Dq0skJfI1Cogo4hUX34mNXUj0iNrMc2xUzLDHL5r8lN
   5fUa27PpiCoIzz/Tyml0KvdStNNfpk4DP76apEs7VLSDmMBWquAdK9+Q5
   JvMdQ3eomGHFQ7ks8ABSLa82CqFl5fuqwNHEOJmMXUdJcTuD/KwmPzD54
   O8XWFp1LcUSYkQZza1Z5Y5kvDnr/vZxo/yBKqN+mTH/365bRngc+Mff++
   ZmS+CJR9Xy6sW2NlgCJj3cwNJ40Uz/jgJhG8Uqq+fzSB98tNxFpma4zK7
   qZGBFhjS5EyfFPQgTmWI1MecKe7boIaFes2bYCogkHgdn/KU0qzbD9v0L
   w==;
X-CSE-ConnectionGUID: t8ujz6/NRPSah0so+Fdvrg==
X-CSE-MsgGUID: iRyZtKneSAKz6ynjbrjQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66219264"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="66219264"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 14:28:46 -0800
X-CSE-ConnectionGUID: eOuVBQWERsWnCOd8k8Rz9A==
X-CSE-MsgGUID: zEJWdTMtTwW4rF3peDmSXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="197248543"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2025 14:28:46 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO1Wd-000000000Zt-2HSN
	for oe-kbuild@lists.linux.dev;
	Tue, 25 Nov 2025 22:28:43 +0000
Date: Tue, 25 Nov 2025 23:28:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-attrs 31/71] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'code'
Message-ID: <202511252356.Aw0L7zyx-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-attrs
head:   75c3d4a3c7a6450ce51da1d337f0713a374668d5
commit: 132db951a9e6cd2660633878a71f726487db3f9f [31/71] fuse: make debugging configurable at runtime
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511252356.Aw0L7zyx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'code'
#28: FILE: fs/fuse/Kconfig:104:
+	  Say N here if you don't want any debugging code code compiled in at

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
