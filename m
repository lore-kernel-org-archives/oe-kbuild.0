Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E9BA2D
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 04:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730953319; cv=none; b=QRIYac7mP/qNpSRjI5Gp2UfoKBLZng7tNGHxoW/u75VO0u7EkyBNncBAc8oARWkdAf1KOToSHuSIwVASvY8l1axA+c39TDI8f14rHapjEBRz+bgp85OpG0jm5yfIveQMRD66F2xHdErVGDBHVx95SqcxUgD+TUubxmza0gahC4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730953319; c=relaxed/simple;
	bh=1tZ5cfMa58+RaGER39lpOk/e3W9w/e6yoYxzsbvHRI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAPyk51UN9Zh2mqG7Q9epF7L+J0CSAot5UJhzKgh/tSC/KZehU3rd/52NwqE4Ye20iS8Z4p4fSZIQKjU/rBwlaqOEVEczwCf4z/atu6f+KSHohvBOFJMu22FD1jlxij/0bezV3jnSRIBLJo74TepLD5XbFPImT9T4GIiC0xgrCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkWP5+qH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkWP5+qH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730953317; x=1762489317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1tZ5cfMa58+RaGER39lpOk/e3W9w/e6yoYxzsbvHRI8=;
  b=TkWP5+qH0e3DkBQiHLolaQwzYzAkQ6ISWtjZoGaUwJjjzNXF7bFj+rCB
   hWWe+deJ9OZZGnj/WwPaDCsnyjlEGh0DpyLW+8Jmzt8ZgXfhcXC15Jd6O
   P/nBYb2oGYfPajPWUiP4uH2qmhYhj/s17MkBM8hP8CLfJ2XxXjgAVUPUg
   pXx5tEvPo6jw3/v/3m0CLmr3NtN5JvSgdJmqan2Ogs/imDIrsjMfzZVlz
   Vq70yPmvM7M/eCuYJzgOI/HgrmYB744vYFxcwWhjfQuGIeZ86Ob09ziLc
   /e/lJXrVaT3ZbJGFFM8w8C1dYkSlwef6cjbaYhUBPp0pvZznkl46arGv+
   Q==;
X-CSE-ConnectionGUID: JfQSVv5eTuCwKanVKCFPbg==
X-CSE-MsgGUID: FkJ4TgPhSSGEM996CjbVUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34557135"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="34557135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 20:21:57 -0800
X-CSE-ConnectionGUID: twBUkFyfRAKnUugrBxpNtg==
X-CSE-MsgGUID: ivScjrG3QiCbU9Cyy+MjRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="89750894"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2024 20:21:56 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8u1p-000poy-0U;
	Thu, 07 Nov 2024 04:21:53 +0000
Date: Thu, 7 Nov 2024 12:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/2] drm/display/dsc: Refactor DRM MST DSC
 Determination Policy
Message-ID: <202411071102.0CMTIEIo-lkp@intel.com>
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
In-Reply-To: <20241106150444.424579-2-Jerry.Zuo@amd.com>
References: <20241106150444.424579-2-Jerry.Zuo@amd.com>
TO: Fangzhi Zuo <Jerry.Zuo@amd.com>
TO: dri-devel@lists.freedesktop.org
TO: amd-gfx@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org
TO: lyude@redhat.com
TO: jani.nikula@intel.com
TO: imre.deak@intel.com
TO: simona@ffwll.ch
TO: wayne.lin@amd.com
CC: harry.wentland@amd.com
CC: rodrigo.siqueira@amd.com
CC: Fangzhi Zuo <Jerry.Zuo@amd.com>

Hi Fangzhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master v6.12-rc6 next-20241106]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fangzhi-Zuo/drm-display-dsc-Refactor-DRM-MST-DSC-Determination-Policy/20241106-230854
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241106150444.424579-2-Jerry.Zuo%40amd.com
patch subject: [PATCH v3 1/2] drm/display/dsc: Refactor DRM MST DSC Determination Policy
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071102.0CMTIEIo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071102.0CMTIEIo-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_dp_mst_topology.c:6043 drm_dp_mst_dsc_aux_for_port() warn: variable dereferenced before check 'port' (see line 6033)

vim +/port +6043 drivers/gpu/drm/display/drm_dp_mst_topology.c

93cb4094a7fd30 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak     2024-04-17  6014  
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6015  /**
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6016   * drm_dp_mst_dsc_aux_for_port() - Find the correct aux for DSC
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6017   * @port: The port to check. A leaf of the MST tree with an attached display.
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6018   *
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6019   * Depending on the situation, DSC may be enabled via the endpoint aux,
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6020   * the immediately upstream aux, or the connector's physical aux.
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6021   *
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6022   * This is both the correct aux to read DSC_CAPABILITY and the
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6023   * correct aux to write DSC_ENABLED.
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6024   *
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6025   * This operation can be expensive (up to four aux reads), so
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6026   * the caller should cache the return.
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6027   *
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6028   * Returns:
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6029   * NULL if DSC cannot be enabled on this port, otherwise the aux device
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6030   */
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6031  struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6032  {
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06 @6033  	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6034  	struct drm_dp_mst_port *immediate_upstream_port = NULL;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6035  	struct drm_dp_mst_port *fec_port = NULL;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6036  	struct drm_dp_mst_port *dsc_port = NULL;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6037  	struct drm_dp_aux *upstream_aux;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6038  	bool end_has_dpcd = (port->dpcd_rev > 0);
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6039  	u8 endpoint_dsc = 0;
70a6587dca37a3 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak     2024-09-09  6040  	u8 upstream_dsc;
fd05275592ae07 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo   2024-11-06  6041  	u8 fec_cap;
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26  6042  
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis 2019-08-26 @6043  	if (!port)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
