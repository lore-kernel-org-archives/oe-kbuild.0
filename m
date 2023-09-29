Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450BE3C37
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Sep 2023 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695996184; x=1727532184;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qM+vJwM49ipA/E5Yv/HgeNbqWigxrHJLTMVU+5SIU3Y=;
  b=AsZX8sqgorWtX5fYcwtCN9Rtw9muJ8bwpMUSH9q6xlzHibrStdTLigU4
   u4vSzFPyafDpzWVUWc5fTHMeQ+IUNEcqtwwvs52lzVHPBHj5VgTlCrzq6
   br89/0lYqEh8bTljx3nftc63mG+7MCsbr3YnVe3AVv5XY3zj6Hu0jLpWo
   dFp66Y04HAXX11Ag/nuRZlpbXDVUlPxrUO3VCZGvVYS5DMxJeSG16okgA
   qIPJkasGM1BbtLsF/Mi7Z7pfmj7DfVBQga+BvDjFRs4TU2QhOtFpxXc1j
   O3WYIkzaOSQuvZXj0XiGRc4tq8IlaR/EvPxiGmyUMqXakoBSJiDytfK0g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367360388"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="367360388"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 07:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="1080944286"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="1080944286"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Sep 2023 07:02:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmE4i-0002vV-2X;
	Fri, 29 Sep 2023 14:02:36 +0000
Date: Fri, 29 Sep 2023 22:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: check nand support for cache reads
Message-ID: <202309292142.T5cC8cqe-lkp@intel.com>
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
In-Reply-To: <20230922100116.145090-1-r.czerwinski@pengutronix.de>
References: <20230922100116.145090-1-r.czerwinski@pengutronix.de>
TO: Rouven Czerwinski <r.czerwinski@pengutronix.de>
TO: "Martin Hundebøll" <martin@geanix.com>
TO: "Måns Rullgård" <mans@mansr.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: JaimeLiao <jaimeliao.tw@gmail.com>
CC: kernel@pengutronix.de
CC: Rouven Czerwinski <r.czerwinski@pengutronix.de>
CC: linux-mtd@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Rouven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rouven-Czerwinski/mtd-rawnand-check-nand-support-for-cache-reads/20230922-180317
base:   linus/master
patch link:    https://lore.kernel.org/r/20230922100116.145090-1-r.czerwinski%40pengutronix.de
patch subject: [PATCH] mtd: rawnand: check nand support for cache reads
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20230929 (https://download.01.org/0day-ci/archive/20230929/202309292142.T5cC8cqe-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309292142.T5cC8cqe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309292142.T5cC8cqe-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/nand_jedec.c:98 nand_jedec_detect() warn: statement has no effect 8
drivers/mtd/nand/raw/nand_onfi.c:307 nand_onfi_detect() warn: statement has no effect 8

vim +98 drivers/mtd/nand/raw/nand_jedec.c

2e8f56f2a94176 Miquel Raynal     2020-04-28  20  
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  21  /*
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  22   * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  23   */
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  24  int nand_jedec_detect(struct nand_chip *chip)
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  25  {
53576c7bfc3589 Miquel Raynal     2020-08-27  26  	struct nand_device *base = &chip->base;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  27  	struct mtd_info *mtd = nand_to_mtd(chip);
629a442cad5fac Boris Brezillon   2018-10-25  28  	struct nand_memory_organization *memorg;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  29  	struct nand_jedec_params *p;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  30  	struct jedec_ecc_info *ecc;
daca31765e8bea Miquel Raynal     2020-05-07  31  	bool use_datain = false;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  32  	int jedec_version = 0;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  33  	char id[5];
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  34  	int i, val, ret;
432ab89d3035fe Miquel Raynal     2020-04-28  35  	u16 crc;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  36  
629a442cad5fac Boris Brezillon   2018-10-25  37  	memorg = nanddev_get_memorg(&chip->base);
629a442cad5fac Boris Brezillon   2018-10-25  38  
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  39  	/* Try JEDEC for unknown chip or LP */
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  40  	ret = nand_readid_op(chip, 0x40, id, sizeof(id));
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  41  	if (ret || strncmp(id, "JEDEC", sizeof(id)))
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  42  		return 0;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  43  
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  44  	/* JEDEC chip: allocate a buffer to hold its parameter page */
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  45  	p = kzalloc(sizeof(*p), GFP_KERNEL);
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  46  	if (!p)
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  47  		return -ENOMEM;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  48  
9f820fc0651c32 Miquel Raynal     2023-01-12  49  	if (!nand_has_exec_op(chip) || chip->controller->supported_op.data_only_read)
daca31765e8bea Miquel Raynal     2020-05-07  50  		use_datain = true;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  51  
2e8f56f2a94176 Miquel Raynal     2020-04-28  52  	for (i = 0; i < JEDEC_PARAM_PAGES; i++) {
daca31765e8bea Miquel Raynal     2020-05-07  53  		if (!i)
daca31765e8bea Miquel Raynal     2020-05-07  54  			ret = nand_read_param_page_op(chip, 0x40, p,
daca31765e8bea Miquel Raynal     2020-05-07  55  						      sizeof(*p));
daca31765e8bea Miquel Raynal     2020-05-07  56  		else if (use_datain)
daca31765e8bea Miquel Raynal     2020-05-07  57  			ret = nand_read_data_op(chip, p, sizeof(*p), true,
daca31765e8bea Miquel Raynal     2020-05-07  58  						false);
daca31765e8bea Miquel Raynal     2020-05-07  59  		else
daca31765e8bea Miquel Raynal     2020-05-07  60  			ret = nand_change_read_column_op(chip, sizeof(*p) * i,
daca31765e8bea Miquel Raynal     2020-05-07  61  							 p, sizeof(*p), true);
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  62  		if (ret) {
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  63  			ret = 0;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  64  			goto free_jedec_param_page;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  65  		}
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  66  
432ab89d3035fe Miquel Raynal     2020-04-28  67  		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 510);
432ab89d3035fe Miquel Raynal     2020-04-28  68  		if (crc == le16_to_cpu(p->crc))
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  69  			break;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  70  	}
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  71  
2e8f56f2a94176 Miquel Raynal     2020-04-28  72  	if (i == JEDEC_PARAM_PAGES) {
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  73  		pr_err("Could not find valid JEDEC parameter page; aborting\n");
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  74  		goto free_jedec_param_page;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  75  	}
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  76  
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  77  	/* Check version */
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  78  	val = le16_to_cpu(p->revision);
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  79  	if (val & (1 << 2))
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  80  		jedec_version = 10;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  81  	else if (val & (1 << 1))
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  82  		jedec_version = 1; /* vendor specific version */
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  83  
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  84  	if (!jedec_version) {
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  85  		pr_info("unsupported JEDEC version: %d\n", val);
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  86  		goto free_jedec_param_page;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  87  	}
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  88  
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  89  	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  90  	sanitize_string(p->model, sizeof(p->model));
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  91  	chip->parameters.model = kstrdup(p->model, GFP_KERNEL);
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  92  	if (!chip->parameters.model) {
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  93  		ret = -ENOMEM;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  94  		goto free_jedec_param_page;
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  95  	}
8ae3fbf81b9cfd Boris Brezillon   2018-09-07  96  
040597624fe1ec Rouven Czerwinski 2023-09-22  97  	if (p->opt_cmd[0] & JEDEC_OPT_CMD_READ_CACHE)
040597624fe1ec Rouven Czerwinski 2023-09-22 @98  		chip->parameters.supports_read_cache;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
