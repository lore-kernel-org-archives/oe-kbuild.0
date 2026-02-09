Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A05823D281
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645232; cv=none; b=eBy9nzxFfpB+gXfziobjr9XWH7FKgAbKryDv5ShqRh/I7Jx8mfNphQeI+XlT3K8n3LRCVz6iuI4O+eX3c1vrQDXVdlCeaRIS8lhyKjBNiDMc309+x8ygHekteE18stUdZQhngGm/bSayhwwkR2RLTvJDCYo1Z6W0/b1ckbZn07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645232; c=relaxed/simple;
	bh=IlOwxEKV3Me5LLey3MAs0uI/Bj95Zm7YQrE1NMo4cwg=;
	h=Date:From:To:Subject:Message-ID; b=HpjDfwwnIOjh0Las6Ogj12MeZwFdc5fb/pP0bBmMpu/bDt7set0bFpC4WQPspYaPBtEy9e7rFkco+2gyYMTMpCQ+NrO3kkmKuY+Sm64nlE/CVTZ4yGxl9Tpq9174c8gPByJFaQwoI5cW13ZTkvlmp3Q/Zz4ppE4cmyTTrGsjd4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n137siUb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n137siUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770645233; x=1802181233;
  h=date:from:to:subject:message-id;
  bh=IlOwxEKV3Me5LLey3MAs0uI/Bj95Zm7YQrE1NMo4cwg=;
  b=n137siUbzUSsUSghGDyqEqMUngE4yPr0bWzFnC2tzfLIzp16NYcH8pDU
   K+K9c3KwopW3vUPtpEWrKUlTQiR9w9BDbAey3en5HkRrilIAb0uaKcDFv
   kz9pDn3Lfrlzgs2Fh5VrxssFgRPz9DX36YkJ3p+Diy6VtXCFjNOuEPKiH
   0EOq4TvX0WvSHfqxwPQ3qxBfIfuJEFLGsKnwssqDLAWiAOVQTdavOdAe9
   C7+4SNdcpQk7Bx9E9WXHYUld9KdWU4pU8QKXjQs9egcbE7oj4WcjQ91qa
   hFyceuv9md7jhCbmbRMpyCBF9yWfQNhf2lMfbeRe0bvZL0GRg+lVADuCv
   A==;
X-CSE-ConnectionGUID: Vj4FZ/TCR4GTXUtMxt6RcQ==
X-CSE-MsgGUID: qHvQ9APWQ7KBNsqv6hcGRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75603678"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="75603678"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 05:53:52 -0800
X-CSE-ConnectionGUID: oGz6XlW9TIS5EaPQB7+gkg==
X-CSE-MsgGUID: NEWPH+hmQBectrOClwp4Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="234536803"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2026 05:53:51 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpRi1-000000000FN-18mI
	for oe-kbuild@lists.linux.dev;
	Mon, 09 Feb 2026 13:53:49 +0000
Date: Mon, 09 Feb 2026 14:53:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 68/80] checkpatch:
 WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
Message-ID: <202602091422.rCv7WoeS-lkp@intel.com>
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
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   a13eb692588830b3d09a9dcb14d384ccfc029902
commit: 593dc5df28ed1b21d266bb55e6e7caeb187d4cd9 [68/80] RDMA/mlx4: Introduce a modern CQ creation interface
:::::: branch date: 24 hours ago
:::::: commit date: 29 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260209/202602091422.rCv7WoeS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
#90: FILE: drivers/infiniband/hw/mlx4/cq.c:172:
+	if (ib_copy_from_udata(&ucmd, udata, sizeof ucmd)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
