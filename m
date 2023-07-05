Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E7D8C15
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Jul 2023 12:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688560261; x=1720096261;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2mPVynAs9tkC6WfeNLwdRUNQANlp2Fh7iuPupiUi+V4=;
  b=RG8jY8SZ8dA2MmPbZUm5trNv5Jdzusa8W3gnJWhdAMbcq0j0wtDsmbxi
   4k3E0Y1rgBw5ZFR2IfLVJqjbWrnjrwx++6acq8EuaGLYyqSS9uNxKugsq
   WKlDICWIxXKk5kptv+Oydw4W8vCJJ7N8ZwH6B/Dxnx9DuGEhl20U+cs5V
   3a+Gn9B2/TtVRiL5wGr9TwVavLvezcEABca0vA3vPqKKrF7nF8kZHv7dZ
   xUi+d5xCGlv4KsddRcQMoLjsIoE8c7HFPWHSdRytAz7X55mwK0S3sGNMo
   3MBqTggrbzm1e1nvWEJPwNCef/AYbcKVgBbnvHuW1EsoIhZ2LKrpFVmBp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="394080871"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="394080871"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 05:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="1049678909"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="1049678909"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Jul 2023 05:30:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qH1er-0000dE-1S;
	Wed, 05 Jul 2023 12:30:57 +0000
Date: Wed, 5 Jul 2023 20:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-hans 109/110]
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c:637 hp_add_other_attributes()
 warn: missing error code 'ret'
