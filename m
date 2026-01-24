Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6467E3594A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 16:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769271506; cv=none; b=TdVubPxbyW6V6Cz22K+a9QtKW+ylFFedvO3QIZOPpCQcAL/cOemvgIwAEtVSYVWZJgH1TntpC+Fjm0qC7rPChwvL6nFqjWej+yZ0U3IUuncMFe6AcOPkT5ZPl/Umnh+1BX+am0OMhEmuZlgR+yXwQv5Hd2VNJLuz7uX48jmq2a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769271506; c=relaxed/simple;
	bh=YHzAR8NsSrZ11ADr58TZ/CPw7io+Xg4LkbCS/FBf514=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z5nbXjoT+eveHC3ZItEpXRvsoECVuTDEib9AHBGxlHITUtXrSITsQGHnjzjd6zJMFg1/iDSaxYC06d5C/FKolqK8SSGYrdLbaLSDgAne5PLk0YmC8TlB+4xQwzT+tnsp1ErckzhSuhrRsdavcL35tEbRwugwPEspkqZ8EdH9OQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMHGyc5q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMHGyc5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769271503; x=1800807503;
  h=date:from:to:cc:subject:message-id;
  bh=YHzAR8NsSrZ11ADr58TZ/CPw7io+Xg4LkbCS/FBf514=;
  b=IMHGyc5qeVO2omkqhS1seQwrYNc9IVdDJsqIEL4cidkb0LxOTXzKr5he
   NQozAPeqB7uRksvWbNkxApk4cUfo5gbLz7p8zcFsVzPpeeusV0OxKfVv7
   rJIkE652bsOKQHJWFBbKgv9ESBkC1RdO73Fxd4uYk9IZysH8pBWCP0PV+
   TbcgygkFfMBHv/12O+k2+04TSJjGvygIZf56RcGAkhbXj8+Bca5zuY/nD
   FEzN6yfvJTsVtNmDE6iE2KmiIm0b9dWLfUQYzlzr5C5pd6fdx7ecBe7J9
   5hpdMF+AEiSTXAT8nXgmjXdg3dMlRG+teSebwx0X9U1qq3+fEEq4SShaN
   g==;
X-CSE-ConnectionGUID: M9wqdI3YRDumR63JpS6L4Q==
X-CSE-MsgGUID: 0wJpT2vQS3ibQ3Rf8OW1rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="69689393"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="69689393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 08:18:23 -0800
X-CSE-ConnectionGUID: gS1PmiVESvmbpmIcfHzH1w==
X-CSE-MsgGUID: HhD/yDtYSLSSFF82tG4OoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="207094843"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jan 2026 08:18:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjgL5-00000000VKO-1o02;
	Sat, 24 Jan 2026 16:18:19 +0000
Date: Sun, 25 Jan 2026 00:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/input/misc/uinput.o: warning: objtool:
 uinput_str_to_user+0x1af: unknown CFA base reg -1
Message-ID: <202601250016.Em3fXhyJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62085877ae6592be830c2267e35dc469cb706308
commit: 0a7fb6f07e3ad497d31ae9a2082d2cacab43d54a objtool: Increase per-function WARN_FUNC() rate limit
date:   10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 months ago
config: x86_64-buildonly-randconfig-002-20260123 (https://download.01.org/0day-ci/archive/20260125/202601250016.Em3fXhyJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250016.Em3fXhyJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601250016.Em3fXhyJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x1b7: undefined stack state
>> drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x1af: unknown CFA base reg -1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
