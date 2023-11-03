Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E461C04
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 06:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cac0yxwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698994784; x=1730530784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q/EGcrR2lvIqDA4dFXZgHLsYPdAi7CByN2bhUyYsEK4=;
  b=Cac0yxwy3/DPi29wVgyb/h6fGgzkfqKJY1cK7DUvRJ3KjIZjUfMLvzg7
   fbUyZAhkhWDeR6JKfQXJy+ycsaqjxqnSdmyRm0Jjg4pgJ3huVm8+prkYU
   sYSelNjp0edPBMIINBIuj46aeYM2H8Hm3c0uPxBkxNZ6RAUFftSxGnxQM
   ouzdCrdCJhKnlYybwscQqz/nrQTpEv+cfIl0bMJiBftP0Hc+WpAUfaDsa
   U1ny5bXmC+mnyA+UEQcf2pORPv2D2hWn/zkSpiokAdES+aslGOaR0Sh5p
   jg78NXlUZ5bc3poWwX1R8QtSfeVTiT8qVtyguvB8Kfw0s/yPStNCXEiSs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1769098"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1769098"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 23:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="885137824"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="885137824"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Nov 2023 23:59:35 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyo9S-0002Jk-1c;
	Fri, 03 Nov 2023 06:59:30 +0000
Date: Fri, 3 Nov 2023 14:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hwmon/sht3x.c:603 update_interval_write() error:
 uninitialized symbol 'ret'.
