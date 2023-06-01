Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33563BF
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jun 2023 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685592723; x=1717128723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WuYDux3R8S/fF4AAhuKn8KM0xWolD2jP8AK4e1D88O8=;
  b=WiXMH1i7A/nqkRcHr2LObGw5FIEEvQ/ki5/tlSEmd+RB3rXetdkj/Mgq
   iWb+f3+JTIVV+bw9o9BvCBiz7f6PveaT3ADCEzXBPDQCpKZmCe/ss6o4y
   TOxBbdEkjqA3/1pBAI77axQbvL17Ipq+JvKg+vSl1klw9wW0/Usl0bnT8
   6rcsJQgVD/5Us3aga/Nw7bvEWwSq9G9g593i4/gLVAnoigGd+YQkCFyLq
   GPlBDznGk92FoL78ffVJbOZn8oCKp+eo8BfPyzbCe9PoKnMO92WHEa/V6
   hsE2hdanV6UsLLGbOlR0DYs+KuaKw49ikjIyQAUEOerUhZSm+9TZFAD31
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418945922"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="418945922"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 21:12:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="953908015"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="953908015"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 May 2023 21:12:00 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4ZfL-0001tf-2G;
	Thu, 01 Jun 2023 04:11:59 +0000
Date: Thu, 1 Jun 2023 12:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/thinkpad_acpi.c:10538 dytc_profile_refresh()
 error: uninitialized symbol 'funcmode'.
Message-ID: <202306011202.1hbgLRD4-lkp@intel.com>
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
TO: Mark Pearson <mpearson-lenovo@squebb.ca>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Mario Limonciello <mario.limonciello@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   929ed21dfdb6ee94391db51c9eedb63314ef6847
commit: 1bc5d819f0b9784043ea08570e1b21107aa35739 platform/x86: thinkpad_acpi: Fix profile modes on Intel platforms
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-m021-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011202.1hbgLRD4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306011202.1hbgLRD4-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:10538 dytc_profile_refresh() error: uninitialized symbol 'funcmode'.

Old smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:1193 tpacpi_new_rfkill() warn: 'atp_rfk->rfkill' is an error pointer or valid
drivers/platform/x86/thinkpad_acpi.c:2606 hotkey_inputdev_close() warn: bitwise AND condition is false here
drivers/platform/x86/thinkpad_acpi.c:3776 hotkey_notify_hotkey() warn: bitwise AND condition is false here
drivers/platform/x86/thinkpad_acpi.c:10531 dytc_profile_refresh() error: uninitialized symbol 'output'.
drivers/platform/x86/thinkpad_acpi.c:10537 dytc_profile_refresh() error: uninitialized symbol 'output'.

vim +/funcmode +10538 drivers/platform/x86/thinkpad_acpi.c

c3bfcd4c676238 Mark Pearson  2021-01-11  10514  
c3bfcd4c676238 Mark Pearson  2021-01-11  10515  static void dytc_profile_refresh(void)
c3bfcd4c676238 Mark Pearson  2021-01-11  10516  {
c3bfcd4c676238 Mark Pearson  2021-01-11  10517  	enum platform_profile_option profile;
6229ce9c36384c Hans de Goede 2022-03-09  10518  	int output, err = 0;
fde5f74ccfc771 Mark Pearson  2023-01-12  10519  	int perfmode, funcmode;
c3bfcd4c676238 Mark Pearson  2021-01-11  10520  
c3bfcd4c676238 Mark Pearson  2021-01-11  10521  	mutex_lock(&dytc_mutex);
42504af775361c Mark Pearson  2022-06-03  10522  	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
7a47f86bba748b Mark Pearson  2021-04-06  10523  		if (dytc_mmc_get_available)
7a47f86bba748b Mark Pearson  2021-04-06  10524  			err = dytc_command(DYTC_CMD_MMC_GET, &output);
7a47f86bba748b Mark Pearson  2021-04-06  10525  		else
c3bfcd4c676238 Mark Pearson  2021-01-11  10526  			err = dytc_cql_command(DYTC_CMD_GET, &output);
1bc5d819f0b978 Mark Pearson  2023-01-24  10527  		funcmode = DYTC_FUNCTION_MMC;
1bc5d819f0b978 Mark Pearson  2023-01-24  10528  	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
e1c21608e3cfc4 Mark Pearson  2022-02-25  10529  		err = dytc_command(DYTC_CMD_GET, &output);
1bc5d819f0b978 Mark Pearson  2023-01-24  10530  		/* Check if we are PSC mode, or have AMT enabled */
1bc5d819f0b978 Mark Pearson  2023-01-24  10531  		funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
1bc5d819f0b978 Mark Pearson  2023-01-24  10532  	}
c3bfcd4c676238 Mark Pearson  2021-01-11  10533  	mutex_unlock(&dytc_mutex);
c3bfcd4c676238 Mark Pearson  2021-01-11  10534  	if (err)
c3bfcd4c676238 Mark Pearson  2021-01-11  10535  		return;
c3bfcd4c676238 Mark Pearson  2021-01-11  10536  
c3bfcd4c676238 Mark Pearson  2021-01-11  10537  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
fde5f74ccfc771 Mark Pearson  2023-01-12 @10538  	convert_dytc_to_profile(funcmode, perfmode, &profile);
c3bfcd4c676238 Mark Pearson  2021-01-11  10539  	if (profile != dytc_current_profile) {
c3bfcd4c676238 Mark Pearson  2021-01-11  10540  		dytc_current_profile = profile;
c3bfcd4c676238 Mark Pearson  2021-01-11  10541  		platform_profile_notify();
c3bfcd4c676238 Mark Pearson  2021-01-11  10542  	}
c3bfcd4c676238 Mark Pearson  2021-01-11  10543  }
c3bfcd4c676238 Mark Pearson  2021-01-11  10544  

:::::: The code at line 10538 was first introduced by commit
:::::: fde5f74ccfc771941b018b5415fa9664426e10ad platform/x86: thinkpad_acpi: Fix profile mode display in AMT mode

:::::: TO: Mark Pearson <mpearson-lenovo@squebb.ca>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
