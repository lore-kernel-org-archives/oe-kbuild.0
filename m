Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E983351C17
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723949; cv=none; b=eh7ybmtiY0EHJOmm41FToNcO/Ka+zFoEkvvGikoHq+r6Gdx0i6NNN1UOcjomIj/V1OHRxNMN9ug7zj3tW8SCd0+IAUJ5Jke+ccpw95jG3fK4Xanfucnv2h6g7Dv5NN+uJ8NaLUMmqrKTag3wbo+ArcizZ7Ypn0epG2meCd9Cknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723949; c=relaxed/simple;
	bh=yOfbWdqXHJdyAQOZJm+0tZn1XITnrHYuOIwXdVtvFys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DyXEeuSFAlgzyJqM1ALfxUuUxp8LT0cQCFuhNRIMjUMwS/TQjNsihknNl4NBdXsZFtbHCWjO/nROx1a+MXSacIKs31/TbzRC8j9pHpyD1gtEfBVg1NoAlywYnfk3lIhWe6hYpo+5vCpOsnvKarazukHZPgw9JK0uZ+GkhJy8+vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kX5Hg11o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kX5Hg11o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789723948; x=1821259948;
  h=date:from:to:cc:subject:message-id;
  bh=yOfbWdqXHJdyAQOZJm+0tZn1XITnrHYuOIwXdVtvFys=;
  b=kX5Hg11o8e+lBrIDlRRwF8T+SJWhJYK0hSGDAVYGa7dkeycpCR5G/LB4
   pKDZ2d/zyGc4yd4bU1ajgm258dFI7UpG6eKG9c1DNv8IHNsk2SXHWHTpk
   nGxVWu7ZPBEBRB7GhBnm2leN1IStQFAuyV4QmI7kZUCZRql+SDtJuIUbz
   t2SSwzS6RkczmV4oghKWJ3xwXrkVUFp3KIn4wIbCz56krAlo0SzAM0qrB
   GgZaVDtoNMz/q1TmApHRb7U77IPMmAqnEF5sSrFwRK/p7VvQxImLqQwno
   qH3vkWVom0eKbewSz8nsLvA4xfT4R48wTjmcOxzjQqeyxYpJn2tlr8rGl
   A==;
X-CSE-ConnectionGUID: gTWUbg5RQNiouwYIEouYRw==
X-CSE-MsgGUID: p1pslu5TRJ27OawRAPKuuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89149909"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89149909"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 02:32:27 -0700
X-CSE-ConnectionGUID: 8xL4NZB2TRy2+lVFevRhNQ==
X-CSE-MsgGUID: aUtq3YJRTNqNvLEEe6tMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270634278"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2026 02:32:26 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7UxD-0000000013E-3FnW;
	Fri, 18 Sep 2026 09:32:23 +0000
Date: Fri, 18 Sep 2026 11:31:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6680/8072]
 drivers/gpu/drm/i915/display/intel_link_bw.c:69 intel_link_bw_init_limits()
 error: we previously assumed 'crtc_state' could be null (see line 67)
