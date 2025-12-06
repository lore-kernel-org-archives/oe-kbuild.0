Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A461DFE26
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 03:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764992520; cv=none; b=fD5cniny7AfAMjNoF4oYeI5tyVNulio13dZgI3LAPa52J+KH5bpuOTN1IhR/iS+Grf1WbQ5b1SlvEVbYwMmfIt8MFGTFNrBI+cX6jWafQKzQUIXe4Vq4lOHXvMHIhcGeETej5vSSbDm1PP38gyIe0+dni3wJMpY8uGQXTmC5Pgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764992520; c=relaxed/simple;
	bh=x/RyRp8qdQeIXGFc+xJ/OU0VwHeDcvS8G2PT0JxHEvs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hqpog9lwb2ejPE0/R22qkqslu3IRHc2AR6E8RqzXV0rPIvRPXKvna2sDIDntjUype2MMHNNWaClv2ReMpMh94YRkgu7bqMSERCSPKmoFhvDjJE4K6YkFX1FaoJ0K0gCyAyyxU14ENPD7nQav5+sDsOd7ypgJqc3nnuTYPvpgKjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqDz3i1c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqDz3i1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764992519; x=1796528519;
  h=date:from:to:subject:message-id:mime-version;
  bh=x/RyRp8qdQeIXGFc+xJ/OU0VwHeDcvS8G2PT0JxHEvs=;
  b=VqDz3i1cniQZOdklJme4z0gioyzHT87xD0XxJ+EP7NahLJvbqMK+1R0t
   aIrIb2gWNSf4rJfZ7gBPDMivXIjBz3U/DO97AI5DUt896Ckq7zbhRdkOd
   UDeVeSJEqEvblBv/5D86m3R+3OzgCxFfEDXThKvcEs8K5dnKzUd9ZRR1+
   FvsZFPwMXKaNQx5LE9rL5u+5ZEuDDey9sozBPdiHZLPnLy6uTUUSwca+f
   jJBV/Gq7U2mwoCHw/KsD3fRLTn+ozkVqNNhdhqS+ptVxrLQOzDn9F1THV
   HIjZ1YRAcovUVT0BTg+7nZVENkmufezTzfM9+bBIoUVXhNVXtSCRxabHx
   w==;
X-CSE-ConnectionGUID: W2O9eQk7RoeYVha5WhbuCg==
X-CSE-MsgGUID: 04gYaStZSHCXyAn2CAfc+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66750307"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="66750307"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 19:41:59 -0800
X-CSE-ConnectionGUID: /fbAoJuwTmGcV1GxjmEWSQ==
X-CSE-MsgGUID: A7HT5B0XTr2k+9wNCiSL4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="194516570"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Dec 2025 19:41:58 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRjBD-0000000013X-2g4N
	for oe-kbuild@lists.linux.dev;
	Sat, 06 Dec 2025 03:41:55 +0000
Date: Sat, 6 Dec 2025 04:41:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [chenhuacai-loongson:loongarch-next 12/22] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'xxxx'
Message-ID: <202512060417.ao1kBSCw-lkp@intel.com>
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
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   f589460002722a1c2eed9d8858dfe49afc29bc20
commit: 708ed32c84ccfa35a62da03a336f88c0df54ab52 [12/22] LoongArch: Adjust common macro definitions for 32BIT/64BIT
:::::: branch date: 48 minutes ago
:::::: commit date: 61 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251206/202512060417.ao1kBSCw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'xxxx'
#397: FILE: arch/loongarch/include/asm/stackframe.h:62:
+	PTR_LI	\temp, CSR_DMW0_INIT	# SUC, PLV0, LA32: 0x8xxx xxxx, LA64: 0x8000 xxxx xxxx xxxx

WARNING:REPEATED_WORD: Possible repeated word: 'xxxx'
#397: FILE: arch/loongarch/include/asm/stackframe.h:62:
+	PTR_LI	\temp, CSR_DMW0_INIT	# SUC, PLV0, LA32: 0x8xxx xxxx, LA64: 0x8000 xxxx xxxx xxxx

WARNING:REPEATED_WORD: Possible repeated word: 'xxxx'
#400: FILE: arch/loongarch/include/asm/stackframe.h:64:
+	PTR_LI	\temp, CSR_DMW1_INIT	# CAC, PLV0, LA32: 0xaxxx xxxx, LA64: 0x9000 xxxx xxxx xxxx

WARNING:REPEATED_WORD: Possible repeated word: 'xxxx'
#400: FILE: arch/loongarch/include/asm/stackframe.h:64:
+	PTR_LI	\temp, CSR_DMW1_INIT	# CAC, PLV0, LA32: 0xaxxx xxxx, LA64: 0x9000 xxxx xxxx xxxx

WARNING:REPEATED_WORD: Possible repeated word: 'xxxx'
#403: FILE: arch/loongarch/include/asm/stackframe.h:66:
+	PTR_LI	\temp, CSR_DMW2_INIT	# WUC, PLV0, LA32: unavailable, LA64: 0xa000 xxxx xxxx xxxx

WARNING:REPEATED_WORD: Possible repeated word: 'xxxx'
#403: FILE: arch/loongarch/include/asm/stackframe.h:66:
+	PTR_LI	\temp, CSR_DMW2_INIT	# WUC, PLV0, LA32: unavailable, LA64: 0xa000 xxxx xxxx xxxx

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
