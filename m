Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22A518C93E
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728343585; cv=none; b=eJI0W5+uqvI+TRX3c+Bi7szXgrz1eVCiXvED7Inh9eBSZmlyxSJeS6Z3J5OnTYQZwHKHlv+PspCzB/mD8IDzvtFn32aSLWP60nmHYYZKaDwI03P6FvReim8jZKwl4iFozJF/ENFh6FTSAFVpT+Jj/uQzFuLknJfdU66vEJHWQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728343585; c=relaxed/simple;
	bh=A+iO3ubvnfYZCc9R9mUJE2ZvXp5CpRp1jGQUAWt+9IA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gAiAv/MF9vF/6vQK7oZjsB6iocR3gmFRZJu8wK4FshgX+h86C0Eblb24O+GQb97w1XZoo35yUZOvC/CH4TXez740o1dSwfxPoab4yU1YJ9bLYV4P2HlugBDp4YxUfJG4DqRowrf0MNFgH9D5wPL5nGW9XPqsQG6QxO2lCf59ca0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATF/y0RQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATF/y0RQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728343583; x=1759879583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A+iO3ubvnfYZCc9R9mUJE2ZvXp5CpRp1jGQUAWt+9IA=;
  b=ATF/y0RQnhMbYoBMjTVOgOyV6PZOdveiGt3fx7Nm/w4AVJYEOy+8mkq5
   bhV95+K7CSOkW4Eu18oVxAUZJt1lOoS9E54awW5Z8FFz3iPStgTxfW9Ce
   S6uY+3qlhzXTtDObldngvpyUV4/l5HLuXNZLmJyEUA3NYqflBxs9cBSn8
   eL37hLsx4UsiSvYzva2MQRPCIBSTVZgIgmPsctGUSLGeR6pErKaOpm83L
   zwPcprrOsi6xaua4DtJXI0RH7+7UFlpP8RxnRbGqnvwQL/+lg8yRLsJak
   lqQ7fADuebh708o++YBggLxEjBeFiYsGEHAVCnNlmNCyhHNtTqGnlwR+w
   A==;
X-CSE-ConnectionGUID: yEBy2ypART2WIDV0+feEVg==
X-CSE-MsgGUID: zKdtWK9VRrmTxRpgiAcxQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="50043811"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="50043811"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 16:26:23 -0700
X-CSE-ConnectionGUID: qGJlLhIQRjCRoUB/+eIyoQ==
X-CSE-MsgGUID: nOoXOvhVR+2ed4QderPcWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="75474146"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Oct 2024 16:26:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxx7M-0005f2-1N;
	Mon, 07 Oct 2024 23:26:20 +0000
Date: Tue, 8 Oct 2024 07:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/userfaultfd.o: warning: objtool:
 userfaultfd_register_range+0x1dc: unreachable instruction
Message-ID: <202410080708.P9xdj1J8-lkp@intel.com>
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
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
commit: a17c7d8fd2b097a422fc892b660e879e19c20214 userfaultfd: move core VMA manipulation logic to mm/userfaultfd.c
date:   5 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241008/202410080708.P9xdj1J8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080708.P9xdj1J8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410080708.P9xdj1J8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/userfaultfd.o: warning: objtool: mfill_atomic_copy+0x78: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mfill_atomic_zeropage+0x6c: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mfill_atomic_continue+0x74: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mfill_atomic_poison+0x6c: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mwriteprotect_range+0x9c: unreachable instruction
>> mm/userfaultfd.o: warning: objtool: userfaultfd_register_range+0x1dc: unreachable instruction


objdump-func vmlinux.o userfaultfd_register_range:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
