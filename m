Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1142981E
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 05:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449761; cv=none; b=hzutZigsyO3X9jwH4QdKFt3u3LroQrmkGEF0+8QFN4KJ9SEiikuaYmTuDFT+tfHH3GbsbOsUvPZj0J2QRiF++EZ53SpT0R24ham1JxUTmJqhGgQFyOf3R2ZQ5Cyw4mgWfNJ01Q9wiiwh+eSIH8VpnlEC3kPJoZYr/Eb/MgZd5Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449761; c=relaxed/simple;
	bh=Wcb/RjBmiBobkAX5Nfv8qmPyKQIrI2JqC1cGO/hmZ44=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qdbBF7oCSZAsuXwlBKN3lDCwciMPIKJXazNBD9EAhVItwBa5AvgTTP+YGEuVFaYCYjiwKf7te0FTt8y9XQTkM100lTaSgVHz9a4GqizVxbQpBoaQOS7XdWQfBnIf5BJtNGpBgQeeBmm4r4yQRV4370zrpkd7aGP0fyjPHw/gQhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbHI9Cgo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbHI9Cgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789449759; x=1820985759;
  h=date:from:to:cc:subject:message-id;
  bh=Wcb/RjBmiBobkAX5Nfv8qmPyKQIrI2JqC1cGO/hmZ44=;
  b=QbHI9CgoCltoEOxU+2RVz2OLwmz9tDC0JG1BPAdKB+9iRA4MzA7205lf
   ys/c1ymaQ9SYfkgGU5IHQFkukXSZjQkJ4RfjgQEMbC5ZWpzUeOUetgwjP
   /uoi1/HwdvJBCw+7p6M5RYml2NGQNM9ndvW2OJkxAfu2tYTgRctrWCUww
   uOeTNxFfIPa0X4jBB1K+pAa2xYTLqkQYlrMbCpf9Lf2SEC8ANDZ8Vmrl4
   kDQ3phSIiN72VmvXhgeaRfuGfC7sOx2EnUKKYw+kt9kWduEjVpM2zjsU9
   ELABjKKfFmqKnkwgWyFQSe/BMPOqIyWGr5apdpURYENaYbp3eczhSxzlq
   g==;
X-CSE-ConnectionGUID: me817AwRQEufMamAawtt4w==
X-CSE-MsgGUID: CC3OJUnDSDSrHy8TJWl38g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101154002"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101154002"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:22:36 -0700
X-CSE-ConnectionGUID: AX09SOEsS92o9xi2psRqyg==
X-CSE-MsgGUID: VSBdYEEHRlyPLaQx8a2cwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269572937"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 Sep 2026 22:22:35 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Lcn-000000000Vx-1CD6;
	Tue, 15 Sep 2026 05:22:33 +0000
Date: Tue, 15 Sep 2026 07:22:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/nxp/nxpwifi/cfg80211.c:3401:1-5: alloc
 with no test, possible model on line 3403
Message-ID: <202609150741.WnNNTCOF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jeff Chen <jeff.chen_1@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   587858367581b9c55c3690f4e63382ad622719d4
commit: 73b01e57ed3e3d6102c0cbcb21f62086c5429437 wifi: nxp: add nxpwifi driver for IW61x
date:   9 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-101-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150741.WnNNTCOF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609150741.WnNNTCOF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/nxp/nxpwifi/cfg80211.c:3401:1-5: alloc with no test, possible model on line 3403
--
>> drivers/net/wireless/nxp/nxpwifi/debugfs.c:948:11-13: WARNING opportunity for min()
--
>> drivers/net/wireless/nxp/nxpwifi/main.c:522:2-3: Unneeded semicolon
--
>> drivers/net/wireless/nxp/nxpwifi/debugfs.c:101:34-66: opportunity for str_on_off(( netif_carrier_ok ( priv -> netdev ) ))
--
>> drivers/net/wireless/nxp/nxpwifi/main.c:1091:35-65: opportunity for str_on_off(netif_carrier_ok ( priv -> netdev ))
--
>> drivers/net/wireless/nxp/nxpwifi/11n_rxreorder.c:210:26-29: ERROR: invalid reference to the index variable of the iterator on line 217

