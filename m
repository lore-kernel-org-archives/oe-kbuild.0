Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279413;
	b=VPxTDRXJ/CJOKQ+QEBAvtYyHUAPYX7TI8F8e/o18kmE9G1KiKoQZ8oMaHdJVTRQgiR19
	 xHOh+vqm4YLPSsPogppmWfxzQmYFbao+I3PIs/QrkxCqhAdzK8LVx4abzDyIDCHiSsO6t
	 qTmtqiPIjsHU/pn/kB4YmJZYl19eVVdagMD3GJh8gbxZZi3NGxUgg8KJaQ0HeVf4Riar1
	 lbVx0DxTlxQOVInaYXvm/c7oTnPoKa22YI6uE9mNG0g6oPWRIwryChKoBXRxj5wYjQmj3
	 LEaw469/+HU35wbd72eqIThrmiuDJXjAO11A+JTBZLbIvJNtfiFNMgj1uTxT98awuVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279413;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XEtPsjjBKFQsWNNArgsw9izX9+NTMXT/4sNk5KOYyTg=;
	b=aHBi4QnQpkxRzsbIm5XO2ngtUm1LCc4Se5krdYgfd7Xr+ynJMkBLWcCoTFNQ4GaIm2vr
	 417P2Gvtw9rfVaRKg21QCY2NGQXmVnDoA1L4jLJgZkSl6v4FWF6J30r6+CE2MF97Ood1U
	 JWvYQMAsm0dHzTF/cy4/5ANAT8ryBBY43TgNDdxfRbSBMZcYCAPOCnkndnK2CR8QHGn5R
	 BEVe9qeQzdH7gFefLT1e66sfGY85+Of9r4ibuKb4Bi5mQYkQQ1t5XrOtXy25REvmKv9Bi
	 NTQrojU35zW+y8v2Y3k+fZjigbxVPrLTCVX6OCBMnFHpOr2tGdtETqSiQ4vsMe4EEZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sww7+SMT;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFBB606A331
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 02:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EFBB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sww7+SMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794279412; x=1825815412;
  h=date:from:to:cc:subject:message-id;
  bh=gga493NKeYT9MFUJoTapogyvrW7VDrhxh+vDc9lFELg=;
  b=Sww7+SMThJRA01fWAvlCm0HtW07eZXVWtsoFmODxY4GrOCdg1H+TEOMV
   zKSsO9Ox4dBdunQ1/Zl+TC/sZ5AbXeCV8bXFIJG5y1CN7BFcZpNNDWV4+
   t8LSwQXppv0av08UODF3Yql91YF20obys6G0qlxSijIz9qv0SF5suznCe
   G71CaNRAjBNL2QSv3HUwqBWApiAWZ04NK+waE5wTh5ZQcJ47DVyQgx99T
   u8+NrxNji5VoIPtJuDhRdtaXLXFn/x6djoLE2gzSHejWm1meNhF8Yu9sR
   STtZ3aq1e0rFAQbxkRw0ZEyDtBoB3jPVQ7td+bcQU5yEjpMx9yCGtb4Yc
   w==;
X-CSE-ConnectionGUID: 36Raw8azQyOQAor8Xj4Sqg==
X-CSE-MsgGUID: 7dydnJdsScqZPH4pqcc8kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2915077"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2915077"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 18:56:51 -0800
X-CSE-ConnectionGUID: ZeIwPyYnQouNm7X1eXy67Q==
X-CSE-MsgGUID: duXd38lUQ82v221pdGjGyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7845703"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Nov 2026 18:56:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQc2O-0000000009r-2r30;
	Tue, 10 Nov 2026 02:56:44 +0000
Date: Tue, 10 Nov 2026 03:56:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2461/2847]
 drivers/power/supply/qcom_smbx.c:1104 smb_probe() warn: passing zero to
 'dev_err_probe'
