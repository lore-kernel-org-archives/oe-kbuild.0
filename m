Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516830;
	b=JrMhA2sdCGCsCy1/KxZOOV2kokWIEwqotW65wTzq+3Rp5wM/Ua8T6NstfcSSQ7UNNcrC
	 6DTSLmg79ywr7vAAWvVoesIoqhkvgDxGcYYTRdLCtwl3yaWjbehyrl1K0ianIxkefvjgb
	 bYI68y7zAOavlmcPKng/aX5nxkL425Q0NygRz8bCXRAZ2f8Prcf13zCg86D9PoITCUzhh
	 TDjuzBPwHawONfXFsFVcbMEyydsf34PcjYsf7SDRU3MRlc9ngBlBketUbJNtrAMxMwyzw
	 ten29kSJXZKjRedZyjhrq1YmJcYBy1QEHChghFHmOi48xGDkcgZyQ2LJudqWxuDax4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516830;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fpVXtlj1+miJfi5YMoR7ObXWWFZJPOHQrqVoxm9Gcz0=;
	b=0WAtEec5ZQds5Zn7B1ZTOVrlNjciqYI69dg7EJqrJ4GraW2p87DtlegK1p7h4IkCmUFt
	 CYEITccVTVfDnxOntemHqRmJVkJ87sm95svyvhwATHqoosEqRuELpexlY4ElL1uHURiMv
	 +NjOgGSNWugsVeB7LtfUO8ff/43mD8unuf+Zllpp9c4i+HY8pKViwg322CQc/zOgruKXS
	 UNIxAsEcW+9ByJDBLErNwhlyztl7hz/eywmIhSDXmcZyqrgLvOkTA0SaVA83YBx6lUEh+
	 SYTVZR+h+NECSUJGtXwxcFXlKNC7MFOAZU++AZmaPxkKCDh2o4Ib+FZAzfB+/5LQ+OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="YIxDsX/d";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1125E606A322
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 10:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1125E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YIxDsX/d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795516830; x=1827052830;
  h=date:from:to:cc:subject:message-id;
  bh=R6YPbEQLg3WwFtP1gmBr1uCLpNupDJ2o4lDAl+dJ0ls=;
  b=YIxDsX/dIibxHKaAIvSMHkJrL4Lc4e7tasx7lrxtnDejNxqJ+fdNnPJr
   ma1nYiXr8QH/3bIXtY97I9q+YXBggzcg0m0ZPl4tjkn4gEqRHttLUDfMN
   RH8t8wfOsRd+niw8eS+ja9zF4VD4wA5Y/rX/9IzdwuvJLOlziUWqh6Ti/
   7g7AJ0WukpdjLnWPKkJ85PWZBCm8bVI+BCcz6sVTitH8kdul0wU7BzNrh
   h6OZsTAkQc6NIaUnVTM0+JrY81c/p/IUHbS74H8hRql2tHWrnMucOpeDZ
   +tXDI8ifx5JiUuGl5RWPR9UHEK6RsrWjIgIX0qhaXclPA3yucCmgRKFfx
   A==;
X-CSE-ConnectionGUID: DdN3zlllQfWHbVt3ePkZfQ==
X-CSE-MsgGUID: sUCw7bFXT3q2tcKz4k1lmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4259277"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4259277"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 02:10:47 -0800
X-CSE-ConnectionGUID: T9ckcVrjRte0JbbwZ1vARw==
X-CSE-MsgGUID: s2de9sT5Tp6arThA9LNaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11440654"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Nov 2026 02:09:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVnT5-000000005AX-2tzG;
	Tue, 24 Nov 2026 10:09:43 +0000
Date: Tue, 24 Nov 2026 11:08:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android-mainline 1/1]
 ../shared/linux/../../../../include/linux/rbtree_augmented.h:19:10: fatal
 error: linux/minmax.h: No such file or directory
Message-ID: <20261124110248.EPhZkazr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   907a818495f31ef5f542473c6c4696583bd117fb
commit: c2c620f4345c50006af90c37fd104fed8e9dea14 [1/1] rbtree: Declare augmented callbacks per field with RB_AUG()
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261124/20261124110248.EPhZkazr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124110248.EPhZkazr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c2c620f4345c ("rbtree: Declare augmented callbacks per field with RB_AUG()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124110248.EPhZkazr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ../shared/linux/rbtree_augmented.h:5,
                    from ../../../lib/rbtree_test.c:4,
                    from rbtree_test.c:11:
>> ../shared/linux/../../../../include/linux/rbtree_augmented.h:19:10: fatal error: linux/minmax.h: No such file or directory
      19 | #include <linux/minmax.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
