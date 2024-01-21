Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFEF3770F
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jan 2024 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705853901; cv=none; b=Ns/+cCXFv7/oNNt7NXOtdBj+sc5SAhpn/0+ho1LqrIo27vnRKfXBEiiDPU97VBObzWxxcepbmGuGVCo7gDFTsPqlgsyNEjpEhecx6shwY0FNx27bHSpkz1wJmtvtUDENGebx9KdtAx1YJKTi4TcJLxTGmGgqLNm6J0z+NvwX1oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705853901; c=relaxed/simple;
	bh=uK4rdLxb5uf/9HbvIqMT8eDew+J2Td0z4eHtbdh6mQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtvLX0pHbJzsSWixumOsSYnq4CsDdRcHqXvjn30b351Kdr2cvHsV9Ek29HY0531SsTCnFGDf6uwyKxR5g85fkQsOIAKMSFYXCjfULZjOytoI3U+9J49GNDnOHAmN/ej4M4SyzK6NWDQSOvhwk2sSIhIt3JgpCDv2nuZz7n5EOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDkfNk1m; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDkfNk1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705853900; x=1737389900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uK4rdLxb5uf/9HbvIqMT8eDew+J2Td0z4eHtbdh6mQI=;
  b=EDkfNk1mBCt1HF6hnu5GMGw9OkLzNnvqPbTu46f7zcQijWH0gnb1gWrs
   DO+Fs9By8/V9ejwwQ3GkimARR7a3rPMn8W2b3bk//JB4i0H9u/chPjOJf
   tb0kYunGr7tNsXUk7s0FbF+ZTPVH3rHKvQuKQ36eoptIcJBXRebL4Ckrc
   BxBxtURXzZ4yrQ3s4Iciyxfx3/0WXbs8B04fQKL0a+J4wKfBDr5DCh462
   082MNf8gL/yIN4EfNobf2pEDjiT3dON7KdcONigYZeh/1NemCPSv6FD1t
   +ONbqqPJLD2T0F8clg0k14jC9Q5qgV63h8v6miIlhmjInFI8ej/Popadb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7800621"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="7800621"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 08:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="785463702"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="785463702"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jan 2024 08:18:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRaWT-00062b-1D;
	Sun, 21 Jan 2024 16:18:13 +0000
Date: Mon, 22 Jan 2024 00:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:553
 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'dev->mt76.wcid'
 [w] (local cap)
