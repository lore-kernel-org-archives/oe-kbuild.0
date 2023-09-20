Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E3522B
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Sep 2023 06:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695190772; x=1726726772;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rc9Bj/uxk6S6WQKhrrLb8oY1tXMpXUGMuaXYSfIJJTk=;
  b=UlrB8FaNq+63ZPM5fS4yTjZxw1eanPeab3mSi342vGoiuuAziF/5dJT5
   I9I6+8ss+DVucfWluDRH5bWS6WXZyxsIVUPjo+MmOIAp7kR09uv3ulqY/
   YBTr3QPXPogAeQJcMIM36jPtsHhVy5Y6ZkWpZ9DzrPZMwyZ1kFQu6r94p
   QaazraSeNSTi0NtWRv0/xE6rR8ISbi00Y15asragX1gLnLMJP+2wdE9Nw
   sGE8ulsp2ymQsPeeJTVKh9HxkhpkwjBj7iWh4G2MoMn0S1xTWTVzyWrvq
   NZ2aJIbJRBz4SshXcgpxo2FRHV05olDNZRPN/BP8fiT0TzygM4y+JN3y3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365187552"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="365187552"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 23:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077296746"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="1077296746"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Sep 2023 23:19:29 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiqYZ-0008OS-15;
	Wed, 20 Sep 2023 06:19:27 +0000
Date: Wed, 20 Sep 2023 14:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/hp/hp-bioscfg/bioscfg.c:646
 hp_add_other_attributes() warn: possible memory leak of 'attr_name_kobj'
Message-ID: <202309201412.on0VXJGo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jorge Lopez <jorge.lopez2@hp.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: "Thomas Weiﬂschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf0f715623872823a72e451243bbf555d10d032
commit: eff3bac88aeda6f10f3b3c5e146e8ce29ff3bfb9 platform/x86: hp-bioscfg: Makefile
date:   2 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-141-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201412.on0VXJGo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309201412.on0VXJGo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309201412.on0VXJGo-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/hp/hp-bioscfg/bioscfg.c:646 hp_add_other_attributes() warn: possible memory leak of 'attr_name_kobj'

Old smatch warnings:
drivers/platform/x86/hp/hp-bioscfg/bioscfg.c:637 hp_add_other_attributes() warn: missing error code 'ret'

vim +/attr_name_kobj +646 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c

