Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B0D50B
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678378892; x=1709914892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=35zSNk5wfcLsOfZHwU86PhA4GxZqoEbNoMrGinL8MXA=;
  b=hqVbPLG92vXwWnCdf1dcVpm1MNqaEwQ8LSxFJqvcCqv2aGU7YIvg4Sos
   S12e2f7xHt2rL487XhD7VeOt7p05hiIE3WY4pXRrwuK9qmNku/XMpCTYP
   A6QWDLq+1cr96/ZutQVDzFio4WLIugUEwo0P69DH+ajxWpFvnItiQYU1n
   EkGlEUNiL8i7Uzc80sNVquR0XXY0a0FPBVHPI0v9J/lBlcfLOiBv0+qu0
   BrupaeNT6xdCwql1gU6si+1AZMraxjW3JlbsmeQKFqoxycwHTaXWW/E+y
   uoafJo+PbHBatzZmYwMKh1Ydgd5AUWENhkWosguF4un4U53vz+2vCDMXV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338036826"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="338036826"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 08:21:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677433283"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="677433283"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2023 08:21:30 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paJ1F-00034V-2Y;
	Thu, 09 Mar 2023 16:21:29 +0000
Date: Fri, 10 Mar 2023 00:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 816/2428] drivers/soc/fsl/qe/tsa.c:663:22:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202303100024.gHH6xArM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herve Codina <herve.codina@bootlin.com>
CC: Mark Brown <broonie@kernel.org>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c6433e9294b6d0f4d8f08c3c70a3eac434d3ec8
commit: 1d4ba0b81c1cf2bfc0c55658f53809846ae9de52 [816/2428] soc: fsl: cpm1: Add support for TSA
:::::: branch date: 15 hours ago
:::::: commit date: 4 days ago
config: riscv-randconfig-s043-20230309 (https://download.01.org/0day-ci/archive/20230310/202303100024.gHH6xArM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1d4ba0b81c1cf2bfc0c55658f53809846ae9de52
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1d4ba0b81c1cf2bfc0c55658f53809846ae9de52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/fsl/qe/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303100024.gHH6xArM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> drivers/soc/fsl/qe/tsa.c:663:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] si_regs @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/tsa.c:663:22: sparse:     expected void *[noderef] si_regs
   drivers/soc/fsl/qe/tsa.c:663:22: sparse:     got void [noderef] __iomem *
>> drivers/soc/fsl/qe/tsa.c:673:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] si_ram @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/tsa.c:673:21: sparse:     expected void *[noderef] si_ram
   drivers/soc/fsl/qe/tsa.c:673:21: sparse:     got void [noderef] __iomem *
>> drivers/soc/fsl/qe/tsa.c:189:26: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:189:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:218:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:218:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:245:25: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:245:47: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:246:25: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:246:46: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:247:25: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:250:25: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:250:47: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:251:25: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:251:46: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:252:25: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:259:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:259:55: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:260:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:260:54: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:261:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:264:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:264:55: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:265:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:265:54: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:266:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:271:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:271:55: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:272:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:272:54: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:273:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:276:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:276:55: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:277:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:277:54: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:278:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:322:9: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:322:16: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:322:35: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:322:58: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:325:14: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:325:33: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:330:13: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:332:31: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:332:31: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:155:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:155:38: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:155:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:155:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:155:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:344:25: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:344:44: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:348:29: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:348:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:349:17: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:640:29: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:640:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:664:20: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:664:20: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:665:32: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:665:32: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:674:20: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:674:20: sparse: sparse: too many warnings

vim +663 drivers/soc/fsl/qe/tsa.c

