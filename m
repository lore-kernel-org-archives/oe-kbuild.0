Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697B61A717
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694614029; x=1726150029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r0Iz5QAQdw4P2NKUx+Fr4k3cpR7GBI5zTAW93+zlmI8=;
  b=GJDg4FoKngv/Gw/klipVNF9tTwkTRcRA4r+CsjrjhnMLCNzyXai03iPH
   hxv7UlF28YJcxrtbUEPikZ05bboT7OiJ1EICJZ2JEKhe9OoBHuXfHiml+
   2lcK7KDdXEC6Jw1cLPAvlxovL7p1t1TfG0SQxUnmhD3z3rlT1SgY0Ug7x
   w/hZpfcFOzeYjADfra8WpMw0YxelBDPS+OUFCBORJaSCuWchdI6eUNNL+
   /rbX8+yos7yVCDwu8601IaMRRaFiaQj7wdfDMy/CJA0m9YfXBatRuE9+g
   KGT6IMmY3q0O5rEoNeLcypANY5NbveIgkAS+piLAbG1FcvpRKay7wkm1d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="381359671"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="381359671"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 07:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887341510"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="887341510"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2023 07:06:21 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgQW1-00008q-1x;
	Wed, 13 Sep 2023 14:06:49 +0000
Date: Wed, 13 Sep 2023 22:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [skeggsb-nouveau:00.02-gsp-rm 37/88]
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:1689 nv50_disp_oneinit()
 warn: address of NULL pointer 'outp'
Message-ID: <202309132224.2oksUgqW-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@redhat.com>

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   89551217290c31848a7662d659ced417db386bc7
commit: 586da5c1d8563467873a3ece9370061608ac2308 [37/88] drm/nouveau/disp: move outp/conn construction to chipset code
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230913/202309132224.2oksUgqW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309132224.2oksUgqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309132224.2oksUgqW-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:1689 nv50_disp_oneinit() warn: address of NULL pointer 'outp'

vim +/outp +1689 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c

