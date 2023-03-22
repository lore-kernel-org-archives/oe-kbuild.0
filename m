Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0C58C01
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679498089; x=1711034089;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=asaArA1b3o/cy+0liO0LBU8crdB+pmRMRk8iUXYWEHw=;
  b=VgRbvsDlo4ouN1lSMwukTt+SCrjCqWnX1irisF10iYzqa5p0VIQ3yEnn
   rHfp7NVnfkaj9c9ZyVWjuWJNz6ykb+JKCcAzoGEEXg3wYd7hYIazYfXzh
   3cpcoX9jWkOe78F6bscaY6gTfSFlugK3GJKc/mUkDZWZnFYVWtP6pc8xm
   EdIJJ2ldutILTwYNGs+X3mXzNQtg5e+6X+PUf35LO1zge7n0eSu2pWtMy
   VrKEFsuacs/dGMK2UbvXc46uKS2Vom5VWShmpjn7mE2t2AlNb8Bwaz40j
   6xUyKXQTOFkAlzM/CG9Lpt52QFm0hXliKbORNavtLIvbFeVoQqkkGsNbV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404125979"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="404125979"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 08:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="712258309"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="712258309"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Mar 2023 08:12:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf08o-000DQI-0E;
	Wed, 22 Mar 2023 15:12:42 +0000
Date: Wed, 22 Mar 2023 23:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: =?iso-8859-1?Q?f?=
 =?iso-8859-1?Q?smc=3A_use=A0devm=5Fplatform=5Fioremap=5Fresource=5Fbyname?=
 =?iso-8859-1?B?KCk=?=
Message-ID: <202303222207.HGERupOc-lkp@intel.com>
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
In-Reply-To: <202303211954042531445@zte.com.cn>
References: <202303211954042531445@zte.com.cn>
TO: ye.xingchen@zte.com.cn
TO: miquel.raynal@bootlin.com
CC: richard@nod.at
CC: vigneshr@ti.com
CC: linux-mtd@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-com-cn/mtd-rawnand-fsmc-use-devm_platform_ioremap_resource_byname/20230321-195547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/202303211954042531445%40zte.com.cn
patch subject: [PATCH] mtd: rawnand: fsmc: use devm_platform_ioremap_resource_byname()
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/archive/20230322/202303222207.HGERupOc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303222207.HGERupOc-lkp@intel.com/

New smatch warnings:
drivers/mtd/nand/raw/fsmc_nand.c:1048 fsmc_nand_probe() error: potentially dereferencing uninitialized 'res'.

Old smatch warnings:
drivers/mtd/nand/raw/fsmc_nand.c:318 fsmc_calc_timings() warn: impossible condition '(tims->thold > 255) => (0-255 > 255)'
drivers/mtd/nand/raw/fsmc_nand.c:326 fsmc_calc_timings() warn: impossible condition '(tims->tset > 255) => (0-255 > 255)'
drivers/mtd/nand/raw/fsmc_nand.c:341 fsmc_calc_timings() warn: impossible condition '(tims->twait > 255) => (0-255 > 255)'

vim +/res +1048 drivers/mtd/nand/raw/fsmc_nand.c

