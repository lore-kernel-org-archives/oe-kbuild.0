Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDD6EBC
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0tLD47l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701826371; x=1733362371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OYy73drmXOF2CAMpLNGd7z+kE/7fPCT6IOFfIIItRE=;
  b=D0tLD47luI7l4kufPNfmfc5qpreKIhQ8rcBnVmeeF0gkKaeMN7TNjDj/
   lf1ylar0qB1rdZ/nBik34sMNLZYZO7BXmZCpTgqt7LRk31WuQ6Tkew75C
   DJCN+Cf+OBZg+lBO5lenCRkrIixdnMmVYgDN3QhN1XMEwRtoZrS5JxMOd
   +x/cdtzWSyaWPehfFJ5MFKDKBMCdz4pRk5OszNPgDYpFRqoDhM0bhSAP/
   Lb3LIRV3gH6OGSa0VFII2R7hg2wtvqt68gACK+qJ/DItp3VJ4dwQ9dOWL
   gWbCsG/kc9JZ1FQ344ht/94JyyoYqVwkVRPeJu96ltlZ7rCzrRXHo6oAY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="460474976"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="460474976"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 17:32:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102649148"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102649148"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 17:32:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAgmM-000A1W-16;
	Wed, 06 Dec 2023 01:32:46 +0000
Date: Wed, 6 Dec 2023 09:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 11/14] drm/rockchip: vop2: Add support for rk3588
Message-ID: <202312060951.JriBc8wA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1858:28: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231130122439.13374-1-andyshrk@163.com>
References: <20231130122439.13374-1-andyshrk@163.com>
TO: Andy Yan <andyshrk@163.com>
TO: heiko@sntech.de
CC: hjc@rock-chips.com
CC: dri-devel@lists.freedesktop.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: krzysztof.kozlowski+dt@linaro.org
CC: robh+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: sebastian.reichel@collabora.com
CC: kever.yang@rock-chips.com
CC: chris.obbard@collabora.com
CC: Andy Yan <andy.yan@rock-chips.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on rockchip/for-next robh/for-next joro-iommu/next linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Yan/Revert-drm-rockchip-vop2-Use-regcache_sync-to-fix-suspend-resume/20231201-002355
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231130122439.13374-1-andyshrk%40163.com
patch subject: [PATCH v3 11/14] drm/rockchip: vop2: Add support for rk3588
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: alpha-randconfig-r122-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060951.JriBc8wA-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060951.JriBc8wA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312060951.JriBc8wA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1858:28: sparse: sparse: dubious: x & !y

vim +1858 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

