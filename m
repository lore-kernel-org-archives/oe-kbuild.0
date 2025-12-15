Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D529B764
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765826706; cv=none; b=t2EgREz1gB+lnVXFIijElp6+LvPXMxSdrsT4c0q0eFqiTwE4a0482GJWQpTWzuBJ7C45/BYyGtCw5IkG+2SGUU++8xi5qYEz37OE9nqkQ/MNJnXEveiczc1hJlRty02g/AvgMv86ZXCd/kyXwQWoXFBZY0a2G/DFSV27dovphF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765826706; c=relaxed/simple;
	bh=1ct78l+GRlBw7VgGgkjMBBlFQO/1NVZl42FmRIBnhw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q28CHysyEJXbRohVNWvhTDFjFdw59kjljU2u9suFdV8B3JS36IS6VooX9wWiqVPxpeX04HNh3DsAfXIle+KYdLbFjMhZDhSllzCjhaNnxvvOwRPSwhAdEFQIgr//tc2uw1JIfiXHw8Bujahe1cOvtbOm/A6YiuTbGJHBFGR6yso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFR33k2J; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFR33k2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765826704; x=1797362704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ct78l+GRlBw7VgGgkjMBBlFQO/1NVZl42FmRIBnhw4=;
  b=fFR33k2JdVrK1kIbcHRVHrHw/G7DQRrkekHLP7pKgpcLaYDxh08hO026
   ck83U4upoDzfMqaOWDxKb0VXuVEob+10u9NT+69+26n+ycpkSqZGPhzZ2
   QsJtAf/VBuCqDn2KXFdFDjUPCFAL78Yko4udJqmtZ/v3SEBVJT80BQvJ1
   hhYLntxJVQXyg1SEJ2mlsR1A6zsUY66iFRneBd7H9BxNH2Qjl3CjZmks0
   BjhmplwI0lhnwxNOMUfuqsVSjdtP/MEx4hGtxEj1JUYqXolmLx/xa6URa
   1f8pVxJhQkPjAI7hFNDgN4c0hJ6dwyIn3OSp7Vo4zuwXirAciesIEWFE/
   Q==;
X-CSE-ConnectionGUID: /FmW+53hReePR4t7mgo2Nw==
X-CSE-MsgGUID: gP87ESmRQhmfEZAVFmPmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67808960"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67808960"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 11:25:03 -0800
X-CSE-ConnectionGUID: wmWmXd8hTqemBvNcX7WrIQ==
X-CSE-MsgGUID: 2+0b+p2bRd+8gw94SIcKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197795101"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2025 11:25:02 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVEBn-000000000fB-1Yjx;
	Mon, 15 Dec 2025 19:24:59 +0000
Date: Tue, 16 Dec 2025 03:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:1521
 rk3568_vop2_setup_layer_mixer() error: uninitialized symbol 'old_win'.