Message-ID: <202611100319.2LkaG5Vl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Fabricio Akio <fabricioakio@gmail.com>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   630059a5a632377b9b7b487baccde92b7ae1dd47
commit: 275c40e43b0d3671d79fa143e664eb4fc0bed96f [2461/2847] power: supply: qcom_smbx: report charger state changes
:::::: branch date: 12 hours ago
:::::: commit date: 30 hours ago
config: powerpc-randconfig-2200-20261110 (https://download.01.org/0day-ci/archive/20261110/202611100319.2LkaG5Vl-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a82bdcc800c2564f2e9a6d8b1942c1a798c7181b)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611100319.2LkaG5Vl-lkp@intel.com/

smatch warnings:
drivers/power/supply/qcom_smbx.c:1104 smb_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1104 drivers/power/supply/qcom_smbx.c

8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   962  
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19   963  static int smb_probe(struct platform_device *pdev)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   964  {
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   965  	struct power_supply_config supply_config = {};
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   966  	struct power_supply_desc *desc;
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19   967  	struct smb_chip *chip;
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12   968  	unsigned int charge_enable;
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12   969  	unsigned int float_voltage_sel;
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12   970  	int float_voltage_uv;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   971  	int rc, irq;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   972  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   973  	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   974  	if (!chip)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   975  		return -ENOMEM;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   976  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   977  	chip->dev = &pdev->dev;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   978  	chip->name = pdev->name;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   979  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   980  	chip->regmap = dev_get_regmap(pdev->dev.parent, NULL);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   981  	if (!chip->regmap)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   982  		return dev_err_probe(chip->dev, -ENODEV,
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   983  				     "failed to locate the regmap\n");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   984  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   985  	rc = device_property_read_u32(chip->dev, "reg", &chip->base);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   986  	if (rc < 0)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   987  		return dev_err_probe(chip->dev, rc,
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   988  				     "Couldn't read base address\n");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   989  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   990  	chip->usb_in_v_chan = devm_iio_channel_get(chip->dev, "usbin_v");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   991  	if (IS_ERR(chip->usb_in_v_chan))
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   992  		return dev_err_probe(chip->dev, PTR_ERR(chip->usb_in_v_chan),
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   993  				     "Couldn't get usbin_v IIO channel\n");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   994  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   995  	chip->usb_in_i_chan = devm_iio_channel_get(chip->dev, "usbin_i");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   996  	if (IS_ERR(chip->usb_in_i_chan)) {
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   997  		return dev_err_probe(chip->dev, PTR_ERR(chip->usb_in_i_chan),
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   998  				     "Couldn't get usbin_i IIO channel\n");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26   999  	}
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1000  
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1001  	rc = regmap_read(chip->regmap, chip->base + CHARGING_ENABLE_CMD,
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1002  			 &charge_enable);
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1003  	if (rc < 0)
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1004  		return dev_err_probe(chip->dev, rc,
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1005  				     "Couldn't read charging state\n");
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1006  
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1007  	chip->initial_charge_enable = charge_enable & CHARGING_ENABLE_CMD_BIT;
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1008  	rc = devm_add_action_or_reset(chip->dev, smb_restore_charge_enable, chip);
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1009  	if (rc)
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1010  		return dev_err_probe(chip->dev, rc,
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1011  				     "Couldn't register charging state rollback\n");
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1012  
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19  1013  	rc = smb_init_hw(chip);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1014  	if (rc < 0)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1015  		return rc;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1016  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1017  	supply_config.drv_data = chip;
46d0c03c5503369 drivers/power/supply/qcom_pmi8998_charger.c Sebastian Reichel 2025-02-25  1018  	supply_config.fwnode = dev_fwnode(&pdev->dev);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1019  
6415ce7204af0e2 drivers/power/supply/qcom_smbx.c            Kees Cook         2026-09-17  1020  	desc = devm_kzalloc(chip->dev, sizeof(*desc), GFP_KERNEL);
88f04bc3e737155 drivers/power/supply/qcom_pmi8998_charger.c Kunwu Chan        2023-11-24  1021  	if (!desc)
88f04bc3e737155 drivers/power/supply/qcom_pmi8998_charger.c Kunwu Chan        2023-11-24  1022  		return -ENOMEM;
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19  1023  	memcpy(desc, &smb_psy_desc, sizeof(smb_psy_desc));
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1024  	desc->name =
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1025  		devm_kasprintf(chip->dev, GFP_KERNEL, "%s-charger",
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1026  			       (const char *)device_get_match_data(chip->dev));
88f04bc3e737155 drivers/power/supply/qcom_pmi8998_charger.c Kunwu Chan        2023-11-24  1027  	if (!desc->name)
88f04bc3e737155 drivers/power/supply/qcom_pmi8998_charger.c Kunwu Chan        2023-11-24  1028  		return -ENOMEM;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1029  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1030  	chip->chg_psy =
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1031  		devm_power_supply_register(chip->dev, desc, &supply_config);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1032  	if (IS_ERR(chip->chg_psy))
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1033  		return dev_err_probe(chip->dev, PTR_ERR(chip->chg_psy),
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1034  				     "failed to register power supply\n");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1035  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1036  	rc = power_supply_get_battery_info(chip->chg_psy, &chip->batt_info);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1037  	if (rc)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1038  		return dev_err_probe(chip->dev, rc,
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1039  				     "Failed to get battery info\n");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1040  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1041  	rc = devm_delayed_work_autocancel(chip->dev, &chip->status_change_work,
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19  1042  					  smb_status_change_work);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1043  	if (rc)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1044  		return dev_err_probe(chip->dev, rc,
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1045  				     "Failed to init status change work\n");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1046  
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1047  	if (power_supply_battery_info_has_prop(chip->batt_info,
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1048  					       POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX)) {
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1049  		float_voltage_uv =
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1050  			chip->batt_info->constant_charge_voltage_max_uv;
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1051  	} else if (power_supply_battery_info_has_prop(chip->batt_info,
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1052  					      POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN)) {
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1053  		float_voltage_uv = chip->batt_info->voltage_max_design_uv;
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1054  	} else {
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1055  		dev_warn(chip->dev, "No battery float voltage; preserving hardware setting\n");
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1056  		goto skip_float_voltage;
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1057  	}
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1058  
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1059  	if (float_voltage_uv < SMB2_FLOAT_VOLTAGE_MIN_UV ||
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1060  	    float_voltage_uv > SMB2_FLOAT_VOLTAGE_MAX_UV)
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1061  		return dev_err_probe(chip->dev, -EINVAL,
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1062  				     "float voltage %d uV outside %d-%d uV\n",
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1063  				     float_voltage_uv,
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1064  				     SMB2_FLOAT_VOLTAGE_MIN_UV,
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1065  				     SMB2_FLOAT_VOLTAGE_MAX_UV);
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1066  
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1067  	float_voltage_sel =
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1068  		(float_voltage_uv - SMB2_FLOAT_VOLTAGE_MIN_UV) /
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1069  		SMB2_FLOAT_VOLTAGE_STEP_UV;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1070  	rc = regmap_update_bits(chip->regmap, chip->base + FLOAT_VOLTAGE_CFG,
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1071  				FLOAT_VOLTAGE_SETTING_MASK, float_voltage_sel);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1072  	if (rc < 0)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1073  		return dev_err_probe(chip->dev, rc, "Couldn't set vbat max\n");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1074  
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1075  skip_float_voltage:
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19  1076  	rc = smb_init_irq(chip, &irq, "bat-ov", smb_handle_batt_overvoltage);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1077  	if (rc < 0)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1078  		return rc;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1079  
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19  1080  	rc = smb_init_irq(chip, &chip->cable_irq, "usb-plugin",
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19  1081  			   smb_handle_usb_plugin);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1082  	if (rc < 0)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1083  		return rc;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1084  
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19  1085  	rc = smb_init_irq(chip, &irq, "usbin-icl-change",
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19  1086  			   smb_handle_usb_icl_change);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1087  	if (rc < 0)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1088  		return rc;
5ec53bcc7fce680 drivers/power/supply/qcom_smbx.c            Casey Connolly    2025-06-19  1089  	rc = smb_init_irq(chip, &irq, "wdog-bark", smb_handle_wdog_bark);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1090  	if (rc < 0)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1091  		return rc;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1092  
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1093  	/* Optional: not every device tree lists it */
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1094  	irq = platform_get_irq_byname_optional(pdev, "chg-state-change");
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1095  	if (irq > 0) {
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1096  		rc = devm_request_threaded_irq(chip->dev, irq, NULL,
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1097  					       smb_handle_chg_state_change,
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1098  					       IRQF_ONESHOT, "chg-state-change",
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1099  					       chip);
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1100  		if (rc < 0)
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1101  			return dev_err_probe(chip->dev, rc,
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1102  					     "Couldn't request irq chg-state-change\n");
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1103  	} else if (irq != -ENXIO) {
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03 @1104  		return dev_err_probe(chip->dev, irq,
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1105  				     "Couldn't get irq chg-state-change\n");
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1106  	}
275c40e43b0d367 drivers/power/supply/qcom_smbx.c            Fabricio Akio     2026-10-03  1107  
6c5393771c50fac drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2025-06-19  1108  	devm_device_init_wakeup(chip->dev);
6c5393771c50fac drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2025-06-19  1109  
6c5393771c50fac drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2025-06-19  1110  	rc = devm_pm_set_wake_irq(chip->dev, chip->cable_irq);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1111  	if (rc < 0)
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1112  		return dev_err_probe(chip->dev, rc, "Couldn't set wake irq\n");
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1113  
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1114  	devm_remove_action(chip->dev, smb_restore_charge_enable, chip);
a2d7dc538da2cb4 drivers/power/supply/qcom_smbx.c            Robin Snyders     2026-08-12  1115  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1116  	platform_set_drvdata(pdev, chip);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1117  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1118  	/* Initialise charger state */
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1119  	schedule_delayed_work(&chip->status_change_work, 0);
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1120  
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1121  	return 0;
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1122  }
8648aeb5d7b70e1 drivers/power/supply/qcom_pmi8998_charger.c Casey Connolly    2023-05-26  1123  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
