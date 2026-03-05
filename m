Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF3D396584
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772719689; cv=none; b=thsUwzYcNopKFEzBQZWqQeITYw4JL7rO8aXnQluELEqs0Rs7GUwlh3bxhQMoufjJlxMcL0uQOUFIwzCCIHDNE91nCQQgIC/tQhhZM6yByOdhPNstC1Mdcm5qA+E5vIUzQSXpRuzlgU6jiASsWK1bpoTDp2MM48aVj/dwrSRuo9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772719689; c=relaxed/simple;
	bh=saRUzATVq3ixQ4hOielm7GAIbOS0d02Xyq/lqQRC2H4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Eq7QbbucSxOTbknOyIFL66pYdppw+EXSnKuYy/JOrjQZvgpgIa7y10/lDU5VXU7dCAW0N+Kwh5uK240K/YqsyAvzlRMP9PKuW2cOAK3ImYsfcbl8U0jQFrNsb1PGDKnLD4XJRxPFeyRMJWULJVF5tuc6948YvJj6nqQg7yV7t7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zpa70NW5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zpa70NW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772719687; x=1804255687;
  h=date:from:to:cc:subject:message-id;
  bh=saRUzATVq3ixQ4hOielm7GAIbOS0d02Xyq/lqQRC2H4=;
  b=Zpa70NW5OG1NKM6YiJWaigylf/8vlBkwI89tUkcNVH22TF55L+ILi2n5
   8N7Vnx0485Xa+oQukUOzdGp2oLa/ihTjuL0QnA00CQ8LZS1QYKk4/kxeG
   S4xejf8aZi1MGTiJZ1h16qZOmdvpuc35OIhemcLicawIAVDuRNSlwU4iT
   Egs3WXvQrPDp5v1l8VJ7UpHI/VYTAKr0SelGNVovt4Z/nVWkPHsPY44+7
   EaSo+RgN+Sqi6jfmej1AsQZt5/suldlcoQzM0ZYoJWIIN/k3YbOArGeYa
   5Xt94FYgTHakM6YD0sW8KMvgYT7dUronA8yXZHgn+RW5iYx0ST6Jh4hoz
   A==;
X-CSE-ConnectionGUID: UtZbEryORYG5oe4zTJXsFg==
X-CSE-MsgGUID: 6OBiK1P3T0eN67ArCr8/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="72834441"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="72834441"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:08:07 -0800
X-CSE-ConnectionGUID: EcQAS+1bRM+9ruHuN5vLWg==
X-CSE-MsgGUID: jFE0PNurTfCdn5Z8OW/iXw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 06:08:05 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy9Mx-000000000ic-0OKz;
	Thu, 05 Mar 2026 14:08:03 +0000
Date: Thu, 05 Mar 2026 22:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2966/3989]
 drivers/gpu/drm/bridge/waveshare-dsi.c:70:5-15: WARNING: Unsigned expression
 compared with zero: dsi -> lanes < 0
Message-ID: <202603052201.P6ZmB8VT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Joseph Guo <qijian.guo@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
commit: fca11428425e92bf21d4a7f5865708c5e64430e4 [2966/3989] drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r054-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052201.P6ZmB8VT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603052201.P6ZmB8VT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/waveshare-dsi.c:70:5-15: WARNING: Unsigned expression compared with zero: dsi -> lanes < 0

vim +70 drivers/gpu/drm/bridge/waveshare-dsi.c

dbdea37add132a Joseph Guo  2025-08-06  38  
dbdea37add132a Joseph Guo  2025-08-06  39  static int ws_bridge_attach_dsi(struct ws_bridge *ws)
dbdea37add132a Joseph Guo  2025-08-06  40  {
dbdea37add132a Joseph Guo  2025-08-06  41  	const struct mipi_dsi_device_info info = {
dbdea37add132a Joseph Guo  2025-08-06  42  		.type = "ws-bridge",
dbdea37add132a Joseph Guo  2025-08-06  43  		.channel = 0,
dbdea37add132a Joseph Guo  2025-08-06  44  		.node = NULL,
dbdea37add132a Joseph Guo  2025-08-06  45  	};
dbdea37add132a Joseph Guo  2025-08-06  46  	struct device_node *dsi_host_node;
dbdea37add132a Joseph Guo  2025-08-06  47  	struct device *dev = ws->dev;
dbdea37add132a Joseph Guo  2025-08-06  48  	struct mipi_dsi_device *dsi;
dbdea37add132a Joseph Guo  2025-08-06  49  	struct mipi_dsi_host *host;
dbdea37add132a Joseph Guo  2025-08-06  50  	int ret;
dbdea37add132a Joseph Guo  2025-08-06  51  
dbdea37add132a Joseph Guo  2025-08-06  52  	dsi_host_node = of_graph_get_remote_node(dev->of_node, 0, 0);
dbdea37add132a Joseph Guo  2025-08-06  53  	if (!dsi_host_node) {
dbdea37add132a Joseph Guo  2025-08-06  54  		dev_err(dev, "Failed to get remote port\n");
dbdea37add132a Joseph Guo  2025-08-06  55  		return -ENODEV;
dbdea37add132a Joseph Guo  2025-08-06  56  	}
dbdea37add132a Joseph Guo  2025-08-06  57  	host = of_find_mipi_dsi_host_by_node(dsi_host_node);
dbdea37add132a Joseph Guo  2025-08-06  58  	of_node_put(dsi_host_node);
dbdea37add132a Joseph Guo  2025-08-06  59  	if (!host)
dbdea37add132a Joseph Guo  2025-08-06  60  		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to find dsi_host\n");
dbdea37add132a Joseph Guo  2025-08-06  61  
dbdea37add132a Joseph Guo  2025-08-06  62  	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
dbdea37add132a Joseph Guo  2025-08-06  63  	if (IS_ERR(dsi))
dbdea37add132a Joseph Guo  2025-08-06  64  		return dev_err_probe(dev, PTR_ERR(dsi), "Failed to create dsi device\n");
dbdea37add132a Joseph Guo  2025-08-06  65  
dbdea37add132a Joseph Guo  2025-08-06  66  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
dbdea37add132a Joseph Guo  2025-08-06  67  			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
dbdea37add132a Joseph Guo  2025-08-06  68  	dsi->format = MIPI_DSI_FMT_RGB888;
fca11428425e92 Marek Vasut 2026-01-15  69  	dsi->lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
fca11428425e92 Marek Vasut 2026-01-15 @70  	if (dsi->lanes < 0) {
fca11428425e92 Marek Vasut 2026-01-15  71  		dev_warn(dev, "Invalid or missing DSI lane count %d, falling back to 2 lanes\n",
fca11428425e92 Marek Vasut 2026-01-15  72  			 dsi->lanes);
fca11428425e92 Marek Vasut 2026-01-15  73  		dsi->lanes = 2;	/* Old DT backward compatibility */
fca11428425e92 Marek Vasut 2026-01-15  74  	}
dbdea37add132a Joseph Guo  2025-08-06  75  
dbdea37add132a Joseph Guo  2025-08-06  76  	ret = devm_mipi_dsi_attach(dev, dsi);
dbdea37add132a Joseph Guo  2025-08-06  77  	if (ret < 0)
dbdea37add132a Joseph Guo  2025-08-06  78  		return dev_err_probe(dev, ret, "Failed to attach dsi to host\n");
dbdea37add132a Joseph Guo  2025-08-06  79  
dbdea37add132a Joseph Guo  2025-08-06  80  	return 0;
dbdea37add132a Joseph Guo  2025-08-06  81  }
dbdea37add132a Joseph Guo  2025-08-06  82  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
