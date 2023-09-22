Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285DA41E43
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 23:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695427039; x=1726963039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F21Nw2AMbaaHP5CTNiBdIsRfNb1dBjy7rwucdl9PDbU=;
  b=GvsPCd4yfiIbuMmtNzhNOqUBND+zxwXPvDmMGo/sLmFnmQT/usrkKDZn
   4C19vHMhhYQozb3/MPxtIxj6kxhdiH4Pf4SlmeaV/L/aWimK8bgOdDSq0
   4+LrQ+XqzHzXodl2In2q6rJF0UFi4qN9hkHB3vNNiMv6bcC+zsU6nWAbu
   nbsG6mujdgvEH6BO2ELYrrhkY21bdKUPQIRRnkqEFPYwLZPaTqoa+768Z
   JUmgZDW6GKtffc2spTe4ga2MHI5d75I5zVLRXqIzeIF+KdfKgUV9rqHqC
   zNrMJWlSahwstsSUJsMNLQWXA+4dIrzKXCZCOxO5tEbve22cubJ1jHyHH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="467264356"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="467264356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 16:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="697383715"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="697383715"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Sep 2023 16:57:16 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjq1K-0001Ux-0F;
	Fri, 22 Sep 2023 23:57:14 +0000
Date: Sat, 23 Sep 2023 07:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC v2 11/37] drm/connector: hdmi: Add Infoframes
 generation
Message-ID: <202309230741.hjj49ykL-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20230921 (https://download.01.org/0day-ci/archive/20230923/202309230741.hjj49ykL-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230741.hjj49ykL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309230741.hjj49ykL-lkp@intel.com/

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
