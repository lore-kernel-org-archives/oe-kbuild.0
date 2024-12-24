Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C906117996
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Dec 2024 23:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735083269; cv=none; b=hAV6mjk082M16sbMwrUHAcn1m0tTtwZ68dEXgvI+Qz6Pt1au51YWDyM7kJXjan1kTg50MKA8/R6oC8n7Idp7HdHUC/xc9Yc52lLTGz1GFi//fOMSGKqGKwMa9p6smRHG1TFSxYY6OBO0cpo4jBDargG5Ws5MfPRhdNSXXHkQnns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735083269; c=relaxed/simple;
	bh=fHErgxcYc8xd9HSiDfOa55BB0ZA7e5W0DI/Y9dxRYsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g4imZygZCsIHE8aJCORs+184Q/O95BRHfP/iTfcbR7ZahMlRBI5q9PpN3wHNwNIux36S3M8mIH9pm0Padhr0OdufvlndcXXYr5KwKfKtOIUjiHeXjdHeeUEJHyNRpCPSAHn72uOuFyC7oOoVgQCocBuNWvvX//t65Yu1uVj3Xnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/rXbCk4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/rXbCk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735083268; x=1766619268;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fHErgxcYc8xd9HSiDfOa55BB0ZA7e5W0DI/Y9dxRYsM=;
  b=V/rXbCk4HtbM9VguzE1LCz+bbXBtPAzI9m6O9TcCG01hwoNPGgcstyqK
   9fKrPa/nPgW05yZXWR+HiTc36EFsBDGC4NYHr6MTO3hakMMI/FTyQWYZs
   sK6Iz6T3x1gXS+qWBjhtimdJJPTBUS10FT4rbuNfQ5i2wtayPDSYLjH5P
   MkLVySEQJE0VIcygQqBRfjpnBueCqcG10EQmA7dCqVcoQJbKmDaMU77uA
   8gpzzaei7KRYXDGQXFn5boZ8lwpqetxSSJZ9VyRODz+D7yTDoutN8yOpW
   CYli5a9yBp5JUbSReLNpqyH7T81JlxjkwqxLCRQHCWG/jNjcbIHIugTPb
   g==;
X-CSE-ConnectionGUID: jJX7FALvSDmTbB44y4bZjg==
X-CSE-MsgGUID: wE/W/n74Sl+HJgvbsnr46w==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35666607"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="35666607"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 15:34:26 -0800
X-CSE-ConnectionGUID: j0zbzgFUSeyDlDous8GLMw==
X-CSE-MsgGUID: y++BOlIuTxyXT00KVyX4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100057213"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Dec 2024 15:34:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQEPu-0001X6-2y;
	Tue, 24 Dec 2024 23:34:22 +0000
Date: Wed, 25 Dec 2024 07:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/mediatek/mtk_dsi.c:1173 mtk_dsi_host_transfer()
 warn: check sign expansion for 'ret'
