Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160CB22E46
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jun 2023 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686082636; x=1717618636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pD2E6LZaUMk1WhP7e6oD9cSf5dpBlaWeUkyrKyrF4hA=;
  b=P6gz/7gtTD2a3v+oz9DtPX01Gb1/A62P3KFzz/qFXod98HcDu/HrAAT6
   dNwfXFZKj5tRHp/Vf5/NNs+tHZWnNkiQe+CbriYtIfpNWewll1FbXDTaD
   Wf9rf8nc5J7stSHlL/SZr3Zou3Pj21B/Zh+nAxliOskrordp0EjbjLte2
   y0CKERxAORWu7Hy/0QERjIrm1bo/WUhXUx9kBb77aOoUbpjO+IfCNEFuu
   wqHNnoDvKift2QIPKo3wSY+TVrTC78oX+6NUCryZi/oPHli+MhUI62or3
   Cbg1Swo1NN8g7IfQKGqvkFTEcuSzGxIeArhxyH+ykgU1Ov7mXqMBNJo3N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="356801974"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="356801974"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 13:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="686666421"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="686666421"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jun 2023 13:17:11 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6d78-0005gx-2l;
	Tue, 06 Jun 2023 20:17:10 +0000
Date: Wed, 7 Jun 2023 04:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6036/7345]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:1538
 smu_v13_0_0_od_edit_dpm_table() warn: potential pointer math issue
 ('od_table' is a 1120 bit pointer)
Message-ID: <202306070401.L10QKCAh-lkp@intel.com>
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
TO: Evan Quan <evan.quan@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6db29e14f4fb7bce9eb5290288e71b05c2b0d118
commit: f0a0c659fb96b74385b6f3d451d598752f4ef1a0 [6036/7345] drm/amd/pm: fulfill the OD support for SMU13.0.0
:::::: branch date: 16 hours ago
:::::: commit date: 4 days ago
config: csky-randconfig-m031-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070401.L10QKCAh-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306070401.L10QKCAh-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:1538 smu_v13_0_0_od_edit_dpm_table() warn: potential pointer math issue ('od_table' is a 1120 bit pointer)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:1551 smu_v13_0_0_od_edit_dpm_table() warn: potential pointer math issue ('od_table' is a 1120 bit pointer)
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:2552 smu_v13_0_0_check_ecc_table_support() warn: missing error code? 'ret'

vim +1538 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c

