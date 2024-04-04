Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3513A41A
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Apr 2024 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712272458; cv=none; b=h7PKcpPZuge83B2cDiAPch//7PWLBQXUfOl2tzBcULlFZtgl7c105cdJp1qR7BMJ62oCo80k5xWDzXg0fyaADFgJNHImb+i121innzTUu8woAYDVJRpQr6ZsQuGJKqKg50XOHfLgw7Hk6AWsOfhgjqnRayueqT3s/AVr+SmE9oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712272458; c=relaxed/simple;
	bh=zqMf+mcGw0/gMGBhIObtryPxv1wXlkw/ViPyEJs6GPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOMUsnN9Ve36RFX9dvWP9LuvoVRq7Al7ZZrPaiHN7SiMVVaytaGyZ3TGmMjGNKjqYAxqPxMtUamIgYvP9RAOkb7E6PVja69vMxnp7GIKdsAA0UCVli323Y3Xl5JF2jliQNCULHRNpxbJtw6jR39u1/QuUwdRItRawf0KOhJ3M4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hD4Q+e2+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hD4Q+e2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712272457; x=1743808457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zqMf+mcGw0/gMGBhIObtryPxv1wXlkw/ViPyEJs6GPA=;
  b=hD4Q+e2+5wPi8PHr+6KGK6yeM2+xcNruMPOxVl73jPDzogsmOu0SFxLo
   NHHijQQ0Ufl7vuS9dAFVzC2y4D4MwMUJhQJFdEfU66WN7OWBbIt0kREAO
   e8IPMn3T3TmffIk2iNlHfIU1vYizUHce7SgcGqO/fgWgM24UBfeNqUStr
   Kijzf64BQufSfVQugE+HHEe+fcmOj4v17DMK4c8XUs+kcxkW3Q+Z+D8F2
   u4ZKOIsvjhCYbWrwFnL4FeSBnvNel5m8erepqgJY+U8HBMgSPqNM1TdTi
   Qz7UUVyVrAkjoh+BilJx4haPoHbu21JRvMTiLKgY4vrkjkrISbu9ojTn2
   A==;
X-CSE-ConnectionGUID: MRYG8brLQqODG9qAZR7UDw==
X-CSE-MsgGUID: nKw5BmuESmmeTEDt2db72Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18200180"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18200180"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 16:14:16 -0700
X-CSE-ConnectionGUID: B5OQlPOkTQagYCcZ+M7qWQ==
X-CSE-MsgGUID: Rvmk6UFFRD2OSdniJ2Z4jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19004300"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2024 16:14:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsWHc-0001cM-1k;
	Thu, 04 Apr 2024 23:14:12 +0000
Date: Fri, 5 Apr 2024 07:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2024.04.03a 77/100] qspinlock.c:undefined reference
 to `cmpxchg_emu_u8'
Message-ID: <202404050726.OYE2vcqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit b724f305ba75b638be402fd2f130108ee1c68d5b was found in branch paulmck-rcu/dev.2024.04.03a, not in new branch paulmck-rcu/dev.2024.04.03b"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2024.04.03a
head:   f6416a4a0ebe5a37b471f04b20992be201563e81
commit: b724f305ba75b638be402fd2f130108ee1c68d5b [77/100] squash! lib: Add one-byte and two-byte cmpxchg() emulation functions
:::::: branch date: 6 hours ago
:::::: commit date: 25 hours ago
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240405/202404050726.OYE2vcqX-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050726.OYE2vcqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404050726.OYE2vcqX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/locking/qspinlock.o: in function `__pv_queued_spin_lock_slowpath':
>> qspinlock.c:(.spinlock.text+0x393): undefined reference to `cmpxchg_emu_u8'
>> ld: qspinlock.c:(.spinlock.text+0x41f): undefined reference to `cmpxchg_emu_u16'
>> ld: qspinlock.c:(.spinlock.text+0x45a): undefined reference to `cmpxchg_emu_u8'
   ld: qspinlock.c:(.spinlock.text+0x4db): undefined reference to `cmpxchg_emu_u8'
   ld: qspinlock.c:(.spinlock.text+0x62b): undefined reference to `cmpxchg_emu_u8'
   ld: kernel/locking/qspinlock.o: in function `__pv_queued_spin_unlock':
   qspinlock.c:(.spinlock.text+0x93f): undefined reference to `cmpxchg_emu_u8'
   ld: kernel/rcu/update.o: in function `rcu_trc_cmpxchg_need_qs':
   update.c:(.text+0x47f0): undefined reference to `cmpxchg_emu_u8'
   ld: kernel/rcu/update.o:update.c:(.text+0x482e): more undefined references to `cmpxchg_emu_u8' follow
   ld: drivers/platform/surface/aggregator/controller.o: in function `ssam_request_write_data':
>> controller.c:(.text+0xae5): undefined reference to `cmpxchg_emu_u16'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
