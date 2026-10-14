Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421BF1F3B85
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 02:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791943507; cv=none; b=rJSYTdVx6wgpkcrvWamY8hYLyyQ4Z4gxFPWRalo5yzWbGAoSZH6iz4sV+0btYZlAVBSVT3fCEb81eQ9rKIQXp2DR+NoBOnQa68J+ns5CUDs5awh29ObiHQTKrrIbjrcsv2ny1qdDDYLVG9i5ZTHp2GMBcYRmdVOjmwoq65hF8cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791943507; c=relaxed/simple;
	bh=P9rvsTzixTqVMKl4UQ5vQMhn0K8mDXwmEI6+QIhNYRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gUBPj2M/j+2iSI9G8Lbj+dzAuQe7vUZJiO/yvPHab8joubjbFx5mChNviKfwAFEeqU5L0GX3oCIYwDtYtnuzN/gAuMWuy5/7Trf+FHm2Chjm+RBmjBmGdgHLz08MDBymx6eZisXPQKQZK5WSz0s6n4OtGaVjq2S0TjmnFo0GEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aC4kxz/z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aC4kxz/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791943506; x=1823479506;
  h=date:from:to:cc:subject:message-id;
  bh=P9rvsTzixTqVMKl4UQ5vQMhn0K8mDXwmEI6+QIhNYRY=;
  b=aC4kxz/zJ7d/ciBPL2j60Fjc6yZ+3tF+KVHG2krAlhS17qerKhMFea0P
   BR7Uz6HJZBnwbrSWojCnquaiOnEnaCTXxHkhdXeTfcLrsRKZdzfOlDuf5
   ZPEx2zaGTdIWzg0bSHTgBGompEzmh47NKOgeEpsgOEzr7t3b3s3g1KHcf
   9mFK9HmNIvS5o6kVtQQ/jkqqv+miMxIwS2BdjwyzIbUEvoLJSBqPGrIH/
   UyY4BC3Ms/Q4JBGoZntOyLIM9DRwLmetbgFSrjkuT6z0el0RJyy+eicin
   Bzpr5ObVYNGGJf+sjuRsRSqjRVHd67n4t/EkY2HelrufvHgmeSGI309VN
   w==;
X-CSE-ConnectionGUID: YKZf8/oQQmayEKeNNud8PQ==
X-CSE-MsgGUID: bRGr8jgaT7OJQ0Vg5j5GqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="582360"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="582360"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 19:05:03 -0700
X-CSE-ConnectionGUID: Ylf7GqFaTae5mNeatb3uYw==
X-CSE-MsgGUID: EeOWHPMVTZSZg//YbV5qXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3079932"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 13 Oct 2026 19:05:01 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGoMU-00000000AoN-0K8z;
	Wed, 14 Oct 2026 02:04:58 +0000
Date: Wed, 14 Oct 2026 04:04:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath-next 15/34] net/wireless/nl80211.c:9116
 nl80211_dump_station() warn: 'wdev' is an error pointer or valid
