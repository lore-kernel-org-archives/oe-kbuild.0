Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988031281D
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766426244; cv=none; b=BM7N+MN8timflIkyEkvSxjI1uS2BUXPRcps19DPl3hs6pec56PBjh8AhvhU9c+AXVNUi13qw2IeeZ5MbRZy6JlcKCAhV+4Dk4X48bkXUwSir4rx9cVGIjhtCmGmVfynYkKFdOJRjEWG9A1rMlu4LkEtNvAO88uKRH8IGaaJHm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766426244; c=relaxed/simple;
	bh=0SxzyFQQtEcool2ioNcR7POPYbcLccftPo7aJVtgNGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hw+X8RQGT2o2u5/3sUfxV6uLyeuhB153rU4koehjGos/AfkYoc/a8m4yX08EWg88mrCqhhLNPiBX/6Ou02nM4kReIVE5+oJe9lYxTSLfmJHvpSCpCvbVGBlVsFO4pfe6E3Yda9GWNCKOyU5E72ilYAbS3JUHT98aA5Dmt+tow1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmKcUdES; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmKcUdES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766426243; x=1797962243;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0SxzyFQQtEcool2ioNcR7POPYbcLccftPo7aJVtgNGE=;
  b=BmKcUdES9F00Ah69Jy4lSF4+i/+mJ4N8kYoGF66CGwxw0P1JutOca8/M
   IcAeEZADbm30mFCIhOIg8qxVRQ2DZg8AcDHv2zRzXWysXRcTTWMM/qD5S
   pzkeqomnBDq0k0qCdBSTDjLdWIg16D23Orr2xUVLzv97vd3ySy2QUmJzR
   IR7SorM/r0LjPCrC9zHM067tDfbOtri7czp3qnYfLicy1rax8KKBIPSF7
   Pz3GJWFZ4N3+SORL0DK768B2TvXjJeg1hEYC9Uk/K5BpCe50lKq0vOY2D
   vIBwaVIFPCip25y0mCq4LQS35c74FsxRDjysKJchysauI3+2RegN7hEhY
   Q==;
X-CSE-ConnectionGUID: budYEkVBT++c0Yd6MaeowQ==
X-CSE-MsgGUID: vyIl1hBCQjuVyt3qJdm/iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79400650"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79400650"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:57:21 -0800
X-CSE-ConnectionGUID: 1ccSooWbSIO7yGEUZougYQ==
X-CSE-MsgGUID: 3EmuwlKTQj6nAwtY5r/gZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204534342"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Dec 2025 09:57:19 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXk9c-000000000xF-25Ki;
	Mon, 22 Dec 2025 17:57:09 +0000
Date: Tue, 23 Dec 2025 01:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/dwc/pcie-amd-mdb.c:388
 amd_mdb_setup_irq() error: uninitialized symbol 'irq'.
