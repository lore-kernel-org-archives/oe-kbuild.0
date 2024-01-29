Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416351C30
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 08:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706515304; cv=none; b=bo1bvo5YT/Lt43bF8419RPPnPxLd90kX9BlVmVGk2gyCkFtv0JJ4UtC5kcJ5Yhy88wXkM4GSzrwi4jIcewOqxTQ0GjwRnWjoj2MaL924hmYP6bdtixDMZ4K5ZqOnE8UqZ/cCeC3L6fa4gc4cgdnl3goL3rn1TplunvVEV8VhtGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706515304; c=relaxed/simple;
	bh=7muE9C7zO3fYwtjSUNREWZzZWYto6ALbsxyPnssI/4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iq1Es/E46wJKB8N2PTZ+dKAuo+d+PCDlnognbqyIOX4XGjS7v5VArTc9ecREt/Y2DCqcvZtT/WkfEqORYglmA8pS7oMs3mjrtnfUi4Kz2PfTlXcEGiTna+E7sEYVL2dLNmHQLLPFEfIrrZKaomsv/tNI7EaxG/rDgj6b0MCGNbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dsQTItsW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dsQTItsW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33af4a0beb3so66425f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 00:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706515300; x=1707120100; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aC/surzpEkWEmGAOSpUqfGd5O1uFGSnK9SJH7koMapU=;
        b=dsQTItsWhN0L7dsTweWbdpXY0U4ljgHfZPjXSBpamiP+/sIyExytA/4tk7lPIjs36n
         Vx7Krgwb8A5+SRzmu6O1NZ8kRajjmXWfp/ijfPeHNEYFQHPEgvmtIKdnPM8RWPGVXCSa
         boZuG9WdjMKIMTdk12W3vkMg8Eq7dG7BcaP1sv5khiVLBoKlXqXYtl9eX5eOt75t/lzk
         Nt4U4sUEZ5witEZXnHxEtwpYS+q9yrIAid42JTMeasPrJrRkQS4r+9LNo+ATocCHCIWi
         QVMyiP6RriaqKBxPkZQQfgVkotQc3RBXtDwOIZKxoWbhJBfARq54HGboVi9Zs3AewIX7
         J95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706515300; x=1707120100;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aC/surzpEkWEmGAOSpUqfGd5O1uFGSnK9SJH7koMapU=;
        b=gdJgTxiQHbPvoQHFJbhCB4NNlewyJHCzUpJuOqXtAoh/bRrKIrdQPodQoj4Ju2XM/V
         u4FlM5boK/wEmxzpFzMpK73jCvsyU7bGMMDmmN+8AaSIp/QFGkdVzKFrWUQOrrkaQB/A
         arCu31libPAs4mzzleyHn8CgSASShbmgFAjv7Snc69/u27fk3m2P0YqiiDfpVYcOlFlX
         Ca6392PaoQDg2jz6za4LwJvSQ7jJIabuUR81+XvYjhGlZObgrIF+UwrYl1vjZQCfUBLs
         W3iPR+k0ecNnFVpbF2iobEfEcxDQpbDhhR4VQRy6EfFW48HJegvT5y1PUiTzqsUgAtzc
         k+Mg==
X-Gm-Message-State: AOJu0YxY3Om5AwL5AHY/lGsX7Bc29jT62VunypKM2nIXAaQZWkyfhsW5
	kVH8KO5ksRvwIVLbMwvKGZlHE92wskFX+R5pDbxTUeNIEaKItZSnzmsgfYkOBcMoDl4IJiLtVY6
	bcKRj4A==
X-Google-Smtp-Source: AGHT+IHUJKbuZFfd3FMiMJe41O2D1CnqiTJrXcd1bUjPcdwQR4oWGUt/OcX0EFfLc8AUwGQj9DRceg==
X-Received: by 2002:a05:6000:402a:b0:33a:e525:b15 with SMTP id cp42-20020a056000402a00b0033ae5250b15mr3592681wrb.19.1706515299699;
        Mon, 29 Jan 2024 00:01:39 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id m6-20020a056000008600b00337d2d1e0ecsm7336226wrx.104.2024.01.29.00.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 00:01:39 -0800 (PST)
Date: Mon, 29 Jan 2024 11:01:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27108/30000]
 arch/x86/events/zhaoxin/uncore.c:1608 uncore_pci_probe() warn: possible
 memory leak of 'boxes'
