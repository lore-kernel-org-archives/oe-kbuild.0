Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4D7DF61
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 02:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706669006; cv=none; b=tl5HtB8XDBecb4lKEHDQQR2FsaQy3+pF2yEo1psemmCjSTk+Azd9Vx2Z+b4OTwnvZr9X0GsR/NMviXocmY7caJJax/lQKU6/1Tu1Aro0xjF5QvpcfQHuMxDgdIOf2HPn9W/mLaAVO37m8jKznUnN3bQuh0rSC6NEw3FC1n/WM/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706669006; c=relaxed/simple;
	bh=a/228TUxclXliyE2qGpAjapBOM4UYWY6+RcwQIv9hqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDPBrHnWoe38ar1QIIAtoH2geSVmS7UKy4GRXKh1/7U0U9GrxBa40GLKmrw4LfOtm8XUIEqvUMykk90wkK+X/RbgLyjONcNHG+Rag3laXw/J4Vu8OI9hSDJslZx6BgbLMQwi9d/yZUamcqON6VE6/M5mP/gI0JWAX3LTTxjCXHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3TCKHHA; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3TCKHHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706669004; x=1738205004;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a/228TUxclXliyE2qGpAjapBOM4UYWY6+RcwQIv9hqA=;
  b=c3TCKHHAR67HjlGcQZYFXnz/aX4UBN5O8syskQ3VG0CvRJdu3d4hTT2k
   0f10LTJaxoKF8JGgOFasR4Snsj12SzGAMVicK/izTFloDmCuB5Y9JExx6
   wxlV3b+8V9pai1LXLbYMdbWBrOo2O+qYyxQA6CuJh6bGdibFVIZK/WfSy
   3UnQ10EkjokOCGpGuX+A/IUtPQAHOV28wzGNY0gAdN1MZB6vRLh04xrDK
   dnbCZcuDZoZDqarAbQElVzkPehzQNV5TPEd2geN7Yx/EiYU6VKxpMKCue
   J7eKQqWD6qlUAqEWT2ev2nDqB72V9wgx0BXDKsOn+OBSASWsFE5usmUCj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407183703"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="407183703"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 18:43:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="737952669"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="737952669"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Jan 2024 18:43:22 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV0ZM-00014m-0p;
	Wed, 31 Jan 2024 02:43:20 +0000
Date: Wed, 31 Jan 2024 10:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/display/intel_display_debugfs.c:1091:6: error:
 redefinition of 'intel_display_debugfs_register'