ab3ab7b654ae69 drivers/mtd/nand/raw/fsmc_nand.c Linus Walleij                    2019-01-26  1016  
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1017  /*
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1018   * fsmc_nand_probe - Probe function
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1019   * @pdev:       platform device structure
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1020   */
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1021  static int __init fsmc_nand_probe(struct platform_device *pdev)
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1022  {
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1023  	struct fsmc_nand_data *host;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1024  	struct mtd_info *mtd;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1025  	struct nand_chip *nand;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1026  	struct resource *res;
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-02-16  1027  	void __iomem *base;
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1028  	dma_cap_mask_t mask;
4ad916bca7c372 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1029  	int ret = 0;
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1030  	u32 pid;
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1031  	int i;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1032  
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1033  	/* Allocate memory for the device structure (and zero it) */
82b9dbe2e0f687 drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1034  	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
d9a21ae8e5f3fe drivers/mtd/nand/fsmc_nand.c     Jingoo Han                       2013-12-26  1035  	if (!host)
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1036  		return -ENOMEM;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1037  
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1038  	nand = &host->nand;
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1039  
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1040  	ret = fsmc_nand_probe_config_dt(pdev, host, nand);
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1041  	if (ret)
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1042  		return ret;
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1043  
21cf7720019aa3 drivers/mtd/nand/raw/fsmc_nand.c Ye Xingchen                      2023-03-21  1044  	host->data_va = devm_platform_ioremap_resource_byname(pdev, "nand_data");
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding                   2013-01-21  1045  	if (IS_ERR(host->data_va))
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding                   2013-01-21  1046  		return PTR_ERR(host->data_va);
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding                   2013-01-21  1047  
6d7b42a447f92e drivers/mtd/nand/fsmc_nand.c     Jean-Christophe PLAGNIOL-VILLARD 2012-10-04 @1048  	host->data_pa = (dma_addr_t)res->start;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1049  
21cf7720019aa3 drivers/mtd/nand/raw/fsmc_nand.c Ye Xingchen                      2023-03-21  1050  	host->addr_va = devm_platform_ioremap_resource_byname(pdev, "nand_addr");
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding                   2013-01-21  1051  	if (IS_ERR(host->addr_va))
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding                   2013-01-21  1052  		return PTR_ERR(host->addr_va);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1053  
21cf7720019aa3 drivers/mtd/nand/raw/fsmc_nand.c Ye Xingchen                      2023-03-21  1054  	host->cmd_va = devm_platform_ioremap_resource_byname(pdev, "nand_cmd");
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding                   2013-01-21  1055  	if (IS_ERR(host->cmd_va))
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding                   2013-01-21  1056  		return PTR_ERR(host->cmd_va);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1057  
21cf7720019aa3 drivers/mtd/nand/raw/fsmc_nand.c Ye Xingchen                      2023-03-21  1058  	base = devm_platform_ioremap_resource_byname(pdev, "fsmc_regs");
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-02-16  1059  	if (IS_ERR(base))
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-02-16  1060  		return PTR_ERR(base);
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-02-16  1061  
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-02-16  1062  	host->regs_va = base + FSMC_NOR_REG_SIZE +
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-02-16  1063  		(host->bank * FSMC_NAND_BANK_SZ);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1064  
fb8ed2ca432443 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1065  	host->clk = devm_clk_get(&pdev->dev, NULL);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1066  	if (IS_ERR(host->clk)) {
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1067  		dev_err(&pdev->dev, "failed to fetch block clock\n");
82b9dbe2e0f687 drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1068  		return PTR_ERR(host->clk);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1069  	}
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1070  
e25da1c07dfb31 drivers/mtd/nand/fsmc_nand.c     Viresh Kumar                     2012-04-17  1071  	ret = clk_prepare_enable(host->clk);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1072  	if (ret)
fb8ed2ca432443 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1073  		return ret;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1074  
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1075  	/*
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1076  	 * This device ID is actually a common AMBA ID as used on the
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1077  	 * AMBA PrimeCell bus. However it is not a PrimeCell.
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1078  	 */
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1079  	for (pid = 0, i = 0; i < 4; i++)
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1080  		pid |= (readl(base + resource_size(res) - 0x20 + 4 * i) &
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1081  			255) << (i * 8);
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1082  
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1083  	host->pid = pid;
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1084  
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1085  	dev_info(&pdev->dev,
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1086  		 "FSMC device partno %03x, manufacturer %02x, revision %02x, config %02x\n",
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1087  		 AMBA_PART_BITS(pid), AMBA_MANF_BITS(pid),
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1088  		 AMBA_REV_BITS(pid), AMBA_CONFIG_BITS(pid));
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-11-29  1089  
712c4add032771 drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1090  	host->dev = &pdev->dev;
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1091  
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1092  	if (host->mode == USE_DMA_ACCESS)
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1093  		init_completion(&host->dma_access_complete);
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1094  
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1095  	/* Link all private pointers */
bdf3a555015260 drivers/mtd/nand/fsmc_nand.c     Boris Brezillon                  2015-12-10  1096  	mtd = nand_to_mtd(&host->nand);
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1097  	nand_set_flash_node(nand, pdev->dev.of_node);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1098  
bdf3a555015260 drivers/mtd/nand/fsmc_nand.c     Boris Brezillon                  2015-12-10  1099  	mtd->dev.parent = &pdev->dev;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1100  
467e6e7be2e26f drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1101  	nand->badblockbits = 7;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1102  
4da712e702941d drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-02-16  1103  	if (host->mode == USE_DMA_ACCESS) {
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1104  		dma_cap_zero(mask);
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1105  		dma_cap_set(DMA_MEMCPY, mask);
feb1e57ee58350 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1106  		host->read_dma_chan = dma_request_channel(mask, filter, NULL);
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1107  		if (!host->read_dma_chan) {
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1108  			dev_err(&pdev->dev, "Unable to get read dma channel\n");
e7a97528e3c787 drivers/mtd/nand/raw/fsmc_nand.c Dan Carpenter                    2021-02-15  1109  			ret = -ENODEV;
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1110  			goto disable_clk;
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1111  		}
feb1e57ee58350 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1112  		host->write_dma_chan = dma_request_channel(mask, filter, NULL);
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1113  		if (!host->write_dma_chan) {
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1114  			dev_err(&pdev->dev, "Unable to get write dma channel\n");
e7a97528e3c787 drivers/mtd/nand/raw/fsmc_nand.c Dan Carpenter                    2021-02-15  1115  			ret = -ENODEV;
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1116  			goto release_dma_read_chan;
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1117  		}
604e75444fa82c drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1118  	}
604e75444fa82c drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1119  
7a08dbaedd365f drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-11  1120  	if (host->dev_timings) {
6335b509b2b6fb drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-04-29  1121  		fsmc_nand_setup(host, host->dev_timings);
7a08dbaedd365f drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-11  1122  		nand->options |= NAND_KEEP_TIMINGS;
7a08dbaedd365f drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-11  1123  	}
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1124  
ad71148c1804c3 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1125  	nand_controller_init(&host->base);
ad71148c1804c3 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1126  	host->base.ops = &fsmc_nand_controller_ops;
ad71148c1804c3 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1127  	nand->controller = &host->base;
ad71148c1804c3 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-11-20  1128  
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1129  	/*
25985edcedea63 drivers/mtd/nand/fsmc_nand.c     Lucas De Marchi                  2011-03-30  1130  	 * Scan to find existence of the device
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1131  	 */
00ad378f304a09 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon                  2018-09-06  1132  	ret = nand_scan(nand, 1);
ad5678ec40764c drivers/mtd/nand/fsmc_nand.c     Masahiro Yamada                  2016-11-04  1133  	if (ret)
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1134  		goto release_dma_write_chan;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1135  
bdf3a555015260 drivers/mtd/nand/fsmc_nand.c     Boris Brezillon                  2015-12-10  1136  	mtd->name = "nand";
ede29a020ec3b4 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni                 2017-03-21  1137  	ret = mtd_device_register(mtd, NULL, 0);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1138  	if (ret)
682cae27b1da05 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1139  		goto cleanup_nand;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1140  
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1141  	platform_set_drvdata(pdev, host);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1142  	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1143  
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1144  	return 0;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1145  
682cae27b1da05 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1146  cleanup_nand:
682cae27b1da05 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1147  	nand_cleanup(nand);
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1148  release_dma_write_chan:
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1149  	if (host->mode == USE_DMA_ACCESS)
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1150  		dma_release_channel(host->write_dma_chan);
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1151  release_dma_read_chan:
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1152  	if (host->mode == USE_DMA_ACCESS)
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                      2012-03-14  1153  		dma_release_channel(host->read_dma_chan);
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1154  disable_clk:
ab3ab7b654ae69 drivers/mtd/nand/raw/fsmc_nand.c Linus Walleij                    2019-01-26  1155  	fsmc_nand_disable(host);
e25da1c07dfb31 drivers/mtd/nand/fsmc_nand.c     Viresh Kumar                     2012-04-17  1156  	clk_disable_unprepare(host->clk);
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal                    2018-04-21  1157  
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1158  	return ret;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1159  }
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij                    2010-09-13  1160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
