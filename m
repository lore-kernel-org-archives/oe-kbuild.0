Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CBA1F3D2B
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736274857; cv=none; b=qke6rKoiyEDw0W0cUE4W6dIEYd8QJFW6AeUjKmatgGaTfcLcbJ1jMjr3HJNxIlN+mOcEU+amn+7Dyw+H238RHX1l3jiRcND5ErLtUtV6m+z3mbX9O5QjP9yFhnA8gB3ZlzL7mM7qnqx8fC3Wj24xz6LDbpA6KttYOB2FtwBl4IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736274857; c=relaxed/simple;
	bh=2j9nRoP/Uv6E1Q/UJ4BytYh7Q40ehPubdsVrfHLffG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EzotClgxmdl3EAkZvoysUb+Gyid9Vs7UCoRgGXhACzDo9DmQ95CN23lB9dmhI0v8i2sSTpdTdxvDJxSrnzvGyWaClK5AdMsfL91THg1txT/CTgJYB+uXO4X9NYy2/oIePs0kGIp+vkQlFOfzijXR0FcKIJDEa+urMrqXmiryqxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKKndi1t; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKKndi1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736274854; x=1767810854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2j9nRoP/Uv6E1Q/UJ4BytYh7Q40ehPubdsVrfHLffG8=;
  b=QKKndi1t6Bb1gE03FmBXZn8dLJ8iIySBaQ5CKehrQEOe3yrMLW6PP811
   W5gHTuZ+MIcduskTmxdSxcEvT4Mqw2ZFiGYH92llJlWPsdYtIsybhv3bn
   moDztqkchzDA+NOQ5wt3FXuawtxTek6vqAil04mMHi9XBTqxB4MYbISLo
   1EtKz/R+2hO7LJggGJYv+5lW5M7NuXPtyo3HF5CwBGWC6ApWH7nDi4tL3
   blINLhoak6Xs4mYxILHixYu9zCo0JszJb84w6juUo4UYQfjey469u/wkP
   ZoCfjwH6IpoLFWn67CCTJgOXwzHJ750Dhrc/oUgOVc56PGQVDAlSXJ8Jl
   w==;
X-CSE-ConnectionGUID: 5/XUxol7RumCtTVwV63rwg==
X-CSE-MsgGUID: g7nz9NOiTtWoz1YjEolxjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47051994"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47051994"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:34:14 -0800
X-CSE-ConnectionGUID: RqGsa4ToRl6EMvrp8G4yFQ==
X-CSE-MsgGUID: 8GOVcIT4Q52lw+lujTX4BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107944755"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jan 2025 10:34:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVEP4-000F65-1d;
	Tue, 07 Jan 2025 18:34:10 +0000
Date: Wed, 8 Jan 2025 02:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4803/6768]
 drivers/mtd/nand/raw/davinci_nand.c:797:22-23: WARNING opportunity for max()
