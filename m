Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0224826B971
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 21:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764363602; cv=none; b=qxbHR+Zr6SV+IuRs3y7fyiTxsbZQHVulXCoywFm+5n7LCQ9MH8NZZixQCUeHwg9cOlknPEzcrNMkOWlKGClW/XIKbesxpD0l19fa12jtJVwEjkrz/wUYaPwfxkoQBiXds+WGKL3O/dqiWL21KtrmjxW+H2ulpKPXwMCLzLX1NS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764363602; c=relaxed/simple;
	bh=lMmNdMtalvohkJiMhyGGC5BTShPZ7fA+WZqByerI8iQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+93Xm6qVUm6b3+WyXKfPXOUVBimDLdte4yvVi3tJxzuCQeZXkHv/wpY12z9HpOT3lL66OgwaMDBXsjQPj+DaXgnZqGQmKto5ZJbkOmnLfjPjAzdUD9RldRN30Ob6PD6yz2CwkniLDQOxKKT3q3UdIQmtdMg1tCDXna+RyXfubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfkcLU8N; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfkcLU8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764363601; x=1795899601;
  h=date:from:to:subject:message-id:mime-version;
  bh=lMmNdMtalvohkJiMhyGGC5BTShPZ7fA+WZqByerI8iQ=;
  b=DfkcLU8NLd7yX5PMkSkMnFS1BcIDzu0mEAjQxA0QUzjDTr8Tu0YN9SKT
   M0pbg7+F8+jfEmMssGwvdTouytv1YyJKqUz/Kv2fmWaxE45SLHdbRzuf4
   OTzXn+WKUNNLFsQtz6nHmqFq7slpaD68jz4H88FWjBN3apOgvywnQN7Me
   NKGsGxAbrkkh9HzKd5BVNFX55rOr5BimSJOwRHXstCQDkbJCnKrEj5aJR
   OEcVWrsNsAZxu5KOqsmYIeFtzVObDb8QdWo7ZHNC+Ggu/Rt4JhngR3KOO
   LlPbE5VSZxFcXuckSXz/w31jTn8cPwDw7zCsrR419l/oJWCvLRIem+0rh
   w==;
X-CSE-ConnectionGUID: rM6hF+lDTMWUu1kUYoLvaw==
X-CSE-MsgGUID: cSzbtAQVTku1DAfsyYnYHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="91867167"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="91867167"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 13:00:00 -0800
X-CSE-ConnectionGUID: s645oTPxT4O88pMmiO1MbA==
X-CSE-MsgGUID: xUVtRozwTJixHjFakWPmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="198470122"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Nov 2025 13:00:00 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP5ZN-0000000028j-2q0u
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 20:59:57 +0000
Date: Fri, 28 Nov 2025 21:59:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [chenhuacai-loongson:loongarch-next 10/21] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'xxxx'
Message-ID: <202511282111.kdULrnkW-lkp@intel.com>
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
head:   f3e098dde874d0611efa9909dfe5027e350e6430
commit: c4bae069073b08964b5ce91185820c2c21f323e4 [10/21] LoongArch: Adjust common macro definitions for 32BIT/64BIT
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511282111.kdULrnkW-lkp@intel.com/reproduce)

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
