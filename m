Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1B8635D
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 02:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764381887; cv=none; b=YtTRXc/OlH7oaqZJkPpmiV2rcFzl2OiDSfRG4D/uSM1zHDwWszQ6X00hF47gzJkYpvXLsFgZSOPXeu4pAoW9dwjeQ5DWi/S+jDJEN5Pj4BaJiyut5/Ba6ydZqgoMjd9JD9aFWlrAdnWJo0R8eLHVKHMQ2YiTd2D9hYMhiOgiCbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764381887; c=relaxed/simple;
	bh=VlG5fHehjddEsFzoMlrVqiS448wj/JgThMIunYKK7Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjFgqa90h7ERenj7n4A3N/z3E5clZ8VRNdyKEJQf8PLtCzuPstWG+q/sSK3J0/H4HfvBiEwJdS6bniI64rIM1eG/YWHQ5xs2RUvtvzYPPAz6pRrbvZM1MG/mXtgTRMzF3jXbAvUyd4RtKgNs3W+gPyWuf7Qy0n4T1gBFAnBPUC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL7i689x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL7i689x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764381885; x=1795917885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VlG5fHehjddEsFzoMlrVqiS448wj/JgThMIunYKK7Tg=;
  b=TL7i689xy/eUSLulQUBlD4ok5k1zHhn3QsZjFuB/aMAoQj2ceGpOVash
   TW01ETgvt7e6yIQD1f6W2bJiiv6WGxliJnSg/jwV62dFE+H1YADvGrK5H
   EEx1R82TkqPPMjhF+mDsNHEiURTHOgQKUU7deMJlOtCWlfKFKRYFPIEJd
   iMrxpQs+D3F/DKiyKjMSaHC4X+j0WFZWtXU4LvRU7b34MGQ0bLoB1MXIg
   IxzZQdtYQJDfp5belDaPng8hWEsG5cHgPzGw+KzSSonBPei0/g4kIndGo
   znYaB9bVuko+JFg+dz44LJSrqBhqtPTSBP/FIlbpueT9rafdPC01GAT8A
   A==;
X-CSE-ConnectionGUID: rggNiLFOTo6MZeho8uD0BQ==
X-CSE-MsgGUID: 00krJLAwQE+cTczXQzmJ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="70267367"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="70267367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 18:04:45 -0800
X-CSE-ConnectionGUID: +dhkJUDrRPilqsGuQw/7jA==
X-CSE-MsgGUID: Vj9/LDlVQCaVFpS7cgzIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="194356092"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2025 18:04:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPAKH-000000006sv-1tu6;
	Sat, 29 Nov 2025 02:04:41 +0000
Date: Sat, 29 Nov 2025 10:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ardb:lockless-random 4/6] drivers/char/random.c:570 get_random_u8()
 error: uninitialized symbol 'ret'.
Message-ID: <202511290915.K1Yksp2Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git lockless-random
head:   05894b44c19c9050c63946f12c5755389c79c80b
commit: c0aebac6f39092e97ad08db32f80ccbc27049097 [4/6] random: Use a lockless fast path for get_random_uXX()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290915.K1Yksp2Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511290915.K1Yksp2Q-lkp@intel.com/

New smatch warnings:
drivers/char/random.c:570 get_random_u8() error: uninitialized symbol 'ret'.
drivers/char/random.c:571 get_random_u16() error: uninitialized symbol 'ret'.
drivers/char/random.c:572 get_random_u32() error: uninitialized symbol 'ret'.
drivers/char/random.c:573 get_random_u64() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/char/random.c:1656 proc_do_uuid() warn: (struct ctl_table)->procname cannot be NULL. Expression : fake_table.procname
drivers/char/random.c:1656 proc_do_uuid() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : fake_table.proc_handler

vim +/ret +570 drivers/char/random.c

3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  569  
585cd5fe9f7378 Jason A. Donenfeld 2022-09-28 @570  DEFINE_BATCHED_ENTROPY(u8)
a890d1c657ecba Jason A. Donenfeld 2022-10-05 @571  DEFINE_BATCHED_ENTROPY(u16)
a890d1c657ecba Jason A. Donenfeld 2022-10-05 @572  DEFINE_BATCHED_ENTROPY(u32)
a890d1c657ecba Jason A. Donenfeld 2022-10-05 @573  DEFINE_BATCHED_ENTROPY(u64)
3655adc7089da4 Jason A. Donenfeld 2022-02-11  574  

:::::: The code at line 570 was first introduced by commit
:::::: 585cd5fe9f7378601b1d4915ad6e9088333b5e5e random: add 8-bit and 16-bit batches

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
