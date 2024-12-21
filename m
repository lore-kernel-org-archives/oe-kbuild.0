Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3823F163
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 00:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734739655; cv=none; b=U9DedaGRdK9+nPKXcNXAUe/hJFx9+VhwEfKlKpQbuIuykqgaOaYcS6rvOACCCm/Y0i1GnGTrzU/Oca4U5ZUJxWfoVbGieRL2JibW7R4JA1LMUJ+1kzvEGRAiOlEaIj+/iA8prA5H+OXmhb4KUp+5R5DmEUlv6gTj7f2eeXhQzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734739655; c=relaxed/simple;
	bh=LnGARxLnswtbLlmBvexFlTrrPJj1iu/mdq/XqVM/8o4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DcOSPMRkslUqiCd4yhKUFraaDjnwicR+lVQUFdQth3JNGVeNrZkaDePfAxhX6WDAi5XdFrM7lX6/LStZkBqR90nXGui7sUcEPmRDMnzYa+hA5SEVuHQxhq60K+gLnf9gRrBFFdMAGJT6s6Xw4qEgg9xFiNXrxXPdikqQ8ukN+tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=me3+O3Gz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="me3+O3Gz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734739654; x=1766275654;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LnGARxLnswtbLlmBvexFlTrrPJj1iu/mdq/XqVM/8o4=;
  b=me3+O3GzmDNTIP8A+Vr+9bHoK8tp2EwUQxoG9qwxz0VTY5ZUI8FdYGgX
   I7XOx0+yu8RPZcig8JE9qAmxqHal8IQ2ZPgTmujQPUt8GjDWil3vrLaVG
   FtC6LnQ7kM0SAQkUo58ubJ2AyJJojiggeQIl5oBVur4+WF9ua+y4EJyTu
   LUAf8Zns/In+D0j0ZcIlk3tWh8O0jht6HLA0wOYzxu5ncC+3MvirskorL
   6L2TIyuxFoMuFRyK8F3o/QLeyRiuKBxGCYBpc0+1G5vVATBGZH9XD4RYU
   5Zqka9s3fsXOOjMas5CW8GfKpghcrj/TVRdm3r7ldK2PR1Cv2oFqeAmYJ
   g==;
X-CSE-ConnectionGUID: YRdyydBQRC+J1QnmLok9vg==
X-CSE-MsgGUID: VpgJt6vuSVyASiEI14oeVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35179465"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="35179465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 16:07:33 -0800
X-CSE-ConnectionGUID: YQuFmPFNRqqw5vFdC2aKeA==
X-CSE-MsgGUID: advK+4v3Tvqlo7Z0SjOMQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99119312"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2024 16:07:31 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOn1k-0001nO-22;
	Sat, 21 Dec 2024 00:07:28 +0000
Date: Sat, 21 Dec 2024 08:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/mediatek/mtk_dsi.c:1173 mtk_dsi_host_transfer()
 warn: check sign expansion for 'ret'
