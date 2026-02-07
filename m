Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587EA238D22
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 05:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770440672; cv=none; b=eXC3KS76LFkTY1zr3U+vfJQ5/8Xbs16Ey0f1sCt2gfE6eChqdVgaLZCQv9IXhEr2HkZLCmIZqHrj7zla0tRnBhAz8LBp7A3X5PHsdmF0Ug+nxlASSoj0ofaVZVOF7yzsxzrPWq1CWxvHuPE9M+18VhXlpyT47Z216jJc3FibLQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770440672; c=relaxed/simple;
	bh=u3lGBOzSPCIItL6n20+n30Fq6YC/NqJmayd/AXqkzpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kKySYaZ1uKSGT1xI6++a0sYD4VqRlUBwFnxnM9foEkn8YPrLmp27twI0dWPIjw/LAVwtfDmIKOBA5dD8Ktniu+tq3R4r3qZ6bTpK3kIXo/LKtlsoK5f5s3LFUi/JnwwhQgitRa6DZINvMh57smiWwDhEmQ9E/sqg7I+GSv0NiKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRGziDTt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRGziDTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770440672; x=1801976672;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u3lGBOzSPCIItL6n20+n30Fq6YC/NqJmayd/AXqkzpo=;
  b=PRGziDTtVc3VWF3qVa+SgCMdLMBh0ubWIEuoHyip7b5lf7qw2c75B/X8
   6ONlabK7xOgq2xaO9cjH3fnCUR/xDYJniBPk5Bgy1L0ySfqdbUoz6Nqii
   +iTgxewZg/ONQupG4CtnMCprN73VCHFPBJ9HaOm0Z8G0IuwG8z1927hLm
   CJ5//aLTMseCZhmyXx1NDbyfnGfGUIZPq4r8rPGAkNEssqCDnE0LwcHQZ
   hbihYx6hd64RBW7NzZuLmbM1TW8JTlKUWqQfhgJdpDLA9Bzx//v32czFl
   kdTI165YGr2Y4DoKa/E/JpP426RYQRlXO1QVmBxZmediyPNrgFkIPMrlP
   A==;
X-CSE-ConnectionGUID: 3ptr22jZTzaF9VaKxh3Oww==
X-CSE-MsgGUID: /sE9on1MSH+G+chi54hQdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71709221"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71709221"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 21:04:31 -0800
X-CSE-ConnectionGUID: eB9F9xbgT46KLYQj7A335A==
X-CSE-MsgGUID: cVEQt1RnSCWrgVFB/RayKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="211085257"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2026 21:04:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voaUd-00000000lOu-29LJ;
	Sat, 07 Feb 2026 05:04:27 +0000
Date: Sat, 07 Feb 2026 13:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:combined_queue 12/12]
 drivers/spi/spi-cadence-quadspi.c:1437:13: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202602071347.cu0nUaHs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/spi/spi-cadence-quadspi.c:1437:13: sparse: sparse: unsigned value =
that used to be signed checked against zero?"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ido Schimmel <idosch@nvidia.com>
CC: Petr Machata <petrm@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   fe68638208033b4de7dc5a0426c0bc22357fd67e
commit: fe68638208033b4de7dc5a0426c0bc22357fd67e [12/12] TMP: Revert "modul=
e: Add compile-time check for embedded NUL characters"
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: m68k-randconfig-r132-20260207 (https://download.01.org/0day-ci/arch=
ive/20260207/202602071347.cu0nUaHs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260207/202602071347.cu0nUaHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602071347.cu0nUaHs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-cadence-quadspi.c:1437:13: sparse: sparse: unsigned valu=
e that used to be signed checked against zero?
   drivers/spi/spi-cadence-quadspi.c:1425:23: sparse: signed value source

vim +1437 drivers/spi/spi-cadence-quadspi.c

ffa639e069fb55 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R =
                 2018-04-10  1417 =20
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1418  static ssize_t cqspi_read(struct cqspi_f=
lash_pdata *f_pdata,
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1419  			  const struct spi_mem_op *op)
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moo=
re               2016-06-04  1420  {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1421  	struct cqspi_st *cqspi =3D f_pdata->cqs=
pi;
dcc594aef1bf3a drivers/spi/spi-cadence-quadspi.c                 Th=C3=A9o =
Lebrun                2024-04-05  1422  	const struct cqspi_driver_platdata=
 *ddata =3D cqspi->ddata;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1423  	loff_t from =3D op->addr.val;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1424  	size_t len =3D op->data.nbytes;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1425  	u_char *buf =3D op->data.buf.in;
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishn=
a Potthuri       2021-09-24  1426  	u64 dma_align =3D (u64)(uintptr_t)buf;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moo=
re               2016-06-04  1427  	int ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moo=
re               2016-06-04  1428 =20
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1429  	ret =3D cqspi_read_setup(f_pdata, op);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moo=
re               2016-06-04  1430  	if (ret)
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moo=
re               2016-06-04  1431  		return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moo=
re               2016-06-04  1432 =20
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1433  	if (cqspi->use_direct_mode && ((from + =
len) <=3D cqspi->ahb_size))
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1434  		return cqspi_direct_read_execute(f_pda=
ta, buf, from, len);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moo=
re               2016-06-04  1435 =20
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishn=
a Potthuri       2021-09-24  1436  	if (cqspi->use_dma_read && ddata && dda=
ta->indirect_read_dma &&
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishn=
a Potthuri       2021-09-24 @1437  	    virt_addr_valid(buf) && ((dma_align=
 & CQSPI_DMA_UNALIGN) =3D=3D 0))
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishn=
a Potthuri       2021-09-24  1438  		return ddata->indirect_read_dma(f_pdat=
a, buf, from, len);
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishn=
a Potthuri       2021-09-24  1439 =20
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar=
 Vadivel Murugan 2020-06-01  1440  	return cqspi_indirect_read_execute(f_pd=
ata, buf, from, len);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moo=
re               2016-06-04  1441  }
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moo=
re               2016-06-04  1442 =20

:::::: The code at line 1437 was first introduced by commit
:::::: 1a6f854f7daab100ff0a94d31f35a387b462b4d1 spi: cadence-quadspi: Add X=
ilinx Versal external DMA support

:::::: TO: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