6abcb719c2e315 Andy Yan 2023-11-30  1787  
6abcb719c2e315 Andy Yan 2023-11-30  1788  static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
6abcb719c2e315 Andy Yan 2023-11-30  1789  {
6abcb719c2e315 Andy Yan 2023-11-30  1790  	struct vop2 *vop2 = vp->vop2;
6abcb719c2e315 Andy Yan 2023-11-30  1791  	int dclk_core_div, dclk_out_div, if_pixclk_div, if_dclk_div;
6abcb719c2e315 Andy Yan 2023-11-30  1792  	unsigned long clock;
6abcb719c2e315 Andy Yan 2023-11-30  1793  	u32 die, dip, div, vp_clk_div, val;
6abcb719c2e315 Andy Yan 2023-11-30  1794  
6abcb719c2e315 Andy Yan 2023-11-30  1795  	clock = rk3588_calc_cru_cfg(vp, id, &dclk_core_div, &dclk_out_div,
6abcb719c2e315 Andy Yan 2023-11-30  1796  				    &if_pixclk_div, &if_dclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1797  	if (!clock)
6abcb719c2e315 Andy Yan 2023-11-30  1798  		return 0;
6abcb719c2e315 Andy Yan 2023-11-30  1799  
6abcb719c2e315 Andy Yan 2023-11-30  1800  	vp_clk_div = FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_CORE_DIV, dclk_core_div);
6abcb719c2e315 Andy Yan 2023-11-30  1801  	vp_clk_div |= FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_OUT_DIV, dclk_out_div);
6abcb719c2e315 Andy Yan 2023-11-30  1802  
6abcb719c2e315 Andy Yan 2023-11-30  1803  	die = vop2_readl(vop2, RK3568_DSP_IF_EN);
6abcb719c2e315 Andy Yan 2023-11-30  1804  	dip = vop2_readl(vop2, RK3568_DSP_IF_POL);
6abcb719c2e315 Andy Yan 2023-11-30  1805  	div = vop2_readl(vop2, RK3568_DSP_IF_CTRL);
6abcb719c2e315 Andy Yan 2023-11-30  1806  
6abcb719c2e315 Andy Yan 2023-11-30  1807  	switch (id) {
6abcb719c2e315 Andy Yan 2023-11-30  1808  	case ROCKCHIP_VOP2_EP_HDMI0:
6abcb719c2e315 Andy Yan 2023-11-30  1809  		div &= ~RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1810  		div &= ~RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1811  		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1812  		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1813  		die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX;
6abcb719c2e315 Andy Yan 2023-11-30  1814  		die |= RK3588_SYS_DSP_INFACE_EN_HDMI0 |
6abcb719c2e315 Andy Yan 2023-11-30  1815  			    FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX, vp->id);
6abcb719c2e315 Andy Yan 2023-11-30  1816  		val = rk3588_get_hdmi_pol(polflags);
6abcb719c2e315 Andy Yan 2023-11-30  1817  		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 1, 1));
6abcb719c2e315 Andy Yan 2023-11-30  1818  		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0, HIWORD_UPDATE(val, 6, 5));
6abcb719c2e315 Andy Yan 2023-11-30  1819  		break;
6abcb719c2e315 Andy Yan 2023-11-30  1820  	case ROCKCHIP_VOP2_EP_HDMI1:
6abcb719c2e315 Andy Yan 2023-11-30  1821  		div &= ~RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1822  		div &= ~RK3588_DSP_IF_EDP_HDMI1_PCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1823  		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV, if_dclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1824  		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI1_PCLK_DIV, if_pixclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1825  		die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX;
6abcb719c2e315 Andy Yan 2023-11-30  1826  		die |= RK3588_SYS_DSP_INFACE_EN_HDMI1 |
6abcb719c2e315 Andy Yan 2023-11-30  1827  			    FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX, vp->id);
6abcb719c2e315 Andy Yan 2023-11-30  1828  		val = rk3588_get_hdmi_pol(polflags);
6abcb719c2e315 Andy Yan 2023-11-30  1829  		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 4, 4));
6abcb719c2e315 Andy Yan 2023-11-30  1830  		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0, HIWORD_UPDATE(val, 8, 7));
6abcb719c2e315 Andy Yan 2023-11-30  1831  		break;
6abcb719c2e315 Andy Yan 2023-11-30  1832  	case ROCKCHIP_VOP2_EP_EDP0:
6abcb719c2e315 Andy Yan 2023-11-30  1833  		div &= ~RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1834  		div &= ~RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1835  		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1836  		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1837  		die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX;
6abcb719c2e315 Andy Yan 2023-11-30  1838  		die |= RK3588_SYS_DSP_INFACE_EN_EDP0 |
6abcb719c2e315 Andy Yan 2023-11-30  1839  			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX, vp->id);
6abcb719c2e315 Andy Yan 2023-11-30  1840  		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 0, 0));
6abcb719c2e315 Andy Yan 2023-11-30  1841  		break;
6abcb719c2e315 Andy Yan 2023-11-30  1842  	case ROCKCHIP_VOP2_EP_EDP1:
6abcb719c2e315 Andy Yan 2023-11-30  1843  		div &= ~RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1844  		div &= ~RK3588_DSP_IF_EDP_HDMI1_PCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1845  		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1846  		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1847  		die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX;
6abcb719c2e315 Andy Yan 2023-11-30  1848  		die |= RK3588_SYS_DSP_INFACE_EN_EDP1 |
6abcb719c2e315 Andy Yan 2023-11-30  1849  			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX, vp->id);
6abcb719c2e315 Andy Yan 2023-11-30  1850  		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 3, 3));
6abcb719c2e315 Andy Yan 2023-11-30  1851  		break;
6abcb719c2e315 Andy Yan 2023-11-30  1852  	case ROCKCHIP_VOP2_EP_MIPI0:
6abcb719c2e315 Andy Yan 2023-11-30  1853  		div &= ~RK3588_DSP_IF_MIPI0_PCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1854  		div |= FIELD_PREP(RK3588_DSP_IF_MIPI0_PCLK_DIV, if_pixclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1855  		die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI0_MUX;
6abcb719c2e315 Andy Yan 2023-11-30  1856  		val = rk3588_get_mipi_port_mux(vp->id);
6abcb719c2e315 Andy Yan 2023-11-30  1857  		die |= RK3588_SYS_DSP_INFACE_EN_MIPI0 |
6abcb719c2e315 Andy Yan 2023-11-30 @1858  			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI0_MUX, !!val);
6abcb719c2e315 Andy Yan 2023-11-30  1859  		break;
6abcb719c2e315 Andy Yan 2023-11-30  1860  	case ROCKCHIP_VOP2_EP_MIPI1:
6abcb719c2e315 Andy Yan 2023-11-30  1861  		div &= ~RK3588_DSP_IF_MIPI1_PCLK_DIV;
6abcb719c2e315 Andy Yan 2023-11-30  1862  		div |= FIELD_PREP(RK3588_DSP_IF_MIPI1_PCLK_DIV, if_pixclk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1863  		die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX;
6abcb719c2e315 Andy Yan 2023-11-30  1864  		val = rk3588_get_mipi_port_mux(vp->id);
6abcb719c2e315 Andy Yan 2023-11-30  1865  		die |= RK3588_SYS_DSP_INFACE_EN_MIPI1 |
6abcb719c2e315 Andy Yan 2023-11-30  1866  			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX, val);
6abcb719c2e315 Andy Yan 2023-11-30  1867  		break;
6abcb719c2e315 Andy Yan 2023-11-30  1868  	case ROCKCHIP_VOP2_EP_DP0:
6abcb719c2e315 Andy Yan 2023-11-30  1869  		die &= ~RK3588_SYS_DSP_INFACE_EN_DP0_MUX;
6abcb719c2e315 Andy Yan 2023-11-30  1870  		die |= RK3588_SYS_DSP_INFACE_EN_DP0 |
6abcb719c2e315 Andy Yan 2023-11-30  1871  			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_DP0_MUX, vp->id);
6abcb719c2e315 Andy Yan 2023-11-30  1872  		dip &= ~RK3588_DSP_IF_POL__DP0_PIN_POL;
6abcb719c2e315 Andy Yan 2023-11-30  1873  		dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP0_PIN_POL, polflags);
6abcb719c2e315 Andy Yan 2023-11-30  1874  		break;
6abcb719c2e315 Andy Yan 2023-11-30  1875  	case ROCKCHIP_VOP2_EP_DP1:
6abcb719c2e315 Andy Yan 2023-11-30  1876  		die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX;
6abcb719c2e315 Andy Yan 2023-11-30  1877  		die |= RK3588_SYS_DSP_INFACE_EN_MIPI1 |
6abcb719c2e315 Andy Yan 2023-11-30  1878  			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX, vp->id);
6abcb719c2e315 Andy Yan 2023-11-30  1879  		dip &= ~RK3588_DSP_IF_POL__DP1_PIN_POL;
6abcb719c2e315 Andy Yan 2023-11-30  1880  		dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP1_PIN_POL, polflags);
6abcb719c2e315 Andy Yan 2023-11-30  1881  		break;
6abcb719c2e315 Andy Yan 2023-11-30  1882  	default:
6abcb719c2e315 Andy Yan 2023-11-30  1883  		drm_err(vop2->drm, "Invalid interface id %d on vp%d\n", id, vp->id);
6abcb719c2e315 Andy Yan 2023-11-30  1884  		return 0;
6abcb719c2e315 Andy Yan 2023-11-30  1885  	}
6abcb719c2e315 Andy Yan 2023-11-30  1886  
6abcb719c2e315 Andy Yan 2023-11-30  1887  	dip |= RK3568_DSP_IF_POL__CFG_DONE_IMD;
6abcb719c2e315 Andy Yan 2023-11-30  1888  
6abcb719c2e315 Andy Yan 2023-11-30  1889  	vop2_vp_write(vp, RK3588_VP_CLK_CTRL, vp_clk_div);
6abcb719c2e315 Andy Yan 2023-11-30  1890  	vop2_writel(vop2, RK3568_DSP_IF_EN, die);
6abcb719c2e315 Andy Yan 2023-11-30  1891  	vop2_writel(vop2, RK3568_DSP_IF_CTRL, div);
6abcb719c2e315 Andy Yan 2023-11-30  1892  	vop2_writel(vop2, RK3568_DSP_IF_POL, dip);
6abcb719c2e315 Andy Yan 2023-11-30  1893  
6abcb719c2e315 Andy Yan 2023-11-30  1894  	return clock;
6abcb719c2e315 Andy Yan 2023-11-30  1895  }
6abcb719c2e315 Andy Yan 2023-11-30  1896  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
