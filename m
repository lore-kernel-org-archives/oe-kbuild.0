Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC75368
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 00:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694132742; x=1725668742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nyqwbnUZULOptayJW6ZO5xE9JNT5DBk3jdmF9T8etlQ=;
  b=iPspAqeV2sz6GaAClo+TezlM2nG4Pfe76nK6eDQXlyKzS0y5FDesWaV3
   yrDOsg31qPWPSSo1H9aO8nNHU4KeZAXDmEKi7IpRy331uE1/NS4SAOa/X
   L1aA7Vg0mo/UKqoq6insv9vn0eUfO2v1k4mxxBqHUTJ14MrZNvRcHfCeY
   DOG9FsfwHKnRHFcZRgg74u3fNT1xr/qrTni1ANCBcSG6UVT1F7qiyxASG
   JXALgTAbBowPR6BSYuosi/FDn/jr8FlsH2DfzSeMkEschY+a+7TnTKT9H
   OtGfLrEicyCFvUupyCX6AC7P9oKVquFYOiVOVANeHghObWqseZo9qLi+X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="356980611"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="356980611"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 17:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771499476"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="771499476"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2023 17:25:40 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qePJa-0001kB-21;
	Fri, 08 Sep 2023 00:25:38 +0000
Date: Fri, 8 Sep 2023 08:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:275
 vcap_show_admin() warn: passing zero to 'PTR_ERR'
Message-ID: <202309080806.jvI33SRJ-lkp@intel.com>
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
head:   4a0fc73da97efd23a383ca839e6fe86410268f6b
commit: 610c32b2ce66d4aaa07b3a77a709bd4d2b268bb1 net: microchip: vcap: Add vcap_get_rule
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20230906 (https://download.01.org/0day-ci/archive/20230908/202309080806.jvI33SRJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309080806.jvI33SRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309080806.jvI33SRJ-lkp@intel.com/

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
