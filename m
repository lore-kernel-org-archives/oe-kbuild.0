Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF022B641
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729809571; cv=none; b=XJvTFwWcC/qRQulUvSFYhUalhLMPT51idonnTUPZufPddeZ0VZ9MldrLlMKrFjPZxGywCcwneWoMg+6yz7lDHr4qdDdynpFsPgS39d9ENIxGpPmRnEPn9t6RGZkdl3vfHPUAzZsNG2loz86lorSPpSsWFYw+WUXaZhiEE6WnSU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729809571; c=relaxed/simple;
	bh=xXbS4v4zsBQUqQ4eD0/HKqbd2vMgYOhkuklFXs0Kmz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2fNPWlHn8eJt+wdHxgQ9UIwvgw4fSkFNq7OHEPeQ/f5ebo/aCyyYMAcN2tnHStx/Dl887f6XtskW46U0wkLsJSVApTk5FBLKxsc3he+Us1/vK0bHFSyAldyopRkv7fit/NJhYWCgYceSxFK8jEFd4Ssiv1BkurwOUq1PefyZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H82HY/T1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H82HY/T1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729809568; x=1761345568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xXbS4v4zsBQUqQ4eD0/HKqbd2vMgYOhkuklFXs0Kmz0=;
  b=H82HY/T1fyPZXiR5Rzxc8QvKul7VCvEvU8DV5ndkj1iXal/xQKzjjNvv
   a9Ki0Aqd7z7BabCtr4e623bBcoAIZEVP/FHRlbuCEVPUu61fpPrEdx4DF
   w9Q1dBodfUsMiBmUJDYfFGQfWd3jtx+8+kgitT4oRaeQLkldrIyjdNNgj
   6J1jIrYfDxLFm7WnuPAYPM6U7FbqZHpZ0Q7AB4MYQTrxpZHVZlKgCfWbc
   QmaAfe1qSOI3FLghHEHOQj7Azb4SLfgPvs1o/dTP5UHmP1gOeE6B+xZ5W
   WU21td/BBXLIpcABMZ8ZYTBW7sj/kM7TAQnz8bcBqdrJcuklDdfjIjdZd
   g==;
X-CSE-ConnectionGUID: beTlKuwuQTOYiLWMfSWuEg==
X-CSE-MsgGUID: lzAkQMXzTFmGCGKxYKvkFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54869948"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="54869948"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 15:39:27 -0700
X-CSE-ConnectionGUID: 358lc29qQZq/l9CowRwkEA==
X-CSE-MsgGUID: z57uu2DrTTWvL0vYF2ZBUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80643467"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Oct 2024 15:39:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t46UF-000XEd-2R;
	Thu, 24 Oct 2024 22:39:23 +0000
Date: Fri, 25 Oct 2024 06:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:645
 mt7925_load_clc() error: buffer overflow 'phy->clc' 2 <= 2
Message-ID: <202410250608.Ly4Aj2NI-lkp@intel.com>
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
TO: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4e46774408d942efe4eb35dc62e5af3af71b9a30
commit: 9679ca7326e52282cc923c4d71d81c999cb6cd55 wifi: mt76: mt7925: fix a potential array-index-out-of-bounds issue for clc
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250608.Ly4Aj2NI-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410250608.Ly4Aj2NI-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:645 mt7925_load_clc() error: buffer overflow 'phy->clc' 2 <= 2

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:648 mt7925_load_clc() error: buffer overflow 'phy->clc' 2 <= 2
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:652 mt7925_load_clc() error: buffer overflow 'phy->clc' 2 <= 2
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:1158 mt7925_mcu_set_mlo_roc() warn: variable dereferenced before check 'mconf' (see line 1130)

vim +645 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

