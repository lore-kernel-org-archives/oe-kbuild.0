Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FD8433AB
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734901234; cv=none; b=h230TV5yetl80TUNEs/RMIWiCwDnNeZMp4/V/nr7o2teOygbz/v4XDyzFwGCUVLO6zEKUdX5Kii7rcWqWJTdcAry72rPAcQj2FHOtI6hdIYEJcW9mTWKmQrVRyKyiglFeHtDaFJ068orTytKc3VlrxbxoydXxCmg0uPgMxcqGA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734901234; c=relaxed/simple;
	bh=LP8KXWdb+a0D7rXcf0pdbkHeQU/4BlNCYBHGxp7jI6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=srHYpPQce6YrJ+/lQ1PKPH6XacOrEFJeB8Te0NPWmP2/ghKofUrhAgRgJ84RHuopBi8Qyy2w0u2iHgmqdSsndIZkjnzW28hip+557ex5tZi4kLFWIGl7Gq+c74keEI0SVnfJ9rBT74i8SOrOkzzI41mSVl5plNbn8KbYDEQ1VO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyEniKeE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyEniKeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734901233; x=1766437233;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LP8KXWdb+a0D7rXcf0pdbkHeQU/4BlNCYBHGxp7jI6c=;
  b=UyEniKeEg5SbiR+S6SfSxZnRawe0aydOKM38J1uNNMOsMHs6jJe6dNbJ
   2LdKAQYQfnNeLks94RSQsFEUNq/NzRqnugK86nlKgy6Nv+TTeDWthnGTM
   D/inV+q/YPqzHMTG+jhUmVw2plMQJ+cddpDJmYK5MdwPBlPRFL+0obTa9
   JZY7/NzEHjRirArhEL3elpd7XX63yhvqkdhDYOK0D3Ha7AiCITkBSPyMw
   FM4bmjMEc0rXN2C1ukSp/HaR1VkqK8wHr1MV638pLV/V+4/Cap5TzkSGx
   LcO1D8oOoDbPnMxArxhSVh9FaGhI9L/P9b734Lgy8IgykzwZE4Xqikbxv
   g==;
X-CSE-ConnectionGUID: 0B4CJRKWSkOCtnvRWZAQBw==
X-CSE-MsgGUID: KqI1ztq4RCmeLgydZ6jSkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35254598"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35254598"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 13:00:32 -0800
X-CSE-ConnectionGUID: XRm40J/xQ4G5ZIrHp48CFg==
X-CSE-MsgGUID: RKC+0X1XRzqvuT7uX6PWHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="99239588"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2024 13:00:30 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPT3s-0003BO-1n;
	Sun, 22 Dec 2024 21:00:28 +0000
Date: Mon, 23 Dec 2024 05:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/mediatek/mtk_dsi.c:1173 mtk_dsi_host_transfer()
 warn: check sign expansion for 'ret'
Message-ID: <202412230427.7IjBIZE5-lkp@intel.com>
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
head:   bcde95ce32b666478d6737219caa4f8005a8f201
commit: d2db0b8fd70bb216eb96ad1a32c158889e247c16 drm/mediatek: Allow build with COMPILE_TEST=y
date:   8 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-r073-20241219 (https://download.01.org/0day-ci/archive/20241223/202412230427.7IjBIZE5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412230427.7IjBIZE5-lkp@intel.com/

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
