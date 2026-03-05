Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4EB495E5
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772679758; cv=none; b=s6IKjadF30ckmnOfllCY6qo1ZxmqkgzlHDm9MOeU8CU1mzaqcyWCsb4RzoeujJtGF5Q5RnTPHmGkNjlgbImywqEeKdgsZGCS6ZR09Dyryy8BqY/Ry2+NJKK7mthq8UyKAulB2yi6z65WGFozVG4sM7Dlcnbb1ssQoxUcl64kAXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772679758; c=relaxed/simple;
	bh=coqDD092GjCNY1k44bvwUoLe5WoNqN8cItEJSvm4jYY=;
	h=Date:From:To:Subject:Message-ID; b=EMZsX1nhXNwml+AcVRPuKKJLN9zEiR0ciwNU5gNKLf5/J1CWbiOEmcKAKAPGr3FjUEcwSS+IM9mLnqpAF6UGBsRfdQjSpoKPr/fqUqDdMhy4MAZ7Ur0i+VgcWjvhhMCD6mY/BUvcxIJY5OXC9ilnyk8bsBnCw0NuU0whJKwfTJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfTBJbW7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfTBJbW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772679757; x=1804215757;
  h=date:from:to:subject:message-id;
  bh=coqDD092GjCNY1k44bvwUoLe5WoNqN8cItEJSvm4jYY=;
  b=FfTBJbW7+dpFrcQaRf4SFsAyUUgtnhaTmy0EMxC70IVzDG+rLtEq4PYF
   aIk7m9Rs42gG4sNnV4BdLAlXgP5ZPK6MiA4gdEYVjOAFmBy37Qv7Dooli
   mpiOP4dCaRpOd/OByTdWCVJOADY95fPFcPXxFga2QgNGxIvKuk7IKspT1
   uItT94SMu9jHIIH5/jPsTymjN6N8hoerpXggjyjxBs+6uOPvdJ1QCvV/Z
   L7ig48RblWhJEttHCljVv9/yEP+6LXrcxDBjt21w9xUs/NWiBnjA1OVoJ
   4mVWUAq1UgoXUMz4rcHD4zRO+LueSs91Sm1YYKQ8RkkkKap3gwFXYP4ur
   A==;
X-CSE-ConnectionGUID: awoMPtvEQ/G4IKVCaKpNKA==
X-CSE-MsgGUID: 6uhxc1bvSqqLNsPQHVclfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91147889"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91147889"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:02:37 -0800
X-CSE-ConnectionGUID: g/wm0cDuSyiuo0qZN0UyRg==
X-CSE-MsgGUID: D+g78AIlSwuD5OiMGVo/Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218532428"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2026 19:02:36 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxyyw-000000001qH-0t7D
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:02:34 +0000
Date: Thu, 05 Mar 2026 04:01:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 282/467] checkpatch: ERROR:POINTER_LOCATION:
 "foo * bar" should be "foo *bar"
Message-ID: <202603050357.KfjEWcrU-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 34a00df35a5de4bd80c9d95d811506cc53e12ecb [282/467] fs/proc: convert to read/write iterators
:::::: branch date: 53 minutes ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050357.KfjEWcrU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#346: FILE: fs/proc/base.c:1308:
+	struct inode * inode = file_inode(iocb->ki_filp);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#367: FILE: fs/proc/base.c:1324:
+	struct inode * inode = file_inode(iocb->ki_filp);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#412: FILE: fs/proc/base.c:1373:
+	struct inode * inode = file_inode(iocb->ki_filp);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#728: FILE: fs/proc/base.c:2762:
+	struct inode * inode = file_inode(iocb->ki_filp);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#752: FILE: fs/proc/base.c:2782:
+	struct inode * inode = file_inode(iocb->ki_filp);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
