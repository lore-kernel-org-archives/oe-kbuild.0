Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C502F30
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 20:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679172597; x=1710708597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqeCU4rykAH9FaSfMHz3V/uSPrhcFzq9E/loLWmM+vE=;
  b=NjXtm0vjZUpC1YFbwu6JyhUbQrHJ//RdpdmlpHYOjXIufCPpQc6+x5Ed
   L0DA/e8LuCPRe8ffz+4hLCzJJkJs8JnjtYD+Lrv0hnq19D2Y56+yuDSTZ
   urS3kPK9TNJ1XwotURIZsxQvbu5SXEu3wHiB/ZQ0f4giQ9UbZm3B3XHlk
   olL+t6jAZuiUVBM0zQgLQQIS7wQHPcU43BISbjt184p8gCKOdQx4GqgCz
   ABcScKz9IJthuD1aK/R7sUexaBzEDtDCSn303/hOoZ0a4o5qmyiFTCKgQ
   NLN+02Jo6OtVEuR29uqEcHVGQ12CtaUrazpg0njrOF7+qxCKq+5GM046b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="401037180"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="401037180"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 13:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="673924907"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="673924907"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Mar 2023 13:49:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pddUv-000AGY-22;
	Sat, 18 Mar 2023 20:49:53 +0000
Date: Sun, 19 Mar 2023 04:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 812/4413] drivers/soc/fsl/qe/tsa.c:150:27:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202303190420.dea6pPyL-lkp@intel.com>
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
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: 1d4ba0b81c1cf2bfc0c55658f53809846ae9de52 [812/4413] soc: fsl: cpm1: Add support for TSA
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: powerpc-randconfig-s051-20230319 (https://download.01.org/0day-ci/archive/20230319/202303190420.dea6pPyL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/soc/fsl/qe/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303190420.dea6pPyL-lkp@intel.com/

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
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *addr
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
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:160:39: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *addr
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
>> drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     expected void const [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:150:27: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:155:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:155:21: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:155:38: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:344:25: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:344:44: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:348:29: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     got void *[noderef] __iomem addr
   drivers/soc/fsl/qe/tsa.c:348:29: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:349:17: sparse: sparse: dereference of noderef expression
   drivers/soc/fsl/qe/tsa.c:640:29: sparse: sparse: dereference of noderef expression
>> drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[noderef] __iomem addr @@
   drivers/soc/fsl/qe/tsa.c:140:26: sparse:     expected void [noderef] __iomem *addr
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
