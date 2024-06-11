Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A44502B
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Jun 2024 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718149876; cv=none; b=m/VnSXksY9Iu6je3RmmABhAfzsMWcLOfV3ip3pvj/tPg/UyhDUBy3+6vzNqyLvm0QGBbmrNI5ksSiNgg/IPgUsuvvTncJ6QvelL0T1B9jU9ceYp6FRwIHjQfL/JQrj+rtIl9Tv0ULgilkCXLHrA1sJg9sb+W8KSxHIJUpfxteJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718149876; c=relaxed/simple;
	bh=bHe+4k/BGxn3emUW6MlSt6g4OHcjea65Rk7OhJfY2HE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNBuUyBszWW/jMc/V0saksu83Gzarum1Im/M/ovTyM6Rp6bzwEEZgXi/k4M48VzLYL1JXFU9pImBShWgnIRTMlaBdKf38Aud+lTFCFv5vNe6zDZy3EhOgjnvMJGnO1KFfYYthnuPpDCsM5DtESg1G+CFm4SWy0N4D2kIgMpt2Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWj20xhZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWj20xhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718149874; x=1749685874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bHe+4k/BGxn3emUW6MlSt6g4OHcjea65Rk7OhJfY2HE=;
  b=HWj20xhZ2U6YC3trmB2MqB7JibwV5jUw7MEG5iPHrjntT3h9AkUtZw5V
   OjjvgPuH6s1fRj9JOlcF8Kv0+NzKtgXF+0OXqYWM+Lceyfh/PsU6310ID
   y7ATIO+xxvVz2KPpLl1igwl3PlQFSTxHNOXYh4gI0vQ8hB7bytEeL8ED8
   isAOlBRVKlopwwOzISSm3JN+WH/IokgXxbUysrUeICc1gVSU/ZPlBl9Ce
   JjPxX7ZW/FbDyFSIhBbpPBM03NelQ4+DAWHjLHpNsbqZiqeoO6Cc19CI+
   +OivwJvmCCBun2y3jHkmx4Bad0+9JOuV5neTl9QfMImWwYFtyTjF05s/v
   g==;
X-CSE-ConnectionGUID: 04HzfjZNTk2xLz07zr5duQ==
X-CSE-MsgGUID: J/h848LWSYOY4Zd4B2LN8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26300180"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="26300180"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 16:51:14 -0700
X-CSE-ConnectionGUID: 0yL/xrKoSs+74wCI+OTwHg==
X-CSE-MsgGUID: 998ATmUwR/urdhJcZTzUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39714360"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2024 16:51:13 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHBGg-00010K-1z;
	Tue, 11 Jun 2024 23:51:10 +0000
Date: Wed, 12 Jun 2024 07:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jsarha:topic/chromeos-4.19-s0ix 6415/9999]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3673:2: warning:
 'strncpy' specified bound 32 equals destination size