vim +3401 drivers/net/wireless/nxp/nxpwifi/cfg80211.c

73b01e57ed3e3d6 Jeff Chen 2026-06-05  3312  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3313  static int
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3314  nxpwifi_cfg80211_authenticate(struct wiphy *wiphy,
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3315  			      struct net_device *dev,
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3316  			      struct cfg80211_auth_request *req)
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3317  {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3318  	struct nxpwifi_private *priv = nxpwifi_netdev_get_priv(dev);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3319  	struct nxpwifi_adapter *adapter = priv->adapter;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3320  	struct sk_buff *skb;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3321  	u16 pkt_len, auth_alg;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3322  	int ret;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3323  	struct ieee80211_mgmt *mgmt;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3324  	struct nxpwifi_txinfo *tx_info;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3325  	u8 trans = 1, status_code = 0;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3326  	u8 *varptr = NULL;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3327  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3328  	if (GET_BSS_ROLE(priv) == NXPWIFI_BSS_ROLE_UAP) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3329  		nxpwifi_dbg(adapter, ERROR, "Interface role is AP\n");
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3330  		return -EINVAL;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3331  	}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3332  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3333  	if (priv->wdev.iftype != NL80211_IFTYPE_STATION) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3334  		nxpwifi_dbg(adapter, ERROR,
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3335  			    "Interface type is not correct (type %d)\n",
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3336  			    priv->wdev.iftype);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3337  		return -EINVAL;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3338  	}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3339  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3340  	if (!nxpwifi_is_channel_setting_allowable(priv, req->bss->channel))
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3341  		return -EOPNOTSUPP;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3342  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3343  	if (priv->auth_alg != WLAN_AUTH_SAE &&
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3344  	    (priv->auth_flag & HOST_MLME_AUTH_PENDING)) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3345  		nxpwifi_dbg(adapter, ERROR, "Pending auth on going\n");
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3346  		return -EBUSY;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3347  	}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3348  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3349  	if (!priv->host_mlme_reg) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3350  		priv->host_mlme_reg = true;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3351  		priv->mgmt_frame_mask |= HOST_MLME_MGMT_MASK;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3352  		nxpwifi_mgmt_frame_reg(priv, priv->mgmt_frame_mask);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3353  	}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3354  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3355  	switch (req->auth_type) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3356  	case NL80211_AUTHTYPE_OPEN_SYSTEM:
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3357  		auth_alg = WLAN_AUTH_OPEN;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3358  		break;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3359  	case NL80211_AUTHTYPE_SHARED_KEY:
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3360  		auth_alg = WLAN_AUTH_SHARED_KEY;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3361  		break;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3362  	case NL80211_AUTHTYPE_FT:
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3363  		auth_alg = WLAN_AUTH_FT;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3364  		break;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3365  	case NL80211_AUTHTYPE_NETWORK_EAP:
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3366  		auth_alg = WLAN_AUTH_LEAP;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3367  		break;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3368  	case NL80211_AUTHTYPE_SAE:
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3369  		auth_alg = WLAN_AUTH_SAE;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3370  		break;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3371  	default:
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3372  		nxpwifi_dbg(adapter, ERROR,
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3373  			    "unsupported auth type=%d\n", req->auth_type);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3374  		return -EOPNOTSUPP;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3375  	}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3376  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3377  	if (!(priv->auth_flag & HOST_MLME_AUTH_PENDING)) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3378  		ret = nxpwifi_remain_on_chan_cfg(priv, HOST_ACT_GEN_SET,
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3379  						 req->bss->channel,
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3380  						 AUTH_TX_DEFAULT_WAIT_TIME);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3381  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3382  		if (!ret) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3383  			priv->roc_cfg.cookie =
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3384  				nxpwifi_roc_cookie(adapter);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3385  			priv->roc_cfg.chan = *req->bss->channel;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3386  		} else {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3387  			return -EPERM;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3388  		}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3389  	}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3390  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3391  	priv->sec_info.authentication_mode = auth_alg;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3392  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3393  	nxpwifi_cancel_scan(adapter);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3394  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3395  	pkt_len = (u16)req->ie_len + req->auth_data_len +
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3396  		NXPWIFI_MGMT_HEADER_LEN + NXPWIFI_AUTH_BODY_LEN;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3397  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3398  	if (req->auth_data_len >= 4)
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3399  		pkt_len -= 4;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3400  
73b01e57ed3e3d6 Jeff Chen 2026-06-05 @3401  	mgmt = kzalloc(pkt_len, GFP_KERNEL);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3402  
73b01e57ed3e3d6 Jeff Chen 2026-06-05 @3403  	skb = dev_alloc_skb(NXPWIFI_MIN_DATA_HEADER_LEN +
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3404  			    NXPWIFI_MGMT_FRAME_HEADER_SIZE +
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3405  			    pkt_len + sizeof(pkt_len));
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3406  	if (!skb) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3407  		nxpwifi_dbg(adapter, ERROR,
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3408  			    "allocate skb failed for management frame\n");
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3409  		return -ENOMEM;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3410  	}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3411  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3412  	tx_info = NXPWIFI_SKB_TXCB(skb);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3413  	memset(tx_info, 0, sizeof(*tx_info));
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3414  	tx_info->bss_num = priv->bss_num;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3415  	tx_info->bss_type = priv->bss_type;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3416  	tx_info->pkt_len = pkt_len;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3417  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3418  	memcpy(mgmt->da, req->bss->bssid, ETH_ALEN);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3419  	memcpy(mgmt->sa, priv->curr_addr, ETH_ALEN);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3420  	memcpy(mgmt->bssid, req->bss->bssid, ETH_ALEN);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3421  	mgmt->frame_control =
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3422  		cpu_to_le16(IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_AUTH);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3423  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3424  	if (req->auth_data_len >= 4) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3425  		if (req->auth_type == NL80211_AUTHTYPE_SAE) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3426  			__le16 *pos = (__le16 *)req->auth_data;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3427  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3428  			trans = le16_to_cpu(pos[0]);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3429  			status_code = le16_to_cpu(pos[1]);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3430  		}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3431  		memcpy((u8 *)(&mgmt->u.auth.variable), req->auth_data + 4,
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3432  		       req->auth_data_len - 4);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3433  		varptr = (u8 *)&mgmt->u.auth.variable +
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3434  			 (req->auth_data_len - 4);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3435  	}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3436  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3437  	mgmt->u.auth.auth_alg = cpu_to_le16(auth_alg);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3438  	mgmt->u.auth.auth_transaction = cpu_to_le16(trans);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3439  	mgmt->u.auth.status_code = cpu_to_le16(status_code);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3440  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3441  	if (req->ie && req->ie_len) {
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3442  		if (!varptr)
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3443  			varptr = (u8 *)&mgmt->u.auth.variable;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3444  		memcpy((u8 *)varptr, req->ie, req->ie_len);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3445  	}
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3446  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3447  	nxpwifi_form_mgmt_frame(skb, (const u8 *)mgmt, pkt_len);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3448  	kfree(mgmt);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3449  	priv->auth_flag = HOST_MLME_AUTH_PENDING;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3450  	priv->auth_alg = auth_alg;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3451  	skb->priority = WMM_HIGHEST_PRIORITY;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3452  	__net_timestamp(skb);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3453  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3454  	nxpwifi_dbg(adapter, MSG,
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3455  		    "auth: send authentication to %pM\n", req->bss->bssid);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3456  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3457  	nxpwifi_queue_tx_pkt(priv, skb);
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3458  
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3459  	return 0;
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3460  }
73b01e57ed3e3d6 Jeff Chen 2026-06-05  3461  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
