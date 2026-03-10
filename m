Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2264538E112
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 02:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109538; cv=none; b=uLsaTpt3CgWLo7M0I9XeE5YzDK+0l9k9/Fb9ZLECBXA1rAtemoqjgtJ+9qZnc/BFcw4L5GpBhFkah23BTSCqMymxlZi0P35gnxpHPnj8IeVQ5IebdJGyQBJOrTMFb9Xdkx4ZKSYEzB6WgPDOr3ZZyTvflacRCYby25NdpYEsQ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109538; c=relaxed/simple;
	bh=vWIYUP/ktO5bgFUJZE73tgq+XAN754X0Cf5iYguGUag=;
	h=Date:From:To:Subject:Message-ID; b=QoyXLMql2ggBltEdSArRJg0Z/eQPYV0AmUgCSqSw1SEVekzKitxMvRo6W4dG8LEvq4p0wpsuZtDuwvjdgCAwjLu6RZhpl9WWFd1oIdxfdIvozn1h9v1Kdo7tRGDsVCOFExC5Uj2FTaXqBQaYBJqieBqkl14ygEHKkxQbKef8dBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSNBzKyw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSNBzKyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773109538; x=1804645538;
  h=date:from:to:subject:message-id;
  bh=vWIYUP/ktO5bgFUJZE73tgq+XAN754X0Cf5iYguGUag=;
  b=nSNBzKywoaf1pnae9+o+78QydRVw8PHc2o3/9MUAhXUXgI4HCFqF1hc4
   TnM8KlVf22kn7Gf660w/M0ESs4n8YF5sAgJK9GhXQVgNB1401psQGCT4C
   m12PcZ4Nc6SP65dKz2IsCTI31KWvyTR8/4qqYTFJEr3dPdpZyWG3S7TJh
   V7AdJ/01y+/qRUtXvuCWY/1UR0liPCP2HhSN1YyozvvJXh+wNJg7b4tRN
   FNaJSwpcb7qHUzHLQEeLd1p6jpPBxE69CtGGH42yUlSJJahAb0NgdFZkK
   VbcOtMPaRgrcJXVHjuOWi5F1VYFEGNAPWNNtjFG9D57MCKvVXpqupR13K
   w==;
X-CSE-ConnectionGUID: ZZJ/Tbz3T1K+K8x5yI75hg==
X-CSE-MsgGUID: E4Bo69FrTuOn0j/+d2CDsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84473670"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84473670"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 19:25:37 -0700
X-CSE-ConnectionGUID: oYt4JaoiTE+KpPcny4CLzw==
X-CSE-MsgGUID: 7Xi4+JhSQfmuyo8CH3A6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224878031"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2026 19:25:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzmmr-000000002zh-3mMH
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Mar 2026 02:25:33 +0000
Date: Tue, 10 Mar 2026 03:25:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ast-bpf:stacklive 6/19] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'imp'
Message-ID: <202603100355.vg1E5Cyt-lkp@intel.com>
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
head:   db370bdfa624db41877645d63bccba71817183d2
commit: e7458f1063efef67721a59784ecb7bc34c15c447 [6/19] bpf: Add per-subprog arg tracking analysis
:::::: branch date: 40 minutes ago
:::::: commit date: 41 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260310/202603100355.vg1E5Cyt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'imp'
#281: FILE: kernel/bpf/liveness.c:1156:
+	 * none + imp -> imp
+	 * imp + none -> imp

WARNING:REPEATED_WORD: Possible repeated word: 'imp'
#283: FILE: kernel/bpf/liveness.c:1158:
+	 * arg + imp -> imp
+	 * imp + arg -> imp

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
