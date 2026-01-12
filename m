Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE3B9476
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 22:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768257102; cv=none; b=tKcSAYegRopzQVFahr/VJQcJXDGIERW8m4L1KkxfLL+Y7/qiR0ncYH/r0WJmhpwB2Ju4u1JAOSGhfmeFh+McGQ8cWMpuf13YDLZcQlUmE8kItjYYRAlMgcUaYNLMg5SxB2zjoAEaCqGrESAO2ZipUjdRRPHUPZHANIR3GjMNMw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768257102; c=relaxed/simple;
	bh=M/XysLUWX6s+/vpU+YVWwbDdzlnGjBSsGSuwav5dVqg=;
	h=Date:From:To:Subject:Message-ID; b=GuCSLHD7wVQ5jHhgLOsKiQOEulYYhwCs8ksaGjmhp7Ml5AG6W8LON+5whUF1tKl5sQajA9b5JAn1wtwDcAST+LrFvpZPGKu7JygYMufAJaYpW673Wo0e3S/g7NQNtaaTNTVStuzbWLqcd6q4XZa8F4akwpmgAwUit03VdTLkazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHzlGt3M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHzlGt3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768257101; x=1799793101;
  h=date:from:to:subject:message-id;
  bh=M/XysLUWX6s+/vpU+YVWwbDdzlnGjBSsGSuwav5dVqg=;
  b=FHzlGt3MPc+zJgAaEICD+kKODziapT5POKF9J0civt0NtMGdchB+X1K1
   cln6hQJ0FSeeZyJmN0DSScBG+1Qh3zsgnkJizo354XU/sDpDCPajZ76f1
   ZWzV8NPvfx3e4TtfMuoM0VcMLjiSxRcz6TjIOoWxfmHOaMoStMymtndUE
   2t/FASx/osBs14quOJzEf00C3v0rTIqyTq4c/1wPWCHLjnvMhbcYjCFpo
   Qe08iK2ze5W7p/HrbWv5dnCiir+VGzFEG7HcG2xVnKUOAZ5FP07fS4dmO
   L7Zqqidf73YOUUV6uHK+WyB+nQTDhh149r8O2jn7r29K6UknQsXiEliF6
   A==;
X-CSE-ConnectionGUID: PkXbjBwzRrKIlSS311a0Kg==
X-CSE-MsgGUID: aUSbAQaaQi+HDH2IUUKO7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73391315"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73391315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 14:31:41 -0800
X-CSE-ConnectionGUID: /XdSJ+nuRNatJpgUKEDY5A==
X-CSE-MsgGUID: 5xThyA64R+yZropTKmQlKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203373041"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2026 14:31:40 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfQRl-000000000za-2wti
	for oe-kbuild@lists.linux.dev;
	Mon, 12 Jan 2026 22:31:37 +0000
Date: Mon, 12 Jan 2026 23:31:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:netfs-next 8/17] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601122307.z6Nt8Mzn-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 13d810c1f790df05cd4e64875c19e9bacb6baa94 [8/17] netfs: Unconditionally decant buffer slice into a bvecq for I/O
:::::: branch date: 8 hours ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601122307.z6Nt8Mzn-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#237: FILE: fs/netfs/direct_read.c:205:
+	 * Extract an iterator to represent as much of the the output buffer as

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
