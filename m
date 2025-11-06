Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F265130FC3C
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Nov 2025 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428905; cv=none; b=k60oQXSNVVMmTWgwNgfGjOAaGGDgF8OJR9A3wSIguIbjGshcacDfRU7KJkv73SZyrtJxP830iaUeOcZHd04uXRlRbpBJxU31bxwFs1Dtmpc/D1zVCCl8EsmdpNN4s4wF4fIIJLkB28NxvcYoT6/Kx7r1wSRLdzmw7yvwH0ag0+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428905; c=relaxed/simple;
	bh=D4ga3D2fDclnvfWCBxkcaFriZ24bCkfbG335n3Z05ik=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QnjXyllF8Yu/nrxtxmNwiyJl8uSO+50J2Q2GGuiUA8bQ851SDcODNBsmxZ/PVxOCAhMlEfB/ER/WPcgzePD2/g2V9IXd/KGOiczHUUVPuLE3M9HSo8qedxOP/3YSm4yrsJ0xYpo/5sbaWlG4u/i3XkKVwzAV+H68XYeJwQaNtpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLTYWOD3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLTYWOD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762428904; x=1793964904;
  h=date:from:to:subject:message-id:mime-version;
  bh=D4ga3D2fDclnvfWCBxkcaFriZ24bCkfbG335n3Z05ik=;
  b=YLTYWOD3sdH5axhf/GpnXY9XSj6LlI4MN1RA27Ylc1aIA3mLoPF3OfFf
   7stOLk4u8EwNvo+AZBF7kR4S27m2WKZRaLH/VZ0AALH/CqRNFFQPo9cKk
   uN2sPXxqyfZ9qxwvUSc/7hhxbG6lG4M6sO5tLZli5D4CxL2GXrc7XhoUv
   8lSnAAXFXcHVXwqd1EXbuFGkOBYCUSpGdQccpFH6HyWu7JOMICqdFgMFJ
   tjUESSZCJe8iw1MtAdeHUoaY36qDhw0spvDfPjCBu8Tj3+bfKTQMdqy7s
   W1PxdmTtkPOit5q5nDzan6DTA8bFvRCFmtnVgqkwKU0J8IXuSDTuL7lhK
   A==;
X-CSE-ConnectionGUID: 8u0w9B4jQJei7642mFOxfQ==
X-CSE-MsgGUID: Tmm8EIvsQUCyTTpNRDYjFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="68211905"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="68211905"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:35:04 -0800
X-CSE-ConnectionGUID: RSaq3B1mQae1r2UxmxF2tA==
X-CSE-MsgGUID: D/owZSqtS8SNTe2l9PgFkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="211198250"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2025 03:35:03 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGyGa-000000002wi-45N0
	for oe-kbuild@lists.linux.dev;
	Thu, 06 Nov 2025 11:35:00 +0000
Date: Thu, 6 Nov 2025 12:34:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [viro-vfs:untested.efivarfs 9/54] checkpatch: WARNING: Prefer
 'unsigned int' to bare use of 'unsigned'
Message-ID: <202511061211.HEjclGMX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git untested.efivarfs
head:   36051c77301534759fd96e906ea11c5d09bdf81f
commit: be64206a5bd06e66b0d501919ff4b50e0cc58c93 [9/54] procfs: make /self and /thread_self dentries persistent
reproduce: (https://download.01.org/0day-ci/archive/20251106/202511061211.HEjclGMX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061211.HEjclGMX-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#50: FILE: fs/proc/internal.h:376:
+extern unsigned self_inum, thread_self_inum;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
