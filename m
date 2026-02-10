Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2063016EE
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730277; cv=none; b=LkbrVzFTz55Id20dQVG3/vu2mU5BXvLclM6JaCHTdoZtAgjdzJI85i6BduSKzXms8MVnNFajKgaLrojpqRyLQJykT5p5xlNmqNVszVEZVGzEuNpxx8wJsO+E4rtwlc9vQTIIjs3OhyRQL1eCRZMlWtaAjE28E6myTdmL7WqNBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730277; c=relaxed/simple;
	bh=kNCbvcIXwn9oVm6nGLDh0IRYn1iDvUqHErCoROzRI9c=;
	h=Date:From:To:Subject:Message-ID; b=f2RVb/QC2gfOjmeJhHmrb8FiqbbK/3Fc3MVFYfg9kkmrH0dEWEZgyQWyVFrRxdUVZr5uO5g+Y3rfYDqMVDk59Gpw756wVbYDwjwr13jKGIeMJG6WVVQUbgwQbi+2/oiIYgddZ0vmoetH0R3+JoXXhX6XVS/fJY51agaPYTVawoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3myWo09; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3myWo09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770730276; x=1802266276;
  h=date:from:to:subject:message-id;
  bh=kNCbvcIXwn9oVm6nGLDh0IRYn1iDvUqHErCoROzRI9c=;
  b=X3myWo09b87ct6IEr0ITxSfRKafWpm3VPVo8T4XvCw7jWFoa4E0iVFEV
   8+6FBF9nL4ZLjddN6mznTBJuhL9zdRu0yd09swd88pKRDIFpz+GIZ+hcH
   QcpeUuzMn20FyPonTTDVclDU1XQg9Kc9L9tkawovHLG6iDrOZPiLnYfbI
   22Oor19EEsFmsxvYkmSJ/kN67Q/WtT4LHhL8fYFCmz4CGduE8pjs0Pf2F
   v/iP/EJiyklZCfZdpEeNQaQcGNuhkDPqj1jD6fq+I272S97wfdppTsyDC
   lmj6FPWU2pglXadUSwY2hSzSDuxL/aHHNZpwpk/p9r6n8OjeSTGiCuOLU
   g==;
X-CSE-ConnectionGUID: u7C9AizESUGWN1PxKFRHIA==
X-CSE-MsgGUID: APjpPxBlRuqhzOO654MMew==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75701824"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75701824"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 05:31:15 -0800
X-CSE-ConnectionGUID: r0a+nh02Sne/SoKaT1n5cg==
X-CSE-MsgGUID: ceAY/OJ2Q7+5KxLsp5ykOQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Feb 2026 05:31:14 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpnpg-000000000pP-3vpd
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 13:31:12 +0000
Date: Tue, 10 Feb 2026 14:30:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 94/102] checkpatch:
 WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
Message-ID: <202602101418.v9zJnWDf-lkp@intel.com>
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
head:   fc9e29289c11c9ff47ed97a5ce40f7eef66e8929
commit: 8bbc648e24db8a4e3823eb7725175db230624348 [94/102] RDMA/mthca: Remove resize support for kernel CQs
:::::: branch date: 27 minutes ago
:::::: commit date: 27 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602101418.v9zJnWDf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
#96: FILE: drivers/infiniband/hw/mthca/mthca_provider.c:690:
+	if (ib_copy_from_udata(&ucmd, udata, sizeof ucmd)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
