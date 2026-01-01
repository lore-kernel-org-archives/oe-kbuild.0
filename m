Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12721C7012
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767259085; cv=none; b=oWuEvbAfMZPccbzGnVy29ggE1Yo1aUh/SSZU+XAYgbR84Uv07rtU/m+lQxHst1HeFRGCU8AiCmQcSIJCJZSRSRPNRY2L2QsqtJXOy2jLY8EWw1d/j7W0wGqD9ZW/LcBD58N2SH+em5ICGIOLW3LcoVZr6qZVDOe2I3orwSgSW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767259085; c=relaxed/simple;
	bh=3wCVfYKKhRQCrKVMytwYlgzXCdi/+7EBFnKU6QxXLjU=;
	h=Date:From:To:Subject:Message-ID; b=F/MlHs3akWq+GLI8iz7UqDBi7HlCSUgs1NbR40jyuMDtWKbo7dk1PiNquFYMJGLwuyH1vidfKVlH7o1MIPEWd3aWxEYhOg1WiU/DaCdoBRXZm1dBWtqA41gZB1j21DgsZsKDp+O2+Pr8sHN44rx49/Mfqi9PsZGv1ytNN7SiFXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoK5mGMk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoK5mGMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767259083; x=1798795083;
  h=date:from:to:subject:message-id;
  bh=3wCVfYKKhRQCrKVMytwYlgzXCdi/+7EBFnKU6QxXLjU=;
  b=aoK5mGMk9+Nce6qAm6GZtU5wSzHZaQWqn+MfbHf5JBJIlKn7JUFZ5qXy
   baxaarLA6B1n+st5I6A8YEiPNhQffkDBET7oGSOyr442AyhfS7wCvrxVc
   C2fuf9IKuMIqsUZFGLMzZQhQ/1hzgTno+LP2ulBEahMZDt9XehqCxo81+
   J3Vuohrsmu9tPg+VV40K7Ae5MfC7BbJqvnkxf1OYIUbwyTu3YV4ZwUlrB
   CBLwE3yvKvzxeBW8rh0EHKST5NBD+wDEs5UVjrPT0pAidju9ckafiUtSJ
   4bk6m3BXAWSMrE7qGBIyOhCanqjCWoJsxaSQS5KJ++2WKxYPEPBM1B4VE
   A==;
X-CSE-ConnectionGUID: zlI3W08oQ5CqjNxGk0e3ug==
X-CSE-MsgGUID: 5WLNMNTqRgOzhzrvIYxNGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="91453065"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="91453065"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 01:17:59 -0800
X-CSE-ConnectionGUID: zvQZJBvURfyD87+ycuYG/g==
X-CSE-MsgGUID: 75UuMVi8RI2jAe4J0OCcZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="232289648"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 01 Jan 2026 01:17:59 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbEoe-000000000Gb-16fQ
	for oe-kbuild@lists.linux.dev;
	Thu, 01 Jan 2026 09:17:56 +0000
Date: Thu, 01 Jan 2026 10:17:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:wip-aes 49/50] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202601011036.8I5gU0Kq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@kernel.org>

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   f31a24f9ce95a91bd3437677f9a2889b1836474b
commit: ecc135e8d35efc23834ea2d92547a56e50eaf98c [49/50] lib/crypto: aes: Drop "_new" suffix from en/decryption functions
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260101/202601011036.8I5gU0Kq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#84: FILE: arch/arm/crypto/ghash-ce-glue.c:215:
+	aes_encrypt(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});

ERROR:SPACING: space required before the open brace '{'
#97: FILE: arch/arm64/crypto/ghash-ce-glue.c:201:
+	aes_encrypt(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
