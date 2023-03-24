Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A57A20F5
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 05:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679635744; x=1711171744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8eiQOvDJuONxoP8jBNttAPyOVsl1xKcPex+U5Sfr3Ic=;
  b=KMSALj7+djnYJqQX4D5PF1gH8+iBZpgHX88k139os09U8zXbHKRKhQV7
   q1utW7z8+Cu8OKo9Y6O4do/oa61XCK5pfrPUnGVd4e9AAHfoSVKFuGsiW
   JG2lBRK5aZaB/2UUBSVg08UNUE8bGjWz4Dy5ssv86gCaKhd4RSUbJp42x
   AHHgy7Q2adBvJzfY3iOXsfHYuz2rfzObx6i9gguLixxtqdHUll0DaDris
   eE++FjntK7nFiSUjWrXvYR++6JGQ8ysdBWBoX6igI8tQhK23TIK092KQE
   Ge8HwSMGEaYagrxwmxZJa+llRnpU48T17QVK08ymSYnFBF6a8Fu71gDsV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339729157"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="339729157"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 22:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712953145"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="712953145"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 22:29:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfZz2-000F0i-16;
	Fri, 24 Mar 2023 05:29:00 +0000
Date: Fri, 24 Mar 2023 13:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/6] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <202303241313.pYnyzYXe-lkp@intel.com>
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
In-Reply-To: <167949286900.26.3992817728812049195@mailman-core.alsa-project.org>
References: <167949286900.26.3992817728812049195@mailman-core.alsa-project.org>
TO: "Herve Codina via Alsa-devel" <alsa-devel@alsa-project.org>
TO: Herve Codina <herve.codina@bootlin.com>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: alsa-devel@alsa-project.org
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Hi Herve,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on broonie-sound/for-next lee-leds/for-leds-next robh/for-next linus/master v6.3-rc3 next-20230323]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-via-Alsa-devel/mfd-Add-support-for-the-Lantiq-PEF2256-framer/20230322-215208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/167949286900.26.3992817728812049195%40mailman-core.alsa-project.org
patch subject: [PATCH v3 2/6] mfd: Add support for the Lantiq PEF2256 framer
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-s033-20230324 (https://download.01.org/0day-ci/archive/20230324/202303241313.pYnyzYXe-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/d60948895815b59306d870e7c189741b7d14d5e2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Herve-Codina-via-Alsa-devel/mfd-Add-support-for-the-Lantiq-PEF2256-framer/20230322-215208
        git checkout d60948895815b59306d870e7c189741b7d14d5e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303241313.pYnyzYXe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/pef2256.c:1192:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] regs @@     got void [noderef] __iomem * @@
   drivers/mfd/pef2256.c:1192:23: sparse:     expected void *[noderef] regs
   drivers/mfd/pef2256.c:1192:23: sparse:     got void [noderef] __iomem *
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
>> drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
>> drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
>> drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
>> drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: too many warnings

vim +1192 drivers/mfd/pef2256.c

