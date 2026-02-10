Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95383A8F7
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770735378; cv=none; b=V+Jims456WG93uxtFP8h98qOyVFm2SQrI7bAKKVFOG00CjA2HjGSqF07vkJ1TAyNSso8dx0dV7XFBv8AIBjfisNhjOi9iTzAWyqbXKQkK0d9dyhTIzoRViDgsrF4l1vWfGn4OBmen0hcLuTExeegqZnhoMft/WZ2tvsmdEfBld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770735378; c=relaxed/simple;
	bh=5/5iNCN6KBOHUG8QbnVa849ikm11fpLIVxGBq0j8Cis=;
	h=Date:From:To:Subject:Message-ID; b=WMbKy2+FfRTlyhr4V2xJFuDOrYL6MM7nD37zFuVE11Th92ddFVDuYZfgrBsTa9DkJy3+LZnK6S+uC7c/t/yTSehB0P+kruaEdvUsByyhUBYnexrfbpeNjssaBTvSfdMtSR2M9iaO2RsXESxHuoX8/XlFKTgy5XO2WYWghf6M/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpto7py5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpto7py5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770735378; x=1802271378;
  h=date:from:to:subject:message-id;
  bh=5/5iNCN6KBOHUG8QbnVa849ikm11fpLIVxGBq0j8Cis=;
  b=kpto7py53TVEsyC/VvOju5JXr1ddVpbrcWevOtUlDVL7cR9ppC1nTMZB
   x4yHiRtl+uVQtTfZ67ohXEGKYNxxIlcZ/hCGg3+9BAwciqYYVm2TNiyUe
   SPE6e/LMn3oY5Jou96STuZ1yjmBDMFx46yAPr3uvQ+sp8XlAZBWym9Cjw
   CeBHK1abBPilfr3aPQGvBNbgYDbG/ynwqkdZr7bBx3F2B+hjtuDDpoAsY
   3/WJodux96eLO9GwFRq1SB9stuFFaLZO5uYlQrfWIsZV1HM3EsMKv5hgI
   NMkibZpAROwfyES/7Lo+Ner8M8uhkgiVL/VtyKHsNHGA3Z1WlbjCL7PYi
   g==;
X-CSE-ConnectionGUID: TEgvJWhrSRe72+SJlsDHXQ==
X-CSE-MsgGUID: 5EBOVRE4QAqQkFoCQiOexQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="70879155"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70879155"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:56:17 -0800
X-CSE-ConnectionGUID: +U0tIVDkQuajucHscCmYYw==
X-CSE-MsgGUID: HNXlSZBoQ6m6M30ZiAqDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212018487"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2026 06:56:16 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpp9y-000000000rR-0t9t
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 14:56:14 +0000
Date: Tue, 10 Feb 2026 15:55:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 105/105] checkpatch:
 WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
Message-ID: <202602101530.AgJK1q0u-lkp@intel.com>
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
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   b6daace542159a3879b60866e24495985ecffc23
commit: b6daace542159a3879b60866e24495985ecffc23 [105/105] RDMA/mthca: Use generic resize-CQ lock
:::::: branch date: 29 minutes ago
:::::: commit date: 29 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602101530.AgJK1q0u-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
#53: FILE: drivers/infiniband/hw/mthca/mthca_provider.c:687:
+	if (ib_copy_from_udata(&ucmd, udata, sizeof ucmd))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
