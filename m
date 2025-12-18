Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA931BC41
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 07:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041966; cv=none; b=hjHWHqSYr7H39bnYAgWu7TtedXjz8aZtHqPytHKlcCB8FsNEi9V8wcstCaofiXyHdFLcdhAz4F3bayqRtz3DjQwAjYgBSWhPplz9AmBabSgY13mNgVMM14jHUSDKccAfEu2i4bOHz9YBsATlgKs3VBJXW5TQgq441xJICOLk9cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041966; c=relaxed/simple;
	bh=DEY39JN/OODo3Mg1u+B7QQ3xm5mnSt1g8pJh7HRi7y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+40YTYFMigvx2Mt7vtIuKjox96Qv7sOsvS3lOVVApFsu3vmxd9DuJ1gOv9zP1m8hK0Ri13093Z7gk0q6dHHCb+FBC8UFGWRYdhtMigtzY5UNF9A08CPMRAJmQQiBJ0X/rN5mV/Zq5NVh7XFrzBH5n2yJ/gt+836kB4KHc7nDt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyY9GTyz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyY9GTyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766041965; x=1797577965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEY39JN/OODo3Mg1u+B7QQ3xm5mnSt1g8pJh7HRi7y8=;
  b=XyY9GTyz/POdcoXBeTU4ZuFSbKSX1h2Joulh5sd/HcrI7qkzQGR6hNL2
   UT4ZFZdmJQcFaMMPhAnv1CJlx1+LC+QEMOWvTKp1kjv5tk9EXSVMip/Dm
   kDW2hHkAllc7JAAL8qmjoQjAijRb4aUmUvRX0RGcdaaMIz1HQgZkXstdc
   Y0cIHlwsUUdFtnIHVi/+MEVtNmSpbBih41XfRbVM1bF0fOzvMsCBPz2ao
   spDe9kUN4o36iiU26I8rAQkbN9tj1rZ44oBoFcMyZq0lgXHhLrbekokFz
   7i2gB9igY3oU/9jR5unK0NoJd4Xc/RgRB4STtJxgyLSuQeCZpnpQcU/BB
   Q==;
X-CSE-ConnectionGUID: k1ls/43PQbW5URExjy3xuw==
X-CSE-MsgGUID: 6XHTTdqkS46/ztE1HGwc9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67927744"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67927744"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 23:12:44 -0800
X-CSE-ConnectionGUID: GW4Qk5CKSJyN3r3BCbOtGQ==
X-CSE-MsgGUID: WE7XZ0aVRWGhSl9VtGtMMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198400414"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Dec 2025 23:12:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW8Bk-000000001jJ-1AzH;
	Thu, 18 Dec 2025 07:12:40 +0000
Date: Thu, 18 Dec 2025 15:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:1145
 dw_hdmi_qp_cec_transmit() error: uninitialized symbol 'val'.
Message-ID: <202512181533.xjkLBv2s-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Algea Cao <algea.cao@rock-chips.com>
CC: Derek Foreman <derek.foreman@collabora.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: e4a2d54a2f1a9c9a1971651832c8f0ad9d3782c4 drm/bridge: dw-hdmi-qp: Add CEC support
date:   9 weeks ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 weeks ago
config: s390-randconfig-r071-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181533.xjkLBv2s-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512181533.xjkLBv2s-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:1145 dw_hdmi_qp_cec_transmit() error: uninitialized symbol 'val'.

vim +/val +1145 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c

e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1126  
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1127  static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1128  				   u32 signal_free_time, struct cec_msg *msg)
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1129  {
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1130  	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1131  	unsigned int i;
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1132  	u32 val;
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1133  
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1134  	for (i = 0; i < msg->len; i++) {
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1135  		if (!(i % 4))
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1136  			val = msg->msg[i];
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1137  		if ((i % 4) == 1)
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1138  			val |= msg->msg[i] << 8;
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1139  		if ((i % 4) == 2)
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1140  			val |= msg->msg[i] << 16;
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1141  		if ((i % 4) == 3)
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1142  			val |= msg->msg[i] << 24;
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1143  
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1144  		if (i == (msg->len - 1) || (i % 4) == 3)
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03 @1145  			dw_hdmi_qp_write(hdmi, val, CEC_TX_DATA3_0 + (i / 4) * 4);
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1146  	}
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1147  
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1148  	dw_hdmi_qp_write(hdmi, msg->len - 1, CEC_TX_COUNT);
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1149  	dw_hdmi_qp_write(hdmi, CEC_CTRL_START, CEC_TX_CONTROL);
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1150  
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1151  	return 0;
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1152  }
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1153  #else
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1154  #define dw_hdmi_qp_cec_init NULL
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1155  #define dw_hdmi_qp_cec_enable NULL
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1156  #define dw_hdmi_qp_cec_log_addr NULL
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1157  #define dw_hdmi_qp_cec_transmit NULL
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1158  #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
e4a2d54a2f1a9c Cristian Ciocaltea 2025-09-03  1159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
