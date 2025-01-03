Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2B59B71
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 08:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735894719; cv=none; b=S5DVIzTKu8YkM6EnFR3JvWC3YFAZjrtJf1nq3NvMmv0WMxblfb13++Zxrs5gVV8XtnmK0HFNBiAhBgrD5RpL5xY8aTSi4BH0cxWNpGFDAcLlctQ7A2M/g+FvZg+QkRzWRn3zmTnGaIJm4a/So6Li8oaooS9dr8ho35GnhZ5HVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735894719; c=relaxed/simple;
	bh=T+rnxUUjv2za1GHd23w9lYOJNJqID0o6OKrjsZ23Juw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EH+/KDYSLAYT4QwbPB5PLZ/yCmLTaQEYa1JOXXGQA1Hu75x4uxgwgo1SW2WkgQVzGqajc8ak5pL0c2Ry5x4ZerQlZ1s+h6YIJUCGjo1kvWybo9UHoc+r7nWfFWTrBuC4NCdNtrZ6rLzk/ruWrK+BOdForsmqNpKerEw6oS+WUd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvbIOMf4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvbIOMf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735894717; x=1767430717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+rnxUUjv2za1GHd23w9lYOJNJqID0o6OKrjsZ23Juw=;
  b=XvbIOMf40EIew1iLXFEBM6M9TSngxOqh9ctjJXYFTmUn+hXIi6gPMa38
   7t8MPi8IxS1GtI/k97AOsSxJQNPPtKKLtL92ELsssRCv0PZvwSCAgNWhQ
   W+hd4euM3qBlVpmfXyFw2lkV8L10LgvQw2zWOM77rZ8eAw7o1q9Ui1upN
   9nK9acAPvjwsQniX/RCxw4pb6SwDQij4pV6wSq99nfB2Lno9kNocVTj0N
   ++5f47ykMBXfS5ve21htT/pKZ6Uv/jc/HcZeEux7sP/I1ZxuIAcHK+82m
   mSAbGQO/Jrs8zf1mE+zUjJBLfVctvW3ktIdOXvLvitWhmMuEQBczcip/B
   g==;
X-CSE-ConnectionGUID: TjJlldmTSvGEc/59LB+Ryw==
X-CSE-MsgGUID: h8Zubx9HTxKWyJqPMNYJ/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53687353"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="53687353"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 00:58:36 -0800
X-CSE-ConnectionGUID: Mwj+paENTa2J0zKnZO8pgw==
X-CSE-MsgGUID: b1pLWyadRtCqHVofz2qXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101537230"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jan 2025 00:58:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTdVp-0009U3-1Z;
	Fri, 03 Jan 2025 08:58:33 +0000
Date: Fri, 3 Jan 2025 16:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1693/1693]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c:1320
 dcn21_link_encoder_create() warn: possible memory leak of 'enc21'
Message-ID: <202501031656.Si294le5-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Bowen You <youbowen2@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   92381e91108f99289464dbb6fbe45ffc4d6d037b
commit: ccf7fa56eb24845c661db94e85cbf500c9f56f6d [1693/1693] drm/amd/display: Fix out-of-bounds access in 'dcn21_link_encoder_create'
:::::: branch date: 6 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031656.Si294le5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501031656.Si294le5-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c:1320 dcn21_link_encoder_create() warn: possible memory leak of 'enc21'

vim +/enc21 +1320 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c

bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1310  
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1311  static struct link_encoder *dcn21_link_encoder_create(
e216431b63aef8 Aurabindo Pillai       2022-04-01  1312  	struct dc_context *ctx,
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1313  	const struct encoder_init_data *enc_init_data)
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1314  {
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1315  	struct dcn21_link_encoder *enc21 =
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1316  		kzalloc(sizeof(struct dcn21_link_encoder), GFP_KERNEL);
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1317  	int link_regs_id;
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1318  
ccf7fa56eb2484 Srinivasan Shanmugam   2024-12-30  1319  	if (!enc21 || enc_init_data->hpd_source >= ARRAY_SIZE(link_enc_hpd_regs))
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02 @1320  		return NULL;
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1321  
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1322  	link_regs_id =
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1323  		map_transmitter_id_to_phy_instance(enc_init_data->transmitter);
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1324  
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1325  	dcn21_link_encoder_construct(enc21,
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1326  				      enc_init_data,
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1327  				      &link_enc_feature,
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1328  				      &link_enc_regs[link_regs_id],
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1329  				      &link_enc_aux_regs[enc_init_data->channel - 1],
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1330  				      &link_enc_hpd_regs[enc_init_data->hpd_source],
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1331  				      &le_shift,
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1332  				      &le_mask);
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1333  
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1334  	return &enc21->enc10.base;
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1335  }
904fb6e0f4e815 Anthony Koo            2020-03-28  1336  

:::::: The code at line 1320 was first introduced by commit
:::::: 91c665bdc1d54f19506bd106578ad7cb945c55e2 drm/amd/display: create dcn21_link_encoder files

:::::: TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
