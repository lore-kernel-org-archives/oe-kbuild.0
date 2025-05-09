Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73692749D3
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 09:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781492; cv=none; b=CqrVnLVN/FTIg47iwHBlKT9HI4Fq3+PCRag2U57VrV0FAfMDrRfRuT69V9XfHKu4laXrqwEhR/qZw+U5nehwYFwVJr1xUaiMHRiRZK0dmcozEsd9TjvDiWO1GvdA1U17p4QgVBCkDRpzKgnvr/YJXvkYnN0YeHq7nIIah7VK8CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781492; c=relaxed/simple;
	bh=zx9xncLkzwlnW96xeyUjQnsi201s69AwmhcztCuWY8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aho0/mlYA+yc9Bdlcdr8rxLtxnY34+rL23du/5rmZmTmMndk6GmHOHJMhhp2cg466EMucK3ZFv8is/BI6qn3qyui09ayHdJE9V2Mg9z3dtUjfX1FErcSdR7TCmQui64ciCT+vtBdmcZwVEWsceOg0s2Nuv+QldEilLCTSLdBsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8u9vOuH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8u9vOuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746781491; x=1778317491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zx9xncLkzwlnW96xeyUjQnsi201s69AwmhcztCuWY8I=;
  b=Z8u9vOuHf7g0EP4RqUe+uf0rPwQhFVkhNAtJMlfGOyi+n4E/OIVdYXqY
   z9oafwwzLWdqCbNqJXoy2Ffp1/0mbzdfAS4ksWAA1o8LUTYTVFQxF9S4T
   aji/ereZBk0gzaOxHl4XuFBJVqU/3Dek5tP5GmnSJMiopQB/nfs1yA2q4
   Lv0eOIW7TBGR3n+biEz9YXdqhrT6H523PzVeXvDLlh+/ca6DZ1Iut51u2
   GX6VVv2mnnWsOD5NLLeL3GOjHzm8BtwnWHVR2RHhlN6kKHH+9vexAOkPc
   4Xf5/8E7FHEM3TBFBzxzuge41+ZyVbM9Jf5Lb57OyCfbhGa5CMOVFEQ+c
   A==;
X-CSE-ConnectionGUID: r/1OonYEQ5aIe8vQeVMxCg==
X-CSE-MsgGUID: /p4YpEYfQH2qvi6OJ5jTnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71112479"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="71112479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:04:51 -0700
X-CSE-ConnectionGUID: nDMKb7J/S8GGeKb3cwOuNw==
X-CSE-MsgGUID: qrNwkPX0QDWwZ5mahF+Qig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136496526"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 May 2025 02:04:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDJew-000Bqp-1u;
	Fri, 09 May 2025 09:04:46 +0000
Date: Fri, 9 May 2025 17:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:drm-next 379/514]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:336
 dc_stream_program_cursor_attributes() error: we previously assumed 'stream'
 could be null (see line 334)
Message-ID: <202505091637.9zSZ2WDD-lkp@intel.com>
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
TO: Dillon Varone <dillon.varone@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Alvin Lee <alvin.lee2@amd.com>
CC: Zaeem Mohamed <zaeem.mohamed@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   afc6053d4c4b0a6be500b9e643aa17221e93a57b
commit: 19e743f0fb730e4dac43e37bb71d1ebdb622b3cf [379/514] drm/amd/display: Refactor SubVP cursor limiting logic
:::::: branch date: 18 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20250430 (https://download.01.org/0day-ci/archive/20250509/202505091637.9zSZ2WDD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505091637.9zSZ2WDD-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:336 dc_stream_program_cursor_attributes() error: we previously assumed 'stream' could be null (see line 334)

vim +/stream +336 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c

f63f86b5affcc2a Harry Wentland      2024-03-15  326  
f63f86b5affcc2a Harry Wentland      2024-03-15  327  bool dc_stream_program_cursor_attributes(
f63f86b5affcc2a Harry Wentland      2024-03-15  328  	struct dc_stream_state *stream,
f63f86b5affcc2a Harry Wentland      2024-03-15  329  	const struct dc_cursor_attributes *attributes)
f63f86b5affcc2a Harry Wentland      2024-03-15  330  {
f63f86b5affcc2a Harry Wentland      2024-03-15  331  	struct dc  *dc;
f63f86b5affcc2a Harry Wentland      2024-03-15  332  	bool reset_idle_optimizations = false;
f63f86b5affcc2a Harry Wentland      2024-03-15  333  
f63f86b5affcc2a Harry Wentland      2024-03-15 @334  	dc = stream ? stream->ctx->dc : NULL;
f63f86b5affcc2a Harry Wentland      2024-03-15  335  
f63f86b5affcc2a Harry Wentland      2024-03-15 @336  	if (dc_stream_set_cursor_attributes(stream, attributes)) {
8457bddc266c754 Charlene Liu        2024-01-11  337  		dc_z10_restore(dc);
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  338  		/* disable idle optimizations while updating cursor */
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  339  		if (dc->idle_optimizations_allowed) {
4b675aad9695070 Joshua Aberback     2020-08-31  340  			dc_allow_idle_optimizations(dc, false);
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  341  			reset_idle_optimizations = true;
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  342  		}
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  343  
66eba12a5482b79 Harry Wentland      2024-03-15  344  		program_cursor_attributes(dc, stream);
4fd771ea441ed98 Roy Chan            2021-07-19  345  
4fd771ea441ed98 Roy Chan            2021-07-19  346  		/* re-enable idle optimizations if necessary */
27f03bc680ef7e0 Nicholas Kazlauskas 2024-02-21  347  		if (reset_idle_optimizations && !dc->debug.disable_dmub_reallow_idle)
4fd771ea441ed98 Roy Chan            2021-07-19  348  			dc_allow_idle_optimizations(dc, true);
4fd771ea441ed98 Roy Chan            2021-07-19  349  
4fd771ea441ed98 Roy Chan            2021-07-19  350  		return true;
4fd771ea441ed98 Roy Chan            2021-07-19  351  	}
4fd771ea441ed98 Roy Chan            2021-07-19  352  
f63f86b5affcc2a Harry Wentland      2024-03-15  353  	return false;
f63f86b5affcc2a Harry Wentland      2024-03-15  354  }
f63f86b5affcc2a Harry Wentland      2024-03-15  355  

:::::: The code at line 336 was first introduced by commit
:::::: f63f86b5affcc2abd1162f11824b9386fc06ac94 drm/amd/display: Separate setting and programming of cursor

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
