Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002A51E7C03
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764675397; cv=none; b=o++0CpmkQJZSjlC3o5TBqkTQ21QpISkRn2U55DyCvPqEaLD8wfr2oX5mZe9b8nu3eoAuftg5DLaxq4ma8HffV9wTdsjvmjjBvRbHMKnqofLsMF0p5IELKtBOKZN5xyQHcDl5uGWgG6+bWoja0ylQJW8ZmuGv41OfcFB0zTDJcc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764675397; c=relaxed/simple;
	bh=+inhcRkch9ll2rDHQ0srn+iw21pGxWNKmEzLMYKd1vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8s7eytxUUfli7gh5yebYI6OCRS4o8SaUBFfdGja1lJq0JSTrSa+dFmyciDEvxUybm7ZMO/PPMWj4+a5LSof6IeCgItrklztA6BTI7vugHsDI/4bxWV7wGDknYG7REU6v6SNZP8L00yDvTbg3KIfIKHI5feY/aKdQTi2GML+jeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAR3uhWP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAR3uhWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764675396; x=1796211396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+inhcRkch9ll2rDHQ0srn+iw21pGxWNKmEzLMYKd1vk=;
  b=bAR3uhWPQUxV3qLrvr/QrA5BLj2OnJ7H1D5syjPPbV7+zxqG1837fTME
   uuUTqZMWh1S01Ez5oq3m6wkV5vavAJVvUi3MNLXurjjlOQeH5qFlwWjQm
   vcxonGb7BMwC/n0TBPSML2XjNyjKJp95AOyO5EjPd6XxQCok+ULuP8tQ+
   YmtX5G7dL4yVvjTb2g3/zVtOdCxJtzsZgY+UsbunA88M6Z/TVuyB4z1F2
   YuCNXqkaDTaUTnMtpq84fVTg4ZTHQDDKw1w2JAuNmlW5L5QIf2DLsouCH
   VbjDX5G5D6rbJyJalEovbxUDzj4hFh5iyXlKc0ea8QCdVXoNIVsYUdhTF
   g==;
X-CSE-ConnectionGUID: bSDls6zkRnqPjbnHU1aMOQ==
X-CSE-MsgGUID: DBbGbcChRwe9gDxsrN4lLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66351987"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66351987"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 03:36:35 -0800
X-CSE-ConnectionGUID: TiorLFPbQNqFXhDOSZOjTw==
X-CSE-MsgGUID: 7ZQBBEkPT4eXQAlMP34MRg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2025 03:36:34 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQOgK-000000002rV-0kvZ;
	Tue, 02 Dec 2025 11:36:32 +0000
Date: Tue, 2 Dec 2025 12:36:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error:
 field 'base' has incomplete type
Message-ID: <202512021242.u5Knsko8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245, commit: e1baa3af87f6aa58790e98aa728c99a548dd9cb7"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
CC: 0day robot <lkp@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Uma Shankar <uma.shankar@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: e1baa3af87f6aa58790e98aa728c99a548dd9cb7 drm/i915: Add intel_color_op
date:   28 hours ago
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512021242.u5Knsko8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021242.u5Knsko8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021242.u5Knsko8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gem/i915_gem_pages.c:13:
>> drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error: field 'base' has incomplete type
    1989 |         struct drm_colorop base;
         |                            ^~~~
--
   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_colorop.c:5:
>> drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error: field 'base' has incomplete type
    1989 |         struct drm_colorop base;
         |                            ^~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/plist.h:76,
                    from include/linux/pm_qos.h:15,
                    from drivers/gpu/drm/i915/display/intel_display_types.h:29:
   drivers/gpu/drm/i915/display/intel_colorop.c: In function 'to_intel_colorop':
   include/linux/compiler_types.h:552:27: error: expression in static assertion is not an integer
     552 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_colorop.c:9:16: note: in expansion of macro 'container_of'
       9 |         return container_of(colorop, struct intel_colorop, base);
         |                ^~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_colorop.c:10:1: warning: control reaches end of non-void function [-Wreturn-type]
      10 | }
         | ^


vim +/base +1989 drivers/gpu/drm/i915/display/intel_display_types.h

0e32b39ceed665 drivers/gpu/drm/i915/intel_drv.h                   Dave Airlie           2014-05-02  1987  
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01  1988  struct intel_colorop {
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01 @1989  	struct drm_colorop base;
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01  1990  	enum intel_color_block id;
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01  1991  };
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01  1992  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
