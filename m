Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A087282866
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Apr 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396714; cv=none; b=XTKhkD6PWV3ie+yNG7R/c35jT6iC0x+qhu/CQ0NV7th9m7CkW1hbv0yJCphJa794ORrZGOv0QBHL6HgGNGECzGHIdxDbtg0Rmvat7xEcp0FRGc3n59PiseP2MOFq1UsDTZW32Zl+AnftKfSibsKH0gFByndMw2xtbsMH9oCigdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396714; c=relaxed/simple;
	bh=+YUGpwLNux+9N+HVnnDoctexohskgmnvea1gqeru7rE=;
	h=Date:From:To:Subject:Message-ID; b=Zl0RkmpQBpaiPQUO0DDspsRBgoh80feIp7/xgHDcnACRcMWE1SXybhrkMcd+D7b/1j+cf29HDwd5mLaJfr0G3/tNkRca1oQd+Y/nnELUA8YoQSRrbDQtg/Umof9Gu7k7wRdsjQdbhxUJ4U2dmOB+lg9Z1J5dzSgDtlCWT5HyrjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMt6IkV9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMt6IkV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775396713; x=1806932713;
  h=date:from:to:subject:message-id;
  bh=+YUGpwLNux+9N+HVnnDoctexohskgmnvea1gqeru7rE=;
  b=TMt6IkV9C8lHLgxbNm7bpkHyul1cJhQ0e5mtupVIdH/fT0L9hIqLFdE7
   VduYKXLbDb7o0R0qOBQGvyHEIV20fMzvxD2Nc+d1r6z/vdsZPLfAnDdkN
   YBjFhnXpH+IbrCKXE/BxZkXRgrf2myMBIBdTE0xmgzf35DnrRElsASVQC
   MkeL7wHzps8VCE0pSJVN8akVzjt7EspoG/SAvP7jwgIbG+BXmniWQ0aHI
   QKVhlm++MdtDXvSbTTLvDgeboyCe7qbUSD6jJ5QmDBHS+KwM2MV3pZCQW
   vCzDwETj+1ElqhGwsjz9jgTcPKeEb8CiqTbmbF00he+8n9DGP+o+0vFX3
   w==;
X-CSE-ConnectionGUID: HVwhz6odQn+iGNM+ugiPWw==
X-CSE-MsgGUID: LDTIc2hERISTi0ezst2Gig==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76099400"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="76099400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 06:45:12 -0700
X-CSE-ConnectionGUID: lW8lPlPJSiu7UrIgjD/uDw==
X-CSE-MsgGUID: C6wTwGkfQXeUzgdNf0AcHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="232516186"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Apr 2026 06:45:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9Nmn-000000009rl-0aPt
	for oe-kbuild@lists.linux.dev;
	Sun, 05 Apr 2026 13:45:09 +0000
Date: Sun, 05 Apr 2026 15:44:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:timers/hrtimer 1/12] checkpatch: WARNING:MINMAX:
 min() should probably be min_t(int64_t, delta, dev->max_delta_ns)
Message-ID: <202604051552.FxsEUUjV-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/hrtimer
head:   16d99681efb7075be7595afe942a3e590c8df4a6
commit: 1eb866d4e5e5e2735b27e3f46323b9250371ad08 [1/12] clockevents: Prevent timer interrupt starvation
:::::: branch date: 10 minutes ago
:::::: commit date: 10 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260405/202604051552.FxsEUUjV-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(int64_t, delta, dev->max_delta_ns)
#97: FILE: kernel/time/clockevents.c:329:
+		delta = min(delta, (int64_t) dev->max_delta_ns);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