276c03a0547068 Evan Quan 2022-04-06  1353  
f0a0c659fb96b7 Evan Quan 2023-05-08  1354  static int smu_v13_0_0_od_edit_dpm_table(struct smu_context *smu,
f0a0c659fb96b7 Evan Quan 2023-05-08  1355  					 enum PP_OD_DPM_TABLE_COMMAND type,
f0a0c659fb96b7 Evan Quan 2023-05-08  1356  					 long input[],
f0a0c659fb96b7 Evan Quan 2023-05-08  1357  					 uint32_t size)
f0a0c659fb96b7 Evan Quan 2023-05-08  1358  {
f0a0c659fb96b7 Evan Quan 2023-05-08  1359  	struct smu_table_context *table_context = &smu->smu_table;
f0a0c659fb96b7 Evan Quan 2023-05-08  1360  	OverDriveTableExternal_t *od_table =
f0a0c659fb96b7 Evan Quan 2023-05-08  1361  		(OverDriveTableExternal_t *)table_context->overdrive_table;
f0a0c659fb96b7 Evan Quan 2023-05-08  1362  	struct amdgpu_device *adev = smu->adev;
f0a0c659fb96b7 Evan Quan 2023-05-08  1363  	uint32_t offset_of_featurectrlmask;
f0a0c659fb96b7 Evan Quan 2023-05-08  1364  	int32_t minimum, maximum;
f0a0c659fb96b7 Evan Quan 2023-05-08  1365  	uint32_t feature_ctrlmask;
f0a0c659fb96b7 Evan Quan 2023-05-08  1366  	int i, ret = 0;
f0a0c659fb96b7 Evan Quan 2023-05-08  1367  
f0a0c659fb96b7 Evan Quan 2023-05-08  1368  	switch (type) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1369  	case PP_OD_EDIT_SCLK_VDDC_TABLE:
f0a0c659fb96b7 Evan Quan 2023-05-08  1370  		if (!smu_v13_0_0_is_od_feature_supported(smu, PP_OD_FEATURE_GFXCLK_BIT)) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1371  			dev_warn(adev->dev, "GFXCLK_LIMITS setting not supported!\n");
f0a0c659fb96b7 Evan Quan 2023-05-08  1372  			return -ENOTSUPP;
f0a0c659fb96b7 Evan Quan 2023-05-08  1373  		}
f0a0c659fb96b7 Evan Quan 2023-05-08  1374  
f0a0c659fb96b7 Evan Quan 2023-05-08  1375  		for (i = 0; i < size; i += 2) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1376  			if (i + 2 > size) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1377  				dev_info(adev->dev, "invalid number of input parameters %d\n", size);
f0a0c659fb96b7 Evan Quan 2023-05-08  1378  				return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1379  			}
f0a0c659fb96b7 Evan Quan 2023-05-08  1380  
f0a0c659fb96b7 Evan Quan 2023-05-08  1381  			switch (input[i]) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1382  			case 0:
f0a0c659fb96b7 Evan Quan 2023-05-08  1383  				smu_v13_0_0_get_od_setting_limits(smu,
f0a0c659fb96b7 Evan Quan 2023-05-08  1384  								  PP_OD_FEATURE_GFXCLK_BIT,
f0a0c659fb96b7 Evan Quan 2023-05-08  1385  								  true,
f0a0c659fb96b7 Evan Quan 2023-05-08  1386  								  &minimum,
f0a0c659fb96b7 Evan Quan 2023-05-08  1387  								  &maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1388  				if (input[i + 1] < minimum ||
f0a0c659fb96b7 Evan Quan 2023-05-08  1389  				    input[i + 1] > maximum) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1390  					dev_info(adev->dev, "GfxclkFmin (%ld) must be within [%u, %u]!\n",
f0a0c659fb96b7 Evan Quan 2023-05-08  1391  						input[i + 1], minimum, maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1392  					return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1393  				}
f0a0c659fb96b7 Evan Quan 2023-05-08  1394  
f0a0c659fb96b7 Evan Quan 2023-05-08  1395  				od_table->OverDriveTable.GfxclkFmin = input[i + 1];
f0a0c659fb96b7 Evan Quan 2023-05-08  1396  				od_table->OverDriveTable.FeatureCtrlMask |= 1U << PP_OD_FEATURE_GFXCLK_BIT;
f0a0c659fb96b7 Evan Quan 2023-05-08  1397  				break;
f0a0c659fb96b7 Evan Quan 2023-05-08  1398  
f0a0c659fb96b7 Evan Quan 2023-05-08  1399  			case 1:
f0a0c659fb96b7 Evan Quan 2023-05-08  1400  				smu_v13_0_0_get_od_setting_limits(smu,
f0a0c659fb96b7 Evan Quan 2023-05-08  1401  								  PP_OD_FEATURE_GFXCLK_BIT,
f0a0c659fb96b7 Evan Quan 2023-05-08  1402  								  false,
f0a0c659fb96b7 Evan Quan 2023-05-08  1403  								  &minimum,
f0a0c659fb96b7 Evan Quan 2023-05-08  1404  								  &maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1405  				if (input[i + 1] < minimum ||
f0a0c659fb96b7 Evan Quan 2023-05-08  1406  				    input[i + 1] > maximum) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1407  					dev_info(adev->dev, "GfxclkFmax (%ld) must be within [%u, %u]!\n",
f0a0c659fb96b7 Evan Quan 2023-05-08  1408  						input[i + 1], minimum, maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1409  					return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1410  				}
f0a0c659fb96b7 Evan Quan 2023-05-08  1411  
f0a0c659fb96b7 Evan Quan 2023-05-08  1412  				od_table->OverDriveTable.GfxclkFmax = input[i + 1];
f0a0c659fb96b7 Evan Quan 2023-05-08  1413  				od_table->OverDriveTable.FeatureCtrlMask |= 1U << PP_OD_FEATURE_GFXCLK_BIT;
f0a0c659fb96b7 Evan Quan 2023-05-08  1414  				break;
f0a0c659fb96b7 Evan Quan 2023-05-08  1415  
f0a0c659fb96b7 Evan Quan 2023-05-08  1416  			default:
f0a0c659fb96b7 Evan Quan 2023-05-08  1417  				dev_info(adev->dev, "Invalid SCLK_VDDC_TABLE index: %ld\n", input[i]);
f0a0c659fb96b7 Evan Quan 2023-05-08  1418  				dev_info(adev->dev, "Supported indices: [0:min,1:max]\n");
f0a0c659fb96b7 Evan Quan 2023-05-08  1419  				return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1420  			}
f0a0c659fb96b7 Evan Quan 2023-05-08  1421  		}
f0a0c659fb96b7 Evan Quan 2023-05-08  1422  
f0a0c659fb96b7 Evan Quan 2023-05-08  1423  		if (od_table->OverDriveTable.GfxclkFmin > od_table->OverDriveTable.GfxclkFmax) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1424  			dev_err(adev->dev,
f0a0c659fb96b7 Evan Quan 2023-05-08  1425  				"Invalid setting: GfxclkFmin(%u) is bigger than GfxclkFmax(%u)\n",
f0a0c659fb96b7 Evan Quan 2023-05-08  1426  				(uint32_t)od_table->OverDriveTable.GfxclkFmin,
f0a0c659fb96b7 Evan Quan 2023-05-08  1427  				(uint32_t)od_table->OverDriveTable.GfxclkFmax);
f0a0c659fb96b7 Evan Quan 2023-05-08  1428  			return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1429  		}
f0a0c659fb96b7 Evan Quan 2023-05-08  1430  		break;
f0a0c659fb96b7 Evan Quan 2023-05-08  1431  
f0a0c659fb96b7 Evan Quan 2023-05-08  1432  	case PP_OD_EDIT_MCLK_VDDC_TABLE:
f0a0c659fb96b7 Evan Quan 2023-05-08  1433  		if (!smu_v13_0_0_is_od_feature_supported(smu, PP_OD_FEATURE_UCLK_BIT)) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1434  			dev_warn(adev->dev, "UCLK_LIMITS setting not supported!\n");
f0a0c659fb96b7 Evan Quan 2023-05-08  1435  			return -ENOTSUPP;
f0a0c659fb96b7 Evan Quan 2023-05-08  1436  		}
f0a0c659fb96b7 Evan Quan 2023-05-08  1437  
f0a0c659fb96b7 Evan Quan 2023-05-08  1438  		for (i = 0; i < size; i += 2) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1439  			if (i + 2 > size) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1440  				dev_info(adev->dev, "invalid number of input parameters %d\n", size);
f0a0c659fb96b7 Evan Quan 2023-05-08  1441  				return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1442  			}
f0a0c659fb96b7 Evan Quan 2023-05-08  1443  
f0a0c659fb96b7 Evan Quan 2023-05-08  1444  			switch (input[i]) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1445  			case 0:
f0a0c659fb96b7 Evan Quan 2023-05-08  1446  				smu_v13_0_0_get_od_setting_limits(smu,
f0a0c659fb96b7 Evan Quan 2023-05-08  1447  								  PP_OD_FEATURE_UCLK_BIT,
f0a0c659fb96b7 Evan Quan 2023-05-08  1448  								  true,
f0a0c659fb96b7 Evan Quan 2023-05-08  1449  								  &minimum,
f0a0c659fb96b7 Evan Quan 2023-05-08  1450  								  &maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1451  				if (input[i + 1] < minimum ||
f0a0c659fb96b7 Evan Quan 2023-05-08  1452  				    input[i + 1] > maximum) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1453  					dev_info(adev->dev, "UclkFmin (%ld) must be within [%u, %u]!\n",
f0a0c659fb96b7 Evan Quan 2023-05-08  1454  						input[i + 1], minimum, maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1455  					return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1456  				}
f0a0c659fb96b7 Evan Quan 2023-05-08  1457  
f0a0c659fb96b7 Evan Quan 2023-05-08  1458  				od_table->OverDriveTable.UclkFmin = input[i + 1];
f0a0c659fb96b7 Evan Quan 2023-05-08  1459  				od_table->OverDriveTable.FeatureCtrlMask |= 1U << PP_OD_FEATURE_UCLK_BIT;
f0a0c659fb96b7 Evan Quan 2023-05-08  1460  				break;
f0a0c659fb96b7 Evan Quan 2023-05-08  1461  
f0a0c659fb96b7 Evan Quan 2023-05-08  1462  			case 1:
f0a0c659fb96b7 Evan Quan 2023-05-08  1463  				smu_v13_0_0_get_od_setting_limits(smu,
f0a0c659fb96b7 Evan Quan 2023-05-08  1464  								  PP_OD_FEATURE_UCLK_BIT,
f0a0c659fb96b7 Evan Quan 2023-05-08  1465  								  false,
f0a0c659fb96b7 Evan Quan 2023-05-08  1466  								  &minimum,
f0a0c659fb96b7 Evan Quan 2023-05-08  1467  								  &maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1468  				if (input[i + 1] < minimum ||
f0a0c659fb96b7 Evan Quan 2023-05-08  1469  				    input[i + 1] > maximum) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1470  					dev_info(adev->dev, "UclkFmax (%ld) must be within [%u, %u]!\n",
f0a0c659fb96b7 Evan Quan 2023-05-08  1471  						input[i + 1], minimum, maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1472  					return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1473  				}
f0a0c659fb96b7 Evan Quan 2023-05-08  1474  
f0a0c659fb96b7 Evan Quan 2023-05-08  1475  				od_table->OverDriveTable.UclkFmax = input[i + 1];
f0a0c659fb96b7 Evan Quan 2023-05-08  1476  				od_table->OverDriveTable.FeatureCtrlMask |= 1U << PP_OD_FEATURE_UCLK_BIT;
f0a0c659fb96b7 Evan Quan 2023-05-08  1477  				break;
f0a0c659fb96b7 Evan Quan 2023-05-08  1478  
f0a0c659fb96b7 Evan Quan 2023-05-08  1479  			default:
f0a0c659fb96b7 Evan Quan 2023-05-08  1480  				dev_info(adev->dev, "Invalid MCLK_VDDC_TABLE index: %ld\n", input[i]);
f0a0c659fb96b7 Evan Quan 2023-05-08  1481  				dev_info(adev->dev, "Supported indices: [0:min,1:max]\n");
f0a0c659fb96b7 Evan Quan 2023-05-08  1482  				return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1483  			}
f0a0c659fb96b7 Evan Quan 2023-05-08  1484  		}
f0a0c659fb96b7 Evan Quan 2023-05-08  1485  
f0a0c659fb96b7 Evan Quan 2023-05-08  1486  		if (od_table->OverDriveTable.UclkFmin > od_table->OverDriveTable.UclkFmax) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1487  			dev_err(adev->dev,
f0a0c659fb96b7 Evan Quan 2023-05-08  1488  				"Invalid setting: UclkFmin(%u) is bigger than UclkFmax(%u)\n",
f0a0c659fb96b7 Evan Quan 2023-05-08  1489  				(uint32_t)od_table->OverDriveTable.UclkFmin,
f0a0c659fb96b7 Evan Quan 2023-05-08  1490  				(uint32_t)od_table->OverDriveTable.UclkFmax);
f0a0c659fb96b7 Evan Quan 2023-05-08  1491  			return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1492  		}
f0a0c659fb96b7 Evan Quan 2023-05-08  1493  		break;
f0a0c659fb96b7 Evan Quan 2023-05-08  1494  
f0a0c659fb96b7 Evan Quan 2023-05-08  1495  	case PP_OD_EDIT_VDDC_CURVE:
f0a0c659fb96b7 Evan Quan 2023-05-08  1496  		if (!smu_v13_0_0_is_od_feature_supported(smu, PP_OD_FEATURE_GFX_VF_CURVE_BIT)) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1497  			dev_warn(adev->dev, "VF curve setting not supported!\n");
f0a0c659fb96b7 Evan Quan 2023-05-08  1498  			return -ENOTSUPP;
f0a0c659fb96b7 Evan Quan 2023-05-08  1499  		}
f0a0c659fb96b7 Evan Quan 2023-05-08  1500  
f0a0c659fb96b7 Evan Quan 2023-05-08  1501  		if (input[0] >= PP_NUM_OD_VF_CURVE_POINTS ||
f0a0c659fb96b7 Evan Quan 2023-05-08  1502  		    input[0] < 0)
f0a0c659fb96b7 Evan Quan 2023-05-08  1503  			return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1504  
f0a0c659fb96b7 Evan Quan 2023-05-08  1505  		smu_v13_0_0_get_od_setting_limits(smu,
f0a0c659fb96b7 Evan Quan 2023-05-08  1506  						  PP_OD_FEATURE_GFX_VF_CURVE_BIT,
f0a0c659fb96b7 Evan Quan 2023-05-08  1507  						  true,
f0a0c659fb96b7 Evan Quan 2023-05-08  1508  						  &minimum,
f0a0c659fb96b7 Evan Quan 2023-05-08  1509  						  &maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1510  		if (input[1] < minimum ||
f0a0c659fb96b7 Evan Quan 2023-05-08  1511  		    input[1] > maximum) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1512  			dev_info(adev->dev, "Voltage offset (%ld) must be within [%d, %d]!\n",
f0a0c659fb96b7 Evan Quan 2023-05-08  1513  				 input[1], minimum, maximum);
f0a0c659fb96b7 Evan Quan 2023-05-08  1514  			return -EINVAL;
f0a0c659fb96b7 Evan Quan 2023-05-08  1515  		}
f0a0c659fb96b7 Evan Quan 2023-05-08  1516  
f0a0c659fb96b7 Evan Quan 2023-05-08  1517  		od_table->OverDriveTable.VoltageOffsetPerZoneBoundary[input[0]] = input[1];
f0a0c659fb96b7 Evan Quan 2023-05-08  1518  		od_table->OverDriveTable.FeatureCtrlMask |= 1U << PP_OD_FEATURE_GFX_VF_CURVE_BIT;
f0a0c659fb96b7 Evan Quan 2023-05-08  1519  		break;
f0a0c659fb96b7 Evan Quan 2023-05-08  1520  
f0a0c659fb96b7 Evan Quan 2023-05-08  1521  	case PP_OD_RESTORE_DEFAULT_TABLE:
f0a0c659fb96b7 Evan Quan 2023-05-08  1522  		feature_ctrlmask = od_table->OverDriveTable.FeatureCtrlMask;
f0a0c659fb96b7 Evan Quan 2023-05-08  1523  		memcpy(od_table,
f0a0c659fb96b7 Evan Quan 2023-05-08  1524  		       table_context->boot_overdrive_table,
f0a0c659fb96b7 Evan Quan 2023-05-08  1525  		       sizeof(OverDriveTableExternal_t));
f0a0c659fb96b7 Evan Quan 2023-05-08  1526  		od_table->OverDriveTable.FeatureCtrlMask = feature_ctrlmask;
f0a0c659fb96b7 Evan Quan 2023-05-08  1527  		fallthrough;
f0a0c659fb96b7 Evan Quan 2023-05-08  1528  
f0a0c659fb96b7 Evan Quan 2023-05-08  1529  	case PP_OD_COMMIT_DPM_TABLE:
f0a0c659fb96b7 Evan Quan 2023-05-08  1530  		/*
f0a0c659fb96b7 Evan Quan 2023-05-08  1531  		 * The member below instructs PMFW the settings focused in
f0a0c659fb96b7 Evan Quan 2023-05-08  1532  		 * this single operation.
f0a0c659fb96b7 Evan Quan 2023-05-08  1533  		 * `uint32_t FeatureCtrlMask;`
f0a0c659fb96b7 Evan Quan 2023-05-08  1534  		 * It does not contain actual informations about user's custom
f0a0c659fb96b7 Evan Quan 2023-05-08  1535  		 * settings. Thus we do not cache it.
f0a0c659fb96b7 Evan Quan 2023-05-08  1536  		 */
f0a0c659fb96b7 Evan Quan 2023-05-08  1537  		offset_of_featurectrlmask = offsetof(OverDriveTable_t, FeatureCtrlMask);
f0a0c659fb96b7 Evan Quan 2023-05-08 @1538  		if (memcmp(od_table + offset_of_featurectrlmask,
f0a0c659fb96b7 Evan Quan 2023-05-08  1539  			   table_context->user_overdrive_table + offset_of_featurectrlmask,
f0a0c659fb96b7 Evan Quan 2023-05-08  1540  			   sizeof(OverDriveTableExternal_t) - offset_of_featurectrlmask)) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1541  			smu_v13_0_0_dump_od_table(smu, od_table);
f0a0c659fb96b7 Evan Quan 2023-05-08  1542  
f0a0c659fb96b7 Evan Quan 2023-05-08  1543  			ret = smu_v13_0_0_upload_overdrive_table(smu, od_table);
f0a0c659fb96b7 Evan Quan 2023-05-08  1544  			if (ret) {
f0a0c659fb96b7 Evan Quan 2023-05-08  1545  				dev_err(adev->dev, "Failed to upload overdrive table!\n");
f0a0c659fb96b7 Evan Quan 2023-05-08  1546  				return ret;
f0a0c659fb96b7 Evan Quan 2023-05-08  1547  			}
f0a0c659fb96b7 Evan Quan 2023-05-08  1548  
f0a0c659fb96b7 Evan Quan 2023-05-08  1549  			od_table->OverDriveTable.FeatureCtrlMask = 0;
f0a0c659fb96b7 Evan Quan 2023-05-08  1550  			memcpy(table_context->user_overdrive_table + offset_of_featurectrlmask,
f0a0c659fb96b7 Evan Quan 2023-05-08  1551  			       od_table + offset_of_featurectrlmask,
f0a0c659fb96b7 Evan Quan 2023-05-08  1552  			       sizeof(OverDriveTableExternal_t) - offset_of_featurectrlmask);
f0a0c659fb96b7 Evan Quan 2023-05-08  1553  
f0a0c659fb96b7 Evan Quan 2023-05-08  1554  			if (!memcmp(table_context->user_overdrive_table,
f0a0c659fb96b7 Evan Quan 2023-05-08  1555  				    table_context->boot_overdrive_table,
f0a0c659fb96b7 Evan Quan 2023-05-08  1556  				    sizeof(OverDriveTableExternal_t)))
f0a0c659fb96b7 Evan Quan 2023-05-08  1557  				smu->user_dpm_profile.user_od = false;
f0a0c659fb96b7 Evan Quan 2023-05-08  1558  			else
f0a0c659fb96b7 Evan Quan 2023-05-08  1559  				smu->user_dpm_profile.user_od = true;
f0a0c659fb96b7 Evan Quan 2023-05-08  1560  		}
f0a0c659fb96b7 Evan Quan 2023-05-08  1561  		break;
f0a0c659fb96b7 Evan Quan 2023-05-08  1562  
f0a0c659fb96b7 Evan Quan 2023-05-08  1563  	default:
f0a0c659fb96b7 Evan Quan 2023-05-08  1564  		return -ENOSYS;
f0a0c659fb96b7 Evan Quan 2023-05-08  1565  	}
f0a0c659fb96b7 Evan Quan 2023-05-08  1566  
f0a0c659fb96b7 Evan Quan 2023-05-08  1567  	return ret;
f0a0c659fb96b7 Evan Quan 2023-05-08  1568  }
f0a0c659fb96b7 Evan Quan 2023-05-08  1569  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
