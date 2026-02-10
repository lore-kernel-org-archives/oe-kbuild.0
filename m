Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311E17BEBF
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730277; cv=none; b=gv5bZY9apANh7FB572SwD/DI6rK/mCYeFSbfnf4of51Bnz78zchVx4wgGfuLJEBHe8ORGrOXXNM37mac2p4+AWpPtf0MCTyjIhNSigstlCLr1LLpBSMqw+1QjhuCNX8HiOmLyknE5oysv54A6bAjldKoNisAM7l0rS/H22f0n34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730277; c=relaxed/simple;
	bh=9zVgYELO37wnRFgVjQYsCU/nk+4sivb+wZRumCDAB2g=;
	h=Date:From:To:Subject:Message-ID; b=j/mDWyksEbcTjfvgt8+PviQlDxftgt753VrrV4ex42jtKPKXnaDSYZIWySOGyHejgdQR3RRJpri2wufdyJQRBLczaudohuT4bHEhdrRjhq0HFVa5ceDyPGETTJIEQOlbk/NWNLuQhTUpzULamThzZTvepAPNgob7lexXkTfjC7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ei2Zq0c/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ei2Zq0c/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770730276; x=1802266276;
  h=date:from:to:subject:message-id;
  bh=9zVgYELO37wnRFgVjQYsCU/nk+4sivb+wZRumCDAB2g=;
  b=ei2Zq0c/WCX9JAFowbHujG74ut24MxrFW6xRydxz7ZfC0LPzOAME4a62
   UwixKF5jpVvb1p5dgyr9vIMTbSLqPoRaMeoW40QmnGxteWAwfmPC89b21
   9UWsR9SsVtE6bbOcVHXSxpQOf8wy5kAjUf3MR7JCGam/DZtNIPF++N1yi
   SxMR6zmMa97Wx0cybdlwZD44SHYXtB/nrDzOht14yAhKo8+IVyxdfg6k6
   hS/E8sdcg2AFfZhkkspcDe3RVXsS+dTWnCv5HemlHBLpXj30uimXmI4/a
   UhMQlvMcxnHCBAyhziEKMzUiFGQ0xA3BzUJPzcNU/MRQLw5haKvnVIi2V
   g==;
X-CSE-ConnectionGUID: cWYrPYa5SpOdDsNY3+BxTQ==
X-CSE-MsgGUID: eoh1ZwxQSQK3wV4+Efouxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71754680"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71754680"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 05:31:15 -0800
X-CSE-ConnectionGUID: tv3LQ2HsTJqZS8Un7yHiqA==
X-CSE-MsgGUID: FgEMfFYbQbKftHhuJ2TNjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211748423"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Feb 2026 05:31:14 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpnpg-000000000pN-3kqg
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 13:31:12 +0000
Date: Tue, 10 Feb 2026 14:30:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 102/102] checkpatch:
 WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
Message-ID: <202602101437.vqR4h5V2-lkp@intel.com>
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
commit: fc9e29289c11c9ff47ed97a5ce40f7eef66e8929 [102/102] RDMA/mthca: Use generic resize-CQ lock
:::::: branch date: 28 minutes ago
:::::: commit date: 28 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602101437.vqR4h5V2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
#53: FILE: drivers/infiniband/hw/mthca/mthca_provider.c:686:
+	if (ib_copy_from_udata(&ucmd, udata, sizeof ucmd))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
