Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E061510E3
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Sep 2023 02:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693534940; x=1725070940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fO4Hw1LwG8kM1u6UBShJIfTmDSKZzaWcpaxYFo1ZGnM=;
  b=b7HQLDI2J5Jii8OD9aNOfBZ7VzHbqYmY+s8o2CLapWmvXanIvKmojqAP
   zthibZ8T4VHMXwx1uWgTBsknCySyqDXgWjgIDpNG+tCk4TnG8Ex0fEtEM
   CZRu0AQ6rVXjJyRwmjCth6tP/K9tMtfXY5g28GTNzm/a6MxZjrkxLWITe
   MOCiaZo5v95bXtPrKBqriayFBhTHVUx4GNJiBZhwtA7njw/SOy/720nlj
   hgicUPRpv9CRBFHm71jS9AMzB6Qpqg3D5+07KexMJhoRctEx02A8GGExd
   kVo8tIjEAFHV499XxZ1gCU05bQsey/RwB1a5RLC6mQyXNx37RJWjNOhQQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442513485"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="442513485"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 19:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883029725"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="883029725"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Aug 2023 19:22:22 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbtnc-0000m7-11;
	Fri, 01 Sep 2023 02:22:16 +0000
Date: Fri, 1 Sep 2023 10:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/of/dynamic.c:935 of_changeset_action() warn: possible memory
 leak of 'ce'
Message-ID: <202309011059.EOdr4im9-lkp@intel.com>
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
TO: Rob Herring <robh@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   99d99825fc075fd24b60cc9cf0fb1e20b9c16b0f
commit: 914d9d831e6126a6e7a92e27fcfaa250671be42c of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
date:   11 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-161-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011059.EOdr4im9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230901/202309011059.EOdr4im9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309011059.EOdr4im9-lkp@intel.com/

smatch warnings:
drivers/of/dynamic.c:935 of_changeset_action() warn: possible memory leak of 'ce'

vim +/ce +935 drivers/of/dynamic.c

183223770ae862 Gavin Shan        2015-11-05  907  
201c910bd6898d Pantelis Antoniou 2014-07-04  908  /**
0290c4ca2536a3 Frank Rowand      2017-10-17  909   * of_changeset_action - Add an action to the tail of the changeset list
201c910bd6898d Pantelis Antoniou 2014-07-04  910   *
201c910bd6898d Pantelis Antoniou 2014-07-04  911   * @ocs:	changeset pointer
201c910bd6898d Pantelis Antoniou 2014-07-04  912   * @action:	action to perform
201c910bd6898d Pantelis Antoniou 2014-07-04  913   * @np:		Pointer to device node
201c910bd6898d Pantelis Antoniou 2014-07-04  914   * @prop:	Pointer to property
201c910bd6898d Pantelis Antoniou 2014-07-04  915   *
201c910bd6898d Pantelis Antoniou 2014-07-04  916   * On action being one of:
201c910bd6898d Pantelis Antoniou 2014-07-04  917   * + OF_RECONFIG_ATTACH_NODE
201c910bd6898d Pantelis Antoniou 2014-07-04  918   * + OF_RECONFIG_DETACH_NODE,
201c910bd6898d Pantelis Antoniou 2014-07-04  919   * + OF_RECONFIG_ADD_PROPERTY
201c910bd6898d Pantelis Antoniou 2014-07-04  920   * + OF_RECONFIG_REMOVE_PROPERTY,
201c910bd6898d Pantelis Antoniou 2014-07-04  921   * + OF_RECONFIG_UPDATE_PROPERTY
8c8239c2c1fb82 Rob Herring       2021-03-25  922   *
8c8239c2c1fb82 Rob Herring       2021-03-25  923   * Return: 0 on success, a negative error value in case of an error.
201c910bd6898d Pantelis Antoniou 2014-07-04  924   */
201c910bd6898d Pantelis Antoniou 2014-07-04  925  int of_changeset_action(struct of_changeset *ocs, unsigned long action,
201c910bd6898d Pantelis Antoniou 2014-07-04  926  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  927  {
201c910bd6898d Pantelis Antoniou 2014-07-04  928  	struct of_changeset_entry *ce;
201c910bd6898d Pantelis Antoniou 2014-07-04  929  
201c910bd6898d Pantelis Antoniou 2014-07-04  930  	ce = kzalloc(sizeof(*ce), GFP_KERNEL);
606ad42aa3b1fe Rob Herring       2016-06-15  931  	if (!ce)
201c910bd6898d Pantelis Antoniou 2014-07-04  932  		return -ENOMEM;
606ad42aa3b1fe Rob Herring       2016-06-15  933  
914d9d831e6126 Rob Herring       2023-08-18  934  	if (WARN_ON(action >= ARRAY_SIZE(action_names)))
914d9d831e6126 Rob Herring       2023-08-18 @935  		return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