1d4ba0b81c1cf2 Herve Codina 2023-02-17  642  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  643  static int tsa_probe(struct platform_device *pdev)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  644  {
1d4ba0b81c1cf2 Herve Codina 2023-02-17  645  	struct device_node *np = pdev->dev.of_node;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  646  	struct resource *res;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  647  	struct tsa *tsa;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  648  	unsigned int i;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  649  	u32 val;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  650  	int ret;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  651  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  652  	tsa = devm_kzalloc(&pdev->dev, sizeof(*tsa), GFP_KERNEL);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  653  	if (!tsa)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  654  		return -ENOMEM;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  655  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  656  	tsa->dev = &pdev->dev;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  657  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  658  	for (i = 0; i < ARRAY_SIZE(tsa->serials); i++)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  659  		tsa->serials[i].id = i;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  660  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  661  	spin_lock_init(&tsa->lock);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  662  
1d4ba0b81c1cf2 Herve Codina 2023-02-17 @663  	tsa->si_regs = devm_platform_ioremap_resource_byname(pdev, "si_regs");
1d4ba0b81c1cf2 Herve Codina 2023-02-17  664  	if (IS_ERR(tsa->si_regs))
1d4ba0b81c1cf2 Herve Codina 2023-02-17  665  		return PTR_ERR(tsa->si_regs);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  666  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  667  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "si_ram");
1d4ba0b81c1cf2 Herve Codina 2023-02-17  668  	if (!res) {
1d4ba0b81c1cf2 Herve Codina 2023-02-17  669  		dev_err(tsa->dev, "si_ram resource missing\n");
1d4ba0b81c1cf2 Herve Codina 2023-02-17  670  		return -EINVAL;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  671  	}
1d4ba0b81c1cf2 Herve Codina 2023-02-17  672  	tsa->si_ram_sz = resource_size(res);
1d4ba0b81c1cf2 Herve Codina 2023-02-17 @673  	tsa->si_ram = devm_ioremap_resource(&pdev->dev, res);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  674  	if (IS_ERR(tsa->si_ram))
1d4ba0b81c1cf2 Herve Codina 2023-02-17  675  		return PTR_ERR(tsa->si_ram);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  676  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  677  	tsa_init_si_ram(tsa);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  678  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  679  	ret = tsa_of_parse_tdms(tsa, np);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  680  	if (ret)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  681  		return ret;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  682  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  683  	/* Set SIMODE */
1d4ba0b81c1cf2 Herve Codina 2023-02-17  684  	val = 0;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  685  	if (tsa->tdm[0].is_enable)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  686  		val |= TSA_SIMODE_TDMA(tsa->tdm[0].simode_tdm);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  687  	if (tsa->tdm[1].is_enable)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  688  		val |= TSA_SIMODE_TDMB(tsa->tdm[1].simode_tdm);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  689  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  690  	tsa_clrsetbits32(tsa->si_regs + TSA_SIMODE,
1d4ba0b81c1cf2 Herve Codina 2023-02-17  691  			 TSA_SIMODE_TDMA(TSA_SIMODE_TDM_MASK) |
1d4ba0b81c1cf2 Herve Codina 2023-02-17  692  			 TSA_SIMODE_TDMB(TSA_SIMODE_TDM_MASK),
1d4ba0b81c1cf2 Herve Codina 2023-02-17  693  			 val);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  694  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  695  	/* Set SIGMR */
1d4ba0b81c1cf2 Herve Codina 2023-02-17  696  	val = (tsa->tdms == BIT(TSA_TDMA)) ?
1d4ba0b81c1cf2 Herve Codina 2023-02-17  697  		TSA_SIGMR_RDM_STATIC_TDMA : TSA_SIGMR_RDM_STATIC_TDMAB;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  698  	if (tsa->tdms & BIT(TSA_TDMA))
1d4ba0b81c1cf2 Herve Codina 2023-02-17  699  		val |= TSA_SIGMR_ENA;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  700  	if (tsa->tdms & BIT(TSA_TDMB))
1d4ba0b81c1cf2 Herve Codina 2023-02-17  701  		val |= TSA_SIGMR_ENB;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  702  	tsa_write8(tsa->si_regs + TSA_SIGMR, val);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  703  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  704  	platform_set_drvdata(pdev, tsa);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  705  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  706  	return 0;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  707  }
1d4ba0b81c1cf2 Herve Codina 2023-02-17  708  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