Message-ID: <202412210801.iADw0oIH-lkp@intel.com>
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
head:   e9b8ffafd20ad21357a789cc58ffaa162b3ad074
commit: d2db0b8fd70bb216eb96ad1a32c158889e247c16 drm/mediatek: Allow build with COMPILE_TEST=y
date:   8 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-r073-20241219 (https://download.01.org/0day-ci/archive/20241221/202412210801.iADw0oIH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412210801.iADw0oIH-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/mediatek/mtk_dsi.c:1173 mtk_dsi_host_transfer() warn: check sign expansion for 'ret'

vim +/ret +1173 drivers/gpu/drm/mediatek/mtk_dsi.c

21898816831fc60 shaoming chen  2017-03-31  1105  
21898816831fc60 shaoming chen  2017-03-31  1106  static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
21898816831fc60 shaoming chen  2017-03-31  1107  				     const struct mipi_dsi_msg *msg)
21898816831fc60 shaoming chen  2017-03-31  1108  {
21898816831fc60 shaoming chen  2017-03-31  1109  	struct mtk_dsi *dsi = host_to_dsi(host);
21898816831fc60 shaoming chen  2017-03-31  1110  	u32 recv_cnt, i;
21898816831fc60 shaoming chen  2017-03-31  1111  	u8 read_data[16];
21898816831fc60 shaoming chen  2017-03-31  1112  	void *src_addr;
21898816831fc60 shaoming chen  2017-03-31  1113  	u8 irq_flag = CMD_DONE_INT_FLAG;
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1114  	u32 dsi_mode;
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1115  	int ret;
21898816831fc60 shaoming chen  2017-03-31  1116  
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1117  	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1118  	if (dsi_mode & MODE) {
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1119  		mtk_dsi_stop(dsi);
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1120  		ret = mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1121  		if (ret)
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1122  			goto restore_dsi_mode;
21898816831fc60 shaoming chen  2017-03-31  1123  	}
21898816831fc60 shaoming chen  2017-03-31  1124  
21898816831fc60 shaoming chen  2017-03-31  1125  	if (MTK_DSI_HOST_IS_READ(msg->type))
21898816831fc60 shaoming chen  2017-03-31  1126  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
21898816831fc60 shaoming chen  2017-03-31  1127  
39e8d062b03c3dc Jitao Shi      2022-05-20  1128  	mtk_dsi_lane_ready(dsi);
39e8d062b03c3dc Jitao Shi      2022-05-20  1129  
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1130  	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1131  	if (ret)
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1132  		goto restore_dsi_mode;
21898816831fc60 shaoming chen  2017-03-31  1133  
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1134  	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1135  		recv_cnt = 0;
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1136  		goto restore_dsi_mode;
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1137  	}
21898816831fc60 shaoming chen  2017-03-31  1138  
21898816831fc60 shaoming chen  2017-03-31  1139  	if (!msg->rx_buf) {
21898816831fc60 shaoming chen  2017-03-31  1140  		DRM_ERROR("dsi receive buffer size may be NULL\n");
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1141  		ret = -EINVAL;
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1142  		goto restore_dsi_mode;
21898816831fc60 shaoming chen  2017-03-31  1143  	}
21898816831fc60 shaoming chen  2017-03-31  1144  
21898816831fc60 shaoming chen  2017-03-31  1145  	for (i = 0; i < 16; i++)
21898816831fc60 shaoming chen  2017-03-31  1146  		*(read_data + i) = readb(dsi->regs + DSI_RX_DATA0 + i);
21898816831fc60 shaoming chen  2017-03-31  1147  
21898816831fc60 shaoming chen  2017-03-31  1148  	recv_cnt = mtk_dsi_recv_cnt(read_data[0], read_data);
21898816831fc60 shaoming chen  2017-03-31  1149  
21898816831fc60 shaoming chen  2017-03-31  1150  	if (recv_cnt > 2)
21898816831fc60 shaoming chen  2017-03-31  1151  		src_addr = &read_data[4];
21898816831fc60 shaoming chen  2017-03-31  1152  	else
21898816831fc60 shaoming chen  2017-03-31  1153  		src_addr = &read_data[1];
21898816831fc60 shaoming chen  2017-03-31  1154  
21898816831fc60 shaoming chen  2017-03-31  1155  	if (recv_cnt > 10)
21898816831fc60 shaoming chen  2017-03-31  1156  		recv_cnt = 10;
21898816831fc60 shaoming chen  2017-03-31  1157  
21898816831fc60 shaoming chen  2017-03-31  1158  	if (recv_cnt > msg->rx_len)
21898816831fc60 shaoming chen  2017-03-31  1159  		recv_cnt = msg->rx_len;
21898816831fc60 shaoming chen  2017-03-31  1160  
21898816831fc60 shaoming chen  2017-03-31  1161  	if (recv_cnt)
21898816831fc60 shaoming chen  2017-03-31  1162  		memcpy(msg->rx_buf, src_addr, recv_cnt);
21898816831fc60 shaoming chen  2017-03-31  1163  
21898816831fc60 shaoming chen  2017-03-31  1164  	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
21898816831fc60 shaoming chen  2017-03-31  1165  		 recv_cnt, *((u8 *)(msg->tx_buf)));
21898816831fc60 shaoming chen  2017-03-31  1166  
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1167  restore_dsi_mode:
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1168  	if (dsi_mode & MODE) {
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1169  		mtk_dsi_set_mode(dsi);
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1170  		mtk_dsi_start(dsi);
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1171  	}
81cc7e51c4f1686 Julien STEPHAN 2022-02-14  1172  
81cc7e51c4f1686 Julien STEPHAN 2022-02-14 @1173  	return ret < 0 ? ret : recv_cnt;
21898816831fc60 shaoming chen  2017-03-31  1174  }
21898816831fc60 shaoming chen  2017-03-31  1175  

:::::: The code at line 1173 was first introduced by commit
:::::: 81cc7e51c4f1686b71e30046437056ece6b2cb4d drm/mediatek: Allow commands to be sent during video mode

:::::: TO: Julien STEPHAN <jstephan@baylibre.com>
:::::: CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
