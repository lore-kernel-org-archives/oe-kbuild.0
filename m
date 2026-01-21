Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA075328B49
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997608; cv=none; b=lkzWs08v25KFcc6Af+zusE8yQLXYsHeY7EECKmI5xImrKyrpW8Ijy0wwAgcmCCxnXdiqcv+LRP6wIeET+XQcZe45+MM13FFsq4vUILdzB847yTquBpel0WDrlR2kGLIkAAaFCxOySUA6HQySJDb4Yy4/vBzhelhODVmpCfgAwnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997608; c=relaxed/simple;
	bh=QP6+8Kg6X6SYqFA24p/gJFGiEKdoq7KvaX4N3fIBmig=;
	h=Date:From:To:Subject:Message-ID; b=uWb7nBsa62jMIBTTsdDvn8KoQ+Lr8071/xAaDG0FisneOtmRPt2TKwjgUYQ0RTMWvwoD5PSIrUbkvezdHc5SOEedIAinRtH3ZUpTs/Nv8hfigwbzT/CoAjfn5JuHKpdXTNz5H548bfDaYJNcD6tCUjp3Hvyd8oHiKVUQKTzfEqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHPyNkeP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHPyNkeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768997606; x=1800533606;
  h=date:from:to:subject:message-id;
  bh=QP6+8Kg6X6SYqFA24p/gJFGiEKdoq7KvaX4N3fIBmig=;
  b=BHPyNkePIa2rLkPcwwAc10ptnL6mC3NfExDe+3OZdHIR27+Epf6KZI8x
   s6GlHtHrg97g/2fhIzHmSZ752G99tk/i7e1wY8ukZ6ZZLnJnMgxC+VO3Y
   /FoIsgK4RAFoofilnKh06jJLa2o2licLQzg+Pqet8MWH2qpjtVuX08jki
   VATUTBqVnN5cGMCBmmDrI/LdToehhXB+RwhJprF8Yuc2pEyfZe8hr6XKB
   A10H+CWJ4tT9cyLm6yc25Q6m04nsXSnWPigaFsJF5M6Cp9mADCt0GHDmP
   EXjoFSHrYW0EcrdjPHJsHCYSreN4bXtZwYvnRrYa+2BsHPzEgH6o0WWqm
   g==;
X-CSE-ConnectionGUID: XitcZYtEQ7C1T2L18/KQ2Q==
X-CSE-MsgGUID: 8SX7yIYPSau3VFGjsjD8WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70387784"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70387784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 04:13:25 -0800
X-CSE-ConnectionGUID: g0oqEQicQ+S0tFxxlAKb4w==
X-CSE-MsgGUID: p7CNeXTkR5+xnsyjzvd/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="211280128"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jan 2026 04:13:24 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viX5O-000000000GP-1jQU
	for oe-kbuild@lists.linux.dev;
	Wed, 21 Jan 2026 12:13:22 +0000
Date: Wed, 21 Jan 2026 13:12:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 27/34] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601211310.8p3QrGHf-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   517a3a901c85c7f5ede7f82520ddb11cb66c2ef8
commit: 6e84d478ac9067c94af7932e0769b89334feab2e [27/34] xfs: speed up parent pointer operations when possible
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601211310.8p3QrGHf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#57: 
changes are logged with the inode and do not require the the xattr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
