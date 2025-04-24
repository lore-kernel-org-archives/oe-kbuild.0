Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADD719CCF5
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Apr 2025 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745523709; cv=none; b=DRM9905EWuDrPupFsFLzWUaYHbqOWoAn71ZVuW3vy5HDzMaUSCxiHuoRGTRMd1b0hM9Q0eIQsdQg/zp9jkCR7LzYIMIVVO4d2kYYbZCrqOa2BekDgNLQVaT86PRvoU8LkMVuzOLDZ6aHQw6AdAt+Wti4UgStVz4rQQhh6obfrTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745523709; c=relaxed/simple;
	bh=ybu+5CdhUnkbdC5jSt/m1AGyFQsNRlrxdLGGBFeRhuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=haS5Swb4ekEQnM2rV7QvMnBG6xlRxODJUgX2Sxn2vwmFRPfs2pGpWLzo4G6v2yeUFiN6zLSvT/YbK4hk+vzIlOwiVUj/9N6vopixrJ38gAXdr4B1SV00VGvi58eTCPpPcidYRbY7Hs8SZobpSDA2oH99n+jwHtxPl2ARRxaU0u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWxwnPNQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWxwnPNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745523708; x=1777059708;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ybu+5CdhUnkbdC5jSt/m1AGyFQsNRlrxdLGGBFeRhuY=;
  b=KWxwnPNQYCZOmjvMmaTORpG1hgZwcHc7udS8FBnePrMKJVx4H4R+7sOL
   oMOjgOL3lo9ocd8q6x/VNNv7jkMNiilrblyAYiR0gYXf42mYMjd8Uu2So
   5sudQCs8z97/CVvuOsK99PI10ltyg7lTLZ/nR1A7gZURgv6+VtyzzCi/S
   BxAMPgcDATINL4hbIrG6KNyJ4g3WRe0YfrKV58HSNJZgu+Fv6wE/8ILor
   RXnnHL7WSdxw9Z2okTwAzlRg3w6h2k10NGDwBpD2wrmukzZKHWRnMkIBP
   s30oVTAbF00Z68ADZg9wCh/YIIHFqQjSXN0M3PoqPPCFTmht/aTLEPWqe
   Q==;
X-CSE-ConnectionGUID: Lf1wC8kySkKwGWZTDZYeBA==
X-CSE-MsgGUID: fvbkxpPSR9q7qVAEOk8WTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58165982"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="58165982"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 12:41:47 -0700
X-CSE-ConnectionGUID: z3D05zCxT82uQDmpX+6oew==
X-CSE-MsgGUID: ckOOyspqQqWCU/s3buUzZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="133676825"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Apr 2025 12:41:45 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u82S7-0004VN-0r;
	Thu, 24 Apr 2025 19:41:43 +0000
Date: Fri, 25 Apr 2025 03:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 5/38]
 drivers/platform/x86/dell/alienware-wmi-wmax.c:658
 awcc_platform_profile_probe() error: uninitialized symbol 'id'.
