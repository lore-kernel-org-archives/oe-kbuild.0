Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CF82D0C94
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769087167; cv=none; b=H6C9fOfIk/iXD05lKUeGMstVe/XDU35vr/eI7bcOVB1nROpRgmpf//Xw2Iwlx+CkOQdlFIhKauxpHBAiQvRN0WlRJlrCdImuiCmQ8D2Dba3pj4l9IuIHepz/g2SaKQjRCG3uDt3zkulZjOGByC1lRNY3cvC7moYib7Ow07r2Bxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769087167; c=relaxed/simple;
	bh=A+5qx6ptb9l7MNxoAxZVBOToPFlnGRGiLpsgnXeeYFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YNc4g8FIayM5iQapnryk24KvWzcn1q0JU4oW5mSfgJMsZjFT5flXvcbZI4dlHx5nILHP3hcQdYbFIEm1/tHWpMJXPGiUGFBRM5txtHx2ahVs/8kJt1tAYjRENAuU+0cJTLSw3h29uiKkZi8KBqInT3jL/rHJ/HzxATTJVakRtR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdbTyC8z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdbTyC8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769087165; x=1800623165;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A+5qx6ptb9l7MNxoAxZVBOToPFlnGRGiLpsgnXeeYFw=;
  b=HdbTyC8zEjL4tFSDeSwPso3sKeTSeHR7NisAcrxbhrOiTO1zVJUPBIVG
   AEKVH9cHbSVwOUv9ZcHfETr2IOId/aB4ef2HVdCMx7HNNjID3s7PTikvg
   1scUO7puz6DVnBwVd6JOC6tnA4orfsOgVlo34I/nVd2R9QTV//Wt5DfRD
   rXMVS3zB8B7zEuxMlvzbCTe1Tzx6X7BMwcZOTILHKszfG790OBqPfcXxs
   LNqL5ZKdKxzEG6G/7S+OrBoFMqmeGINCa0ABycCiOeUAqSJ23vWkxxAem
   Os6fxwkiiLwVoNPqU4JTYI1a9O6glhgAZyKS1kbA8LGVnuC/W80oe8Hrd
   w==;
X-CSE-ConnectionGUID: nbmZZkrBQRivc8c3PsVeog==
X-CSE-MsgGUID: 6IZkUXLtQHS0ypFDTfgbaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57892413"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="57892413"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 05:06:03 -0800
X-CSE-ConnectionGUID: fYaRRmdKTAOv+whluN+PMw==
X-CSE-MsgGUID: Yt/+hoZzTBm+dxcWhJVlkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206991208"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jan 2026 05:06:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viuNr-00000000Sqp-1hre;
	Thu, 22 Jan 2026 13:05:59 +0000
Date: Thu, 22 Jan 2026 21:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jimc:dd-shrink 19/43] arch/powerpc/sysdev/fsl_rio.c:730
 fsl_rio_setup() warn: 'priv->maint_win' from ioremap() not released on lines:
 730.
