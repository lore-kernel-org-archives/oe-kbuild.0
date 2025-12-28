Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732223A1E8C
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766928716; cv=none; b=QOBKuDNv61D89NJU3DGwz7yM9DWeya8aMf3YxfaFtpPQ2uaGgVMq/84GNMC4Ikq+sdrNffwrPoaT/CA78FhHBZUmcLMkIFDjl0FqzZgLof53LDqcImRgypdiYET32ygfA3GCqDJD2MR5h9KDKt3rD0IDZej25PGfCTJDf8dpWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766928716; c=relaxed/simple;
	bh=Uak6RnpHuJIvjXlQ68QSHjpVwzHctq9BBwDC/z6Uy+g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rs8lR7d7dKeyw1xyr81M+I/55OyFGCaepjS1hEtIwUnxe4I4tSIp923UstWt9NXVI8Z9kuELWJ2m2/0qLe0C5KLjm9bdmEGoEYjAUeid1jIIeFVIe8oQpDi/Q/NgcPq+ZWsHqZ6bhMAZtUq900CCpmpO4tC9qQpmNfP1JYgVlzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8iFXuOF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8iFXuOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766928714; x=1798464714;
  h=date:from:to:subject:message-id:mime-version;
  bh=Uak6RnpHuJIvjXlQ68QSHjpVwzHctq9BBwDC/z6Uy+g=;
  b=a8iFXuOFg7hYTY3NLbyBVjBYGUpQoZUT6moWKw6/pqS1dunFcNu0YOOn
   ne0scWv+ckGk/3A3zbtFqVz+XIB7XOAu3F8k3ti/itYwP7/HLpdw5g3S8
   ms0rXHc8Ny5aYxk6SeI+6/xI0RXrcWwu7IZ8ZxzYQhKIHhqnyGcYJGoDA
   uuUbSIvG3VSYXCSReALgRpQ/ZBcbIFP/z/HLX6Q+cR/HxHY6FU0lHQ4Is
   ezmFczKtCYjdsvrptmhSgsr1tEkUq2jj0NAMyehK3trY8aZ7oqRv1j+C8
   o6aHjnnS6JuMrmBJk1puINQzKmNUp7Xhb9FouiiK389YMd80z3NJ5Ku5f
   w==;
X-CSE-ConnectionGUID: 7+aMDUF5Qoisd1xKZbY2Kw==
X-CSE-MsgGUID: vj9VRpKCSVO/sWWEfymgoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68462787"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="68462787"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 05:31:53 -0800
X-CSE-ConnectionGUID: 8lPYetPKSLGjfq2MtS2jbw==
X-CSE-MsgGUID: 8WAELazHR2SHkNEqr/Twqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200351972"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 28 Dec 2025 05:31:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZqsA-000000007V2-34Zd
	for oe-kbuild@lists.linux.dev;
	Sun, 28 Dec 2025 13:31:50 +0000
Date: Sun, 28 Dec 2025 14:31:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rppt:hugetlb-init/v1 22/28] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'it'
Message-ID: <202512281419.pglXPWaD-lkp@intel.com>
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
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git hugetlb-init/v1
head:   14379ebbd57d21503b16bc2fa03e699ed0067fb5
commit: 9cbe197f8d7866d1bbff91f3031301b726a6aea3 [22/28] arch, mm: consolidate initialization of nodes, zones and memory map
:::::: branch date: 2 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251228/202512281419.pglXPWaD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#39: 
After this refactoring it it possible to consolidate hugetlb allocations

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
