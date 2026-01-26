Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CF8245031
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769467107; cv=none; b=KgVjEZ66seshClWr55md0+WxWeyIMUJOU9ovCJ2Jb4Xm7scBGvtO9QS0gf+RWxGSpCMX6VW+iXJpGgIWkSDIKZB6JaiwQ24CcYPRIpJ55zgJRchybpm1JLqdAN79Bb6Pi2bcv6MSIPvbvmUuSX56aMp3tpwN5lHRCUk7Vt6C5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769467107; c=relaxed/simple;
	bh=TmiLt8KLkFr2sHDj2+NQ2b5mIj4lApRSW+9Yevtz2Jc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X56HCPj2Oaasi+KYGaoqzE94pI5Kj5LdwLagIFdeoz8qqA2wJtfdqYhdD14GVNb47dHmpluqns44b2upUqtTNXWFIIc166ZmyigsE/mpJp9AzNYH53Vvw6sg8uPFp9LU9AJomjl9br7mgc+9XgWMlekqJ87641/IR07ExmvLhQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amgQgYFB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amgQgYFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769467106; x=1801003106;
  h=date:from:to:cc:subject:message-id;
  bh=TmiLt8KLkFr2sHDj2+NQ2b5mIj4lApRSW+9Yevtz2Jc=;
  b=amgQgYFBrUQ4HW4SnD2x9+WlcMVGsV15XBi/phKkwuWTab+IY2ucwtqy
   7aC6rMFoBs1GzzXMooqmwN0jsMBrWVBkxPCjqFN03Kr7009XjxiE97Cek
   BhMZ245SyVVhYd7IC98AWJBuxRL5v/uFz2Qa3PA+Cb6bnW8j7P+5OBCUg
   79z9GA7NpJj3nRkyfB77EV9/OiYlcJ+/vb5Iz6R2L2GIbRuxrI03D4k4w
   HuSJq7HmdKPILwFClnMIqeRifT23725AeXJ4QFURB9ClcHjkC1KaSfHGs
   xOqnwKxU5a2MitFqZpOR/l6prwwI/572LYTpUgC9B/FA0JmpKKNhEjijg
   g==;
X-CSE-ConnectionGUID: 6+NV1bJnRBeI5YV1LDv5Og==
X-CSE-MsgGUID: Ax1rVxXaToG9sVnlEC6TyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70711992"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70711992"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 14:38:26 -0800
X-CSE-ConnectionGUID: WDLJDRCqSAacsnN094Hu8Q==
X-CSE-MsgGUID: M5r/PVBbSq2BPHXFhU1Crg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212778293"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Jan 2026 14:38:25 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkVDy-000000001bx-0m3O;
	Mon, 26 Jan 2026 22:38:22 +0000
Date: Mon, 26 Jan 2026 23:38:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9137/9539] /tmp/tmp.zRJLkVwBxN.c:1:10:
 fatal error: sys/types.h: No such file or directory
Message-ID: <202601262328.ogGgVuPZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kevin Brodsky <kevin.brodsky@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: a16e3ce90667fb6fcfb287cd2fec39e64f19afe0 [9137/9539] selftests/mm: pass down full CC and CFLAGS to check_config.sh
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260126/202601262328.ogGgVuPZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262328.ogGgVuPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601262328.ogGgVuPZ-lkp@intel.com/

Note: the linux-next/master HEAD ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> /tmp/tmp.zRJLkVwBxN.c:1:10: fatal error: sys/types.h: No such file or directory
       1 | #include <sys/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
