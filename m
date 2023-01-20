Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284220FE
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674219483; x=1705755483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Qia+Vk5VusGH+Mbxh9/I8BXgr73NoxAmEdz98Il6vw=;
  b=loi0ILQ7vn8/i4JNQb2k7rRuxGc+45i6omC+xLcNyt+3VNQKTBSz9s1z
   YaHu23aCBtUvR4RBy2KKs/Y+a0tADeBS6QtXZ01YfgVKUqaLAuQS0B7vu
   8m2KAUdSvKlnHuCMdxcI7yxaGn5wHFZb6zWdudt7V6NAQAwE1C2nqMiV+
   NTjOn61LwPVgKSJQeSFLBR4KSgFZDTIdHYJooo7rT77ew8IVFUDnRRTIc
   e+5sS2srEaNvU06oedVYMpef2gKokHlaDOW+yItICXUPV8/G+EO8zbPaP
   OpPO4lZw7qOFIyOPfMEWirBtu55th9WGKzlLgjiTNZSEdZpWPCBAEzWTJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324255526"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="324255526"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 04:58:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="638152123"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="638152123"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2023 04:58:01 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIqy0-0002Z8-0u;
	Fri, 20 Jan 2023 12:58:00 +0000
Date: Fri, 20 Jan 2023 20:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 01/10] net: libwx: Add irq flow functions
Message-ID: <202301202015.flTHtz9f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/wangxun/libwx/wx_hw.c:890:9: sparse: sparse: shift too big (32) for type unsigned int"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230118065504.3075474-2-jiawenwu@trustnetic.com>
References: <20230118065504.3075474-2-jiawenwu@trustnetic.com>
TO: Jiawen Wu <jiawenwu@trustnetic.com>
TO: netdev@vger.kernel.org
TO: mengyuanlou@net-swift.com

Hi Jiawen,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiawen-Wu/net-libwx-Add-irq-flow-functions/20230118-154258
patch link:    https://lore.kernel.org/r/20230118065504.3075474-2-jiawenwu%40trustnetic.com
patch subject: [PATCH net-next 01/10] net: libwx: Add irq flow functions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-s052-20230120 (https://download.01.org/0day-ci/archive/20230120/202301202015.flTHtz9f-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/f807094d578ff552800fe8f9fd9f29ad766384b6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiawen-Wu/net-libwx-Add-irq-flow-functions/20230118-154258
        git checkout f807094d578ff552800fe8f9fd9f29ad766384b6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/ethernet/wangxun/libwx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/wangxun/libwx/wx_hw.c:890:9: sparse: sparse: shift too big (32) for type unsigned int

vim +890 drivers/net/ethernet/wangxun/libwx/wx_hw.c

b08012568ebb20 Jiawen Wu    2022-10-27  885  
f807094d578ff5 Mengyuan Lou 2023-01-18  886  static void wx_configure_isb(struct wx *wx)
f807094d578ff5 Mengyuan Lou 2023-01-18  887  {
f807094d578ff5 Mengyuan Lou 2023-01-18  888  	/* set ISB Address */
f807094d578ff5 Mengyuan Lou 2023-01-18  889  	wr32(wx, WX_PX_ISB_ADDR_L, wx->isb_dma & DMA_BIT_MASK(32));
f807094d578ff5 Mengyuan Lou 2023-01-18 @890  	wr32(wx, WX_PX_ISB_ADDR_H, wx->isb_dma >> 32);
f807094d578ff5 Mengyuan Lou 2023-01-18  891  }
f807094d578ff5 Mengyuan Lou 2023-01-18  892  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