Message-ID: <202512160328.WKIDuasI-lkp@intel.com>
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
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 328e6885996ca2c6eb8b07d3c9bb1439fdcb088f drm/rockchip: vop2: Add platform specific callback
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r071-20251214 (https://download.01.org/0day-ci/archive/20251216/202512160328.WKIDuasI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160328.WKIDuasI-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:1521 rk3568_vop2_setup_layer_mixer() error: uninitialized symbol 'old_win'.

vim +/old_win +1521 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c

328e6885996ca2 Andy Yan 2025-02-18  1393  
328e6885996ca2 Andy Yan 2025-02-18  1394  static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
328e6885996ca2 Andy Yan 2025-02-18  1395  {
328e6885996ca2 Andy Yan 2025-02-18  1396  	struct vop2 *vop2 = vp->vop2;
328e6885996ca2 Andy Yan 2025-02-18  1397  	struct drm_plane *plane;
328e6885996ca2 Andy Yan 2025-02-18  1398  	u32 layer_sel = 0;
328e6885996ca2 Andy Yan 2025-02-18  1399  	u32 port_sel;
328e6885996ca2 Andy Yan 2025-02-18  1400  	u8 layer_id;
328e6885996ca2 Andy Yan 2025-02-18  1401  	u8 old_layer_id;
328e6885996ca2 Andy Yan 2025-02-18  1402  	u8 layer_sel_id;
328e6885996ca2 Andy Yan 2025-02-18  1403  	unsigned int ofs;
328e6885996ca2 Andy Yan 2025-02-18  1404  	u32 ovl_ctrl;
328e6885996ca2 Andy Yan 2025-02-18  1405  	int i;
328e6885996ca2 Andy Yan 2025-02-18  1406  	struct vop2_video_port *vp0 = &vop2->vps[0];
328e6885996ca2 Andy Yan 2025-02-18  1407  	struct vop2_video_port *vp1 = &vop2->vps[1];
328e6885996ca2 Andy Yan 2025-02-18  1408  	struct vop2_video_port *vp2 = &vop2->vps[2];
328e6885996ca2 Andy Yan 2025-02-18  1409  	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(vp->crtc.state);
328e6885996ca2 Andy Yan 2025-02-18  1410  
328e6885996ca2 Andy Yan 2025-02-18  1411  	ovl_ctrl = vop2_readl(vop2, RK3568_OVL_CTRL);
328e6885996ca2 Andy Yan 2025-02-18  1412  	ovl_ctrl |= RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD;
328e6885996ca2 Andy Yan 2025-02-18  1413  	if (vcstate->yuv_overlay)
328e6885996ca2 Andy Yan 2025-02-18  1414  		ovl_ctrl |= RK3568_OVL_CTRL__YUV_MODE(vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1415  	else
328e6885996ca2 Andy Yan 2025-02-18  1416  		ovl_ctrl &= ~RK3568_OVL_CTRL__YUV_MODE(vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1417  
328e6885996ca2 Andy Yan 2025-02-18  1418  	vop2_writel(vop2, RK3568_OVL_CTRL, ovl_ctrl);
328e6885996ca2 Andy Yan 2025-02-18  1419  
328e6885996ca2 Andy Yan 2025-02-18  1420  	port_sel = vop2_readl(vop2, RK3568_OVL_PORT_SEL);
328e6885996ca2 Andy Yan 2025-02-18  1421  	port_sel &= RK3568_OVL_PORT_SEL__SEL_PORT;
328e6885996ca2 Andy Yan 2025-02-18  1422  
328e6885996ca2 Andy Yan 2025-02-18  1423  	if (vp0->nlayers)
328e6885996ca2 Andy Yan 2025-02-18  1424  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT0_MUX,
328e6885996ca2 Andy Yan 2025-02-18  1425  				     vp0->nlayers - 1);
328e6885996ca2 Andy Yan 2025-02-18  1426  	else
328e6885996ca2 Andy Yan 2025-02-18  1427  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT0_MUX, 8);
328e6885996ca2 Andy Yan 2025-02-18  1428  
328e6885996ca2 Andy Yan 2025-02-18  1429  	if (vp1->nlayers)
328e6885996ca2 Andy Yan 2025-02-18  1430  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT1_MUX,
328e6885996ca2 Andy Yan 2025-02-18  1431  				     (vp0->nlayers + vp1->nlayers - 1));
328e6885996ca2 Andy Yan 2025-02-18  1432  	else
328e6885996ca2 Andy Yan 2025-02-18  1433  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT1_MUX, 8);
328e6885996ca2 Andy Yan 2025-02-18  1434  
328e6885996ca2 Andy Yan 2025-02-18  1435  	if (vp2->nlayers)
328e6885996ca2 Andy Yan 2025-02-18  1436  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT2_MUX,
328e6885996ca2 Andy Yan 2025-02-18  1437  			(vp2->nlayers + vp1->nlayers + vp0->nlayers - 1));
328e6885996ca2 Andy Yan 2025-02-18  1438  	else
328e6885996ca2 Andy Yan 2025-02-18  1439  		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT2_MUX, 8);
328e6885996ca2 Andy Yan 2025-02-18  1440  
328e6885996ca2 Andy Yan 2025-02-18  1441  	layer_sel = vop2_readl(vop2, RK3568_OVL_LAYER_SEL);
328e6885996ca2 Andy Yan 2025-02-18  1442  
328e6885996ca2 Andy Yan 2025-02-18  1443  	ofs = 0;
328e6885996ca2 Andy Yan 2025-02-18  1444  	for (i = 0; i < vp->id; i++)
328e6885996ca2 Andy Yan 2025-02-18  1445  		ofs += vop2->vps[i].nlayers;
328e6885996ca2 Andy Yan 2025-02-18  1446  
328e6885996ca2 Andy Yan 2025-02-18  1447  	drm_atomic_crtc_for_each_plane(plane, &vp->crtc) {
328e6885996ca2 Andy Yan 2025-02-18  1448  		struct vop2_win *win = to_vop2_win(plane);
328e6885996ca2 Andy Yan 2025-02-18  1449  		struct vop2_win *old_win;
328e6885996ca2 Andy Yan 2025-02-18  1450  
328e6885996ca2 Andy Yan 2025-02-18  1451  		layer_id = (u8)(plane->state->normalized_zpos + ofs);
328e6885996ca2 Andy Yan 2025-02-18  1452  		/*
328e6885996ca2 Andy Yan 2025-02-18  1453  		 * Find the layer this win bind in old state.
328e6885996ca2 Andy Yan 2025-02-18  1454  		 */
328e6885996ca2 Andy Yan 2025-02-18  1455  		for (old_layer_id = 0; old_layer_id < vop2->data->win_size; old_layer_id++) {
328e6885996ca2 Andy Yan 2025-02-18  1456  			layer_sel_id = (layer_sel >> (4 * old_layer_id)) & 0xf;
328e6885996ca2 Andy Yan 2025-02-18  1457  			if (layer_sel_id == win->data->layer_sel_id)
328e6885996ca2 Andy Yan 2025-02-18  1458  				break;
328e6885996ca2 Andy Yan 2025-02-18  1459  		}
328e6885996ca2 Andy Yan 2025-02-18  1460  
328e6885996ca2 Andy Yan 2025-02-18  1461  		/*
328e6885996ca2 Andy Yan 2025-02-18  1462  		 * Find the win bind to this layer in old state
328e6885996ca2 Andy Yan 2025-02-18  1463  		 */
328e6885996ca2 Andy Yan 2025-02-18  1464  		for (i = 0; i < vop2->data->win_size; i++) {
328e6885996ca2 Andy Yan 2025-02-18  1465  			old_win = &vop2->win[i];
328e6885996ca2 Andy Yan 2025-02-18  1466  			layer_sel_id = (layer_sel >> (4 * layer_id)) & 0xf;
328e6885996ca2 Andy Yan 2025-02-18  1467  			if (layer_sel_id == old_win->data->layer_sel_id)
328e6885996ca2 Andy Yan 2025-02-18  1468  				break;
328e6885996ca2 Andy Yan 2025-02-18  1469  		}
328e6885996ca2 Andy Yan 2025-02-18  1470  
328e6885996ca2 Andy Yan 2025-02-18  1471  		switch (win->data->phys_id) {
328e6885996ca2 Andy Yan 2025-02-18  1472  		case ROCKCHIP_VOP2_CLUSTER0:
328e6885996ca2 Andy Yan 2025-02-18  1473  			port_sel &= ~RK3568_OVL_PORT_SEL__CLUSTER0;
328e6885996ca2 Andy Yan 2025-02-18  1474  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__CLUSTER0, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1475  			break;
328e6885996ca2 Andy Yan 2025-02-18  1476  		case ROCKCHIP_VOP2_CLUSTER1:
328e6885996ca2 Andy Yan 2025-02-18  1477  			port_sel &= ~RK3568_OVL_PORT_SEL__CLUSTER1;
328e6885996ca2 Andy Yan 2025-02-18  1478  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__CLUSTER1, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1479  			break;
328e6885996ca2 Andy Yan 2025-02-18  1480  		case ROCKCHIP_VOP2_CLUSTER2:
328e6885996ca2 Andy Yan 2025-02-18  1481  			port_sel &= ~RK3588_OVL_PORT_SEL__CLUSTER2;
328e6885996ca2 Andy Yan 2025-02-18  1482  			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__CLUSTER2, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1483  			break;
328e6885996ca2 Andy Yan 2025-02-18  1484  		case ROCKCHIP_VOP2_CLUSTER3:
328e6885996ca2 Andy Yan 2025-02-18  1485  			port_sel &= ~RK3588_OVL_PORT_SEL__CLUSTER3;
328e6885996ca2 Andy Yan 2025-02-18  1486  			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__CLUSTER3, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1487  			break;
328e6885996ca2 Andy Yan 2025-02-18  1488  		case ROCKCHIP_VOP2_ESMART0:
328e6885996ca2 Andy Yan 2025-02-18  1489  			port_sel &= ~RK3568_OVL_PORT_SEL__ESMART0;
328e6885996ca2 Andy Yan 2025-02-18  1490  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__ESMART0, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1491  			break;
328e6885996ca2 Andy Yan 2025-02-18  1492  		case ROCKCHIP_VOP2_ESMART1:
328e6885996ca2 Andy Yan 2025-02-18  1493  			port_sel &= ~RK3568_OVL_PORT_SEL__ESMART1;
328e6885996ca2 Andy Yan 2025-02-18  1494  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__ESMART1, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1495  			break;
328e6885996ca2 Andy Yan 2025-02-18  1496  		case ROCKCHIP_VOP2_ESMART2:
328e6885996ca2 Andy Yan 2025-02-18  1497  			port_sel &= ~RK3588_OVL_PORT_SEL__ESMART2;
328e6885996ca2 Andy Yan 2025-02-18  1498  			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__ESMART2, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1499  			break;
328e6885996ca2 Andy Yan 2025-02-18  1500  		case ROCKCHIP_VOP2_ESMART3:
328e6885996ca2 Andy Yan 2025-02-18  1501  			port_sel &= ~RK3588_OVL_PORT_SEL__ESMART3;
328e6885996ca2 Andy Yan 2025-02-18  1502  			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__ESMART3, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1503  			break;
328e6885996ca2 Andy Yan 2025-02-18  1504  		case ROCKCHIP_VOP2_SMART0:
328e6885996ca2 Andy Yan 2025-02-18  1505  			port_sel &= ~RK3568_OVL_PORT_SEL__SMART0;
328e6885996ca2 Andy Yan 2025-02-18  1506  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__SMART0, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1507  			break;
328e6885996ca2 Andy Yan 2025-02-18  1508  		case ROCKCHIP_VOP2_SMART1:
328e6885996ca2 Andy Yan 2025-02-18  1509  			port_sel &= ~RK3568_OVL_PORT_SEL__SMART1;
328e6885996ca2 Andy Yan 2025-02-18  1510  			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__SMART1, vp->id);
328e6885996ca2 Andy Yan 2025-02-18  1511  			break;
328e6885996ca2 Andy Yan 2025-02-18  1512  		}
328e6885996ca2 Andy Yan 2025-02-18  1513  
328e6885996ca2 Andy Yan 2025-02-18  1514  		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(layer_id, 0x7);
328e6885996ca2 Andy Yan 2025-02-18  1515  		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(layer_id, win->data->layer_sel_id);
328e6885996ca2 Andy Yan 2025-02-18  1516  		/*
328e6885996ca2 Andy Yan 2025-02-18  1517  		 * When we bind a window from layerM to layerN, we also need to move the old
328e6885996ca2 Andy Yan 2025-02-18  1518  		 * window on layerN to layerM to avoid one window selected by two or more layers.
328e6885996ca2 Andy Yan 2025-02-18  1519  		 */
328e6885996ca2 Andy Yan 2025-02-18  1520  		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, 0x7);
328e6885996ca2 Andy Yan 2025-02-18 @1521  		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(old_layer_id, old_win->data->layer_sel_id);
328e6885996ca2 Andy Yan 2025-02-18  1522  	}
328e6885996ca2 Andy Yan 2025-02-18  1523  
328e6885996ca2 Andy Yan 2025-02-18  1524  	vop2_writel(vop2, RK3568_OVL_LAYER_SEL, layer_sel);
328e6885996ca2 Andy Yan 2025-02-18  1525  	vop2_writel(vop2, RK3568_OVL_PORT_SEL, port_sel);
328e6885996ca2 Andy Yan 2025-02-18  1526  }
328e6885996ca2 Andy Yan 2025-02-18  1527  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
