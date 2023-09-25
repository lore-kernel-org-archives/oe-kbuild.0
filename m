Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EF47F6
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 00:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695603192; x=1727139192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PJsHULFGJba0PHubP426Ri81hoMFJyBNS5d/EFZVD/Q=;
  b=Gfea8eRZz2cfUhADu3CZjPUmN0YYfBKTzY5XhWNfviF0IkONterKUmrg
   Cbqlcib/v8NTqI7sVGDPRpTG7j2Agpk3vgNoZnv3am0PlHj0KgSUaFoe6
   /dNf6n42dyqotYS8CPOOz8qKRBntBvsud51MzCI5c++lu/ZzNUqnh4/kI
   D79bKGKu0yPRYifREG36H671ceUwOXe+pGTyoVFzNXHYWvJhm1oanIgY3
   B5kAAKNU9OtEMDFJSxxw09A0m8bpMmlBg74zQeKY9Xr7mZgd0yw7OV6Im
   vdn6Z+RrWv/2X3losS8V2rVC037JHYYva7TyiimtdSd7yeWGX5eIkxJ+c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="447626589"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="447626589"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 17:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838414866"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="838414866"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Sep 2023 17:53:10 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkZqW-0000hl-0s;
	Mon, 25 Sep 2023 00:53:08 +0000
Date: Mon, 25 Sep 2023 08:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC v2 11/37] drm/connector: hdmi: Add Infoframes
 generation
Message-ID: <202309250813.H4gRAtza-lkp@intel.com>
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
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-11-17932daddd7d@kernel.org>
References: <20230920-kms-hdmi-connector-state-v2-11-17932daddd7d@kernel.org>
TO: Maxime Ripard <mripard@kernel.org>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-connector-Introduce-an-HDMI-connector/20230920-224045
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230920-kms-hdmi-connector-state-v2-11-17932daddd7d%40kernel.org
patch subject: [PATCH RFC v2 11/37] drm/connector: hdmi: Add Infoframes generation
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20230921 (https://download.01.org/0day-ci/archive/20230925/202309250813.H4gRAtza-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230925/202309250813.H4gRAtza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309250813.H4gRAtza-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_atomic_state_helper.c:938 hdmi_generate_vendor_infoframe() warn: ignoring unreachable code.

vim +938 drivers/gpu/drm/drm_atomic_state_helper.c

ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  920  
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  921  static int hdmi_generate_vendor_infoframe(const struct drm_connector *connector,
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  922  					  struct drm_connector_state *state)
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  923  {
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  924  	const struct drm_display_mode *mode =
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  925  		connector_state_get_adjusted_mode(state);
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  926  	struct drm_connector_hdmi_infoframe *infoframe =
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  927  		&state->hdmi.infoframes.vendor;
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  928  	struct hdmi_vendor_infoframe *frame =
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  929  		&infoframe->data.vendor.hdmi;
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  930  	int ret;
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  931  
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  932  	ret = drm_hdmi_vendor_infoframe_from_display_mode(frame, connector, mode);
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  933  	if (ret == -EINVAL)
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  934  		return 0;
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  935  	else
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  936  		return ret;
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  937  
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20 @938  	infoframe->set = true;
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  939  
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  940  	return 0;
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  941  }
ae7d8bc7dd1dbff Maxime Ripard 2023-09-20  942  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
