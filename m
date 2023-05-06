Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531D37E
	for <oe-kbuild@lists.linux.dev>; Sat,  6 May 2023 04:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683347270; x=1714883270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6GCARNX6E8lS4TKeJcaSSpY7v3NdSZMI49Imhj6rYt4=;
  b=QnA/67rfjLUUcolM1XDeIqexm7sfjOpNngvB41bbDbyIu9z1TuHLyupt
   LZiG0cX1RGyUUwuIcToqfCC04DGXZLuGoXkZ8roSijMjOVrHVF5rxTxN1
   fnPbJSaEE60rWOBO8jlG1j7gdRyaOUnKL9Mq/8YDgeg3vgVADbol5t7Kp
   p0E1CMW3XFuHfaIzOP3Pkjkz62/XpQ2Gn2m4NqeVlSVVxbJAKQ944tJp+
   9in/2TIqGYXlvKDrnFPDqEpQPd1/SW6XNadQm/DIbjAqZAcx+6hZkAleU
   Kk7cvzZtPsAwO7KOKu35AYYJDoEZGS/gbSLKzkl/LopWhd5otoxh9lofk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="377424748"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="377424748"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 21:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="944156868"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="944156868"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 May 2023 21:27:38 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv9WD-00019E-1X;
	Sat, 06 May 2023 04:27:37 +0000
Date: Sat, 6 May 2023 12:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202305061240.oowFPT4e-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Herve Codina <herve.codina@bootlin.com>
CC: Mark Brown <broonie@kernel.org>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1e1337881b0e9844d687982aa54b31b1269b11
commit: 1d4ba0b81c1cf2bfc0c55658f53809846ae9de52 soc: fsl: cpm1: Add support for TSA
date:   9 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 weeks ago
config: parisc-randconfig-s033-20230506 (https://download.01.org/0day-ci/archive/20230506/202305061240.oowFPT4e-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1d4ba0b81c1cf2bfc0c55658f53809846ae9de52
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1d4ba0b81c1cf2bfc0c55658f53809846ae9de52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/soc/fsl/qe/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305061240.oowFPT4e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/soc/fsl/qe/tsa.c:663:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] si_regs @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/tsa.c:663:22: sparse:     expected void *[noderef] si_regs
   drivers/soc/fsl/qe/tsa.c:663:22: sparse:     got void [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:673:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] si_ram @@     got void [noderef] __iomem * @@
   drivers/soc/fsl/qe/tsa.c:673:21: sparse:     expected void *[noderef] si_ram
   drivers/soc/fsl/qe/tsa.c:673:21: sparse:     got void [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:189:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:189:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:218:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:218:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
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
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:155:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:155:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:155:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:344:25: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:344:44: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:348:29: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:348:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:349:17: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:640:29: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:640:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:664:20: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:664:20: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:665:32: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:665:32: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:674:20: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:674:20: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:675:32: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:675:32: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:690:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:690:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const [noderef] __iomem *
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: too many warnings

vim +150 drivers/soc/fsl/qe/tsa.c

1d4ba0b81c1cf2 Herve Codina 2023-02-17  137  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  138  static inline void tsa_write32(void *__iomem addr, u32 val)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  139  {
1d4ba0b81c1cf2 Herve Codina 2023-02-17 @140  	iowrite32be(val, addr);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  141  }
1d4ba0b81c1cf2 Herve Codina 2023-02-17  142  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  143  static inline void tsa_write8(void *__iomem addr, u32 val)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  144  {
1d4ba0b81c1cf2 Herve Codina 2023-02-17  145  	iowrite8(val, addr);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  146  }
1d4ba0b81c1cf2 Herve Codina 2023-02-17  147  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  148  static inline u32 tsa_read32(void *__iomem addr)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  149  {
1d4ba0b81c1cf2 Herve Codina 2023-02-17 @150  	return ioread32be(addr);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  151  }
1d4ba0b81c1cf2 Herve Codina 2023-02-17  152  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