Message-ID: <202504250322.KrZP3Rca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
TO: Kurt Borja <kuurtb@gmail.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Armin Wolf <W_Armin@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   4d1e8c8f11c611db5828e4bae7292bc295eea8ef
commit: 45983d19f305a562386f4d13accd11056b99f48a [5/38] platform/x86: alienware-wmi-wmax: Improve internal AWCC API
:::::: branch date: 7 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20250424 (https://download.01.org/0day-ci/archive/20250425/202504250322.KrZP3Rca-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504250322.KrZP3Rca-lkp@intel.com/

smatch warnings:
drivers/platform/x86/dell/alienware-wmi-wmax.c:658 awcc_platform_profile_probe() error: uninitialized symbol 'id'.

vim +/id +658 drivers/platform/x86/dell/alienware-wmi-wmax.c

8cc2c415d092e1 Kurt Borja 2025-02-07  631  
8a1a0fb55f8a8e Kurt Borja 2025-03-29  632  static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
8cc2c415d092e1 Kurt Borja 2025-02-07  633  {
8cc2c415d092e1 Kurt Borja 2025-02-07  634  	enum platform_profile_option profile;
8cc2c415d092e1 Kurt Borja 2025-02-07  635  	struct awcc_priv *priv = drvdata;
8a1a0fb55f8a8e Kurt Borja 2025-03-29  636  	enum awcc_thermal_profile mode;
8cc2c415d092e1 Kurt Borja 2025-02-07  637  	u8 sys_desc[4];
8cc2c415d092e1 Kurt Borja 2025-02-07  638  	u32 first_mode;
8cc2c415d092e1 Kurt Borja 2025-02-07  639  	int ret;
a000da9dbc2496 Kurt Borja 2025-03-29  640  	u8 id;
8cc2c415d092e1 Kurt Borja 2025-02-07  641  
8a1a0fb55f8a8e Kurt Borja 2025-03-29  642  	ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
8cc2c415d092e1 Kurt Borja 2025-02-07  643  				       0, (u32 *) &sys_desc);
8cc2c415d092e1 Kurt Borja 2025-02-07  644  	if (ret < 0)
8cc2c415d092e1 Kurt Borja 2025-02-07  645  		return ret;
8cc2c415d092e1 Kurt Borja 2025-02-07  646  
8cc2c415d092e1 Kurt Borja 2025-02-07  647  	first_mode = sys_desc[0] + sys_desc[1];
8cc2c415d092e1 Kurt Borja 2025-02-07  648  
8cc2c415d092e1 Kurt Borja 2025-02-07  649  	for (u32 i = 0; i < sys_desc[3]; i++) {
45983d19f305a5 Kurt Borja 2025-03-29  650  		ret = awcc_op_get_resource_id(priv->wdev, i + first_mode, &id);
8cc2c415d092e1 Kurt Borja 2025-02-07  651  
8cc2c415d092e1 Kurt Borja 2025-02-07  652  		if (ret == -EIO)
8cc2c415d092e1 Kurt Borja 2025-02-07  653  			return ret;
8cc2c415d092e1 Kurt Borja 2025-02-07  654  
8cc2c415d092e1 Kurt Borja 2025-02-07  655  		if (ret == -EBADRQC)
8cc2c415d092e1 Kurt Borja 2025-02-07  656  			break;
8cc2c415d092e1 Kurt Borja 2025-02-07  657  
a000da9dbc2496 Kurt Borja 2025-03-29 @658  		if (!is_awcc_thermal_profile_id(id))
8cc2c415d092e1 Kurt Borja 2025-02-07  659  			continue;
8cc2c415d092e1 Kurt Borja 2025-02-07  660  
a000da9dbc2496 Kurt Borja 2025-03-29  661  		mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
8a1a0fb55f8a8e Kurt Borja 2025-03-29  662  		profile = awcc_mode_to_platform_profile[mode];
a000da9dbc2496 Kurt Borja 2025-03-29  663  		priv->supported_thermal_profiles[profile] = id;
8cc2c415d092e1 Kurt Borja 2025-02-07  664  
8cc2c415d092e1 Kurt Borja 2025-02-07  665  		set_bit(profile, choices);
8cc2c415d092e1 Kurt Borja 2025-02-07  666  	}
8cc2c415d092e1 Kurt Borja 2025-02-07  667  
8cc2c415d092e1 Kurt Borja 2025-02-07  668  	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
8cc2c415d092e1 Kurt Borja 2025-02-07  669  		return -ENODEV;
8cc2c415d092e1 Kurt Borja 2025-02-07  670  
8cc2c415d092e1 Kurt Borja 2025-02-07  671  	if (awcc->gmode) {
8cc2c415d092e1 Kurt Borja 2025-02-07  672  		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
8a1a0fb55f8a8e Kurt Borja 2025-03-29  673  			AWCC_THERMAL_MODE_GMODE;
8cc2c415d092e1 Kurt Borja 2025-02-07  674  
8cc2c415d092e1 Kurt Borja 2025-02-07  675  		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
8cc2c415d092e1 Kurt Borja 2025-02-07  676  	}
8cc2c415d092e1 Kurt Borja 2025-02-07  677  
8cc2c415d092e1 Kurt Borja 2025-02-07  678  	return 0;
8cc2c415d092e1 Kurt Borja 2025-02-07  679  }
8cc2c415d092e1 Kurt Borja 2025-02-07  680  

:::::: The code at line 658 was first introduced by commit
:::::: a000da9dbc249642233587a80df03130e8983d10 platform/x86: alienware-wmi-wmax: Improve ID processing

:::::: TO: Kurt Borja <kuurtb@gmail.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