a34fc329b1895f Jorge Lopez 2023-06-08  571  
a34fc329b1895f Jorge Lopez 2023-06-08  572  /**
a34fc329b1895f Jorge Lopez 2023-06-08  573   * hp_add_other_attributes() - Initialize HP custom attributes not
a34fc329b1895f Jorge Lopez 2023-06-08  574   * reported by BIOS and required to support Secure Platform and Sure
a34fc329b1895f Jorge Lopez 2023-06-08  575   * Start.
a34fc329b1895f Jorge Lopez 2023-06-08  576   *
a34fc329b1895f Jorge Lopez 2023-06-08  577   * @attr_type: Custom HP attribute not reported by BIOS
a34fc329b1895f Jorge Lopez 2023-06-08  578   *
a34fc329b1895f Jorge Lopez 2023-06-08  579   * Initialize all 2 types of attributes: Platform and Sure Start
a34fc329b1895f Jorge Lopez 2023-06-08  580   * object.  Populates each attribute types respective properties
a34fc329b1895f Jorge Lopez 2023-06-08  581   * under sysfs files.
a34fc329b1895f Jorge Lopez 2023-06-08  582   *
a34fc329b1895f Jorge Lopez 2023-06-08  583   * Returns zero(0) if successful. Otherwise, a negative value.
a34fc329b1895f Jorge Lopez 2023-06-08  584   */
a34fc329b1895f Jorge Lopez 2023-06-08  585  static int hp_add_other_attributes(int attr_type)
a34fc329b1895f Jorge Lopez 2023-06-08  586  {
a34fc329b1895f Jorge Lopez 2023-06-08  587  	struct kobject *attr_name_kobj;
a34fc329b1895f Jorge Lopez 2023-06-08  588  	union acpi_object *obj = NULL;
a34fc329b1895f Jorge Lopez 2023-06-08  589  	int ret;
a34fc329b1895f Jorge Lopez 2023-06-08  590  	char *attr_name;
a34fc329b1895f Jorge Lopez 2023-06-08  591  
a34fc329b1895f Jorge Lopez 2023-06-08  592  	mutex_lock(&bioscfg_drv.mutex);
a34fc329b1895f Jorge Lopez 2023-06-08  593  
a34fc329b1895f Jorge Lopez 2023-06-08  594  	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
a34fc329b1895f Jorge Lopez 2023-06-08  595  	if (!attr_name_kobj) {
a34fc329b1895f Jorge Lopez 2023-06-08  596  		ret = -ENOMEM;
a34fc329b1895f Jorge Lopez 2023-06-08  597  		goto err_other_attr_init;
a34fc329b1895f Jorge Lopez 2023-06-08  598  	}
a34fc329b1895f Jorge Lopez 2023-06-08  599  
a34fc329b1895f Jorge Lopez 2023-06-08  600  	/* Check if attribute type is supported */
a34fc329b1895f Jorge Lopez 2023-06-08  601  	switch (attr_type) {
a34fc329b1895f Jorge Lopez 2023-06-08  602  	case HPWMI_SECURE_PLATFORM_TYPE:
a34fc329b1895f Jorge Lopez 2023-06-08  603  		attr_name_kobj->kset = bioscfg_drv.authentication_dir_kset;
a34fc329b1895f Jorge Lopez 2023-06-08  604  		attr_name = SPM_STR;
a34fc329b1895f Jorge Lopez 2023-06-08  605  		break;
a34fc329b1895f Jorge Lopez 2023-06-08  606  
a34fc329b1895f Jorge Lopez 2023-06-08  607  	case HPWMI_SURE_START_TYPE:
a34fc329b1895f Jorge Lopez 2023-06-08  608  		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
a34fc329b1895f Jorge Lopez 2023-06-08  609  		attr_name = SURE_START_STR;
a34fc329b1895f Jorge Lopez 2023-06-08  610  		break;
a34fc329b1895f Jorge Lopez 2023-06-08  611  
a34fc329b1895f Jorge Lopez 2023-06-08  612  	default:
a34fc329b1895f Jorge Lopez 2023-06-08  613  		pr_err("Error: Unknown attr_type: %d\n", attr_type);
a34fc329b1895f Jorge Lopez 2023-06-08  614  		ret = -EINVAL;
a34fc329b1895f Jorge Lopez 2023-06-08  615  		goto err_other_attr_init;
a34fc329b1895f Jorge Lopez 2023-06-08  616  	}
a34fc329b1895f Jorge Lopez 2023-06-08  617  
a34fc329b1895f Jorge Lopez 2023-06-08  618  	ret = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
a34fc329b1895f Jorge Lopez 2023-06-08  619  				   NULL, "%s", attr_name);
a34fc329b1895f Jorge Lopez 2023-06-08  620  	if (ret) {
a34fc329b1895f Jorge Lopez 2023-06-08  621  		pr_err("Error encountered [%d]\n", ret);
a34fc329b1895f Jorge Lopez 2023-06-08  622  		kobject_put(attr_name_kobj);
a34fc329b1895f Jorge Lopez 2023-06-08  623  		goto err_other_attr_init;
a34fc329b1895f Jorge Lopez 2023-06-08  624  	}
a34fc329b1895f Jorge Lopez 2023-06-08  625  
a34fc329b1895f Jorge Lopez 2023-06-08  626  	/* Populate attribute data */
a34fc329b1895f Jorge Lopez 2023-06-08  627  	switch (attr_type) {
a34fc329b1895f Jorge Lopez 2023-06-08  628  	case HPWMI_SECURE_PLATFORM_TYPE:
a34fc329b1895f Jorge Lopez 2023-06-08  629  		ret = hp_populate_secure_platform_data(attr_name_kobj);
a34fc329b1895f Jorge Lopez 2023-06-08  630  		break;
a34fc329b1895f Jorge Lopez 2023-06-08  631  
a34fc329b1895f Jorge Lopez 2023-06-08  632  	case HPWMI_SURE_START_TYPE:
a34fc329b1895f Jorge Lopez 2023-06-08  633  		ret = hp_populate_sure_start_data(attr_name_kobj);
a34fc329b1895f Jorge Lopez 2023-06-08  634  		break;
a34fc329b1895f Jorge Lopez 2023-06-08  635  
a34fc329b1895f Jorge Lopez 2023-06-08  636  	default:
a34fc329b1895f Jorge Lopez 2023-06-08  637  		goto err_other_attr_init;
a34fc329b1895f Jorge Lopez 2023-06-08  638  	}
a34fc329b1895f Jorge Lopez 2023-06-08  639  
a34fc329b1895f Jorge Lopez 2023-06-08  640  	mutex_unlock(&bioscfg_drv.mutex);
a34fc329b1895f Jorge Lopez 2023-06-08  641  	return 0;
a34fc329b1895f Jorge Lopez 2023-06-08  642  
a34fc329b1895f Jorge Lopez 2023-06-08  643  err_other_attr_init:
a34fc329b1895f Jorge Lopez 2023-06-08  644  	mutex_unlock(&bioscfg_drv.mutex);
a34fc329b1895f Jorge Lopez 2023-06-08  645  	kfree(obj);
a34fc329b1895f Jorge Lopez 2023-06-08 @646  	return ret;
a34fc329b1895f Jorge Lopez 2023-06-08  647  }
a34fc329b1895f Jorge Lopez 2023-06-08  648  

:::::: The code at line 646 was first introduced by commit
:::::: a34fc329b1895fc8a6eb12099adc47009421ba6a platform/x86: hp-bioscfg: bioscfg

:::::: TO: Jorge Lopez <jorge.lopez2@hp.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
