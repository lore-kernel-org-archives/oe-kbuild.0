Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED56CDD4
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711462975; cv=none; b=Ok/PuGV9L8RGdhpPMyYrvcK+qDsdqzaqF+FQO+bP3NdKu6hD10DgiaI31Mgh8eWKuZDHYwqouX/23DDYx2HPvAzrx7OjEWcnzjJaPjOYYGPOwWd4PIJTJglZOP4U2YMZkG0ITeqEkm5OpHTZiIAuuYEiYgOeuLqQSHuETu8u/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711462975; c=relaxed/simple;
	bh=7V4cO8/NNxpsu43kb2C/LWLSrsriCHFgbJiw/Ry9hL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rx7ELvP/quVOp2PlYWlsvmNvtoiE7b6ix7N7e8LmT01JwNIzgHAPf3bO7tiBTSruS3zzCHuKtBMWp50/lwLJEXPP9//NTDT5vzxk2BxqAcf0dzrWa1b0zjn8D2lfOaRvjKmkuSR885p6mTILzO9hGCjis1ugEwGK5XWqPXuL3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjwXqrI2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjwXqrI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711462971; x=1742998971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7V4cO8/NNxpsu43kb2C/LWLSrsriCHFgbJiw/Ry9hL4=;
  b=mjwXqrI2SkRDcgdF2Y2n+USE/NlcP77TUQCn5fKpIWnCeefjlAziPi5x
   3q5MhWYTt4uFngs/2/5mxIV/h6TSyut7BH3Cs7dzZEpsvVEBGotf8Kb2g
   QAQF1qvWXh6IZ24P5Wj7soUTORCva23LY/zkHMJhgkFPESVD9z7SVEB55
   /pmQITokvaopewhvX8EOd/UegzY1WelQ6McAJopESEbLjAqfh1TY7oNEE
   rMwzMTSloUE6GVNt0jfRRofKpLnvp33af9NUABA9cOu/pJ3+93nygeCFv
   2Ui5HhAXttHHiGK49/6uPbZ7gR+XYKCOGvtDf+VyBsCrZQhrkAuJ+mR7c
   g==;
X-CSE-ConnectionGUID: a1emJN+oShSIb9JmmpLF8w==
X-CSE-MsgGUID: VuNVnQX8T1+gT5PqHpvldg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="9480822"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="9480822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 07:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="16024211"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Mar 2024 07:22:48 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp7hO-00007g-2U;
	Tue, 26 Mar 2024 14:22:46 +0000
Date: Tue, 26 Mar 2024 22:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 877/1756]
 drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c:400:42-43: WARNING
 opportunity for min()
Message-ID: <202403262220.Yr3uI0dQ-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Revalla Hari Krishna <harikrishna.revalla@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Martin Leung <martin.leung@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   084c8e315db34b59d38d06e684b1a0dd07d30287
commit: 88867807564e28409d8220419da7559364109a2a [877/1756] drm/amd/display: Refactor DPP into a component directory
:::::: branch date: 9 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-102-20240326 (https://download.01.org/0day-ci/archive/20240326/202403262220.Yr3uI0dQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403262220.Yr3uI0dQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c:400:42-43: WARNING opportunity for min()
   drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c:402:46-47: WARNING opportunity for min()
--
>> drivers/gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.c:269:42-43: WARNING opportunity for min()
   drivers/gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.c:271:46-47: WARNING opportunity for min()
--
>> drivers/gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.c:43:42-43: WARNING opportunity for min()
   drivers/gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.c:45:46-47: WARNING opportunity for min()

vim +400 drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c

5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  390  
dd93752b648309 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-10-10  391  void dpp1_dscl_calc_lb_num_partitions(
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  392  		const struct scaler_data *scl_data,
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  393  		enum lb_memory_config lb_config,
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  394  		int *num_part_y,
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  395  		int *num_part_c)
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  396  {
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  397  	int lb_memory_size, lb_memory_size_c, lb_memory_size_a, num_partitions_a,
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  398  	lb_bpc, memory_line_size_y, memory_line_size_c, memory_line_size_a;
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  399  
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15 @400  	int line_size = scl_data->viewport.width < scl_data->recout.width ?
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  401  			scl_data->viewport.width : scl_data->recout.width;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  402  	int line_size_c = scl_data->viewport_c.width < scl_data->recout.width ?
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  403  			scl_data->viewport_c.width : scl_data->recout.width;
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  404  
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  405  	if (line_size == 0)
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  406  		line_size = 1;
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  407  
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  408  	if (line_size_c == 0)
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  409  		line_size_c = 1;
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  410  
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  411  
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  412  	lb_bpc = dpp1_dscl_get_lb_depth_bpc(scl_data->lb_params.depth);
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  413  	memory_line_size_y = (line_size * lb_bpc + 71) / 72; /* +71 to ceil */
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  414  	memory_line_size_c = (line_size_c * lb_bpc + 71) / 72; /* +71 to ceil */
59979bf8be1784 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Murton Liu     2019-02-15  415  	memory_line_size_a = (line_size + 5) / 6; /* +5 to ceil */
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  416  
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  417  	if (lb_config == LB_MEMORY_CONFIG_1) {
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  418  		lb_memory_size = 816;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  419  		lb_memory_size_c = 816;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  420  		lb_memory_size_a = 984;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  421  	} else if (lb_config == LB_MEMORY_CONFIG_2) {
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  422  		lb_memory_size = 1088;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  423  		lb_memory_size_c = 1088;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  424  		lb_memory_size_a = 1312;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  425  	} else if (lb_config == LB_MEMORY_CONFIG_3) {
734a092b1fe407 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Eric Bernstein 2017-09-29  426  		/* 420 mode: using 3rd mem from Y, Cr and Cb */
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  427  		lb_memory_size = 816 + 1088 + 848 + 848 + 848;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  428  		lb_memory_size_c = 816 + 1088;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  429  		lb_memory_size_a = 984 + 1312 + 456;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  430  	} else {
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  431  		lb_memory_size = 816 + 1088 + 848;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  432  		lb_memory_size_c = 816 + 1088 + 848;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  433  		lb_memory_size_a = 984 + 1312 + 456;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  434  	}
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  435  	*num_part_y = lb_memory_size / memory_line_size_y;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  436  	*num_part_c = lb_memory_size_c / memory_line_size_c;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  437  	num_partitions_a = lb_memory_size_a / memory_line_size_a;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  438  
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  439  	if (scl_data->lb_params.alpha_en
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  440  			&& (num_partitions_a < *num_part_y))
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  441  		*num_part_y = num_partitions_a;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  442  
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  443  	if (*num_part_y > 64)
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  444  		*num_part_y = 64;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  445  	if (*num_part_c > 64)
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  446  		*num_part_c = 64;
5e9a81b2c46555 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c Yue Hin Lau    2017-08-15  447  

:::::: The code at line 400 was first introduced by commit
:::::: 5e9a81b2c465557adbaeef7231834e3ab40e4102 drm/amd/display: separate scl functions out from dcn10_dpp

:::::: TO: Yue Hin Lau <Yuehin.Lau@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
