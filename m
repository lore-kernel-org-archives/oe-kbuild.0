Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1F0284674
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217553; cv=none; b=riwDziJEiLbqKmkgYF4bxvfmiCY1JaL813xQXurWwAGcauKhS9o2CML3TJIlkBd410L+7ufaRi0+jJ0iqFUNnsBtvps8D5nwlNGOfMgUDFV8HlP7M/pfeGgVNlQq2AFx86zFelBj7Dhh6uXy3fqkuN7X/h+Q+CCJ2i2Xc7Fg1WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217553; c=relaxed/simple;
	bh=vO+Mn31z/9GwUeQCAwbobhA0rYmWVwgYzrTIOfT1h90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=igUOgy3ZlbpVSyROfyQ+PX/9A480MLxzGJRA72ohKKxulr5mj+YcwvLOSf656xMyJ+aHe3CMaPXGttuOPfeIQ4YY4/EFXcqHIfmh4H/jGE8TLKMRnLArTQMQXvyKuJUIhGGpzayOCAvZm+OE32Lo1ohzz5JbeuxfBgKL0vFJSg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfxaGUTF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfxaGUTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749217552; x=1780753552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vO+Mn31z/9GwUeQCAwbobhA0rYmWVwgYzrTIOfT1h90=;
  b=kfxaGUTFPo4jwQwb87HLcoBAYcw9dR6mIe+wdn7YZhpkzrfzcKxOs+o6
   sXSVtMMmCV/zzAdHSRYQHQv8hPYWrZ7rxbyBxY36PulaT8opApFy6j3h8
   Vohh/3sNlNz1YUE+zh+WELIVrzIBzZxerWdRK0TqboPcZmth4V6SOD/Qg
   3fLS88oZW/BdHM6hwU9nMQa6m+Sl/2x/8hD6mJPAJV/1DtDG4r6jTRX5V
   VcGs8QarZLweFqgD0zbw50vltcyxG8Vl6hRQckZDeUzF/a8M/W5jDkHdA
   hCKmXH2BGWfk4sjft1fq7ONWIKZkezvJrc68mEtKdcpmF3VjmpkA2Dsk0
   g==;
X-CSE-ConnectionGUID: y4JhkRvUTVymImUVMeqFbw==
X-CSE-MsgGUID: o6xyVvIJT+Olp9oFJuiy2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68925139"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="68925139"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 06:45:51 -0700
X-CSE-ConnectionGUID: sE1xP1n3RpaiPi7qaeXZmQ==
X-CSE-MsgGUID: p1jd1DYVTe256Y9Du+jbXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="150991462"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jun 2025 06:45:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNXOF-000517-2q;
	Fri, 06 Jun 2025 13:45:47 +0000
Date: Fri, 6 Jun 2025 21:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/ec.o: warning: objtool: mark_stripe_bucket+0x214:
 unreachable instruction
Message-ID: <202506062135.LWWZHX2E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e271ed52b344ac02d4581286961d0c40acc54c03
commit: 88d961b518826e5e98e171d876b87b642f12de6a bcachefs: bcachefs_metadata_version_stripe_backpointers
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250606/202506062135.LWWZHX2E-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506062135.LWWZHX2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506062135.LWWZHX2E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/ec.o: warning: objtool: heap_verify_backpointer+0xb8: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: ec_block_checksum+0x90: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: new_stripe_alloc_buckets+0xc0: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: init_new_stripe_from_existing+0x1ac: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: ec_stripe_key_update+0x1cc: unreachable instruction
>> fs/bcachefs/ec.o: warning: objtool: mark_stripe_bucket+0x214: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: bch2_ec_read_extent+0x15c: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: bch2_trigger_stripe+0x4cc: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: ec_stripe_create+0x1a4: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: ec_stripe_new_set_pending+0x104: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: bch2_ec_stripe_head_get+0x31c: unreachable instruction
   fs/bcachefs/ec.o: warning: objtool: bch2_fs_ec_exit+0x124: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
