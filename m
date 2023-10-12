Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECEAD521
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Oct 2023 06:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYPD8a2A"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-327be5fe4beso525943f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 23:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697092842; x=1697697642; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eR1bMjL1FKE9EWKqrrihhtcNuQ8HvN3oINN7TKaTecw=;
        b=lYPD8a2A3GwfR4YFfoDxpHSA3nMBVailYYRyIAYxDzyGMaPE2nedqtNec92lo3uxYY
         KKmdZt3koBE0eWkDJsXZsHgdSulgjgsqZH4xVXAtgPQK0CsXCi99vwSVYy5UwHCH1l3G
         PJhNBgh6udVBQnmm0cIBYk9CrnoTgThQw/9VO23vglDJEBq0fpYy4XudlJFvGWoCpTcY
         22qK/JVAOBv53AkEcppZDbQwK2On6Y1Gv4oO7z9QkF09QxyuD4ik43/alc+KQvuXHf8J
         tHuy4QQgQ9JjdyM6g2YIj1V2SjLMby0emqWq5l9vFUesat/UpcO2ITifQgzXFDN3kCeg
         9Kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697092842; x=1697697642;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eR1bMjL1FKE9EWKqrrihhtcNuQ8HvN3oINN7TKaTecw=;
        b=NEGKXs5cMxqfUenKS6lrjx9f5JbwsoUyH+cDj+VN3OMMlyRvOGCDRP4jbAKIRbvmKJ
         K33uBFnF22vo3+JMSla/ewVKbjOML7SeR+RNRDzp50lbOFz7ZO0tcYVe4EcgrVe+jD8G
         U1h/yzRgZ9EMzb8vBGGdWHZVNbvzhtDOMkli3Yk10EOkbJJr+aQzaWjVbgfMGkv6gRso
         f/fsXsS8juA1Qb7GKDdaVn+KsxlKpKSULJr/CuHX8iCQLkATmf6970R2E4bJt2SR2YkZ
         T4PqU8TlnWTZbWhQ6L+qI+6m1pq8QpOEG9PY3p6Gc5T9MKb0g8LlT5APfmzijSoEZ1Iw
         9cPA==
X-Gm-Message-State: AOJu0YytN8jYElRH+KjWEQXUhrwLu66jaXb3oVRkGkNrxWTg2fyWXnrV
	A8gZ/wqe2LK2qAmDJ1uRhU8zcnJsJNElHnDfccI=
X-Google-Smtp-Source: AGHT+IH+D7bfdAwvlndYQTSvzwgZuAl+7ZMpU/vJxeGa0Vi6XT4Mghk61ZbF4iLRqMrv5LR6bgCX8A==
X-Received: by 2002:a5d:4247:0:b0:31f:fa66:5852 with SMTP id s7-20020a5d4247000000b0031ffa665852mr19670059wrr.21.1697092842406;
        Wed, 11 Oct 2023 23:40:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o30-20020adfa11e000000b0031f3ad17b2csm3839078wro.52.2023.10.11.23.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:40:42 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:40:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Subject: drivers/net/wireless/mediatek/mt76/mt76x02_util.c:475
 mt76x02_set_key() warn: variable dereferenced before check 'key' (see line
 415)
