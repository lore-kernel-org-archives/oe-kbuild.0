Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2171C3F0C
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 00:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779929107; cv=none; b=fiPTeLT5h/xnOb/TKRQFRnh3JOt/Bm14b4AMq3sZSTDCTL+XAfZQvifwkYZmGXjgVvEGuHoGcZdppeDkAbMyk5CG1KGc22KP6WAsDjJ+3f9hpVsMMjRSUbqUg5ft8V/Y/zGPrOWaFsavGA7DB3AuhZeZn7VJdrmW1Z0PXIsybJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779929107; c=relaxed/simple;
	bh=o4Jn1ybbLuCZ9OB05lEten8l3bP0R4Z0dbjzP0CsRnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F6BObB66ib4rm/fmglPfsykm8l9gkaFFHqf6UMuaUz2HqW4m3yBmACbHoZwi929tmUL3giIeHo8NwPxv9hgQcvSDL9NeHaXpszOSgDXyFplDDWj22o/2j7O68RpKVKkJtYCaxP2lpxDBtBBRkICieK7cxIFlIpSOpVrOa1oY5UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPKbi/No; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPKbi/No"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779929105; x=1811465105;
  h=date:from:to:cc:subject:message-id;
  bh=o4Jn1ybbLuCZ9OB05lEten8l3bP0R4Z0dbjzP0CsRnQ=;
  b=lPKbi/Nov3Ras2C5L0wwcZHZXv+9/iAqTaaLwtulpH5vQCsnmv01AwSP
   FuXYx9ddHC3DLKlEGmESBMwhR471V4hPoqs3WOhx9p3Wpq1QCtH/ERClv
   L4OQTZ/ezdhka4ropuzrNKY6mTPeORIszOyKi47b5A5OqmJOXZd3Bci5s
   ne+928K4JpZ4D2/ohTiy00GwKsJu/+JsboMdSsjBA0+ytaizMzZ01GS5u
   jQF+iZNxcsFBidcWw0Rm22mmCFV5qGv4A9K7AWAr5lUGLvgbEb2HY13vw
   ACtmd1sWcFUtRhPU919WiwwqPetsp71CguRbcSrjcqCnGLAfmKeiXwp9V
   Q==;
X-CSE-ConnectionGUID: GJOCA9FqTBuvdBq5gVED8Q==
X-CSE-MsgGUID: nqW+rbUTS2qF7BM81EFk7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80883479"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="80883479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 17:45:05 -0700
X-CSE-ConnectionGUID: nZrMcTp8QKyP962p5n3/sg==
X-CSE-MsgGUID: xk3b3hlYSr6W+a/d1s/awQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="280514714"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 May 2026 17:45:03 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSOrt-000000000Cn-24qk;
	Thu, 28 May 2026 00:45:01 +0000
Date: Thu, 28 May 2026 02:44:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hare-scsi-devel:configfs-ns.v5 20/26] ERROR: modpost:
 "from_mnt_ns" [fs/configfs/configfs.ko] undefined!
Message-ID: <202605280250.5Lob8EEH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   ef344c27d4d9d0e8ba46f599a08ab287a95e132b
commit: e5d46cb06d256eea6614d4e022faeafde94edfd7 [20/26] fs/configfs: make configfs namespace aware
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260528/202605280250.5Lob8EEH-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280250.5Lob8EEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605280250.5Lob8EEH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "from_mnt_ns" [fs/configfs/configfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
