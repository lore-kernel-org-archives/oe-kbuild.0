Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3496D27725
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Jul 2023 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689164818; x=1720700818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T9ljf2o1CwYWirEEzT3JCTMpMkjXdftEBiFIRRME2k4=;
  b=EEXVdnDJw6MpW1VmHL/gfYkAUCBNzVTj/vy5HiupYWLnNKsy/BNu2kFv
   IShCiTnAUkD3Swvx0laS6pivQu8X0rPRIvJFFHKfh9rFX79Q02giQn6VF
   npd491neQBiIUaLK4EDcT8v42pExIhCTiv9lnHOjkrXnHy2HbRgaHZyWf
   xsb5gDbUCyXm0HAUL38sS03Dauet1g+d8sUOYuqydZy8Zjn8VCEapfElo
   9ASkE0wOw7ZyRhiaRbE44//Qwmees1bHaFsZCJ+MEHDJNYmfpreyCBsmZ
   /ahK/j9PMyPJijoumcZBFoF8ylxPbPKysekdAlaZq94NP+jM9uWtmtquG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431008809"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="431008809"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 05:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="721492659"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="721492659"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jul 2023 05:26:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJYvl-0005g9-1q;
	Wed, 12 Jul 2023 12:26:53 +0000
Date: Wed, 12 Jul 2023 20:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Configure Retimer
 cable type
Message-ID: <202307122026.7Iaz7rZa-lkp@intel.com>
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
In-Reply-To: <20230628173727.701140-2-utkarsh.h.patel@intel.com>
References: <20230628173727.701140-2-utkarsh.h.patel@intel.com>
TO: Utkarsh Patel <utkarsh.h.patel@intel.com>

Hi Utkarsh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus chrome-platform/for-next westeri-thunderbolt/next linus/master v6.5-rc1 next-20230712]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Utkarsh-Patel/platform-chrome-cros_ec_typec-Configure-Retimer-cable-type/20230629-013750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230628173727.701140-2-utkarsh.h.patel%40intel.com
patch subject: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Configure Retimer cable type
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-m021-20230710 (https://download.01.org/0day-ci/archive/20230712/202307122026.7Iaz7rZa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122026.7Iaz7rZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307122026.7Iaz7rZa-lkp@intel.com/

smatch warnings:
drivers/platform/chrome/cros_ec_typec.c:421 cros_typec_get_cable_vdo() warn: iterator used outside loop: 'node'

vim +/node +421 drivers/platform/chrome/cros_ec_typec.c

9d33ea33103233 Prashant Malani 2020-04-14  408  
614bf1649c6dd4 Utkarsh Patel   2023-06-28  409  static int cros_typec_get_cable_vdo(struct cros_typec_data *typec, int port_num,
614bf1649c6dd4 Utkarsh Patel   2023-06-28  410  				    uint16_t svid)
614bf1649c6dd4 Utkarsh Patel   2023-06-28  411  {
614bf1649c6dd4 Utkarsh Patel   2023-06-28  412  	struct cros_typec_port *port = typec->ports[port_num];
614bf1649c6dd4 Utkarsh Patel   2023-06-28  413  	struct list_head *head = &port->plug_mode_list;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  414  	struct cros_typec_altmode_node *node;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  415  
614bf1649c6dd4 Utkarsh Patel   2023-06-28  416  	list_for_each_entry(node, head, list) {
614bf1649c6dd4 Utkarsh Patel   2023-06-28  417  		if (node->amode->svid == svid)
614bf1649c6dd4 Utkarsh Patel   2023-06-28  418  			break;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  419  	}
614bf1649c6dd4 Utkarsh Patel   2023-06-28  420  
614bf1649c6dd4 Utkarsh Patel   2023-06-28 @421  	if (node->amode->svid != svid)
614bf1649c6dd4 Utkarsh Patel   2023-06-28  422  		return 0;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  423  
614bf1649c6dd4 Utkarsh Patel   2023-06-28  424  	return node->amode->vdo;
614bf1649c6dd4 Utkarsh Patel   2023-06-28  425  }
614bf1649c6dd4 Utkarsh Patel   2023-06-28  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
