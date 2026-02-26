Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C40744BC82
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772133379; cv=none; b=SmRc9KX+CqeBYC2b0HtEN99IBaqJfwVmzXH54+fiV9jW9d1xRUlP+zzV+EVWRlCBt+kbBrsbWQrcN7dhf4BaUqxLnRDSLdxNU8TDORT+Slcv2RXs7s9q59GMKUDg3ZeZMKSBLa9GtlOY/h4j0f7+WJGJQwIMtLMKErkHGPfSKB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772133379; c=relaxed/simple;
	bh=Tm7LXJWPSl85vbVZBNOjMOFOlALcco7Jh6Itzt0WSV0=;
	h=Date:From:To:Subject:Message-ID; b=Qb+l/2oy3lZg6xj1S2FJKBliZ6SfV7dqrpqoXMttF/5f4vS+n9eSIplmviCqNZvh2lhSZUAS4YvybeYUPBxa4sZCHVzH17OqBU3Cb3XtbMph/N8uWivg7x2GsA4NNr5YBY06b33ieLg13/I1i6QSASlXwGYMvfc0rddLkd/CM04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsKfkYJA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsKfkYJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772133377; x=1803669377;
  h=date:from:to:subject:message-id;
  bh=Tm7LXJWPSl85vbVZBNOjMOFOlALcco7Jh6Itzt0WSV0=;
  b=GsKfkYJA7DPL/ImSbSLepEQ3cTFB4szVDR3wCgntjYoPjZZ1CmyvsmSc
   iPDSP5dhtrIna2wZYugS6yvrxHiASzZ+VJkJ0Rna/AB5M4Q168hOAiSQ9
   dNDOpt2nSUK0dDNjjRpUBoJQhmZ8oAJpaV7wdD6RXD3dK8DGVtV1Vho1s
   EaUATKd1sFlFcEjmYnyNaM5MyCpL3o9wuUGoF2Rl4Dq40+jR3S/CNazV7
   IxMLSLlwaEQ/4GZ6y0SBuhUAQ8pszn8cFuHrIq3Cn1SgoYFRvkknAE9s+
   TvV8PdF9VO48op5dVaK0+Un9KPjqSlD2Nm5zt3VURWt3iiYLqjdwOtFqr
   g==;
X-CSE-ConnectionGUID: h0hReUbnT5q7nxOGoXoF9g==
X-CSE-MsgGUID: iTnnNGxgS/u24s4gT0r2JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73078471"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73078471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:16:16 -0800
X-CSE-ConnectionGUID: jKbYu8c7S2yvPjDvWy1dAw==
X-CSE-MsgGUID: 1GmWKw59T6iMybSMHk1ngw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="221280650"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Feb 2026 11:16:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvgqM-000000000HV-0J5N
	for oe-kbuild@lists.linux.dev;
	Thu, 26 Feb 2026 19:16:14 +0000
Date: Thu, 26 Feb 2026 20:16:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1068 1/1] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202602261552.zd4T40Vx-lkp@intel.com>
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
TO: chlorodose <chlorodose@chlorodose.me>

tree:   https://github.com/koverstreet/bcachefs pr/1068
head:   86da85122637f024ed809faea9b28095a70d84c3
commit: 86da85122637f024ed809faea9b28095a70d84c3 [1/1] bcachefs: fix security labels support
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260226/202602261552.zd4T40Vx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#157: FILE: fs/bcachefs/fs/xattr.c:255:
+	sec_xattrs->xattrs = kcalloc(cnt + 1, sizeof(struct bkey_i_xattr*), GFP_NOFS);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
