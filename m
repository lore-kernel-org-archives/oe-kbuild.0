Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AFC622
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 03:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676775805; x=1708311805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XUnFyyIkEoDQw+RZlbfJmOYbnNYqvG7eSkSwkJisYW4=;
  b=YwakyLynIu9mme6442hL4mnLz3dbvx36864aucVQ5qkVTgwSTDSdqV45
   YbI01FRGd9uo8A+RQ/SCO6R8Zr4oVgdD7U081ibTYssfwbOB3xyGgSF85
   0XQn1ksR/Rd0qgTEjmH5D5k519kOD7q7bknbtXLUE87stu0UUvtKvpkgM
   SO/HaCZlzilmTBHiS46pJc8NpMIcv0OG/Q0OnYx56aZ6z++iyKpbufORz
   8B4HW+3ZNbaHitc2ueF2FkuQlsAczB48T6CrOA95dIkeVMZLrnghvYaKq
   TXRAvRt7Z+N1iId5WZh7HQjaGsIxhegNBVfVg9g8oji5Jr8O/3/0YuvZX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="359679309"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="359679309"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 19:03:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="673007402"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="673007402"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Feb 2023 19:03:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTZz1-000Cyf-0Z;
	Sun, 19 Feb 2023 03:03:23 +0000
Date: Sun, 19 Feb 2023 11:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stable:linux-5.4.y 3888/9999] ERROR: "devm_ioremap"
 [drivers/input/misc/msm-vibrator.ko] undefined!
Message-ID: <202302191047.YBfZZMeM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ERROR: "devm_ioremap" [drivers/input/misc/msm-vibrator.ko] undefined!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Guenter Roeck <linux@roeck-us.net>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Sasha Levin <sashal@kernel.org>

Hi Guenter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   59342376e8f0c704299dc7a2c14fed07ffb962e2
commit: 4a4b31e8b5a73fd5e0527d929f66ee83005b77ad [3888/9999] watchdog: sirfsoc: Add missing dependency on HAS_IOMEM
:::::: branch date: 13 days ago
:::::: commit date: 2 years, 2 months ago
config: s390-randconfig-s052-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191047.YBfZZMeM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=4a4b31e8b5a73fd5e0527d929f66ee83005b77ad
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 4a4b31e8b5a73fd5e0527d929f66ee83005b77ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302191047.YBfZZMeM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "devm_ioremap" [drivers/input/misc/msm-vibrator.ko] undefined!
   ERROR: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!
   ERROR: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
   ERROR: "devm_ioremap_resource" [drivers/char/hw_random/mtk-rng.ko] undefined!
   ERROR: "devm_ioremap_resource" [drivers/char/hw_random/meson-rng.ko] undefined!
   ERROR: "devm_ioremap_resource" [drivers/char/hw_random/exynos-trng.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