d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1176  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1177  static int pef2256_probe(struct platform_device *pdev)
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1178  {
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1179  	struct device_node *np = pdev->dev.of_node;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1180  	unsigned long sclkr_rate, sclkx_rate;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1181  	struct pef2256 *pef2256;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1182  	int ret;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1183  	int irq;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1184  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1185  	pef2256 = devm_kzalloc(&pdev->dev, sizeof(*pef2256), GFP_KERNEL);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1186  	if (!pef2256)
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1187  		return -ENOMEM;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1188  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1189  	pef2256->dev = &pdev->dev;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1190  	ATOMIC_INIT_NOTIFIER_HEAD(&pef2256->event_notifier_list);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1191  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22 @1192  	pef2256->regs = devm_platform_ioremap_resource(pdev, 0);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1193  	if (IS_ERR(pef2256->regs))
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1194  		return PTR_ERR(pef2256->regs);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1195  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1196  	pef2256->mclk = devm_clk_get_enabled(&pdev->dev, "mclk");
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1197  	if (IS_ERR(pef2256->mclk))
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1198  		return PTR_ERR(pef2256->mclk);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1199  	dev_dbg(pef2256->dev, "mclk %lu Hz\n", clk_get_rate(pef2256->mclk));
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1200  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1201  	pef2256->sclkr = devm_clk_get_enabled(&pdev->dev, "sclkr");
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1202  	if (IS_ERR(pef2256->sclkr))
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1203  		return PTR_ERR(pef2256->sclkr);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1204  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1205  	pef2256->sclkx = devm_clk_get_enabled(&pdev->dev, "sclkx");
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1206  	if (IS_ERR(pef2256->sclkx))
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1207  		return PTR_ERR(pef2256->sclkx);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1208  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1209  	/*
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1210  	 * Both SCLKR (receive) and SCLKX (transmit) must have the same rate,
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1211  	 * stored as sysclk_rate.
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1212  	 * The exact value will be checked at pef2256_check_rates()
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1213  	 */
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1214  	sclkr_rate = clk_get_rate(pef2256->sclkr);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1215  	sclkx_rate = clk_get_rate(pef2256->sclkx);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1216  	dev_dbg(pef2256->dev, "sclkr %lu Hz\n", sclkr_rate);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1217  	dev_dbg(pef2256->dev, "sclkx %lu Hz\n", sclkx_rate);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1218  	if (sclkr_rate != sclkx_rate) {
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1219  		dev_err(pef2256->dev, "clk rate mismatch. sclkr %lu Hz, sclkx %lu Hz\n",
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1220  			sclkr_rate, sclkx_rate);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1221  		return -EINVAL;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1222  	}
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1223  	pef2256->sysclk_rate = sclkr_rate;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1224  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1225  	/* Reset the component. The MCLK clock must be active during reset */
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1226  	pef2256->reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_OUT_LOW);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1227  	if (IS_ERR(pef2256->reset_gpio))
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1228  		return PTR_ERR(pef2256->reset_gpio);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1229  	if (pef2256->reset_gpio) {
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1230  		gpiod_set_value_cansleep(pef2256->reset_gpio, 1);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1231  		udelay(10);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1232  		gpiod_set_value_cansleep(pef2256->reset_gpio, 0);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1233  		udelay(10);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1234  	}
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1235  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1236  	pef2256->version = pef2256_get_version(pef2256);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1237  	if (pef2256->version == PEF2256_VERSION_UNKNOWN)
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1238  		return -ENODEV;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1239  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1240  	ret = pef2556_of_parse(pef2256, np);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1241  	if (ret)
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1242  		return ret;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1243  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1244  	/* Disable interrupts */
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1245  	pef2256_write8(pef2256, PEF2256_IMR0, 0xff);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1246  	pef2256_write8(pef2256, PEF2256_IMR1, 0xff);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1247  	pef2256_write8(pef2256, PEF2256_IMR2, 0xff);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1248  	pef2256_write8(pef2256, PEF2256_IMR3, 0xff);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1249  	pef2256_write8(pef2256, PEF2256_IMR4, 0xff);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1250  	pef2256_write8(pef2256, PEF2256_IMR5, 0xff);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1251  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1252  	/* Clear any pending interrupts */
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1253  	pef2256_read8(pef2256, PEF2256_ISR0);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1254  	pef2256_read8(pef2256, PEF2256_ISR1);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1255  	pef2256_read8(pef2256, PEF2256_ISR2);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1256  	pef2256_read8(pef2256, PEF2256_ISR3);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1257  	pef2256_read8(pef2256, PEF2256_ISR4);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1258  	pef2256_read8(pef2256, PEF2256_ISR5);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1259  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1260  	irq = platform_get_irq(pdev, 0);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1261  	if (irq < 0)
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1262  		return irq;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1263  	ret = devm_request_irq(pef2256->dev, irq, pef2256_irq_handler, 0, "pef2256", pef2256);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1264  	if (ret < 0)
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1265  		return ret;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1266  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1267  	pef2256_reset_pinmux(pef2256);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1268  	ret = pef2256_register_pinctrl(pef2256);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1269  	if (ret)
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1270  		return ret;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1271  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1272  	/*
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1273  	 * We are going to reset the E1 lines during setup() call and the ISR2
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1274  	 * interrupt used to detect the carrier state changed is masked.
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1275  	 * It is time to initialize our internal carrier state flag.
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1276  	 */
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1277  	atomic_set(&pef2256->carrier, 0);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1278  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1279  	ret = pef2256_setup(pef2256);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1280  	if (ret)
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1281  		return ret;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1282  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1283  	platform_set_drvdata(pdev, pef2256);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1284  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1285  	ret = sysfs_create_group(&pef2256->dev->kobj, &pef2256_attribute_group);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1286  	if (ret < 0) {
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1287  		dev_err(pef2256->dev, "sysfs registration failed (%d)\n", ret);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1288  		platform_set_drvdata(pdev, NULL);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1289  		return ret;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1290  	}
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1291  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1292  	ret = devm_of_platform_populate(pef2256->dev);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1293  	if (ret < 0) {
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1294  		dev_err(pef2256->dev, "platform populate failed (%d)\n", ret);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1295  		platform_set_drvdata(pdev, NULL);
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1296  		return ret;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1297  	}
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1298  
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1299  	return 0;
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1300  }
d60948895815b5 Herve Codina via Alsa-devel 2023-03-22  1301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
