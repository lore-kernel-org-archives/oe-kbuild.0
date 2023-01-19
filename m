Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5095F15A3
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 01:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674092909; x=1705628909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LY0bXR1G62cjJjsWQ0SXPOgLpsKpbA2j5Bn1PO5Q1sY=;
  b=UpmaH4I1XLXuusUMxcWI0eNgibGNx8EJ8En/6LLhzpCnm1UZ4phW/o9e
   thtENfy+qlce1EcFNsQ8WKS07mKzPaXC48BwIQsg2QDOO2K7GC6URubBi
   nK9RmEdgFvSr3udCZVykptxUtsSnnmm6Brb7yXVVtqSlh9jUBXY4Owfwn
   r7xLvq5q8QwWpylCqfj7pcI4xLYmb7Pnx4fhjhhn2bCkzikm1dfjrKk03
   T6Bcxo0ENHSs/YlMLic3PvT9ZAEQIqbxrUA+qF/oeYon05BHPywPwXK3L
   ZuYk35KtTwy5UvoKqTBsRTAshJl4O2ThuhPkAfZOPW9WhBJ9tEejJVQll
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="325212326"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="325212326"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 17:48:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="637503706"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="637503706"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Jan 2023 17:48:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIK2T-0000ww-0A;
	Thu, 19 Jan 2023 01:48:25 +0000
Date: Thu, 19 Jan 2023 09:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rmk-arm:clearfog 30/113]
 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:52:12: warning:
 '_mv88e6xxx_pvt_read' defined but not used
Message-ID: <202301190945.FYJ35idd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Russell King <rmk+kernel@armlinux.org.uk>

Hi Russell,

First bad commit (maybe != root cause):

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   1a836e3b4d162d37b94f04eeda458d91bf2a50f7
commit: 32ae8731c815b8ff45d924fdde9d83ea75d8966d [30/113] net: dsa: mv88e6xxx: debugfs hacks to fix the compile
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230119/202301190945.FYJ35idd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm clearfog
        git checkout 32ae8731c815b8ff45d924fdde9d83ea75d8966d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/dsa/mv88e6xxx/chip.c:3676:
>> drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:52:12: warning: '_mv88e6xxx_pvt_read' defined but not used [-Wunused-function]
      52 | static int _mv88e6xxx_pvt_read(struct mv88e6xxx_chip *chip, int src_dev,
         |            ^~~~~~~~~~~~~~~~~~~


vim +/_mv88e6xxx_pvt_read +52 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c

34805366786a19d Vivien Didelot 2015-10-22  51  
34805366786a19d Vivien Didelot 2015-10-22 @52  static int _mv88e6xxx_pvt_read(struct mv88e6xxx_chip *chip, int src_dev,
34805366786a19d Vivien Didelot 2015-10-22  53  			       int src_port, u16 *data)
34805366786a19d Vivien Didelot 2015-10-22  54  {
34805366786a19d Vivien Didelot 2015-10-22  55  	int ret;
34805366786a19d Vivien Didelot 2015-10-22  56  
34805366786a19d Vivien Didelot 2015-10-22  57  	ret = _mv88e6xxx_pvt_wait(chip);
34805366786a19d Vivien Didelot 2015-10-22  58  	if (ret < 0)
34805366786a19d Vivien Didelot 2015-10-22  59  		return ret;
34805366786a19d Vivien Didelot 2015-10-22  60  
34805366786a19d Vivien Didelot 2015-10-22  61  	ret = _mv88e6xxx_pvt_cmd(chip, src_dev, src_port,
34805366786a19d Vivien Didelot 2015-10-22  62  				GLOBAL2_PVT_ADDR_OP_READ);
34805366786a19d Vivien Didelot 2015-10-22  63  	if (ret < 0)
34805366786a19d Vivien Didelot 2015-10-22  64  		return ret;
34805366786a19d Vivien Didelot 2015-10-22  65  
34805366786a19d Vivien Didelot 2015-10-22  66  	return mv88e6xxx_g2_read(chip, GLOBAL2_PVT_DATA, data);
34805366786a19d Vivien Didelot 2015-10-22  67  }
34805366786a19d Vivien Didelot 2015-10-22  68  

:::::: The code at line 52 was first introduced by commit
:::::: 34805366786a19df154fa78df536503f6ef508d1 net: dsa: mv88e6xxx: add debugfs interface

:::::: TO: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
