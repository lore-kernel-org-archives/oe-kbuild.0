Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3738DE1
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766819079; cv=none; b=s/wxVHcTVWeS8V9XlpKeeF+FcvCIQWRrCkVbWMOZuj9s7ZdA3zKHSC2+W1BNYVEsZHJi3/OwysvWmUzmGnirR2Q29xegZO7np0iK4n8klFKCw2hSu7SUv2NZqaXSgbKU7OUbWA4dT1zH/abPKg4UV45gdxktyZBbej4NahbA2fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766819079; c=relaxed/simple;
	bh=hy9hNEYUqHQoXyiVIlNWhkEoGSxj7seMKgO9tIINkyM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IeumNmfNun+0mtUUXyAMbgJpC/ErT8Jbh6t8X3Mcml+e8z6ZIUvyMki8GX7lFM+rVmCyHj4tpDDWTO73oWl1SHa0FqCnlIQxBO5zwVXe28swURTZvM5OhDFOgG4EmXzTn4M5/yM4nr2UMGQ7nKrVvc1uV9g+9iA4ng+iHMFKZMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlATfUOF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlATfUOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766819077; x=1798355077;
  h=date:from:to:subject:message-id:mime-version;
  bh=hy9hNEYUqHQoXyiVIlNWhkEoGSxj7seMKgO9tIINkyM=;
  b=VlATfUOFi5Csk0GHWFergLSiz99gfVXKQh6F36Ke5bm0k7/GSHnkpqB8
   iHJ4JeaIUkI9U6Fo3fjwTwgNgNSyTseDJSvAEaixs1TKPsT5QHfAfjUYO
   LdIWjucDakiPLNsZKYRCnC77HdAQwBCXmeeb1M0SMHe+FnYEQ/vO294zg
   ioXBdC72AUTn7kprtOiy2ifGvTIwoBeBXGNVfBSyuyrmOIKIru343O/wI
   v1lLnI9dZ/+zBfAzsFwZyahTENnha0nclOsOJbZ5dBVPhKPxwNsMby6Fb
   NM7z4aZyk//qUig23h+U8zSobsERBaoJEwXyPuK/DovrqPauA2T2Znu0+
   A==;
X-CSE-ConnectionGUID: lLJv3fljQGW6xFr6cEDv1Q==
X-CSE-MsgGUID: D0pp5hVHRUqe+eZJK/latg==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="85956106"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="85956106"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 23:04:36 -0800
X-CSE-ConnectionGUID: PZftAtJnSIehjbqNPoJQeA==
X-CSE-MsgGUID: vm+ocAFmQWGCw6i6+of1aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205554164"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Dec 2025 23:04:36 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZOLp-0000000078e-2sq1
	for oe-kbuild@lists.linux.dev;
	Sat, 27 Dec 2025 07:04:33 +0000
Date: Sat, 27 Dec 2025 08:04:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [chao:feature/lock_trace 11/11] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'to'
Message-ID: <202512270802.7Vt9Ttrj-lkp@intel.com>
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
TO: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   76d9d8ea13699c3b05f129b7bff8b8be75a3ceac
commit: 76d9d8ea13699c3b05f129b7bff8b8be75a3ceac [11/11] f2fs: sysfs: introduce inject_timeout_type
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251227/202512270802.7Vt9Ttrj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#8: 
It can be used to to simulate different type of timeout in lock duration.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
