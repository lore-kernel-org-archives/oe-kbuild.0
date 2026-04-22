Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841C322522
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Apr 2026 07:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842679; cv=none; b=T0KmBo4BT/JqJu5S7p/VQYQU6fN9xnQgPSLXFAjVwXn9tXAjZfWsZeIGj/e+ApYg3QOwfs7Fag9T2bsUb/p32SEs+/uhCVhNxjZnZiKL0YFnRIqlqoTfV1RIlUBwjuwUDxovM001WwcN41zm8/zhWYGvFvDpMtBy261IEZ5cUqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842679; c=relaxed/simple;
	bh=u+qbI2PgHCjB8LDZHvni9oJ3i0iwHTdwUCayGpoHm6Q=;
	h=Date:From:To:Subject:Message-ID; b=BpHVkjzjCipgfoNb5CkRSkjbYRnDtCwK+5jKAGgylQfVcNKScVrxlXcCXlw4o4ILg0mn5NT6oud4DJnZq930noqtlH6rHMNCF96tchv3d7ciWj4dPvsjJJpBkhgUIaFsl5TMjLtm339rRumZYW8Xvk1WS8ARiWYsWBWd8MB31UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdfnfgV/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdfnfgV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776842676; x=1808378676;
  h=date:from:to:subject:message-id;
  bh=u+qbI2PgHCjB8LDZHvni9oJ3i0iwHTdwUCayGpoHm6Q=;
  b=AdfnfgV/U43iQdsBoU+MUddc0+hHgj2bZ+brUpTEBhH2zjhMBxwjp6n/
   jLwaY7rm5/hk/Nyi1TuHvcvYVQBOoc4RDDvXi5aAZKvngHPSAVZbJBqKN
   LqnDwq+oNRvvXXlVeRvRxjLvtOnIO9FL92mndbh1ndugwuyek1VSiT129
   wnqwYxiR4a5on2WTyw0EhXWZ8b91/H6J+Y0DOLkGwkGHolSahckEmrvDF
   5Vh3YF256Pctfs7Iuy+SeecO3r05ONTJx17pO4FYqvfzB/FnDHF7QY8U1
   7BT97M7bQbkVv4i6J0BVDJGWTwPXt+zz+aT2zdFTI109PiykUMSnvnrnt
   Q==;
X-CSE-ConnectionGUID: S+GswnSFSMa7z4AY1zxt4g==
X-CSE-MsgGUID: tqfZVFo4QhCAB+qGZd8Z4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77771769"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77771769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:24:36 -0700
X-CSE-ConnectionGUID: FbYCq6IoRmm1UWCv7jK1og==
X-CSE-MsgGUID: 2kyad5S1SiKAYv7IIFE3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="236277917"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Apr 2026 00:24:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFRwn-000000002oj-2sem
	for oe-kbuild@lists.linux.dev;
	Wed, 22 Apr 2026 07:24:33 +0000
Date: Wed, 22 Apr 2026 09:23:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next 109/134] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202604220910.6KmDxb9x-lkp@intel.com>
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
TO: Ray Wu <ray.wu@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   98ff46a5ea090c14d2cdb4f5b993b05d74f3949f
commit: 4cef2ac4c795e4fffd6d35ea110f1273e3cb74bf [109/134] drm/amd/display: Introduce power module on Linux
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260422/202604220910.6KmDxb9x-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2145: FILE: drivers/gpu/drm/amd/display/modules/power/power.c:1623:
+		/*
+		* DSC support:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