Message-ID: <202412250704.SHuB9Vq8-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: CK Hu <ck.hu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
commit: d2db0b8fd70bb216eb96ad1a32c158889e247c16 drm/mediatek: Allow build with COMPILE_TEST=y
date:   9 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 weeks ago
config: s390-randconfig-r073-20241219 (https://download.01.org/0day-ci/archive/20241225/202412250704.SHuB9Vq8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412250704.SHuB9Vq8-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/mediatek/mtk_dsi.c:1173 mtk_dsi_host_transfer() warn: check sign expansion for 'ret'

vim +/ret +1173 drivers/gpu/drm/mediatek/mtk_dsi.c

21898816831fc6 shaoming chen  2017-03-31  1105  
21898816831fc6 shaoming chen  2017-03-31  1106  static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
21898816831fc6 shaoming chen  2017-03-31  1107  				     const struct mipi_dsi_msg *msg)
21898816831fc6 shaoming chen  2017-03-31  1108  {
21898816831fc6 shaoming chen  2017-03-31  1109  	struct mtk_dsi *dsi = host_to_dsi(host);
21898816831fc6 shaoming chen  2017-03-31  1110  	u32 recv_cnt, i;
21898816831fc6 shaoming chen  2017-03-31  1111  	u8 read_data[16];
21898816831fc6 shaoming chen  2017-03-31  1112  	void *src_addr;
21898816831fc6 shaoming chen  2017-03-31  1113  	u8 irq_flag = CMD_DONE_INT_FLAG;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1114  	u32 dsi_mode;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1115  	int ret;
21898816831fc6 shaoming chen  2017-03-31  1116  
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1117  	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1118  	if (dsi_mode & MODE) {
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1119  		mtk_dsi_stop(dsi);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1120  		ret = mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1121  		if (ret)
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1122  			goto restore_dsi_mode;
21898816831fc6 shaoming chen  2017-03-31  1123  	}
21898816831fc6 shaoming chen  2017-03-31  1124  
21898816831fc6 shaoming chen  2017-03-31  1125  	if (MTK_DSI_HOST_IS_READ(msg->type))
21898816831fc6 shaoming chen  2017-03-31  1126  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
21898816831fc6 shaoming chen  2017-03-31  1127  
39e8d062b03c3d Jitao Shi      2022-05-20  1128  	mtk_dsi_lane_ready(dsi);
39e8d062b03c3d Jitao Shi      2022-05-20  1129  
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1130  	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1131  	if (ret)
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1132  		goto restore_dsi_mode;
21898816831fc6 shaoming chen  2017-03-31  1133  
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1134  	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1135  		recv_cnt = 0;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1136  		goto restore_dsi_mode;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1137  	}
21898816831fc6 shaoming chen  2017-03-31  1138  
21898816831fc6 shaoming chen  2017-03-31  1139  	if (!msg->rx_buf) {
21898816831fc6 shaoming chen  2017-03-31  1140  		DRM_ERROR("dsi receive buffer size may be NULL\n");
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1141  		ret = -EINVAL;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1142  		goto restore_dsi_mode;
21898816831fc6 shaoming chen  2017-03-31  1143  	}
21898816831fc6 shaoming chen  2017-03-31  1144  
21898816831fc6 shaoming chen  2017-03-31  1145  	for (i = 0; i < 16; i++)
21898816831fc6 shaoming chen  2017-03-31  1146  		*(read_data + i) = readb(dsi->regs + DSI_RX_DATA0 + i);
21898816831fc6 shaoming chen  2017-03-31  1147  
21898816831fc6 shaoming chen  2017-03-31  1148  	recv_cnt = mtk_dsi_recv_cnt(read_data[0], read_data);
21898816831fc6 shaoming chen  2017-03-31  1149  
21898816831fc6 shaoming chen  2017-03-31  1150  	if (recv_cnt > 2)
21898816831fc6 shaoming chen  2017-03-31  1151  		src_addr = &read_data[4];
21898816831fc6 shaoming chen  2017-03-31  1152  	else
21898816831fc6 shaoming chen  2017-03-31  1153  		src_addr = &read_data[1];
21898816831fc6 shaoming chen  2017-03-31  1154  
21898816831fc6 shaoming chen  2017-03-31  1155  	if (recv_cnt > 10)
21898816831fc6 shaoming chen  2017-03-31  1156  		recv_cnt = 10;
21898816831fc6 shaoming chen  2017-03-31  1157  
21898816831fc6 shaoming chen  2017-03-31  1158  	if (recv_cnt > msg->rx_len)
21898816831fc6 shaoming chen  2017-03-31  1159  		recv_cnt = msg->rx_len;
21898816831fc6 shaoming chen  2017-03-31  1160  
21898816831fc6 shaoming chen  2017-03-31  1161  	if (recv_cnt)
21898816831fc6 shaoming chen  2017-03-31  1162  		memcpy(msg->rx_buf, src_addr, recv_cnt);
21898816831fc6 shaoming chen  2017-03-31  1163  
21898816831fc6 shaoming chen  2017-03-31  1164  	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
21898816831fc6 shaoming chen  2017-03-31  1165  		 recv_cnt, *((u8 *)(msg->tx_buf)));
21898816831fc6 shaoming chen  2017-03-31  1166  
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1167  restore_dsi_mode:
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1168  	if (dsi_mode & MODE) {
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1169  		mtk_dsi_set_mode(dsi);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1170  		mtk_dsi_start(dsi);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1171  	}
81cc7e51c4f168 Julien STEPHAN 2022-02-14  1172  
81cc7e51c4f168 Julien STEPHAN 2022-02-14 @1173  	return ret < 0 ? ret : recv_cnt;
21898816831fc6 shaoming chen  2017-03-31  1174  }
21898816831fc6 shaoming chen  2017-03-31  1175  

:::::: The code at line 1173 was first introduced by commit
:::::: 81cc7e51c4f1686b71e30046437056ece6b2cb4d drm/mediatek: Allow commands to be sent during video mode

:::::: TO: Julien STEPHAN <jstephan@baylibre.com>
:::::: CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
