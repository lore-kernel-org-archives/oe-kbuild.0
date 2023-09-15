Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B21097B
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694798585; x=1726334585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZnNxAQfY/TkhPZQm3UqUExkcj8MjKkYkjRJOqZUye18=;
  b=Dj4vUBF3fnwtDxbRelt0MoDfh9lIgHTbpYMai+tkjLFAIV8dlExngNPp
   nr8BuGEZfPJj/k0+EMXFRnHPzoSw4MIV8LPlDQbU/MN8eI4YxCAxxVOjm
   S+9unVzhFiWPPML+69B16kqlLzszXgyKyDfG4YqdFKdpqJ7NrMuV5sbIH
   A5kuy6KEoJl0GCwDow9Mr2HjUdYV3sS2Eiv8wcEaIgxHdc/gVoFwiMTz7
   8EWOiOwxtXcsJ8nEI6PWO2huXGoXdWZdKDse6tQVzj9mJg0tuljvCtuC5
   0YKdw4ysdFwNJtoHFeQC2Gpngu3CgZkNHfSg0H5NGyeiE3p5P5moifCsr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="382036151"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="382036151"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 10:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="780172373"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="780172373"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Sep 2023 10:23:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhCWy-0003Eo-0x;
	Fri, 15 Sep 2023 17:23:00 +0000
Date: Sat, 16 Sep 2023 01:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/target/tcm_remote/tcm_remote.c:109 tcm_remote_make_tpg()
 warn: potential spectre issue 'remote_hba->remote_hba_tpgs' [r] (local cap)
Message-ID: <202309160114.2n1JzS9k-lkp@intel.com>
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
TO: Dmitry Bogdanov <d.bogdanov@yadro.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Mike Christie <michael.christie@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9fdfb15a3dbf818e06be514f4abbfc071004cbe7
commit: 075a5d356103b32bc7023b03ede60a2f183bcfb3 scsi: target: Add virtual remote target
date:   6 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20230915 (https://download.01.org/0day-ci/archive/20230916/202309160114.2n1JzS9k-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230916/202309160114.2n1JzS9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309160114.2n1JzS9k-lkp@intel.com/

smatch warnings:
drivers/target/tcm_remote/tcm_remote.c:109 tcm_remote_make_tpg() warn: potential spectre issue 'remote_hba->remote_hba_tpgs' [r] (local cap)

vim +109 drivers/target/tcm_remote/tcm_remote.c

075a5d356103b3 Dmitry Bogdanov 2023-03-13   86  
075a5d356103b3 Dmitry Bogdanov 2023-03-13   87  static struct se_portal_group *tcm_remote_make_tpg(
075a5d356103b3 Dmitry Bogdanov 2023-03-13   88  	struct se_wwn *wwn,
075a5d356103b3 Dmitry Bogdanov 2023-03-13   89  	const char *name)
075a5d356103b3 Dmitry Bogdanov 2023-03-13   90  {
075a5d356103b3 Dmitry Bogdanov 2023-03-13   91  	struct tcm_remote_hba *remote_hba = container_of(wwn,
075a5d356103b3 Dmitry Bogdanov 2023-03-13   92  			struct tcm_remote_hba, remote_hba_wwn);
075a5d356103b3 Dmitry Bogdanov 2023-03-13   93  	struct tcm_remote_tpg *remote_tpg;
075a5d356103b3 Dmitry Bogdanov 2023-03-13   94  	unsigned long tpgt;
075a5d356103b3 Dmitry Bogdanov 2023-03-13   95  	int ret;
075a5d356103b3 Dmitry Bogdanov 2023-03-13   96  
075a5d356103b3 Dmitry Bogdanov 2023-03-13   97  	if (strstr(name, "tpgt_") != name) {
075a5d356103b3 Dmitry Bogdanov 2023-03-13   98  		pr_err("Unable to locate \"tpgt_#\" directory group\n");
075a5d356103b3 Dmitry Bogdanov 2023-03-13   99  		return ERR_PTR(-EINVAL);
075a5d356103b3 Dmitry Bogdanov 2023-03-13  100  	}
075a5d356103b3 Dmitry Bogdanov 2023-03-13  101  	if (kstrtoul(name + 5, 10, &tpgt))
075a5d356103b3 Dmitry Bogdanov 2023-03-13  102  		return ERR_PTR(-EINVAL);
075a5d356103b3 Dmitry Bogdanov 2023-03-13  103  
075a5d356103b3 Dmitry Bogdanov 2023-03-13  104  	if (tpgt >= TL_TPGS_PER_HBA) {
075a5d356103b3 Dmitry Bogdanov 2023-03-13  105  		pr_err("Passed tpgt: %lu exceeds TL_TPGS_PER_HBA: %u\n",
075a5d356103b3 Dmitry Bogdanov 2023-03-13  106  		       tpgt, TL_TPGS_PER_HBA);
075a5d356103b3 Dmitry Bogdanov 2023-03-13  107  		return ERR_PTR(-EINVAL);
075a5d356103b3 Dmitry Bogdanov 2023-03-13  108  	}
075a5d356103b3 Dmitry Bogdanov 2023-03-13 @109  	remote_tpg = &remote_hba->remote_hba_tpgs[tpgt];
075a5d356103b3 Dmitry Bogdanov 2023-03-13  110  	remote_tpg->remote_hba = remote_hba;
075a5d356103b3 Dmitry Bogdanov 2023-03-13  111  	remote_tpg->remote_tpgt = tpgt;
075a5d356103b3 Dmitry Bogdanov 2023-03-13  112  	/*
075a5d356103b3 Dmitry Bogdanov 2023-03-13  113  	 * Register the remote_tpg as a emulated TCM Target Endpoint
075a5d356103b3 Dmitry Bogdanov 2023-03-13  114  	 */
075a5d356103b3 Dmitry Bogdanov 2023-03-13  115  	ret = core_tpg_register(wwn, &remote_tpg->remote_se_tpg,
075a5d356103b3 Dmitry Bogdanov 2023-03-13  116  				remote_hba->remote_proto_id);
075a5d356103b3 Dmitry Bogdanov 2023-03-13  117  	if (ret < 0)
075a5d356103b3 Dmitry Bogdanov 2023-03-13  118  		return ERR_PTR(-ENOMEM);
075a5d356103b3 Dmitry Bogdanov 2023-03-13  119  
075a5d356103b3 Dmitry Bogdanov 2023-03-13  120  	pr_debug("TCM_Remote_ConfigFS: Allocated Emulated %s Target Port %s,t,0x%04lx\n",
075a5d356103b3 Dmitry Bogdanov 2023-03-13  121  		 tcm_remote_dump_proto_id(remote_hba),
075a5d356103b3 Dmitry Bogdanov 2023-03-13  122  		 config_item_name(&wwn->wwn_group.cg_item), tpgt);
075a5d356103b3 Dmitry Bogdanov 2023-03-13  123  	return &remote_tpg->remote_se_tpg;
075a5d356103b3 Dmitry Bogdanov 2023-03-13  124  }
075a5d356103b3 Dmitry Bogdanov 2023-03-13  125  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