Message-ID: <202307052003.TLrtMhBi-lkp@intel.com>
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
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
TO: Jorge Lopez <jorge.lopez2@hp.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: "Thomas Weiﬂschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   645a08fa74b9add29eed1c15824f697ab3a1e843
commit: 16f2ee70f189cba76416436763d34109f2690b9f [109/110] platform/x86: hp-bioscfg: Makefile
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-m021-20230703 (https://download.01.org/0day-ci/archive/20230705/202307052003.TLrtMhBi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307052003.TLrtMhBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307052003.TLrtMhBi-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/hp/hp-bioscfg/bioscfg.c:637 hp_add_other_attributes() warn: missing error code 'ret'
drivers/platform/x86/hp/hp-bioscfg/bioscfg.c:646 hp_add_other_attributes() warn: possible memory leak of 'attr_name_kobj'
drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c:130 hp_wmi_perform_query() warn: unsigned 'mid' is never less than zero.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:180 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:285 hp_populate_enumeration_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:192 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:262 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'value_len'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:286 hp_populate_ordered_list_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:290 hp_populate_ordered_list_elements_from_package() error: double free of 'tmpstr'
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:198 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:263 hp_populate_integer_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:279 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:371 hp_populate_password_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:188 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:252 hp_populate_string_elements_from_package() error: double free of 'str_value'

Old smatch warnings:
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:183 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:186 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:189 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:192 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:231 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:239 hp_populate_enumeration_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:289 hp_populate_enumeration_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:195 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:198 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:201 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:204 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:238 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:242 hp_populate_ordered_list_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:291 hp_populate_ordered_list_elements_from_package() error: double free of 'str_value'
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:201 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:204 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:207 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:246 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:249 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:252 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:255 hp_populate_integer_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:282 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:285 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:288 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:291 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:324 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:327 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:330 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:333 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:362 hp_populate_password_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:191 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:194 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:197 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:200 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:239 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:242 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:245 hp_populate_string_elements_from_package() error: uninitialized symbol 'int_value'.
drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:256 hp_populate_string_elements_from_package() error: double free of 'str_value'

vim +/ret +637 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c

f0e157e6f70ccf Jorge Lopez 2023-06-08  571  
f0e157e6f70ccf Jorge Lopez 2023-06-08  572  /**
f0e157e6f70ccf Jorge Lopez 2023-06-08  573   * hp_add_other_attributes() - Initialize HP custom attributes not
f0e157e6f70ccf Jorge Lopez 2023-06-08  574   * reported by BIOS and required to support Secure Platform and Sure
f0e157e6f70ccf Jorge Lopez 2023-06-08  575   * Start.
f0e157e6f70ccf Jorge Lopez 2023-06-08  576   *
f0e157e6f70ccf Jorge Lopez 2023-06-08  577   * @attr_type: Custom HP attribute not reported by BIOS
f0e157e6f70ccf Jorge Lopez 2023-06-08  578   *
f0e157e6f70ccf Jorge Lopez 2023-06-08  579   * Initialize all 2 types of attributes: Platform and Sure Start
f0e157e6f70ccf Jorge Lopez 2023-06-08  580   * object.  Populates each attribute types respective properties
f0e157e6f70ccf Jorge Lopez 2023-06-08  581   * under sysfs files.
f0e157e6f70ccf Jorge Lopez 2023-06-08  582   *
f0e157e6f70ccf Jorge Lopez 2023-06-08  583   * Returns zero(0) if successful. Otherwise, a negative value.
f0e157e6f70ccf Jorge Lopez 2023-06-08  584   */
f0e157e6f70ccf Jorge Lopez 2023-06-08  585  static int hp_add_other_attributes(int attr_type)
f0e157e6f70ccf Jorge Lopez 2023-06-08  586  {
f0e157e6f70ccf Jorge Lopez 2023-06-08  587  	struct kobject *attr_name_kobj;
f0e157e6f70ccf Jorge Lopez 2023-06-08  588  	union acpi_object *obj = NULL;
f0e157e6f70ccf Jorge Lopez 2023-06-08  589  	int ret;
f0e157e6f70ccf Jorge Lopez 2023-06-08  590  	char *attr_name;
f0e157e6f70ccf Jorge Lopez 2023-06-08  591  
f0e157e6f70ccf Jorge Lopez 2023-06-08  592  	mutex_lock(&bioscfg_drv.mutex);
f0e157e6f70ccf Jorge Lopez 2023-06-08  593  
f0e157e6f70ccf Jorge Lopez 2023-06-08  594  	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
f0e157e6f70ccf Jorge Lopez 2023-06-08  595  	if (!attr_name_kobj) {
f0e157e6f70ccf Jorge Lopez 2023-06-08  596  		ret = -ENOMEM;
f0e157e6f70ccf Jorge Lopez 2023-06-08  597  		goto err_other_attr_init;
f0e157e6f70ccf Jorge Lopez 2023-06-08  598  	}
f0e157e6f70ccf Jorge Lopez 2023-06-08  599  
f0e157e6f70ccf Jorge Lopez 2023-06-08  600  	/* Check if attribute type is supported */
f0e157e6f70ccf Jorge Lopez 2023-06-08  601  	switch (attr_type) {
f0e157e6f70ccf Jorge Lopez 2023-06-08  602  	case HPWMI_SECURE_PLATFORM_TYPE:
f0e157e6f70ccf Jorge Lopez 2023-06-08  603  		attr_name_kobj->kset = bioscfg_drv.authentication_dir_kset;
f0e157e6f70ccf Jorge Lopez 2023-06-08  604  		attr_name = SPM_STR;
f0e157e6f70ccf Jorge Lopez 2023-06-08  605  		break;
f0e157e6f70ccf Jorge Lopez 2023-06-08  606  
f0e157e6f70ccf Jorge Lopez 2023-06-08  607  	case HPWMI_SURE_START_TYPE:
f0e157e6f70ccf Jorge Lopez 2023-06-08  608  		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
f0e157e6f70ccf Jorge Lopez 2023-06-08  609  		attr_name = SURE_START_STR;
f0e157e6f70ccf Jorge Lopez 2023-06-08  610  		break;
f0e157e6f70ccf Jorge Lopez 2023-06-08  611  
f0e157e6f70ccf Jorge Lopez 2023-06-08  612  	default:
f0e157e6f70ccf Jorge Lopez 2023-06-08  613  		pr_err("Error: Unknown attr_type: %d\n", attr_type);
f0e157e6f70ccf Jorge Lopez 2023-06-08  614  		ret = -EINVAL;
f0e157e6f70ccf Jorge Lopez 2023-06-08  615  		goto err_other_attr_init;
f0e157e6f70ccf Jorge Lopez 2023-06-08  616  	}
f0e157e6f70ccf Jorge Lopez 2023-06-08  617  
f0e157e6f70ccf Jorge Lopez 2023-06-08  618  	ret = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
f0e157e6f70ccf Jorge Lopez 2023-06-08  619  				   NULL, "%s", attr_name);
f0e157e6f70ccf Jorge Lopez 2023-06-08  620  	if (ret) {
f0e157e6f70ccf Jorge Lopez 2023-06-08  621  		pr_err("Error encountered [%d]\n", ret);
f0e157e6f70ccf Jorge Lopez 2023-06-08  622  		kobject_put(attr_name_kobj);
f0e157e6f70ccf Jorge Lopez 2023-06-08  623  		goto err_other_attr_init;
f0e157e6f70ccf Jorge Lopez 2023-06-08  624  	}
f0e157e6f70ccf Jorge Lopez 2023-06-08  625  
f0e157e6f70ccf Jorge Lopez 2023-06-08  626  	/* Populate attribute data */
f0e157e6f70ccf Jorge Lopez 2023-06-08  627  	switch (attr_type) {
f0e157e6f70ccf Jorge Lopez 2023-06-08  628  	case HPWMI_SECURE_PLATFORM_TYPE:
f0e157e6f70ccf Jorge Lopez 2023-06-08  629  		ret = hp_populate_secure_platform_data(attr_name_kobj);
f0e157e6f70ccf Jorge Lopez 2023-06-08  630  		break;
f0e157e6f70ccf Jorge Lopez 2023-06-08  631  
f0e157e6f70ccf Jorge Lopez 2023-06-08  632  	case HPWMI_SURE_START_TYPE:
f0e157e6f70ccf Jorge Lopez 2023-06-08  633  		ret = hp_populate_sure_start_data(attr_name_kobj);
f0e157e6f70ccf Jorge Lopez 2023-06-08  634  		break;
f0e157e6f70ccf Jorge Lopez 2023-06-08  635  
f0e157e6f70ccf Jorge Lopez 2023-06-08  636  	default:
f0e157e6f70ccf Jorge Lopez 2023-06-08 @637  		goto err_other_attr_init;
f0e157e6f70ccf Jorge Lopez 2023-06-08  638  	}
f0e157e6f70ccf Jorge Lopez 2023-06-08  639  
f0e157e6f70ccf Jorge Lopez 2023-06-08  640  	mutex_unlock(&bioscfg_drv.mutex);
f0e157e6f70ccf Jorge Lopez 2023-06-08  641  	return 0;
f0e157e6f70ccf Jorge Lopez 2023-06-08  642  
f0e157e6f70ccf Jorge Lopez 2023-06-08  643  err_other_attr_init:
f0e157e6f70ccf Jorge Lopez 2023-06-08  644  	mutex_unlock(&bioscfg_drv.mutex);
f0e157e6f70ccf Jorge Lopez 2023-06-08  645  	kfree(obj);
f0e157e6f70ccf Jorge Lopez 2023-06-08 @646  	return ret;
f0e157e6f70ccf Jorge Lopez 2023-06-08  647  }
f0e157e6f70ccf Jorge Lopez 2023-06-08  648  

:::::: The code at line 637 was first introduced by commit
:::::: f0e157e6f70ccfc4857b76cc3cbe58a61fcfc759 platform/x86: hp-bioscfg: bioscfg

:::::: TO: Jorge Lopez <jorge.lopez2@hp.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
