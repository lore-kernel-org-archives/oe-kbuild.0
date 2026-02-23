Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BCC31690A
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771815503; cv=none; b=E6QZD1Aj2hgyQ2D1TUmE1DkDteBJAORPME+5cZezLxYWJcdbZJAKWNglcySJ8/JytWVQUeZvekH0aWwRvP/ZlZPvJAyKpK5pwi+9pmiAy73Gd9nt2Bf6BhgYWKE4QmiZ/WH6kE3fKyo/1jU/43KQBu6EQBrOWkoFeNOZ/YArNjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771815503; c=relaxed/simple;
	bh=GOKUeMsGgwG53tVGNV5oBvXVZeSHtcRbMg1vkWzJhPY=;
	h=Date:From:To:Subject:Message-ID; b=D5ENAznktOTi2DZHFnKXoHqJ/eVpcKS8vJSkztYsqWhNczxTqUpQAcuMCGdmokKj9I7DwykX4/R+TJvzJzIIcguTq7jCfew9U936J4RtwAdwn1D5W8iVkUUHLP9v1/RKYfmEev6lHNfQ46v3JdQMjWK60FRDd4oRm+0gxXBz3wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uostvr5y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uostvr5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771815500; x=1803351500;
  h=date:from:to:subject:message-id;
  bh=GOKUeMsGgwG53tVGNV5oBvXVZeSHtcRbMg1vkWzJhPY=;
  b=Uostvr5yhAR1KtfuWKKHzDAh2hU+h4IHjzfMpdQo3XJpyvaKNO39lGDk
   Kuxq3Noi4IOV7JM6Mi+jLE1UvFCe14GyFSUzkUljmoiW0CKQcInaKfDcQ
   SPTTziSl1cNgoOl4bcmHrEB4ZE8xULIlCTKA93bpJiiM+iJ3lo1mPxzZH
   e3N21Iu5UQW6shT0hrvb0k3xpAFmWHPOxdBXYiWDLXUSbfvNAltUVEav4
   XqGDsx5+RtVhtGjlzIXv6FdNBboTfY391QVzaHAjLQnxxaHS/JSfGgD7o
   +aj/3xCNDn1SjFT6PurMvbeF37OmNVw0m44vjfQfCNeCZCJZZxnzVNKhk
   Q==;
X-CSE-ConnectionGUID: PkuKLZQFQ5azEPBYR21TSQ==
X-CSE-MsgGUID: v2NefHscSv+Vjn5NJI3PsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="84257315"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="84257315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 18:58:20 -0800
X-CSE-ConnectionGUID: NfIK1iQCSNiP0YT4iV7qhA==
X-CSE-MsgGUID: yfGefMe7SUiR4DpjOegdZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="219548782"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Feb 2026 18:58:19 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuM9J-000000004mP-04bl
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Feb 2026 02:58:17 +0000
Date: Mon, 23 Feb 2026 03:58:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jfern:nova/mm 6/31] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'is'
Message-ID: <202602230347.CNOkPVGB-lkp@intel.com>
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
TO: Joel Fernandes <joelagnelf@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   9a973e0d54b38e7651c3123118abc568c5a122f2
commit: 539f618e98df84777b5f8cc179b57a02b09e3eb8 [6/31] rust: gpu: Add GPU buddy allocator bindings
:::::: branch date: 38 minutes ago
:::::: commit date: 69 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602230347.CNOkPVGB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#594: FILE: rust/kernel/gpu/buddy.rs:494:
+// SAFETY: `Block` is is not modified after allocation for the lifetime

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#598: FILE: rust/kernel/gpu/buddy.rs:498:
+// SAFETY: `Block` is is not modified after allocation for the lifetime

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