Message-ID: <202311031431.i2Jt8XWp-lkp@intel.com>
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
TO: JuenKit Yip <JuenKit_Yip@hotmail.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc3012f4e3a9765de81f454cb8f9bb16aafc6ff5
commit: a0ac418c6007c9e1694e21056964c923364f3175 hwmon: (sht3x) convert some of sysfs interface to hwmon
date:   2 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-141-20231102 (https://download.01.org/0day-ci/archive/20231103/202311031431.i2Jt8XWp-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311031431.i2Jt8XWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311031431.i2Jt8XWp-lkp@intel.com/

smatch warnings:
drivers/hwmon/sht3x.c:603 update_interval_write() error: uninitialized symbol 'ret'.

vim +/ret +603 drivers/hwmon/sht3x.c

7c84f7f80d6fce David Frey  2016-06-02  549  
a0ac418c6007c9 JuenKit Yip 2023-07-03  550  static int update_interval_write(struct device *dev, int val)
7c84f7f80d6fce David Frey  2016-06-02  551  {
7c84f7f80d6fce David Frey  2016-06-02  552  	u8 mode;
7c84f7f80d6fce David Frey  2016-06-02  553  	int ret;
7c84f7f80d6fce David Frey  2016-06-02  554  	const char *command;
7c84f7f80d6fce David Frey  2016-06-02  555  	struct sht3x_data *data = dev_get_drvdata(dev);
7c84f7f80d6fce David Frey  2016-06-02  556  	struct i2c_client *client = data->client;
7c84f7f80d6fce David Frey  2016-06-02  557  
a0ac418c6007c9 JuenKit Yip 2023-07-03  558  	mode = get_mode_from_update_interval(val);
7c84f7f80d6fce David Frey  2016-06-02  559  
7c84f7f80d6fce David Frey  2016-06-02  560  	mutex_lock(&data->data_lock);
7c84f7f80d6fce David Frey  2016-06-02  561  	/* mode did not change */
7c84f7f80d6fce David Frey  2016-06-02  562  	if (mode == data->mode) {
7c84f7f80d6fce David Frey  2016-06-02  563  		mutex_unlock(&data->data_lock);
a0ac418c6007c9 JuenKit Yip 2023-07-03  564  		return 0;
7c84f7f80d6fce David Frey  2016-06-02  565  	}
7c84f7f80d6fce David Frey  2016-06-02  566  
7c84f7f80d6fce David Frey  2016-06-02  567  	mutex_lock(&data->i2c_lock);
7c84f7f80d6fce David Frey  2016-06-02  568  	/*
7c84f7f80d6fce David Frey  2016-06-02  569  	 * Abort periodic measure mode.
7c84f7f80d6fce David Frey  2016-06-02  570  	 * To do any changes to the configuration while in periodic mode, we
7c84f7f80d6fce David Frey  2016-06-02  571  	 * have to send a break command to the sensor, which then falls back
7c84f7f80d6fce David Frey  2016-06-02  572  	 * to single shot (mode = 0).
7c84f7f80d6fce David Frey  2016-06-02  573  	 */
7c84f7f80d6fce David Frey  2016-06-02  574  	if (data->mode > 0) {
7c84f7f80d6fce David Frey  2016-06-02  575  		ret = i2c_master_send(client, sht3x_cmd_break,
7c84f7f80d6fce David Frey  2016-06-02  576  				      SHT3X_CMD_LENGTH);
7c84f7f80d6fce David Frey  2016-06-02  577  		if (ret != SHT3X_CMD_LENGTH)
7c84f7f80d6fce David Frey  2016-06-02  578  			goto out;
7c84f7f80d6fce David Frey  2016-06-02  579  		data->mode = 0;
7c84f7f80d6fce David Frey  2016-06-02  580  	}
7c84f7f80d6fce David Frey  2016-06-02  581  
7c84f7f80d6fce David Frey  2016-06-02  582  	if (mode > 0) {
7d6d53ba3bccc5 JuenKit Yip 2023-06-17  583  		if (data->repeatability == high_repeatability)
7c84f7f80d6fce David Frey  2016-06-02  584  			command = periodic_measure_commands_hpm[mode - 1];
3d2c211c0d2b59 JuenKit Yip 2023-06-17  585  		else if (data->repeatability == medium_repeatability)
3d2c211c0d2b59 JuenKit Yip 2023-06-17  586  			command = periodic_measure_commands_mpm[mode - 1];
7c84f7f80d6fce David Frey  2016-06-02  587  		else
7c84f7f80d6fce David Frey  2016-06-02  588  			command = periodic_measure_commands_lpm[mode - 1];
7c84f7f80d6fce David Frey  2016-06-02  589  
7c84f7f80d6fce David Frey  2016-06-02  590  		/* select mode */
7c84f7f80d6fce David Frey  2016-06-02  591  		ret = i2c_master_send(client, command, SHT3X_CMD_LENGTH);
7c84f7f80d6fce David Frey  2016-06-02  592  		if (ret != SHT3X_CMD_LENGTH)
7c84f7f80d6fce David Frey  2016-06-02  593  			goto out;
7c84f7f80d6fce David Frey  2016-06-02  594  	}
7c84f7f80d6fce David Frey  2016-06-02  595  
7c84f7f80d6fce David Frey  2016-06-02  596  	/* select mode and command */
7c84f7f80d6fce David Frey  2016-06-02  597  	data->mode = mode;
7c84f7f80d6fce David Frey  2016-06-02  598  	sht3x_select_command(data);
7c84f7f80d6fce David Frey  2016-06-02  599  
7c84f7f80d6fce David Frey  2016-06-02  600  out:
7c84f7f80d6fce David Frey  2016-06-02  601  	mutex_unlock(&data->i2c_lock);
7c84f7f80d6fce David Frey  2016-06-02  602  	mutex_unlock(&data->data_lock);
7c84f7f80d6fce David Frey  2016-06-02 @603  	if (ret != SHT3X_CMD_LENGTH)
7c84f7f80d6fce David Frey  2016-06-02  604  		return ret < 0 ? ret : -EIO;
7c84f7f80d6fce David Frey  2016-06-02  605  
a0ac418c6007c9 JuenKit Yip 2023-07-03  606  	return 0;
7c84f7f80d6fce David Frey  2016-06-02  607  }
7c84f7f80d6fce David Frey  2016-06-02  608  

:::::: The code at line 603 was first introduced by commit
:::::: 7c84f7f80d6fcea36246b793d06c3555ca53ddcd hwmon: add support for Sensirion SHT3x sensors

:::::: TO: David Frey <david.frey@sensirion.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