Message-ID: <77fee326-963a-40eb-80c9-2788a9ff9c22@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   401644852d0b2a278811de38081be23f74b5bb04
commit: e6db67fa871dee37d22701daba806bfcd4d9df49 wifi: mt76: ignore key disable commands
config: i386-randconfig-141-20231011 (https://download.01.org/0day-ci/archive/20231012/202310121455.LwR349tb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121455.LwR349tb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310121455.LwR349tb-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt76x02_util.c:475 mt76x02_set_key() warn: variable dereferenced before check 'key' (see line 415)

vim +/key +475 drivers/net/wireless/mediatek/mt76/mt76x02_util.c

60c26859e863c1 Stanislaw Gruszka 2018-09-04  407  int mt76x02_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
60c26859e863c1 Stanislaw Gruszka 2018-09-04  408  		    struct ieee80211_vif *vif, struct ieee80211_sta *sta,
60c26859e863c1 Stanislaw Gruszka 2018-09-04  409  		    struct ieee80211_key_conf *key)
60c26859e863c1 Stanislaw Gruszka 2018-09-04  410  {
d87cf75f111183 Lorenzo Bianconi  2018-10-07  411  	struct mt76x02_dev *dev = hw->priv;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  412  	struct mt76x02_vif *mvif = (struct mt76x02_vif *)vif->drv_priv;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  413  	struct mt76x02_sta *msta;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  414  	struct mt76_wcid *wcid;
60c26859e863c1 Stanislaw Gruszka 2018-09-04 @415  	int idx = key->keyidx;
                                                                  ^^^^^^^^^^^
Dereference

60c26859e863c1 Stanislaw Gruszka 2018-09-04  416  	int ret;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  417  
60c26859e863c1 Stanislaw Gruszka 2018-09-04  418  	/* fall back to sw encryption for unsupported ciphers */
60c26859e863c1 Stanislaw Gruszka 2018-09-04  419  	switch (key->cipher) {
60c26859e863c1 Stanislaw Gruszka 2018-09-04  420  	case WLAN_CIPHER_SUITE_WEP40:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  421  	case WLAN_CIPHER_SUITE_WEP104:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  422  	case WLAN_CIPHER_SUITE_TKIP:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  423  	case WLAN_CIPHER_SUITE_CCMP:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  424  		break;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  425  	default:
60c26859e863c1 Stanislaw Gruszka 2018-09-04  426  		return -EOPNOTSUPP;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  427  	}
60c26859e863c1 Stanislaw Gruszka 2018-09-04  428  
60c26859e863c1 Stanislaw Gruszka 2018-09-04  429  	/*
60c26859e863c1 Stanislaw Gruszka 2018-09-04  430  	 * The hardware does not support per-STA RX GTK, fall back
60c26859e863c1 Stanislaw Gruszka 2018-09-04  431  	 * to software mode for these.
60c26859e863c1 Stanislaw Gruszka 2018-09-04  432  	 */
60c26859e863c1 Stanislaw Gruszka 2018-09-04  433  	if ((vif->type == NL80211_IFTYPE_ADHOC ||
60c26859e863c1 Stanislaw Gruszka 2018-09-04  434  	     vif->type == NL80211_IFTYPE_MESH_POINT) &&
60c26859e863c1 Stanislaw Gruszka 2018-09-04  435  	    (key->cipher == WLAN_CIPHER_SUITE_TKIP ||
60c26859e863c1 Stanislaw Gruszka 2018-09-04  436  	     key->cipher == WLAN_CIPHER_SUITE_CCMP) &&
60c26859e863c1 Stanislaw Gruszka 2018-09-04  437  	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
60c26859e863c1 Stanislaw Gruszka 2018-09-04  438  		return -EOPNOTSUPP;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  439  
b98558e2529986 Stanislaw Gruszka 2019-03-19  440  	/*
b98558e2529986 Stanislaw Gruszka 2019-03-19  441  	 * In USB AP mode, broadcast/multicast frames are setup in beacon
b98558e2529986 Stanislaw Gruszka 2019-03-19  442  	 * data registers and sent via HW beacons engine, they require to
b98558e2529986 Stanislaw Gruszka 2019-03-19  443  	 * be already encrypted.
b98558e2529986 Stanislaw Gruszka 2019-03-19  444  	 */
61c51a74a4e586 Lorenzo Bianconi  2019-10-29  445  	if (mt76_is_usb(&dev->mt76) &&
b98558e2529986 Stanislaw Gruszka 2019-03-19  446  	    vif->type == NL80211_IFTYPE_AP &&
b98558e2529986 Stanislaw Gruszka 2019-03-19  447  	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
b98558e2529986 Stanislaw Gruszka 2019-03-19  448  		return -EOPNOTSUPP;
b98558e2529986 Stanislaw Gruszka 2019-03-19  449  
4b36cc6b390f18 David Bauer       2021-02-07  450  	/* MT76x0 GTK offloading does not work with more than one VIF */
4b36cc6b390f18 David Bauer       2021-02-07  451  	if (is_mt76x0(dev) && !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
4b36cc6b390f18 David Bauer       2021-02-07  452  		return -EOPNOTSUPP;
4b36cc6b390f18 David Bauer       2021-02-07  453  
60c26859e863c1 Stanislaw Gruszka 2018-09-04  454  	msta = sta ? (struct mt76x02_sta *)sta->drv_priv : NULL;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  455  	wcid = msta ? &msta->wcid : &mvif->group_wcid;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  456  
e6db67fa871dee Felix Fietkau     2023-03-30  457  	if (cmd != SET_KEY) {
60c26859e863c1 Stanislaw Gruszka 2018-09-04  458  		if (idx == wcid->hw_key_idx) {
60c26859e863c1 Stanislaw Gruszka 2018-09-04  459  			wcid->hw_key_idx = -1;
f2f6a47b504b8f Felix Fietkau     2019-01-25  460  			wcid->sw_iv = false;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  461  		}
60c26859e863c1 Stanislaw Gruszka 2018-09-04  462  
e6db67fa871dee Felix Fietkau     2023-03-30  463  		return 0;
e6db67fa871dee Felix Fietkau     2023-03-30  464  	}
e6db67fa871dee Felix Fietkau     2023-03-30  465  
e6db67fa871dee Felix Fietkau     2023-03-30  466  	key->hw_key_idx = wcid->idx;
e6db67fa871dee Felix Fietkau     2023-03-30  467  	wcid->hw_key_idx = idx;
e6db67fa871dee Felix Fietkau     2023-03-30  468  	if (key->flags & IEEE80211_KEY_FLAG_RX_MGMT) {
e6db67fa871dee Felix Fietkau     2023-03-30  469  		key->flags |= IEEE80211_KEY_FLAG_SW_MGMT_TX;
e6db67fa871dee Felix Fietkau     2023-03-30  470  		wcid->sw_iv = true;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  471  	}
d87cf75f111183 Lorenzo Bianconi  2018-10-07  472  	mt76_wcid_key_setup(&dev->mt76, wcid, key);
60c26859e863c1 Stanislaw Gruszka 2018-09-04  473  
60c26859e863c1 Stanislaw Gruszka 2018-09-04  474  	if (!msta) {
60c26859e863c1 Stanislaw Gruszka 2018-09-04 @475  		if (key || wcid->hw_key_idx == idx) {
                                                                    ^^^
Check for NULL.  I think "key" can't be NULL so this check is always
true.  The check can be removed and the code pulled in an tab.

8d66af49a3db9a Lorenzo Bianconi  2018-10-07  476  			ret = mt76x02_mac_wcid_set_key(dev, wcid->idx, key);
60c26859e863c1 Stanislaw Gruszka 2018-09-04  477  			if (ret)
60c26859e863c1 Stanislaw Gruszka 2018-09-04  478  				return ret;
60c26859e863c1 Stanislaw Gruszka 2018-09-04  479  		}
60c26859e863c1 Stanislaw Gruszka 2018-09-04  480  
8d66af49a3db9a Lorenzo Bianconi  2018-10-07  481  		return mt76x02_mac_shared_key_setup(dev, mvif->idx, idx, key);
60c26859e863c1 Stanislaw Gruszka 2018-09-04  482  	}
60c26859e863c1 Stanislaw Gruszka 2018-09-04  483  
8d66af49a3db9a Lorenzo Bianconi  2018-10-07  484  	return mt76x02_mac_wcid_set_key(dev, msta->wcid.idx, key);
60c26859e863c1 Stanislaw Gruszka 2018-09-04  485  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

