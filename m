Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232BC3FC5A2
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593444; cv=none; b=EEB8S9sxhXNpG3lgx6x4gOPvpAGqkbAkOk3RvzXXeXNk5/FdcQjG7HalkpDWUuW0fTaWDRzg9+U1cwWiZx606Oii5qaRsPPHeH+VU69FDsuvHyHuIPFztfjHr4MGKe2BHcdE5WqdhJxOurF1eDiMhJxoGEphRY3sm2b8HbOpnAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593444; c=relaxed/simple;
	bh=NHtqz9oIRl9tOwnzyplBsSIEsyZlsEDbyJayOyG6x1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ESO0BMaCdd2A99L+327gaB/wmLte/ToSno88lmU395Sx/dbPOBF9hqNmgwi6ofOnO1qY/vQ3yZ0HKLFiYaXVozdayle/TlGMDEDwaRKBDr4mM+gDI7wzMBUgblJxnBiiIR7P308ED8WRbRdJkJr87uVA54XvT+Zwn5bsJsyqmtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bK2FAEYa; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bK2FAEYa"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso625173a34.1
        for <oe-kbuild@lists.linux.dev>; Thu, 09 Jul 2026 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593442; x=1784198242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwqQQlt7bfetmW8kry4/TUBjnsZkk8XLprYNoxOM8HE=;
        b=bK2FAEYapUWz+uB1McMzolbTYpMcEwyeumzjftoH5k1Q1a0q7m8F7lcHTM7rnspo/A
         b1dm8CmVXJgTZT6stkfGkhvYBg3psSp+BgDQ5ouKzH1q2Jm3lqIVtiSRDhzgnDooA8jF
         661wQVG3LOx7ZPuFbtes7E/abQBs3cjGP1rgAudTliUx0Cmu6EbznkKWb1oAA4aCQTyQ
         syrpeYME9hBR9JZEsxsGe8rVMgDwhDXwwLyh9edKKrpiBMwXPaqnPmjhRNxgZAw8DVJB
         VkbbEBgw3e8YuEnWDG/k+WuRFkYPSobaeA6xFqwBapbCvq6kf0h3Rt4HIMJia22N/QJ0
         SPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593442; x=1784198242;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwqQQlt7bfetmW8kry4/TUBjnsZkk8XLprYNoxOM8HE=;
        b=ruarQxtNWUd8F7qkNnGbAOoPphhzyfJczVOWl0FtHDF6uwruDgUhZLxyY7liXt8FqR
         nm+tdG+hs+ghyMFpklVdEJ/8lxBuYMQD97qAlpbB2d11qEe7ZLovvQixmfYpuzxFAME7
         IbkwFEIR3RonbzlHAoIehkUZY9oIDihPKH49WyxUwzW0Lb2C0cUyN3iY+IBxkzeWKZJx
         UCjn+hdU/jsqUtIUu1gnJ/gGX7gI4uP23MfD+0ke8vf4wtrDlWoHUOlWf7gpFKWaA6Jt
         /6SMAYI/HjyG7PZnhfw9XUjPlIcFeDFzlvYwE1ibp/dAT5UigAqLn3Ko31zv/y7bNN7l
         LJsQ==
X-Gm-Message-State: AOJu0YyjSJeqRAgtwpkLW6KTN7U2aV1WzbUdJJ+jEnuHxSRKzu7GFq+7
	IxNkpIRCqRbTNqb2FI40XlzLS4tBhtDIcQQZYvMCz9MxM7Ub6zDGyqCT3RsHmR1Pc1o=
X-Gm-Gg: AfdE7cmJRJ0I+XoUU0QPk727iU1c/xB69c0WwOHHAnRJkUloZATpmpbOAPR53krAHW4
	WcMDyuno0e38XecCGu5qVjg3t1kqKpPjIcwQtWXisxowg+CtYEnUGM1Ow5nPM5KJpuFue4HgdgO
	TVMuJTM+/6QuGqPfmAsO8ywJrfgyGb3HRdcfFOvX0SNqUIOgpEvEP+brAInxBoiEnTtpkeG40Qx
	byCUyahoooNK9p8hHgxxzm3IIq9K8gaNvrc8Tx3yEtdHOyi9Gc6EhQo8iPg/WAkd1CVVXijuZWK
	x1RxK6ACD50lUmKbjq61W2BbXaQc2cOdlL5wwR5qtw2WI8SgIMiuZSm3JX/DcPUsF+Lk8L2Niwp
	qbQaLfvVa76+iMNkQb+7WdTucuVfpYpsnD306Zm0DkybR78R4I/oZ+U5uUW3Me4MmnPfmtnMxdu
	RuUOA5GsVuskYlfE0=
