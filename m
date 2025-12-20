Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446B1221FCA
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766250350; cv=none; b=obQTP7ONiJf3A264YCPLBO8sS35RpbrqdQURkyklmTHkOYsI6PMLAaWZE7cUPV731wKkB+SJiaYgVJEfSn6cRKzRFLjPVyGBLy2TQS/856wclx1pjqI1cbqjMiDrx0XXob8KZwQoqn35tuOmkJLIYh5kIld6V4t56kcWEjwTxfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766250350; c=relaxed/simple;
	bh=ImYQLiAvhJuZ9utVqILfd2BZb+ENfCDOTCog3m5loSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTeox2TSOyWe63iKjrHMLhffJKiNX/vZEm4+D5Zc8xLAnGMrZAa1gPv360mTZ7iRf5Jce91aP6h3XtZsBSxqhZ60yfIUMytYrdDAmy6gZVwDpQoPz4IVbxKYnYknKKe0yDP8mHWBDfuQy2CqfdNYws/10AZi8Tqc5UHmurefvyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTRQNdRi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTRQNdRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766250349; x=1797786349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ImYQLiAvhJuZ9utVqILfd2BZb+ENfCDOTCog3m5loSU=;
  b=XTRQNdRi/7JPdO9S3Sx68fhOHCJ94Xxgjn/ASadNX2QZUWzgeT3kJbDg
   r3hLuF8t0S3NxUZFeYDEPG86ZMELXg15swEHCIOM69PFQypfCWxRE9/An
   FzzKXzz/592PU5c/KlTD6oQKKxtEPf4mK641674a5gyW2W2UUCtfjj29G
   Qo2yVwZdF2c59C/Mxr3cq/3NgUM6/0Wc+pb2W/bmRG7j4Me/nb1F3d4O5
   2DjobzG0cy2KO/CeWtsOVM4fzVVow5xGQWwV8Jfq9XONEdmr10OjBY8KM
   Ae4Kz6MIAzuB+V+fYjzfyR7rTbkNk1T95qxyGa1VZvd5Vix0CR9WLiq5S
   Q==;
X-CSE-ConnectionGUID: ANEN5oFXS82KYPv3fSOxyA==
X-CSE-MsgGUID: pWiJuKPFQqagInMqAky8IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72040125"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72040125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:05:46 -0800
X-CSE-ConnectionGUID: 33cgs1z3Q/CQNSUFHYbRIQ==
X-CSE-MsgGUID: 45xevp16SECOgHebjlSZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199120043"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 09:05:45 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0Oj-000000004iK-49MW;
	Sat, 20 Dec 2025 17:05:41 +0000
Date: Sat, 20 Dec 2025 18:05:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1092/2671] ../../kselftest.h:53:10: fatal error:
 errno.h: No such file or directory
Message-ID: <202512201809.byHUsrJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Deepak Gupta <debug@rivosinc.com>
CC: Paul Walmsley <pjw@kernel.org>
CC: Charlie Jenkins <charlie@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 7e40c6791cc81e98a191d976a6f6366c77c33292 [1092/2671] kselftest/riscv: add kselftest for user mode cfi
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251220/202512201809.byHUsrJI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201809.byHUsrJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512201809.byHUsrJI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from cfitests.c:3:
>> ../../kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.
   In file included from shadowstack.c:3:
>> ../../kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
