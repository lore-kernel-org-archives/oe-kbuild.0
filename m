Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2FE38B146
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147222; cv=none; b=RfsTeCkgTfP2+LQAvTY6Ri7q3GvH9ff9FGENUyZNT6plZu1FquFtwGeqlwu57oWxrXqQkP04b/iD2ipRvSGq4kQSpDsLvuDlYgfJkV4EsVvCSEB1j7ZqEFfv6Ju2h5xhYBJSpQuX9XLSBq/1dSEaYEVB1T5c57zSd31qiAfciPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147222; c=relaxed/simple;
	bh=Ai/Fzw1WH1MVKs0aEUFSidaXRiXtZpD3ctI4j6w2doI=;
	h=Date:From:To:Subject:Message-ID; b=qKlgfrRpwzAIGBqF/0vwPp0Ere2ul4IKsqszw8pyV8Hzn4YQI/oFeK6Bzba/Tti55nWXBecUBmxIfFDS6O45xXYWVIq7aqW8dMZo6yux539RlUOb0Ls49U5+Qnv+EuBQS0U0YsODzW0V63zgXfFbl4P4Lzv0uZ41kJprM6IJqi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdRtK1rD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdRtK1rD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773147220; x=1804683220;
  h=date:from:to:subject:message-id;
  bh=Ai/Fzw1WH1MVKs0aEUFSidaXRiXtZpD3ctI4j6w2doI=;
  b=CdRtK1rDq+rq1GPRF/y8F4ZUWGIp+gqKX1aO1xXp/uq4lqqQRddO5QhZ
   oKX6IEy86Ru6HXCwIYvSlhZ3/o1mBUgokHk8uazqCf9ntfnx1cMjluYRK
   ZnnQznd90Xj7suT7U4F5n2tid098Pq6kULWoIKoFoiB3gw5gxMFkAZVUH
   M/Gw3/gamakfAFRnErNyni7ddbiMGc2wuqPrEdhlQoP1VBBxqnrpYpyZ9
   z4pXQhUBqPUWAk9W8hzo843ID3GIeotlK3gP+DCNP0G0dMw0aDzcN9lLQ
   f3eRbHLUmi7KtiZ30GtPyZVJyrwLdJwWvo33IZqKt/AvKbcKBVrqHv1Q3
   w==;
X-CSE-ConnectionGUID: JPC0gy8+RqCFdYt/LVgqkA==
X-CSE-MsgGUID: Wv+v9j4OTCOSODQbcvy7wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84903883"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="84903883"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 05:53:40 -0700
X-CSE-ConnectionGUID: QURK7pq3S9eLpQuVFnNoow==
X-CSE-MsgGUID: SwTj2d9WQH6kgzY07qjdOQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Mar 2026 05:53:40 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzwaf-0000000034L-3x8f
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Mar 2026 12:53:37 +0000
Date: Tue, 10 Mar 2026 13:53:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [wsa:renesas/x5h/mfis-single-driver 6/10] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'for'
Message-ID: <202603101331.jnhVdrmY-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/mfis-single-driver
head:   4b94dbdd7a29e6eb75f860108e546ec765ed3ee9
commit: 82089c042592a8822eef7c658eab5ad82a16d864 [6/10] dt-bindings: soc: renesas: add MFIS binding documentation
:::::: branch date: 60 minutes ago
:::::: commit date: 81 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260310/202603101331.jnhVdrmY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'for'
#181: FILE: include/dt-bindings/mailbox/renesas,r8a78000-mfis.h:3:
+ * Constants for for the mailbox part of the Renesas MFIS IP core.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