X-Received: by 2002:a05:6830:7316:b0:7e5:6c74:b295 with SMTP id 46e09a7af769-7ebcfea2707mr4532467a34.14.1783593441824;
        Thu, 09 Jul 2026 03:37:21 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2bae7fsm4084912a34.21.2026.07.09.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:37:20 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:37:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_ec-hwmon-locking 2/6]
 drivers/hwmon/cros_ec_hwmon.c:578 cros_ec_hwmon_probe() warn: passing zero
 to 'PTR_ERR'
Message-ID: <202607031558.090AWNd1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260709103714.VgCV9Zd3JTMXRriEwzwmi7nnuPH7nIgrSvm-t7wJqvE@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/cros_ec-hwmon-locking
head:   95003896306434c5e2d6cae819f38179e0f5048f
commit: d54d63ebb10e19d82a484c16372173926c021022 [2/6] priv
config: sparc-randconfig-r071-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031558.090AWNd1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031558.090AWNd1-lkp@intel.com/

smatch warnings:
drivers/hwmon/cros_ec_hwmon.c:578 cros_ec_hwmon_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +578 drivers/hwmon/cros_ec_hwmon.c

bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  546  static int cros_ec_hwmon_probe(struct platform_device *pdev)
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  547  {
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  548  	struct device *dev = &pdev->dev;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  549  	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  550  	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  551  	struct cros_ec_hwmon_priv *priv;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  552  	struct device *hwmon_dev;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  553  	u8 thermal_version;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  554  	int ret;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  555  
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  556  	ret = cros_ec_cmd_readmem(cros_ec, EC_MEMMAP_THERMAL_VERSION, 1, &thermal_version);
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  557  	if (ret < 0)
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  558  		return ret;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  559  
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  560  	/* Covers both fan and temp sensors */
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  561  	if (thermal_version == 0)
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  562  		return -ENODEV;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  563  
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  564  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  565  	if (!priv)
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  566  		return -ENOMEM;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  567  
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  568  	priv->cros_ec = cros_ec;
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  569  
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  570  	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  571  	cros_ec_hwmon_probe_fans(priv);
fb8e659309f72e Sung-Chi Li      2025-09-11  572  	priv->fan_control_supported = cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
afa7c56ec44731 Thomas Weiﬂschuh 2026-01-18  573  	priv->temp_threshold_supported = is_cros_ec_cmd_available(priv->cros_ec,
afa7c56ec44731 Thomas Weiﬂschuh 2026-01-18  574  								  EC_CMD_THERMAL_GET_THRESHOLD, 1);
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  575  
d54d63ebb10e19 Thomas Weiﬂschuh 2026-07-01  576  	priv->hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  577  							       &cros_ec_hwmon_chip_info, NULL);
d54d63ebb10e19 Thomas Weiﬂschuh 2026-07-01 @578  	if (PTR_ERR(priv->hwmon_dev))

s/PTR_ERR/IS_ERR/

d54d63ebb10e19 Thomas Weiﬂschuh 2026-07-01  579  		return PTR_ERR(priv->hwmon_dev);
d54d63ebb10e19 Thomas Weiﬂschuh 2026-07-01  580  
d54d63ebb10e19 Thomas Weiﬂschuh 2026-07-01  581  	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
d54d63ebb10e19 Thomas Weiﬂschuh 2026-07-01  582  
fb8e659309f72e Sung-Chi Li      2025-09-11  583  	platform_set_drvdata(pdev, priv);
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  584  
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  585  	return PTR_ERR_OR_ZERO(hwmon_dev);
bc3e45258096f2 Thomas Weiﬂschuh 2024-05-29  586  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

