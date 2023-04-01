Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C012179
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680337897; x=1711873897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AxmXU/M40sPXUiWGgsNnCtCvM5iuffezGEwm4Yr3CaQ=;
  b=eSPpDqXhC+Uc/0WUxbUC88cjQlHBJ4XaZQ+wzj8xokBRdDNwZW61+bKq
   dXCORDzj2NEGkbl+mObqdvXhhyIbZYYNdk0swoy8wYTsIoZnebyrf/SiP
   n+rQgka9/tHoDDLYLz7uyRWdEDx7CzMQWZTwHhlB5Mwej5XMAHZuwCXIT
   nflA67H27I0/iBCy0Me6lC+UEl7nYj0XoUQgJ4CBB1jJvLbJQxcj3aPJC
   0l4LvkyocHZSsovUGf2WcV6Pi0Ot8ryMWfPftMH2WR7PGpS0llnYoBILl
   EdEh8S5IjXNkq970EQnVRRwO1oAqd8tSUuPqF2Lm0kgXnJmCJGOHBuEdo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339127098"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="339127098"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 01:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="749918109"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="749918109"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Apr 2023 01:31:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piWds-000Mdb-0l;
	Sat, 01 Apr 2023 08:31:20 +0000
Date: Sat, 1 Apr 2023 16:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/ti/cpsw_priv.c:1492
 cpsw_qos_configure_clsflower() warn: ignoring unreachable code.
Message-ID: <202304011615.Bia0Ruhc-lkp@intel.com>
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
TO: Grygorii Strashko <grygorii.strashko@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b50567bdcad8925ca1e075feb7171c12015afd1
commit: 127c9e970f59edaaaa7a7134e55752314c9691da net: ethernet: ti: cpsw_new: enable bc/mc storm prevention support
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230401/202304011615.Bia0Ruhc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304011615.Bia0Ruhc-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/ti/cpsw_priv.c:1492 cpsw_qos_configure_clsflower() warn: ignoring unreachable code.

vim +1492 drivers/net/ethernet/ti/cpsw_priv.c

127c9e970f59ed Grygorii Strashko 2022-04-12  1484  
127c9e970f59ed Grygorii Strashko 2022-04-12  1485  static int cpsw_qos_configure_clsflower(struct cpsw_priv *priv, struct flow_cls_offload *cls)
127c9e970f59ed Grygorii Strashko 2022-04-12  1486  {
127c9e970f59ed Grygorii Strashko 2022-04-12  1487  	struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
127c9e970f59ed Grygorii Strashko 2022-04-12  1488  	struct netlink_ext_ack *extack = cls->common.extack;
127c9e970f59ed Grygorii Strashko 2022-04-12  1489  	const struct flow_action_entry *act;
127c9e970f59ed Grygorii Strashko 2022-04-12  1490  	int i, ret;
127c9e970f59ed Grygorii Strashko 2022-04-12  1491  
127c9e970f59ed Grygorii Strashko 2022-04-12 @1492  	flow_action_for_each(i, act, &rule->action) {
127c9e970f59ed Grygorii Strashko 2022-04-12  1493  		switch (act->id) {
127c9e970f59ed Grygorii Strashko 2022-04-12  1494  		case FLOW_ACTION_POLICE:
127c9e970f59ed Grygorii Strashko 2022-04-12  1495  			ret = cpsw_qos_clsflower_policer_validate(&rule->action, act, extack);
127c9e970f59ed Grygorii Strashko 2022-04-12  1496  			if (ret)
127c9e970f59ed Grygorii Strashko 2022-04-12  1497  				return ret;
127c9e970f59ed Grygorii Strashko 2022-04-12  1498  
127c9e970f59ed Grygorii Strashko 2022-04-12  1499  			return cpsw_qos_clsflower_add_policer(priv, extack, cls,
127c9e970f59ed Grygorii Strashko 2022-04-12  1500  							      act->police.rate_pkt_ps);
127c9e970f59ed Grygorii Strashko 2022-04-12  1501  		default:
127c9e970f59ed Grygorii Strashko 2022-04-12  1502  			NL_SET_ERR_MSG_MOD(extack, "Action not supported");
127c9e970f59ed Grygorii Strashko 2022-04-12  1503  			return -EOPNOTSUPP;
127c9e970f59ed Grygorii Strashko 2022-04-12  1504  		}
127c9e970f59ed Grygorii Strashko 2022-04-12  1505  	}
127c9e970f59ed Grygorii Strashko 2022-04-12  1506  	return -EOPNOTSUPP;
127c9e970f59ed Grygorii Strashko 2022-04-12  1507  }
127c9e970f59ed Grygorii Strashko 2022-04-12  1508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
