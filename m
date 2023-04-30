Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA3F17C2
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682873983; x=1714409983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VO+Q32UnVe743CDsSzl1X2R+qaAJw9RJ7lJe2i6uVqA=;
  b=M/+UvK+CF0/5Ai2kDhhXNzESkU0/xdM0ZZzbez/IuHDEGugZimvtKPSx
   hhTHMrg1MuuN/GtWHYQthYSCYf+rxDJGc/+MdhGZsX8EDESFEwzE0JbXY
   aWX9OClcGbOnEncHLI+MDSczrTEcNqx+y0zG9LuGjbp0bucw0ZNWPZChb
   BqzXwQ4avzM1oPlfCZToJQ6p5Zm2JXfmMnt8Nkh8E7w1sVYR3nkcoBz5t
   sGoTAqd+X+qEJFxhF0Ujmp4jeIvM21rUbUEtSQ5Y3yiTQlZY3lAKv2d6Y
   8iXmwWvMwId+cr9DMEJJnF9V/z4pHtkehdh7uqNOoWDuflgBtlmJY82Xp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="434352211"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="434352211"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 09:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695547329"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="695547329"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Apr 2023 09:59:41 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptAOi-00003J-1X;
	Sun, 30 Apr 2023 16:59:40 +0000
Date: Mon, 1 May 2023 00:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:275
 vcap_show_admin() warn: passing zero to 'PTR_ERR'
Message-ID: <202305010045.ONSEV5s9-lkp@intel.com>
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
head:   825a0714d2b3883d4f8ff64f6933fb73ee3f1834
commit: 610c32b2ce66d4aaa07b3a77a709bd4d2b268bb1 net: microchip: vcap: Add vcap_get_rule
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: m68k-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010045.ONSEV5s9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305010045.ONSEV5s9-lkp@intel.com/

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
https://github.com/intel/lkp-tests
