Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4D134BD
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Apr 2025 22:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744496233; cv=none; b=uy+IW9IuVuuOBeaYFQBPp3bcRicwJIwhyd8T0Dzm0R1RI306ylBokSO1Xoh/XDZJqT0tUzYqwPT+0HidsndO/f2TnG7JCGiMDzymUY8JyZRDNvDKDbVPRrkLhaI9FS292IZdXwlu01Cu+TjsXY0yLwnrEVtbhNmlGixc0bflQxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744496233; c=relaxed/simple;
	bh=b7q3kDbfNw9QgwTFNK9g6FyQGPcNJpuMJjkclAyNIKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rgJM7+r4zD5iZ5t0sC7TU8tYVY/n+3bjxDDLY5ecZVHa+2nIKx263wziy3bJHu+9aKhte+1hUf5TEaUXxoH/dR5selmuS9movdgqt2kYkZOUF1gCciW/7vAby6PZ6MPFRXEf+8ChGJo3b7k64nDHqBXsGdvd+5tmN/dTcLGRAwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCTyYQBY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCTyYQBY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744496232; x=1776032232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b7q3kDbfNw9QgwTFNK9g6FyQGPcNJpuMJjkclAyNIKk=;
  b=bCTyYQBYfvXx3HkjQLCKqigIMRF8cY6m0/t39wtXBAI8cR0ym3mOypQV
   DPApu3aGAAHsois3RirVgMAZn2G4CSx340dZrCZOz+7fL6CF6P7vuhGY9
   ZMUgm7zAuK/9GbIituoJ3BTs3GegHJL2YJzbv20oiLNpOOAZhUKWkxfgL
   /MkydNJ6Wapao0uZbqv/URsVOTbZNlWKznhWgL3JbvVSvJdxzzxEKvqW/
   8UlCBDqnSENFQiM02RYHlHxCj+AkixBlA0BLLcXt2L2l8bq76Ia5pV8qW
   dEZEbb8Dn63NTAmR3tlov4UgR8vZnPivEUdspvAjUoMDID8ZaCBHAB+6X
   Q==;
X-CSE-ConnectionGUID: YgLthKSPSOWlK250qWfmyA==
X-CSE-MsgGUID: DKycg9Y4R/mIEh3Akz1z0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57392425"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="57392425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 15:17:10 -0700
X-CSE-ConnectionGUID: QJK6xby5TLSzZUp4SxZAaw==
X-CSE-MsgGUID: V5CEufWmR/6U1mFwDsX+GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="129246098"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Apr 2025 15:17:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3j9u-000CAY-2Z;
	Sat, 12 Apr 2025 22:17:06 +0000
Date: Sun, 13 Apr 2025 06:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/bluetooth/hci_vhci.o: error: objtool: vhci_coredump_hdr():
 STT_FUNC at end of section
Message-ID: <202504130652.o7UWcPMe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b676ac484f847bbe5c7d29603f41475b64fefe55
commit: 3e7be635937d19b91bab70695328214a3d789d51 objtool: Change "warning:" to "error: " for fatal errors
date:   12 days ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 days ago
config: x86_64-buildonly-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130652.o7UWcPMe-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130652.o7UWcPMe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504130652.o7UWcPMe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/hci_vhci.o: error: objtool: vhci_coredump_hdr(): STT_FUNC at end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
