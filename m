Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5EE10EA
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jun 2023 01:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686532341; x=1718068341;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EiRN/m6e/jTBmjUUvrFii4NxkicpLUSz3vMC77T5Rig=;
  b=NdOqdsFry7JZE9cWNuw4T3cO2j6LWUvJi0G0T6nlWqB7J7SvA+ie8up8
   mpj9/AohavWfmxalPt3mVRES4RKZ69wIRl+GzNAyGsd+i/9OJSGO0Z4n1
   zWnyDPrGvnDYFY+S0UNqg37qP+fKplpOBs+NrEaQzqrIskrbSFsbzIpDI
   dlwCTqPLTnYy9gYDVaqfu02kPyV04Q6SmBxsO5IEL1eoHn2Z5IWuSqAFM
   HsQbptZ9pRLudvafSoQ7CtBHZ/0tbcQD5Ka+psJC+X3BEWZiFo0ySLp5I
   JCaTwgIZlHxsd0viVnPs7uFF+hrrhOaJ5FM20ZMbHkH7TNhUQsjheQYHg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="421513858"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="421513858"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 18:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="688428905"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="688428905"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Jun 2023 18:12:20 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8W6V-000BAe-0V;
	Mon, 12 Jun 2023 01:12:19 +0000
Date: Mon, 12 Jun 2023 09:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] hid-mcp2200 - updated hid-id.h
Message-ID: <202306120845.BHvT4f9N-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/hid/i2c-hid/../hid-ids.h:914:9: sparse: this was the original definition"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230611164811.1388-2-johannes@gnu-linux.rocks>
References: <20230611164811.1388-2-johannes@gnu-linux.rocks>
TO: Johannes Roith <johannes@gnu-linux.rocks>
TO: jikos@kernel.org
CC: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Johannes Roith <johannes@gnu-linux.rocks>

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.4-rc5]
[also build test WARNING on linus/master next-20230609]
[cannot apply to hid/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Roith/hid-mcp2200-updated-hid-id-h/20230612-005025
base:   v6.4-rc5
patch link:    https://lore.kernel.org/r/20230611164811.1388-2-johannes%40gnu-linux.rocks
patch subject: [PATCH 2/2] hid-mcp2200 - updated hid-id.h
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-s033-20230611 (https://download.01.org/0day-ci/archive/20230612/202306120845.BHvT4f9N-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/01f63040a4a77e899a95ebda6ffcca6e1aea19f7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Johannes-Roith/hid-mcp2200-updated-hid-id-h/20230612-005025
        git checkout 01f63040a4a77e899a95ebda6ffcca6e1aea19f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306120845.BHvT4f9N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
   drivers/hid/i2c-hid/i2c-hid-core.c: note: in included file:
   drivers/hid/i2c-hid/../hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/i2c-hid/../hid-ids.h:914:9: sparse: this was the original definition

vim +914 drivers/hid/i2c-hid/../hid-ids.h

990436a7c9d0e5 Jiri Slaby       2008-06-04  905  
990436a7c9d0e5 Jiri Slaby       2008-06-04  906  #define USB_VENDOR_ID_MICROCHIP		0x04d8
990436a7c9d0e5 Jiri Slaby       2008-06-04  907  #define USB_DEVICE_ID_PICKIT1		0x0032
990436a7c9d0e5 Jiri Slaby       2008-06-04  908  #define USB_DEVICE_ID_PICKIT2		0x0033
236db47c2b3b69 Bruno Prémont    2010-03-30  909  #define USB_DEVICE_ID_PICOLCD		0xc002
236db47c2b3b69 Bruno Prémont    2010-03-30  910  #define USB_DEVICE_ID_PICOLCD_BOOTLOADER	0xf002
a8c8316b11594e Kristian Evensen 2015-01-20  911  #define USB_DEVICE_ID_PICK16F1454	0x0042
84f6ea1d86bfe5 Kristian Evensen 2016-01-06  912  #define USB_DEVICE_ID_PICK16F1454_V2	0xf2f7
9d1e048cc8e1f9 Heiner Kallweit  2016-07-04  913  #define USB_DEVICE_ID_LUXAFOR		0xf372
67a95c21463d06 Rishi Gupta      2020-01-28 @914  #define USB_DEVICE_ID_MCP2221		0x00dd
01f63040a4a77e Johannes Roith   2023-06-11  915  #define USB_DEVICE_ID_MCP2221		0x00df
990436a7c9d0e5 Jiri Slaby       2008-06-04  916  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
