Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92282248A5
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267036; cv=none; b=QE3mlnvzh5j/WlMywq/DJA8ovl1zhQ5v0WIT+zZP/2MZv6DwRQW19SFPb7oqUY5YQqinmNa08bOZpR+AVilOefmtGbSUfFiQv0Mn6mkXc1UGPUJ2oUD7IinDCq3AiFMdYdqPcXwKIu76RfAUcyqXoOZ87t0e0DdElPWv2OkmrFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267036; c=relaxed/simple;
	bh=jcvE+f3o3ncIE9fvvAWWhQ4o7MyQrIKEUO1ApkcKCmg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HnyddHIVx7heeUenVnHmPuufyUhalnOoAEwRwlyZqJhpI8/6zOj1YVEGZQSijwCf6SG0wGWUt4ZK8N4nK9RXVniLyvh3F4unobzK50ZrFb+2vzhJCYf3PZb9Uzuy43i8mFlNyGdKk0ZZ3Bm3iifxekQjW1VN9K6li6miVACyqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1iiJoJk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1iiJoJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791267035; x=1822803035;
  h=date:from:to:cc:subject:message-id;
  bh=jcvE+f3o3ncIE9fvvAWWhQ4o7MyQrIKEUO1ApkcKCmg=;
  b=J1iiJoJkV9c9tENaS4P4cju9qeoBw4p+pJorFEkHgKybNmtCD/87bYSh
   abHXBsha6aLtD9WLyEl9IUBJxefQy+qUBWPlXUzzFRI5SbYE8bhQCVAXX
   w0BYZInssVqDBwRZIVrw4rqP/0dSU/8aE0lpb3r59fQWCAIYwEW3/ui86
   KD76i9rVeyxH6j5idjK8lxYiQnRT+IH4Cx2VFXjep+QE4Vai2jOgLGVPB
   s9fgexvukAVBGCAR3267UKpOT45l7HaRTwBlpMr9IKlI8jVgHOkq/Ksmm
   5PUGbzQlFwGLJZU/uNlyNWnCSODfbZHXBED0wjGO4fi25WKh7trWGWr7E
   g==;
X-CSE-ConnectionGUID: u+7HYa6KQESFKtAhAcfaHg==
X-CSE-MsgGUID: sAURXEs7QcK95oHiKAPgLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="2383"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="2383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 23:10:34 -0700
X-CSE-ConnectionGUID: LWFYVtSITw+Yl1d94ynmjw==
X-CSE-MsgGUID: ew+G9dR2T4arxRIyZXyclg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280310324"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 05 Oct 2026 23:10:33 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDyNi-000000000ob-2CGb;
	Tue, 06 Oct 2026 06:10:30 +0000
Date: Tue, 06 Oct 2026 08:10:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/video/fbdev/omap2/omapfb/dss/dispc.c:2392:21-22:
 WARNING opportunity for max()
Message-ID: <202610060856.DAXkynw7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chintan Patel <chintanlike@gmail.com>
CC: Helge Deller <deller@gmx.de>
CC: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c3418fffa9d037b2038a6db48be63f9e2291806
commit: bf9ec461a7d1b82bbc3fe110fba9e9533879849d fbdev: omapfb: Make FB_DEVICE dependency optional
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-r2104-20261005 (https://download.01.org/0day-ci/archive/20261006/202610060856.DAXkynw7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf9ec461a7d1 ("fbdev: omapfb: Make FB_DEVICE dependency optional")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610060856.DAXkynw7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/omap2/omapfb/dss/dispc.c:2392:21-22: WARNING opportunity for max()

vim +2392 drivers/video/fbdev/omap2/omapfb/dss/dispc.c

f76ee892a99e68b Tomi Valkeinen 2015-12-09  2368  
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2369  static int dispc_ovl_calc_scaling_44xx(unsigned long pclk, unsigned long lclk,
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2370  		const struct omap_video_timings *mgr_timings,
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2371  		u16 width, u16 height, u16 out_width, u16 out_height,
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2372  		enum omap_color_mode color_mode, bool *five_taps,
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2373  		int *x_predecim, int *y_predecim, int *decim_x, int *decim_y,
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2374  		u16 pos_x, unsigned long *core_clk, bool mem_to_mem)
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2375  {
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2376  	u16 in_width, in_width_max;
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2377  	int decim_x_min = *decim_x;
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2378  	u16 in_height = height / *decim_y;
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2379  	const int maxsinglelinewidth =
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2380  				dss_feat_get_param_max(FEAT_PARAM_LINEWIDTH);
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2381  	const int maxdownscale = dss_feat_get_param_max(FEAT_PARAM_DOWNSCALE);
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2382  
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2383  	if (mem_to_mem) {
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2384  		in_width_max = out_width * maxdownscale;
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2385  	} else {
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2386  		in_width_max = dispc_core_clk_rate() /
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2387  					DIV_ROUND_UP(pclk, out_width);
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2388  	}
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2389  
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2390  	*decim_x = DIV_ROUND_UP(width, in_width_max);
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2391  
f76ee892a99e68b Tomi Valkeinen 2015-12-09 @2392  	*decim_x = *decim_x > decim_x_min ? *decim_x : decim_x_min;
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2393  	if (*decim_x > *x_predecim)
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2394  		return -EINVAL;
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2395  
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2396  	do {
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2397  		in_width = width / *decim_x;
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2398  	} while (*decim_x <= *x_predecim &&
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2399  			in_width > maxsinglelinewidth && ++*decim_x);
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2400  
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2401  	if (in_width > maxsinglelinewidth) {
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2402  		DSSERR("Cannot scale width exceeds max line width");
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2403  		return -EINVAL;
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2404  	}
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2405  
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2406  	*core_clk = dispc.feat->calc_core_clk(pclk, in_width, in_height,
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2407  				out_width, out_height, mem_to_mem);
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2408  	return 0;
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2409  }
f76ee892a99e68b Tomi Valkeinen 2015-12-09  2410  

:::::: The code at line 2392 was first introduced by commit
:::::: f76ee892a99e68b55402b8d4b8aeffcae2aff34d omapfb: copy omapdss & displays for omapfb

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ti.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