Message-ID: <202610140456.6Tq5BU9A-lkp@intel.com>
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
commit: 599b8a3c549b2dd3277502263ee1b69bf3489f3d [15/34] wifi: cfg80211: support unlocked station get/dump
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: sparc-randconfig-r2200-20261013 (https://download.01.org/0day-ci/archive/20261014/202610140456.6Tq5BU9A-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610140456.6Tq5BU9A-lkp@intel.com/

New smatch warnings:
net/wireless/nl80211.c:9116 nl80211_dump_station() warn: 'wdev' is an error pointer or valid
net/wireless/nl80211.c:9117 nl80211_dump_station() error: 'wdev' dereferencing possible ERR_PTR()

Old smatch warnings:
net/wireless/nl80211.c:4895 nl80211_send_iface() error: we previously assumed 'rdev->ops->get_channel' could be null (see line 4818)
net/wireless/nl80211.c:20259 nl80211_pre_doit() error: 'wdev' dereferencing possible ERR_PTR()

vim +/wdev +9116 net/wireless/nl80211.c

599b8a3c549b2dd Johannes Berg    2026-10-09  8921  
2ec600d672e7448 Luis Carlos Cobo 2008-02-23  8922  static int nl80211_dump_station(struct sk_buff *skb,
2ec600d672e7448 Luis Carlos Cobo 2008-02-23  8923  				struct netlink_callback *cb)
2ec600d672e7448 Luis Carlos Cobo 2008-02-23  8924  {
1b8ec87aa077c52 Zhao, Gang       2014-04-21  8925  	struct cfg80211_registered_device *rdev;
97990a060e6757f Johannes Berg    2013-04-19  8926  	struct wireless_dev *wdev;
727afb05ef6322c P Praneesh       2026-06-14  8927  	struct nl80211_dump_station_ctx *ctx = (void *)cb->args[2];
599b8a3c549b2dd Johannes Berg    2026-10-09  8928  	struct net *netns = sock_net(cb->skb->sk);
dd21d1844aa0962 P Praneesh       2026-06-14  8929  	struct nlattr **attrbuf __free(kfree) = NULL;
599b8a3c549b2dd Johannes Berg    2026-10-09  8930  	bool locked = false;
727afb05ef6322c P Praneesh       2026-06-14  8931  	int err;
2ec600d672e7448 Luis Carlos Cobo 2008-02-23  8932  
dd21d1844aa0962 P Praneesh       2026-06-14  8933  	if (!ctx) {
dd21d1844aa0962 P Praneesh       2026-06-14  8934  		attrbuf = kzalloc_objs(*attrbuf, NUM_NL80211_ATTR);
dd21d1844aa0962 P Praneesh       2026-06-14  8935  		if (!attrbuf)
dd21d1844aa0962 P Praneesh       2026-06-14  8936  			return -ENOMEM;
dd21d1844aa0962 P Praneesh       2026-06-14  8937  	}
dd21d1844aa0962 P Praneesh       2026-06-14  8938  
599b8a3c549b2dd Johannes Berg    2026-10-09  8939  	err = __nl80211_prepare_wdev_dump(cb, &rdev, &wdev, attrbuf, false);
6774889314ba507 Johannes Berg    2010-10-04  8940  	if (err)
a05829a7222e9d1 Johannes Berg    2021-01-22  8941  		return err;
bba95fefb8e31f4 Johannes Berg    2008-07-29  8942  
727afb05ef6322c P Praneesh       2026-06-14  8943  	if (!ctx) {
727afb05ef6322c P Praneesh       2026-06-14  8944  		ctx = kzalloc_obj(*ctx);
727afb05ef6322c P Praneesh       2026-06-14  8945  		if (!ctx) {
727afb05ef6322c P Praneesh       2026-06-14  8946  			err = -ENOMEM;
727afb05ef6322c P Praneesh       2026-06-14  8947  			goto out_err;
727afb05ef6322c P Praneesh       2026-06-14  8948  		}
f9202a374ec34e7 P Praneesh       2026-06-14  8949  		cb->args[2] = (long)ctx;
dd21d1844aa0962 P Praneesh       2026-06-14  8950  		ctx->phase = NL80211_DUMP_STA_PHASE_AGGREGATED;
dd21d1844aa0962 P Praneesh       2026-06-14  8951  		ctx->dump_link_stats =
dd21d1844aa0962 P Praneesh       2026-06-14  8952  			!!attrbuf[NL80211_ATTR_STA_DUMP_LINK_STATS];
f9202a374ec34e7 P Praneesh       2026-06-14  8953  		if (attrbuf[NL80211_ATTR_MAC]) {
f9202a374ec34e7 P Praneesh       2026-06-14  8954  			const u8 *mac = nla_data(attrbuf[NL80211_ATTR_MAC]);
f9202a374ec34e7 P Praneesh       2026-06-14  8955  
f9202a374ec34e7 P Praneesh       2026-06-14  8956  			if (!is_valid_ether_addr(mac)) {
f9202a374ec34e7 P Praneesh       2026-06-14  8957  				kfree(ctx);
f9202a374ec34e7 P Praneesh       2026-06-14  8958  				cb->args[2] = 0;
f9202a374ec34e7 P Praneesh       2026-06-14  8959  				err = -EINVAL;
f9202a374ec34e7 P Praneesh       2026-06-14  8960  				goto out_err;
f9202a374ec34e7 P Praneesh       2026-06-14  8961  			}
f9202a374ec34e7 P Praneesh       2026-06-14  8962  			ctx->filter_mac = true;
f9202a374ec34e7 P Praneesh       2026-06-14  8963  			memcpy(ctx->filter_mac_addr, mac, ETH_ALEN);
f9202a374ec34e7 P Praneesh       2026-06-14  8964  		}
727afb05ef6322c P Praneesh       2026-06-14  8965  	}
727afb05ef6322c P Praneesh       2026-06-14  8966  
1f1101c29e55195 Miri Korenblit   2026-03-18  8967  	if (!wdev->netdev && wdev->iftype != NL80211_IFTYPE_NAN) {
97990a060e6757f Johannes Berg    2013-04-19  8968  		err = -EINVAL;
97990a060e6757f Johannes Berg    2013-04-19  8969  		goto out_err;
97990a060e6757f Johannes Berg    2013-04-19  8970  	}
97990a060e6757f Johannes Berg    2013-04-19  8971  
f9202a374ec34e7 P Praneesh       2026-06-14  8972  	if (ctx->filter_mac) {
f9202a374ec34e7 P Praneesh       2026-06-14  8973  		if (!rdev->ops->get_station) {
f9202a374ec34e7 P Praneesh       2026-06-14  8974  			err = -EOPNOTSUPP;
f9202a374ec34e7 P Praneesh       2026-06-14  8975  			goto out_err;
f9202a374ec34e7 P Praneesh       2026-06-14  8976  		}
f9202a374ec34e7 P Praneesh       2026-06-14  8977  	} else if (!rdev->ops->dump_station) {
eec60b037a87551 Jouni Malinen    2009-03-20  8978  		err = -EOPNOTSUPP;
bba95fefb8e31f4 Johannes Berg    2008-07-29  8979  		goto out_err;
bba95fefb8e31f4 Johannes Berg    2008-07-29  8980  	}
2ec600d672e7448 Luis Carlos Cobo 2008-02-23  8981  
727afb05ef6322c P Praneesh       2026-06-14  8982  	while (true) {
727afb05ef6322c P Praneesh       2026-06-14  8983  		void *hdr;
dd21d1844aa0962 P Praneesh       2026-06-14  8984  		int ret;
49e47223ecc4af0 Sarika Sharma    2025-05-28  8985  
dd21d1844aa0962 P Praneesh       2026-06-14  8986  		/* AGGREGATED phase: fetch sinfo from driver once per station */
dd21d1844aa0962 P Praneesh       2026-06-14  8987  		if (ctx->phase == NL80211_DUMP_STA_PHASE_AGGREGATED) {
727afb05ef6322c P Praneesh       2026-06-14  8988  			memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
727afb05ef6322c P Praneesh       2026-06-14  8989  			for (int i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
727afb05ef6322c P Praneesh       2026-06-14  8990  				ctx->sinfo.links[i] =
727afb05ef6322c P Praneesh       2026-06-14  8991  					kzalloc_obj(*ctx->sinfo.links[0]);
727afb05ef6322c P Praneesh       2026-06-14  8992  				if (!ctx->sinfo.links[i]) {
49e47223ecc4af0 Sarika Sharma    2025-05-28  8993  					err = -ENOMEM;
727afb05ef6322c P Praneesh       2026-06-14  8994  					goto out_err_release;
49e47223ecc4af0 Sarika Sharma    2025-05-28  8995  				}
49e47223ecc4af0 Sarika Sharma    2025-05-28  8996  			}
49e47223ecc4af0 Sarika Sharma    2025-05-28  8997  
599b8a3c549b2dd Johannes Berg    2026-10-09  8998  			if (ctx->filter_mac && ctx->sta_idx > 0) {
f9202a374ec34e7 P Praneesh       2026-06-14  8999  				err = skb->len;
f9202a374ec34e7 P Praneesh       2026-06-14  9000  				goto out_err_release;
f9202a374ec34e7 P Praneesh       2026-06-14  9001  			}
599b8a3c549b2dd Johannes Berg    2026-10-09  9002  
599b8a3c549b2dd Johannes Berg    2026-10-09  9003  			err = nl80211_fill_station_info(rdev, wdev, ctx,
599b8a3c549b2dd Johannes Berg    2026-10-09  9004  							locked);
599b8a3c549b2dd Johannes Berg    2026-10-09  9005  			if (err == -EAGAIN && !locked) {
599b8a3c549b2dd Johannes Berg    2026-10-09  9006  				cfg80211_sinfo_release_content(&ctx->sinfo);
599b8a3c549b2dd Johannes Berg    2026-10-09  9007  				memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
599b8a3c549b2dd Johannes Berg    2026-10-09  9008  
599b8a3c549b2dd Johannes Berg    2026-10-09  9009  				/* this fails if the wdev is being removed */
599b8a3c549b2dd Johannes Berg    2026-10-09  9010  				wdev = __nl80211_lock_held_wdev(rdev, netns,
599b8a3c549b2dd Johannes Berg    2026-10-09  9011  								wdev);
599b8a3c549b2dd Johannes Berg    2026-10-09  9012  				if (IS_ERR(wdev)) {
599b8a3c549b2dd Johannes Berg    2026-10-09  9013  					err = PTR_ERR(wdev);
599b8a3c549b2dd Johannes Berg    2026-10-09  9014  					goto out_err;
599b8a3c549b2dd Johannes Berg    2026-10-09  9015  				}
599b8a3c549b2dd Johannes Berg    2026-10-09  9016  
599b8a3c549b2dd Johannes Berg    2026-10-09  9017  				/* try again locked now */
599b8a3c549b2dd Johannes Berg    2026-10-09  9018  				locked = true;
599b8a3c549b2dd Johannes Berg    2026-10-09  9019  				continue;
f9202a374ec34e7 P Praneesh       2026-06-14  9020  			}
727afb05ef6322c P Praneesh       2026-06-14  9021  			if (err == -ENOENT) {
727afb05ef6322c P Praneesh       2026-06-14  9022  				err = skb->len;
727afb05ef6322c P Praneesh       2026-06-14  9023  				goto out_err_release;
727afb05ef6322c P Praneesh       2026-06-14  9024  			}
bba95fefb8e31f4 Johannes Berg    2008-07-29  9025  			if (err)
727afb05ef6322c P Praneesh       2026-06-14  9026  				goto out_err_release;
bba95fefb8e31f4 Johannes Berg    2008-07-29  9027  
727afb05ef6322c P Praneesh       2026-06-14  9028  			if (ctx->sinfo.valid_links)
727afb05ef6322c P Praneesh       2026-06-14  9029  				cfg80211_sta_set_mld_sinfo(&ctx->sinfo);
dd21d1844aa0962 P Praneesh       2026-06-14  9030  		} else {
dd21d1844aa0962 P Praneesh       2026-06-14  9031  			/* PER_LINK phase: advance to next valid link */
dd21d1844aa0962 P Praneesh       2026-06-14  9032  			while (ctx->link_idx < IEEE80211_MLD_MAX_NUM_LINKS &&
dd21d1844aa0962 P Praneesh       2026-06-14  9033  			       !(ctx->sinfo.valid_links & BIT(ctx->link_idx)))
dd21d1844aa0962 P Praneesh       2026-06-14  9034  				ctx->link_idx++;
dd21d1844aa0962 P Praneesh       2026-06-14  9035  
dd21d1844aa0962 P Praneesh       2026-06-14  9036  			if (ctx->link_idx >= IEEE80211_MLD_MAX_NUM_LINKS) {
dd21d1844aa0962 P Praneesh       2026-06-14  9037  				cfg80211_sinfo_release_content(&ctx->sinfo);
dd21d1844aa0962 P Praneesh       2026-06-14  9038  				ctx->sta_idx++;
dd21d1844aa0962 P Praneesh       2026-06-14  9039  				ctx->phase = NL80211_DUMP_STA_PHASE_AGGREGATED;
dd21d1844aa0962 P Praneesh       2026-06-14  9040  				continue;
dd21d1844aa0962 P Praneesh       2026-06-14  9041  			}
dd21d1844aa0962 P Praneesh       2026-06-14  9042  		}
9a44b5e36cd699f Sarika Sharma    2025-07-14  9043  
dd21d1844aa0962 P Praneesh       2026-06-14  9044  		/* Build common header for both phases */
727afb05ef6322c P Praneesh       2026-06-14  9045  		hdr = nl80211hdr_put(skb, NETLINK_CB(cb->skb).portid,
2ec600d672e7448 Luis Carlos Cobo 2008-02-23  9046  				     cb->nlh->nlmsg_seq, NLM_F_MULTI,
727afb05ef6322c P Praneesh       2026-06-14  9047  				     NL80211_CMD_NEW_STATION);
727afb05ef6322c P Praneesh       2026-06-14  9048  		if (!hdr) {
727afb05ef6322c P Praneesh       2026-06-14  9049  			err = skb->len;
dd21d1844aa0962 P Praneesh       2026-06-14  9050  			if (ctx->phase == NL80211_DUMP_STA_PHASE_PER_LINK)
dd21d1844aa0962 P Praneesh       2026-06-14  9051  				goto out_err;
727afb05ef6322c P Praneesh       2026-06-14  9052  			goto out_err_release;
727afb05ef6322c P Praneesh       2026-06-14  9053  		}
bba95fefb8e31f4 Johannes Berg    2008-07-29  9054  
727afb05ef6322c P Praneesh       2026-06-14  9055  		if ((wdev->netdev &&
727afb05ef6322c P Praneesh       2026-06-14  9056  		     nla_put_u32(skb, NL80211_ATTR_IFINDEX,
727afb05ef6322c P Praneesh       2026-06-14  9057  				 wdev->netdev->ifindex)) ||
727afb05ef6322c P Praneesh       2026-06-14  9058  		    nla_put_u64_64bit(skb, NL80211_ATTR_WDEV,
727afb05ef6322c P Praneesh       2026-06-14  9059  				      wdev_id(wdev), NL80211_ATTR_PAD) ||
727afb05ef6322c P Praneesh       2026-06-14  9060  		    nla_put(skb, NL80211_ATTR_MAC, ETH_ALEN, ctx->mac_addr) ||
727afb05ef6322c P Praneesh       2026-06-14  9061  		    nla_put_u32(skb, NL80211_ATTR_GENERATION,
727afb05ef6322c P Praneesh       2026-06-14  9062  				ctx->sinfo.generation)) {
727afb05ef6322c P Praneesh       2026-06-14  9063  			genlmsg_cancel(skb, hdr);
727afb05ef6322c P Praneesh       2026-06-14  9064  			err = skb->len;
dd21d1844aa0962 P Praneesh       2026-06-14  9065  			if (ctx->phase == NL80211_DUMP_STA_PHASE_PER_LINK)
dd21d1844aa0962 P Praneesh       2026-06-14  9066  				goto out_err;
727afb05ef6322c P Praneesh       2026-06-14  9067  			goto out_err_release;
2ec600d672e7448 Luis Carlos Cobo 2008-02-23  9068  		}
2ec600d672e7448 Luis Carlos Cobo 2008-02-23  9069  
dd21d1844aa0962 P Praneesh       2026-06-14  9070  		switch (ctx->phase) {
dd21d1844aa0962 P Praneesh       2026-06-14  9071  		case NL80211_DUMP_STA_PHASE_AGGREGATED:
dd21d1844aa0962 P Praneesh       2026-06-14  9072  			ret = nl80211_put_sta_info_common(skb, rdev, &ctx->sinfo);
dd21d1844aa0962 P Praneesh       2026-06-14  9073  			if (ret) {
727afb05ef6322c P Praneesh       2026-06-14  9074  				genlmsg_cancel(skb, hdr);
dd21d1844aa0962 P Praneesh       2026-06-14  9075  				err = ret;
727afb05ef6322c P Praneesh       2026-06-14  9076  				goto out_err_release;
727afb05ef6322c P Praneesh       2026-06-14  9077  			}
727afb05ef6322c P Praneesh       2026-06-14  9078  			genlmsg_end(skb, hdr);
dd21d1844aa0962 P Praneesh       2026-06-14  9079  
dd21d1844aa0962 P Praneesh       2026-06-14  9080  			if (ctx->dump_link_stats && ctx->sinfo.valid_links) {
dd21d1844aa0962 P Praneesh       2026-06-14  9081  				ctx->phase = NL80211_DUMP_STA_PHASE_PER_LINK;
dd21d1844aa0962 P Praneesh       2026-06-14  9082  				ctx->link_idx = 0;
dd21d1844aa0962 P Praneesh       2026-06-14  9083  			} else {
727afb05ef6322c P Praneesh       2026-06-14  9084  				cfg80211_sinfo_release_content(&ctx->sinfo);
727afb05ef6322c P Praneesh       2026-06-14  9085  				ctx->sta_idx++;
727afb05ef6322c P Praneesh       2026-06-14  9086  			}
dd21d1844aa0962 P Praneesh       2026-06-14  9087  			break;
dd21d1844aa0962 P Praneesh       2026-06-14  9088  
dd21d1844aa0962 P Praneesh       2026-06-14  9089  		case NL80211_DUMP_STA_PHASE_PER_LINK:
dd21d1844aa0962 P Praneesh       2026-06-14  9090  			ret = nl80211_put_link_station_payload(skb, rdev,
dd21d1844aa0962 P Praneesh       2026-06-14  9091  							       &ctx->sinfo,
dd21d1844aa0962 P Praneesh       2026-06-14  9092  							       ctx->link_idx);
dd21d1844aa0962 P Praneesh       2026-06-14  9093  			if (ret == -EMSGSIZE) {
dd21d1844aa0962 P Praneesh       2026-06-14  9094  				genlmsg_cancel(skb, hdr);
bba95fefb8e31f4 Johannes Berg    2008-07-29  9095  				err = skb->len;
dd21d1844aa0962 P Praneesh       2026-06-14  9096  				goto out_err;
dd21d1844aa0962 P Praneesh       2026-06-14  9097  			}
dd21d1844aa0962 P Praneesh       2026-06-14  9098  			if (ret) {
dd21d1844aa0962 P Praneesh       2026-06-14  9099  				/* skip invalid link, do not abort the dump */
dd21d1844aa0962 P Praneesh       2026-06-14  9100  				genlmsg_cancel(skb, hdr);
dd21d1844aa0962 P Praneesh       2026-06-14  9101  				ctx->link_idx++;
dd21d1844aa0962 P Praneesh       2026-06-14  9102  				continue;
dd21d1844aa0962 P Praneesh       2026-06-14  9103  			}
dd21d1844aa0962 P Praneesh       2026-06-14  9104  			genlmsg_end(skb, hdr);
dd21d1844aa0962 P Praneesh       2026-06-14  9105  			ctx->link_idx++;
dd21d1844aa0962 P Praneesh       2026-06-14  9106  			break;
dd21d1844aa0962 P Praneesh       2026-06-14  9107  		}
dd21d1844aa0962 P Praneesh       2026-06-14  9108  	}
727afb05ef6322c P Praneesh       2026-06-14  9109  
727afb05ef6322c P Praneesh       2026-06-14  9110  out_err_release:
727afb05ef6322c P Praneesh       2026-06-14  9111  	cfg80211_sinfo_release_content(&ctx->sinfo);
727afb05ef6322c P Praneesh       2026-06-14  9112  	memset(&ctx->sinfo, 0, sizeof(ctx->sinfo));
bba95fefb8e31f4 Johannes Berg    2008-07-29  9113  out_err:
599b8a3c549b2dd Johannes Berg    2026-10-09  9114  	if (locked)
a05829a7222e9d1 Johannes Berg    2021-01-22  9115  		wiphy_unlock(&rdev->wiphy);
599b8a3c549b2dd Johannes Berg    2026-10-09 @9116  	else if (wdev)
599b8a3c549b2dd Johannes Berg    2026-10-09 @9117  		wdev_put(wdev);
bba95fefb8e31f4 Johannes Berg    2008-07-29  9118  
bba95fefb8e31f4 Johannes Berg    2008-07-29  9119  	return err;
2ec600d672e7448 Luis Carlos Cobo 2008-02-23  9120  }
fd5b74dcb88cfc1 Johannes Berg    2007-12-19  9121  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
