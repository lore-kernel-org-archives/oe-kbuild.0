Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E9D51DDE3
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 19:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758661; cv=none; b=dDSuAHmRBhLW467gEEw3YoBHaUjHQRMv0bJ0YtLJRnl4XqB5fN9kSnqdy0jd7u6Jx9EK4kHdlarOb0S+8vPKx3mxg79ylabUkm5N6U3bE6Wmx1gNdeov5ewDnOXomEUx6HmskXOUin2ZTHGgI17AJQFjy13BdjjJ+1/T1qPAvPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758661; c=relaxed/simple;
	bh=Qk9bgqp9oJ4mcdCdSCxUC5YOctgP6JTibT5Vkzx4suE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sqxVqz2d+bn9URdKtGSGHTOm+MK3C/3DAnJCWzZapPFshzw+K4s654dpIq5rWlsbv3w2q66VqVcV+lK9vPb4s9yNAKGvUt14y+3ONpPzsRVrngJy8CvNBytzv6wFgxYxYNs1Bc4UzLNtAKSaRT9UUFWdd9RvAN78xJ3IbTv8Jro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wwl2yiu2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wwl2yiu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789758658; x=1821294658;
  h=date:from:to:cc:subject:message-id;
  bh=Qk9bgqp9oJ4mcdCdSCxUC5YOctgP6JTibT5Vkzx4suE=;
  b=Wwl2yiu2o/gVbOEMDBhPA33CWXAAd7XIFeHGFkGSDqrNpp06z5ZJ4aB0
   3aJppP4AT/iQUSgYVgSq5aXF/uiw9MStzuWbEKFZkZihjqz9RFK6Ed9Hv
   Z2uzM5QrVVV7QGgJN1mVOZy2ey88sLlZPmvOXBNZ42iF5fcfxEwe8InxN
   SrWdNwcL6XJ01PdN9webk7cQHjFS+2bwgk5F5JFt6ESOPYIbjzZtK4Xuu
   D5MhiRH8d6RPkLVo5wmhlCawpbcz7Q/8cgmN0tpqoG7zOE/S45TJxy9hN
   2zR6QTf3BZGPqmZI/aPywueYpG9ChiWYgmJEdnhli8djJtMkuUcuZNlyg
   A==;
X-CSE-ConnectionGUID: 8RSFFrkmRW6lWS6gAoS9Tw==
X-CSE-MsgGUID: jZCvVPBdQpabWNCxjK5NYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="115818292"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="115818292"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 12:10:55 -0700
X-CSE-ConnectionGUID: q9JpmTXxSoulqiYZmghI7A==
X-CSE-MsgGUID: JGjVNzGZTRejiwU5uCZCvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="297988430"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Sep 2026 12:10:54 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7dyy-000000001Aq-09Qz;
	Fri, 18 Sep 2026 19:10:48 +0000
Date: Fri, 18 Sep 2026 21:10:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: 
 drivers/gpu/drm/amd/display/dc/dml/dml1_frl_cap_chk.c:506:20-21: WARNING
 opportunity for max()
Message-ID: <202609182154.UmmPbidt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Harry Wentland <harry.wentland@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Fangzhi Zuo <Jerry.Zuo@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5dd1818b15d98d4a20806cd00b1b40320b06004f
commit: a7c7b927c8304a2d3bf18f744e3f265e3b8127ba drm/amd/display: Add DML changes to support HDMI FRL
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260918/202609182154.UmmPbidt-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a7c7b927c830 ("drm/amd/display: Add DML changes to support HDMI FRL")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609182154.UmmPbidt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/dml/dml1_frl_cap_chk.c:506:20-21: WARNING opportunity for max()

vim +506 drivers/gpu/drm/amd/display/dc/dml/dml1_frl_cap_chk.c

