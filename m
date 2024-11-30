Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C780027
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 04:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732942529; cv=none; b=IxGmZx9hfnydY4Eb6eiM88EFrQGx7nfwwkGuWU/Ajb+v35YAJ+ikheOxGBNt3xmXuCLo83ESzYAJHSYU2HrPHK6yVcCkGWQ2MFK9sxrwFo6qmvXB0cJq2OLcVUKh5Bgg1X6gASLe1Dcw1lTGtJDQADYH4ZXmg8YX8cBI6y4pGyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732942529; c=relaxed/simple;
	bh=Dsyk9GCmnzDWpkvKhb939gbMB4IqNL2Vy7i7VfreJe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CrBF+Svpml2p+5r10J0RnsyEEdEbgxQ0grTkTcBaZL8+XaBv+Pd3IX47iYgRSUCX0poDDV9SZPqRkMnHo9BtVagDbC1YjhfAqzfAZwndmTletRBeXYj2fKoF66rXF+gs+of4f5J0hs51eG9j/eJTGKvK+lPSLhYdrDXI/IrptHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYssoYuS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYssoYuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732942528; x=1764478528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dsyk9GCmnzDWpkvKhb939gbMB4IqNL2Vy7i7VfreJe4=;
  b=gYssoYuSa7puIMi6HWIEOhkACwXcKwnbo7Or7JgjNzW5wA/NS79eU2JG
   574Eauu4rVz6hBv3/rtchwk+h5pC5hI4oJxD+NnBle3M7aNEoNgnJ6vv2
   MWL4iRvqo8/ALdI8HcWKM6URxLsPSIvRuz99SdtaULrah/jogTl5sBiqp
   3jkGyO3EHqQE3Sqk1qhSnQav9JbY+oLKRONnc0v5yK/np86XrAH2Ppscj
   U83FInsHdOtncko1CtCj5SycCrhssBnDEPGfw9uZYQevsRY6q6atYPvTS
   e4CoqwkRXBx2Hpi2b36qUdB/7EqQD2j83KGVlCz9wtxHWZulzQNgaOjj7
   g==;
X-CSE-ConnectionGUID: I3Dda4cTTgeO5g9LluukhA==
X-CSE-MsgGUID: Sey0ePWzR92sojJvMbpqVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44549242"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="44549242"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 20:55:24 -0800
X-CSE-ConnectionGUID: /lztrJPaQVq/1T2iVtgMnQ==
X-CSE-MsgGUID: CYj4E1dMSJC1M70HU6z0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92723823"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Nov 2024 20:55:23 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHFVo-00005T-2m;
	Sat, 30 Nov 2024 04:55:20 +0000
Date: Sat, 30 Nov 2024 12:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:fsnotify_hsm 2/2] fs/binfmt_elf.c:1357 load_elf_binary()
 error: we previously assumed 'interpreter' could be null (see line 985)
Message-ID: <202411301243.AwR7XcXJ-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fsnotify_hsm
head:   e155d521497c38f4ec41e56b154817f4854e7023
commit: 69f947e37830ee8307126700d082ff80d06d416a [2/2] fs: don't block write during exec on pre-content watched files
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301243.AwR7XcXJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411301243.AwR7XcXJ-lkp@intel.com/

New smatch warnings:
fs/binfmt_elf.c:1357 load_elf_binary() error: we previously assumed 'interpreter' could be null (see line 985)
fs/binfmt_elf.c:1358 load_elf_binary() warn: variable dereferenced before check 'interpreter' (see line 1357)
fs/binfmt_elf.c:1358 load_elf_binary() warn: variable dereferenced before check 'interpreter' (see line 1357)

Old smatch warnings:
arch/x86/include/asm/elf.h:161 elf_common_init() warn: inconsistent indenting

vim +/interpreter +1357 fs/binfmt_elf.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  1345  
b83838313386f6 Kees Cook               2018-04-10  1346  	finalize_exec(bprm);
bc3d7bf61a9eae Gabriel Krisman Bertazi 2020-10-03  1347  	START_THREAD(elf_ex, regs, elf_entry, bprm->p);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1348  	retval = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1349  out:
^1da177e4c3f41 Linus Torvalds          2005-04-16  1350  	return retval;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1351  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1352  	/* error cleanup */
^1da177e4c3f41 Linus Torvalds          2005-04-16  1353  out_free_dentry:
0693ffebcfe5ac Alexey Dobriyan         2020-04-06  1354  	kfree(interp_elf_ex);
a9d9ef133f443a Paul Burton             2014-09-11  1355  	kfree(interp_elf_phdata);
594d2a14f2168c Li Zetao                2022-10-24  1356  out_free_file:
69f947e37830ee Amir Goldstein          2024-11-28 @1357  	exe_file_allow_write_access(interpreter);
^1da177e4c3f41 Linus Torvalds          2005-04-16 @1358  	if (interpreter)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1359  		fput(interpreter);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1360  out_free_ph:
^1da177e4c3f41 Linus Torvalds          2005-04-16  1361  	kfree(elf_phdata);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1362  	goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1363  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1364  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
