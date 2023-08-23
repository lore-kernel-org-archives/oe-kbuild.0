Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706AA7E
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Aug 2023 00:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692750414; x=1724286414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dUiQSsD5NyIi2bMoy5T5yFMS3cykOgapekmLHyn69Ps=;
  b=h86HvtnncgImx3wRR4g3lQMCloeM8GR/R4zvyXI5Wj2CyDBRJMsjUObi
   OSU7/iN15Uu+8sfVvnHqdulf/uxnWNEGu/JYvW6SbWVbnBfBiu2g682QM
   BieuIrYL1VJT8zB6LX+ueOFm4hYYCJivRT6A5jwyohYD7LDsmd5PLBWax
   cDyxbpCgbcpOuw/cReQXehGIFAD5qfdeB4t3/jk4/DSD/UnagqaBeJYOu
   gvORhpiMom7lpcbB1hffwGvxpwHGFev0WsSMbpBlTFhql0KFpE31e5Cxx
   jtH4WLfmHDPllttcU9Cx0OPGeE2g51dtCxbkXGRtvXFB81dbJ+UNry8cD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="374003847"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="374003847"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 17:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="1067256444"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="1067256444"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2023 17:26:52 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYbhz-0000eQ-1V;
	Wed, 23 Aug 2023 00:26:51 +0000
Date: Wed, 23 Aug 2023 08:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/of/dynamic.c:935 of_changeset_action() warn: possible memory
 leak of 'ce'
Message-ID: <202308230814.2zOreL63-lkp@intel.com>
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
head:   89bf6209cad66214d3774dac86b6bbf2aec6a30d
commit: 914d9d831e6126a6e7a92e27fcfaa250671be42c of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
date:   34 hours ago
:::::: branch date: 6 hours ago
:::::: commit date: 34 hours ago
config: nios2-randconfig-r081-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230814.2zOreL63-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230814.2zOreL63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308230814.2zOreL63-lkp@intel.com/

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
