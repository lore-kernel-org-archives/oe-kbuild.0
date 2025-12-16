Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDAB32C333
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 04:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765860843; cv=none; b=eCvl7vmPd2ClKopBAN9jHyhmzEp37fR3VDk6O9TVfXLamffYOHLJSdBPjFOGfGxGI8AENJVmCGi33O9Wr6k3glJjhVt2jsb6zyThODefuU/6rO2n0k/3YDF+B/ZaZhhK3c1TFTneG+/J898fXjICC1IiT6I88uISs3XQkFAtoLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765860843; c=relaxed/simple;
	bh=lc5YihvDfJTi0RXE7f2WqHGv3ockQT/o4HqtEiftcWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DcEdJ7/fLPia5IaYwTBHAwEk0dHiNxHenhHUlSI9/acWLHl6vZZpW23oh4nJHg/7WFioP5P/r02jWilvhemO/UpK/0VgUO+tE9pd+jrNEXeRV6/2Y4LSXSKDEaEXTtSNqNjriG4Q7y945wqUzzL74JNYh+mmKa30l1lZMDJmUQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWW5t0rh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWW5t0rh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765860839; x=1797396839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lc5YihvDfJTi0RXE7f2WqHGv3ockQT/o4HqtEiftcWU=;
  b=SWW5t0rhJNqWF7i+JkS7xtRVh8gwzjaCFl6WICdvUDs5eCoMMvlVAiCP
   Mokw+DALl4rN+Ka4q5wLcUymwkc/zNTo7Du1EETnF0wOlxbY5STYERxxP
   civr6AZWrVc3JCJj8dePNrGAKMhCc6SAxld53jnEkRuS3JOWRRoHt+KbD
   H1ipUD0cphgpQ5VTU+g/NFtJjnSErm0YM5KKlcXhMdlKAxuKi+pPmYrHO
   eT07V2zrfniQ5JQSJ8CCoHDv7GSTx15xTBze6OswIQ/Eo2jxdyfwztvOZ
   z/2Mtn5BUxGhs6Er++WWFRQ1qABmmuE5WxJWZsr0ndCUDamLV0aFJGEmX
   A==;
X-CSE-ConnectionGUID: 7zzCEQBBToKYcj/IczThhg==
X-CSE-MsgGUID: xHKMLnvWQvuJVL54iGdiUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79228068"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="79228068"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 20:53:52 -0800
X-CSE-ConnectionGUID: qGB+3+KtS+2UJtZbWR6CkA==
X-CSE-MsgGUID: 8Ffx6dqBQ/aNM+IE1pnfBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202415878"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2025 20:53:52 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVN4H-000000001Af-11ev;
	Tue, 16 Dec 2025 04:53:49 +0000
Date: Tue, 16 Dec 2025 12:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1425/1848] lib/tests/liveupdate.c:156:1: sparse:
 sparse: bad integer constant expression
Message-ID: <202512161249.spKlAVdO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/liveupdate.c:156:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   563c8dd425b59e44470e28519107b1efc99f4c7b
commit: 2d5e1aa0daa2ec780558939d67fd08111a6d0d97 [1425/1848] tests/liveupdate: add in-kernel liveupdate test
:::::: branch date: 3 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-123-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161249.spKlAVdO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161249.spKlAVdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512161249.spKlAVdO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/liveupdate.c:156:1: sparse: sparse: bad integer constant expression
   lib/tests/liveupdate.c:156:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> lib/tests/liveupdate.c:156:1: sparse: sparse: bad integer constant expression
   lib/tests/liveupdate.c:156:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   lib/tests/liveupdate.c:157:1: sparse: sparse: bad integer constant expression
   lib/tests/liveupdate.c:157:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/tests/liveupdate.c:158:1: sparse: sparse: bad integer constant expression
   lib/tests/liveupdate.c:158:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +156 lib/tests/liveupdate.c

2d5e1aa0daa2ec Pasha Tatashin 2025-11-25  155  
2d5e1aa0daa2ec Pasha Tatashin 2025-11-25 @156  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
