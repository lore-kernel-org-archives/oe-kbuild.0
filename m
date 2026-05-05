Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C121638D
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 04:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777957016; cv=none; b=CBv6w5WrC0v+XlOkDPrJ4Ork3qJ+CqdfAD0dnyRZW2MoXNYwXpTpPzM7saSNBfsvXCWQPzvYoaL0sx602jtgtu0i+KMey3C8kS4KuM4O6LyfV0r7uVpb4+Pn5h2rTHNCoM4ZUsblSKM6hKqLqyyxSxnxTFyipNbrcxCVts78gHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777957016; c=relaxed/simple;
	bh=J3/UNiZqQY5mQLHhXaJeIOj+EVJjWNFUBZ4KUIl3dxo=;
	h=Date:From:To:Subject:Message-ID; b=U88y6NYTF9zoU1ihYD7gEqFYVB0NADo7SNXoKwfIHq9WLsfYVIMx3JZpUk7Lg7udK0wYL+3OetZPiwxTe8sxeGbetwCibKbxg0N++vIYVQNrmVz7G8Tx8yfydYa0AdoIlod7saRLAqOnPw8Jf838nhV/G/QiugTGQGGReCBTRoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAuxMlwR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAuxMlwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777957014; x=1809493014;
  h=date:from:to:subject:message-id;
  bh=J3/UNiZqQY5mQLHhXaJeIOj+EVJjWNFUBZ4KUIl3dxo=;
  b=gAuxMlwR8kyoRyhwAdBSIa/2Gh39ONuIcgAcjr+UNdydddaOXpmEBodf
   BnOXLogaDLqlkVfxgfWNcwQw/8J2DQ2Iz2KCxBSX2UNcvRkH6NU3aM4Xc
   JLRHJ3mkLbC+I9m150lSbH78YjhaodDzfDKzwYGFJR6AysY0e9t7imhyG
   YOcapzvsMda9L/49BDvS5k5x9PSbO+yTyz4WTODfIGgCes/sdZCZUYG5Y
   H+e3hjVI+UkYMfnU+Oo9EWq02Q5+t6/6nnKpdx5vWqHVYTY06n0ou1J9/
   pvLDsZMFACrlDNbpAmqco9LHcTrG7/G29/R/7LWMlddS0fr3zNzpbDLmm
   Q==;
X-CSE-ConnectionGUID: mioSgQnRTd67VnUoux82Xw==
X-CSE-MsgGUID: OotNr8tiTWyJcJar69uliQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78756170"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78756170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 21:56:54 -0700
X-CSE-ConnectionGUID: GYkLCDyiQJOJx2B6VZSnlg==
X-CSE-MsgGUID: OO5ZfQeZR7qaZIpQk3O5eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="232568776"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 May 2026 21:56:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK7pz-00000000697-321m
	for oe-kbuild@lists.linux.dev;
	Tue, 05 May 2026 04:56:51 +0000
Date: Tue, 05 May 2026 06:56:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jpoimboe:objtool/core 50/53] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605050635.c52HWdA6-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/core
head:   2d3bb398861ad3ddbf87959cc2e34a7001f0b3ad
commit: fc0bb9915bce0c333f918ca76958d804ccd79f89 [50/53] objtool: Grow __cfi_* prefix symbols for all CFI+CALL_PADDING
:::::: branch date: 36 minutes ago
:::::: commit date: 36 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260505/202605050635.c52HWdA6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#150: FILE: tools/objtool/check.c:885:
+/*
+* Grow __cfi_ symbols to fill the NOP gap between the 'mov <hash>, %rax' and

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
