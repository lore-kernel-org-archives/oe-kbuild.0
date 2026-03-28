Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3C4267B90
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774729216; cv=none; b=L+aFweCzu+Y4kYClgvnXv27tcBj2X7lXXtLMXo/WSDP4daph1UzS3jHaLP5pTvgKbaSJJkxCxE/XLi+XJw8C2zTR1BoVL4CgJxqduDKDODi0mEJaaanKG9argkPBGT0ix5yoNRFB5yQXdtlHov+vCyX69c1gUtTCJCGRYLjQv6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774729216; c=relaxed/simple;
	bh=OVuC6CW3+Mqf3IQN3lQEsxmC4mwIxegIJ18iOmiuFT8=;
	h=Date:From:To:Subject:Message-ID; b=NOvYLuEJdt8YLwvx85St8PO3R49AQSNdB4h6rMahaT4Rpt0c8ajxDnD3GJCe9SRt4RenzhW1a4lPftRpOqr5+MW8nYMfuwR/vDyiEkLQRkfC6zLgqhCqcPd6Mufbo0aVURghmIsaV0pMQBfkbeMKd5VGJVdGinN47Pz/xIwRfWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJZlC6kh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJZlC6kh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774729215; x=1806265215;
  h=date:from:to:subject:message-id;
  bh=OVuC6CW3+Mqf3IQN3lQEsxmC4mwIxegIJ18iOmiuFT8=;
  b=kJZlC6khDkRW7ZX/V2vntU7U8M92WcFzAHnmpURAZBqQZAo2f9YWMsXX
   +ZSOtA79TXXFXFUfMbyYrpZ6I44lPsrk3d9K+IBl+sRMuB0cVnpGu58nr
   akYLCH7gXu/3eKvmYFE3uSXOebTxXgoGJ9WzkjoCNpvbOvribGlJLEhbJ
   LPN+i7l2Jwjvqata/F60CUsjKUs6iUHRw6HQ0B97MpdmI7y3VUNqhCr0/
   uLAHsVMZ8l9PNWOf5dG6MY7h5Z7SXHSu1ZM2H193RSG2Wc32Tsz1kGwMD
   yjrUC90bXAvJeXRDSC42NnS7kJ+rozZtNi98+l2OBLAnNdUjYK1tnjsfA
   Q==;
X-CSE-ConnectionGUID: 1XS1bgXtRziVE/zez96Cag==
X-CSE-MsgGUID: cA+bHPxRR2mvDIZG/I74tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87159054"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="87159054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 13:20:14 -0700
X-CSE-ConnectionGUID: ntijfodORWWN8U4ofbzpew==
X-CSE-MsgGUID: MuRhjHdRQGqhQTkhJijjfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="227249067"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2026 13:20:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6a8b-000000007k9-1ehN
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 20:20:05 +0000
Date: Sat, 28 Mar 2026 21:19:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ast-bpf:stacklive 10/16] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202603282105.Y1QA00ez-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   f1593d826b59f16db0d13b7853c24a9f711b623f
commit: 794ade9136c99fb6ac30b4b3e431a58606967d6e [10/16] selftests/bpf: Update tests for static stack liveness output
:::::: branch date: 52 minutes ago
:::::: commit date: 58 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603282105.Y1QA00ez-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#153: FILE: tools/testing/selftests/bpf/progs/uninit_stack.c:79:
+		r1 = *(u64*)(r10 - 104);		\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
