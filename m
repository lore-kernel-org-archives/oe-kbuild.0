Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CB927A10F
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545576; cv=none; b=VDzuU/uG5SxvLzIc53gzJsYxivgakCNLkrJsU3LrxsOL6UZAZFVe/ekz2yFdZZNEuNzrIrXsxjL/2lhik6mRVitJW+ksjHqtSDinV3KNA6qYF3OKdl+TN5bzbavpPGtjkkKAJuK34UTEFWOrw4lY21lVBZM9Zs9NVzxlcnoz1EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545576; c=relaxed/simple;
	bh=Kb98Xjpd/uDQlGDCl7IoFu6EWmH4kgmZHq4E18a145Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FlztpoGPq95uULnqb5+nNydJEBpUY4UQW6499FPfP+ZsuaCOiB5zeFHPH2VwB5HodWqvvZ7gXX5jVyeNU1zPqddXKbQFUaFeh2WK3RU5PvCtBj5IuLaa17LEPqw8ejVKsI8mL6E+p2hCOG17YJ1HN9V5lAFZaSpafP08HotrzVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APqPb0j5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APqPb0j5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772545575; x=1804081575;
  h=date:from:to:cc:subject:message-id;
  bh=Kb98Xjpd/uDQlGDCl7IoFu6EWmH4kgmZHq4E18a145Y=;
  b=APqPb0j5C96LFal+QtUIwk9kfIvD8K4GySu2B9fanAlTfwJfcIskTuOs
   kc8yAeCU8Dgrxlvw0hw8e8keoEvXMj3nhYq6QpQENWypwmg/y57Mnl+Q8
   Sl+X20yvmxsEACcisyGEEJZz/Jth5qw6Ao8IiOFQsp4CLmyvDBgC7+LOy
   kPkzZN+LvcL58Hj/WCbpM3gT3ZbInajm4JnYTZjC51GhXOmHf5TzWp5+m
   i1dFaApMF+W3J/ubE7T5wusdWwPxxfoHUmSd5wIaK/99AwcVV7ZlntOkH
   mTN5L3qGmzVHNalMxscw2GS0IxP1YsHxTVfDi3x51phqj7mW0sN1uJq1u
   Q==;
X-CSE-ConnectionGUID: 0xByiRm/Say6HDFzIKV6RA==
X-CSE-MsgGUID: 5nLt1zhXSF6mpdujpzak3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77449693"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="77449693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:46:15 -0800
X-CSE-ConnectionGUID: ptlPJm8dShG6LflN22/hPg==
X-CSE-MsgGUID: b8IO3pAzQb251wYOGfFF8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="215085769"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Mar 2026 05:46:13 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxQ4h-000000002Hd-2Bea;
	Tue, 03 Mar 2026 13:46:11 +0000
Date: Tue, 03 Mar 2026 21:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build-arm64 8/12] error: objtool: At least one
 action required
Message-ID: <202603032119.6PpSFwCC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   3380d4a54f28033bfd7d98119ced8d69c46418af
commit: f362ea9d6ef61174da74d84983aa124e0cc8980c [8/12] kbuild: Only run objtool if there is at least one command
:::::: branch date: 10 hours ago
:::::: commit date: 11 hours ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260303/202603032119.6PpSFwCC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603032119.6PpSFwCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603032119.6PpSFwCC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: objtool: At least one action required

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
