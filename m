Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A456779D9
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Jul 2023 13:19:23 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3142a9ff6d8so5076659f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 05 Jul 2023 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688563161; x=1691155161;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jQ1QZCzOqYPccUdEQio2rDBD6NWfAGUMfJT4X6RlT4=;
        b=E6rCtPwojHdNIMxoUgZKv66Bs+OYEog0GyT5T/lOP9loO1pPjzG8oMPXweCUxxVHM4
         IjjQnoT6U6HRfTU8r4sIJjEw+hHZwjQMeobpeYrY8uZHe3lc2x2goYtKB48HOReJg91m
         tgdMflNhGCCFlm7wT9Xa6uaGwU/JxoZGCVsFUIdrKrgWGUZRleyKVFjT71oWUfBTvaqR
         4XAhi87JUt60UsHCRW9Uayfh+nwPTyO/PKOccAm1bZcks/pi1i9jd75XyfNb80LvML+O
         3iq6Y+VJVBQ4voc2X3BXRn1blmsrTY+n1COLARTuCpa/VIO26Xf1q7mgLY3/mKU0uiSw
         rFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688563161; x=1691155161;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8jQ1QZCzOqYPccUdEQio2rDBD6NWfAGUMfJT4X6RlT4=;
        b=Ruw7NHOEb1gldDg32XngViGep1DjRdZU/cGXKEheJ7Y8ecTl5A+3UYa7/uYrt0HEOa
         3ZN8DTq3rtXyCi77JYLVDG9yizQ7sxxGhViyH3U1h70FuP9zgZ5kEDlFVGeTZ8d9AlvB
         g7GDiFV6j1d461OQaI3lxLpTc4AV/WNsykEF4M5Su9ToHZmIBkWrQIULuRpxMwCRniYL
         28tQ4mzPeRP5nD/p5Rx4EOKpueVAzsnIfmU0jZrmKdK3OIprV7u6lhG/CnWog4wvEdBO
         iQSuQlL7ZaLhbYUrPzsaS9bo7Kmk4NocKu8Sz5CUNBLfFPs5UYSlkPlwNOnrrZsTwOFJ
         s+3Q==
X-Gm-Message-State: ABy/qLaGMh7Y1wutHa1d6bxtVRmTtTZWDXP7nEi3FhOlsFLA0SZRosDn
	yMABo19Q92hDDPvaD6eZkxMxi4kd4HfC4/1inNA=
X-Google-Smtp-Source: APBJJlGH81r1mWbyZGmNL/M3bj/VYx8oNm4wYVvpRZdishpUEgE1rGXAW74yaGJ2SXBstrEmCF4D3A==
X-Received: by 2002:adf:e407:0:b0:314:f18:bc65 with SMTP id g7-20020adfe407000000b003140f18bc65mr14172900wrm.66.1688563160993;
        Wed, 05 Jul 2023 06:19:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c23-20020a05600c0ad700b003fa95890484sm2132562wmr.20.2023.07.05.06.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 06:19:19 -0700 (PDT)
Date: Wed, 5 Jul 2023 16:19:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jorge Lopez <jorge.lopez2@hp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: [pdx86-platform-drivers-x86:review-hans 109/110]
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c:637 hp_add_other_attributes()
 warn: missing error code 'ret'
Message-ID: <46230c3f-106f-492e-bb4a-b53306f9ff04@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   645a08fa74b9add29eed1c15824f697ab3a1e843
commit: 16f2ee70f189cba76416436763d34109f2690b9f [109/110] platform/x86: hp-bioscfg: Makefile
config: i386-randconfig-m021-20230703 (https://download.01.org/0day-ci/archive/20230705/202307052003.TLrtMhBi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307052003.TLrtMhBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307052003.TLrtMhBi-lkp@intel.com/

[
  I would normally go through these and filter out the false positives.
  My guess is that probably the majority of the "int_value" warnings are
  false positives but you have to do some cross function analysis to
  verify it.  Probably just initialize it to zero is the best approach.

  Sometimes people complain about initializing stuff to zero but I don't
  see the harm.  The compiler is already going to do that anyway so it
  shouldn't affect the compiled code.  (Only irresponsible people who
  want to be hacked turn off the GCC extension to automatically
  initialize stack variables these days).

  - dan ]

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