Message-ID: <1f51776d-7a8e-486b-86c9-e18caaa35974@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bb2503a5fcdf7f51d403ab34440c497acef3b4e7
commit: 2bb7fd043b4123c569fbbde1f18e98d7565a4997 [27108/30000] x86/perf: Update PMU support for more Zhaoxin CPU
config: x86_64-randconfig-161-20240124 (https://download.01.org/0day-ci/archive/20240127/202401270704.T1EAEEJC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401270704.T1EAEEJC-lkp@intel.com/

New smatch warnings:
arch/x86/events/zhaoxin/uncore.c:1608 uncore_pci_probe() warn: possible memory leak of 'boxes'

vim +/boxes +1608 arch/x86/events/zhaoxin/uncore.c

2bb7fd043b4123 leoliu-oc 2023-10-26  1571  static int uncore_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
2bb7fd043b4123 leoliu-oc 2023-10-26  1572  {
2bb7fd043b4123 leoliu-oc 2023-10-26  1573  	struct zhaoxin_uncore_type *type;
2bb7fd043b4123 leoliu-oc 2023-10-26  1574  	struct zhaoxin_uncore_pmu *pmu;
2bb7fd043b4123 leoliu-oc 2023-10-26  1575  	struct zhaoxin_uncore_box *box;
2bb7fd043b4123 leoliu-oc 2023-10-26  1576  	struct zhaoxin_uncore_box **boxes;
2bb7fd043b4123 leoliu-oc 2023-10-26  1577  
2bb7fd043b4123 leoliu-oc 2023-10-26  1578  	int loop, i, j = 0;
2bb7fd043b4123 leoliu-oc 2023-10-26  1579  
2bb7fd043b4123 leoliu-oc 2023-10-26  1580  	int subnode_id, ret = 0;
2bb7fd043b4123 leoliu-oc 2023-10-26  1581  
2bb7fd043b4123 leoliu-oc 2023-10-26  1582  	subnode_id = uncore_pcibus_to_subnodeid(pdev->bus);
2bb7fd043b4123 leoliu-oc 2023-10-26  1583  	if (subnode_id < 0)
2bb7fd043b4123 leoliu-oc 2023-10-26  1584  		return -EINVAL;
2bb7fd043b4123 leoliu-oc 2023-10-26  1585  
2bb7fd043b4123 leoliu-oc 2023-10-26  1586  	type = uncore_pci_uncores[UNCORE_PCI_DEV_TYPE(id->driver_data)];
2bb7fd043b4123 leoliu-oc 2023-10-26  1587  
2bb7fd043b4123 leoliu-oc 2023-10-26  1588  	if (!strcmp(type->name, "mc0"))
2bb7fd043b4123 leoliu-oc 2023-10-26  1589  		loop = 2;
2bb7fd043b4123 leoliu-oc 2023-10-26  1590  	else
2bb7fd043b4123 leoliu-oc 2023-10-26  1591  		loop = 1;
2bb7fd043b4123 leoliu-oc 2023-10-26  1592  
2bb7fd043b4123 leoliu-oc 2023-10-26  1593  	boxes = kzalloc(loop * sizeof(struct zhaoxin_uncore_box *), GFP_KERNEL);
2bb7fd043b4123 leoliu-oc 2023-10-26  1594  
2bb7fd043b4123 leoliu-oc 2023-10-26  1595  	for (i = 0; i < loop; i++) {
2bb7fd043b4123 leoliu-oc 2023-10-26  1596  		type = uncore_pci_uncores[UNCORE_PCI_DEV_TYPE(id->driver_data) + j];
2bb7fd043b4123 leoliu-oc 2023-10-26  1597  
2bb7fd043b4123 leoliu-oc 2023-10-26  1598  		if (!type)
2bb7fd043b4123 leoliu-oc 2023-10-26  1599  			continue;
2bb7fd043b4123 leoliu-oc 2023-10-26  1600  		/*
2bb7fd043b4123 leoliu-oc 2023-10-26  1601  		 * for performance monitoring unit with multiple boxes,
2bb7fd043b4123 leoliu-oc 2023-10-26  1602  		 * each box has a different function id.
2bb7fd043b4123 leoliu-oc 2023-10-26  1603  		 */
2bb7fd043b4123 leoliu-oc 2023-10-26  1604  
2bb7fd043b4123 leoliu-oc 2023-10-26  1605  		pmu = &type->pmus[UNCORE_PCI_DEV_IDX(id->driver_data)];
2bb7fd043b4123 leoliu-oc 2023-10-26  1606  
2bb7fd043b4123 leoliu-oc 2023-10-26  1607  		if (WARN_ON_ONCE(pmu->boxes[subnode_id] != NULL))
2bb7fd043b4123 leoliu-oc 2023-10-26 @1608  			return -EINVAL;

Static checker wants some cleanup before returning.

2bb7fd043b4123 leoliu-oc 2023-10-26  1609  		box = uncore_alloc_box(type, NUMA_NO_NODE);
2bb7fd043b4123 leoliu-oc 2023-10-26  1610  		if (!box)
2bb7fd043b4123 leoliu-oc 2023-10-26  1611  			return -ENOMEM;
2bb7fd043b4123 leoliu-oc 2023-10-26  1612  
2bb7fd043b4123 leoliu-oc 2023-10-26  1613  		if (pmu->func_id < 0)
2bb7fd043b4123 leoliu-oc 2023-10-26  1614  			pmu->func_id = pdev->devfn;
2bb7fd043b4123 leoliu-oc 2023-10-26  1615  		else
2bb7fd043b4123 leoliu-oc 2023-10-26  1616  			WARN_ON_ONCE(pmu->func_id != pdev->devfn);
2bb7fd043b4123 leoliu-oc 2023-10-26  1617  
2bb7fd043b4123 leoliu-oc 2023-10-26  1618  		atomic_inc(&box->refcnt);
2bb7fd043b4123 leoliu-oc 2023-10-26  1619  		box->subnode_id = subnode_id;
2bb7fd043b4123 leoliu-oc 2023-10-26  1620  		box->pci_dev = pdev;
2bb7fd043b4123 leoliu-oc 2023-10-26  1621  		box->pmu = pmu;
2bb7fd043b4123 leoliu-oc 2023-10-26  1622  		uncore_box_init(box);
2bb7fd043b4123 leoliu-oc 2023-10-26  1623  		boxes[i] = box;
2bb7fd043b4123 leoliu-oc 2023-10-26  1624  
2bb7fd043b4123 leoliu-oc 2023-10-26  1625  		pci_set_drvdata(pdev, boxes);
2bb7fd043b4123 leoliu-oc 2023-10-26  1626  		pmu->boxes[subnode_id] = box;
2bb7fd043b4123 leoliu-oc 2023-10-26  1627  		if (atomic_inc_return(&pmu->activeboxes) > 1) {
2bb7fd043b4123 leoliu-oc 2023-10-26  1628  			if (!strcmp(type->name, "mc0"))
2bb7fd043b4123 leoliu-oc 2023-10-26  1629  				goto next_loop;
2bb7fd043b4123 leoliu-oc 2023-10-26  1630  			else
2bb7fd043b4123 leoliu-oc 2023-10-26  1631  				return 0;
2bb7fd043b4123 leoliu-oc 2023-10-26  1632  		}
2bb7fd043b4123 leoliu-oc 2023-10-26  1633  		/* First active box registers the pmu */
2bb7fd043b4123 leoliu-oc 2023-10-26  1634  		ret = uncore_pmu_register(pmu);
2bb7fd043b4123 leoliu-oc 2023-10-26  1635  		if (ret) {
2bb7fd043b4123 leoliu-oc 2023-10-26  1636  			pci_set_drvdata(pdev, NULL);
2bb7fd043b4123 leoliu-oc 2023-10-26  1637  			pmu->boxes[subnode_id] = NULL;
2bb7fd043b4123 leoliu-oc 2023-10-26  1638  			uncore_box_exit(box);
2bb7fd043b4123 leoliu-oc 2023-10-26  1639  			kfree(box);

The cleanup here looks nice.

2bb7fd043b4123 leoliu-oc 2023-10-26  1640  		}
2bb7fd043b4123 leoliu-oc 2023-10-26  1641  next_loop:
2bb7fd043b4123 leoliu-oc 2023-10-26  1642  		j++;
2bb7fd043b4123 leoliu-oc 2023-10-26  1643  	}
2bb7fd043b4123 leoliu-oc 2023-10-26  1644  	return ret;
2bb7fd043b4123 leoliu-oc 2023-10-26  1645  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

