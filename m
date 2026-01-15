Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D699529A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 21:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512191; cv=none; b=botTsC6r13wztCXztKoCU18G3R4sV+spLgElw2/maUbakSUmr7wxHqMsVHxtHei8fh3hvopXLh+DZnmUGBf7L3jmAZWsEbMj2mJnknmbLuAsaQJ2a/J9OqqenYQECnViC3p2We7hp9N991m8z6TdbsXQ860kNg+ipeH4P/Yy1FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512191; c=relaxed/simple;
	bh=kMxJy+MpLGg7ojWoPTRh96jKqJZ+DYNJ2pjJjnE24OM=;
	h=Date:From:To:Subject:Message-ID; b=KZfe2PJ233PtFbeA37dHUybUGyvRdGGmdFncoflbVK0/qsnf/TeVgkT8jhK2TmPP0ABG/n/ZmKxPaByjvW9LSgafla7zAmNHpgIpgYhsHzFjG+g2zNeX9f9LfOvJQKz3+WqsOXb3PPoTJ1ibketNhWqQ/RhJjlIgIiKJ+K8+sdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FU3GnBI8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FU3GnBI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768512190; x=1800048190;
  h=date:from:to:subject:message-id;
  bh=kMxJy+MpLGg7ojWoPTRh96jKqJZ+DYNJ2pjJjnE24OM=;
  b=FU3GnBI8BAuy5xgkSNawkiybyiOU7f1mBkLLzqvQ5Tbu0xuBbLpcO1YL
   wP09AAEKg6UEFWFBilDrUOlKerqQpTxyQmsg09WIKYYQH/DE6aKDTVeBX
   B6rqCAAtSKq62p9NGf8+Qan9pZHT70fxcX3zSmxDVE5HO5U+8ykmMG0uC
   rShxP9OE47bZbDNHhsSPVjKKBl8eq8Y0tkg5JH4+cH4/b89mIjZEqEQlW
   hRRcVFQBhldQ0ldDf1k+CxpJFO3Y9PDRYImcCWtUkR0VllsAsGTtyr7Eo
   U3M7H65S8UuFOsUTPkQ6/hZx3VXA3F0FVnF9vZq8b36IxAF/sZF3G6jon
   Q==;
X-CSE-ConnectionGUID: ynFotXEOQT2SuNF265yRsQ==
X-CSE-MsgGUID: MV7nTzjfTsaZc8hcNjQUqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80940349"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80940349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 13:23:09 -0800
X-CSE-ConnectionGUID: vSmXh1VtRveY6Kpu8Bnz+w==
X-CSE-MsgGUID: Hi/IJuAVR8yakCJKUETSrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="205117136"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 15 Jan 2026 13:23:09 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgUo6-000000001eT-1Wjd
	for oe-kbuild@lists.linux.dev;
	Thu, 15 Jan 2026 21:23:06 +0000
Date: Thu, 15 Jan 2026 22:22:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:libcrypto-next 40/52] checkpatch: ERROR:SPACING:
 space required before the open brace '{'
Message-ID: <202601152250.NtGWEIsN-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
head:   688066018a6b142794e79e4718f38cfffbcd6a64
commit: 6759dd776cf53fd3384d7dc3759b1fb51b176c5b [40/52] crypto: arm/ghash - Use new AES library API
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260115/202601152250.NtGWEIsN-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#43: FILE: arch/arm/crypto/ghash-ce-glue.c:215:
+	aes_encrypt(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
