Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A336E47F
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 14:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831216; cv=none; b=XD4ZdVjvUtu/bVoGktIuhpgoRQwxmIrLl8HlboaVLceVnHPlvo6/qHBfr9hyTm8ziWOwLFB5MtQzfDW2DgebuFwqFq6we7eTCNpP94rkH4GAUx59tHngiCcEgc1NV0tgQjchUXJrsK7GOZuvzMU+kqwSNHGlD0tOLAqhuJNobPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831216; c=relaxed/simple;
	bh=AfP5noFr3FwqH0/D7lmqCRCtmm9hMfASM48aYV0MLQg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P7neAYG+YWb/0rK4EpPX1l3Nzexyu/aL3JR0FpvAzOO8MGw8Mxzr4svY+CABJFTR9fXii/qHxriGBWp9ZctQsqD1Zaq3Vjk5BfOzaReagS6pPjyyCINMP3KV50HZtTBHfAuxnhyuwnoQ3VWwhI7sL6W8DjnC6xqKWdVxLDvW1ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkIpaQH1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkIpaQH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768831214; x=1800367214;
  h=date:from:to:cc:subject:message-id;
  bh=AfP5noFr3FwqH0/D7lmqCRCtmm9hMfASM48aYV0MLQg=;
  b=LkIpaQH10DgrcjfSRt9lE5zjZ8FRHVpsz8t2pC7BOPYAbWhoQHbnMtHr
   J+7SR8rseITgFUEnC7E+211Wypwe1jdjibILzeOZYrH6PBUMhXsYJX8v5
   G6rfUk2r9utlyFN99d16ZwKvISIr+DQ/YAMYfXu+rsMNQdW1aRrm9g2E7
   BxzX6XOhpG0YlQgmw0jBQSRnn/2+71eQzZLzoV4oooRS1ovxOxBFzhVZt
   63mNeevuPLx2bsgo5CXjnXnah0F046H6mI+86YXnUdTAao3J5KFtWaH9B
   JQWwd4hWbqp1i702rBzTJb9nJlfNa2++7LgcPAve/2xHxY9s9pCNDS6dj
   w==;
X-CSE-ConnectionGUID: 7irycXvDRCSaCjWoHg933w==
X-CSE-MsgGUID: NdpZb2KMRVue64MZTuZB9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95514761"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="95514761"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 06:00:14 -0800
X-CSE-ConnectionGUID: cNlGFf9IRGeJs++3LK9CcA==
X-CSE-MsgGUID: q95X9//mSQioPT0DrT0lbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205897560"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2026 06:00:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhpne-00000000NrV-1pNp;
	Mon, 19 Jan 2026 14:00:10 +0000
Date: Mon, 19 Jan 2026 22:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tytso-ext4:dev 25/37] fs/ext4/extents-test.c:518:1: sparse:
 sparse: bad integer constant expression
Message-ID: <202601192148.Lwa0CTlR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/ext4/extents-test.c:518:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-ext4@vger.kernel.org
TO: Ojaswin Mujoo <ojaswin@linux.ibm.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   a4ffc45fdcdc4e94a8acf7dd3342cf1d1a2cdabf
commit: 16bbdb54f49e58d51dbf2217bab9ed424172ea9a [25/37] ext4: kunit tests for extent splitting and conversion
:::::: branch date: 10 hours ago
:::::: commit date: 21 hours ago
config: microblaze-randconfig-r123-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192148.Lwa0CTlR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601192148.Lwa0CTlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601192148.Lwa0CTlR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/ext4/extents.c: note: in included file:
>> fs/ext4/extents-test.c:518:1: sparse: sparse: bad integer constant expression
   fs/ext4/extents-test.c:518:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> fs/ext4/extents-test.c:518:1: sparse: sparse: bad integer constant expression
   fs/ext4/extents-test.c:518:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +518 fs/ext4/extents-test.c

16bbdb54f49e58 Ojaswin Mujoo 2026-01-14  517  
16bbdb54f49e58 Ojaswin Mujoo 2026-01-14 @518  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