Message-ID: <202406120730.xMznJ4uT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 872c91b9b3e71479285202070e518727735257e8 [6415/9999] UPSTREAM: Compiler Attributes: enable -Wstringop-truncation on W=1 (gcc >= 8)
:::::: branch date: 4 years, 8 months ago
:::::: commit date: 5 years ago
config: x86_64-buildonly-randconfig-001-20240612 (https://download.01.org/0day-ci/archive/20240612/202406120730.xMznJ4uT-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120730.xMznJ4uT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406120730.xMznJ4uT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:143:29: warning: 'GC_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE GC_BASE   = { { { { 0x00002000, 0x0000A000, 0, 0, 0 } },
                                ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:138:29: warning: 'VCE_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE VCE_BASE   = { { { { 0x00007E00, 0x00048800, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:133:29: warning: 'ATHUB_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE ATHUB_BASE   = { { { { 0x00000C20, 0, 0, 0, 0 } },
                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:128:29: warning: 'IOHC_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE IOHC_BASE   = { { { { 0x00010000, 0, 0, 0, 0 } },
                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:123:29: warning: 'L2IMU_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE L2IMU_BASE   = { { { { 0x00007DC0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:118:29: warning: 'SYSTEMHUB_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE SYSTEMHUB_BASE  = { { { { 0x00000EA0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:113:29: warning: 'ISP_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE ISP_BASE   = { { { { 0x00018000, 0, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:108:29: warning: 'DFX_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DFX_BASE   = { { { { 0x00000580, 0, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:103:29: warning: 'DFX_DAP_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DFX_DAP_BASE  = { { { { 0x000005A0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:98:29: warning: 'DBGU_IO_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DBGU_IO_BASE  = { { { { 0x000001E0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:93:29: warning: 'DBGU_NBIO_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DBGU_NBIO_BASE  = { { { { 0x000001C0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:88:29: warning: 'DBGU_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DBGU_BASE   = { { { { 0x00000180, 0x000001A0, 0, 0, 0 } },
                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:83:29: warning: 'VCN_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE VCN_BASE   = { { { { 0x00007800, 0x00007E00, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:78:29: warning: 'UVD_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE UVD_BASE   = { { { { 0x00007800, 0x00007E00, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:73:29: warning: 'DF_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DF_BASE   = { { { { 0x00007000, 0, 0, 0, 0 } },
                                ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:68:29: warning: 'MP2_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE MP2_BASE   = { { { { 0x00016000, 0, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:63:29: warning: 'MP1_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE MP1_BASE   = { { { { 0x00016000, 0, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:58:29: warning: 'MP0_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE MP0_BASE   = { { { { 0x00016000, 0, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:53:29: warning: 'DCN_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DCN_BASE   = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:48:29: warning: 'DCE_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DCE_BASE   = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:43:29: warning: 'NBIO_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE NBIO_BASE   = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0 } },
                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:38:29: warning: 'NBIF_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE NBIF_BASE   = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0 } },
                                ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:28:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:120:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:118:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:116:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
                                   ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
                                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
                                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
                                   ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_zero = { 0 };
                                   ^~~~~~~~~~~~~
   In function 'amdgpu_dm_create_common_mode',
       inlined from 'amdgpu_dm_connector_add_common_modes' at drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3730:10:
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3673:2: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
     strncpy(mode->name, name, DRM_DISPLAY_MODE_LEN);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'fill_audio_info',
       inlined from 'create_stream_for_sink' at drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2781:2:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2568:2: warning: 'strncpy' output may be truncated copying 19 bytes from a string of length 19 [-Wstringop-truncation]
     strncpy(audio_info->display_name,
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      edid_caps->display_name,
      ~~~~~~~~~~~~~~~~~~~~~~~~
      AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS - 1);
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +3673 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

e7b07ceef2a650 Harry Wentland 2017-08-10  3654  
3ee6b26b78e478 Alex Deucher   2017-10-10  3655  static struct drm_display_mode *
3ee6b26b78e478 Alex Deucher   2017-10-10  3656  amdgpu_dm_create_common_mode(struct drm_encoder *encoder,
3ee6b26b78e478 Alex Deucher   2017-10-10  3657  			     char *name,
e7b07ceef2a650 Harry Wentland 2017-08-10  3658  			     int hdisplay, int vdisplay)
e7b07ceef2a650 Harry Wentland 2017-08-10  3659  {
e7b07ceef2a650 Harry Wentland 2017-08-10  3660  	struct drm_device *dev = encoder->dev;
e7b07ceef2a650 Harry Wentland 2017-08-10  3661  	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
e7b07ceef2a650 Harry Wentland 2017-08-10  3662  	struct drm_display_mode *mode = NULL;
e7b07ceef2a650 Harry Wentland 2017-08-10  3663  	struct drm_display_mode *native_mode = &amdgpu_encoder->native_mode;
e7b07ceef2a650 Harry Wentland 2017-08-10  3664  
e7b07ceef2a650 Harry Wentland 2017-08-10  3665  	mode = drm_mode_duplicate(dev, native_mode);
e7b07ceef2a650 Harry Wentland 2017-08-10  3666  
e7b07ceef2a650 Harry Wentland 2017-08-10  3667  	if (mode == NULL)
e7b07ceef2a650 Harry Wentland 2017-08-10  3668  		return NULL;
e7b07ceef2a650 Harry Wentland 2017-08-10  3669  
e7b07ceef2a650 Harry Wentland 2017-08-10  3670  	mode->hdisplay = hdisplay;
e7b07ceef2a650 Harry Wentland 2017-08-10  3671  	mode->vdisplay = vdisplay;
e7b07ceef2a650 Harry Wentland 2017-08-10  3672  	mode->type &= ~DRM_MODE_TYPE_PREFERRED;
e7b07ceef2a650 Harry Wentland 2017-08-10 @3673  	strncpy(mode->name, name, DRM_DISPLAY_MODE_LEN);
e7b07ceef2a650 Harry Wentland 2017-08-10  3674  
e7b07ceef2a650 Harry Wentland 2017-08-10  3675  	return mode;
e7b07ceef2a650 Harry Wentland 2017-08-10  3676  
e7b07ceef2a650 Harry Wentland 2017-08-10  3677  }
e7b07ceef2a650 Harry Wentland 2017-08-10  3678  
e7b07ceef2a650 Harry Wentland 2017-08-10  3679  static void amdgpu_dm_connector_add_common_modes(struct drm_encoder *encoder,
e7b07ceef2a650 Harry Wentland 2017-08-10  3680  						 struct drm_connector *connector)
e7b07ceef2a650 Harry Wentland 2017-08-10  3681  {
e7b07ceef2a650 Harry Wentland 2017-08-10  3682  	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
e7b07ceef2a650 Harry Wentland 2017-08-10  3683  	struct drm_display_mode *mode = NULL;
e7b07ceef2a650 Harry Wentland 2017-08-10  3684  	struct drm_display_mode *native_mode = &amdgpu_encoder->native_mode;
c84dec2fe8837f Harry Wentland 2017-09-05  3685  	struct amdgpu_dm_connector *amdgpu_dm_connector =
c84dec2fe8837f Harry Wentland 2017-09-05  3686  				to_amdgpu_dm_connector(connector);
e7b07ceef2a650 Harry Wentland 2017-08-10  3687  	int i;
e7b07ceef2a650 Harry Wentland 2017-08-10  3688  	int n;
e7b07ceef2a650 Harry Wentland 2017-08-10  3689  	struct mode_size {
e7b07ceef2a650 Harry Wentland 2017-08-10  3690  		char name[DRM_DISPLAY_MODE_LEN];
e7b07ceef2a650 Harry Wentland 2017-08-10  3691  		int w;
e7b07ceef2a650 Harry Wentland 2017-08-10  3692  		int h;
e7b07ceef2a650 Harry Wentland 2017-08-10  3693  	} common_modes[] = {
e7b07ceef2a650 Harry Wentland 2017-08-10  3694  		{  "640x480",  640,  480},
e7b07ceef2a650 Harry Wentland 2017-08-10  3695  		{  "800x600",  800,  600},
e7b07ceef2a650 Harry Wentland 2017-08-10  3696  		{ "1024x768", 1024,  768},
e7b07ceef2a650 Harry Wentland 2017-08-10  3697  		{ "1280x720", 1280,  720},
e7b07ceef2a650 Harry Wentland 2017-08-10  3698  		{ "1280x800", 1280,  800},
e7b07ceef2a650 Harry Wentland 2017-08-10  3699  		{"1280x1024", 1280, 1024},
e7b07ceef2a650 Harry Wentland 2017-08-10  3700  		{ "1440x900", 1440,  900},
e7b07ceef2a650 Harry Wentland 2017-08-10  3701  		{"1680x1050", 1680, 1050},
e7b07ceef2a650 Harry Wentland 2017-08-10  3702  		{"1600x1200", 1600, 1200},
e7b07ceef2a650 Harry Wentland 2017-08-10  3703  		{"1920x1080", 1920, 1080},
e7b07ceef2a650 Harry Wentland 2017-08-10  3704  		{"1920x1200", 1920, 1200}
e7b07ceef2a650 Harry Wentland 2017-08-10  3705  	};
e7b07ceef2a650 Harry Wentland 2017-08-10  3706  
b830ebc910f641 Harry Wentland 2017-07-26  3707  	n = ARRAY_SIZE(common_modes);
e7b07ceef2a650 Harry Wentland 2017-08-10  3708  
e7b07ceef2a650 Harry Wentland 2017-08-10  3709  	for (i = 0; i < n; i++) {
e7b07ceef2a650 Harry Wentland 2017-08-10  3710  		struct drm_display_mode *curmode = NULL;
e7b07ceef2a650 Harry Wentland 2017-08-10  3711  		bool mode_existed = false;
e7b07ceef2a650 Harry Wentland 2017-08-10  3712  
e7b07ceef2a650 Harry Wentland 2017-08-10  3713  		if (common_modes[i].w > native_mode->hdisplay ||
e7b07ceef2a650 Harry Wentland 2017-08-10  3714  		    common_modes[i].h > native_mode->vdisplay ||
e7b07ceef2a650 Harry Wentland 2017-08-10  3715  		   (common_modes[i].w == native_mode->hdisplay &&
e7b07ceef2a650 Harry Wentland 2017-08-10  3716  		    common_modes[i].h == native_mode->vdisplay))
e7b07ceef2a650 Harry Wentland 2017-08-10  3717  			continue;
e7b07ceef2a650 Harry Wentland 2017-08-10  3718  
e7b07ceef2a650 Harry Wentland 2017-08-10  3719  		list_for_each_entry(curmode, &connector->probed_modes, head) {
e7b07ceef2a650 Harry Wentland 2017-08-10  3720  			if (common_modes[i].w == curmode->hdisplay &&
e7b07ceef2a650 Harry Wentland 2017-08-10  3721  			    common_modes[i].h == curmode->vdisplay) {
e7b07ceef2a650 Harry Wentland 2017-08-10  3722  				mode_existed = true;
e7b07ceef2a650 Harry Wentland 2017-08-10  3723  				break;
e7b07ceef2a650 Harry Wentland 2017-08-10  3724  			}
e7b07ceef2a650 Harry Wentland 2017-08-10  3725  		}
e7b07ceef2a650 Harry Wentland 2017-08-10  3726  
e7b07ceef2a650 Harry Wentland 2017-08-10  3727  		if (mode_existed)
e7b07ceef2a650 Harry Wentland 2017-08-10  3728  			continue;
e7b07ceef2a650 Harry Wentland 2017-08-10  3729  
e7b07ceef2a650 Harry Wentland 2017-08-10 @3730  		mode = amdgpu_dm_create_common_mode(encoder,
e7b07ceef2a650 Harry Wentland 2017-08-10  3731  				common_modes[i].name, common_modes[i].w,
e7b07ceef2a650 Harry Wentland 2017-08-10  3732  				common_modes[i].h);
e7b07ceef2a650 Harry Wentland 2017-08-10  3733  		drm_mode_probed_add(connector, mode);
c84dec2fe8837f Harry Wentland 2017-09-05  3734  		amdgpu_dm_connector->num_modes++;
e7b07ceef2a650 Harry Wentland 2017-08-10  3735  	}
e7b07ceef2a650 Harry Wentland 2017-08-10  3736  }
e7b07ceef2a650 Harry Wentland 2017-08-10  3737  

:::::: The code at line 3673 was first introduced by commit
:::::: e7b07ceef2a650e5ed8ca37997689e086c680daf drm/amd/display: Merge amdgpu_dm_types and amdgpu_dm

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
