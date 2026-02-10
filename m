Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB326E706
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 01:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770687307; cv=none; b=CNP/+2nEq/cPjP972oFmBMhvDi8sfIMd3w+xujf88KK3lSIZZz7pxY7epfizSgjJtBHr6Nf8tsKNu/2wkPxA21KjFjH/fWIPgvssdARSFDp3UAzlaTkMCdmGrn9Ut6O8B79rqNLnUzCYzvxlxvI2C6JQ/aXKdSd0d0YLm0dXPTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770687307; c=relaxed/simple;
	bh=5AFxT0EZtqYd6IFxNVMqAZdHIoEkF8Y+TjRS56mT2FU=;
	h=Date:From:To:Subject:Message-ID; b=cWJr+B52PfSPjJe7rESLZnRykgoyzjcU5XZimKN9Dj4KNie0+aLfAxRG7Qi30X8qxqQNltduEEwP+HCtjBAR2Hkit/+4G3958HlUpztwrx7h6IDQLgcrn69LIST6xrx/7y/c/B+zqYFTSe524WVHHT9l0XwedHM5u00p3PDvBHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPOOaXQ0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPOOaXQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770687306; x=1802223306;
  h=date:from:to:subject:message-id;
  bh=5AFxT0EZtqYd6IFxNVMqAZdHIoEkF8Y+TjRS56mT2FU=;
  b=DPOOaXQ0tE03+i14HkXhzEdFc+F3qaRgsobkmWhGLk5Yoyoc7d72YAMs
   sLyBab75ZzYo+8P4fLE7VKAgpYTpdSPvrP1YAhGFgWjpLFBADUw0EewqZ
   LxLB2SKJ40iGx3lDIPzhOzixrDBEsRb+Ko64qS/s5+x39E4LSFKE9qx96
   UMmZVcLlY+khN3xaBCdBe4+Jb5qbKfNL7qtCN3yJm3hvgIaBoAvbfnDuE
   PvyCzxxl3jjokUIm9ZoauHjzJBCaCwZVgXm2DgApEtNKwtFE4Q/Ot4h+H
   bslM2PtmcHRG7yZfGg/L4KXDinmAJyo4yMeAtz0BP/hqdfwbqaQ8Ibcc9
   w==;
X-CSE-ConnectionGUID: cwGiS0+wSey+Q4dcYolTDQ==
X-CSE-MsgGUID: 5O5A77JtTJqHH1wyRCL4gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71910800"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71910800"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 17:35:04 -0800
X-CSE-ConnectionGUID: 5v9+Sz78Re6s7vq410DmQw==
X-CSE-MsgGUID: sGy8ivrWTZ6xzW0rEMmzWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211069892"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 17:35:04 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpceb-000000000XV-0zqK
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 01:35:01 +0000
Date: Tue, 10 Feb 2026 02:34:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:x86-slaunch 38/41] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202602100201.DoC4ln1d-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: a64c42672d622dc2867904b9857ef64a890610bd [38/41] x86/efistub: EFI stub DRTM launch support for Secure Launch
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602100201.DoC4ln1d-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#140: FILE: drivers/firmware/efi/libstub/x86-stub.c:833:
+	switch (status) {
+		case EFI_SUCCESS:
+		case EFI_UNSUPPORTED:
[...]
+		default:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
