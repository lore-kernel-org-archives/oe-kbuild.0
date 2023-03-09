Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19825C27F
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678388200; x=1709924200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Mpkt7sM2F0yRXhBDXZlUIFlA2FsTWvngqvcNJbiZg0=;
  b=hYzDi53BDcQNev/IQrwGOFlQq7OZbxxXOMIsKoQjjyXhlBmXdzV2I2n3
   JVgPuyP9zS+KWdKeJlTuX9duqJLN9iJPIcKVlbdb7tE7Ic00jM20lAesd
   hUEeiRg/Ia9IUS5Xiw5MIDu4ntSGjoW9OFKKXrDXvFKkcw6OCBRDquexW
   fP95xfZMyLBmdnIietzEYdMtTF7w4Gm0Dt2d8PwWYNxc+Cuzkyl5T3sYu
   nTdWyONkTEkChnn8Cvr05nXn5igY2xuovH9i7Kwb7rpbRaAKZUcRQs+F0
   SjajVZI76o/qrOIC6eMd8qUE2prXR5ickN2xI4ebNt0hMsIrySVshiCXd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="334015328"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="334015328"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 10:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="801276142"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="801276142"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Mar 2023 10:56:37 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paLRN-00039z-0c;
	Thu, 09 Mar 2023 18:56:37 +0000
Date: Fri, 10 Mar 2023 02:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/mediatek/lvts_thermal.c:616:59: warning: Parameter
 'value' can be declared as pointer to const [constParameter]
Message-ID: <202303100243.bnS6WsvP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/mediatek/lvts_thermal.c:616:59: warning: Parameter 'value' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Balsam CHIHI <bchihi@baylibre.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a98c9cae232800c319ed69e1063480d31430887
commit: f5f633b18234cecb0e6ee6e5fbb358807dda15c3 thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver
date:   3 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 weeks ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f5f633b18234cecb0e6ee6e5fbb358807dda15c3
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303100243.bnS6WsvP-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thermal/mediatek/lvts_thermal.c:616:59: warning: Parameter 'value' can be declared as pointer to const [constParameter]
   static int lvts_golden_temp_init(struct device *dev, u32 *value)
                                                             ^

vim +/value +616 drivers/thermal/mediatek/lvts_thermal.c

f5f633b18234ce Balsam CHIHI 2023-02-09  615  
f5f633b18234ce Balsam CHIHI 2023-02-09 @616  static int lvts_golden_temp_init(struct device *dev, u32 *value)
f5f633b18234ce Balsam CHIHI 2023-02-09  617  {
f5f633b18234ce Balsam CHIHI 2023-02-09  618  	u32 gt;
f5f633b18234ce Balsam CHIHI 2023-02-09  619  
f5f633b18234ce Balsam CHIHI 2023-02-09  620  	gt = (*value) >> 24;
f5f633b18234ce Balsam CHIHI 2023-02-09  621  
f5f633b18234ce Balsam CHIHI 2023-02-09  622  	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
f5f633b18234ce Balsam CHIHI 2023-02-09  623  		golden_temp = gt;
f5f633b18234ce Balsam CHIHI 2023-02-09  624  
f5f633b18234ce Balsam CHIHI 2023-02-09  625  	coeff_b = golden_temp * 500 + LVTS_COEFF_B;
f5f633b18234ce Balsam CHIHI 2023-02-09  626  
f5f633b18234ce Balsam CHIHI 2023-02-09  627  	return 0;
f5f633b18234ce Balsam CHIHI 2023-02-09  628  }
f5f633b18234ce Balsam CHIHI 2023-02-09  629  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
