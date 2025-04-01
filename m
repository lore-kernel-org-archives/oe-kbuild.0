Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665C21A7253
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Apr 2025 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743533243; cv=none; b=maok2vRUH3w4rPKyaom0Llw0f64+xmXksFV4V2c94QlcxZW5Yj+GykJNIGH98fFygAogqMjxZutXd/rHu+fSVNUo1D+qkdjE0Kozdf0gFdrbc5fCc9v1ehho2BBKhEmiRc1czUPVql9hf+ZIvYTl+lfAwz4TkjW7xE1lLU/MZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743533243; c=relaxed/simple;
	bh=Hw5kBdmZurWdY9CKbYTRIVY8JJDQ9r347DjfObWyh/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Roo6JQzLfbrYOY29xU9PCt+bUIk8Ye49qy3+P4LmG2wZ1cO639t+ox3fozBN74nZRCTqN4v8WmsAhvypyEuIwUiuh5Da2vwWx8G6xBO+ExOXiSBzFPI8IMIdv2r69mK3Ks9rlisDGuTEiX7LayQ6dElCgEaUm7jIGusX2CpgCxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0zvVgfq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0zvVgfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743533241; x=1775069241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hw5kBdmZurWdY9CKbYTRIVY8JJDQ9r347DjfObWyh/g=;
  b=R0zvVgfqKOvoFBlYIjPKwHQHOxRRUdyLgysyFES1QnO59HaX1syThBSV
   T5oHLizSCmSDWHd5HMdDHwg2WKQVRcjLEWjr06EMhlE9NpJOzfweMV8eI
   UeXJS4ysAbI7thdQRtazt+tTuTWi8J8WTz39MVJD0IyboMlJ1l1o+RaG8
   Mb6sp8DUXPqRqhFYs5jGX63GJlvO2FHyU0oS6jgqCYSoKdfTNCBrG0g3M
   YUxaDX+ZkW88LO1F2xFF4dta6MqyIdkHm9QzkSGQ5pOQjxyphTJAKBnBz
   6AFdYxZ8yfAeS37Ru40xU3ZZ2lrzXGlmsMTQfmpsYtSP5sw74I4CpFmuX
   Q==;
X-CSE-ConnectionGUID: TJHD7yB+QEydZ3rxqtGSLw==
X-CSE-MsgGUID: GSdCDFk9RGqM/a7TfOxiOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44999471"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="44999471"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 11:47:21 -0700
X-CSE-ConnectionGUID: 2UVA2TuPQVSoLXZ+7aD5zg==
X-CSE-MsgGUID: Ftfcw2KNSAO9xz6xSy4tHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="157457101"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2025 11:47:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzgdp-000A4R-2E;
	Tue, 01 Apr 2025 18:47:17 +0000
Date: Wed, 2 Apr 2025 02:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:394
 mt76_connac_mcu_sta_basic_tlv() warn: variable dereferenced before check
 'link_conf' (see line 376)
