Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487741940B0
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 00:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791937509; cv=none; b=m+KmrN+Fpj34qfkwxpHBgEj+k8cDXB9AnR5YKxyVbDfCO0j5H/9SZWewl501E6afeiw0e1mWAafMP8EMd/VKjAqMwkesinuhV3i+odTI9dxt7E/fFaLYXSEAR1kXFFaRa+bMa4ZWSzyizQiS/uYLfA+YkDH76I7CVHvMrOwnfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791937509; c=relaxed/simple;
	bh=zSmNSY8N64VAgh1MJ/D6S1ojYPRK5PmRDe/dJ0T/74k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vCiMgo+CgJPjxe4gDxda2nCpo57r1r2aTpJMLJBunjH0/LuKc7z7BaefE0VweW4jRf1kl3KVn/v2W7UN2ohIuDyAM3YVdZduSrrxYc+nH0mUqmYjU0ywczj12NdC7pDJHaN6hpxJT6gPG16t44jRYb4GheJO/KqDLkIeoFwi2xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLBy6XR5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLBy6XR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791937503; x=1823473503;
  h=date:from:to:cc:subject:message-id;
  bh=zSmNSY8N64VAgh1MJ/D6S1ojYPRK5PmRDe/dJ0T/74k=;
  b=nLBy6XR5wT9cH0u3plfoH1SwiV756p9L/TGEjmrUv0C1g6jqH4cZ13wn
   gWE6cUO18dN+Up4KYr39DOkkCY0uD98GgDZFmXXu1qUwgqnx62LOmXSRU
   ollXG74syZVPbUwlteIkPgLoqHgxlCGyarmH14e3TaCTt7pNIo5al18AV
   nSQJKWMmcV/sOfPwcCvFHgO6L5K9u0lDA/cFNEX9i6cZ9Y0o0qsmjxf4K
   YMwn8xa84vs6g+5TbVMKw8b0xRaC3sWHALBbh+EM1v0/wfV+N2f7ixwtG
   ynKIPeJUrsFUjM9vl07V/xWXQDcJC4WZCbqlc2Vq4YWW0/Hvon+dm6JWq
   Q==;
X-CSE-ConnectionGUID: i2SZrAjNRqqcL5Xlz3650w==
X-CSE-MsgGUID: /+nckEJ+SPqDhx1TcUPs9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="580962"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="580962"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 17:24:57 -0700
X-CSE-ConnectionGUID: Iu+o+iWcTI2AzD4BMm3x9w==
X-CSE-MsgGUID: /NWVE0G5Qc+iXitywJ/IVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3066618"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 13 Oct 2026 17:24:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGmnd-00000000AmD-3ImG;
	Wed, 14 Oct 2026 00:24:53 +0000
Date: Wed, 14 Oct 2026 02:23:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath-next 6/34] net/wireless/nl80211.c:20114
 nl80211_pre_doit() error: 'wdev' dereferencing possible ERR_PTR()
