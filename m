Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD5CA43
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Aug 2023 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692044736; x=1723580736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJdLchla09UZuaw6nvK8aguS2YpMxfNp2egHQ3sIsTo=;
  b=b8dFg5VHPY56CX4aOKIZrm/1eGgDSkvnRiMy118X4lDJpiPUNDGOLNmo
   YASlmjjjvcZHLAcD5/fsdQF8Z3exwbUMG+Mg0yaYX1PdtafuGfe7Czlwb
   jQLbHC3nplISwmoDTV5iVidfeiSQfVvNsy/Dvn7ENqlwFB9BkdsAHJabO
   JXFzr076me/1f4s/4Xsx2hfO2LK7M+EceMrvNA3T6dex9JuG4/u2m7x/r
   hPvSbLTY9Ci0h/sW5Waw5ibYcMJ/ta8DMrhwkAzqtpAKJvRXgTxV0wYlt
   ikwsu74rqL6w9rd1FXWTmv+rBIQz7JsURr5iu4ZMvk7scAwNF6awFNo9L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372126646"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="372126646"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 13:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803572833"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="803572833"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 13:25:34 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVe85-0000Ox-22;
	Mon, 14 Aug 2023 20:25:33 +0000
Date: Tue, 15 Aug 2023 04:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [shenki:dev-6.5 83/93] drivers/misc/eeprom/ee1004.c:248:28-31:
 ERROR: invalid reference to the index variable of the iterator on line 226
Message-ID: <202308150423.PiE5zEzq-lkp@intel.com>
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
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux dev-6.5
head:   e874a83263bd783e23411cf6ab12622ac36362f5
commit: e4e6aea1476868d60ff6396c92ac34a11f102326 [83/93] eeprom: ee1004: Enable devices on multiple busses
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-r051-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150423.PiE5zEzq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150423.PiE5zEzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308150423.PiE5zEzq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/misc/eeprom/ee1004.c:248:28-31: ERROR: invalid reference to the index variable of the iterator on line 226

vim +248 drivers/misc/eeprom/ee1004.c

5fe3cba0bf5c2c Heiner Kallweit 2021-05-24  211  
2ac99039c56846 Heiner Kallweit 2021-05-24  212  static int ee1004_probe(struct i2c_client *client)
3b7584a296c4fa Jean Delvare    2018-10-07  213  {
e4e6aea1476868 Eddie James     2023-03-22  214  	struct ee1004_bus *bus;
e4e6aea1476868 Eddie James     2023-03-22  215  	bool found = false;
e4e6aea1476868 Eddie James     2023-03-22  216  	int rc = 0;
3b7584a296c4fa Jean Delvare    2018-10-07  217  
3b7584a296c4fa Jean Delvare    2018-10-07  218  	/* Make sure we can operate on this adapter */
3b7584a296c4fa Jean Delvare    2018-10-07  219  	if (!i2c_check_functionality(client->adapter,
08e5138aa41935 Heiner Kallweit 2021-05-24  220  				     I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_READ_I2C_BLOCK) &&
08e5138aa41935 Heiner Kallweit 2021-05-24  221  	    !i2c_check_functionality(client->adapter,
08e5138aa41935 Heiner Kallweit 2021-05-24  222  				     I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_READ_BYTE_DATA))
3b7584a296c4fa Jean Delvare    2018-10-07  223  		return -EPFNOSUPPORT;
3b7584a296c4fa Jean Delvare    2018-10-07  224  
e4e6aea1476868 Eddie James     2023-03-22  225  	mutex_lock(&ee1004_busses_lock);
e4e6aea1476868 Eddie James     2023-03-22 @226  	list_for_each_entry(bus, &ee1004_busses, list) {
e4e6aea1476868 Eddie James     2023-03-22  227  		if (bus->adapter == client->adapter) {
e4e6aea1476868 Eddie James     2023-03-22  228  			kref_get(&bus->kref);
e4e6aea1476868 Eddie James     2023-03-22  229  			found = true;
e4e6aea1476868 Eddie James     2023-03-22  230  			break;
e4e6aea1476868 Eddie James     2023-03-22  231  		}
3b7584a296c4fa Jean Delvare    2018-10-07  232  	}
e4e6aea1476868 Eddie James     2023-03-22  233  
e4e6aea1476868 Eddie James     2023-03-22  234  	if (!found) {
e4e6aea1476868 Eddie James     2023-03-22  235  		bus = kzalloc(sizeof(*bus), GFP_KERNEL);
e4e6aea1476868 Eddie James     2023-03-22  236  		if (!bus) {
e4e6aea1476868 Eddie James     2023-03-22  237  			rc = -ENOMEM;
e4e6aea1476868 Eddie James     2023-03-22  238  			goto unlock;
3b7584a296c4fa Jean Delvare    2018-10-07  239  		}
3b7584a296c4fa Jean Delvare    2018-10-07  240  
e4e6aea1476868 Eddie James     2023-03-22  241  		rc = ee1004_bus_initialize(bus, client->adapter);
e4e6aea1476868 Eddie James     2023-03-22  242  		if (rc) {
e4e6aea1476868 Eddie James     2023-03-22  243  			kfree(bus);
e4e6aea1476868 Eddie James     2023-03-22  244  			goto unlock;
e4e6aea1476868 Eddie James     2023-03-22  245  		}
b2cd8a2f8eb148 Heiner Kallweit 2021-05-24  246  	}
e4e6aea1476868 Eddie James     2023-03-22  247  
e4e6aea1476868 Eddie James     2023-03-22 @248  	i2c_set_clientdata(client, bus);
3b7584a296c4fa Jean Delvare    2018-10-07  249  
3b7584a296c4fa Jean Delvare    2018-10-07  250  	dev_info(&client->dev,
3b7584a296c4fa Jean Delvare    2018-10-07  251  		 "%u byte EE1004-compliant SPD EEPROM, read-only\n",
3b7584a296c4fa Jean Delvare    2018-10-07  252  		 EE1004_EEPROM_SIZE);
3b7584a296c4fa Jean Delvare    2018-10-07  253  
e4e6aea1476868 Eddie James     2023-03-22  254  unlock:
e4e6aea1476868 Eddie James     2023-03-22  255  	mutex_unlock(&ee1004_busses_lock);
e4e6aea1476868 Eddie James     2023-03-22  256  	return rc;
3b7584a296c4fa Jean Delvare    2018-10-07  257  }
3b7584a296c4fa Jean Delvare    2018-10-07  258  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
