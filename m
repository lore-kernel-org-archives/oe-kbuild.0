Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E365223FC41
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085037; cv=none; b=OnpOGFPDouAGxEbIrlEppnysXDMmGs06lmW0MBc118rUrK7CaDBxCgtnu79mmCkT7xUvFGjD6nvN+GtSGLm5TWflWC9mqsn9oWt6GlPuV+KP/4LEmPC8Yp7se6Zbz1FLHYpa5HK2v1Gq2rcM9WYA0iKLXnlQgSp9qe1my141iB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085037; c=relaxed/simple;
	bh=uQjzmd3lUFaOQsQYlKKUYFUtTTEB4U/cv64I2Cx5UHI=;
	h=Date:From:To:Subject:Message-ID; b=lIKGfkBks0uffis2efI4gBfHAT9AQ/p1ELdOzUc9X//RFkf+AN8y4W4PX90G+KWIBbHB2CiU/BRzwxZgIXGCdTu6EFRwoovHh1r3IQVd4hjnyD5avAPwvOf03ongej26x66TPTwiWvV0QkUhhCaRXcbgIf7+imbx9AKtLXOcg/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUMrGANL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUMrGANL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769085036; x=1800621036;
  h=date:from:to:subject:message-id;
  bh=uQjzmd3lUFaOQsQYlKKUYFUtTTEB4U/cv64I2Cx5UHI=;
  b=MUMrGANLKAL66O22VTeWzxW9WcVNpiq9hutaGQr+/vcnCq9/eu5EhrLx
   LFzMULbM6PqzD5Y2bsE7WCwQDGB9K34Aa8pivD59Flb6KzotddeWqqhdP
   B5wBq4qgTodnn96PnSzyHbDAWZvuzLLONWNZIuCsS/daV8roOi0TntFLT
   vjnOZouS3tWcpxJFzRnbi85uc6gR6r7kyvahw8544OWiNM/+wOM451EGj
   +m6nXXXUU25LrhC6PCBT0Oe6Ojw7ntOdGEQxS3G6TM2KgOdkSxTd3tNV1
   7sC84KwQD5c3Nb4d4jlXU27IKr0z45BY44dO/72xZfc9YwCoUUKuUB0mg
   A==;
X-CSE-ConnectionGUID: Tf2pk5w9SqWZ/hL2s9Hvfg==
X-CSE-MsgGUID: +1Cv7aCJTIqc4aypbIJkrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70232447"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70232447"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 04:30:35 -0800
X-CSE-ConnectionGUID: JBD3SbM5SQ64gKkEnS1UVw==
X-CSE-MsgGUID: F0npt1TUSfizCMLCzGbTMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="244330502"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2026 04:30:35 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vitpY-000000000Uv-3l31
	for oe-kbuild@lists.linux.dev;
	Thu, 22 Jan 2026 12:30:32 +0000
Date: Thu, 22 Jan 2026 13:30:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rppt:uffd/refactor/v0.3 5/11] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'data'
Message-ID: <202601221355.kNXgS7Ja-lkp@intel.com>
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
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/refactor/v0.3
head:   6960b8a2b28bb1edd135df65233cf44eed89aaec
commit: 3de7eb739d84ff1c7b0b52295cea9d4c0802c968 [5/11] userfaultfd: retry copying with locks dropped in mfill_atomic_pte_copy()
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260122/202601221355.kNXgS7Ja-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'data'
#8: 
data data from userspace buffer when the destination VMA is locked

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
