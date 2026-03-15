Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC6736DA06
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773597942; cv=none; b=fRp8k294w4k8eBPnljsmymFRPLZImaFD1zJ1U58trCH7a6XxLZluxt7L50yedMj4aoP6wuNIMGj/OJL4B0rbOpi+YvCtRXPZBjcdACJzpvePJJ2ar8djelVFa3gfKCEaNBN/P97RND8uu8lCb0d30MSmsswTPOGrtWLMCD5/RfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773597942; c=relaxed/simple;
	bh=t+qnWXVwqkHy9H3VKUDrMa0vAwXSfMhauAg1hQwXKFc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GiljxQZjaQmriUTbgR6Igm5IAblHsJVOC0q0iEHMN1FX6/IvPx8lKFLF0bR2OEi9xPJSCgtDmEeE7NoiqASEELix94gnVuveTrPQ7wxF97SLzD1//sInC0aWj4mgRWvwFfTJoWS5MTYi9EauuCK3mqpeYsF4bdG00oOLwi3i36g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfSfg3ZG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfSfg3ZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773597939; x=1805133939;
  h=date:from:to:subject:message-id:mime-version;
  bh=t+qnWXVwqkHy9H3VKUDrMa0vAwXSfMhauAg1hQwXKFc=;
  b=EfSfg3ZGFcOQwlOZSiZZtxmiWdE7H9BOk/s08DsdZWydHm1g0mfP51Id
   ppEDXIawXF1iWfcpLepSJM6QM3hKBUDOuWBPxOQbRn1AFD0Vw+YGE3k8C
   jfb1nA69CEhMzT66/GrQDv1oWAySoeNAHM6oTvyZRKMUu7qfO6ZuJv/R1
   /MGYYhuG+4YD4Z99Z2bWsBjEQqp5Uvba9IiarSBSh2sfa+MKxRofN9iSy
   WBrXOv5jWQeVZ+V7RaG/NT0f06cN2j1bz/60L6xfgSvqRwz63Ap9INUJZ
   cE7Bi4+04VuKdrWA7Wz8O/5VaS89boj9bDoNo+3PQ6/Zx/H6i2dSjfUHG
   A==;
X-CSE-ConnectionGUID: rguIkvseQUGtIeas/DfXVg==
X-CSE-MsgGUID: OV2QDHOfR5C4uK5/H4aFfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="97237016"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="97237016"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 11:05:38 -0700
X-CSE-ConnectionGUID: bN7k20TISQ+kiOBl0T1lPg==
X-CSE-MsgGUID: LC2NQFBeTQK6s1uy8siAiA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2026 11:05:37 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1pqJ-0000000045l-0sN1
	for oe-kbuild@lists.linux.dev;
	Sun, 15 Mar 2026 18:05:35 +0000
Date: Sun, 15 Mar 2026 19:05:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v1 3/4] IPC: Prepared Documentation  and test
Message-ID: <202603151918.0zkeBkT5-lkp@intel.com>
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
In-Reply-To: <20260315040827.156558-4-academic1mathura@gmail.com>
References: <20260315040827.156558-4-academic1mathura@gmail.com>
TO: "Mathura_Kumar" <academic1mathura@gmail.com>
TO: brauner@kernel.org

Hi Mathura_Kumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathura_Kumar/IPC-Added-New-system-call-do_mq_timedreceive2-for-non-destructive-peek-on-posix-mqueue/20260315-143134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260315040827.156558-4-academic1mathura%40gmail.com
patch subject: [PATCH v1 3/4] IPC: Prepared Documentation  and test
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260315/202603151918.0zkeBkT5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#951: FILE: tools/testing/selftests/ipc/mq_peek.c:650:
+	/*
+     * Peek repeatedly.The queue is being drained concurrently.

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#952: FILE: tools/testing/selftests/ipc/mq_peek.c:651:
+     * Peek repeatedly.The queue is being drained concurrently.
+	 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
