Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB512F2C
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Apr 2023 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681289466; x=1712825466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0zi3QHo5MgtXjZOG2DL3FCtmQS0PNovEXBSNkwCg0A=;
  b=itGWDLL12NAALxiPAVXWq31IH/foe0qdp1ocfP8v0QngdT2VTPDBbvAm
   KbLUa/g2kEy4NfNVM08QLI9RDN75LkW+Ymi+ODAsFVhjeb3e0rFOy8aNB
   vJ+xGxfIYV44ukOpRdaWGGx3MR0JmwM7j3+fM95CxBU5YasM1JFoNxWGF
   KASNRpYrSHypikG/w30/oKVOTTn4Qz7YYu6xz6xp674r+nXW4oox22kPm
   Mfs8G4q8+jA975Y3vn51Ld8YfE8Vhm1gtFkHIelBgwCI7AhCe3Li1EOlR
   Zb26KqwCNTB/0eCHJFcmwy8H/dNVs1WvckBQDDm+OH3OVkwwinCvxOkWU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343844509"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="343844509"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 01:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="691478199"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="691478199"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Apr 2023 01:51:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmWBy-000XXh-3D;
	Wed, 12 Apr 2023 08:51:02 +0000
Date: Wed, 12 Apr 2023 16:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9067/10976]
 drivers/crypto/intel/qat/qat_common/adf_cfg.c:262
 adf_cfg_add_key_value_param() warn: argument 4 to %lx specifier is cast from
 pointer
Message-ID: <202304121609.mbj9HzBo-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tom Zanussi <tom.zanussi@linux.intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
commit: a4b16dad46576ce08ecb660fc923d0857dcae107 [9067/10976] crypto: qat - Move driver to drivers/crypto/intel/qat
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
config: ia64-randconfig-m031-20230410 (https://download.01.org/0day-ci/archive/20230412/202304121609.mbj9HzBo-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304121609.mbj9HzBo-lkp@intel.com/

smatch warnings:
drivers/crypto/intel/qat/qat_common/adf_cfg.c:262 adf_cfg_add_key_value_param() warn: argument 4 to %lx specifier is cast from pointer

vim +262 drivers/crypto/intel/qat/qat_common/adf_cfg.c

d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  219  
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  220  /**
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  221   * adf_cfg_add_key_value_param() - Add key-value config entry to config table.
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  222   * @accel_dev:  Pointer to acceleration device.
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  223   * @section_name: Name of the section where the param will be added
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  224   * @key: The key string
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  225   * @val: Value pain for the given @key
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  226   * @type: Type - string, int or address
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  227   *
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  228   * Function adds configuration key - value entry in the appropriate section
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  229   * in the given acceleration device. If the key exists already, the value
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  230   * is updated.
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  231   * To be used by QAT device specific drivers.
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  232   *
ec0d6fa3e8849f drivers/crypto/qat/qat_common/adf_cfg.c Ahsan Atta       2015-07-24  233   * Return: 0 on success, error code otherwise.
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  234   */
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  235  int adf_cfg_add_key_value_param(struct adf_accel_dev *accel_dev,
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  236  				const char *section_name,
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  237  				const char *key, const void *val,
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  238  				enum adf_cfg_val_type type)
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  239  {
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  240  	struct adf_cfg_device_data *cfg = accel_dev->cfg;
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  241  	struct adf_cfg_key_val *key_val;
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  242  	struct adf_cfg_section *section = adf_cfg_sec_find(accel_dev,
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  243  							   section_name);
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  244  	char temp_val[ADF_CFG_MAX_VAL_LEN_IN_BYTES];
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  245  
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  246  	if (!section)
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  247  		return -EFAULT;
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  248  
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  249  	key_val = kzalloc(sizeof(*key_val), GFP_KERNEL);
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  250  	if (!key_val)
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  251  		return -ENOMEM;
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  252  
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  253  	INIT_LIST_HEAD(&key_val->list);
28855860057ac0 drivers/crypto/qat/qat_common/adf_cfg.c Wolfram Sang     2022-08-18  254  	strscpy(key_val->key, key, sizeof(key_val->key));
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  255  
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  256  	if (type == ADF_DEC) {
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  257  		snprintf(key_val->val, ADF_CFG_MAX_VAL_LEN_IN_BYTES,
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  258  			 "%ld", (*((long *)val)));
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  259  	} else if (type == ADF_STR) {
28855860057ac0 drivers/crypto/qat/qat_common/adf_cfg.c Wolfram Sang     2022-08-18  260  		strscpy(key_val->val, (char *)val, sizeof(key_val->val));
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  261  	} else if (type == ADF_HEX) {
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05 @262  		snprintf(key_val->val, ADF_CFG_MAX_VAL_LEN_IN_BYTES,
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  263  			 "0x%lx", (unsigned long)val);
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  264  	} else {
665503049bada5 drivers/crypto/qat/qat_common/adf_cfg.c Allan, Bruce W   2015-03-19  265  		dev_err(&GET_DEV(accel_dev), "Unknown type given.\n");
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  266  		kfree(key_val);
69d0fc22cf91c9 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2020-10-12  267  		return -EINVAL;
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  268  	}
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  269  	key_val->type = type;
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  270  
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  271  	/* Add the key-value pair as below policy:
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  272  	 * 1. if the key doesn't exist, add it;
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  273  	 * 2. if the key already exists with a different value then update it
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  274  	 *    to the new value (the key is deleted and the newly created
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  275  	 *    key_val containing the new value is added to the database);
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  276  	 * 3. if the key exists with the same value, then return without doing
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  277  	 *    anything (the newly created key_val is freed).
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  278  	 */
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  279  	if (!adf_cfg_key_val_get(accel_dev, section_name, key, temp_val)) {
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  280  		if (strncmp(temp_val, key_val->val, sizeof(temp_val))) {
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  281  			adf_cfg_keyval_remove(key, section);
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  282  		} else {
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  283  			kfree(key_val);
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  284  			return 0;
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  285  		}
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  286  	}
92bf269fbfe940 drivers/crypto/qat/qat_common/adf_cfg.c Giovanni Cabiddu 2022-06-27  287  
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  288  	down_write(&cfg->lock);
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  289  	adf_cfg_keyval_add(key_val, section);
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  290  	up_write(&cfg->lock);
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  291  	return 0;
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  292  }
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  293  EXPORT_SYMBOL_GPL(adf_cfg_add_key_value_param);
d8cba25d2c6899 drivers/crypto/qat/qat_common/adf_cfg.c Tadeusz Struk    2014-06-05  294  

:::::: The code at line 262 was first introduced by commit
:::::: d8cba25d2c68992a6e7c1d329b690a9ebe01167d crypto: qat - Intel(R) QAT driver framework

:::::: TO: Tadeusz Struk <tadeusz.struk@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
