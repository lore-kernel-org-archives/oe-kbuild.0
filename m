Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DC763D2
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 20:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679170075; x=1710706075;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0SOicjOKBLqhZGve2a247g1YOwLzOODC0R1zggsiDXw=;
  b=dOFuen2tmlrMuAlNRJFmpboGn4BD0LZpQ1JsMpB3s6Lu1T5ZIONrw5R+
   sP7bC96ZTa+0pb1MhJZR1x37ZIPgZKxedKy0RRcgUcpdKzQnIEpi8nFrc
   zDzLxNWFabbr62hNDxedddhu+2BBa0NNFmThQgPsA6Bab+NEcW4wB+Gqi
   AbIVH7YbdHkEXs5kKzgN27OUEF+94c3c9WPVOprbGEn6ZW9lch+BqY6tH
   iyjNJtdzNBREUkx0Pj11VTDB1HaYRcx0Ag5zLvWgot/eY6rsqYTpDC91y
   jOl6/VSs2WMfNYgi899cUuj5z7LipimVZKuVNFq8wbDxNYPYJBIRG/g22
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="338479452"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="338479452"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 13:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="710851847"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="710851847"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Mar 2023 13:07:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdcqH-000AFi-05;
	Sat, 18 Mar 2023 20:07:53 +0000
Date: Sun, 19 Mar 2023 04:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/4] counter: 104-quad-8: Refactor to buffer states for
 CMR, IOR, and IDR
Message-ID: <202303190407.6CtmmK1l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/counter/104-quad-8.c:901:16: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <27359bb20eed0e54f1470cd32be0fd10b06c40fe.1679149543.git.william.gray@linaro.org>
References: <27359bb20eed0e54f1470cd32be0fd10b06c40fe.1679149543.git.william.gray@linaro.org>
TO: William Breathitt Gray <william.gray@linaro.org>
TO: linux-iio@vger.kernel.org
CC: Johannes Berg <johannes.berg@intel.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: linux-kernel@vger.kernel.org
CC: William Breathitt Gray <william.gray@linaro.org>

Hi William,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 00f4bc5184c19cb33f468f1ea409d70d19f8f502]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Breathitt-Gray/counter-104-quad-8-Utilize-bitfield-access-macros/20230318-230124
base:   00f4bc5184c19cb33f468f1ea409d70d19f8f502
patch link:    https://lore.kernel.org/r/27359bb20eed0e54f1470cd32be0fd10b06c40fe.1679149543.git.william.gray%40linaro.org
patch subject: [PATCH 3/4] counter: 104-quad-8: Refactor to buffer states for CMR, IOR, and IDR
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: parisc-randconfig-s041-20230319 (https://download.01.org/0day-ci/archive/20230319/202303190407.6CtmmK1l-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/57be77f2259b2eb9fabf8c8d48fa76ccfb4abe94
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review William-Breathitt-Gray/counter-104-quad-8-Utilize-bitfield-access-macros/20230318-230124
        git checkout 57be77f2259b2eb9fabf8c8d48fa76ccfb4abe94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/counter/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303190407.6CtmmK1l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/counter/104-quad-8.c:901:16: sparse: sparse: dubious: x & !y
>> drivers/counter/104-quad-8.c:901:16: sparse: sparse: dubious: x & !y

vim +901 drivers/counter/104-quad-8.c

f1d8a071d45bf1 William Breathitt Gray 2019-04-02  888  
aaec1a0f76ec25 William Breathitt Gray 2021-08-27  889  static int quad8_count_preset_enable_write(struct counter_device *counter,
aaec1a0f76ec25 William Breathitt Gray 2021-08-27  890  					   struct counter_count *count,
aaec1a0f76ec25 William Breathitt Gray 2021-08-27  891  					   u8 preset_enable)
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  892  {
aea8334b24feb0 Uwe Kleine-König       2021-12-30  893  	struct quad8 *const priv = counter_priv(counter);
daae1ee572d1f9 William Breathitt Gray 2022-07-14  894  	u8 __iomem *const control = &priv->reg->channel[count->id].control;
57be77f2259b2e William Breathitt Gray 2023-03-18  895  	unsigned long *const ior = &priv->ior[count->id];
09db4678bfbb42 William Breathitt Gray 2021-09-29  896  	unsigned long irqflags;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  897  
09db4678bfbb42 William Breathitt Gray 2021-09-29  898  	spin_lock_irqsave(&priv->lock, irqflags);
fc069262261c43 Syed Nayyar Waris      2020-03-16  899  
57be77f2259b2e William Breathitt Gray 2023-03-18  900  	/* Preset enable is active low in Input/Output Control register */
57be77f2259b2e William Breathitt Gray 2023-03-18 @901  	*ior = FIELD_MODIFY(LOAD_PIN, *ior, !preset_enable);
57be77f2259b2e William Breathitt Gray 2023-03-18  902  	iowrite8(*ior, control);
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  903  
09db4678bfbb42 William Breathitt Gray 2021-09-29  904  	spin_unlock_irqrestore(&priv->lock, irqflags);
fc069262261c43 Syed Nayyar Waris      2020-03-16  905  
aaec1a0f76ec25 William Breathitt Gray 2021-08-27  906  	return 0;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  907  }
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  908  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