Message-ID: <202401311018.P0Sq7A8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Francois Dugast <francois.dugast@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a6526c4f389bb741e511be11721b3d1cbf1034a
commit: bf3ff145df184698a8a80b33265064638572366f drm/xe: display support should not depend on EXPERT
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: alpha-randconfig-r053-20240130 (https://download.01.org/0day-ci/archive/20240131/202401311018.P0Sq7A8X-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311018.P0Sq7A8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401311018.P0Sq7A8X-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:1091:6: error: redefinition of 'intel_display_debugfs_register'
    1091 | void intel_display_debugfs_register(struct drm_i915_private *i915)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/display/intel_display_debugfs.c:19:
   drivers/gpu/drm/i915/display/intel_display_debugfs.h:18:20: note: previous definition of 'intel_display_debugfs_register' with type 'void(struct xe_device *)'
      18 | static inline void intel_display_debugfs_register(struct drm_i915_private *i915) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:1571:6: error: redefinition of 'intel_connector_debugfs_add'
    1571 | void intel_connector_debugfs_add(struct intel_connector *connector)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.h:19:20: note: previous definition of 'intel_connector_debugfs_add' with type 'void(struct intel_connector *)'
      19 | static inline void intel_connector_debugfs_add(struct intel_connector *connector) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:1626:6: error: redefinition of 'intel_crtc_debugfs_add'
    1626 | void intel_crtc_debugfs_add(struct intel_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_debugfs.h:20:20: note: previous definition of 'intel_crtc_debugfs_add' with type 'void(struct intel_crtc *)'
      20 | static inline void intel_crtc_debugfs_add(struct intel_crtc *crtc) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:437:6: error: redefinition of 'intel_crtc_crc_init'
     437 | void intel_crtc_crc_init(struct intel_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/display/intel_pipe_crc.c:36:
   drivers/gpu/drm/i915/display/intel_pipe_crc.h:25:20: note: previous definition of 'intel_crtc_crc_init' with type 'void(struct intel_crtc *)'
      25 | static inline void intel_crtc_crc_init(struct intel_crtc *crtc) {}
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c: In function 'intel_crtc_crc_init':
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:439:48: error: 'struct intel_crtc' has no member named 'pipe_crc'
     439 |         struct intel_pipe_crc *pipe_crc = &crtc->pipe_crc;
         |                                                ^~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/alpha/include/asm/rwonce.h:33,
                    from include/linux/compiler.h:251,
                    from include/linux/ctype.h:5,
                    from drivers/gpu/drm/i915/display/intel_pipe_crc.c:27:
   drivers/gpu/drm/i915/display/intel_pipe_crc.c: At top level:
   include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
       8 | #define NULL ((void *)0)
         |                ^~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.h:28:36: note: in expansion of macro 'NULL'
      28 | #define intel_crtc_get_crc_sources NULL
         |                                    ^~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c:549:20: note: in expansion of macro 'intel_crtc_get_crc_sources'
     549 | const char *const *intel_crtc_get_crc_sources(struct drm_crtc *crtc,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:23: error: expected ')' before numeric constant
       8 | #define NULL ((void *)0)
         |                       ^
   drivers/gpu/drm/i915/display/intel_pipe_crc.h:28:36: note: in expansion of macro 'NULL'
      28 | #define intel_crtc_get_crc_sources NULL
         |                                    ^~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c:549:20: note: in expansion of macro 'intel_crtc_get_crc_sources'
     549 | const char *const *intel_crtc_get_crc_sources(struct drm_crtc *crtc,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
       8 | #define NULL ((void *)0)
         |                ^~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.h:27:38: note: in expansion of macro 'NULL'
      27 | #define intel_crtc_verify_crc_source NULL
         |                                      ^~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c:556:5: note: in expansion of macro 'intel_crtc_verify_crc_source'
     556 | int intel_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:23: error: expected ')' before numeric constant
       8 | #define NULL ((void *)0)
         |                       ^
   drivers/gpu/drm/i915/display/intel_pipe_crc.h:27:38: note: in expansion of macro 'NULL'
      27 | #define intel_crtc_verify_crc_source NULL
         |                                      ^~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c:556:5: note: in expansion of macro 'intel_crtc_verify_crc_source'
     556 | int intel_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
       8 | #define NULL ((void *)0)
         |                ^~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.h:26:35: note: in expansion of macro 'NULL'
      26 | #define intel_crtc_set_crc_source NULL
         |                                   ^~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c:576:5: note: in expansion of macro 'intel_crtc_set_crc_source'
     576 | int intel_crtc_set_crc_source(struct drm_crtc *_crtc, const char *source_name)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:23: error: expected ')' before numeric constant
       8 | #define NULL ((void *)0)
         |                       ^
   drivers/gpu/drm/i915/display/intel_pipe_crc.h:26:35: note: in expansion of macro 'NULL'
      26 | #define intel_crtc_set_crc_source NULL
         |                                   ^~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c:576:5: note: in expansion of macro 'intel_crtc_set_crc_source'
     576 | int intel_crtc_set_crc_source(struct drm_crtc *_crtc, const char *source_name)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:630:6: error: redefinition of 'intel_crtc_enable_pipe_crc'
     630 | void intel_crtc_enable_pipe_crc(struct intel_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.h:33:20: note: previous definition of 'intel_crtc_enable_pipe_crc' with type 'void(struct intel_crtc *)'
      33 | static inline void intel_crtc_enable_pipe_crc(struct intel_crtc *crtc)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c: In function 'intel_crtc_enable_pipe_crc':
   drivers/gpu/drm/i915/display/intel_pipe_crc.c:633:48: error: 'struct intel_crtc' has no member named 'pipe_crc'
     633 |         struct intel_pipe_crc *pipe_crc = &crtc->pipe_crc;
         |                                                ^~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c: At top level:
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:650:6: error: redefinition of 'intel_crtc_disable_pipe_crc'
     650 | void intel_crtc_disable_pipe_crc(struct intel_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.h:29:20: note: previous definition of 'intel_crtc_disable_pipe_crc' with type 'void(struct intel_crtc *)'
      29 | static inline void intel_crtc_disable_pipe_crc(struct intel_crtc *crtc)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c: In function 'intel_crtc_disable_pipe_crc':
   drivers/gpu/drm/i915/display/intel_pipe_crc.c:653:48: error: 'struct intel_crtc' has no member named 'pipe_crc'
     653 |         struct intel_pipe_crc *pipe_crc = &crtc->pipe_crc;
         |                                                ^~
   drivers/gpu/drm/i915/display/intel_pipe_crc.c: At top level:
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:532:1: warning: 'intel_is_valid_crc_source' defined but not used [-Wunused-function]
     532 | intel_is_valid_crc_source(struct drm_i915_private *dev_priv,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:420:1: warning: 'display_crc_ctl_parse_source' defined but not used [-Wunused-function]
     420 | display_crc_ctl_parse_source(const char *buf, enum intel_pipe_crc_source *s)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:279:1: warning: 'intel_crtc_crc_setup_workarounds' defined but not used [-Wunused-function]
     279 | intel_crtc_crc_setup_workarounds(struct intel_crtc *crtc, bool enable)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:229:13: warning: 'vlv_undo_pipe_scramble_reset' defined but not used [-Wunused-function]
     229 | static void vlv_undo_pipe_scramble_reset(struct drm_i915_private *dev_priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m


vim +/intel_display_debugfs_register +1091 drivers/gpu/drm/i915/display/intel_display_debugfs.c

926b005cd8c4e3 Jani Nikula        2020-02-11  1090  
f06b2052f74d7b Wambui Karuga      2020-03-10 @1091  void intel_display_debugfs_register(struct drm_i915_private *i915)
926b005cd8c4e3 Jani Nikula        2020-02-11  1092  {
926b005cd8c4e3 Jani Nikula        2020-02-11  1093  	struct drm_minor *minor = i915->drm.primary;
926b005cd8c4e3 Jani Nikula        2020-02-11  1094  	int i;
926b005cd8c4e3 Jani Nikula        2020-02-11  1095  
926b005cd8c4e3 Jani Nikula        2020-02-11  1096  	for (i = 0; i < ARRAY_SIZE(intel_display_debugfs_files); i++) {
926b005cd8c4e3 Jani Nikula        2020-02-11  1097  		debugfs_create_file(intel_display_debugfs_files[i].name,
f270b7087dc836 Jani Nikula        2023-12-05  1098  				    0644,
926b005cd8c4e3 Jani Nikula        2020-02-11  1099  				    minor->debugfs_root,
926b005cd8c4e3 Jani Nikula        2020-02-11  1100  				    to_i915(minor->dev),
926b005cd8c4e3 Jani Nikula        2020-02-11  1101  				    intel_display_debugfs_files[i].fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  1102  	}
926b005cd8c4e3 Jani Nikula        2020-02-11  1103  
f06b2052f74d7b Wambui Karuga      2020-03-10  1104  	drm_debugfs_create_files(intel_display_debugfs_list,
926b005cd8c4e3 Jani Nikula        2020-02-11  1105  				 ARRAY_SIZE(intel_display_debugfs_list),
926b005cd8c4e3 Jani Nikula        2020-02-11  1106  				 minor->debugfs_root, minor);
d2de8ccfb29909 Ville Syrjälä      2021-11-24  1107  
d7c281eecec069 Bhanuprakash Modem 2023-04-13  1108  	intel_cdclk_debugfs_register(i915);
f0147745f78685 Jani Nikula        2022-03-21  1109  	intel_dmc_debugfs_register(i915);
d2de8ccfb29909 Ville Syrjälä      2021-11-24  1110  	intel_fbc_debugfs_register(i915);
1bed8b07342069 Jani Nikula        2022-09-16  1111  	intel_hpd_debugfs_register(i915);
5cc0de45674971 Jani Nikula        2023-03-17  1112  	intel_psr_debugfs_register(i915);
f22c982ef4152f Jani Nikula        2023-02-15  1113  	intel_wm_debugfs_register(i915);
8015bee0bfec69 Jouni Högander     2023-10-24  1114  	intel_display_debugfs_params(i915);
926b005cd8c4e3 Jani Nikula        2020-02-11  1115  }
926b005cd8c4e3 Jani Nikula        2020-02-11  1116  

:::::: The code at line 1091 was first introduced by commit
:::::: f06b2052f74d7b42ff8cbfe1ac0b78be7668c37d drm/i915: have *_debugfs_init() functions return void.

:::::: TO: Wambui Karuga <wambui.karugax@gmail.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
