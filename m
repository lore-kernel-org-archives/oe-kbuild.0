Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC571A5BAE
	for <oe-kbuild@lists.linux.dev>; Sun, 31 May 2026 21:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780261275; cv=none; b=Dq7mYCTLMV9D63xQtzyvLNWB2cogkc9wKnbXfPRB28/BWQ7z8NJgi7KCHiAHnB807EEZYYztoNn9+TvpV5YtANJh1W4QMLRj7NTrnHmw0kEnqNE8T18f0ChDrEeZ/acjcMpwY3Vfrzt9X6cfR5owQ5orP7OsEbok+orCM6s5vYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780261275; c=relaxed/simple;
	bh=i50du1/NoGtvfeliYq/qHtWZoYJPEn48rQVbopubqRs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GyNZROzNM3WSqP2cqsVtQJx0GqQ3JFxJFfalnoJ5iu4UiiziG0Rs/vbKGrmzSXY9t/8d7iXRPObafebjaCm+W4gu6PYYoCKDTlz7mSaKXMv0kWohPWAPCouFqVnpL0gy6NK1KZ5PfIOTpVdnu9gNMltAi85RZ4fVVjaNFELyL5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEnPBUIb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEnPBUIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780261272; x=1811797272;
  h=date:from:to:cc:subject:message-id;
  bh=i50du1/NoGtvfeliYq/qHtWZoYJPEn48rQVbopubqRs=;
  b=SEnPBUIb7bghgS3hZgz08bdzI0pFNbETEfUc7P9FWKapX2ANVbZUF8N5
   r+lme4ungymA5VR1phFYdMnLj+rVDMgL8QqMrDjNd1UzZTnErqbVO6i6k
   tUZc1LeuRSf7C4ITRzFQzQzsXqOT+qnoh7kSMoV279w213EFrIMzKbxZW
   j7gVuIf6FoQZTkPe5Wlz6ITowaoYfedVYxY6StYsDhQAvjMMEqe9kWgPg
   fQmJHtGCWxSIMj6J3yu02tZW7mIo9gSe1v5rhE7ubByf+UWToip6fkVUY
   MUfpP/nyUq+0hndb4oJId9cJhltqIXDC8sI8zyyXdGa+OGPwHl5p5piv4
   g==;
X-CSE-ConnectionGUID: Tp2/UleKT1KBGasyVXSclg==
X-CSE-MsgGUID: cob5A0lqRti/DP8cAavtdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="84885810"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="84885810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 14:01:11 -0700
X-CSE-ConnectionGUID: hhfemMkwSKy6y1QVcST6xQ==
X-CSE-MsgGUID: btTUNFsqQKK4F5kHaUMIMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="239203040"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 May 2026 14:01:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTnHQ-000000009kM-1orQ;
	Sun, 31 May 2026 21:01:08 +0000
Date: Mon, 01 Jun 2026 05:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:sched/core 28/30] ERROR: modpost: __ex_table+0x1d64
 references non-executable section '.debug_rnglists'
Message-ID: <202606010435.Z8xB31ob-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Andrea Righi <arighi@nvidia.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   3b7be8e7fa698359616c3276e005f08c3b6070e4
commit: e7b63427fdb4977621d69085a97272c8856644fe [28/30] sched_ext: Auto-register/unregister dl_server reservations
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-001-20260531 (https://download.01.org/0day-ci/archive/20260601/202606010435.Z8xB31ob-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606010435.Z8xB31ob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606010435.Z8xB31ob-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1a44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a50 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a58 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a5c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a64 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a68 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a70 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a7c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a80 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a88 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a8c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a94 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a98 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1a98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1af4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1af8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b00 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bfc (section: __ex_table) -> $d (section: __jump_table)
ERROR: modpost: __ex_table+0x1bfc references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c68 (section: __ex_table) -> srcu_fast_refctl_scale_srcu_data (section: .data)
ERROR: modpost: __ex_table+0x1c68 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ce4 (section: __ex_table) -> .L.str.291 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1ce4 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d1c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d20 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d28 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d2c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d34 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d38 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d40 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d44 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d4c (section: __ex_table) -> __UNIQUE_ID_addressable_crypto_has_aead_460 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1d4c references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d50 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1d50 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d58 (section: __ex_table) -> __UNIQUE_ID_modinfo_470 (section: .modinfo)
ERROR: modpost: __ex_table+0x1d58 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d5c (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1d5c references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d64 (section: __ex_table) -> .L0  (section: .debug_rnglists)
>> ERROR: modpost: __ex_table+0x1d64 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d68 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1d68 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d70 (section: __ex_table) -> $d (section: .debug_str)
ERROR: modpost: __ex_table+0x1d70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d74 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1d74 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d7c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d80 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1d80 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d88 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d8c (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1d8c references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d94 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d98 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1d98 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1da0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da4 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1da4 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db0 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1db0 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1db8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dbc (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1dbc references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc8 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1dc8 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd4 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1dd4 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ddc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ddc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de0 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1de0 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1de8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dec (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1dec references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1df4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df8 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1df8 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e00 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e04 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1e04 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e0c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1e28 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e30 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e34 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1e34 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e3c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e40 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1e40 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e48 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e4c (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1e4c references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e54 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e58 (section: __ex_table) -> __UNIQUE_ID_addressable_aead_register_instance_469 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x1e58 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e60 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e64 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e6c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e70 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e78 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e7c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: gpio_extcon_driver_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gpio_extcon_driver_exit+0x1c (section: .exit.text) -> .Lpcrel_hi60 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: palmas_usb_driver_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: palmas_usb_driver_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ntb_driver_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdam_driver_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
