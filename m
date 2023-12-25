Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0697F3
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Dec 2023 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EumkW449"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703521874; x=1735057874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wbwpgxyq3jN1NF/bdKlcy6xxoNiDHeC4vOPAK6L5UfU=;
  b=EumkW4490+GL+qQj5bdalYyYdUKFSGydczG7hT4jtC/hL+crovsSW3LG
   u7FdfeAvCpIOlwt9sO//FlQZfoaQ0gNz9aFvUyeWLnBpI+h/2NymOntyp
   01j4bvxWGAO6w1U63CZlk/NZC8AISjg7eBywmQGd7emc+07rb7OHj/5fH
   2Voyn+VvrNf+jJr0x3CXegtqwlitLA0L5ITCn3gDtAIXhj8z2Kr+PzwoK
   x5EJbg4WbrZXRQzauDJG9MQBvfrORBT5uGCBZAfWjOhDGPSgwLBsBClV9
   lhkhj89yldTOwYSrb2lNkePFfyaT1ndP+1+OpmbIGPHDah5akZQF/Or8g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="393454964"
X-IronPort-AV: E=Sophos;i="6.04,303,1695711600"; 
   d="scan'208";a="393454964"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 08:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="843690427"
X-IronPort-AV: E=Sophos;i="6.04,303,1695711600"; 
   d="scan'208";a="843690427"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Dec 2023 08:31:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHnrC-000DTn-10;
	Mon, 25 Dec 2023 16:31:10 +0000
Date: Tue, 26 Dec 2023 00:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c:220:21-22:
 WARNING opportunity for max()
Message-ID: <202312260025.3KcJ7K0e-lkp@intel.com>
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
TO: Wenjing Liu <wenjing.liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: George Shen <George.Shen@amd.com>
CC: Jun Lei <Jun.Lei@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   861deac3b092f37b2c5e6871732f3e11486f7082
commit: bc33f5e5f05ba44e48909e2cfc5a97475ec69a4d drm/amd/display: create accessories, hwss and protocols sub folders in link
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-r062-20231222 (https://download.01.org/0day-ci/archive/20231226/202312260025.3KcJ7K0e-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312260025.3KcJ7K0e-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c:220:21-22: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c:227:21-22: WARNING opportunity for max()

vim +220 drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c

4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  204  
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  205  static uint32_t defer_delay_converter_wa(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  206  	struct ddc_service *ddc,
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  207  	uint32_t defer_delay)
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  208  {
d0778ebfd58f56 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-07-22  209  	struct dc_link *link = ddc->link;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  210  
fd952d436446cf drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Taimur Hassan  2021-01-15  211  	if (link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_VGA_CONVERTER &&
fd952d436446cf drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Taimur Hassan  2021-01-15  212  		link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_0080E1 &&
10a9accd4842e6 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Ilya           2022-02-10  213  		(link->dpcd_caps.branch_fw_revision[0] < 0x01 ||
10a9accd4842e6 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Ilya           2022-02-10  214  				(link->dpcd_caps.branch_fw_revision[0] == 0x01 &&
10a9accd4842e6 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Ilya           2022-02-10  215  				link->dpcd_caps.branch_fw_revision[1] < 0x40)) &&
fd952d436446cf drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Taimur Hassan  2021-01-15  216  		!memcmp(link->dpcd_caps.branch_dev_name,
fd952d436446cf drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Taimur Hassan  2021-01-15  217  		    DP_VGA_DONGLE_BRANCH_DEV_NAME,
fd952d436446cf drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Taimur Hassan  2021-01-15  218  			sizeof(link->dpcd_caps.branch_dev_name)))
fd952d436446cf drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Taimur Hassan  2021-01-15  219  
fd952d436446cf drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Taimur Hassan  2021-01-15 @220  		return defer_delay > DPVGA_DONGLE_AUX_DEFER_WA_DELAY ?
fd952d436446cf drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Taimur Hassan  2021-01-15  221  			defer_delay : DPVGA_DONGLE_AUX_DEFER_WA_DELAY;
fd952d436446cf drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Taimur Hassan  2021-01-15  222  
df3b7e32ed459a drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Qingqing Zhuo  2019-07-31  223  	if (link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_0080E1 &&
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  224  	    !memcmp(link->dpcd_caps.branch_dev_name,
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  225  		    DP_DVI_CONVERTER_ID_4,
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  226  		    sizeof(link->dpcd_caps.branch_dev_name)))
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  227  		return defer_delay > I2C_OVER_AUX_DEFER_WA_DELAY ?
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  228  			defer_delay : I2C_OVER_AUX_DEFER_WA_DELAY;
7154a51b534707 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c jinlong zhang  2020-09-25  229  	if (link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_006037 &&
7154a51b534707 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c jinlong zhang  2020-09-25  230  	    !memcmp(link->dpcd_caps.branch_dev_name,
7154a51b534707 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c jinlong zhang  2020-09-25  231  		    DP_DVI_CONVERTER_ID_5,
7154a51b534707 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c jinlong zhang  2020-09-25  232  		    sizeof(link->dpcd_caps.branch_dev_name)))
7154a51b534707 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c jinlong zhang  2020-09-25  233  		return defer_delay > I2C_OVER_AUX_DEFER_WA_DELAY_1MS ?
7154a51b534707 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c jinlong zhang  2020-09-25  234  			I2C_OVER_AUX_DEFER_WA_DELAY_1MS : defer_delay;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  235  
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  236  	return defer_delay;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  237  }
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c Harry Wentland 2017-09-12  238  

:::::: The code at line 220 was first introduced by commit
:::::: fd952d436446cffdf97a61bf456a0987011e42e0 drm/amd/display: Workaround for some legacy DP-VGA dongles

:::::: TO: Taimur Hassan <syed.hassan@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
