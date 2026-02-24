Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27652405E1
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929161; cv=none; b=Z2GRgLryyWFfGFpo+2pZ6XvK2DsMbeIfPg6FDUvqQSazsqPZTTrgrTbv33O9dDF4qvG7NnEgRdBMnL75ISFqk5Bso604LSKMvcEuNP4qZJJwFSYvyI6EIwvvThVNDD2Hxo9vHianagbOAvuS7J9u2JvlSx+q5qrcHpHOzuHxS2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929161; c=relaxed/simple;
	bh=Ol3Skr9v305mJ36mY8TeIuc5wc3hDnjW3O7HGGDx0zs=;
	h=Date:From:To:Subject:Message-ID; b=ImvcQCDUsf49OWTQ4OKuGQjnw+kCDLxoFCj396i8uycPQ3G5NBdfEgQ8+eWmuzResKamdd0syoY1kCXFJzJlBdNLNByc51Y580kY4RruJQHpheEX4TtHXXvJMCSKz3YPRaNmmgiFJic6TlrG6L5VT2BpD33IXJ0Xchcu1gJMYkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+CwVm+g; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+CwVm+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771929160; x=1803465160;
  h=date:from:to:subject:message-id;
  bh=Ol3Skr9v305mJ36mY8TeIuc5wc3hDnjW3O7HGGDx0zs=;
  b=V+CwVm+gfYvCgYdywAv+LqpU+AcOQN2Dsvd5AZkc4/+FUPcTBh56H+Yh
   2IWx100JAWRiiEj8F341aELfabwxPMfQPVI708a2IZDHd7QnEnHfYZeMd
   f5geep/hXVDv+wz4Rvzr4r+J5HvtItrFrzjZZYvZiuuucJM8BkSlKmdGh
   +tkBAc7oWndw6To42HqVboapcsGhfAcR8KpRuo+o7F8xJYrggL6owGSwn
   KElTWiVqZY9QhkwuGNROe8B8e4CnD94XVfcZ5J/Rm4eJnRh1Mw8T0CHbG
   IgUilRlG68F0Kxwx6se1gH9+rs370oIGZ7En0TselkB+zuEAMyUPp1Cyb
   g==;
X-CSE-ConnectionGUID: 2FgmstCCQLqbYpGvpQuZng==
X-CSE-MsgGUID: dknnz8iqRa2zl4M7ux5Htg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72850542"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72850542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 02:32:39 -0800
X-CSE-ConnectionGUID: KORip7KqQPunTysZgcl6fg==
X-CSE-MsgGUID: uBn4eb+1QX6cWQ8K5X96pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="215718100"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 24 Feb 2026 02:32:38 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vupiW-000000005BD-2N2H
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 10:32:36 +0000
Date: Tue, 24 Feb 2026 11:32:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 8/733] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202602241156.ZWxrY5tE-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: 124aaaabfb6419e13075900ae1dd75eb8259e831 [8/733] [SUBMITTED 20251204] PCI: cadence: fix build-time dependencies
:::::: branch date: 29 minutes ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241156.ZWxrY5tE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#7: 
The split of the the cadence pcie controller driver into three modules

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
