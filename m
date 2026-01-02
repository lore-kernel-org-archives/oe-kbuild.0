Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8AB1C01
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767361450; cv=none; b=V1Ehq73cghZM+072KvWE/4tp7+p3FttVl8F6aV50RRQfDhfvjNeLPXrlU6sFz67n3JacSxPA1ioEdf+ysiN11otc7DSo4g5eTRBEFQaKWsnKOAFxxh5n8q/xDpwt/gFPnFGj2b6G7JUJ6XKRMjyxfzIB0hsFI4IvnaPfyDyrAnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767361450; c=relaxed/simple;
	bh=vyyJ2NefCdHFzyMjExmgE0kLRSY2wRSzIq6chnhwuTc=;
	h=Date:From:To:Subject:Message-ID; b=Kb9d1ui+1+6UjMqQe3BOMqIZpr5/zrQ5HBYrOYtOpyjDv6fzqPZZRcD2/TNJ82eL8COAWpMwqHYhLllmgxkkksaOfK0y9IZCemoAj10Jvyzkxd5u72y3oyQbGGp58OuKH7yNPOQtb9JsUpCtboiMPr1esI8O8wJNdxXD8i9brhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TN2hVWBJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TN2hVWBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767361448; x=1798897448;
  h=date:from:to:subject:message-id;
  bh=vyyJ2NefCdHFzyMjExmgE0kLRSY2wRSzIq6chnhwuTc=;
  b=TN2hVWBJc0xOYArBrxL7RgVJulAdmnRvb0PzMqdg6RmQ3bI2pgvf/FbF
   smcEHt8HGYHediUkdOl7+irlZ1Fm3G7nW6g9yQgkP9a/A7LpR+hSz4TvV
   7Mdmh9aC5zV3uYxZ0wEiiUgHo564qJtLZ4Q1+/qkuQNpk319j/OhtvYxx
   giNARtoBYYuV88/wAXU0Sb4eC6ecgjXqtWOnmXOhWPIrWuZCP2Ijmybi1
   O0noHhUD1RDra/srT6MVE/SH8TfytRayneIXB5Vh5DGCyJwFJZFxb2v3S
   NeUWmQX2/njsts2GdnjTWq5Ky6GgColW8NINybjInkyIpY2KtH6EpOuYe
   g==;
X-CSE-ConnectionGUID: 7430ANBLR927ffJU0ETXBg==
X-CSE-MsgGUID: chwYRlWLQT6PADkJ4gNUOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="86274846"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="86274846"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 05:44:07 -0800
X-CSE-ConnectionGUID: tuKCp6KMRXGqdq/eyKvTaw==
X-CSE-MsgGUID: pVD3cZXkQ5iAeROeMOYwBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="206868736"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 02 Jan 2026 05:44:06 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbfRk-000000000RP-2WiK
	for oe-kbuild@lists.linux.dev;
	Fri, 02 Jan 2026 13:44:04 +0000
Date: Fri, 02 Jan 2026 14:43:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-vfs:work.immutable.rootfs 3/4] checkpatch:
 ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
Message-ID: <202601021419.vAf5hc0p-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.immutable.rootfs
head:   5e6731ae09209829bfa6c639efbefce153ad8672
commit: 032d57f7de808c71ff4a903b2281e6e78e8e7b76 [3/4] fs: add immutable rootfs
:::::: branch date: 39 minutes ago
:::::: commit date: 39 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260102/202601021419.vAf5hc0p-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
#87: FILE: fs/namespace.c:78:
+bool immutable_rootfs = false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
