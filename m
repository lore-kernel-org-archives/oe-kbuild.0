Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DB8370AD5
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734412; cv=none; b=lGnc2hNvdqbhvIrONE7lqeNrm/XJqPLfnyaqiW3xltLzBMqNAMytBZ2ADpbfA0jpZSWQzNIvVYTuozRjUP1NMwu4GxcXQk/aK/AJaqsLjjq3ZyslNiIMQw/YpefpIYBwfmpodtHWM41UlWPIrxMuBImImpAe54HAvkJzMk1xAI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734412; c=relaxed/simple;
	bh=q0XLEy0pPwXqeQYdmpMU9cg2Gewn8rXaEqKxHA5ygz0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cDybWg2iICrze3DHgDzDJ7osxs62ywkQyl7Tls4KILR4Kh9Hx2cj1dVPLqqFourpL3D/qHqTLdGJgvnfhKktbO1yEf2+96SZ18AsKibLoTFfScwiIXNhc7Z8pgQllVFGCpLIUfjaSFWSoEs3se4TXRtjwmc/E5X/H2wIOKOzmB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbgGTJXg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbgGTJXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784734411; x=1816270411;
  h=date:from:to:cc:subject:message-id;
  bh=q0XLEy0pPwXqeQYdmpMU9cg2Gewn8rXaEqKxHA5ygz0=;
  b=YbgGTJXgDcYUGq0MDR95IC44IZorzkpLOfN9C1GN74KI1OP9jYnHoZb9
   zmLBsePDL/w67sIqyC40fYhNwRJg7opEpGl9TgOprV1qHgBqFNGTutWqg
   kQVteFrqCnV/mMF388xSZlm7jl6DusIPskkTC/IjWHRg3gVzmQpDESHE0
   Jm5DcbS0jOMlcbdamWrlbXIP9rxLSCgNc/O56defSukiCePIefa++67Jv
   gko3gMPEfCOx4DkxB3sIZIOoXVWvpxSvrxv6tvIf1m+B8yzR4FooGcuGE
   5gL05pEXNFwLpOeT3L0ALividdkvaEoO+r4GoI7RiSPk1+29COBB4uLaJ
   Q==;
X-CSE-ConnectionGUID: DYgfwZFLTo+TTieEQG7ENA==
X-CSE-MsgGUID: h612X76kT3iVA/q12f7lFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96031813"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="96031813"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 08:33:30 -0700
X-CSE-ConnectionGUID: 25aPJD7KT0+7L1qgL0XLGQ==
X-CSE-MsgGUID: R85EFCyZTO+BY0uiJN87vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="288113262"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Jul 2026 08:33:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmYwo-00000000YqJ-2a37;
	Wed, 22 Jul 2026 15:33:26 +0000
Date: Wed, 22 Jul 2026 23:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5380/8209]
 drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.c:775
 hubp1_is_flip_pending() error: we previously assumed 'hubp' could be null
 (see line 760)
Message-ID: <202607222312.rWq7Txie-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gleb Markov <markov.gi@npc-ksb.ru>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: George Zhang <george.zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: b736792e5bd4a62f24e8d1e310bf4a75bfbeaaaa [5380/8209] drm/amd/display: Remove unused-but-set variable hubp from
:::::: branch date: 23 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20260721 (https://download.01.org/0day-ci/archive/20260722/202607222312.rWq7Txie-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607222312.rWq7Txie-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.c:775 hubp1_is_flip_pending() error: we previously assumed 'hubp' could be null (see line 760)

vim +/hubp +775 drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.c

1a1adf172f6a97 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Dmytro Laktyushkin 2018-10-31  753  
8feabd03d34e45 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yue Hin Lau        2017-10-02  754  bool hubp1_is_flip_pending(struct hubp *hubp)
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  755  {
db3bc05034a4b0 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Dmytro Laktyushkin 2017-06-28  756  	uint32_t flip_pending = 0;
8feabd03d34e45 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yue Hin Lau        2017-10-02  757  	struct dcn10_hubp *hubp1 = TO_DCN10_HUBP(hubp);
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  758  	struct dc_plane_address earliest_inuse_address;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  759  
e8cb7a4dd9dfff drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Aric Cyr           2020-08-21 @760  	if (hubp && hubp->power_gated)
e8cb7a4dd9dfff drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Aric Cyr           2020-08-21  761  		return false;
e8cb7a4dd9dfff drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Aric Cyr           2020-08-21  762  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  763  	REG_GET(DCSURF_FLIP_CONTROL,
db3bc05034a4b0 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Dmytro Laktyushkin 2017-06-28  764  			SURFACE_FLIP_PENDING, &flip_pending);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  765  
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  766  	REG_GET(DCSURF_SURFACE_EARLIEST_INUSE,
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  767  			SURFACE_EARLIEST_INUSE_ADDRESS, &earliest_inuse_address.grph.addr.low_part);
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  768  
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  769  	REG_GET(DCSURF_SURFACE_EARLIEST_INUSE_HIGH,
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  770  			SURFACE_EARLIEST_INUSE_ADDRESS_HIGH, &earliest_inuse_address.grph.addr.high_part);
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  771  
db3bc05034a4b0 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Dmytro Laktyushkin 2017-06-28  772  	if (flip_pending)
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  773  		return true;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  774  
b736792e5bd4a6 drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c Gleb Markov        2026-06-29 @775  	if (earliest_inuse_address.grph.addr.quad_part != hubp->request_address.grph.addr.quad_part)
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  776  		return true;
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  777  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  778  	return false;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  779  }
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  780  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
