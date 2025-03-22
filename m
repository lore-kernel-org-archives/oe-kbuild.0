Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BDC1C84C4
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 22:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742681760; cv=none; b=BtlnwcXhNC6qsVOY3gYRTmDUQOJ4Dl6+b94oQlZVmY52oYcpb1WjTmjjKxnw+2CPU9+4XLIbB6LMtG61RS4EPch2zr3La3Qb+uQuDmKfp3yQ+XE1TbBLd9yxFN60h6mFHPN3P8sgzt5LFu2pCAuJk9A/R/qUiUcAFh1h397Gfgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742681760; c=relaxed/simple;
	bh=o4yuR55QZqxr9RO6gSxeIOAmPh3myi6c5gu2zFlsxsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k2qNWhUvgrw+HZjSeo30sLHlyxALqa0sn3iBzuQ0O2/e5P0JD8oLgVx0eraW4OjF9jBqpupsdGdNF8NqHk0i8rBCI448xc4a+DPY5PyYTHlnp9LUl0po3DpfNIag/Kwn3Q+SNOVZSPzKE8x0G6fkBQSPZy8nMc97oeqbrTO/75M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAqs3IV5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAqs3IV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742681759; x=1774217759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4yuR55QZqxr9RO6gSxeIOAmPh3myi6c5gu2zFlsxsk=;
  b=nAqs3IV5+vWOR3n8eESL+U4mj5OcB2hfKyjXMYDLmxYHX04pBGnWUeJY
   cU1s6BdkBrnuA9UTuiM7wtAl3og4gDkv2Hu/QUewr2iefFKoaOn3v3dVq
   orH5cBqHdueSMN/kNG3Fl3cCMVsSaliz8S5Hm/Q2XU5CEnMq/DcMCBTe9
   LH4W5sG2q4QFpzP41of16zS7/q9vbY0YN8B6zVwmP/paSbIZEQDmYbrcy
   uDngEwybjHN5XrbCSNErh1sBihFGobbLM+rfJFF5ryOHHthKw31xnQfA8
   apB/vtJ4+4sUapZWoGLMpabFivK04eApDfcpdQaDUIOesw2If3UtsZu3S
   g==;
X-CSE-ConnectionGUID: MWS6m39ZRkyvnmB6no2xMg==
X-CSE-MsgGUID: d+jzw8gwQauuoNCLn+UG0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="61439234"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="61439234"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 15:15:58 -0700
X-CSE-ConnectionGUID: QfBROB/ZTuWEYuxUDiUiiw==
X-CSE-MsgGUID: TZ7jK1KEQMC3++NbyTx+8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="124157522"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2025 15:15:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw78E-0002Qf-1t;
	Sat, 22 Mar 2025 22:15:54 +0000
Date: Sun, 23 Mar 2025 06:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c:110:2-12: second lock on
 line 110
Message-ID: <202503230626.MAJvTz11-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Lijo Lazar <lijo.lazar@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Feifei Xu <feifxu@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88d324e69ea9f3ae1c1905ea75d717c08bdb8e15
commit: 1e4acf4d93cdc3ffae1b835e304a3f491e4d363e drm/amdgpu: Add reset on init handler for XGMI
date:   6 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r064-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230626.MAJvTz11-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503230626.MAJvTz11-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c:110:2-12: second lock on line 110

vim +110 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c

1e4acf4d93cdc3 Lijo Lazar 2024-08-21   97  
1e4acf4d93cdc3 Lijo Lazar 2024-08-21   98  static int amdgpu_reset_xgmi_reset_on_init_perform_reset(
1e4acf4d93cdc3 Lijo Lazar 2024-08-21   99  	struct amdgpu_reset_control *reset_ctl,
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  100  	struct amdgpu_reset_context *reset_context)
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  101  {
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  102  	struct amdgpu_device *adev = (struct amdgpu_device *)reset_ctl->handle;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  103  	struct list_head *reset_device_list = reset_context->reset_device_list;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  104  	struct amdgpu_device *tmp_adev = NULL;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  105  	int r;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  106  
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  107  	dev_dbg(adev->dev, "xgmi roi - hw reset\n");
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  108  
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  109  	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
1e4acf4d93cdc3 Lijo Lazar 2024-08-21 @110  		mutex_lock(&tmp_adev->reset_cntl->reset_lock);
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  111  		tmp_adev->reset_cntl->active_reset =
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  112  			amdgpu_asic_reset_method(adev);
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  113  	}
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  114  	r = 0;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  115  	/* Mode1 reset needs to be triggered on all devices together */
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  116  	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  117  		/* For XGMI run all resets in parallel to speed up the process */
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  118  		if (!queue_work(system_unbound_wq, &tmp_adev->xgmi_reset_work))
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  119  			r = -EALREADY;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  120  		if (r) {
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  121  			dev_err(tmp_adev->dev,
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  122  				"xgmi reset on init: reset failed with error, %d",
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  123  				r);
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  124  			break;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  125  		}
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  126  	}
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  127  
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  128  	/* For XGMI wait for all resets to complete before proceed */
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  129  	if (!r) {
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  130  		list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  131  			flush_work(&tmp_adev->xgmi_reset_work);
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  132  			r = tmp_adev->asic_reset_res;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  133  			if (r)
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  134  				break;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  135  		}
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  136  	}
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  137  
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  138  	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  139  		mutex_unlock(&tmp_adev->reset_cntl->reset_lock);
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  140  		tmp_adev->reset_cntl->active_reset = AMD_RESET_METHOD_NONE;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  141  	}
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  142  
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  143  	return r;
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  144  }
1e4acf4d93cdc3 Lijo Lazar 2024-08-21  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