Message-ID: <202609181136.jVZMWtb9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Imre Deak <imre.deak@intel.com>
CC: Luca Coelho <luciano.coelho@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e657a464aba873f5eaf3ca821b6e4016674492d6
commit: ee00f8fbb2b202002ab90834e02e9ba372773a36 [6680/8072] drm/i915/dp_mst: Fix configuring TUs for a disconnected stream
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-2200-20260918 (https://download.01.org/0day-ci/archive/20260918/202609181136.jVZMWtb9-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609181136.jVZMWtb9-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_link_bw.c:69 intel_link_bw_init_limits() error: we previously assumed 'crtc_state' could be null (see line 67)

vim +/crtc_state +69 drivers/gpu/drm/i915/display/intel_link_bw.c

f7f46a80fa68c1 Imre Deak   2025-05-09  45  
8ca0b875c08258 Imre Deak   2023-09-21  46  /**
8ca0b875c08258 Imre Deak   2023-09-21  47   * intel_link_bw_init_limits - initialize BW limits
1dd9d86ab60b98 Imre Deak   2024-02-20  48   * @state: Atomic state
8ca0b875c08258 Imre Deak   2023-09-21  49   * @limits: link BW limits
8ca0b875c08258 Imre Deak   2023-09-21  50   *
8ca0b875c08258 Imre Deak   2023-09-21  51   * Initialize @limits.
8ca0b875c08258 Imre Deak   2023-09-21  52   */
1dd9d86ab60b98 Imre Deak   2024-02-20  53  void intel_link_bw_init_limits(struct intel_atomic_state *state,
1dd9d86ab60b98 Imre Deak   2024-02-20  54  			       struct intel_link_bw_limits *limits)
8ca0b875c08258 Imre Deak   2023-09-21  55  {
9aec90f9e545fb Jani Nikula 2024-08-13  56  	struct intel_display *display = to_intel_display(state);
8ca0b875c08258 Imre Deak   2023-09-21  57  	enum pipe pipe;
8ca0b875c08258 Imre Deak   2023-09-21  58  
470b84af457e34 Imre Deak   2025-10-15  59  	limits->link_dsc_pipes = 0;
8ca0b875c08258 Imre Deak   2023-09-21  60  	limits->bpp_limit_reached_pipes = 0;
9aec90f9e545fb Jani Nikula 2024-08-13  61  	for_each_pipe(display, pipe) {
f7f46a80fa68c1 Imre Deak   2025-05-09  62  		struct intel_crtc *crtc = intel_crtc_for_pipe(display, pipe);
1dd9d86ab60b98 Imre Deak   2024-02-20  63  		const struct intel_crtc_state *crtc_state =
f7f46a80fa68c1 Imre Deak   2025-05-09  64  			intel_atomic_get_new_crtc_state(state, crtc);
f7f46a80fa68c1 Imre Deak   2025-05-09  65  		int forced_bpp_x16 = get_forced_link_bpp_x16(state, crtc);
1dd9d86ab60b98 Imre Deak   2024-02-20  66  
ee00f8fbb2b202 Imre Deak   2026-09-07 @67  		if ((state->base.duplicated && crtc_state) ||
ee00f8fbb2b202 Imre Deak   2026-09-07  68  		    intel_dp_mst_stream_disconnected(state, crtc)) {
1dd9d86ab60b98 Imre Deak   2024-02-20 @69  			limits->max_bpp_x16[pipe] = crtc_state->max_link_bpp_x16;
470b84af457e34 Imre Deak   2025-10-15  70  			if (intel_dsc_enabled_on_link(crtc_state))
470b84af457e34 Imre Deak   2025-10-15  71  				limits->link_dsc_pipes |= BIT(pipe);
1dd9d86ab60b98 Imre Deak   2024-02-20  72  		} else {
8ca0b875c08258 Imre Deak   2023-09-21  73  			limits->max_bpp_x16[pipe] = INT_MAX;
8ca0b875c08258 Imre Deak   2023-09-21  74  		}
f7f46a80fa68c1 Imre Deak   2025-05-09  75  
f7f46a80fa68c1 Imre Deak   2025-05-09  76  		if (forced_bpp_x16)
f7f46a80fa68c1 Imre Deak   2025-05-09  77  			limits->max_bpp_x16[pipe] = min(limits->max_bpp_x16[pipe], forced_bpp_x16);
1dd9d86ab60b98 Imre Deak   2024-02-20  78  	}
1dd9d86ab60b98 Imre Deak   2024-02-20  79  }
8ca0b875c08258 Imre Deak   2023-09-21  80  

:::::: The code at line 69 was first introduced by commit
:::::: 1dd9d86ab60b9810cc99640fa7ebe42e1b9c8b4f drm/i915: Fix display bpp limit computation during system resume

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Imre Deak <imre.deak@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