bb3b0a42207460 Ben Skeggs 2018-05-08  1579  
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1580  int
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1581  nv50_disp_oneinit(struct nvkm_disp *disp)
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1582  {
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1583  	const struct nvkm_disp_func *func = disp->func;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1584  	struct nvkm_subdev *subdev = &disp->engine.subdev;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1585  	struct nvkm_device *device = subdev->device;
586da5c1d85634 Ben Skeggs 2023-09-09  1586  	struct nvkm_bios *bios = device->bios;
586da5c1d85634 Ben Skeggs 2023-09-09  1587  	struct nvkm_outp *outp, *outt, *pair;
586da5c1d85634 Ben Skeggs 2023-09-09  1588  	struct nvkm_conn *conn;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1589  	int ret, i;
586da5c1d85634 Ben Skeggs 2023-09-09  1590  	u8  ver, hdr;
586da5c1d85634 Ben Skeggs 2023-09-09  1591  	u32 data;
586da5c1d85634 Ben Skeggs 2023-09-09  1592  	struct dcb_output dcbE;
586da5c1d85634 Ben Skeggs 2023-09-09  1593  	struct nvbios_connE connE;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1594  
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1595  	if (func->wndw.cnt) {
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1596  		disp->wndw.nr = func->wndw.cnt(disp, &disp->wndw.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1597  		nvkm_debug(subdev, "Window(s): %d (%08lx)\n", disp->wndw.nr, disp->wndw.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1598  	}
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1599  
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1600  	disp->head.nr = func->head.cnt(disp, &disp->head.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1601  	nvkm_debug(subdev, "  Head(s): %d (%02lx)\n", disp->head.nr, disp->head.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1602  	for_each_set_bit(i, &disp->head.mask, disp->head.nr) {
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1603  		ret = func->head.new(disp, i);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1604  		if (ret)
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1605  			return ret;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1606  	}
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1607  
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1608  	if (func->dac.cnt) {
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1609  		disp->dac.nr = func->dac.cnt(disp, &disp->dac.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1610  		nvkm_debug(subdev, "   DAC(s): %d (%02lx)\n", disp->dac.nr, disp->dac.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1611  		for_each_set_bit(i, &disp->dac.mask, disp->dac.nr) {
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1612  			ret = func->dac.new(disp, i);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1613  			if (ret)
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1614  				return ret;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1615  		}
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1616  	}
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1617  
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1618  	if (func->pior.cnt) {
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1619  		disp->pior.nr = func->pior.cnt(disp, &disp->pior.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1620  		nvkm_debug(subdev, "  PIOR(s): %d (%02lx)\n", disp->pior.nr, disp->pior.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1621  		for_each_set_bit(i, &disp->pior.mask, disp->pior.nr) {
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1622  			ret = func->pior.new(disp, i);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1623  			if (ret)
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1624  				return ret;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1625  		}
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1626  	}
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1627  
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1628  	disp->sor.nr = func->sor.cnt(disp, &disp->sor.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1629  	nvkm_debug(subdev, "   SOR(s): %d (%02lx)\n", disp->sor.nr, disp->sor.mask);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1630  	for_each_set_bit(i, &disp->sor.mask, disp->sor.nr) {
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1631  		ret = func->sor.new(disp, i);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1632  		if (ret)
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1633  			return ret;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1634  	}
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1635  
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1636  	ret = nvkm_gpuobj_new(device, 0x10000, 0x10000, false, NULL, &disp->inst);
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1637  	if (ret)
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1638  		return ret;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1639  
586da5c1d85634 Ben Skeggs 2023-09-09  1640  	ret = nvkm_ramht_new(device, func->ramht_size ? func->ramht_size : 0x1000, 0, disp->inst,
586da5c1d85634 Ben Skeggs 2023-09-09  1641  			     &disp->ramht);
586da5c1d85634 Ben Skeggs 2023-09-09  1642  	if (ret)
586da5c1d85634 Ben Skeggs 2023-09-09  1643  		return ret;
586da5c1d85634 Ben Skeggs 2023-09-09  1644  
586da5c1d85634 Ben Skeggs 2023-09-09  1645  	/* Create output path objects for each VBIOS display path. */
586da5c1d85634 Ben Skeggs 2023-09-09  1646  	i = -1;
586da5c1d85634 Ben Skeggs 2023-09-09  1647  	while ((data = dcb_outp_parse(bios, ++i, &ver, &hdr, &dcbE))) {
586da5c1d85634 Ben Skeggs 2023-09-09  1648  		if (WARN_ON((ver & 0xf0) != 0x40))
586da5c1d85634 Ben Skeggs 2023-09-09  1649  			return -EINVAL;
586da5c1d85634 Ben Skeggs 2023-09-09  1650  		if (dcbE.type == DCB_OUTPUT_UNUSED)
586da5c1d85634 Ben Skeggs 2023-09-09  1651  			continue;
586da5c1d85634 Ben Skeggs 2023-09-09  1652  		if (dcbE.type == DCB_OUTPUT_EOL)
586da5c1d85634 Ben Skeggs 2023-09-09  1653  			break;
586da5c1d85634 Ben Skeggs 2023-09-09  1654  		outp = NULL;
586da5c1d85634 Ben Skeggs 2023-09-09  1655  
586da5c1d85634 Ben Skeggs 2023-09-09  1656  		switch (dcbE.type) {
586da5c1d85634 Ben Skeggs 2023-09-09  1657  		case DCB_OUTPUT_ANALOG:
586da5c1d85634 Ben Skeggs 2023-09-09  1658  		case DCB_OUTPUT_TV:
586da5c1d85634 Ben Skeggs 2023-09-09  1659  		case DCB_OUTPUT_TMDS:
586da5c1d85634 Ben Skeggs 2023-09-09  1660  		case DCB_OUTPUT_LVDS:
586da5c1d85634 Ben Skeggs 2023-09-09  1661  			ret = nvkm_outp_new(disp, i, &dcbE, &outp);
586da5c1d85634 Ben Skeggs 2023-09-09  1662  			break;
586da5c1d85634 Ben Skeggs 2023-09-09  1663  		case DCB_OUTPUT_DP:
586da5c1d85634 Ben Skeggs 2023-09-09  1664  			ret = nvkm_dp_new(disp, i, &dcbE, &outp);
586da5c1d85634 Ben Skeggs 2023-09-09  1665  			break;
586da5c1d85634 Ben Skeggs 2023-09-09  1666  		case DCB_OUTPUT_WFD:
586da5c1d85634 Ben Skeggs 2023-09-09  1667  			/* No support for WFD yet. */
586da5c1d85634 Ben Skeggs 2023-09-09  1668  			ret = -ENODEV;
586da5c1d85634 Ben Skeggs 2023-09-09  1669  			continue;
586da5c1d85634 Ben Skeggs 2023-09-09  1670  		default:
586da5c1d85634 Ben Skeggs 2023-09-09  1671  			nvkm_warn(subdev, "dcb %d type %d unknown\n",
586da5c1d85634 Ben Skeggs 2023-09-09  1672  				  i, dcbE.type);
586da5c1d85634 Ben Skeggs 2023-09-09  1673  			continue;
586da5c1d85634 Ben Skeggs 2023-09-09  1674  		}
586da5c1d85634 Ben Skeggs 2023-09-09  1675  
586da5c1d85634 Ben Skeggs 2023-09-09  1676  		if (ret) {
586da5c1d85634 Ben Skeggs 2023-09-09  1677  			if (outp) {
586da5c1d85634 Ben Skeggs 2023-09-09  1678  				if (ret != -ENODEV)
586da5c1d85634 Ben Skeggs 2023-09-09  1679  					OUTP_ERR(outp, "ctor failed: %d", ret);
586da5c1d85634 Ben Skeggs 2023-09-09  1680  				else
586da5c1d85634 Ben Skeggs 2023-09-09  1681  					OUTP_DBG(outp, "not supported");
586da5c1d85634 Ben Skeggs 2023-09-09  1682  				nvkm_outp_del(&outp);
586da5c1d85634 Ben Skeggs 2023-09-09  1683  				continue;
586da5c1d85634 Ben Skeggs 2023-09-09  1684  			}
586da5c1d85634 Ben Skeggs 2023-09-09  1685  			nvkm_error(subdev, "failed to create outp %d\n", i);
586da5c1d85634 Ben Skeggs 2023-09-09  1686  			continue;
586da5c1d85634 Ben Skeggs 2023-09-09  1687  		}
586da5c1d85634 Ben Skeggs 2023-09-09  1688  
586da5c1d85634 Ben Skeggs 2023-09-09 @1689  		list_add_tail(&outp->head, &disp->outps);
586da5c1d85634 Ben Skeggs 2023-09-09  1690  	}
586da5c1d85634 Ben Skeggs 2023-09-09  1691  
586da5c1d85634 Ben Skeggs 2023-09-09  1692  	/* Create connector objects based on available output paths. */
586da5c1d85634 Ben Skeggs 2023-09-09  1693  	list_for_each_entry_safe(outp, outt, &disp->outps, head) {
586da5c1d85634 Ben Skeggs 2023-09-09  1694  		/* VBIOS data *should* give us the most useful information. */
586da5c1d85634 Ben Skeggs 2023-09-09  1695  		data = nvbios_connEp(bios, outp->info.connector, &ver, &hdr,
586da5c1d85634 Ben Skeggs 2023-09-09  1696  				     &connE);
586da5c1d85634 Ben Skeggs 2023-09-09  1697  
586da5c1d85634 Ben Skeggs 2023-09-09  1698  		/* No bios connector data... */
586da5c1d85634 Ben Skeggs 2023-09-09  1699  		if (!data) {
586da5c1d85634 Ben Skeggs 2023-09-09  1700  			/* Heuristic: anything with the same ccb index is
586da5c1d85634 Ben Skeggs 2023-09-09  1701  			 * considered to be on the same connector, any
586da5c1d85634 Ben Skeggs 2023-09-09  1702  			 * output path without an associated ccb entry will
586da5c1d85634 Ben Skeggs 2023-09-09  1703  			 * be put on its own connector.
586da5c1d85634 Ben Skeggs 2023-09-09  1704  			 */
586da5c1d85634 Ben Skeggs 2023-09-09  1705  			int ccb_index = outp->info.i2c_index;
586da5c1d85634 Ben Skeggs 2023-09-09  1706  			if (ccb_index != 0xf) {
586da5c1d85634 Ben Skeggs 2023-09-09  1707  				list_for_each_entry(pair, &disp->outps, head) {
586da5c1d85634 Ben Skeggs 2023-09-09  1708  					if (pair->info.i2c_index == ccb_index) {
586da5c1d85634 Ben Skeggs 2023-09-09  1709  						outp->conn = pair->conn;
586da5c1d85634 Ben Skeggs 2023-09-09  1710  						break;
586da5c1d85634 Ben Skeggs 2023-09-09  1711  					}
586da5c1d85634 Ben Skeggs 2023-09-09  1712  				}
586da5c1d85634 Ben Skeggs 2023-09-09  1713  			}
586da5c1d85634 Ben Skeggs 2023-09-09  1714  
586da5c1d85634 Ben Skeggs 2023-09-09  1715  			/* Connector shared with another output path. */
586da5c1d85634 Ben Skeggs 2023-09-09  1716  			if (outp->conn)
586da5c1d85634 Ben Skeggs 2023-09-09  1717  				continue;
586da5c1d85634 Ben Skeggs 2023-09-09  1718  
586da5c1d85634 Ben Skeggs 2023-09-09  1719  			memset(&connE, 0x00, sizeof(connE));
586da5c1d85634 Ben Skeggs 2023-09-09  1720  			connE.type = DCB_CONNECTOR_NONE;
586da5c1d85634 Ben Skeggs 2023-09-09  1721  			i = -1;
586da5c1d85634 Ben Skeggs 2023-09-09  1722  		} else {
586da5c1d85634 Ben Skeggs 2023-09-09  1723  			i = outp->info.connector;
586da5c1d85634 Ben Skeggs 2023-09-09  1724  		}
586da5c1d85634 Ben Skeggs 2023-09-09  1725  
586da5c1d85634 Ben Skeggs 2023-09-09  1726  		/* Check that we haven't already created this connector. */
586da5c1d85634 Ben Skeggs 2023-09-09  1727  		list_for_each_entry(conn, &disp->conns, head) {
586da5c1d85634 Ben Skeggs 2023-09-09  1728  			if (conn->index == outp->info.connector) {
586da5c1d85634 Ben Skeggs 2023-09-09  1729  				outp->conn = conn;
586da5c1d85634 Ben Skeggs 2023-09-09  1730  				break;
586da5c1d85634 Ben Skeggs 2023-09-09  1731  			}
586da5c1d85634 Ben Skeggs 2023-09-09  1732  		}
586da5c1d85634 Ben Skeggs 2023-09-09  1733  
586da5c1d85634 Ben Skeggs 2023-09-09  1734  		if (outp->conn)
586da5c1d85634 Ben Skeggs 2023-09-09  1735  			continue;
586da5c1d85634 Ben Skeggs 2023-09-09  1736  
586da5c1d85634 Ben Skeggs 2023-09-09  1737  		/* Apparently we need to create a new one! */
586da5c1d85634 Ben Skeggs 2023-09-09  1738  		ret = nvkm_conn_new(disp, i, &connE, &outp->conn);
586da5c1d85634 Ben Skeggs 2023-09-09  1739  		if (ret) {
586da5c1d85634 Ben Skeggs 2023-09-09  1740  			nvkm_error(subdev, "failed to create outp %d conn: %d\n", outp->index, ret);
586da5c1d85634 Ben Skeggs 2023-09-09  1741  			nvkm_conn_del(&outp->conn);
586da5c1d85634 Ben Skeggs 2023-09-09  1742  			list_del(&outp->head);
586da5c1d85634 Ben Skeggs 2023-09-09  1743  			nvkm_outp_del(&outp);
586da5c1d85634 Ben Skeggs 2023-09-09  1744  			continue;
586da5c1d85634 Ben Skeggs 2023-09-09  1745  		}
586da5c1d85634 Ben Skeggs 2023-09-09  1746  
586da5c1d85634 Ben Skeggs 2023-09-09  1747  		list_add_tail(&outp->conn->head, &disp->conns);
586da5c1d85634 Ben Skeggs 2023-09-09  1748  	}
586da5c1d85634 Ben Skeggs 2023-09-09  1749  
586da5c1d85634 Ben Skeggs 2023-09-09  1750  	return 0;
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1751  }
acbe9ecfb7fb14 Ben Skeggs 2022-06-01  1752  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
