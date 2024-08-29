Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF31E4D59F
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724956539; cv=none; b=dR4QIkfvryMG8aAcdhCMJJRwjzdCGW+D7HVj3QKT91KdJw+RNGvIP2eq8clHDHToz1I5nIyFTyJ9PxlUHd6P95VISPuY9v5K5dw5GmaZkK1RR4lujn4CgGan3J8T3pU/RYmouyn0R3tJPax93FfOVP//5XC5bgw99DWfhqsEUOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724956539; c=relaxed/simple;
	bh=PRcPBxVd40vchlAceDotJMLOuq2J4q87WXSaKl1vROQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcFwXoiGMYb7Z9Mv/a7B6ShzA1TXWAT9VVx3j1IebSRxCkxZ3cE4LYKqE1NfODhfNDg1chqMnYTS7w4CCco0jjjKiBmIFU1QYBvrMrEV95huNobL9Eomy/VFF42Vp4NgNeyYrO7FmYQd0qK4KKvPR+D4XEnMx2hwxJ1h8RI8MB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SesPXWfi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SesPXWfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724956537; x=1756492537;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PRcPBxVd40vchlAceDotJMLOuq2J4q87WXSaKl1vROQ=;
  b=SesPXWfik1Gj+mnV6kpYfWW+fQ52CLx3Zubh+s5ugv6AL0eEg5BhI00S
   iGffGOJ/6Dp1HQ/kQCU2Hg0ppK32RXoLZ8CH0Lh3QiPgfiKZn/M6Ue6GN
   qhAcrTcGUUFrGAvIsCRD5O8GEuzMweoeAO20kLB5WnQhvOVXPmiLYXx4H
   3m3OyYk2EHqXbOCBbztYfrSyoIq/we4X04aHqQC8790NrIWs8jfHMo4UK
   P+qgY/fzodW3UB5RYLO4T+r9af9Mq/3MXDmKNjf99UDXmF64UZpGaE8Y1
   tHiCP1M3779QhlC23d0+VaDQwk5eFiSTszFF3v6EDGuLtV+Qcocl1XQL+
   Q==;
X-CSE-ConnectionGUID: fp18eJ89Qeu2mSb94OAfpQ==
X-CSE-MsgGUID: kOwvGuJsQqKex1DVfxk8aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23741856"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="23741856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 11:35:36 -0700
X-CSE-ConnectionGUID: Obob3wSxTiWCZq//P/mH/Q==
X-CSE-MsgGUID: g8/gDgGIRt6PZaVo3chBTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="63361936"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Aug 2024 11:35:35 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjjzY-0000c4-2S;
	Thu, 29 Aug 2024 18:35:32 +0000
Date: Fri, 30 Aug 2024 02:34:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4533/7693]
 drivers/platform/x86/thinkpad_acpi.c:8387 fan_set_enable() error:
 uninitialized symbol 's'.
Message-ID: <202408300210.XqvRdmNf-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Matthias Fetzer <kontakt@matthias-fetzer.de>
CC: Hans de Goede <hdegoede@redhat.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b18bbfc14a38b5234e09c2adcf713e38063a7e6e
commit: 57d0557dfa4940919ec2971245a6d288e5d85aa8 [4533/7693] platform/x86: thinkpad_acpi: Add Thinkpad Edge E531 fan support
:::::: branch date: 11 hours ago
:::::: commit date: 10 days ago
config: i386-randconfig-141-20240829 (https://download.01.org/0day-ci/archive/20240830/202408300210.XqvRdmNf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408300210.XqvRdmNf-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:8387 fan_set_enable() error: uninitialized symbol 's'.

Old smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:1205 tpacpi_new_rfkill() warn: 'atp_rfk->rfkill' is an error pointer or valid
drivers/platform/x86/thinkpad_acpi.c:2642 hotkey_inputdev_close() warn: bitwise AND condition is false here
drivers/platform/x86/thinkpad_acpi.c:3642 hotkey_notify_hotkey() warn: bitwise AND condition is false here

vim +/s +8387 drivers/platform/x86/thinkpad_acpi.c

fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8318  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8319  static int fan_set_enable(void)
fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8320  {
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8321  	u8 s;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8322  	int rc;
fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8323  
ecf2a80a97b3d3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-27  8324  	if (!fan_control_allowed)
ecf2a80a97b3d3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-27  8325  		return -EPERM;
ecf2a80a97b3d3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-27  8326  
7646ea88af80a9 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-01-11  8327  	if (mutex_lock_killable(&fan_mutex))
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8328  		return -ERESTARTSYS;
fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8329  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8330  	switch (fan_control_access_mode) {
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8331  	case TPACPI_FAN_WR_ACPI_FANS:
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8332  	case TPACPI_FAN_WR_TPEC:
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8333  		rc = fan_get_status(&s);
6060a75e77fb05 drivers/platform/x86/thinkpad_acpi.c Tom Rix                     2022-03-12  8334  		if (rc)
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8335  			break;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8336  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8337  		/* Don't go out of emergency fan mode */
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8338  		if (s != 7) {
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8339  			s &= 0x07;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8340  			s |= TP_EC_FAN_AUTO | 4; /* min fan speed 4 */
fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8341  		}
fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8342  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8343  		if (!acpi_ec_write(fan_status_offset, s))
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8344  			rc = -EIO;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8345  		else {
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8346  			tp_features.fan_ctrl_status_undef = 0;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8347  			rc = 0;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8348  		}
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8349  		break;
fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8350  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8351  	case TPACPI_FAN_WR_ACPI_SFAN:
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8352  		rc = fan_get_status(&s);
6060a75e77fb05 drivers/platform/x86/thinkpad_acpi.c Tom Rix                     2022-03-12  8353  		if (rc)
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8354  			break;
fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8355  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8356  		s &= 0x07;
fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8357  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8358  		/* Set fan to at least level 4 */
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8359  		s |= 4;
fe98a52ce7540f drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-24  8360  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8361  		if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", s))
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8362  			rc = -EIO;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8363  		else
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8364  			rc = 0;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8365  		break;
fe08bc4b4fd137 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21  8366  
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8367  	case TPACPI_FAN_WR_ACPI_FANW:
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8368  		if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x05)) {
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8369  			rc = -EIO;
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8370  			break;
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8371  		}
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8372  		if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0x00)) {
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8373  			rc = -EIO;
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8374  			break;
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8375  		}
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8376  
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8377  		rc = 0;
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8378  		break;
57d0557dfa4940 drivers/platform/x86/thinkpad_acpi.c Matthias Fetzer             2024-08-16  8379  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8380  	default:
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8381  		rc = -ENXIO;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8382  	}
78f81cc4355c31 drivers/acpi/ibm_acpi.c              Borislav Deianov            2005-08-17  8383  
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8384  	mutex_unlock(&fan_mutex);
74a60c0f828016 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-04-04  8385  
74a60c0f828016 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-04-04  8386  	if (!rc)
74a60c0f828016 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-04-04 @8387  		vdbg_printk(TPACPI_DBG_FAN,
74a60c0f828016 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-04-04  8388  			"fan control: set fan control register to 0x%02x\n",
74a60c0f828016 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Holschuh 2009-04-04  8389  			s);
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8390  	return rc;
b21a15f6d065e8 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2008-01-08  8391  }
5fba344cfdbaa7 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Holschuh 2007-04-21  8392  

:::::: The code at line 8387 was first introduced by commit
:::::: 74a60c0f828016456fc635feae388ffd12bb3bb9 thinkpad-acpi: enhanced debugging messages for the fan subdriver

:::::: TO: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
:::::: CC: Len Brown <len.brown@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