Message-ID: <202504020259.UUcutDoR-lkp@intel.com>
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
TO: Shayne Chen <shayne.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08733088b566b58283f0f12fb73f5db6a9a9de30
commit: 9890624c1b3948c1c7f1d0e19ef0bb7680b8c80d wifi: mt76: Check link_conf pointer in mt76_connac_mcu_sta_basic_tlv()
date:   13 days ago
:::::: branch date: 17 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20250401 (https://download.01.org/0day-ci/archive/20250402/202504020259.UUcutDoR-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504020259.UUcutDoR-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:394 mt76_connac_mcu_sta_basic_tlv() warn: variable dereferenced before check 'link_conf' (see line 376)

vim +/link_conf +394 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c

54735e1198234d Lorenzo Bianconi 2021-12-23  370  
1b83d17ccece7d Sean Wang        2023-03-08  371  void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
96fcecd9ba81a6 Felix Fietkau    2025-01-02  372  				   struct ieee80211_bss_conf *link_conf,
6e226666efc06d Sean Wang        2024-06-12  373  				   struct ieee80211_link_sta *link_sta,
8a977b3f9624e8 Felix Fietkau    2024-08-27  374  				   int conn_state, bool newly)
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  375  {
96fcecd9ba81a6 Felix Fietkau    2025-01-02 @376  	struct ieee80211_vif *vif = link_conf->vif;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  377  	struct sta_rec_basic *basic;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  378  	struct tlv *tlv;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  379  	int conn_type;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  380  
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  381  	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_BASIC, sizeof(*basic));
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  382  
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  383  	basic = (struct sta_rec_basic *)tlv;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  384  	basic->extra_info = cpu_to_le16(EXTRA_INFO_VER);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  385  
8a977b3f9624e8 Felix Fietkau    2024-08-27  386  	if (newly && conn_state != CONN_STATE_DISCONNECT)
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  387  		basic->extra_info |= cpu_to_le16(EXTRA_INFO_NEW);
8a977b3f9624e8 Felix Fietkau    2024-08-27  388  	basic->conn_state = conn_state;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  389  
6e226666efc06d Sean Wang        2024-06-12  390  	if (!link_sta) {
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  391  		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_BC);
51b795d68cade3 Shayne Chen      2024-03-20  392  
51b795d68cade3 Shayne Chen      2024-03-20  393  		if (vif->type == NL80211_IFTYPE_STATION &&
9890624c1b3948 Shayne Chen      2025-03-11 @394  		    link_conf && !is_zero_ether_addr(link_conf->bssid)) {
96fcecd9ba81a6 Felix Fietkau    2025-01-02  395  			memcpy(basic->peer_addr, link_conf->bssid, ETH_ALEN);
51b795d68cade3 Shayne Chen      2024-03-20  396  			basic->aid = cpu_to_le16(vif->cfg.aid);
51b795d68cade3 Shayne Chen      2024-03-20  397  		} else {
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  398  			eth_broadcast_addr(basic->peer_addr);
51b795d68cade3 Shayne Chen      2024-03-20  399  		}
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  400  		return;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  401  	}
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  402  
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  403  	switch (vif->type) {
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  404  	case NL80211_IFTYPE_MESH_POINT:
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  405  	case NL80211_IFTYPE_AP:
1b83d17ccece7d Sean Wang        2023-03-08  406  		if (vif->p2p && !is_mt7921(dev))
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  407  			conn_type = CONNECTION_P2P_GC;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  408  		else
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  409  			conn_type = CONNECTION_INFRA_STA;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  410  		basic->conn_type = cpu_to_le32(conn_type);
6e226666efc06d Sean Wang        2024-06-12  411  		basic->aid = cpu_to_le16(link_sta->sta->aid);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  412  		break;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  413  	case NL80211_IFTYPE_STATION:
1b83d17ccece7d Sean Wang        2023-03-08  414  		if (vif->p2p && !is_mt7921(dev))
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  415  			conn_type = CONNECTION_P2P_GO;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  416  		else
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  417  			conn_type = CONNECTION_INFRA_AP;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  418  		basic->conn_type = cpu_to_le32(conn_type);
f276e20b182dbf Johannes Berg    2022-05-10  419  		basic->aid = cpu_to_le16(vif->cfg.aid);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  420  		break;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  421  	case NL80211_IFTYPE_ADHOC:
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  422  		basic->conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
6e226666efc06d Sean Wang        2024-06-12  423  		basic->aid = cpu_to_le16(link_sta->sta->aid);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  424  		break;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  425  	default:
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  426  		WARN_ON(1);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  427  		break;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  428  	}
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  429  
6e226666efc06d Sean Wang        2024-06-12  430  	memcpy(basic->peer_addr, link_sta->addr, ETH_ALEN);
6e226666efc06d Sean Wang        2024-06-12  431  	basic->qos = link_sta->sta->wme;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  432  }
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  433  EXPORT_SYMBOL_GPL(mt76_connac_mcu_sta_basic_tlv);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  434  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
