Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCD83FF4
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 22:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690497453; x=1722033453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dy2g7XKdBubYP6f7LQd3I6P7eqO7t6xw11M77O1EThw=;
  b=KD49Lsd6FvW5Sf13azY2jhgNJ0RXa66D8q+7iz82FTL+vjw3mGctGOq0
   ujiQwOVDsbbsk2xGFy2urKNaYnWxlDdhUSCbEccV55nHybe5ucwVdjBcc
   nkA1t9zOzQIaH18q/o56vUn4Kl9o7rwNxcSs3yT60IfhyaDcAngW1Y/3R
   C/KyzSMNyHmvnQS376vIuyHU3UFXkSO0h5Lpe0m5yMMWExtehvlys2eCo
   2M7KQy8kNpgGtkf9AEQIsiVkwwEC9NA+PLjRqlWaGM2/POzuE/0a21vqB
   bX9pKc1ESV5ICxdtc/CGprDqfRuq89qR/vfVl6YzJkzr88DlHD8NRYFvu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353360876"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="353360876"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 15:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704310198"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="704310198"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 15:37:28 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP9br-0002fD-1n;
	Thu, 27 Jul 2023 22:37:27 +0000
Date: Fri, 28 Jul 2023 06:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/power/supply/qcom_pmi8998_charger.c:565
 smb2_status_change_work() error: uninitialized symbol 'usb_online'.
Message-ID: <202307280638.556PrzIS-lkp@intel.com>
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
TO: Caleb Connolly <caleb.connolly@linaro.org>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57012c57536f8814dec92e74197ee96c3498d24e
commit: 8648aeb5d7b70e13264ff5f444f22081d37d4670 power: supply: add Qualcomm PMI8998 SMB2 Charger driver
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-m041-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280638.556PrzIS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280638.556PrzIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307280638.556PrzIS-lkp@intel.com/

smatch warnings:
drivers/power/supply/qcom_pmi8998_charger.c:565 smb2_status_change_work() error: uninitialized symbol 'usb_online'.

vim +/usb_online +565 drivers/power/supply/qcom_pmi8998_charger.c

8648aeb5d7b70e Caleb Connolly 2023-05-26  555  
8648aeb5d7b70e Caleb Connolly 2023-05-26  556  static void smb2_status_change_work(struct work_struct *work)
8648aeb5d7b70e Caleb Connolly 2023-05-26  557  {
8648aeb5d7b70e Caleb Connolly 2023-05-26  558  	unsigned int charger_type, current_ua;
8648aeb5d7b70e Caleb Connolly 2023-05-26  559  	int usb_online, count, rc;
8648aeb5d7b70e Caleb Connolly 2023-05-26  560  	struct smb2_chip *chip;
8648aeb5d7b70e Caleb Connolly 2023-05-26  561  
8648aeb5d7b70e Caleb Connolly 2023-05-26  562  	chip = container_of(work, struct smb2_chip, status_change_work.work);
8648aeb5d7b70e Caleb Connolly 2023-05-26  563  
8648aeb5d7b70e Caleb Connolly 2023-05-26  564  	smb2_get_prop_usb_online(chip, &usb_online);
8648aeb5d7b70e Caleb Connolly 2023-05-26 @565  	if (!usb_online)
8648aeb5d7b70e Caleb Connolly 2023-05-26  566  		return;
8648aeb5d7b70e Caleb Connolly 2023-05-26  567  
8648aeb5d7b70e Caleb Connolly 2023-05-26  568  	for (count = 0; count < 3; count++) {
8648aeb5d7b70e Caleb Connolly 2023-05-26  569  		dev_dbg(chip->dev, "get charger type retry %d\n", count);
8648aeb5d7b70e Caleb Connolly 2023-05-26  570  		rc = smb2_apsd_get_charger_type(chip, &charger_type);
8648aeb5d7b70e Caleb Connolly 2023-05-26  571  		if (rc != -EAGAIN)
8648aeb5d7b70e Caleb Connolly 2023-05-26  572  			break;
8648aeb5d7b70e Caleb Connolly 2023-05-26  573  		msleep(100);
8648aeb5d7b70e Caleb Connolly 2023-05-26  574  	}
8648aeb5d7b70e Caleb Connolly 2023-05-26  575  
8648aeb5d7b70e Caleb Connolly 2023-05-26  576  	if (rc < 0 && rc != -EAGAIN) {
8648aeb5d7b70e Caleb Connolly 2023-05-26  577  		dev_err(chip->dev, "get charger type failed: %d\n", rc);
8648aeb5d7b70e Caleb Connolly 2023-05-26  578  		return;
8648aeb5d7b70e Caleb Connolly 2023-05-26  579  	}
8648aeb5d7b70e Caleb Connolly 2023-05-26  580  
8648aeb5d7b70e Caleb Connolly 2023-05-26  581  	if (rc < 0) {
8648aeb5d7b70e Caleb Connolly 2023-05-26  582  		rc = regmap_update_bits(chip->regmap, chip->base + CMD_APSD,
8648aeb5d7b70e Caleb Connolly 2023-05-26  583  					APSD_RERUN_BIT, APSD_RERUN_BIT);
8648aeb5d7b70e Caleb Connolly 2023-05-26  584  		schedule_delayed_work(&chip->status_change_work,
8648aeb5d7b70e Caleb Connolly 2023-05-26  585  				      msecs_to_jiffies(1000));
8648aeb5d7b70e Caleb Connolly 2023-05-26  586  		dev_dbg(chip->dev, "get charger type failed, rerun apsd\n");
8648aeb5d7b70e Caleb Connolly 2023-05-26  587  		return;
8648aeb5d7b70e Caleb Connolly 2023-05-26  588  	}
8648aeb5d7b70e Caleb Connolly 2023-05-26  589  
8648aeb5d7b70e Caleb Connolly 2023-05-26  590  	switch (charger_type) {
8648aeb5d7b70e Caleb Connolly 2023-05-26  591  	case POWER_SUPPLY_USB_TYPE_CDP:
8648aeb5d7b70e Caleb Connolly 2023-05-26  592  		current_ua = CDP_CURRENT_UA;
8648aeb5d7b70e Caleb Connolly 2023-05-26  593  		break;
8648aeb5d7b70e Caleb Connolly 2023-05-26  594  	case POWER_SUPPLY_USB_TYPE_DCP:
8648aeb5d7b70e Caleb Connolly 2023-05-26  595  		current_ua = DCP_CURRENT_UA;
8648aeb5d7b70e Caleb Connolly 2023-05-26  596  		break;
8648aeb5d7b70e Caleb Connolly 2023-05-26  597  	case POWER_SUPPLY_USB_TYPE_SDP:
8648aeb5d7b70e Caleb Connolly 2023-05-26  598  	default:
8648aeb5d7b70e Caleb Connolly 2023-05-26  599  		current_ua = SDP_CURRENT_UA;
8648aeb5d7b70e Caleb Connolly 2023-05-26  600  		break;
8648aeb5d7b70e Caleb Connolly 2023-05-26  601  	}
8648aeb5d7b70e Caleb Connolly 2023-05-26  602  
8648aeb5d7b70e Caleb Connolly 2023-05-26  603  	smb2_set_current_limit(chip, current_ua);
8648aeb5d7b70e Caleb Connolly 2023-05-26  604  	power_supply_changed(chip->chg_psy);
8648aeb5d7b70e Caleb Connolly 2023-05-26  605  }
8648aeb5d7b70e Caleb Connolly 2023-05-26  606  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