Message-ID: <202601222017.bHaSbNdn-lkp@intel.com>
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
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-shrink
head:   8b5ea7737b3963882bbc7b08f411bdf77e495f8d
commit: 94921521975ffe5979d48cb47b111fbc8a03086d [19/43] selftests-dyndbg: =
add a dynamic_debug run_tests target
:::::: branch date: 7 hours ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r073-20260122 (https://download.01.org/0day-ci=
/archive/20260122/202601222017.bHaSbNdn-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601222017.bHaSbNdn-lkp@intel.com/

smatch warnings:
arch/powerpc/sysdev/fsl_rio.c:730 fsl_rio_setup() warn: 'priv->maint_win' f=
rom ioremap() not released on lines: 730.

vim +730 arch/powerpc/sysdev/fsl_rio.c

7f620df839661b3 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 437 =20
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 438  /**
9941d945f491320 arch/powerpc/sysdev/fsl_rio.c Randy Dunlap      2008-04-30 =
 439   * fsl_rio_setup - Setup Freescale PowerPC RapidIO interface
2dc115813768293 arch/powerpc/sysdev/fsl_rio.c Grant Likely      2010-08-06 =
 440   * @dev: platform_device pointer
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 441   *
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 442   * Initializes MPC85xx RapidIO hardware interface, configures
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 443   * master port with system-specific info, and registers the
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 444   * master port with the RapidIO subsystem.
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 445   */
c265735ff5b1f13 arch/powerpc/sysdev/fsl_rio.c Christophe Leroy  2023-08-22 =
 446  static int fsl_rio_setup(struct platform_device *dev)
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 447  {
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 448  	struct rio_ops *ops;
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 449  	struct rio_mport *port;
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 450  	struct rio_priv *priv;
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 451  	int rc =3D 0;
f892ac774b34a76 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 452  	const u32 *port_index;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 453  	u32 active_ports =3D 0;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 454  	struct device_node *np, *rmu_node;
61b269179df582b arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 455  	u32 ccsr;
c4ae1799a5a3583 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 456  	u64 range_start;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 457  	u32 i;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 458  	static int tmp;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 459  	struct device_node *rmu_np[MAX_MSG_UNIT_NUM] =3D {NULL};
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 460 =20
61c7a080a5a061c arch/powerpc/sysdev/fsl_rio.c Grant Likely      2010-04-13 =
 461  	if (!dev->dev.of_node) {
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 462  		dev_err(&dev->dev, "Device OF-Node is NULL");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 463  		return -ENODEV;
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 464  	}
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 465 =20
de8d11bc6ec412a arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-03-27 =
 466  	rio_regs_win =3D of_iomap(dev->dev.of_node, 0);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 467  	if (!rio_regs_win) {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 468  		dev_err(&dev->dev, "Unable to map rio register window\n");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 469  		rc =3D -ENOMEM;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 470  		goto err_rio_regs;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 471  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 472 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 473  	ops =3D kzalloc(sizeof(struct rio_ops), GFP_KERNEL);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 474  	if (!ops) {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 475  		rc =3D -ENOMEM;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 476  		goto err_ops;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 477  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 478  	ops->lcread =3D fsl_local_config_read;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 479  	ops->lcwrite =3D fsl_local_config_write;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 480  	ops->cread =3D fsl_rio_config_read;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 481  	ops->cwrite =3D fsl_rio_config_write;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 482  	ops->dsend =3D fsl_rio_doorbell_send;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 483  	ops->pwenable =3D fsl_rio_pw_enable;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 484  	ops->open_outb_mbox =3D fsl_open_outb_mbox;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 485  	ops->open_inb_mbox =3D fsl_open_inb_mbox;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 486  	ops->close_outb_mbox =3D fsl_close_outb_mbox;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 487  	ops->close_inb_mbox =3D fsl_close_inb_mbox;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 488  	ops->add_outb_message =3D fsl_add_outb_message;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 489  	ops->add_inb_buffer =3D fsl_add_inb_buffer;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 490  	ops->get_inb_message =3D fsl_get_inb_message;
e6a546fd03753ff arch/powerpc/sysdev/fsl_rio.c Martijn de Gouw   2014-08-05 =
 491  	ops->map_inb =3D fsl_map_inb_mem;
e6a546fd03753ff arch/powerpc/sysdev/fsl_rio.c Martijn de Gouw   2014-08-05 =
 492  	ops->unmap_inb =3D fsl_unmap_inb_mem;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 493 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 494  	rmu_node =3D of_parse_phandle(dev->dev.of_node, "fsl,srio-rmu-handle=
", 0);
a614db9ae9377f1 arch/powerpc/sysdev/fsl_rio.c Scott Wood        2014-04-28 =
 495  	if (!rmu_node) {
a614db9ae9377f1 arch/powerpc/sysdev/fsl_rio.c Scott Wood        2014-04-28 =
 496  		dev_err(&dev->dev, "No valid fsl,srio-rmu-handle property\n");
380afa3698781e1 arch/powerpc/sysdev/fsl_rio.c Dan Carpenter     2016-08-04 =
 497  		rc =3D -ENOENT;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 498  		goto err_rmu;
a614db9ae9377f1 arch/powerpc/sysdev/fsl_rio.c Scott Wood        2014-04-28 =
 499  	}
de8d11bc6ec412a arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-03-27 =
 500  	rmu_regs_win =3D of_iomap(rmu_node, 0);
de8d11bc6ec412a arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-03-27 =
 501 =20
fcee96924ba1596 arch/powerpc/sysdev/fsl_rio.c Miaoqian Lin      2022-05-12 =
 502  	of_node_put(rmu_node);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 503  	if (!rmu_regs_win) {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 504  		dev_err(&dev->dev, "Unable to map rmu register window\n");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 505  		rc =3D -ENOMEM;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 506  		goto err_rmu;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 507  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 508  	for_each_compatible_node(np, NULL, "fsl,srio-msg-unit") {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 509  		rmu_np[tmp] =3D np;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 510  		tmp++;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 511  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 512 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 513  	/*set up doobell node*/
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 514  	np =3D of_find_compatible_node(NULL, NULL, "fsl,srio-dbell-unit");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 515  	if (!np) {
a614db9ae9377f1 arch/powerpc/sysdev/fsl_rio.c Scott Wood        2014-04-28 =
 516  		dev_err(&dev->dev, "No fsl,srio-dbell-unit node\n");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 517  		rc =3D -ENODEV;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 518  		goto err_dbell;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 519  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 520  	dbell =3D kzalloc(sizeof(struct fsl_rio_dbell), GFP_KERNEL);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 521  	if (!(dbell)) {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 522  		dev_err(&dev->dev, "Can't alloc memory for 'fsl_rio_dbell'\n");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 523  		rc =3D -ENOMEM;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 524  		goto err_dbell;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 525  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 526  	dbell->dev =3D &dev->dev;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 527  	dbell->bellirq =3D irq_of_parse_and_map(np, 1);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 528  	dev_info(&dev->dev, "bellirq: %d\n", dbell->bellirq);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 529 =20
f892ac774b34a76 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 530  	if (of_property_read_reg(np, 0, &range_start, NULL)) {
b7c670d673d1186 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2017-08-21 =
 531  		pr_err("%pOF: unable to find 'reg' property\n",
b7c670d673d1186 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2017-08-21 =
 532  			np);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 533  		rc =3D -ENOMEM;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 534  		goto err_pw;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 535  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 536  	dbell->dbell_regs =3D (struct rio_dbell_regs *)(rmu_regs_win +
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 537  				(u32)range_start);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 538 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 539  	/*set up port write node*/
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 540  	np =3D of_find_compatible_node(NULL, NULL, "fsl,srio-port-write-unit=
");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 541  	if (!np) {
a614db9ae9377f1 arch/powerpc/sysdev/fsl_rio.c Scott Wood        2014-04-28 =
 542  		dev_err(&dev->dev, "No fsl,srio-port-write-unit node\n");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 543  		rc =3D -ENODEV;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 544  		goto err_pw;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 545  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 546  	pw =3D kzalloc(sizeof(struct fsl_rio_pw), GFP_KERNEL);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 547  	if (!(pw)) {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 548  		dev_err(&dev->dev, "Can't alloc memory for 'fsl_rio_pw'\n");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 549  		rc =3D -ENOMEM;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 550  		goto err_pw;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 551  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 552  	pw->dev =3D &dev->dev;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 553  	pw->pwirq =3D irq_of_parse_and_map(np, 0);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 554  	dev_info(&dev->dev, "pwirq: %d\n", pw->pwirq);
f892ac774b34a76 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 555  	if (of_property_read_reg(np, 0, &range_start, NULL)) {
b7c670d673d1186 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2017-08-21 =
 556  		pr_err("%pOF: unable to find 'reg' property\n",
b7c670d673d1186 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2017-08-21 =
 557  			np);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 558  		rc =3D -ENOMEM;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 559  		goto err;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 560  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 561  	pw->pw_regs =3D (struct rio_pw_regs *)(rmu_regs_win + (u32)range_sta=
rt);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 562 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 563  	/*set up ports node*/
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 564  	for_each_child_of_node(dev->dev.of_node, np) {
c4ae1799a5a3583 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 565  		struct resource res;
c4ae1799a5a3583 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 566 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 567  		port_index =3D of_get_property(np, "cell-index", NULL);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 568  		if (!port_index) {
b7c670d673d1186 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2017-08-21 =
 569  			dev_err(&dev->dev, "Can't get %pOF property 'cell-index'\n",
b7c670d673d1186 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2017-08-21 =
 570  					np);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 571  			continue;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 572  		}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 573 =20
c4ae1799a5a3583 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 574  		if (of_range_to_resource(np, 0, &res)) {
b7c670d673d1186 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2017-08-21 =
 575  			dev_err(&dev->dev, "Can't get %pOF property 'ranges'\n",
b7c670d673d1186 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2017-08-21 =
 576  					np);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 577  			continue;
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 578  		}
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 579 =20
c4ae1799a5a3583 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 580  		dev_info(&dev->dev, "%pOF: LAW %pR\n",
c4ae1799a5a3583 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 581  				np, &res);
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 582 =20
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 583  		port =3D kzalloc(sizeof(struct rio_mport), GFP_KERNEL);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 584  		if (!port)
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 585  			continue;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 586 =20
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 587  		rc =3D rio_mport_initialize(port);
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 588  		if (rc) {
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 589  			kfree(port);
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 590  			continue;
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 591  		}
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 592 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 593  		i =3D *port_index - 1;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 594  		port->index =3D (unsigned char)i;
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 595 =20
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 596  		priv =3D kzalloc(sizeof(struct rio_priv), GFP_KERNEL);
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 597  		if (!priv) {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 598  			dev_err(&dev->dev, "Can't alloc memory for 'priv'\n");
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 599  			kfree(port);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 600  			continue;
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 601  		}
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 602 =20
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 603  		INIT_LIST_HEAD(&port->dbells);
c4ae1799a5a3583 arch/powerpc/sysdev/fsl_rio.c Rob Herring       2023-06-09 =
 604  		port->iores =3D res;	/* struct copy */
186e74b9c5ab3f3 arch/powerpc/sysdev/fsl_rio.c Li Yang           2009-05-12 =
 605  		port->iores.name =3D "rio_io_win";
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 606 =20
c1256ebe6a10bb3 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2011-03-23 =
 607  		if (request_resource(&iomem_resource, &port->iores) < 0) {
c1256ebe6a10bb3 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2011-03-23 =
 608  			dev_err(&dev->dev, "RIO: Error requesting master port region"
c1256ebe6a10bb3 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2011-03-23 =
 609  				" 0x%016llx-0x%016llx\n",
c1256ebe6a10bb3 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2011-03-23 =
 610  				(u64)port->iores.start, (u64)port->iores.end);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 611  				kfree(priv);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 612  				kfree(port);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 613  				continue;
c1256ebe6a10bb3 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2011-03-23 =
 614  		}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 615  		sprintf(port->name, "RIO mport %d", i);
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 616 =20
0dbbbf1a0e305ad arch/powerpc/sysdev/fsl_rio.c Anton Vorontsov   2009-04-18 =
 617  		priv->dev =3D &dev->dev;
2aaf308b95b2464 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2014-04-07 =
 618  		port->dev.parent =3D &dev->dev;
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 619  		port->ops =3D ops;
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 620  		port->priv =3D priv;
af84ca38aff9406 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2010-10-27 =
 621  		port->phys_efptr =3D 0x100;
adff1649e6d66d9 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-08-02 =
 622  		port->phys_rmap =3D 1;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 623  		priv->regs_win =3D rio_regs_win;
e042323607f5c14 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 624 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 625  		ccsr =3D in_be32(priv->regs_win + RIO_CCSR + i*0x20);
adff1649e6d66d9 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-08-02 =
 626 =20
7f620df839661b3 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 627  		/* Checking the port training status */
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 628  		if (in_be32((priv->regs_win + RIO_ESCSR + i*0x20)) & 1) {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 629  			dev_err(&dev->dev, "Port %d is not ready. "
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 630  			"Try to restart connection...\n", i);
7f620df839661b3 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 631  			/* Disable ports */
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 632  			out_be32(priv->regs_win
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 633  				+ RIO_CCSR + i*0x20, 0);
7f620df839661b3 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 634  			/* Set 1x lane */
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 635  			setbits32(priv->regs_win
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 636  				+ RIO_CCSR + i*0x20, 0x02000000);
7f620df839661b3 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 637  			/* Enable ports */
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 638  			setbits32(priv->regs_win
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 639  				+ RIO_CCSR + i*0x20, 0x00600000);
7f620df839661b3 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 640  			msleep(100);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 641  			if (in_be32((priv->regs_win
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 642  					+ RIO_ESCSR + i*0x20)) & 1) {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 643  				dev_err(&dev->dev,
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 644  					"Port %d restart failed.\n", i);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 645  				release_resource(&port->iores);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 646  				kfree(priv);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 647  				kfree(port);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 648  				continue;
7f620df839661b3 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 649  			}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 650  			dev_info(&dev->dev, "Port %d restart success!\n", i);
7f620df839661b3 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 651  		}
7f620df839661b3 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 652  		fsl_rio_info(&dev->dev, ccsr);
61b269179df582b arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 653 =20
e042323607f5c14 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 654  		port->sys_size =3D (in_be32((priv->regs_win + RIO_PEF_CAR))
e042323607f5c14 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 655  					& RIO_PEF_CTLS) >> 4;
e042323607f5c14 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 656  		dev_info(&dev->dev, "RapidIO Common Transport System size: %d\n",
e042323607f5c14 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 657  				port->sys_size ? 65536 : 256);
e042323607f5c14 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 658 =20
af84ca38aff9406 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2010-10-27 =
 659  		if (port->host_deviceid >=3D 0)
af84ca38aff9406 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2010-10-27 =
 660  			out_be32(priv->regs_win + RIO_GCCSR, RIO_PORT_GEN_HOST |
af84ca38aff9406 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2010-10-27 =
 661  				RIO_PORT_GEN_MASTER | RIO_PORT_GEN_DISCOVERED);
af84ca38aff9406 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2010-10-27 =
 662  		else
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 663  			out_be32(priv->regs_win + RIO_GCCSR,
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 664  				RIO_PORT_GEN_MASTER);
af84ca38aff9406 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2010-10-27 =
 665 =20
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 666  		priv->atmu_regs =3D (struct rio_atmu_regs *)(priv->regs_win
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 667  			+ ((i =3D=3D 0) ? RIO_ATMU_REGS_PORT1_OFFSET :
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 668  			RIO_ATMU_REGS_PORT2_OFFSET));
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 669 =20
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 670  		priv->maint_atmu_regs =3D priv->atmu_regs + 1;
e6a546fd03753ff arch/powerpc/sysdev/fsl_rio.c Martijn de Gouw   2014-08-05 =
 671  		priv->inb_atmu_regs =3D (struct rio_inb_atmu_regs __iomem *)
e6a546fd03753ff arch/powerpc/sysdev/fsl_rio.c Martijn de Gouw   2014-08-05 =
 672  			(priv->regs_win +
e6a546fd03753ff arch/powerpc/sysdev/fsl_rio.c Martijn de Gouw   2014-08-05 =
 673  			((i =3D=3D 0) ? RIO_INB_ATMU_REGS_PORT1_OFFSET :
e6a546fd03753ff arch/powerpc/sysdev/fsl_rio.c Martijn de Gouw   2014-08-05 =
 674  			RIO_INB_ATMU_REGS_PORT2_OFFSET));
e6a546fd03753ff arch/powerpc/sysdev/fsl_rio.c Martijn de Gouw   2014-08-05 =
 675 =20
adff1649e6d66d9 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-08-02 =
 676  		/* Set to receive packets with any dest ID */
adff1649e6d66d9 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-08-02 =
 677  		out_be32((priv->regs_win + RIO_ISR_AACR + i*0x80),
adff1649e6d66d9 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-08-02 =
 678  			 RIO_ISR_AACR_AA);
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 679 =20
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 680  		/* Configure maintenance transaction window */
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 681  		out_be32(&priv->maint_atmu_regs->rowbar,
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 682  			port->iores.start >> 12);
bd4fb654e3a0d83 arch/powerpc/sysdev/fsl_rio.c Thomas Moll       2010-05-26 =
 683  		out_be32(&priv->maint_atmu_regs->rowar,
bd4fb654e3a0d83 arch/powerpc/sysdev/fsl_rio.c Thomas Moll       2010-05-26 =
 684  			 0x80077000 | (ilog2(RIO_MAINT_WIN_SIZE) - 1));
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 685 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 686  		priv->maint_win =3D ioremap(port->iores.start,
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 687  				RIO_MAINT_WIN_SIZE);
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 688 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 689  		rio_law_start =3D range_start;
6ec4bedbf153a8e arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 690 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 691  		fsl_rio_setup_rmu(port, rmu_np[i]);
e6a546fd03753ff arch/powerpc/sysdev/fsl_rio.c Martijn de Gouw   2014-08-05 =
 692  		fsl_rio_inbound_mem_init(priv);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 693 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 694  		dbell->mport[i] =3D port;
9a0b062742e7e03 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 695  		pw->mport[i] =3D port;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 696 =20
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 697  		if (rio_register_mport(port)) {
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 698  			release_resource(&port->iores);
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 699  			kfree(priv);
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 700  			kfree(port);
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 701  			continue;
dd64f4fe6fe5e39 arch/powerpc/sysdev/fsl_rio.c Alexandre Bounine 2016-03-22 =
 702  		}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 703  		active_ports++;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 704  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 705 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 706  	if (!active_ports) {
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 707  		rc =3D -ENOLINK;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 708  		goto err;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 709  	}
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 710 =20
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 711  	fsl_rio_doorbell_init(dbell);
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 712  	fsl_rio_port_write_init(pw);
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 713 =20
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 714  	return 0;
ad1e9380b17addf arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 715  err:
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 716  	kfree(pw);
a614db9ae9377f1 arch/powerpc/sysdev/fsl_rio.c Scott Wood        2014-04-28 =
 717  	pw =3D NULL;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 718  err_pw:
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 719  	kfree(dbell);
a614db9ae9377f1 arch/powerpc/sysdev/fsl_rio.c Scott Wood        2014-04-28 =
 720  	dbell =3D NULL;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 721  err_dbell:
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 722  	iounmap(rmu_regs_win);
a614db9ae9377f1 arch/powerpc/sysdev/fsl_rio.c Scott Wood        2014-04-28 =
 723  	rmu_regs_win =3D NULL;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 724  err_rmu:
6c75933c00049be arch/powerpc/sysdev/fsl_rio.c Julia Lawall      2009-08-07 =
 725  	kfree(ops);
6c75933c00049be arch/powerpc/sysdev/fsl_rio.c Julia Lawall      2009-08-07 =
 726  err_ops:
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 727  	iounmap(rio_regs_win);
a614db9ae9377f1 arch/powerpc/sysdev/fsl_rio.c Scott Wood        2014-04-28 =
 728  	rio_regs_win =3D NULL;
abc3aeae3aaa5c3 arch/powerpc/sysdev/fsl_rio.c Liu Gang          2011-11-12 =
 729  err_rio_regs:
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
@730  	return rc;
2b0c28d7f8846f8 arch/ppc/syslib/ppc85xx_rio.c Matt Porter       2005-11-07 =
 731  }
cc2bb6968a2c842 arch/powerpc/sysdev/fsl_rio.c Zhang Wei         2008-04-18 =
 732 =20

:::::: The code at line 730 was first introduced by commit
:::::: cc2bb6968a2c842149d285d77cb35200d2d37b15 [RAPIDIO] Add OF-tree suppo=
rt to RapidIO controller driver

:::::: TO: Zhang Wei <wei.zhang@freescale.com>
:::::: CC: Paul Mackerras <paulus@samba.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
