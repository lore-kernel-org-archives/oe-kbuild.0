Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901FA2D879F
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507779; cv=none; b=DRY2eHOCcVJZdMmgIKazQJBi9Z14h884rhnH/Ni5E+dYvHaUhU1B9/6hg54HafaIhjqUombYOjQpIz5YuyNZi5ia062/hsi1DP2VdO8uKQEj6rKFiPQrz948Tw/xDXGfyjTsZnl0VdYE/Ay6QXb6hNUjc6uvyF+iDQFxMReXvZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507779; c=relaxed/simple;
	bh=DJhzmohLAaWbzzTbFvbpt4UQT/jxcewKJBwVqXaVDl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ewvGMnZ3kLhKp5EsG6y3ykum21wHYxlpD8CcjyzYg029Ab7BDIFVYrMJP99JLlHiWohxYLhPrWzGRmm1a+HE47RTtMze4l/G/Ly1oIuSbljRzBIfWcoZkibe9JTjWzEMrDJzPxY5ITUHuEuAG8BhMUONKJFa0lkb9TPXejc8S+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsKuNmgv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsKuNmgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769507778; x=1801043778;
  h=date:from:to:cc:subject:message-id;
  bh=DJhzmohLAaWbzzTbFvbpt4UQT/jxcewKJBwVqXaVDl8=;
  b=hsKuNmgvmI2WDYPD86ybyqGuyZcG3JLVBfwedRCZwpFE/iiZL+ak1xpX
   myJmWZIERBwe6QSfkB6KttG4run+y7LjUnygb1D02P94cc/sWber1VRHQ
   KuDHhE2a6glYBnbeRWJy/G0gR9elzMeYPsZ96e4phYxmAj95SlgnV5m4C
   TTpHiMcc2ZoXAO3bso3ls6105pZj6RD12sDdH5wVo29h1a8U3k1upL+yB
   o5XQ5glRgV57w84M3QgK45LSjhScpaQRKaA6ALNXHYqjdqVu6xxa6Zu27
   67ssBYVzUkxsH781CZVpVEr5mt7zHyDpSjjZZXhwQTW9UWaPYvLVQ/Nbg
   g==;
X-CSE-ConnectionGUID: WNoLtVhUThWsMbfQkfVfbQ==
X-CSE-MsgGUID: Z31qktQAR6G15zMX92OWQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70788688"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70788688"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:56:17 -0800
X-CSE-ConnectionGUID: GkwsGv5TTpOv3vW1FSpR8g==
X-CSE-MsgGUID: re33FeiQR9qaj3AgGR+dyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212047633"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jan 2026 01:56:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkfnx-00000000YGz-2iGY;
	Tue, 27 Jan 2026 09:56:13 +0000
Date: Tue, 27 Jan 2026 17:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7451/9596]
 lib/tests/list-private-test.c:75:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601271721.tf9ZMn7y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/list-private-test.c:75:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   615aad0f61e0c7a898184a394dc895c610100d4f
commit: c3551544be3eeed407b6f99b0b2cbe442ebf1c9a [7451/9596] list: add kunit test for private list primitives
:::::: branch date: 10 hours ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-r112-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271721.tf9ZMn7y-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271721.tf9ZMn7y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601271721.tf9ZMn7y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/list-private-test.c:75:1: sparse: sparse: bad integer constant expression
   lib/tests/list-private-test.c:75:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/tests/list-private-test.c:76:1: sparse: sparse: bad integer constant expression
   lib/tests/list-private-test.c:76:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +75 lib/tests/list-private-test.c

c3551544be3eee Pasha Tatashin 2025-12-18  74  
c3551544be3eee Pasha Tatashin 2025-12-18 @75  MODULE_DESCRIPTION("KUnit compilation test for private list primitives");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
