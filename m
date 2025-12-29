Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECAD286400
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 19:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767034817; cv=none; b=IdP7VQju9gluuBqzwaa8MTdG61npHJBK3NfrOq/K0mQEHMHD3ANwrMySdx+PYQDX6RqkPfP6cQbHIjwx2KxTeCEY6ZiGJGgyyHGY9fwt2PgpWY3kv+A3eoFqCt6rdQjoDyhdd0BXtJmKmqnx5DtB7yCvgkU5xASxYUUGT646EQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767034817; c=relaxed/simple;
	bh=uoDsFQJDl3AzmhQYHIcrRyqT2NbuNcRXhUlKIz+fpt4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iP5S05hysnFvKOCX6cHKojuUoCeNFFmX5cjHZrjPuI6LRKpO+gOlKoe8CoUloXN5YORNtIfeHwLOzY92dnF6msotCFQfqgtxbqu17gxXaiWdsP9U5kjpQRAhzcMX2eGXv5dk+cCNzFq0Xr3MZM57/A+uE2i/bjrEAEyFQ8FlpZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEc44LM6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEc44LM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767034809; x=1798570809;
  h=date:from:to:subject:message-id:mime-version;
  bh=uoDsFQJDl3AzmhQYHIcrRyqT2NbuNcRXhUlKIz+fpt4=;
  b=mEc44LM6berCeQKJTRqEqC/ielxzq5Ko6IY8p2OYmh44EPShZBBgi3Lo
   PomzZ7cOGD8rA790NhuavyBO2UjH5wsI1jWKo5uvQUCzctERCFAIml6Fn
   nWyr4NWrI0BwUCJcZ8TkmJ0jYMt0dChr3j7DQXR5pC2rHkAqyNPtcD4YJ
   E0kisyjP29h32XXXL1U59bMd4qARqeHcrZHGATIppCygz7anmMLURLeSI
   7vSpcz6NyWMGOmFwkP0QKifpTxFIFnHrPCQ/BbwkW8M9BvhREoldAUAym
   zb6HqxI6EcYYfwfyPzmeJFSH5HMDHmsfqvqbC2+KIflM2BMaRwUXRzisp
   Q==;
X-CSE-ConnectionGUID: bwJTxR1HRIGUVUZGhJ1+8w==
X-CSE-MsgGUID: bTc58fGJRjCVP9VEcCjOjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68533587"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="68533587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 11:00:08 -0800
X-CSE-ConnectionGUID: ciElhow6QhaYtpP+DqJ/tQ==
X-CSE-MsgGUID: InTqT8M9Sd+x+9dkaNw6Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="205501050"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 29 Dec 2025 11:00:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaITN-000000007oU-0WQm
	for oe-kbuild@lists.linux.dev;
	Mon, 29 Dec 2025 19:00:05 +0000
Date: Mon, 29 Dec 2025 19:59:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 16/16] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512291918.ShiB9swY-lkp@intel.com>
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
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   099ef9ab9203dff327f2d61e44773f9acbc01f13
commit: 099ef9ab9203dff327f2d61e44773f9acbc01f13 [16/16] fs/ntfs3: implement iomap-based file operations
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512291918.ShiB9swY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#659: FILE: fs/ntfs3/file.c:1302:
+		/*
+		* We need to ensure that the pages within the page cache for

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
