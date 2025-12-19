Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C329E113
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 06:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766125763; cv=none; b=qDYW2+WCiQaQa+JdkDyD4Jaq33i35eJgsEhid6nnH2Dbv5+uQDUohaQj9wXlNVCqROd6w6hWJYYI0T0BeYWuem1pw/dZhiHY5PTh6txRAeiM0PpRr3Lh0TuchBxPnfVwCasXNmFMqLuyl+bPvtOpGTZgScbdTHt32tS+nqYleZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766125763; c=relaxed/simple;
	bh=D03+fr2cfQ6crjGJbf+KlDFRUqNcH0PTws1azm0Zlzs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LdKKPnpfWSM6MYG/992i0CUQVvV0shjf/1Tni3acxzQmdYhtcCEWFZiszkiPL+O+WELdrnqcSWOL9fHdY5TPuz68vzCfWAj8weVnVrqCRVPEoUw3EIsN9BrsuoWOlpEe9zgQ2PP6qSYjSZtVgeptD+/FfXTmVpNgeTpYSNtZkcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwykpfFT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwykpfFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766125762; x=1797661762;
  h=date:from:to:subject:message-id:mime-version;
  bh=D03+fr2cfQ6crjGJbf+KlDFRUqNcH0PTws1azm0Zlzs=;
  b=GwykpfFTIVqyx5bVSWJB3og5/hVbhpszTJZ0Dayr4Ij6dJ4Af71YwL8I
   1KbnduNBSLdjB9Jjiv8bHuSYbXruBPbQ1uc70WeYSp3opdL5iXOWQ12Us
   iYFVrQSAZQi7GqYWMFAzFKucF10cNL5n9xojbcmn4FHwzHJEKjApL/TFK
   Un5T6ZlVUAOBKihDSszoCeL6M/SwreN9ezIXkecsPWKFoFWvmyUGTHxI0
   ueXHZ0/NTs1BHRlhdkRXXHAcSxaGaIZVWNMe/Uo5GkBOxbSwr1qyqst4v
   5phZwP3riihM8DTY7y/XH7eQmSydRrsvM/1CRDEKvfO2s53b60lDQZkyd
   Q==;
X-CSE-ConnectionGUID: ZThKLU8fQ0mf57u39zlIeg==
X-CSE-MsgGUID: UiWy6BohRDiEIDgBnnWP6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71716401"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="71716401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 22:29:22 -0800
X-CSE-ConnectionGUID: kTtxjzR/R/O8ooNNEeVzLQ==
X-CSE-MsgGUID: Cu+DHvoHSS6gzHsm+zzGtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198554339"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Dec 2025 22:29:21 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWTzK-000000004Ce-28pe
	for oe-kbuild@lists.linux.dev;
	Fri, 19 Dec 2025 06:29:18 +0000
Date: Fri, 19 Dec 2025 07:28:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlayton:nfsd-dynathread 9/10] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512190758.do0v7cco-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-dynathread
head:   d2ad56c0c8d00e9671b57372e1fe9bbf8de8ad3d
commit: b9e44ad181f78ea15379bf5689d68118d5ca55e1 [9/10] nfsd: adjust number of running nfsd threads based on activity
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251219/202512190758.do0v7cco-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#21: 
becomes and RQ_VICTIM so that it will exit, providing the the actual

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
