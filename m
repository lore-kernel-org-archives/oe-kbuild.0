Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A812320C
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbPBUN9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701596279; x=1733132279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GhLMMb6QWl+jOJeeu2FVYFNWODsqE6qh5Pd/VPybpEE=;
  b=SbPBUN9kuJ77j1Z8NTbwWHpLhbcYxSDeUAsyjGgSFexPvl1vw4CZ/DQ3
   5aExS1TtlmIr5IeoUgwe/HL6VBI3WTmN44gfooQoCaSPzlTLdj/rbaYzo
   AqJmV8NcI8kWkDjnZaMfGiKn+OtEws2+Ns79DafU1NbdKe+OS6rvJ5Z9Y
   b7oduZunzkbzK5Y+Lyj3x7LXWF5i48iaHu8XjnMXyHimP/C4JR3AxmEOo
   9+QJ5BG6xTA6weNQsA3w3d1hucQ6pe68tdUBY5tGSI6MYnHps3sZ+5IJQ
   ElTinWzX82UZcSZgCJ0ZEGTLtjDhJtTriYUspqQ5NthnywT49RaasJy0o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="397521552"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="397521552"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 01:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="943588100"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="943588100"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Dec 2023 01:37:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9ivB-0006V4-04;
	Sun, 03 Dec 2023 09:37:53 +0000
Date: Sun, 3 Dec 2023 17:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:809:67:
 sparse: sparse: dubious: x | !y
