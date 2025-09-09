Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3520D4FC
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Sep 2025 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404298; cv=none; b=lPVJm3ic+5GbjKfaUQsDvb2/9jRoYtvgXhkmWhcaCDHVObh0Ilua4NvHFkDxUNmwL6qlj5AEYVnUjBsMl84NRaIoAtwzwPU/K9Txr9c1oaexVRSJILuSlponSCLPx5kEy2ne5m+cC3TOsLXEAnJ6ZV863UazWIMCkA4aQ36Sr1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404298; c=relaxed/simple;
	bh=cmuIZ5qGlycxBaHwza1T16LMPfD1aB9ZXUoIdbW8ywU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lIFTObUBl09/vEF0wliMJq8iceF54q0XuWke2uwCs66fyp7Aw51lMdbLh9SP0wxTQv2KrthzM5kXM2zVS9KdMZ8qDlHlPgKmCRPfq2FWirVngQ7bj2Qx5Uyej8cIq7BPIEJGBY9sfM2cGHD/w9d7PYlUlj6KDTOFe2kN3cQlzP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vcqY2JtG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vcqY2JtG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e7512c8669so338681f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 09 Sep 2025 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757404294; x=1758009094; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2rWYdhxlH3WofgehPc/EI+w/RTcYxkhLQgA2/GpPZc=;
        b=vcqY2JtGLW4s4LrHUnib5VojDcsyTiCLEyTcj2V3t3ImVeRYWkKrBCLg/JEU5sOWPt
         4oFLu0eC52T5ttLFB4uEJfIuqDhYzDvsfLhFLujCbQ3bW+ek/44qkn5JxE/QMdiqCyKf
         lXRFx+QnQr0mlgv9s0CTVOnRNc+W42hf5B/+55la+Af++W6At0CTQMJvwaUaXE1CCujH
         FkTAR3LjZa+4reuCJ0A1kQLcFDaCFOtJJ8KrdI/pr2rM36HJeHc9SOuxHnsUr3aCOAxP
         23P/dMY20oCObZ5OgKh1zc+22sj5lzuZg+vj5KOf28m1rWKyLdH/IVP3B97uxbkSt7B8
         sJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757404294; x=1758009094;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2rWYdhxlH3WofgehPc/EI+w/RTcYxkhLQgA2/GpPZc=;
        b=YZwYV8ADSAGiaKOrcmAUQ8XI69sXUg/KU7eix2zokcExRQ0AfJLvXWAaXDM6ky4LAU
         JtmlBugHKXS9tv8+AHNs1G9Le8SmhkntO1QsUnv7mzkK9biXw7wtACrPgoJ/93H2Mqge
         yh8vT3jON41nY8YAXRqUlo7kTwhbrZpRX64qs1D62nX37POAsmPOAI/BLTM+exwX2YLr
         YYLS4nNAAQ3QIwqZnsYRhKrQ0MaLnyrGxjKgWot0bifH24K4WZoog0I5E9EYbfg2wZfB
         bLpKhjIZivRcYK3k4edqGaNxkxVGELIakIOZ7jLThfH4lRGcBWP6fEUnOtfiSIHAcil3
         QgWQ==
X-Gm-Message-State: AOJu0YxQeeZf9mGo4R4W1a3yvdk69hailDkTz3dijEdRs2LzbsPL9EEn
	ln84lXBjc2HTUpNIvc83eSPJQg4jf6jRrPNFvBrXuQ1KUySqWLRbPXNgFfA6bqiwhVvYMzcQV/+
	RodAW
X-Gm-Gg: ASbGnct9NxYbKCH/+8uWJqpDcJJg1jR0R9zJWjyKoxqfNRiq64X2gW7MgTZL+XcV6SW
	6qFZo6+rwLNc/kSfsUphj4MPmlv3v/iVcXszt2iaFIokqoUmyw9xtCr7cnnhvV8Yr0QspDewscR
	b0mK4db4sEHbo6pg/nX/yHp4/zzElrCwLZZ5UQt95Djc+u6WzimLAGCsO7OeSJB62SdHxd3bB4f
	Q/aMJXYX8y2SJ4uSaj8Ndo1Q0CjF9Ygi4nLB3So2KYzsBCuTGbSLov7+gZyqm2i+HGGJBx1KDSB
	h3UQZ0TtAO6H6C4e+XwsoLrH6VdSoc96G3QVmQkbP4UT7zGwN6UghSPQ5as6rn7uvftOgWh4cxa
	DU359RllYb3X1T4AEm2Ikohtr674=
