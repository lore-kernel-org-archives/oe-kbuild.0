Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783CC204C36
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Feb 2026 22:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771797740; cv=none; b=NY3E60yY985PXKGPkoQBUP71T5gpLOvRGwWU1YbHEcAGn/Dej9P3sHInmS7Yxs/BAVZ5SCf+G0Ow3uZF28QjRw9cRLY4fCzBYrBi8xwXjON5/ARharX3aRr+S0brZaykST9lhI8yAPjCTjnN5zNFV5bE0HAraNlrUC/ksFnMVzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771797740; c=relaxed/simple;
	bh=4hMLq81lyjl8sSCtvxQerQxY/5vyRxTdoy/zpvrk/IU=;
	h=Date:From:To:Subject:Message-ID; b=blNOmoFyFCAI0chfxF0YYgELTf410hZqFDiyziaOpvvl2JV2xcMRcOyISZEFU3XVu8X4SPD/PzBkyU0WqfHL9UdwySibCC4o5na9ZMHquiVi0LaMnY4ihYBt2QECIv2iSD8zoEep9pZ4YsVDm80GbTK0vKtNYhvk9QfYtEUgiAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpA2+IX0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpA2+IX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771797739; x=1803333739;
  h=date:from:to:subject:message-id;
  bh=4hMLq81lyjl8sSCtvxQerQxY/5vyRxTdoy/zpvrk/IU=;
  b=YpA2+IX0k0oRHiWAqMOVROF03P/Hcz3MwPNGvEi5uCZoZnlsssUve5b3
   q9X3KOxNN9rusn5a/PUNsjM57e+Cq2SceRu2vNlYqXg4NjE7Nv98lYXer
   x8wTBrql4ibflPmOC9+s6O2DaccBX75zUv4BIVGF+emhjWVCOCoMMTNWQ
   LoNgLBX2/R8uRgsiN0fAH1OCI0LDo+7O2u9pmrxRW3bP7G0oanwgMnh/0
   s7OHnMAcBK5d92lez0Dn9cttVUVbmBfRkYWgr+9lyjVIRjJAd8YttT3cM
   170gk+HQcZ82dAcIqEaxoD5sbB2B09K5Wi+4d+aOEB9IZyi6P6jrbnCQu
   Q==;
X-CSE-ConnectionGUID: D97wQWi+S9e4BV0SPsGNIg==
X-CSE-MsgGUID: FaHzLoIXSVucfQ1ozIwZTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72503102"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="72503102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 14:02:17 -0800
X-CSE-ConnectionGUID: B7ka6L4KTseS+x8RPUD81g==
X-CSE-MsgGUID: iwrFbgANTvig7ZDlh51ObA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="214615368"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2026 14:02:16 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuHWo-000000004j7-10TJ
	for oe-kbuild@lists.linux.dev;
	Sun, 22 Feb 2026 22:02:14 +0000
Date: Sun, 22 Feb 2026 23:01:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 45/46] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602222333.GW9NBmra-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   108074eac008632e059c777dbc8ad2a16c39972f
commit: 744879454b6136a5e3ea124425476f5be12716d0 [45/46] hrtimer: Use linked timerqueue
:::::: branch date: 36 minutes ago
:::::: commit date: 36 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260222/202602222333.GW9NBmra-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#11: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