Message-ID: <202312031730.bvZ6Wosw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:809:67: sparse: sparse: dubious: x | !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Francis <David.Francis@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Tony Cheng <Tony.Cheng@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: c85e6e546edd7e362693218a33a6f63217802fd3 drm/amd/display: Create new i2c resource
date:   5 years ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-121-20231101 (https://download.01.org/0day-ci/archive/20231203/202312031730.bvZ6Wosw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231203/202312031730.bvZ6Wosw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312031730.bvZ6Wosw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:89:6: sparse: sparse: symbol 'dce_i2c_hw_engine_acquire_engine' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:113:6: sparse: sparse: symbol 'dce_i2c_engine_acquire_hw' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:301:35: sparse: sparse: symbol 'dce_i2c_hw_engine_wait_on_operation_result' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:369:10: sparse: sparse: symbol 'get_reference_clock' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:677:6: sparse: sparse: symbol 'dce_i2c_hw_engine_submit_request' was not declared. Should it be static?
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:809:67: sparse: sparse: dubious: x | !y
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:89:6: warning: no previous prototype for 'dce_i2c_hw_engine_acquire_engine' [-Wmissing-prototypes]
      89 | bool dce_i2c_hw_engine_acquire_engine(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:113:6: warning: no previous prototype for 'dce_i2c_engine_acquire_hw' [-Wmissing-prototypes]
     113 | bool dce_i2c_engine_acquire_hw(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:301:35: warning: no previous prototype for 'dce_i2c_hw_engine_wait_on_operation_result' [-Wmissing-prototypes]
     301 | enum i2c_channel_operation_result dce_i2c_hw_engine_wait_on_operation_result(
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:369:10: warning: no previous prototype for 'get_reference_clock' [-Wmissing-prototypes]
     369 | uint32_t get_reference_clock(
         |          ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:677:6: warning: no previous prototype for 'dce_i2c_hw_engine_submit_request' [-Wmissing-prototypes]
     677 | bool dce_i2c_hw_engine_submit_request(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:120:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:118:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     118 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:116:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     116 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.o: warning: objtool: acquire_i2c_hw_engine()+0x4f: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.o: warning: objtool: dce_i2c_submit_command_hw()+0x1f1: sibling call from callable instruction with modified stack frame
--
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:73:35: sparse: sparse: symbol 'dce_i2c_sw_engine_get_channel_status' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:371:6: sparse: sparse: symbol 'dce_i2c_sw_engine_set_speed' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:385:6: sparse: sparse: symbol 'dce_i2c_sw_engine_acquire_engine' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:401:6: sparse: sparse: symbol 'dce_i2c_engine_acquire_sw' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:429:6: sparse: sparse: symbol 'dce_i2c_sw_engine_submit_channel_request' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:472:6: sparse: sparse: symbol 'dce_i2c_sw_engine_submit_request' was not declared. Should it be static?
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:566:67: sparse: sparse: dubious: x | !y
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:73:35: warning: no previous prototype for 'dce_i2c_sw_engine_get_channel_status' [-Wmissing-prototypes]
      73 | enum i2c_channel_operation_result dce_i2c_sw_engine_get_channel_status(
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:371:6: warning: no previous prototype for 'dce_i2c_sw_engine_set_speed' [-Wmissing-prototypes]
     371 | void dce_i2c_sw_engine_set_speed(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:385:6: warning: no previous prototype for 'dce_i2c_sw_engine_acquire_engine' [-Wmissing-prototypes]
     385 | bool dce_i2c_sw_engine_acquire_engine(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:401:6: warning: no previous prototype for 'dce_i2c_engine_acquire_sw' [-Wmissing-prototypes]
     401 | bool dce_i2c_engine_acquire_sw(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:429:6: warning: no previous prototype for 'dce_i2c_sw_engine_submit_channel_request' [-Wmissing-prototypes]
     429 | void dce_i2c_sw_engine_submit_channel_request(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:472:6: warning: no previous prototype for 'dce_i2c_sw_engine_submit_request' [-Wmissing-prototypes]
     472 | bool dce_i2c_sw_engine_submit_request(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:120:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:118:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     118 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:116:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     116 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o: warning: objtool: wait_for_scl_high_sw.constprop.0()+0x60: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o: warning: objtool: dce_i2c_submit_command_sw()+0x190: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o: warning: objtool: dce_i2c_acquire_i2c_sw_engine()+0x47: sibling call from callable instruction with modified stack frame

vim +809 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c

c85e6e546edd7e David Francis 2018-07-23  782  
c85e6e546edd7e David Francis 2018-07-23  783  bool dce_i2c_submit_command_hw(
c85e6e546edd7e David Francis 2018-07-23  784  	struct resource_pool *pool,
c85e6e546edd7e David Francis 2018-07-23  785  	struct ddc *ddc,
c85e6e546edd7e David Francis 2018-07-23  786  	struct i2c_command *cmd,
c85e6e546edd7e David Francis 2018-07-23  787  	struct dce_i2c_hw *dce_i2c_hw)
c85e6e546edd7e David Francis 2018-07-23  788  {
c85e6e546edd7e David Francis 2018-07-23  789  	uint8_t index_of_payload = 0;
c85e6e546edd7e David Francis 2018-07-23  790  	bool result;
c85e6e546edd7e David Francis 2018-07-23  791  
c85e6e546edd7e David Francis 2018-07-23  792  	dce_i2c_hw->funcs->set_speed(dce_i2c_hw, cmd->speed);
c85e6e546edd7e David Francis 2018-07-23  793  
c85e6e546edd7e David Francis 2018-07-23  794  	result = true;
c85e6e546edd7e David Francis 2018-07-23  795  
c85e6e546edd7e David Francis 2018-07-23  796  	while (index_of_payload < cmd->number_of_payloads) {
c85e6e546edd7e David Francis 2018-07-23  797  		bool mot = (index_of_payload != cmd->number_of_payloads - 1);
c85e6e546edd7e David Francis 2018-07-23  798  
c85e6e546edd7e David Francis 2018-07-23  799  		struct i2c_payload *payload = cmd->payloads + index_of_payload;
c85e6e546edd7e David Francis 2018-07-23  800  
c85e6e546edd7e David Francis 2018-07-23  801  		struct dce_i2c_transaction_request request = { 0 };
c85e6e546edd7e David Francis 2018-07-23  802  
c85e6e546edd7e David Francis 2018-07-23  803  		request.operation = payload->write ?
c85e6e546edd7e David Francis 2018-07-23  804  			DCE_I2C_TRANSACTION_WRITE :
c85e6e546edd7e David Francis 2018-07-23  805  			DCE_I2C_TRANSACTION_READ;
c85e6e546edd7e David Francis 2018-07-23  806  
c85e6e546edd7e David Francis 2018-07-23  807  		request.payload.address_space =
c85e6e546edd7e David Francis 2018-07-23  808  			DCE_I2C_TRANSACTION_ADDRESS_SPACE_I2C;
c85e6e546edd7e David Francis 2018-07-23 @809  		request.payload.address = (payload->address << 1) |
c85e6e546edd7e David Francis 2018-07-23  810  			!payload->write;
c85e6e546edd7e David Francis 2018-07-23  811  		request.payload.length = payload->length;
c85e6e546edd7e David Francis 2018-07-23  812  		request.payload.data = payload->data;
c85e6e546edd7e David Francis 2018-07-23  813  
c85e6e546edd7e David Francis 2018-07-23  814  
c85e6e546edd7e David Francis 2018-07-23  815  		if (!dce_i2c_hw_engine_submit_request(
c85e6e546edd7e David Francis 2018-07-23  816  				dce_i2c_hw, &request, mot)) {
c85e6e546edd7e David Francis 2018-07-23  817  			result = false;
c85e6e546edd7e David Francis 2018-07-23  818  			break;
c85e6e546edd7e David Francis 2018-07-23  819  		}
c85e6e546edd7e David Francis 2018-07-23  820  
c85e6e546edd7e David Francis 2018-07-23  821  
c85e6e546edd7e David Francis 2018-07-23  822  
c85e6e546edd7e David Francis 2018-07-23  823  		++index_of_payload;
c85e6e546edd7e David Francis 2018-07-23  824  	}
c85e6e546edd7e David Francis 2018-07-23  825  
c85e6e546edd7e David Francis 2018-07-23  826  	release_engine_dce_hw(pool, dce_i2c_hw);
c85e6e546edd7e David Francis 2018-07-23  827  
c85e6e546edd7e David Francis 2018-07-23  828  	return result;
c85e6e546edd7e David Francis 2018-07-23  829  }
c85e6e546edd7e David Francis 2018-07-23  830  static const struct dce_i2c_hw_funcs dce100_i2c_hw_funcs = {
c85e6e546edd7e David Francis 2018-07-23  831  		.setup_engine = setup_engine_hw_dce100,
c85e6e546edd7e David Francis 2018-07-23  832  		.set_speed = set_speed_hw_dce100,
c85e6e546edd7e David Francis 2018-07-23  833  		.get_speed = get_speed_hw,
c85e6e546edd7e David Francis 2018-07-23  834  		.release_engine = release_engine_hw,
c85e6e546edd7e David Francis 2018-07-23  835  		.process_transaction = process_transaction_hw_dce100,
c85e6e546edd7e David Francis 2018-07-23  836  		.process_channel_reply = process_channel_reply_hw_dce100,
c85e6e546edd7e David Francis 2018-07-23  837  		.is_hw_busy = is_hw_busy,
c85e6e546edd7e David Francis 2018-07-23  838  		.get_channel_status = get_channel_status_hw,
c85e6e546edd7e David Francis 2018-07-23  839  		.execute_transaction = execute_transaction_hw,
c85e6e546edd7e David Francis 2018-07-23  840  		.disable_i2c_hw_engine = disable_i2c_hw_engine
c85e6e546edd7e David Francis 2018-07-23  841  };
c85e6e546edd7e David Francis 2018-07-23  842  static const struct dce_i2c_hw_funcs dce80_i2c_hw_funcs = {
c85e6e546edd7e David Francis 2018-07-23  843  		.setup_engine = setup_engine_hw_dce80,
c85e6e546edd7e David Francis 2018-07-23  844  		.set_speed = set_speed_hw_dce80,
c85e6e546edd7e David Francis 2018-07-23  845  		.get_speed = get_speed_hw,
c85e6e546edd7e David Francis 2018-07-23  846  		.release_engine = release_engine_hw,
c85e6e546edd7e David Francis 2018-07-23  847  		.process_transaction = process_transaction_hw_dce80,
c85e6e546edd7e David Francis 2018-07-23  848  		.process_channel_reply = process_channel_reply_hw_dce80,
c85e6e546edd7e David Francis 2018-07-23  849  		.is_hw_busy = is_hw_busy,
c85e6e546edd7e David Francis 2018-07-23  850  		.get_channel_status = get_channel_status_hw,
c85e6e546edd7e David Francis 2018-07-23  851  		.execute_transaction = execute_transaction_hw,
c85e6e546edd7e David Francis 2018-07-23  852  		.disable_i2c_hw_engine = disable_i2c_hw_engine
c85e6e546edd7e David Francis 2018-07-23  853  };
c85e6e546edd7e David Francis 2018-07-23  854  
c85e6e546edd7e David Francis 2018-07-23  855  
c85e6e546edd7e David Francis 2018-07-23  856  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