X-Google-Smtp-Source: AGHT+IHQ/FcHEdoSvlNLGEqRUCK1Q2rPJt2Cm5+RHFlEcdExUPVAJmj7Y4WsXrE+m5x7Bvwyq8rD6w==
X-Received: by 2002:a5d:64e4:0:b0:3de:c5b3:dda2 with SMTP id ffacd0b85a97d-3e64317f0dcmr7187804f8f.34.1757404294147;
        Tue, 09 Sep 2025 00:51:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7521d88e8sm1516018f8f.27.2025.09.09.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:51:33 -0700 (PDT)
Date: Tue, 9 Sep 2025 10:51:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 5/19]
 drivers/net/wireless/mediatek/mt76/mt7996/main.c:1279 mt7996_tx() error: we
 previously assumed 'vif' could be null (see line 1262)
Message-ID: <202509091137.3BrqVNmN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250909075130.hdfFRoGPyaUgPR0Hr1JTuZwTJKzFKq4hORifCJPdhAQ@z>

tree:   https://github.com/nbd168/wireless mt76
head:   11c3ee032f406b80c7ccf743ddfc7b12387abf4a
commit: 6c270ac14b34f53688527658aeff0f4e02a0628c [5/19] wifi: mt76: mt7996: Set proper link destination address in mt7996_tx()
config: xtensa-randconfig-r071-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091137.3BrqVNmN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509091137.3BrqVNmN-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:1279 mt7996_tx() error: we previously assumed 'vif' could be null (see line 1262)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:1307 mt7996_tx() error: testing array offset 'link_id' after use.

vim +/vif +1279 drivers/net/wireless/mediatek/mt76/mt7996/main.c

