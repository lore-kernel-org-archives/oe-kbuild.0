Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E033C3BFD
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872488; cv=none; b=aZdmET5OG3YJEyl960KYGHtMooozYbIxqf2chR+5kjtbt2k3g8apEgyn7aYBTTK0ycfB7/mJnjE2Hc9ApDzvLmyPZRzKRBGz45sOyWYIKOUDKiDpXOvrwr3J7wM8PVUwYCs8VZu1owBkjZeoOAa8X9kfH4rB5s3p7r2jPwEBJrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872488; c=relaxed/simple;
	bh=0b1LKE6b/8yikteDL5rosAqQ0IfFiBAQ46BAm3itzS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XiR5Dc0wLzFnNEPC3NDQNq4QQHNtbwiTz+5whJm+UaInbTyO/YRVntFfH5QUXZZ8EiyFKqDwIdaaG+DTGwx40eOdnsYC6qnnEQs7ARwp+E9K5IzOkb2ZirfAvq5f/87U4FKHXaUFcemGOn25na70mf6jNqJI4b4+YeFGdo8sXog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZHl7I+n; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZHl7I+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774872487; x=1806408487;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0b1LKE6b/8yikteDL5rosAqQ0IfFiBAQ46BAm3itzS0=;
  b=WZHl7I+n+JoV6FjF26x6sAWtUlxZ8Awrqo/tvtPr5OUQ/WiAalYuw4U/
   lGRayqB9xLnuqXJpC4SlFxgXB7FyAnkLAPdC/BMGeaoJ57loTWCXZCEME
   sy9kAdQkA5u9gfNilwhlfkHL0Z3R/HXzecCxEeVyQLzQQ5zcwkUWQCSo1
   gz9SNkxFOwfA0cFaid8A9ml6b3Qvc0kU0+4VZeExw+YOB8+/pH6b27vjk
   dcbGVBrfD5OPxBH9MFbBloFlsh5QO1MuwlBXXl0KuuHCi2zUy/Ci4a2KH
   CXCK60cu8WAlD2nl6VhZYzUdnMNKCMRZTCt1OqCB/vBkLRfmJbpjB8KCW
   Q==;
X-CSE-ConnectionGUID: N6jFM+AXS3SRkhavS6NdBA==
X-CSE-MsgGUID: PDLC7zOoTYC68tyOkMelAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86165367"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86165367"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 05:08:06 -0700
X-CSE-ConnectionGUID: OEZabiCySm+ImRgCpP9Mlw==
X-CSE-MsgGUID: JNVTQdoXT+CT6BQsBGYfJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230084716"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Mar 2026 05:08:05 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7BPW-0000000013L-1YXx;
	Mon, 30 Mar 2026 12:08:02 +0000
Date: Mon, 30 Mar 2026 20:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/phy/samsung/phy-exynos5-usbdrd.c:1794
 exynos5_usbdrd_orien_sw_set() error: 'phy_drd' dereferencing possible
 ERR_PTR()
Message-ID: <202603302019.JrplV8tA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Stephen Boyd <swboyd@chromium.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Xu Yang <xu.yang_2@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 45fe729be9a6be326a1ca25af82d34de32ba2ce8 usb: typec: Stub out typec=
_switch APIs when CONFIG_TYPEC=3Dn
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: arc-randconfig-r071-20260330 (https://download.01.org/0day-ci/archi=
ve/20260330/202603302019.JrplV8tA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603302019.JrplV8tA-lkp@intel.com/

smatch warnings:
drivers/phy/samsung/phy-exynos5-usbdrd.c:1794 exynos5_usbdrd_orien_sw_set()=
 error: 'phy_drd' dereferencing possible ERR_PTR()

vim +/phy_drd +1794 drivers/phy/samsung/phy-exynos5-usbdrd.c

cc52a697f87e8b Ivaylo Ivanov 2025-05-04  1787 =20
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1788  static int exynos5_usbd=
rd_orien_sw_set(struct typec_switch_dev *sw,
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1789  				       enum typec_o=
rientation orientation)
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1790  {
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1791  	struct exynos5_usbdrd_=
phy *phy_drd =3D typec_switch_get_drvdata(sw);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1792  	int ret;
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1793 =20
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06 @1794  	ret =3D clk_bulk_prepa=
re_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1795  	if (ret) {
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1796  		dev_err(phy_drd->dev,=
 "Failed to enable PHY clocks(s)\n");
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1797  		return ret;
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1798  	}
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1799 =20
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1800  	scoped_guard(mutex, &p=
hy_drd->phy_mutex) {
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1801  		void __iomem * const =
regs_base =3D phy_drd->reg_phy;
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1802  		unsigned int reg;
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1803 =20
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1804  		if (orientation =3D=
=3D TYPEC_ORIENTATION_NONE) {
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1805  			reg =3D readl(regs_b=
ase + EXYNOS850_DRD_UTMI);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1806  			reg &=3D ~(UTMI_FORC=
E_VBUSVALID | UTMI_FORCE_BVALID);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1807  			writel(reg, regs_bas=
e +  EXYNOS850_DRD_UTMI);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1808 =20
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1809  			reg =3D readl(regs_b=
ase + EXYNOS850_DRD_HSP);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1810  			reg |=3D HSP_VBUSVLD=
EXTSEL;
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1811  			reg &=3D ~HSP_VBUSVL=
DEXT;
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1812  			writel(reg, regs_bas=
e + EXYNOS850_DRD_HSP);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1813  		} else {
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1814  			reg =3D readl(regs_b=
ase + EXYNOS850_DRD_UTMI);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1815  			reg |=3D UTMI_FORCE_=
VBUSVALID | UTMI_FORCE_BVALID;
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1816  			writel(reg, regs_bas=
e +  EXYNOS850_DRD_UTMI);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1817 =20
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1818  			reg =3D readl(regs_b=
ase + EXYNOS850_DRD_HSP);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1819  			reg |=3D HSP_VBUSVLD=
EXTSEL | HSP_VBUSVLDEXT;
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1820  			writel(reg, regs_bas=
e + EXYNOS850_DRD_HSP);
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1821  		}
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1822 =20
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1823  		phy_drd->orientation =
=3D orientation;
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1824  	}
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1825 =20
f4fb9c4d7f94da Andr=C3=A9 Draszik 2024-12-06  1826  	clk_bulk_disable(phy_d=
rd->drv_data->n_clks, phy_drd->clks);
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1827 =20
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1828  	return 0;
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1829  }
09dc674295a388 Andr=C3=A9 Draszik 2024-12-06  1830 =20

:::::: The code at line 1794 was first introduced by commit
:::::: f4fb9c4d7f94dabef4abf2209cf840dd1c9ca11e phy: exynos5-usbdrd: allow =
DWC3 runtime suspend with UDC bound (E850+)

:::::: TO: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
