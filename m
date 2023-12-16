Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5244934540
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFS8T8rE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702758110; x=1734294110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kYDLqP7vY9PC6bUxY5FZ0jld3L+/oj+jeB/XVk0LhE=;
  b=JFS8T8rEgfUXEKLY3Tyfg/OLKWZux/fQbstsvLIFscfsCPE0BUTzDnye
   WCm/jm4fFSN2ilwg2r9hJZ9ty02q4uVENKC6AoDubO+EZKfyWPJENU74+
   fjO2hnVEVPw8o81DjwYuQVUsaCiYgpNL5nYtAYmNNoYCNLK5nrzpzXnLj
   fTLPldcLzm+4cCVcFZ4g4nq/MynQpWtT/juPGxMNc44YBQZg9x8o7aP3F
   N5kfpRGRriMdW88gT5Drkji84bDEhcgWmQTK3fjAR62sG3xcZVEg6Hjmk
   wGABtdma+QyCpluhX4ts1ZoJXx57IUz/H/fTVJOXRBJaXnADgExvpfKen
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="375540620"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="375540620"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 12:21:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="16696116"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Dec 2023 12:21:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEbAP-0002B6-18;
	Sat, 16 Dec 2023 20:21:45 +0000
Date: Sun, 17 Dec 2023 04:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6418/8213] drivers/hwmon/pmbus/ltc4286.c:88
 ltc4286_probe() warn: passing zero to 'dev_err_probe'
