Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819321E5732
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986151; cv=none; b=bFyHUEhPQm6ETsMb7vKKbFGfitX1uRpCXFFV6mrXgyj0jSn88emqYKOK2ttM+ZB9vl1vX8waoUMX8m/GNZKpkod2FryeJN+Zw3wSKg9ph/H5qcvBiazv39B+lD+QKlOJE3skWU8uCLWcZtlwoBJ91s+I+XBg/J3Wghr7ihnKmxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986151; c=relaxed/simple;
	bh=tljaYjwSlg6y5UbC2D9yfVyCulPk0lM63wJIeCX+tiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLDnS5oDhjeAK1NupnyeK3z+0oTp+r1dXNKibxCGOi8Wofl9O3znOo76vSB7DHEvM/S14h1q4rtjRiQmb2lPWA+HF52zIyHCO/3iaX2cjov6nFKlkR3WdyWAetqZO3bjcWXPxsLWNFj0ABi6nOqpFFdhual5jU96a8KPybWpelE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p1kTOCoZ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p1kTOCoZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab78e6edb99so566656066b.2
        for <oe-kbuild@lists.linux.dev>; Sun, 02 Mar 2025 23:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740986147; x=1741590947; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqJOjyUVYTznSDpkzCNO5A37E0iHZ7NPdOKTmOaVY9A=;
        b=p1kTOCoZ3Ho3r2t/pJ857dmqt7lHvy5FcKT1hYGxVXgvelVEuZokd5Hd2qA6877djP
         cNr+D97DPMV0B6EIH65F3Rhzs17onjRQ5sWhOvi+UejYCSJQHLa7UXcenoTm+uXtRLi+
         9JQfb24DD9X1aiUd5Kp9Oodqg7CoWwy3WB5Q/P1ELcNh24i+dQ/sHhkyHnwIxtZh3XVC
         +5Pue56kDt2FhkDD5pu2P48gqAaxEvzebeNGtmZZX1GI0FtPeJkfEVoNGuYsFuZUKmN9
         IiccByfg4GN3SVMIszvyYpp6pL1SYsCINn8DsjgWw0gc994mgD3XjiUO4X3CRlohPbBG
         Uk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986147; x=1741590947;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqJOjyUVYTznSDpkzCNO5A37E0iHZ7NPdOKTmOaVY9A=;
        b=dezKu6xGcthHcFojpGPHbWc/BjpVkRhOIrz8Si02f2F5QNVkjTfmG6j1pv1Q4TO+S4
         EwYe/cDHWnk3Zu3qvGIrleG6cJ0nhAA14BOp7NcMw6R2PV5nlWPI3G/sQ5bIHbsdny8u
         +I0/r2JEJ5B9wQNHCHJHOLpcsuAeHN4Ygvn14vvOiaEqJt4jIcj81ILEHj/oaI8HLwCK
         v8lyxG5IKKLFsaLktpDoONc0p6d984WiBnXCTUZ9OE+trP7iWVFTFW/bFTinvIRPVY0x
         N7UclIJXqgMQXyQDaIiT2DzolJHUg1gWF/lJzBT6DbabXoWVgXmO2O6c+RMWuZHbfRhh
         fLdA==
X-Gm-Message-State: AOJu0YxuGZYdBMHvbMOO3R2w+KyYFMrFuL60E8EuXl5HAwVtibNRA+TD
	lz/3I+HiVxh7GmsC355u3qXSXz+5cDJZXG8+/79HxI3Bkqe32DZK+Fq0WEKRRXpiYHI9s/Qj614
	W
X-Gm-Gg: ASbGncso38I1fH+iZEn20t1cjJypT32tUesniY4KOT6dYt2DDQtImgqOh9HOS40Cdul
	C6G/1D/z3hbyLmJwbRKPmi6ZvjoAF3h5kIi/3faQMpK0gHNIMnBOwAUWr2Yo9MxB2yg0nu/Ptom
	6lRbKmB0ZB1hw2AhQu9JeW+MvFvEe+0rxs9IuXWrgVOzrcouhQhILROBNriXBLByv8SOG4iu7Jy
	VwopcBTcJFpy0gkVtV7tHkuPwA2nahAGWcClUJOUpsHzHN7bYjmIwCtG0TZMW1FEpg+PrEJKqoy
	ugcq84zvpyWrmrL0AGAYtEsTc+EH+Zh/suXcKUWplt7xEaCd1Q==
