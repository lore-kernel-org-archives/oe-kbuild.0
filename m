Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D671CFBA
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758468106; cv=none; b=tEGgMsqJvSHbkt4bu++uveHoQfGU9wbDCA2O2zg4Gs9AHciVyNew02eQfcSGl5lFNcajtB2/rRhZhbe71yQa5Tki8vUcl4y3X+wpNLLOU7/YZ4IB7YrNJr4urK9nnTXoJq5wmz3Z8yENP5nzPV5PcQwMNYRxZPKaeBcAiyyFVIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758468106; c=relaxed/simple;
	bh=pR2GV9jjYFSiTuLJGxcF6CE8Lzv9RiyG80t/+b5J99o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ls51CERKcLgvatX6IgpR8Gn4yTSNIeMdL4qF7rO1ZgnpTIxJgyQu5X/I2oB8bkF7r0j7VghTj53eIS0Jm+YrKCTbSArAah85KBEzj0wpLeISGe+zCwg0rZUQ2YzrUtgoVHvdqekLR1Q8QvOQIyWZJCsdmMEsOBaLukGMPJ3xBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n90ioQSq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n90ioQSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758468105; x=1790004105;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pR2GV9jjYFSiTuLJGxcF6CE8Lzv9RiyG80t/+b5J99o=;
  b=n90ioQSqwA36W/fsIBBeYSlmc1Wl1YuyO6vaXlItk4aGTXjukhH5lPZy
   6IXq+WBtMD5e6jICxUwOgYcT2nu8F4l0IfXXAEVrDX1Q/Ha2M7G+zPCni
   UG7/rYk1XYgtq6VGdfQLrRL24GJaeL0dRUVTihtqMB2kd42qyUcFhvNuR
   7mZWMMDinEmSj8HTZHt+kswLqayh9aOyoVqE/k//QqUtt5aJaGfb3tb9o
   ECxf9WhwqmGpPDYryokbMkSU3UK5+FqXWcDjblfvlxmVIRrEfX11+Td5I
   mWW4OioD644NU53gkBBrr/QtLp5UGMky67fxqiSE73qxAUaKV5PFbA88E
   g==;
X-CSE-ConnectionGUID: sf1r15D/TruwRlvhVoOloA==
X-CSE-MsgGUID: cdbCqUHkQIWFS2Mh1/Mpwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60864604"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="60864604"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 08:21:44 -0700
X-CSE-ConnectionGUID: aPwNaG+jQjWy31yU74oGeQ==
X-CSE-MsgGUID: eyKDxEUbR+ur36nUhebOew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="213424357"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Sep 2025 08:21:43 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0Lsi-0000pB-1X;
	Sun, 21 Sep 2025 15:21:40 +0000
Date: Sun, 21 Sep 2025 23:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
Message-ID: <202509212215.c8v3RKmL-lkp@intel.com>
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
In-Reply-To: <20250914155308.2144-1-rubenru09@aol.com>
References: <20250914155308.2144-1-rubenru09@aol.com>
TO: Ruben Wauters <rubenru09@aol.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
CC: Ruben Wauters <rubenru09@aol.com>
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org

Hi Ruben,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruben-Wauters/drm-gud-replace-WARN_ON-WARN_ON_ONCE-with-drm-versions/20250914-235627
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250914155308.2144-1-rubenru09%40aol.com
patch subject: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20250921 (https://download.01.org/0day-ci/archive/20250921/202509212215.c8v3RKmL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509212215.c8v3RKmL-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/gud/gud_connector.c:597 gud_connector_fill_properties() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +597 drivers/gpu/drm/gud/gud_connector.c

40e1a70b4aedf2 Noralf Trønnes 2021-03-13  579  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  580  int gud_connector_fill_properties(struct drm_connector_state *connector_state,
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  581  				  struct gud_property_req *properties)
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  582  {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  583  	struct gud_connector *gconn = to_gud_connector(connector_state->connector);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  584  	unsigned int i;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  585  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  586  	for (i = 0; i < gconn->num_properties; i++) {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  587  		u16 prop = gconn->properties[i];
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  588  		u64 val;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  589  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  590  		if (prop == GUD_PROPERTY_BACKLIGHT_BRIGHTNESS) {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  591  			val = connector_state->tv.brightness;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  592  		} else {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  593  			unsigned int *state_val;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  594  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  595  			state_val = gud_connector_tv_state_val(prop, &connector_state->tv);
d00e57106c0d0c Ruben Wauters  2025-09-14  596  			if (drm_WARN_ON_ONCE(connector_state->connector->dev, state_val))
40e1a70b4aedf2 Noralf Trønnes 2021-03-13 @597  				return PTR_ERR(state_val);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  598  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  599  			val = *state_val;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  600  		}
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  601  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  602  		properties[i].prop = cpu_to_le16(prop);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  603  		properties[i].val = cpu_to_le64(val);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  604  	}
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  605  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  606  	return gconn->num_properties;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  607  }
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  608  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