Message-ID: <202512230112.AaiGqMWM-lkp@intel.com>
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
TO: Thippeswamy Havalige <thippeswamy.havalige@amd.com>
CC: "Krzysztof Wilczy=C5=84ski" <kwilczynski@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 5f3de23d858edf5df89c397678ba492b96646df4 PCI: amd-mdb: Add AMD MDB =
Root Port driver
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r071-20251214 (https://download.01.org/0day-ci/arc=
hive/20251223/202512230112.AaiGqMWM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 133=
5a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512230112.AaiGqMWM-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-amd-mdb.c:388 amd_mdb_setup_irq() error: un=
initialized symbol 'irq'.

vim +/irq +388 drivers/pci/controller/dwc/pcie-amd-mdb.c

5f3de23d858edf Thippeswamy Havalige 2025-02-28  344 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  345  static int amd_mdb_set=
up_irq(struct amd_mdb_pcie *pcie,
5f3de23d858edf Thippeswamy Havalige 2025-02-28  346  			     struct platfor=
m_device *pdev)
5f3de23d858edf Thippeswamy Havalige 2025-02-28  347  {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  348  	struct dw_pcie *pci =
=3D &pcie->pci;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  349  	struct dw_pcie_rp *pp=
 =3D &pci->pp;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  350  	struct device *dev =
=3D &pdev->dev;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  351  	int i, irq, err;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  352 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  353  	amd_mdb_pcie_init_por=
t(pcie);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  354 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  355  	pp->irq =3D platform_=
get_irq(pdev, 0);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  356  	if (pp->irq < 0)
5f3de23d858edf Thippeswamy Havalige 2025-02-28  357  		return pp->irq;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  358 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  359  	for (i =3D 0; i < ARR=
AY_SIZE(intr_cause); i++) {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  360  		if (!intr_cause[i].s=
tr)
5f3de23d858edf Thippeswamy Havalige 2025-02-28  361  			continue;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  362 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  363  		irq =3D irq_create_m=
apping(pcie->mdb_domain, i);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  364  		if (!irq) {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  365  			dev_err(dev, "Faile=
d to map MDB domain interrupt\n");
5f3de23d858edf Thippeswamy Havalige 2025-02-28  366  			return -ENOMEM;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  367  		}
5f3de23d858edf Thippeswamy Havalige 2025-02-28  368 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  369  		err =3D devm_request=
_irq(dev, irq, amd_mdb_pcie_intr_handler,
5f3de23d858edf Thippeswamy Havalige 2025-02-28  370  				       IRQF_NO_THR=
EAD, intr_cause[i].sym, pcie);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  371  		if (err) {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  372  			dev_err(dev, "Faile=
d to request IRQ %d, err=3D%d\n",
5f3de23d858edf Thippeswamy Havalige 2025-02-28  373  				irq, err);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  374  			return err;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  375  		}
5f3de23d858edf Thippeswamy Havalige 2025-02-28  376  	}
5f3de23d858edf Thippeswamy Havalige 2025-02-28  377 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  378  	pcie->intx_irq =3D ir=
q_create_mapping(pcie->mdb_domain,
5f3de23d858edf Thippeswamy Havalige 2025-02-28  379  					    AMD_MDB_PCIE_=
INTR_INTX);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  380  	if (!pcie->intx_irq) {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  381  		dev_err(dev, "Failed=
 to map INTx interrupt\n");
5f3de23d858edf Thippeswamy Havalige 2025-02-28  382  		return -ENXIO;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  383  	}
5f3de23d858edf Thippeswamy Havalige 2025-02-28  384 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  385  	err =3D devm_request_=
irq(dev, pcie->intx_irq, dw_pcie_rp_intx,
5f3de23d858edf Thippeswamy Havalige 2025-02-28  386  			       IRQF_NO_THRE=
AD, NULL, pcie);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  387  	if (err) {
5f3de23d858edf Thippeswamy Havalige 2025-02-28 @388  		dev_err(dev, "Failed=
 to request INTx IRQ %d, err=3D%d\n",
5f3de23d858edf Thippeswamy Havalige 2025-02-28  389  			irq, err);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  390  		return err;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  391  	}
5f3de23d858edf Thippeswamy Havalige 2025-02-28  392 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  393  	/* Plug the main even=
t handler. */
5f3de23d858edf Thippeswamy Havalige 2025-02-28  394  	err =3D devm_request_=
irq(dev, pp->irq, amd_mdb_pcie_event, IRQF_NO_THREAD,
5f3de23d858edf Thippeswamy Havalige 2025-02-28  395  			       "amd_mdb pci=
e_irq", pcie);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  396  	if (err) {
5f3de23d858edf Thippeswamy Havalige 2025-02-28  397  		dev_err(dev, "Failed=
 to request event IRQ %d, err=3D%d\n",
5f3de23d858edf Thippeswamy Havalige 2025-02-28  398  			pp->irq, err);
5f3de23d858edf Thippeswamy Havalige 2025-02-28  399  		return err;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  400  	}
5f3de23d858edf Thippeswamy Havalige 2025-02-28  401 =20
5f3de23d858edf Thippeswamy Havalige 2025-02-28  402  	return 0;
5f3de23d858edf Thippeswamy Havalige 2025-02-28  403  }
5f3de23d858edf Thippeswamy Havalige 2025-02-28  404 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
