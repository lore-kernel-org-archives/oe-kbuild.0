Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C91B2900
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jun 2023 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686490926; x=1718026926;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T7RRbkFBs3nbzTWBmTKfdD7qgogrkAY7V+0Wn5G+o4k=;
  b=Ep89hDyrjVfdC2z/DI1CfZ8tZDguGkvfXdS+EYWbjkYHO/myQ1mikfBI
   QsRFBiqArVWhuyPgOHw0H6B0Qzd4arNUIMRVFrFUMtW+9sYPIiHV75FCE
   nYo+BM3kNQDIjbWN7eNZ5XAEkywbr0/ThzfyOnBV9JCT6jarBNIO/K88x
   BXrjPlIVSMu1bHlyHgZpb4Er27svgm0NZyKvyGXS4J3ByCKipip63YKcC
   qi/xE+vnbxmjFxP0DHS1uVYkxCeanzy8CsW+FhCFP/nX0VfJxK7IdjlJo
   Y712+U3F3hedqVn22H+kp8qKJG/43l9jQw5NV1z+0AMTFoGnb6TnCS+em
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="423739035"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="423739035"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 06:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="957709046"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="957709046"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jun 2023 06:42:04 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8LKV-000Asq-2H;
	Sun, 11 Jun 2023 13:42:03 +0000
Date: Sun, 11 Jun 2023 21:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] hwmon: (oxp-sensors) Add tt_toggle attribute on
 supported boards
Message-ID: <202306112156.gMjghKRD-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/oxp-sensors.c:446:9: sparse: sparse: statement expected after case label"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230610192400.80611-2-samsagax@gmail.com>
References: <20230610192400.80611-2-samsagax@gmail.com>
TO: "Joaquín Ignacio Aramendía" <samsagax@gmail.com>
TO: linux@roeck-us.net
CC: "Joaquín Ignacio Aramendía" <samsagax@gmail.com>
CC: derekjohn.clark@gmail.com
CC: jdelvare@suse.com
CC: linux-hwmon@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Joaquín,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on next-20230609]
[cannot apply to linus/master v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joaqu-n-Ignacio-Aramend-a/hwmon-oxp-sensors-Add-tt_toggle-attribute-on-supported-boards/20230611-032531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230610192400.80611-2-samsagax%40gmail.com
patch subject: [PATCH v2] hwmon: (oxp-sensors) Add tt_toggle attribute on supported boards
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-s053-20230611 (https://download.01.org/0day-ci/archive/20230611/202306112156.gMjghKRD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/d385b4347d2e44c432c183b3b8d58414db00a2dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Joaqu-n-Ignacio-Aramend-a/hwmon-oxp-sensors-Add-tt_toggle-attribute-on-supported-boards/20230611-032531
        git checkout d385b4347d2e44c432c183b3b8d58414db00a2dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hwmon/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306112156.gMjghKRD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/oxp-sensors.c:446:9: sparse: sparse: statement expected after case label

vim +446 drivers/hwmon/oxp-sensors.c

ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  416  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  417  /* Initialization logic */
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  418  static int oxp_platform_probe(struct platform_device *pdev)
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  419  {
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  420  	const struct dmi_system_id *dmi_entry;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  421  	struct device *dev = &pdev->dev;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  422  	struct device *hwdev;
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  423  	int ret;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  424  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  425  	/*
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  426  	 * Have to check for AMD processor here because DMI strings are the
ebd4bfee2b972d Derek J. Clark            2022-12-28  427  	 * same between Intel and AMD boards, the only way to tell them apart
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  428  	 * is the CPU.
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  429  	 * Intel boards seem to have different EC registers and values to
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  430  	 * read/write.
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  431  	 */
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  432  	dmi_entry = dmi_first_match(dmi_table);
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  433  	if (!dmi_entry || boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  434  		return -ENODEV;
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  435  
5d06ec4279a860 Joaquín Ignacio Aramendía 2023-04-29  436  	board = (enum oxp_board)(unsigned long)dmi_entry->driver_data;
3ca0f12a02582c Joaquín Ignacio Aramendía 2022-11-25  437  
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  438  	switch (board) {
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  439  	case aok_zoe_a1:
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  440  	case oxp_mini_amd_a07:
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  441  	case oxp_mini_amd_pro:
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  442  		ret = devm_device_add_groups(dev, oxp_ec_groups);
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  443  		if (ret)
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  444  			return ret;
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  445  	default:
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10 @446  	}
d385b4347d2e44 Joaquín Ignacio Aramendía 2023-06-10  447  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  448  	hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", NULL,
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  449  						     &oxp_ec_chip_info, NULL);
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  450  
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  451  	return PTR_ERR_OR_ZERO(hwdev);
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  452  }
ed264e8a7d18c5 Joaquín Ignacio Aramendía 2022-11-04  453  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
