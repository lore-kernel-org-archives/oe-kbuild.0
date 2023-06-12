Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4CA55
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jun 2023 00:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686531082; x=1718067082;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=piAIyJDrzU2pZVJxn5rJfTXcUuBuyBc5cJABmABpw5o=;
  b=H3lgBewevX0qEg966S1UTTfa96sVqX2kMvmL308a9xjeLi8OzCXP/WOj
   F9qXld4s4e0JmaRL650tFNnQvjoqW57jEMbFheZPjv+fAH5qto6WEebcT
   35LQrUPphE/IL/FGCzmKFmso+7E1k1tgrDW3H36mO7UDGLBeFHNjM+pS/
   8JW2GXiEHEhaK0rtvKSM+9X+CWjgvBqtBhYwSVU8wlQD95I5Z8A0MvVhM
   8aCR2YC/XizJqMTMQxrL86cSmzrFb6ZjRWgvnJTI4ZzSCJ/2C5ZJqshXo
   26snrMc2zv6u2e98k284IQ2qpZwBNBuCBO4TM/DlXrX9o2F9DXS3oy+/l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="444287151"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="444287151"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 17:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="740807237"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="740807237"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Jun 2023 17:51:19 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8VmB-000BAQ-05;
	Mon, 12 Jun 2023 00:51:19 +0000
Date: Mon, 12 Jun 2023 08:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] hid-mcp2200 - updated hid-id.h
Message-ID: <202306120800.HCd5Dlmq-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/hid/hid-ids.h:914:9: sparse: this was the original definition"
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
config: nios2-randconfig-s041-20230612 (https://download.01.org/0day-ci/archive/20230612/202306120800.HCd5Dlmq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306120800.HCd5Dlmq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hid/hid-core.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
   drivers/hid/hid-core.c:636:15: sparse: sparse: memset with byte count of 110608
   drivers/hid/hid-core.c:862:15: sparse: sparse: memset with byte count of 110608
--
   drivers/hid/hid-quirks.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-input.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-a4tech.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-axff.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-belkin.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-apple.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-aureal.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-cougar.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-cypress.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-evision.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-emsff.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-ezkey.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-elecom.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-glorious.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-gyration.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-icade.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-ite.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-jabra.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-kensington.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-keytouch.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-lcpower.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-kye.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-monterey.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-magicmouse.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-pl.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-petalynx.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-nintendo.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-multitouch.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-picolcd_core.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-picolcd_leds.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-pxrc.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-plantronics.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-razer.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-saitek.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-playstation.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-steelseries.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-gaff.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-steam.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-tivo.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-twinhan.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-topre.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-xinmo.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-udraw-ps3.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-xiaomi.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-zydacron.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-viewsonic.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition
--
   drivers/hid/hid-sensor-hub.c: note: in included file:
   drivers/hid/hid-ids.h:915:9: sparse: sparse: preprocessor token USB_DEVICE_ID_MCP2221 redefined
>> drivers/hid/hid-ids.h:914:9: sparse: this was the original definition

vim +914 drivers/hid/hid-ids.h

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
01f63040a4a77e Johannes Roith   2023-06-11 @915  #define USB_DEVICE_ID_MCP2221		0x00df
990436a7c9d0e5 Jiri Slaby       2008-06-04  916  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