Message-ID: <202312170449.GymH8cUN-lkp@intel.com>
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
TO: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: 263835c7e3879a2bfa33fe86711349b30af0b0cd [6418/8213] hwmon: (pmbus) Add ltc4286 driver
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r081-20231216 (https://download.01.org/0day-ci/archive/20231217/202312170449.GymH8cUN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312170449.GymH8cUN-lkp@intel.com/

smatch warnings:
drivers/hwmon/pmbus/ltc4286.c:88 ltc4286_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +88 drivers/hwmon/pmbus/ltc4286.c

263835c7e3879a Delphine CC Chiu 2023-11-23   66  
263835c7e3879a Delphine CC Chiu 2023-11-23   67  static int ltc4286_probe(struct i2c_client *client)
263835c7e3879a Delphine CC Chiu 2023-11-23   68  {
263835c7e3879a Delphine CC Chiu 2023-11-23   69  	int ret;
263835c7e3879a Delphine CC Chiu 2023-11-23   70  	const struct i2c_device_id *mid;
263835c7e3879a Delphine CC Chiu 2023-11-23   71  	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
263835c7e3879a Delphine CC Chiu 2023-11-23   72  	struct pmbus_driver_info *info;
263835c7e3879a Delphine CC Chiu 2023-11-23   73  	u32 rsense;
263835c7e3879a Delphine CC Chiu 2023-11-23   74  	int vrange_nval, vrange_oval;
263835c7e3879a Delphine CC Chiu 2023-11-23   75  
263835c7e3879a Delphine CC Chiu 2023-11-23   76  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
263835c7e3879a Delphine CC Chiu 2023-11-23   77  	if (ret < 0) {
263835c7e3879a Delphine CC Chiu 2023-11-23   78  		return dev_err_probe(&client->dev, ret,
263835c7e3879a Delphine CC Chiu 2023-11-23   79  				     "Failed to read manufacturer id\n");
263835c7e3879a Delphine CC Chiu 2023-11-23   80  	}
263835c7e3879a Delphine CC Chiu 2023-11-23   81  
263835c7e3879a Delphine CC Chiu 2023-11-23   82  	/*
263835c7e3879a Delphine CC Chiu 2023-11-23   83  	 * Refer to ltc4286 datasheet page 20
263835c7e3879a Delphine CC Chiu 2023-11-23   84  	 * the manufacturer id is LTC
263835c7e3879a Delphine CC Chiu 2023-11-23   85  	 */
263835c7e3879a Delphine CC Chiu 2023-11-23   86  	if (ret != LTC4286_MFR_ID_SIZE ||
263835c7e3879a Delphine CC Chiu 2023-11-23   87  	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
263835c7e3879a Delphine CC Chiu 2023-11-23  @88  		return dev_err_probe(&client->dev, ret,
263835c7e3879a Delphine CC Chiu 2023-11-23   89  				     "Manufacturer id mismatch\n");
263835c7e3879a Delphine CC Chiu 2023-11-23   90  	}
263835c7e3879a Delphine CC Chiu 2023-11-23   91  
263835c7e3879a Delphine CC Chiu 2023-11-23   92  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
263835c7e3879a Delphine CC Chiu 2023-11-23   93  	if (ret < 0) {
263835c7e3879a Delphine CC Chiu 2023-11-23   94  		return dev_err_probe(&client->dev, ret,
263835c7e3879a Delphine CC Chiu 2023-11-23   95  				     "Failed to read manufacturer model\n");
263835c7e3879a Delphine CC Chiu 2023-11-23   96  	}
263835c7e3879a Delphine CC Chiu 2023-11-23   97  
263835c7e3879a Delphine CC Chiu 2023-11-23   98  	for (mid = ltc4286_id; mid->name[0]; mid++) {
263835c7e3879a Delphine CC Chiu 2023-11-23   99  		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
263835c7e3879a Delphine CC Chiu 2023-11-23  100  			break;
263835c7e3879a Delphine CC Chiu 2023-11-23  101  	}
263835c7e3879a Delphine CC Chiu 2023-11-23  102  	if (!mid->name[0])
263835c7e3879a Delphine CC Chiu 2023-11-23  103  		return dev_err_probe(&client->dev, -ENODEV,
263835c7e3879a Delphine CC Chiu 2023-11-23  104  				     "Unsupported device\n");
263835c7e3879a Delphine CC Chiu 2023-11-23  105  
263835c7e3879a Delphine CC Chiu 2023-11-23  106  	if (of_property_read_u32(client->dev.of_node,
263835c7e3879a Delphine CC Chiu 2023-11-23  107  				 "shunt-resistor-micro-ohms", &rsense))
263835c7e3879a Delphine CC Chiu 2023-11-23  108  		rsense = 300; /* 0.3 mOhm if not set via DT */
263835c7e3879a Delphine CC Chiu 2023-11-23  109  
263835c7e3879a Delphine CC Chiu 2023-11-23  110  	if (rsense == 0)
263835c7e3879a Delphine CC Chiu 2023-11-23  111  		return -EINVAL;
263835c7e3879a Delphine CC Chiu 2023-11-23  112  
263835c7e3879a Delphine CC Chiu 2023-11-23  113  	/* Check for the latter MBR value won't overflow */
263835c7e3879a Delphine CC Chiu 2023-11-23  114  	if (rsense > (INT_MAX / 1024))
263835c7e3879a Delphine CC Chiu 2023-11-23  115  		return -EINVAL;
263835c7e3879a Delphine CC Chiu 2023-11-23  116  
263835c7e3879a Delphine CC Chiu 2023-11-23  117  	info = devm_kmemdup(&client->dev, &ltc4286_info, sizeof(*info),
263835c7e3879a Delphine CC Chiu 2023-11-23  118  			    GFP_KERNEL);
263835c7e3879a Delphine CC Chiu 2023-11-23  119  	if (!info)
263835c7e3879a Delphine CC Chiu 2023-11-23  120  		return -ENOMEM;
263835c7e3879a Delphine CC Chiu 2023-11-23  121  
263835c7e3879a Delphine CC Chiu 2023-11-23  122  	/* Check MFR1 CONFIG register bit 1 VRANGE_SELECT before driver loading */
263835c7e3879a Delphine CC Chiu 2023-11-23  123  	vrange_oval = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
263835c7e3879a Delphine CC Chiu 2023-11-23  124  	if (vrange_oval < 0)
263835c7e3879a Delphine CC Chiu 2023-11-23  125  		return dev_err_probe(&client->dev, vrange_oval,
263835c7e3879a Delphine CC Chiu 2023-11-23  126  				     "Failed to read manufacturer configuration one\n");
263835c7e3879a Delphine CC Chiu 2023-11-23  127  	vrange_nval = vrange_oval;
263835c7e3879a Delphine CC Chiu 2023-11-23  128  
263835c7e3879a Delphine CC Chiu 2023-11-23  129  	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
263835c7e3879a Delphine CC Chiu 2023-11-23  130  		vrange_nval &=
263835c7e3879a Delphine CC Chiu 2023-11-23  131  			~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6 volts */
263835c7e3879a Delphine CC Chiu 2023-11-23  132  
263835c7e3879a Delphine CC Chiu 2023-11-23  133  		info->m[PSC_VOLTAGE_IN] = 128;
263835c7e3879a Delphine CC Chiu 2023-11-23  134  		info->m[PSC_VOLTAGE_OUT] = 128;
263835c7e3879a Delphine CC Chiu 2023-11-23  135  		info->m[PSC_POWER] = 4 * rsense;
263835c7e3879a Delphine CC Chiu 2023-11-23  136  	} else {
263835c7e3879a Delphine CC Chiu 2023-11-23  137  		vrange_nval |=
263835c7e3879a Delphine CC Chiu 2023-11-23  138  			VRANGE_SELECT_BIT; /* VRANGE_SELECT = 1, 102.4 volts */
263835c7e3879a Delphine CC Chiu 2023-11-23  139  
263835c7e3879a Delphine CC Chiu 2023-11-23  140  		info->m[PSC_POWER] = rsense;
263835c7e3879a Delphine CC Chiu 2023-11-23  141  	}
263835c7e3879a Delphine CC Chiu 2023-11-23  142  	if (vrange_nval != vrange_oval) {
263835c7e3879a Delphine CC Chiu 2023-11-23  143  		/* Set MFR1 CONFIG register bit 1 VRANGE_SELECT */
263835c7e3879a Delphine CC Chiu 2023-11-23  144  		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1,
263835c7e3879a Delphine CC Chiu 2023-11-23  145  						vrange_nval);
263835c7e3879a Delphine CC Chiu 2023-11-23  146  		if (ret < 0)
263835c7e3879a Delphine CC Chiu 2023-11-23  147  			return dev_err_probe(&client->dev, ret,
263835c7e3879a Delphine CC Chiu 2023-11-23  148  					     "Failed to set vrange\n");
263835c7e3879a Delphine CC Chiu 2023-11-23  149  	}
263835c7e3879a Delphine CC Chiu 2023-11-23  150  
263835c7e3879a Delphine CC Chiu 2023-11-23  151  	info->m[PSC_CURRENT_OUT] = 1024 * rsense;
263835c7e3879a Delphine CC Chiu 2023-11-23  152  
263835c7e3879a Delphine CC Chiu 2023-11-23  153  	return pmbus_do_probe(client, info);
263835c7e3879a Delphine CC Chiu 2023-11-23  154  }
263835c7e3879a Delphine CC Chiu 2023-11-23  155  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
