Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981C2184
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 02:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727059573; cv=none; b=bRY5IkmtJNVW5N/xi7MyA7Q9OaY/qUJ2vKJB1HJDhhExQXdtDtm9TwfeF7DqYNEQocXjYIONTimcpjJn3asnn2GuaOz84986XAHHETfkQW7JuHJdiTczA7QTrRatY5SrYhau2fGXhYwJbMM7cxZc5sUGgdEJFE2WAwz/xJ8Dddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727059573; c=relaxed/simple;
	bh=oxSRAVAXCS3FmqPLfTCKyj8/qiEiujGjLd/732JDEOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sy9WwMN2sIwyMaEMlidGJ0fRmiNKfveJb0YVmrX02MXPYTOqARNEr7tQU6MXw5GdcS4Q7E6geXcSJ2G0B5o3uYo14K89UBWFUl04t3A5oxlzIONvch5Q4WA/EFR/EluHJnjV10JOlBF+b3u0pkbfoRJ8BwzFrd8bMaAh2sALM/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giFKFtIF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giFKFtIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727059572; x=1758595572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oxSRAVAXCS3FmqPLfTCKyj8/qiEiujGjLd/732JDEOI=;
  b=giFKFtIF9K/+7ATGBYBXjbPPRxdp62zT+iLo/hUZiIaWViWrTBf9JVYJ
   8V0v43fmeOhpE1hx/jX6sEKTkksdt7QexmbnPORzMwD+S+qBF6j38XA4U
   0+dnmxpjtryDUPQrrr0I3/aTYBI9dRjHQfnFeeMmuqWsbL21bpMd8CEcl
   G+OWYTAndd9Cfn0awxJDu7NKUOD4d+ULGgfYtHKUnLPG1FJ5VsTHe0JuR
   4WgDYyRi3Tav/ssFvuD/cFE80sogm6Wq48CGeQ/Cac5YAvo3G9iTE1ef3
   S7PgtZ2qR+JxtYMlwvtEHYl2NptFU4RL879yiMu2NlWq26yoFkAiXf29O
   Q==;
X-CSE-ConnectionGUID: GarnFzN+SAmFJse1xPpcxg==
X-CSE-MsgGUID: da3W0QaARXKCCitvMbx2eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="13631833"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="13631833"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 19:46:11 -0700
X-CSE-ConnectionGUID: 7cXs3XTkSiWuab3+IotrAw==
X-CSE-MsgGUID: o5Zd1ireT8OmS5e1SmiVfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75477183"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2024 19:46:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssZ5T-000Gq2-1u;
	Mon, 23 Sep 2024 02:46:07 +0000
Date: Mon, 23 Sep 2024 10:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/display/dsc: Refactor MST DSC Determination Policy
Message-ID: <202409231002.bMP89Ipm-lkp@intel.com>
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
In-Reply-To: <20240919173944.256887-1-Jerry.Zuo@amd.com>
References: <20240919173944.256887-1-Jerry.Zuo@amd.com>
TO: Fangzhi Zuo <Jerry.Zuo@amd.com>
TO: dri-devel@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org
TO: amd-gfx@lists.freedesktop.org
TO: lyude@redhat.com
TO: jani.nikula@intel.com
TO: imre.deak@intel.com
TO: simona@ffwll.ch
TO: wayne.lin@amd.com
TO: Harry.Wentland@amd.com
TO: rodrigo.siqueira@amd.com
CC: Fangzhi Zuo <Jerry.Zuo@amd.com>

Hi Fangzhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm/drm-next linus/master]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip drm-exynos/exynos-drm-next drm-misc/drm-misc-next v6.11 next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fangzhi-Zuo/drm-display-dsc-Refactor-MST-DSC-Determination-Policy/20240920-014114
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240919173944.256887-1-Jerry.Zuo%40amd.com
patch subject: [PATCH] drm/display/dsc: Refactor MST DSC Determination Policy
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: microblaze-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409231002.bMP89Ipm-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409231002.bMP89Ipm-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_dp_mst_topology.c:6046 drm_dp_mst_dsc_aux_for_port() warn: variable dereferenced before check 'port' (see line 6035)

vim +/port +6046 drivers/gpu/drm/display/drm_dp_mst_topology.c

93cb4094a7fd30 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2024-04-17  6015  
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6016  /**
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6017   * drm_dp_mst_dsc_aux_for_port() - Find the correct aux for DSC
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6018   * @port: The port to check. A leaf of the MST tree with an attached display.
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6019   *
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6020   * Depending on the situation, DSC may be enabled via the endpoint aux,
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6021   * the immediately upstream aux, or the connector's physical aux.
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6022   *
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6023   * This is both the correct aux to read DSC_CAPABILITY and the
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6024   * correct aux to write DSC_ENABLED.
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6025   *
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6026   * This operation can be expensive (up to four aux reads), so
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6027   * the caller should cache the return.
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6028   *
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6029   * port->dsc_aux - point for dsc decompression
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6030   * port->dsc_passthrough_aux - point for dsc passthrough
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6031   *
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6032   */
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6033  void drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6034  {
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19 @6035  	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6036  	struct drm_dp_mst_port *immediate_upstream_port = NULL;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6037  	struct drm_dp_mst_port *fec_port = NULL;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6038  	struct drm_dp_mst_port *dsc_port = NULL;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6039  	struct drm_dp_aux *upstream_aux;
53965dbe5396d2 drivers/gpu/drm/drm_dp_mst_topology.c         Paul E. McKenney 2020-02-19  6040  	struct drm_dp_desc desc = {};
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6041  	bool end_has_dpcd = (port->dpcd_rev > 0);
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6042  	u8 endpoint_dsc = 0;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6043  	u8 upstream_dsc;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6044  	u8 fec_cap;
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6045  
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26 @6046  	if (!port)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