a7c7b927c8304a Harry Wentland 2026-04-24  445  
a7c7b927c8304a Harry Wentland 2026-04-24  446  static double calculate_compressed_active_time(uint32_t h_active,
a7c7b927c8304a Harry Wentland 2026-04-24  447  	const uint32_t h_blank,
a7c7b927c8304a Harry Wentland 2026-04-24  448  	const int hc_active,
a7c7b927c8304a Harry Wentland 2026-04-24  449  	const int hc_blank,
a7c7b927c8304a Harry Wentland 2026-04-24  450  	const uint32_t frl_num_lanes,
a7c7b927c8304a Harry Wentland 2026-04-24  451  	const double pix_clk,
a7c7b927c8304a Harry Wentland 2026-04-24  452  	const int frl_link_rate)
a7c7b927c8304a Harry Wentland 2026-04-24  453  {
a7c7b927c8304a Harry Wentland 2026-04-24  454  	double f_tb_average;
a7c7b927c8304a Harry Wentland 2026-04-24  455  	double r_bit_nominal;
a7c7b927c8304a Harry Wentland 2026-04-24  456  	double r_bit_min;
a7c7b927c8304a Harry Wentland 2026-04-24  457  	double r_frl_char_min;
a7c7b927c8304a Harry Wentland 2026-04-24  458  	double t_active_est_1;
a7c7b927c8304a Harry Wentland 2026-04-24  459  	double t_active_est_2;
a7c7b927c8304a Harry Wentland 2026-04-24  460  	double t_active_target;
a7c7b927c8304a Harry Wentland 2026-04-24  461  	int c_frl_sb = 510;
a7c7b927c8304a Harry Wentland 2026-04-24  462  	int frl_bit_tolerance = 300;
a7c7b927c8304a Harry Wentland 2026-04-24  463  	double overhead_m = 0.003;
a7c7b927c8304a Harry Wentland 2026-04-24  464  	double overhead_sb;
a7c7b927c8304a Harry Wentland 2026-04-24  465  	double overhead_rs;
a7c7b927c8304a Harry Wentland 2026-04-24  466  	double overhead_map;
a7c7b927c8304a Harry Wentland 2026-04-24  467  	double overhead_min;
a7c7b927c8304a Harry Wentland 2026-04-24  468  	double overhead_max;
a7c7b927c8304a Harry Wentland 2026-04-24  469  
a7c7b927c8304a Harry Wentland 2026-04-24  470  	switch (frl_link_rate) {
a7c7b927c8304a Harry Wentland 2026-04-24  471  	case FRL_LINK_RATE_3GBPS:
a7c7b927c8304a Harry Wentland 2026-04-24  472  		r_bit_nominal = 3.0e9;
a7c7b927c8304a Harry Wentland 2026-04-24  473  		break;
a7c7b927c8304a Harry Wentland 2026-04-24  474  	case FRL_LINK_RATE_6GBPS:
a7c7b927c8304a Harry Wentland 2026-04-24  475  	case FRL_LINK_RATE_6GBPS_4LANE:
a7c7b927c8304a Harry Wentland 2026-04-24  476  		r_bit_nominal = 6.0e9;
a7c7b927c8304a Harry Wentland 2026-04-24  477  		break;
a7c7b927c8304a Harry Wentland 2026-04-24  478  	case FRL_LINK_RATE_8GBPS:
a7c7b927c8304a Harry Wentland 2026-04-24  479  		r_bit_nominal = 8.0e9;
a7c7b927c8304a Harry Wentland 2026-04-24  480  		break;
a7c7b927c8304a Harry Wentland 2026-04-24  481  	case FRL_LINK_RATE_10GBPS:
a7c7b927c8304a Harry Wentland 2026-04-24  482  	default:
a7c7b927c8304a Harry Wentland 2026-04-24  483  		r_bit_nominal = 10.0e9;
a7c7b927c8304a Harry Wentland 2026-04-24  484  		break;
a7c7b927c8304a Harry Wentland 2026-04-24  485  	case FRL_LINK_RATE_12GBPS:
a7c7b927c8304a Harry Wentland 2026-04-24  486  		r_bit_nominal = 12.0e9;
a7c7b927c8304a Harry Wentland 2026-04-24  487  		break;
a7c7b927c8304a Harry Wentland 2026-04-24  488  	}
a7c7b927c8304a Harry Wentland 2026-04-24  489  
a7c7b927c8304a Harry Wentland 2026-04-24  490  	f_tb_average = pix_clk / (h_active + h_blank)
a7c7b927c8304a Harry Wentland 2026-04-24  491  					* (hc_active + hc_blank);
a7c7b927c8304a Harry Wentland 2026-04-24  492  
a7c7b927c8304a Harry Wentland 2026-04-24  493  	c_frl_sb = 4 * c_frl_sb + frl_num_lanes;
a7c7b927c8304a Harry Wentland 2026-04-24  494  	overhead_sb = (double)frl_num_lanes / c_frl_sb;
a7c7b927c8304a Harry Wentland 2026-04-24  495  	overhead_rs = 8.0 * 4.0 / c_frl_sb;
a7c7b927c8304a Harry Wentland 2026-04-24  496  	overhead_map = 2.5 / c_frl_sb;
a7c7b927c8304a Harry Wentland 2026-04-24  497  	overhead_min = overhead_sb + overhead_rs + overhead_map;
a7c7b927c8304a Harry Wentland 2026-04-24  498  	overhead_max = overhead_min + overhead_m;
a7c7b927c8304a Harry Wentland 2026-04-24  499  
a7c7b927c8304a Harry Wentland 2026-04-24  500  	r_bit_min = r_bit_nominal * (1.0 - frl_bit_tolerance / 1000000.0);
a7c7b927c8304a Harry Wentland 2026-04-24  501  	r_frl_char_min = r_bit_min / 18.0;
a7c7b927c8304a Harry Wentland 2026-04-24  502  	t_active_est_1 = hc_active / f_tb_average;
a7c7b927c8304a Harry Wentland 2026-04-24  503  	t_active_est_2 = (3.0 / 2.0 * hc_active) /
a7c7b927c8304a Harry Wentland 2026-04-24  504  				  (frl_num_lanes * r_frl_char_min * (1.0 - overhead_max));
a7c7b927c8304a Harry Wentland 2026-04-24  505  
a7c7b927c8304a Harry Wentland 2026-04-24 @506  	if (t_active_est_1 > t_active_est_2) {
a7c7b927c8304a Harry Wentland 2026-04-24  507  		t_active_target = t_active_est_1;
a7c7b927c8304a Harry Wentland 2026-04-24  508  	} else {
a7c7b927c8304a Harry Wentland 2026-04-24  509  		t_active_target = t_active_est_2;
a7c7b927c8304a Harry Wentland 2026-04-24  510  	}
a7c7b927c8304a Harry Wentland 2026-04-24  511  
a7c7b927c8304a Harry Wentland 2026-04-24  512  	return t_active_target;
a7c7b927c8304a Harry Wentland 2026-04-24  513  }
a7c7b927c8304a Harry Wentland 2026-04-24  514  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
