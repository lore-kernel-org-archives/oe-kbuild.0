Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F481156F5D
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 05:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730094375; cv=none; b=BoOm0yfvic4rp65DtTYxijCU9agyjvT7Qajm+AnW+CeEepfe5Kmf1F8bzB5ILFIrcYBq/mVy2W5Et2uMjZXlhkc7A4QgwbVX1PJXXZzxUh6JufK8JavxGtLDxqta23S7Xg842/yXczbj/qMoslKodSBX2wqAixOI2a6spr/3+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730094375; c=relaxed/simple;
	bh=6cIiQQpz6ZvUDqIZ/mdAZ1J3Hhl4eIqIP1TdeBHzoUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rn57o1fVIG5g+hxyjQ354RUmFP1nz2WAqYQl8Y7tGzbg7KCpg9M6oSrO0KYiBtxlY5FoVwd87cfD8q8baTIUBTleRDcH8smMaeqZXRD7aiQEAv/r0HDO2ILolpvmk95zUhlLoCkCGZvh/dGZ2lkj8IAwt3XFtBVhQraf7AD/V/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfACSL7s; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfACSL7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730094373; x=1761630373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6cIiQQpz6ZvUDqIZ/mdAZ1J3Hhl4eIqIP1TdeBHzoUg=;
  b=cfACSL7sharepq5HqE7pLyeGjvp+s3sj42IRiOEAzELm7OTNwx3k5B2c
   gftKF7XW8BA6DDClwgzkQH/8gNtbV0Iwm3YPfpghd3WvSMD4nj63BLic4
   sMZWkdJMXH3osn8CjgNxKPEdcAeB/icffXE3Vkczze80oMMmGtkOIxtn1
   bGxXwk/fPRdqIARG605BJ2oroHaQVpRPKT43SDrX3oUG2MSei9+lcSdGY
   kUZwSgdU88WmvCPBan0fnH3CGqZL/1umYn91Q3hl2YFb0IUKSjnxsmSsX
   bsg7hsoG12AGLuAil4AuYO3ZxWJk3Mh0xFTElDOgeGsvUc8p4bqOQ/hv1
   A==;
X-CSE-ConnectionGUID: qjYC9YHyRKeP2PAn+JM+mg==
X-CSE-MsgGUID: TLJDen2PQlCwSk7qpufMVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29791075"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="29791075"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 22:46:12 -0700
X-CSE-ConnectionGUID: ACOjuEppRAScp6cOaSajWw==
X-CSE-MsgGUID: /pvEcF12TWSJmWHdGl0/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="104839229"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2024 22:46:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5IZt-000bIu-2C;
	Mon, 28 Oct 2024 05:46:09 +0000
Date: Mon, 28 Oct 2024 13:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/rcu_pending.c:167:8-10: ERROR: reference preceded by
 free on line 167
Message-ID: <202410281303.zpsyJpZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   81983758430957d9a5cb3333fe324fd70cf63e7e
commit: d2ed0f206a9d8b3add18879f39dd128ff55e4d77 bcachefs: rcu_pending now works in userspace
date:   7 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
config: m68k-randconfig-r051-20241027 (https://download.01.org/0day-ci/archive/20241028/202410281303.zpsyJpZM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410281303.zpsyJpZM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/rcu_pending.c:167:8-10: ERROR: reference preceded by free on line 167

vim +167 fs/bcachefs/rcu_pending.c

8e973a4f3c7482 Kent Overstreet 2024-06-10  162  
d2ed0f206a9d8b Kent Overstreet 2024-08-23  163  #ifndef __KERNEL__
d2ed0f206a9d8b Kent Overstreet 2024-08-23  164  static inline void kfree_bulk(size_t nr, void ** p)
d2ed0f206a9d8b Kent Overstreet 2024-08-23  165  {
d2ed0f206a9d8b Kent Overstreet 2024-08-23  166  	while (nr--)
d2ed0f206a9d8b Kent Overstreet 2024-08-23 @167  		kfree(*p);
d2ed0f206a9d8b Kent Overstreet 2024-08-23  168  }
d2ed0f206a9d8b Kent Overstreet 2024-08-23  169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
