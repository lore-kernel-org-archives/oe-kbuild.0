Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4DA12E76
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Nov 2023 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWHwm0yV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700403936; x=1731939936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJt0nxdwnYHkSpbVO4fgAycgHhDgvqTx9zhdqC4ExMY=;
  b=dWHwm0yVUKgXUbQJKpl7z8PLxBqaclf4bOI8f5ZSOOrp0CSSsWSzliLi
   9PJsLpQw5ZFhe27hpefH15gOTDAtRt+gOe+1uICCr1yfFvu9iZlUi3yrR
   cOLGooPf+s41BDavUTY2zEy2HzRPxs23gS7xB1sCsRckvWcvL2X6bMOZw
   VXioxQy/AYgGTRgf4x74wCFQF59ok7qjqcxbZo+5hFkUneI7MHK1Mu2w9
   mkOrAiGp6VKITPmewItBTp3ArBgvbKe/6IYWOecn8YAXm7lnVW8p4FW/Q
   mUgIUVXfjgvOvIf6OeoLW8nBDNFVPUCxo6dwfdgzqbpDffoUHAmfWE1PM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381884991"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="381884991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 06:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="7462178"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2023 06:25:34 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4ijr-0005Br-2u;
	Sun, 19 Nov 2023 14:25:31 +0000
Date: Sun, 19 Nov 2023 22:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC] eeprom: ee1004: add support for temperature sensor
Message-ID: <202311192239.S2bnUkLI-lkp@intel.com>
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
In-Reply-To: <c295881f-77aa-4f54-b06c-d48031d76339@gmail.com>
References: <c295881f-77aa-4f54-b06c-d48031d76339@gmail.com>
TO: Heiner Kallweit <hkallweit1@gmail.com>

Hi Heiner,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/eeprom-ee1004-add-support-for-temperature-sensor/20231115-191927
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/c295881f-77aa-4f54-b06c-d48031d76339%40gmail.com
patch subject: [PATCH RFC] eeprom: ee1004: add support for temperature sensor
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20231119 (https://download.01.org/0day-ci/archive/20231119/202311192239.S2bnUkLI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311192239.S2bnUkLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311192239.S2bnUkLI-lkp@intel.com/

smatch warnings:
drivers/misc/eeprom/ee1004.c:169 ee1004_probe_temp_sensor() error: uninitialized symbol 'byte14'.

vim +/byte14 +169 drivers/misc/eeprom/ee1004.c

b63866efa10ca5 Heiner Kallweit 2021-05-19  160  
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  161  static void ee1004_probe_temp_sensor(struct i2c_client *client)
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  162  {
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  163  	struct i2c_board_info info = { .type = "jc42" };
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  164  	u8 byte14;
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  165  	int ret;
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  166  
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  167  	/* byte 14, bit 7 is set if temp sensor is present */
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  168  	ret = ee1004_eeprom_read(client, &byte14, 14, 1);
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15 @169  	if (ret != 1 || !(byte14 & BIT(7)))
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  170  		return;
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  171  
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  172  	info.addr = 0x18 | (client->addr & 7);
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  173  
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  174  	i2c_new_client_device(client->adapter, &info);
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  175  }
4d88fe3c4e7dcf Heiner Kallweit 2023-11-15  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
