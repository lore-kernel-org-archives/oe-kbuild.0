Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3720A211A05
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 04:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773116200; cv=none; b=blWurJtIly4dPTIbd+s2p196fcgRVQksyRLbMG70l20YY8GgZgBP9FTH2h/5JvE6f+YgpOKMlt9hSs/JdpTOACsHKZ2VPz4jKpmxXaKZSQKL9sq1U/ZGfOtTb0njaBAObcWSe0Cj0pN+JVh7KxcQRaX4AItQ686ZIWRDrsDvN9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773116200; c=relaxed/simple;
	bh=5ZMOn2LWPnw+JhDSzyNmlZSfbT9sr+Q42veSmhJ6L+Q=;
	h=Date:From:To:Subject:Message-ID; b=MZpfMjqamHkYWMK+eB4Yh6fFlWA0DViyqouTthBZ7ItIRZweqlRN7NIyHaaiBsCC+0CwwQGxwA4oOQhGI1ILZL502Gds8wnK0O3YTPlUVqF90C3yJBquNohBKbH80g6QMR27N3Yuc/Qj8TykvpSHGZaKf5gobjDXusf/BOWpXjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdPvsXl2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdPvsXl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773116198; x=1804652198;
  h=date:from:to:subject:message-id;
  bh=5ZMOn2LWPnw+JhDSzyNmlZSfbT9sr+Q42veSmhJ6L+Q=;
  b=CdPvsXl22ti7Ue7CqajgYsN74IbfHuXm7xmGWTjAsVWpKEwntjvmbILh
   OUI48RBIk8wYfT/fl+MGjRD+RZh87Vb0EL5V/wI8onno1GCiCMni4C1+j
   /Vc+abGhPHtyZk+Qguvq6qJgBE3YiEBUrhI3FMjuFv9m52McyaRRVEan5
   B6FSN49QxCZ9weTuTtNGD60pAF3hyUu/LXLGba8QAg0CfddywJrrbVkEi
   0FMSosnVLGIHcmCgRCvef8cKBLw6huwi/3xx/j11/gbKBUgXFWo1JlY0X
   xNT6tWgKJ72jkTtGBnc551/9coLCdiT13AlxmWzBLtDeSIt92wscb63/5
   A==;
X-CSE-ConnectionGUID: mjobVjnDRY6cusyAlDKXJQ==
X-CSE-MsgGUID: 0EpsKwU4RDqSgURwtoAKMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91727383"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="91727383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 21:16:37 -0700
X-CSE-ConnectionGUID: TZl1nkywT1m5zNG9BJgZHQ==
X-CSE-MsgGUID: AgBb/OKIRqGG6eQF+rQVFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224084679"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Mar 2026 21:16:37 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzoWI-0000000030b-2o0i
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Mar 2026 04:16:34 +0000
Date: Tue, 10 Mar 2026 05:16:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ast-bpf:stacklive 8/21] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'imp'
Message-ID: <202603100551.hsVK18CD-lkp@intel.com>
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
head:   e91b0f9c6173771e5fcc844122d5a005ce4e3a89
commit: 830ebe4b805c87598479362b4cdbda743cc54868 [8/21] bpf: Add per-subprog arg tracking analysis
:::::: branch date: 19 minutes ago
:::::: commit date: 19 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260310/202603100551.hsVK18CD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'imp'
#281: FILE: kernel/bpf/liveness.c:1167:
+	 * none + imp -> imp
+	 * imp + none -> imp

WARNING:REPEATED_WORD: Possible repeated word: 'imp'
#283: FILE: kernel/bpf/liveness.c:1169:
+	 * arg + imp -> imp
+	 * imp + arg -> imp

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