Message-ID: <202501080245.RMPN2ZFD-lkp@intel.com>
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
TO: Bastien Curutchet <bastien.curutchet@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b4b9bf203da94fbeac75ed3116c84aa03e74578
commit: c7a94e96f8ece5c87d73bfa4751d75eabb971ea6 [4803/6768] mtd: rawnand: davinci: Implement setup_interface() operation
:::::: branch date: 13 hours ago
:::::: commit date: 2 weeks ago
config: parisc-randconfig-r052-20250107 (https://download.01.org/0day-ci/archive/20250108/202501080245.RMPN2ZFD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501080245.RMPN2ZFD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/davinci_nand.c:797:22-23: WARNING opportunity for max()
   drivers/mtd/nand/raw/davinci_nand.c:801:23-24: WARNING opportunity for max()
   drivers/mtd/nand/raw/davinci_nand.c:808:21-22: WARNING opportunity for max()
   drivers/mtd/nand/raw/davinci_nand.c:816:18-19: WARNING opportunity for max()
   drivers/mtd/nand/raw/davinci_nand.c:819:23-24: WARNING opportunity for max()
   drivers/mtd/nand/raw/davinci_nand.c:823:22-23: WARNING opportunity for max()
   drivers/mtd/nand/raw/davinci_nand.c:832:21-22: WARNING opportunity for max()

vim +797 drivers/mtd/nand/raw/davinci_nand.c

c7a94e96f8ece5 Bastien Curutchet 2024-12-04  780  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  781  static int davinci_nand_setup_interface(struct nand_chip *chip, int chipnr,
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  782  					const struct nand_interface_config *conf)
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  783  {
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  784  	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(chip));
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  785  	const struct nand_sdr_timings *sdr;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  786  	struct aemif_cs_timings timings;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  787  	s32 cfg, min, cyc_ns;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  788  	int ret;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  789  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  790  	cyc_ns = 1000000000 / clk_get_rate(info->clk);
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  791  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  792  	sdr = nand_get_sdr_timings(conf);
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  793  	if (IS_ERR(sdr))
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  794  		return PTR_ERR(sdr);
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  795  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  796  	cfg = TO_CYCLES(sdr->tCLR_min, cyc_ns) - 1;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04 @797  	timings.rsetup = cfg > 0 ? cfg : 0;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  798  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  799  	cfg = max_t(s32, TO_CYCLES(sdr->tREA_max + MAX_TSU_PS, cyc_ns),
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  800  		    TO_CYCLES(sdr->tRP_min, cyc_ns)) - 1;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  801  	timings.rstrobe = cfg > 0 ? cfg : 0;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  802  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  803  	min = TO_CYCLES(sdr->tCEA_max + MAX_TSU_PS, cyc_ns) - 2;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  804  	while ((s32)(timings.rsetup + timings.rstrobe) < min)
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  805  		timings.rstrobe++;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  806  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  807  	cfg = TO_CYCLES((s32)(MAX_TH_PS - sdr->tCHZ_max), cyc_ns) - 1;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  808  	timings.rhold = cfg > 0 ? cfg : 0;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  809  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  810  	min = TO_CYCLES(sdr->tRC_min, cyc_ns) - 3;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  811  	while ((s32)(timings.rsetup + timings.rstrobe + timings.rhold) < min)
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  812  		timings.rhold++;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  813  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  814  	cfg = TO_CYCLES((s32)(sdr->tRHZ_max - (timings.rhold + 1) * cyc_ns * 1000), cyc_ns);
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  815  	cfg = max_t(s32, cfg, TO_CYCLES(sdr->tCHZ_max, cyc_ns)) - 1;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  816  	timings.ta = cfg > 0 ? cfg : 0;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  817  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  818  	cfg = TO_CYCLES(sdr->tWP_min, cyc_ns) - 1;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  819  	timings.wstrobe = cfg > 0 ? cfg : 0;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  820  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  821  	cfg = max_t(s32, TO_CYCLES(sdr->tCLS_min, cyc_ns), TO_CYCLES(sdr->tALS_min, cyc_ns));
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  822  	cfg = max_t(s32, cfg, TO_CYCLES(sdr->tCS_min, cyc_ns)) - 1;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  823  	timings.wsetup = cfg > 0 ? cfg : 0;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  824  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  825  	min = TO_CYCLES(sdr->tDS_min, cyc_ns) - 2;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  826  	while ((s32)(timings.wsetup + timings.wstrobe) < min)
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  827  		timings.wstrobe++;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  828  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  829  	cfg = max_t(s32, TO_CYCLES(sdr->tCLH_min, cyc_ns), TO_CYCLES(sdr->tALH_min, cyc_ns));
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  830  	cfg = max_t(s32, cfg, TO_CYCLES(sdr->tCH_min, cyc_ns));
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  831  	cfg = max_t(s32, cfg, TO_CYCLES(sdr->tDH_min, cyc_ns)) - 1;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  832  	timings.whold = cfg > 0 ? cfg : 0;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  833  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  834  	min = TO_CYCLES(sdr->tWC_min, cyc_ns) - 2;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  835  	while ((s32)(timings.wsetup + timings.wstrobe + timings.whold) < min)
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  836  		timings.whold++;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  837  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  838  	dev_dbg(&info->pdev->dev, "RSETUP %x RSTROBE %x RHOLD %x\n",
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  839  		timings.rsetup, timings.rstrobe, timings.rhold);
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  840  	dev_dbg(&info->pdev->dev, "TA %x\n", timings.ta);
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  841  	dev_dbg(&info->pdev->dev, "WSETUP %x WSTROBE %x WHOLD %x\n",
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  842  		timings.wsetup, timings.wstrobe, timings.whold);
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  843  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  844  	ret = aemif_check_cs_timings(&timings);
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  845  	if (ret || chipnr == NAND_DATA_IFACE_CHECK_ONLY)
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  846  		return ret;
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  847  
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  848  	return aemif_set_cs_timings(info->aemif, info->core_chipsel, &timings);
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  849  }
c7a94e96f8ece5 Bastien Curutchet 2024-12-04  850  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