Message-ID: <202610140243.w1Zrwq4k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Jeff Johnson <jjohnson@kernel.org>
CC: ath12k@lists.infradead.org
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
head:   cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
commit: 13c20e8be3278e54f4758941998a3ee746644d8d [6/34] wifi: nl80211: prepare for unlocked wdev-only ops
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: sparc-randconfig-r2200-20261013 (https://download.01.org/0day-ci/archive/20261014/202610140243.w1Zrwq4k-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610140243.w1Zrwq4k-lkp@intel.com/

New smatch warnings:
net/wireless/nl80211.c:20114 nl80211_pre_doit() error: 'wdev' dereferencing possible ERR_PTR()

Old smatch warnings:
net/wireless/nl80211.c:4850 nl80211_send_iface() error: we previously assumed 'rdev->ops->get_channel' could be null (see line 4773)

vim +/wdev +20114 net/wireless/nl80211.c

13c20e8be3278e Johannes Berg        2026-10-09  19961  
20b0b53aca436a Jakub Kicinski       2022-11-04  19962  static int nl80211_pre_doit(const struct genl_split_ops *ops,
20b0b53aca436a Jakub Kicinski       2022-11-04  19963  			    struct sk_buff *skb,
4c476991062a0a Johannes Berg        2010-10-04  19964  			    struct genl_info *info)
4c476991062a0a Johannes Berg        2010-10-04  19965  {
a05829a7222e9d Johannes Berg        2021-01-22  19966  	struct cfg80211_registered_device *rdev = NULL;
8e3d9039d280c6 Johannes Berg        2026-10-06  19967  	struct net *netns = genl_info_net(info);
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19968  	struct wireless_dev *wdev = NULL;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19969  	struct net_device *dev = NULL;
13c20e8be3278e Johannes Berg        2026-10-09  19970  	bool need_rtnl, wdev_ref, locked = false;
8e3d9039d280c6 Johannes Berg        2026-10-06  19971  	u32 internal_flags, wdev_id = 0;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19972  	int err;
2182db91e0016c Johannes Berg        2022-04-14  19973  
2182db91e0016c Johannes Berg        2022-04-14  19974  	if (WARN_ON(ops->internal_flags >= ARRAY_SIZE(nl80211_internal_flags)))
2182db91e0016c Johannes Berg        2022-04-14  19975  		return -EINVAL;
2182db91e0016c Johannes Berg        2022-04-14  19976  
2182db91e0016c Johannes Berg        2022-04-14  19977  	internal_flags = nl80211_internal_flags[ops->internal_flags];
8e3d9039d280c6 Johannes Berg        2026-10-06  19978  	need_rtnl = internal_flags & NL80211_FLAG_NEED_RTNL;
13c20e8be3278e Johannes Berg        2026-10-09  19979  	wdev_ref = nl80211_need_wdev_ref(internal_flags);
4c476991062a0a Johannes Berg        2010-10-04  19980  
8e3d9039d280c6 Johannes Berg        2026-10-06  19981  	if (need_rtnl)
4c476991062a0a Johannes Berg        2010-10-04  19982  		rtnl_lock();
8e3d9039d280c6 Johannes Berg        2026-10-06  19983  	else
8e3d9039d280c6 Johannes Berg        2026-10-06  19984  		rcu_read_lock();
8e3d9039d280c6 Johannes Berg        2026-10-06  19985  
2182db91e0016c Johannes Berg        2022-04-14  19986  	if (internal_flags & NL80211_FLAG_NEED_WIPHY) {
8e3d9039d280c6 Johannes Berg        2026-10-06  19987  		rdev = cfg80211_get_dev_from_info(netns, info);
4c476991062a0a Johannes Berg        2010-10-04  19988  		if (IS_ERR(rdev)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19989  			err = PTR_ERR(rdev);
8e3d9039d280c6 Johannes Berg        2026-10-06  19990  			goto out_lookup;
4c476991062a0a Johannes Berg        2010-10-04  19991  		}
2182db91e0016c Johannes Berg        2022-04-14  19992  	} else if (internal_flags & NL80211_FLAG_NEED_NETDEV ||
2182db91e0016c Johannes Berg        2022-04-14  19993  		   internal_flags & NL80211_FLAG_NEED_WDEV) {
8e3d9039d280c6 Johannes Berg        2026-10-06  19994  		wdev = __cfg80211_wdev_from_attrs(NULL, netns, info->attrs);
89a54e48b9cbb4 Johannes Berg        2012-06-15  19995  		if (IS_ERR(wdev)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19996  			err = PTR_ERR(wdev);
8e3d9039d280c6 Johannes Berg        2026-10-06  19997  			goto out_lookup;
4c476991062a0a Johannes Berg        2010-10-04  19998  		}
89a54e48b9cbb4 Johannes Berg        2012-06-15  19999  
1bf614ef794643 Johannes Berg        2012-06-15  20000  		dev = wdev->netdev;
13c20e8be3278e Johannes Berg        2026-10-09  20001  		/*
13c20e8be3278e Johannes Berg        2026-10-09  20002  		 * Take the wdev ref only if we need it (wdev_ref is true when
13c20e8be3278e Johannes Berg        2026-10-09  20003  		 * the op is unlocked), we must not try to acquire this with
13c20e8be3278e Johannes Berg        2026-10-09  20004  		 * a wdev pointer protected by locking, it'd deadlock against
13c20e8be3278e Johannes Berg        2026-10-09  20005  		 * unregistration.
13c20e8be3278e Johannes Berg        2026-10-09  20006  		 */
13c20e8be3278e Johannes Berg        2026-10-09  20007  		if (wdev_ref)
13c20e8be3278e Johannes Berg        2026-10-09  20008  			wdev_hold(wdev);
13c20e8be3278e Johannes Berg        2026-10-09  20009  		else
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20010  			dev_hold(dev);
f26cbf401be935 Zhao, Gang           2014-04-21  20011  		rdev = wiphy_to_rdev(wdev->wiphy);
8e3d9039d280c6 Johannes Berg        2026-10-06  20012  	}
8e3d9039d280c6 Johannes Berg        2026-10-06  20013  
8e3d9039d280c6 Johannes Berg        2026-10-06  20014  	if (!need_rtnl) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20015  		if (rdev)
8e3d9039d280c6 Johannes Berg        2026-10-06  20016  			get_device(&rdev->wiphy.dev);
8e3d9039d280c6 Johannes Berg        2026-10-06  20017  		if (wdev)
8e3d9039d280c6 Johannes Berg        2026-10-06  20018  			wdev_id = wdev->identifier;
8e3d9039d280c6 Johannes Berg        2026-10-06  20019  		rcu_read_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20020  
8e3d9039d280c6 Johannes Berg        2026-10-06  20021  		/* RTM_NEWLINK is sent before NETDEV_UP, wait for dev_open() */
8e3d9039d280c6 Johannes Berg        2026-10-06  20022  		if (internal_flags & NL80211_FLAG_CHECK_NETDEV_UP && dev &&
8e3d9039d280c6 Johannes Berg        2026-10-06  20023  		    !READ_ONCE(wdev->is_running) && netif_running(dev)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20024  			rtnl_lock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20025  			rtnl_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20026  		}
8e3d9039d280c6 Johannes Berg        2026-10-06  20027  	}
1bf614ef794643 Johannes Berg        2012-06-15  20028  
8e3d9039d280c6 Johannes Berg        2026-10-06  20029  	if (rdev && !(internal_flags & NL80211_FLAG_NO_WIPHY_MTX)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20030  		if (need_rtnl) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20031  			wiphy_lock(&rdev->wiphy);
8e3d9039d280c6 Johannes Berg        2026-10-06  20032  		} else {
8e3d9039d280c6 Johannes Berg        2026-10-06  20033  			/* without rtnl, things may have changed since lookup */
8e3d9039d280c6 Johannes Berg        2026-10-06  20034  			wdev = nl80211_lock_and_recheck(rdev, netns, wdev_id);
8e3d9039d280c6 Johannes Berg        2026-10-06  20035  			if (IS_ERR(wdev)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20036  				err = PTR_ERR(wdev);
8e3d9039d280c6 Johannes Berg        2026-10-06  20037  				goto out;
8e3d9039d280c6 Johannes Berg        2026-10-06  20038  			}
8e3d9039d280c6 Johannes Berg        2026-10-06  20039  		}
8e3d9039d280c6 Johannes Berg        2026-10-06  20040  		locked = true;
8e3d9039d280c6 Johannes Berg        2026-10-06  20041  	} else if (rdev && !need_rtnl) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20042  		/*
13c20e8be3278e Johannes Berg        2026-10-09  20043  		 * Without any mutex need a wdev reference to keep it alive,
13c20e8be3278e Johannes Berg        2026-10-09  20044  		 * see also the note about selectors - the WARN can't happen
8e3d9039d280c6 Johannes Berg        2026-10-06  20045  		 * without wrong selectors and those don't exist.
8e3d9039d280c6 Johannes Berg        2026-10-06  20046  		 */
8e3d9039d280c6 Johannes Berg        2026-10-06  20047  		put_device(&rdev->wiphy.dev);
13c20e8be3278e Johannes Berg        2026-10-09  20048  		if (WARN_ON(!wdev)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20049  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20050  			goto out;
8e3d9039d280c6 Johannes Berg        2026-10-06  20051  		}
8e3d9039d280c6 Johannes Berg        2026-10-06  20052  	}
8e3d9039d280c6 Johannes Berg        2026-10-06  20053  
8e3d9039d280c6 Johannes Berg        2026-10-06  20054  	if (wdev) {
2182db91e0016c Johannes Berg        2022-04-14  20055  		if (internal_flags & NL80211_FLAG_NEED_NETDEV) {
1bf614ef794643 Johannes Berg        2012-06-15  20056  			if (!dev) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20057  				err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20058  				goto out;
89a54e48b9cbb4 Johannes Berg        2012-06-15  20059  			}
89a54e48b9cbb4 Johannes Berg        2012-06-15  20060  
1bf614ef794643 Johannes Berg        2012-06-15  20061  			info->user_ptr[1] = dev;
1bf614ef794643 Johannes Berg        2012-06-15  20062  		} else {
1bf614ef794643 Johannes Berg        2012-06-15  20063  			info->user_ptr[1] = wdev;
4c476991062a0a Johannes Berg        2010-10-04  20064  		}
89a54e48b9cbb4 Johannes Berg        2012-06-15  20065  
2182db91e0016c Johannes Berg        2022-04-14  20066  		if (internal_flags & NL80211_FLAG_CHECK_NETDEV_UP &&
73c7da3dae1e7c Arend Van Spriel     2016-10-20  20067  		    !wdev_running(wdev)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20068  			err = -ENETDOWN;
8e3d9039d280c6 Johannes Berg        2026-10-06  20069  			goto out;
41265714810e20 Johannes Berg        2010-10-04  20070  		}
4c476991062a0a Johannes Berg        2010-10-04  20071  	}
4c476991062a0a Johannes Berg        2010-10-04  20072  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20073  	if (internal_flags & NL80211_FLAG_MLO_VALID_LINK_ID) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20074  		struct nlattr *link_id = info->attrs[NL80211_ATTR_MLO_LINK_ID];
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20075  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20076  		if (!wdev) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20077  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20078  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20079  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20080  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20081  		/* MLO -> require valid link ID */
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20082  		if (wdev->valid_links &&
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20083  		    (!link_id ||
ff3821bc355275 Veerendranath Jakkam 2022-07-11  20084  		     !(wdev->valid_links & BIT(nla_get_u8(link_id))))) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20085  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20086  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20087  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20088  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20089  		/* non-MLO -> no link ID attribute accepted */
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20090  		if (!wdev->valid_links && link_id) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20091  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20092  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20093  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20094  	}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20095  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20096  	if (internal_flags & NL80211_FLAG_MLO_UNSUPPORTED) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20097  		if (info->attrs[NL80211_ATTR_MLO_LINK_ID] ||
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20098  		    (wdev && wdev->valid_links)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20099  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20100  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20101  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20102  	}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20103  
8e3d9039d280c6 Johannes Berg        2026-10-06  20104  	info->user_ptr[0] = rdev;
a05829a7222e9d Johannes Berg        2021-01-22  20105  	/* we keep the mutex locked until post_doit */
8e3d9039d280c6 Johannes Berg        2026-10-06  20106  	if (locked)
a05829a7222e9d Johannes Berg        2021-01-22  20107  		__release(&rdev->wiphy.mtx);
a05829a7222e9d Johannes Berg        2021-01-22  20108  
4c476991062a0a Johannes Berg        2010-10-04  20109  	return 0;
8e3d9039d280c6 Johannes Berg        2026-10-06  20110  out:
8e3d9039d280c6 Johannes Berg        2026-10-06  20111  	if (locked)
8e3d9039d280c6 Johannes Berg        2026-10-06  20112  		wiphy_unlock(&rdev->wiphy);
13c20e8be3278e Johannes Berg        2026-10-09  20113  	if (wdev_ref && wdev)
13c20e8be3278e Johannes Berg        2026-10-09 @20114  		wdev_put(wdev);
13c20e8be3278e Johannes Berg        2026-10-09  20115  	else
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20116  		dev_put(dev);
8e3d9039d280c6 Johannes Berg        2026-10-06  20117  	if (need_rtnl)
8e3d9039d280c6 Johannes Berg        2026-10-06  20118  		rtnl_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20119  	return err;
8e3d9039d280c6 Johannes Berg        2026-10-06  20120  out_lookup:
8e3d9039d280c6 Johannes Berg        2026-10-06  20121  	if (need_rtnl)
8e3d9039d280c6 Johannes Berg        2026-10-06  20122  		rtnl_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20123  	else
8e3d9039d280c6 Johannes Berg        2026-10-06  20124  		rcu_read_unlock();
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20125  	return err;
4c476991062a0a Johannes Berg        2010-10-04  20126  }
4c476991062a0a Johannes Berg        2010-10-04  20127  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
