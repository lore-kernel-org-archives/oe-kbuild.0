Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D0C1E3762
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 03:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760930356; cv=none; b=arEwHlE+BbCbkmLbxyI3rivJneVXm5PCfNgBhgJIQyz7v1rUj+M3a5VJpByDPi/jZlNPLI3P3/vSInEpv6/DB/MCBvit8cdfkF8m8xhiJzxogHMfG7+em/VryEWXE/Y8wwzqvzanIjKurXAIpRHbSYGdgCg/d/9FVE9ReXelRrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760930356; c=relaxed/simple;
	bh=Spd3Yhq8PInIor6jPJJG9L1s8HS2HHT2XzcQBhLmZm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a/SHMMiXoted/R6bjZIEV9V4Xwu75/xBB5wihzDvKdlUNJcsanhcs+ve4PdUVGFmbibiNsrqig4wg6GhRYNv8t2fTSSZ0M353SBIrtXn0oFOM6Eaat1LfUtOK+ICGyk53xLAc2SNF25N+nv03e/mqnvkeMZoIqodc+vnNW+tRGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2CP4yxh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2CP4yxh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760930354; x=1792466354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Spd3Yhq8PInIor6jPJJG9L1s8HS2HHT2XzcQBhLmZm4=;
  b=k2CP4yxhazFMyRVFdawpN1UhMqWl6cBz+hQvWgjzFJBXG5zCiFQ0Ql87
   eTUVBIa1Nm4rBgmWBUx21DKKlU7LpC8Hol/fDTnmEAVT3iy21qZ7K9y0O
   /DrYZ0RwBuh7595JkNg/5KVZuToPPtz/+ERjgGmuWZ3xDQmx5igsChEZS
   6IAJqbEdioPhh4rYyF2B9qkuyX+xySmh9QIG9JzcqN1T7TieKCgfWzDW7
   Seiu4NxPVqGX8keJYNdvx153WJoMhifpHb3k6CMBxCF4D63ImJqr31+9I
   fvSiyZVuPdB3RGKa0Slr8CqV9w+2vl4PClbbD2xT9yJ+XLcJoMT9iYkyH
   g==;
X-CSE-ConnectionGUID: 0dYxnv6lQkGjkvctHRx+0w==
X-CSE-MsgGUID: T9z5BehbQdSmxN9f042O3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62080636"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="62080636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 20:19:14 -0700
X-CSE-ConnectionGUID: 53RTYiNtSBaMCKspVFgi9Q==
X-CSE-MsgGUID: kBcTXVVER0mqqIv0uEuyjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="182930852"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2025 20:19:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAgQR-0009Sf-0M;
	Mon, 20 Oct 2025 03:19:11 +0000
Date: Mon, 20 Oct 2025 11:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/kernel/entry.S:1436:(.exception.text+0x233): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 make_task_dead
Message-ID: <202510201147.QigCaeXP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   211ddde0823f1442e4ad052a2f30f050145ccada
commit: 8d46603eeeb4c6abff1d2e49f2a6ae289dac765e media: cxd2841er: fix 64-bit division on gcc-9
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: xtensa-randconfig-002-20251020 (https://download.01.org/0day-ci/archive/20251020/202510201147.QigCaeXP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201147.QigCaeXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510201147.QigCaeXP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
>> arch/xtensa/kernel/entry.S:1436:(.exception.text+0x233): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead


vim +1436 arch/xtensa/kernel/entry.S

6b5a1f74e50170e Chris Zankel      2014-01-28  1413  
6b5a1f74e50170e Chris Zankel      2014-01-28  1414  	/* We get here because of an unrecoverable error in the window
6b5a1f74e50170e Chris Zankel      2014-01-28  1415  	 * registers, so set up a dummy frame and kill the user application.
6b5a1f74e50170e Chris Zankel      2014-01-28  1416  	 * Note: We assume EXC_TABLE_KSTK contains a valid stack pointer.
6b5a1f74e50170e Chris Zankel      2014-01-28  1417  	 */
6b5a1f74e50170e Chris Zankel      2014-01-28  1418  
6b5a1f74e50170e Chris Zankel      2014-01-28  1419  	movi	a0, 1
6b5a1f74e50170e Chris Zankel      2014-01-28  1420  	movi	a1, 0
6b5a1f74e50170e Chris Zankel      2014-01-28  1421  
6b5a1f74e50170e Chris Zankel      2014-01-28  1422  	wsr	a0, windowstart
6b5a1f74e50170e Chris Zankel      2014-01-28  1423  	wsr	a1, windowbase
6b5a1f74e50170e Chris Zankel      2014-01-28  1424  	rsync
6b5a1f74e50170e Chris Zankel      2014-01-28  1425  
6b5a1f74e50170e Chris Zankel      2014-01-28  1426  	movi	a0, 0
6b5a1f74e50170e Chris Zankel      2014-01-28  1427  
6b5a1f74e50170e Chris Zankel      2014-01-28  1428  	rsr	a3, excsave1
6b5a1f74e50170e Chris Zankel      2014-01-28  1429  	l32i	a1, a3, EXC_TABLE_KSTK
6b5a1f74e50170e Chris Zankel      2014-01-28  1430  
0b5372570b1f3fc Max Filippov      2021-05-01  1431  	movi	a4, KERNEL_PS_WOE_MASK | LOCKLEVEL
6b5a1f74e50170e Chris Zankel      2014-01-28  1432  	wsr	a4, ps
6b5a1f74e50170e Chris Zankel      2014-01-28  1433  	rsync
6b5a1f74e50170e Chris Zankel      2014-01-28  1434  
0b5372570b1f3fc Max Filippov      2021-05-01  1435  	movi	abi_arg0, SIGSEGV
85be9ae7b630928 Eric W. Biederman 2022-01-05 @1436  	abi_call	make_task_dead
6b5a1f74e50170e Chris Zankel      2014-01-28  1437  
6b5a1f74e50170e Chris Zankel      2014-01-28  1438  	/* shouldn't return, so panic */
6b5a1f74e50170e Chris Zankel      2014-01-28  1439  
6b5a1f74e50170e Chris Zankel      2014-01-28  1440  	wsr	a0, excsave1
2da03d4114b2587 Max Filippov      2017-12-09  1441  	call0	unrecoverable_exception		# should not return
6b5a1f74e50170e Chris Zankel      2014-01-28  1442  1:	j	1b
6b5a1f74e50170e Chris Zankel      2014-01-28  1443  
6b5a1f74e50170e Chris Zankel      2014-01-28  1444  

:::::: The code at line 1436 was first introduced by commit
:::::: 85be9ae7b63092895b6e7ac87a3ef383c679866c exit/xtensa: In arch/xtensa/entry.S:Linvalid_mask call make_task_dead

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
