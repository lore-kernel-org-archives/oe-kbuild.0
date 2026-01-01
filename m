Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76713281520
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767259081; cv=none; b=dyAyVekmmZsfKvkecU9/UvRu6xaLt8cYR7NYZbm4o4qtH6b0BFm+FsRZ31dThRcC5P77oavdze82ILBIx75oOKs0rGGsTb0rGh4tpx0ow5t93TJA0Egy5t8mGnxebrpf/NmIu0HhEnTw49vSYwt94uhLtFJLmMw5ebSYrkljsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767259081; c=relaxed/simple;
	bh=tSvj9PKSXn8mPlLUG8n8cEwlqVZlwZfQEOCjB5wZen8=;
	h=Date:From:To:Subject:Message-ID; b=H11nol5ztIJYQPiwLdWp98PlBtJlkifa9TAywYSK1FNs0LhaRo+jMUx5d1/mEzGJSuNGxAplm62HjK9XbUCV6s8BTya/iDkiJIRfk40ZWQgivQnAlm9YP1as/dCdUWM0DAm8fnHm/oPyCAJO+t9OkSVbGN9KJ4q1yFks89fNQ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePC+oXtP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePC+oXtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767259079; x=1798795079;
  h=date:from:to:subject:message-id;
  bh=tSvj9PKSXn8mPlLUG8n8cEwlqVZlwZfQEOCjB5wZen8=;
  b=ePC+oXtPIqILdbFTFOcCixccUAtfYin+1sK6InpTzuM4vZz85o/qiF1g
   coEXejJ754RrqEekAw6OX/OEBW0U+xl6C4JCDLMutoA+Sj/ulI0JLRDOj
   70syrHUldcnZC1DopaCd/aMoZAaPih+5FJ2DRA3Eifk4qLY6gw9cfa5AT
   z8hqsmvrOLxlClYAqHLX0chroz6XUiXQDxIzGwanxewILN+8t+eOMvZq9
   /73iYPg8EKjql5HSNi1TIpppiGb3Ox7zrqnSHTEcia71W+fov8d90SkWb
   Pg+Y2kpGIN+u5S1gILSyP9gPZpLGydyZ8kIueaZ0Ir4RahavdVqFvY3ni
   A==;
X-CSE-ConnectionGUID: F72OV86nSIipI6gQ0e2pLQ==
X-CSE-MsgGUID: dKqyyI7hT/ahd0pZpHX2sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="91453063"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="91453063"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 01:17:59 -0800
X-CSE-ConnectionGUID: ZzIIYC5rSXClqyzKMgpQcg==
X-CSE-MsgGUID: UjoSpwsGR4WXKnoCycwtng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="232289646"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 01 Jan 2026 01:17:59 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbEoe-000000000GZ-0vS8
	for oe-kbuild@lists.linux.dev;
	Thu, 01 Jan 2026 09:17:56 +0000
Date: Thu, 01 Jan 2026 10:17:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:wip-aes 38/50] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202601011008.o12TDM4h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   f31a24f9ce95a91bd3437677f9a2889b1836474b
commit: 8cc5ac1a6a56ac0dafb9a95ad566852ac1c20755 [38/50] crypto: arm64/ghash - Use new AES library API
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260101/202601011008.o12TDM4h-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#62: FILE: arch/arm64/crypto/ghash-ce-glue.c:201:
+	aes_encrypt_new(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