98686cd21624c7 Shayne Chen      2022-11-22  1250  
98686cd21624c7 Shayne Chen      2022-11-22  1251  static void mt7996_tx(struct ieee80211_hw *hw,
98686cd21624c7 Shayne Chen      2022-11-22  1252  		      struct ieee80211_tx_control *control,
98686cd21624c7 Shayne Chen      2022-11-22  1253  		      struct sk_buff *skb)
98686cd21624c7 Shayne Chen      2022-11-22  1254  {
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1255  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
98686cd21624c7 Shayne Chen      2022-11-22  1256  	struct mt7996_dev *dev = mt7996_hw_dev(hw);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1257  	struct ieee80211_sta *sta = control->sta;
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1258  	struct mt7996_sta *msta = sta ? (void *)sta->drv_priv : NULL;
98686cd21624c7 Shayne Chen      2022-11-22  1259  	struct mt76_phy *mphy = hw->priv;
98686cd21624c7 Shayne Chen      2022-11-22  1260  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
98686cd21624c7 Shayne Chen      2022-11-22  1261  	struct ieee80211_vif *vif = info->control.vif;
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31 @1262  	struct mt7996_vif *mvif = vif ? (void *)vif->drv_priv : NULL;
                                                                                  ^^^
This line assumes vif can be NULL

98686cd21624c7 Shayne Chen      2022-11-22  1263  	struct mt76_wcid *wcid = &dev->mt76.global_wcid;
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1264  	u8 link_id = u32_get_bits(info->control.flags,
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1265  				  IEEE80211_TX_CTRL_MLO_LINK);
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1266  
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1267  	rcu_read_lock();
98686cd21624c7 Shayne Chen      2022-11-22  1268  
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1269  	/* Use primary link_id if the value from mac80211 is set to
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1270  	 * IEEE80211_LINK_UNSPECIFIED.
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1271  	 */
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1272  	if (link_id == IEEE80211_LINK_UNSPECIFIED) {
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1273  		if (msta)
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1274  			link_id = msta->deflink_id;
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1275  		else if (mvif)
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1276  			link_id = mvif->mt76.deflink_id;
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1277  	}
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1278  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31 @1279  	if (ieee80211_vif_is_mld(vif)) {
                                                                                 ^^^
But it's not checked here.

6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1280  		struct ieee80211_bss_conf *link_conf;
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1281  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1282  		if (msta) {
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1283  			struct ieee80211_link_sta *link_sta;
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1284  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1285  			link_sta = rcu_dereference(sta->link[link_id]);
                                                                                                             ^^^^^^^
Do we need to check that link_id != IEEE80211_LINK_UNSPECIFIED here?

6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1286  			if (!link_sta)
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1287  				link_sta = rcu_dereference(sta->link[msta->deflink_id]);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1288  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1289  			if (link_sta) {
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1290  				memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1291  				if (ether_addr_equal(sta->addr, hdr->addr3))
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1292  					memcpy(hdr->addr3, link_sta->addr, ETH_ALEN);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1293  			}
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1294  		}
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1295  
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1296  		link_conf = rcu_dereference(vif->link_conf[link_id]);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1297  		if (link_conf) {
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1298  			memcpy(hdr->addr2, link_conf->addr, ETH_ALEN);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1299  			if (ether_addr_equal(vif->addr, hdr->addr3))
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1300  				memcpy(hdr->addr3, link_conf->addr, ETH_ALEN);
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1301  		}
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1302  	}
6c270ac14b34f5 Lorenzo Bianconi 2025-07-31  1303  
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1304  	if (mvif) {
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04  1305  		struct mt76_vif_link *mlink = &mvif->deflink.mt76;
69d54ce7491d04 Felix Fietkau    2025-01-02  1306  
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04 @1307  		if (link_id < IEEE80211_LINK_UNSPECIFIED)
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1308  			mlink = rcu_dereference(mvif->mt76.link[link_id]);
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04  1309  
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04  1310  		if (mlink->wcid)
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1311  			wcid = mlink->wcid;
69d54ce7491d04 Felix Fietkau    2025-01-02  1312  
69d54ce7491d04 Felix Fietkau    2025-01-02  1313  		if (mvif->mt76.roc_phy &&
69d54ce7491d04 Felix Fietkau    2025-01-02  1314  		    (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN)) {
69d54ce7491d04 Felix Fietkau    2025-01-02  1315  			mphy = mvif->mt76.roc_phy;
69d54ce7491d04 Felix Fietkau    2025-01-02  1316  			if (mphy->roc_link)
69d54ce7491d04 Felix Fietkau    2025-01-02  1317  				wcid = mphy->roc_link->wcid;
69d54ce7491d04 Felix Fietkau    2025-01-02  1318  		} else {
64cbf0d7ce9afe Lorenzo Bianconi 2025-07-04  1319  			mphy = mt76_vif_link_phy(mlink);
69d54ce7491d04 Felix Fietkau    2025-01-02  1320  		}
69d54ce7491d04 Felix Fietkau    2025-01-02  1321  	}
69d54ce7491d04 Felix Fietkau    2025-01-02  1322  
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1323  	if (!mphy) {
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1324  		ieee80211_free_txskb(hw, skb);
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1325  		goto unlock;
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1326  	}
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1327  
8beef507ddeff2 Lorenzo Bianconi 2025-07-08  1328  	if (msta && link_id < IEEE80211_LINK_UNSPECIFIED) {
f32915eb6dd4b6 Lorenzo Bianconi 2025-03-11  1329  		struct mt7996_sta_link *msta_link;
98686cd21624c7 Shayne Chen      2022-11-22  1330  
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1331  		msta_link = rcu_dereference(msta->link[link_id]);
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1332  		if (msta_link)
f32915eb6dd4b6 Lorenzo Bianconi 2025-03-11  1333  			wcid = &msta_link->wcid;
98686cd21624c7 Shayne Chen      2022-11-22  1334  	}
98686cd21624c7 Shayne Chen      2022-11-22  1335  	mt76_tx(mphy, control->sta, wcid, skb);
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1336  unlock:
3ce8acb86b6614 Lorenzo Bianconi 2025-03-12  1337  	rcu_read_unlock();
98686cd21624c7 Shayne Chen      2022-11-22  1338  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