c948b5da6bbec7 Deren Wu       2023-09-18  588  
c948b5da6bbec7 Deren Wu       2023-09-18  589  static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
c948b5da6bbec7 Deren Wu       2023-09-18  590  {
c948b5da6bbec7 Deren Wu       2023-09-18  591  	const struct mt76_connac2_fw_trailer *hdr;
c948b5da6bbec7 Deren Wu       2023-09-18  592  	const struct mt76_connac2_fw_region *region;
c948b5da6bbec7 Deren Wu       2023-09-18  593  	const struct mt7925_clc *clc;
c948b5da6bbec7 Deren Wu       2023-09-18  594  	struct mt76_dev *mdev = &dev->mt76;
c948b5da6bbec7 Deren Wu       2023-09-18  595  	struct mt792x_phy *phy = &dev->phy;
c948b5da6bbec7 Deren Wu       2023-09-18  596  	const struct firmware *fw;
c948b5da6bbec7 Deren Wu       2023-09-18  597  	int ret, i, len, offset = 0;
c948b5da6bbec7 Deren Wu       2023-09-18  598  	u8 *clc_base = NULL;
c948b5da6bbec7 Deren Wu       2023-09-18  599  
c948b5da6bbec7 Deren Wu       2023-09-18  600  	if (mt7925_disable_clc ||
c948b5da6bbec7 Deren Wu       2023-09-18  601  	    mt76_is_usb(&dev->mt76))
c948b5da6bbec7 Deren Wu       2023-09-18  602  		return 0;
c948b5da6bbec7 Deren Wu       2023-09-18  603  
c948b5da6bbec7 Deren Wu       2023-09-18  604  	ret = request_firmware(&fw, fw_name, mdev->dev);
c948b5da6bbec7 Deren Wu       2023-09-18  605  	if (ret)
c948b5da6bbec7 Deren Wu       2023-09-18  606  		return ret;
c948b5da6bbec7 Deren Wu       2023-09-18  607  
c948b5da6bbec7 Deren Wu       2023-09-18  608  	if (!fw || !fw->data || fw->size < sizeof(*hdr)) {
c948b5da6bbec7 Deren Wu       2023-09-18  609  		dev_err(mdev->dev, "Invalid firmware\n");
c948b5da6bbec7 Deren Wu       2023-09-18  610  		ret = -EINVAL;
c948b5da6bbec7 Deren Wu       2023-09-18  611  		goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  612  	}
c948b5da6bbec7 Deren Wu       2023-09-18  613  
c948b5da6bbec7 Deren Wu       2023-09-18  614  	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
c948b5da6bbec7 Deren Wu       2023-09-18  615  	for (i = 0; i < hdr->n_region; i++) {
c948b5da6bbec7 Deren Wu       2023-09-18  616  		region = (const void *)((const u8 *)hdr -
c948b5da6bbec7 Deren Wu       2023-09-18  617  					(hdr->n_region - i) * sizeof(*region));
c948b5da6bbec7 Deren Wu       2023-09-18  618  		len = le32_to_cpu(region->len);
c948b5da6bbec7 Deren Wu       2023-09-18  619  
c948b5da6bbec7 Deren Wu       2023-09-18  620  		/* check if we have valid buffer size */
c948b5da6bbec7 Deren Wu       2023-09-18  621  		if (offset + len > fw->size) {
c948b5da6bbec7 Deren Wu       2023-09-18  622  			dev_err(mdev->dev, "Invalid firmware region\n");
c948b5da6bbec7 Deren Wu       2023-09-18  623  			ret = -EINVAL;
c948b5da6bbec7 Deren Wu       2023-09-18  624  			goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  625  		}
c948b5da6bbec7 Deren Wu       2023-09-18  626  
c948b5da6bbec7 Deren Wu       2023-09-18  627  		if ((region->feature_set & FW_FEATURE_NON_DL) &&
c948b5da6bbec7 Deren Wu       2023-09-18  628  		    region->type == FW_TYPE_CLC) {
c948b5da6bbec7 Deren Wu       2023-09-18  629  			clc_base = (u8 *)(fw->data + offset);
c948b5da6bbec7 Deren Wu       2023-09-18  630  			break;
c948b5da6bbec7 Deren Wu       2023-09-18  631  		}
c948b5da6bbec7 Deren Wu       2023-09-18  632  		offset += len;
c948b5da6bbec7 Deren Wu       2023-09-18  633  	}
c948b5da6bbec7 Deren Wu       2023-09-18  634  
c948b5da6bbec7 Deren Wu       2023-09-18  635  	if (!clc_base)
c948b5da6bbec7 Deren Wu       2023-09-18  636  		goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  637  
c948b5da6bbec7 Deren Wu       2023-09-18  638  	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
c948b5da6bbec7 Deren Wu       2023-09-18  639  		clc = (const struct mt7925_clc *)(clc_base + offset);
c948b5da6bbec7 Deren Wu       2023-09-18  640  
9679ca7326e522 Ming Yen Hsieh 2024-08-19  641  		if (clc->idx > ARRAY_SIZE(phy->clc))
9679ca7326e522 Ming Yen Hsieh 2024-08-19  642  			break;
9679ca7326e522 Ming Yen Hsieh 2024-08-19  643  
c948b5da6bbec7 Deren Wu       2023-09-18  644  		/* do not init buf again if chip reset triggered */
c948b5da6bbec7 Deren Wu       2023-09-18 @645  		if (phy->clc[clc->idx])
c948b5da6bbec7 Deren Wu       2023-09-18  646  			continue;
c948b5da6bbec7 Deren Wu       2023-09-18  647  
c948b5da6bbec7 Deren Wu       2023-09-18  648  		phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
c948b5da6bbec7 Deren Wu       2023-09-18  649  						  le32_to_cpu(clc->len),
c948b5da6bbec7 Deren Wu       2023-09-18  650  						  GFP_KERNEL);
c948b5da6bbec7 Deren Wu       2023-09-18  651  
c948b5da6bbec7 Deren Wu       2023-09-18  652  		if (!phy->clc[clc->idx]) {
c948b5da6bbec7 Deren Wu       2023-09-18  653  			ret = -ENOMEM;
c948b5da6bbec7 Deren Wu       2023-09-18  654  			goto out;
c948b5da6bbec7 Deren Wu       2023-09-18  655  		}
c948b5da6bbec7 Deren Wu       2023-09-18  656  	}
c948b5da6bbec7 Deren Wu       2023-09-18  657  
c948b5da6bbec7 Deren Wu       2023-09-18  658  	ret = mt7925_mcu_set_clc(dev, "00", ENVIRON_INDOOR);
c948b5da6bbec7 Deren Wu       2023-09-18  659  out:
c948b5da6bbec7 Deren Wu       2023-09-18  660  	release_firmware(fw);
c948b5da6bbec7 Deren Wu       2023-09-18  661  
c948b5da6bbec7 Deren Wu       2023-09-18  662  	return ret;
c948b5da6bbec7 Deren Wu       2023-09-18  663  }
c948b5da6bbec7 Deren Wu       2023-09-18  664  

:::::: The code at line 645 was first introduced by commit
:::::: c948b5da6bbec742b433138e3e3f9537a85af2e5 wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips

:::::: TO: Deren Wu <deren.wu@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
