Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9909E7EC
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Sep 2023 00:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694048246; x=1725584246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j8eAAfYRMAB1KPZOq8pzciPm3oKVk86aNNGUrQEnDbw=;
  b=Kb9KC+7XWK9PIBu+LjOq0IjX6lzhGP0wYD5XKupaofWkAIqZdvwVwiPQ
   H4ZXQMvDFZgtTB7ozlju/alLa5VtUDmOB5myuri7noWPxbyuUEYUCowZ3
   HS/BXWudU/Qt0HM97jrYkyYdwdecJxeaILevWzto1d2yj1Z9AN/4EyEGE
   fdhIUrcs2dapXlAN770/urS23Zgg4JcevZ00kQNMNh+mLOqg8M8mV3I51
   HtbsbpWtkrtCVax/LNtCmqjlrEZr85OrJss4tQqt+aVXuzeb3NBZE+I3B
   kvEMzz6oXZmPHH9cJDTd2g1hZaS6SKAyYnX1uj3Fk/2HePfGPP7dldVRh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443611106"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="443611106"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 17:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072631905"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="1072631905"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2023 17:57:23 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe3Kj-0000kt-28;
	Thu, 07 Sep 2023 00:57:21 +0000
Date: Thu, 7 Sep 2023 08:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:275
 vcap_show_admin() warn: passing zero to 'PTR_ERR'
Message-ID: <202309070831.hTvj9ekP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Horatiu Vultur <horatiu.vultur@microchip.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ba2090ca64ea1aa435744884124387db1fac70f
commit: 610c32b2ce66d4aaa07b3a77a709bd4d2b268bb1 net: microchip: vcap: Add vcap_get_rule
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070831.hTvj9ekP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309070831.hTvj9ekP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309070831.hTvj9ekP-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:275 vcap_show_admin() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:103 vcap_debugfs_show_rule_keyfield() error: uninitialized symbol 'value'.
drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:106 vcap_debugfs_show_rule_keyfield() error: uninitialized symbol 'mask'.

vim +/PTR_ERR +275 drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c

3a7921560d2fd3 Steen Hegelund 2022-11-17  262  
3a7921560d2fd3 Steen Hegelund 2022-11-17  263  static int vcap_show_admin(struct vcap_control *vctrl,
3a7921560d2fd3 Steen Hegelund 2022-11-17  264  			   struct vcap_admin *admin,
3a7921560d2fd3 Steen Hegelund 2022-11-17  265  			   struct vcap_output_print *out)
3a7921560d2fd3 Steen Hegelund 2022-11-17  266  {
610c32b2ce66d4 Horatiu Vultur 2022-12-03  267  	struct vcap_rule_internal *elem;
610c32b2ce66d4 Horatiu Vultur 2022-12-03  268  	struct vcap_rule *vrule;
3a7921560d2fd3 Steen Hegelund 2022-11-17  269  	int ret = 0;
3a7921560d2fd3 Steen Hegelund 2022-11-17  270  
3a7921560d2fd3 Steen Hegelund 2022-11-17  271  	vcap_show_admin_info(vctrl, admin, out);
3a7921560d2fd3 Steen Hegelund 2022-11-17  272  	list_for_each_entry(elem, &admin->rules, list) {
610c32b2ce66d4 Horatiu Vultur 2022-12-03  273  		vrule = vcap_get_rule(vctrl, elem->data.id);
610c32b2ce66d4 Horatiu Vultur 2022-12-03  274  		if (IS_ERR_OR_NULL(vrule)) {
610c32b2ce66d4 Horatiu Vultur 2022-12-03 @275  			ret = PTR_ERR(vrule);
610c32b2ce66d4 Horatiu Vultur 2022-12-03  276  			break;
682f560b8a87bf Dan Carpenter  2022-11-29  277  		}
610c32b2ce66d4 Horatiu Vultur 2022-12-03  278  
3a7921560d2fd3 Steen Hegelund 2022-11-17  279  		out->prf(out->dst, "\n");
610c32b2ce66d4 Horatiu Vultur 2022-12-03  280  		vcap_show_admin_rule(vctrl, admin, out, to_intrule(vrule));
610c32b2ce66d4 Horatiu Vultur 2022-12-03  281  		vcap_free_rule(vrule);
3a7921560d2fd3 Steen Hegelund 2022-11-17  282  	}
3a7921560d2fd3 Steen Hegelund 2022-11-17  283  	return ret;
3a7921560d2fd3 Steen Hegelund 2022-11-17  284  }
3a7921560d2fd3 Steen Hegelund 2022-11-17  285  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
