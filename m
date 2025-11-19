Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD602DCBE0
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 02:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763520710; cv=none; b=NqZr4EYRjYxHPPo3FSP/nSq79FfJM3lXfqWUH1QbffjpesMUTuMBUVuRMw3AmaBGS3XNxtrO0/xDzWcM2zVQM6CGu5i/RRsG+J+CilD9Xsio+k1a5mw5KKZm6dLR3+sEobGppJuS7w7V+s0yoS32cXqkuKvOpdkjAhUpWSZ89RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763520710; c=relaxed/simple;
	bh=YQOuzzkGNA+m+1wyC8ANKkwuyQPIv4yXbNDKJ5QKDBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=obNYCE1FMQgx/+RsXoT8YlhbBidc7B3EFTd+NH1b1gfE+RrePwou8ceZrO2iNegUeaCuz2fBjU8Km0tNwLWKoaEsIK3DGH2slX5YkdAgDZLgGDa8WpgHWkdLEExCGTpPwOj4reyvMry5TO3R8liPToX7V147B5kXXhctr3FS+gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYi13HM6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYi13HM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763520709; x=1795056709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YQOuzzkGNA+m+1wyC8ANKkwuyQPIv4yXbNDKJ5QKDBM=;
  b=fYi13HM6MRJ5nWwIIsw4KQGsYlzyk5qRH3FS24RAAH8fhfzwt43iknkL
   l2vSOjGmh89aQ6/AnQNzjSYrmZdcmVfPSRaKfBu8TB0CkjlBa88HhSsuh
   gIfZeUt4ZP/Wgtw6SQlMIs2zb4ix7mZrZslKPOpOWsuaUCf2krAtUWDHN
   Qo2vWiujibfCPfG0KyBpI6CfZ3LjpzFiRKx3FfPeVrhWaVepauw2lbAug
   Jm7u2Xb8hFncyNI/RzWFcZFmX1VW2KKSDz0Soes5k9FIuGiQwhcfGSQNy
   ZmVaM6tCi4zFi4JVtE7bdk+Wb1JmwOCkxSjvjsaOTyyfwq11RoQ6N7CSK
   w==;
X-CSE-ConnectionGUID: bFc+TOGNSOKwlTSA3O9vVQ==
X-CSE-MsgGUID: BCkTTKwBSkaTxlLmCTN/CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69407109"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="69407109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:51:48 -0800
X-CSE-ConnectionGUID: HxaVxZnZS/mkBz1vayatIg==
X-CSE-MsgGUID: 2JDhrgUyRkSuCmF8KGB5eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221567183"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2025 18:51:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLYIL-0002NV-0L;
	Wed, 19 Nov 2025 02:51:45 +0000
Date: Wed, 19 Nov 2025 10:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-split-fix 2/3] vmlinux.o: error: objtool:
 .rodata.cold_walk_ops(): can't find parent function
Message-ID: <202511191056.XOF3djZm-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-split-fix
head:   c1d09d3861a169dca34ea869269fd4957a8224aa
commit: c964de6cd46a754db4808f371a18c1da5885fe28 [2/3] objtool: Fix .cold function detection for duplicate symbols
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-075-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191056.XOF3djZm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191056.XOF3djZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511191056.XOF3djZm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: .rodata.cold_walk_ops(): can't find parent function

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