Message-ID: <202401220036.tfRdgeGM-lkp@intel.com>
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
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>
CC: Sujuan Chen <sujuan.chen@mediatek.com>
CC: Bo Jiao <Bo.Jiao@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a396820222d6d4c02057f41658b162bdcdadd0e
commit: a5d028d668360db991e6da67cd48b9b4443198ed wifi: mt76: mt7996: add wed rro delete session garbage collector
date:   6 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-161-20240120 (https://download.01.org/0day-ci/archive/20240122/202401220036.tfRdgeGM-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401220036.tfRdgeGM-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:553 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'dev->mt76.wcid' [w] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:560 mt7996_mcu_wed_rro_event() warn: potential spectre issue 'wcid->aggr' [w] (local cap)

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:347 mt7996_mcu_rx_radar_detected() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:349 mt7996_mcu_rx_radar_detected() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:429 mt7996_mcu_ie_countdown() warn: potential spectre issue 'dev->mt76.phys' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:436 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:441 mt7996_mcu_ie_countdown() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2300 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'sub_elem->data' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:2292 mt7996_mcu_beacon_mbss() warn: potential spectre issue 'elem->data' [r] (local cap)

vim +553 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c

98686cd21624c75 Shayne Chen      2022-11-22  528  
a5d028d668360db Lorenzo Bianconi 2023-10-20  529  static void
a5d028d668360db Lorenzo Bianconi 2023-10-20  530  mt7996_mcu_wed_rro_event(struct mt7996_dev *dev, struct sk_buff *skb)
a5d028d668360db Lorenzo Bianconi 2023-10-20  531  {
a5d028d668360db Lorenzo Bianconi 2023-10-20  532  	struct mt7996_mcu_wed_rro_event *event = (void *)skb->data;
a5d028d668360db Lorenzo Bianconi 2023-10-20  533  
a5d028d668360db Lorenzo Bianconi 2023-10-20  534  	if (!dev->has_rro)
a5d028d668360db Lorenzo Bianconi 2023-10-20  535  		return;
a5d028d668360db Lorenzo Bianconi 2023-10-20  536  
a5d028d668360db Lorenzo Bianconi 2023-10-20  537  	skb_pull(skb, sizeof(struct mt7996_mcu_rxd) + 4);
a5d028d668360db Lorenzo Bianconi 2023-10-20  538  
a5d028d668360db Lorenzo Bianconi 2023-10-20  539  	switch (le16_to_cpu(event->tag)) {
a5d028d668360db Lorenzo Bianconi 2023-10-20  540  	case UNI_WED_RRO_BA_SESSION_STATUS: {
a5d028d668360db Lorenzo Bianconi 2023-10-20  541  		struct mt7996_mcu_wed_rro_ba_event *e;
a5d028d668360db Lorenzo Bianconi 2023-10-20  542  
a5d028d668360db Lorenzo Bianconi 2023-10-20  543  		while (skb->len >= sizeof(*e)) {
a5d028d668360db Lorenzo Bianconi 2023-10-20  544  			struct mt76_rx_tid *tid;
a5d028d668360db Lorenzo Bianconi 2023-10-20  545  			struct mt76_wcid *wcid;
a5d028d668360db Lorenzo Bianconi 2023-10-20  546  			u16 idx;
a5d028d668360db Lorenzo Bianconi 2023-10-20  547  
a5d028d668360db Lorenzo Bianconi 2023-10-20  548  			e = (void *)skb->data;
a5d028d668360db Lorenzo Bianconi 2023-10-20  549  			idx = le16_to_cpu(e->wlan_id);
a5d028d668360db Lorenzo Bianconi 2023-10-20  550  			if (idx >= ARRAY_SIZE(dev->mt76.wcid))
a5d028d668360db Lorenzo Bianconi 2023-10-20  551  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  552  
a5d028d668360db Lorenzo Bianconi 2023-10-20 @553  			wcid = rcu_dereference(dev->mt76.wcid[idx]);
a5d028d668360db Lorenzo Bianconi 2023-10-20  554  			if (!wcid || !wcid->sta)
a5d028d668360db Lorenzo Bianconi 2023-10-20  555  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  556  
a5d028d668360db Lorenzo Bianconi 2023-10-20  557  			if (e->tid >= ARRAY_SIZE(wcid->aggr))
a5d028d668360db Lorenzo Bianconi 2023-10-20  558  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  559  
a5d028d668360db Lorenzo Bianconi 2023-10-20 @560  			tid = rcu_dereference(wcid->aggr[e->tid]);
a5d028d668360db Lorenzo Bianconi 2023-10-20  561  			if (!tid)
a5d028d668360db Lorenzo Bianconi 2023-10-20  562  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  563  
a5d028d668360db Lorenzo Bianconi 2023-10-20  564  			tid->id = le16_to_cpu(e->id);
a5d028d668360db Lorenzo Bianconi 2023-10-20  565  			skb_pull(skb, sizeof(*e));
a5d028d668360db Lorenzo Bianconi 2023-10-20  566  		}
a5d028d668360db Lorenzo Bianconi 2023-10-20  567  		break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  568  	}
a5d028d668360db Lorenzo Bianconi 2023-10-20  569  	case UNI_WED_RRO_BA_SESSION_DELETE: {
a5d028d668360db Lorenzo Bianconi 2023-10-20  570  		struct mt7996_mcu_wed_rro_ba_delete_event *e;
a5d028d668360db Lorenzo Bianconi 2023-10-20  571  
a5d028d668360db Lorenzo Bianconi 2023-10-20  572  		while (skb->len >= sizeof(*e)) {
a5d028d668360db Lorenzo Bianconi 2023-10-20  573  			struct mt7996_wed_rro_session_id *session;
a5d028d668360db Lorenzo Bianconi 2023-10-20  574  
a5d028d668360db Lorenzo Bianconi 2023-10-20  575  			e = (void *)skb->data;
a5d028d668360db Lorenzo Bianconi 2023-10-20  576  			session = kzalloc(sizeof(*session), GFP_ATOMIC);
a5d028d668360db Lorenzo Bianconi 2023-10-20  577  			if (!session)
a5d028d668360db Lorenzo Bianconi 2023-10-20  578  				break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  579  
a5d028d668360db Lorenzo Bianconi 2023-10-20  580  			session->id = le16_to_cpu(e->session_id);
a5d028d668360db Lorenzo Bianconi 2023-10-20  581  
a5d028d668360db Lorenzo Bianconi 2023-10-20  582  			spin_lock_bh(&dev->wed_rro.lock);
a5d028d668360db Lorenzo Bianconi 2023-10-20  583  			list_add_tail(&session->list, &dev->wed_rro.poll_list);
a5d028d668360db Lorenzo Bianconi 2023-10-20  584  			spin_unlock_bh(&dev->wed_rro.lock);
a5d028d668360db Lorenzo Bianconi 2023-10-20  585  
a5d028d668360db Lorenzo Bianconi 2023-10-20  586  			ieee80211_queue_work(mt76_hw(dev), &dev->wed_rro.work);
a5d028d668360db Lorenzo Bianconi 2023-10-20  587  			skb_pull(skb, sizeof(*e));
a5d028d668360db Lorenzo Bianconi 2023-10-20  588  		}
a5d028d668360db Lorenzo Bianconi 2023-10-20  589  		break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  590  	}
a5d028d668360db Lorenzo Bianconi 2023-10-20  591  	default:
a5d028d668360db Lorenzo Bianconi 2023-10-20  592  		break;
a5d028d668360db Lorenzo Bianconi 2023-10-20  593  	}
a5d028d668360db Lorenzo Bianconi 2023-10-20  594  }
a5d028d668360db Lorenzo Bianconi 2023-10-20  595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