X-Google-Smtp-Source: AGHT+IGfH5yyUc1OrD+Y0vuOehG5xPKevp3+ltByXcI37pZ447OrHONIAoRL4LvWzO0pT/QbRq6FLQ==
X-Received: by 2002:a17:907:3206:b0:abe:e981:f152 with SMTP id a640c23a62f3a-abf265a2a06mr1447149666b.37.1740986147147;
        Sun, 02 Mar 2025 23:15:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf5a6e59ffsm364959066b.171.2025.03.02.23.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 23:15:46 -0800 (PST)
Date: Mon, 3 Mar 2025 10:15:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Charles Han <hanchunchao@inspur.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: drivers/net/wireless/mediatek/mt76/mt7925/main.c:2005
 mt7925_change_vif_links() warn: inconsistent returns '&dev->mt76.mutex'.
Message-ID: <a9ef6ddb-7f90-4cf3-b720-fedf1f5e4810@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eb172143d5508b4da468ed59ee857c6e5e01da6
commit: 5cd0bd815c8a48862a296df9b30e0ea0da14acd3 wifi: mt76: mt7925: fix NULL deref check in mt7925_change_vif_links
config: i386-randconfig-141-20250303 (https://download.01.org/0day-ci/archive/20250303/202503031055.3ZRqxhAl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503031055.3ZRqxhAl-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/main.c:2005 mt7925_change_vif_links() warn: inconsistent returns '&dev->mt76.mutex'.

vim +2005 drivers/net/wireless/mediatek/mt76/mt7925/main.c

69acd6d910b0c83 Sean Wang   2024-07-06  1901  static int
69acd6d910b0c83 Sean Wang   2024-07-06  1902  mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
69acd6d910b0c83 Sean Wang   2024-07-06  1903  			u16 old_links, u16 new_links,
69acd6d910b0c83 Sean Wang   2024-07-06  1904  			struct ieee80211_bss_conf *old[IEEE80211_MLD_MAX_NUM_LINKS])
69acd6d910b0c83 Sean Wang   2024-07-06  1905  {
69acd6d910b0c83 Sean Wang   2024-07-06  1906  	struct mt792x_bss_conf *mconfs[IEEE80211_MLD_MAX_NUM_LINKS] = {}, *mconf;
69acd6d910b0c83 Sean Wang   2024-07-06  1907  	struct mt792x_link_sta *mlinks[IEEE80211_MLD_MAX_NUM_LINKS] = {}, *mlink;
69acd6d910b0c83 Sean Wang   2024-07-06  1908  	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
69acd6d910b0c83 Sean Wang   2024-07-06  1909  	unsigned long add = new_links & ~old_links;
69acd6d910b0c83 Sean Wang   2024-07-06  1910  	unsigned long rem = old_links & ~new_links;
69acd6d910b0c83 Sean Wang   2024-07-06  1911  	struct mt792x_dev *dev = mt792x_hw_dev(hw);
69acd6d910b0c83 Sean Wang   2024-07-06  1912  	struct mt792x_phy *phy = mt792x_hw_phy(hw);
69acd6d910b0c83 Sean Wang   2024-07-06  1913  	struct ieee80211_bss_conf *link_conf;
69acd6d910b0c83 Sean Wang   2024-07-06  1914  	unsigned int link_id;
69acd6d910b0c83 Sean Wang   2024-07-06  1915  	int err;
69acd6d910b0c83 Sean Wang   2024-07-06  1916  
69acd6d910b0c83 Sean Wang   2024-07-06  1917  	if (old_links == new_links)
69acd6d910b0c83 Sean Wang   2024-07-06  1918  		return 0;
69acd6d910b0c83 Sean Wang   2024-07-06  1919  
69acd6d910b0c83 Sean Wang   2024-07-06  1920  	mt792x_mutex_acquire(dev);
                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^
Locked.

69acd6d910b0c83 Sean Wang   2024-07-06  1921  
69acd6d910b0c83 Sean Wang   2024-07-06  1922  	for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS) {
69acd6d910b0c83 Sean Wang   2024-07-06  1923  		mconf = mt792x_vif_to_link(mvif, link_id);
69acd6d910b0c83 Sean Wang   2024-07-06  1924  		mlink = mt792x_sta_to_link(&mvif->sta, link_id);
69acd6d910b0c83 Sean Wang   2024-07-06  1925  
69acd6d910b0c83 Sean Wang   2024-07-06  1926  		if (!mconf || !mlink)
69acd6d910b0c83 Sean Wang   2024-07-06  1927  			continue;
69acd6d910b0c83 Sean Wang   2024-07-06  1928  
69acd6d910b0c83 Sean Wang   2024-07-06  1929  		if (mconf != &mvif->bss_conf) {
69acd6d910b0c83 Sean Wang   2024-07-06  1930  			mt792x_mac_link_bss_remove(dev, mconf, mlink);
69acd6d910b0c83 Sean Wang   2024-07-06  1931  			devm_kfree(dev->mt76.dev, mconf);
69acd6d910b0c83 Sean Wang   2024-07-06  1932  			devm_kfree(dev->mt76.dev, mlink);
69acd6d910b0c83 Sean Wang   2024-07-06  1933  		}
69acd6d910b0c83 Sean Wang   2024-07-06  1934  
69acd6d910b0c83 Sean Wang   2024-07-06  1935  		rcu_assign_pointer(mvif->link_conf[link_id], NULL);
69acd6d910b0c83 Sean Wang   2024-07-06  1936  		rcu_assign_pointer(mvif->sta.link[link_id], NULL);
69acd6d910b0c83 Sean Wang   2024-07-06  1937  	}
69acd6d910b0c83 Sean Wang   2024-07-06  1938  
69acd6d910b0c83 Sean Wang   2024-07-06  1939  	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
69acd6d910b0c83 Sean Wang   2024-07-06  1940  		if (!old_links) {
9f89f05bef1a573 Sean Wang   2024-07-06  1941  			mvif->deflink_id = link_id;
69acd6d910b0c83 Sean Wang   2024-07-06  1942  			mconf = &mvif->bss_conf;
69acd6d910b0c83 Sean Wang   2024-07-06  1943  			mlink = &mvif->sta.deflink;
69acd6d910b0c83 Sean Wang   2024-07-06  1944  		} else {
69acd6d910b0c83 Sean Wang   2024-07-06  1945  			mconf = devm_kzalloc(dev->mt76.dev, sizeof(*mconf),
69acd6d910b0c83 Sean Wang   2024-07-06  1946  					     GFP_KERNEL);
69acd6d910b0c83 Sean Wang   2024-07-06  1947  			mlink = devm_kzalloc(dev->mt76.dev, sizeof(*mlink),
69acd6d910b0c83 Sean Wang   2024-07-06  1948  					     GFP_KERNEL);
5cd0bd815c8a488 Charles Han 2024-10-25  1949  			if (!mconf || !mlink)
5cd0bd815c8a488 Charles Han 2024-10-25  1950  				return -ENOMEM;

Call mt792x_mutex_release(dev) before returning.

69acd6d910b0c83 Sean Wang   2024-07-06  1951  		}
69acd6d910b0c83 Sean Wang   2024-07-06  1952  
69acd6d910b0c83 Sean Wang   2024-07-06  1953  		mconfs[link_id] = mconf;
69acd6d910b0c83 Sean Wang   2024-07-06  1954  		mlinks[link_id] = mlink;
69acd6d910b0c83 Sean Wang   2024-07-06  1955  		mconf->link_id = link_id;
69acd6d910b0c83 Sean Wang   2024-07-06  1956  		mconf->vif = mvif;
69acd6d910b0c83 Sean Wang   2024-07-06  1957  		mlink->wcid.link_id = link_id;
4f0f33d2747f207 Sean Wang   2024-07-06  1958  		mlink->wcid.link_valid = !!vif->valid_links;
b1d21403c0cfe71 Sean Wang   2024-07-06  1959  		mlink->wcid.def_wcid = &mvif->sta.deflink.wcid;
69acd6d910b0c83 Sean Wang   2024-07-06  1960  	}
69acd6d910b0c83 Sean Wang   2024-07-06  1961  
69acd6d910b0c83 Sean Wang   2024-07-06  1962  	if (hweight16(mvif->valid_links) == 0)
69acd6d910b0c83 Sean Wang   2024-07-06  1963  		mt792x_mac_link_bss_remove(dev, &mvif->bss_conf,
69acd6d910b0c83 Sean Wang   2024-07-06  1964  					   &mvif->sta.deflink);
69acd6d910b0c83 Sean Wang   2024-07-06  1965  
69acd6d910b0c83 Sean Wang   2024-07-06  1966  	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
69acd6d910b0c83 Sean Wang   2024-07-06  1967  		mconf = mconfs[link_id];
69acd6d910b0c83 Sean Wang   2024-07-06  1968  		mlink = mlinks[link_id];
69acd6d910b0c83 Sean Wang   2024-07-06  1969  		link_conf = mt792x_vif_to_bss_conf(vif, link_id);
69acd6d910b0c83 Sean Wang   2024-07-06  1970  
69acd6d910b0c83 Sean Wang   2024-07-06  1971  		rcu_assign_pointer(mvif->link_conf[link_id], mconf);
69acd6d910b0c83 Sean Wang   2024-07-06  1972  		rcu_assign_pointer(mvif->sta.link[link_id], mlink);
69acd6d910b0c83 Sean Wang   2024-07-06  1973  
69acd6d910b0c83 Sean Wang   2024-07-06  1974  		err = mt7925_mac_link_bss_add(dev, link_conf, mlink);
69acd6d910b0c83 Sean Wang   2024-07-06  1975  		if (err < 0)
69acd6d910b0c83 Sean Wang   2024-07-06  1976  			goto free;
69acd6d910b0c83 Sean Wang   2024-07-06  1977  
69acd6d910b0c83 Sean Wang   2024-07-06  1978  		if (mconf != &mvif->bss_conf) {
69acd6d910b0c83 Sean Wang   2024-07-06  1979  			err = mt7925_set_mlo_roc(phy, &mvif->bss_conf,
69acd6d910b0c83 Sean Wang   2024-07-06  1980  						 vif->active_links);
69acd6d910b0c83 Sean Wang   2024-07-06  1981  			if (err < 0)
69acd6d910b0c83 Sean Wang   2024-07-06  1982  				goto free;
69acd6d910b0c83 Sean Wang   2024-07-06  1983  		}
69acd6d910b0c83 Sean Wang   2024-07-06  1984  	}
69acd6d910b0c83 Sean Wang   2024-07-06  1985  
69acd6d910b0c83 Sean Wang   2024-07-06  1986  	mvif->valid_links = new_links;
69acd6d910b0c83 Sean Wang   2024-07-06  1987  
69acd6d910b0c83 Sean Wang   2024-07-06  1988  	mt792x_mutex_release(dev);
69acd6d910b0c83 Sean Wang   2024-07-06  1989  
69acd6d910b0c83 Sean Wang   2024-07-06  1990  	return 0;
69acd6d910b0c83 Sean Wang   2024-07-06  1991  
69acd6d910b0c83 Sean Wang   2024-07-06  1992  free:
69acd6d910b0c83 Sean Wang   2024-07-06  1993  	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
69acd6d910b0c83 Sean Wang   2024-07-06  1994  		rcu_assign_pointer(mvif->link_conf[link_id], NULL);
69acd6d910b0c83 Sean Wang   2024-07-06  1995  		rcu_assign_pointer(mvif->sta.link[link_id], NULL);
69acd6d910b0c83 Sean Wang   2024-07-06  1996  
69acd6d910b0c83 Sean Wang   2024-07-06  1997  		if (mconf != &mvif->bss_conf)
69acd6d910b0c83 Sean Wang   2024-07-06  1998  			devm_kfree(dev->mt76.dev, mconfs[link_id]);
69acd6d910b0c83 Sean Wang   2024-07-06  1999  		if (mlink != &mvif->sta.deflink)
69acd6d910b0c83 Sean Wang   2024-07-06  2000  			devm_kfree(dev->mt76.dev, mlinks[link_id]);
69acd6d910b0c83 Sean Wang   2024-07-06  2001  	}
69acd6d910b0c83 Sean Wang   2024-07-06  2002  
69acd6d910b0c83 Sean Wang   2024-07-06  2003  	mt792x_mutex_release(dev);
69acd6d910b0c83 Sean Wang   2024-07-06  2004  
69acd6d910b0c83 Sean Wang   2024-07-06 @2005  	return err;
69acd6d910b0c83 Sean Wang   2024-07-06  2006  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

