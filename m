Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AA34EF1F
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 03:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791949699; cv=none; b=J0VrJDBye5XlC6VH5jIO5cMGv52s4cGygDcAc8xZLl5A+P77dFjew04TWuaHPKfBzIktD/jMUQXwa3WgPWk/ndUf9zolKNFDBEiRsYvOmxfXVnjf3h//SCeA45qA6mgEV9PZbU0eF+XuvbTLn/+uZTTx4qRxD6/xAaL42BtwVEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791949699; c=relaxed/simple;
	bh=Cyc/rKwPJQWasQrDecpOKEfjSO6waegUd9cWUVHWGv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=khIzDXAuL8AL9OGPIfehV2+yVE+eK+UUdfF1mKxM2pxiF6ZLr7E73lPUsjY2RRL+keq9nm/AZaAxgz9AvNoKVS7Pa8V/VSDbHZ4LGVKS9aKiEWRgnac4mQ6XPa7Aq4V1ErmoVilUrUs2LEXd3IoZkpJfjpWfZ8q9pRuczIzvgiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9mKvyQb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9mKvyQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791949695; x=1823485695;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Cyc/rKwPJQWasQrDecpOKEfjSO6waegUd9cWUVHWGv4=;
  b=b9mKvyQbpjyDiMrsweOXAYrnKf6IVjNQcYQFD0Pciigr3GiepqonmoVj
   rumKbJCh6LBEyLtobNfer0KUAf45ucSmU21Sx3NNN+oOenf7GgtEjzCil
   +/szjiPIzOLuv/w8z427biRUvedK6QgAUjdKtF61otVeJHlwWogznnwON
   uI/hDpVBg486Sj8llE5ceHSU1ojn3OZ/BOsV7JAyk/vpca8jCzwGSHSLO
   l+A7e+cHBPwulRS5VBXxYmzJaQJ9mxZicmSaGNbJa8+GCTO5TDMjR5POL
   Yhzq9RdJaCH/PPHbZRWJsorCgbnuakJtTP0eKgfO8U4TZH8fDHPXmIZj8
   g==;
X-CSE-ConnectionGUID: IBlUDPvAQJKYy5dgCr6wPQ==
X-CSE-MsgGUID: ynV6VHgPT7G0vskaj7gNpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="572922"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="572922"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:48:14 -0700
X-CSE-ConnectionGUID: HFSQdbnTTcmtSeu/VPz23A==
X-CSE-MsgGUID: X2KvY0kqTjusqj/V9byhRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1648232"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Oct 2026 20:48:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGpyL-00000000AqJ-3QZE;
	Wed, 14 Oct 2026 03:48:09 +0000
Date: Wed, 14 Oct 2026 05:47:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath-next 24/34] net/wireless/nl80211.c:4433
 nl80211_set_wiphy() warn: iterator used outside loop: 'wdev'
Message-ID: <202610140518.ynVDJha8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Jeff Johnson <jjohnson@kernel.org>
CC: ath12k@lists.infradead.org
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
head:   cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
commit: ef27674b8471b5d1c80fe5ebfaa4f2b07dfb1096 [24/34] wifi: cfg80211: pr=
otect wiphy names with cfg80211_mutex
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: sparc-randconfig-r2200-20261013 (https://download.01.org/0day-ci/ar=
chive/20261014/202610140518.ynVDJha8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610140518.ynVDJha8-lkp@intel.com/

New smatch warnings:
net/wireless/nl80211.c:4433 nl80211_set_wiphy() warn: iterator used outside=
 loop: 'wdev'

Old smatch warnings:
net/wireless/nl80211.c:4915 nl80211_send_iface() error: we previously assum=
ed 'rdev->ops->get_channel' could be null (see line 4838)
net/wireless/nl80211.c:9136 nl80211_dump_station() warn: 'wdev' is an error=
 pointer or valid
net/wireless/nl80211.c:9137 nl80211_dump_station() error: 'wdev' dereferenc=
ing possible ERR_PTR()
net/wireless/nl80211.c:20272 nl80211_pre_doit() error: 'wdev' dereferencing=
 possible ERR_PTR()

vim +/wdev +4433 net/wireless/nl80211.c

264637941cf45c Roopni Devanathan      2025-06-15  4370 =20
556829657397b9 Johannes Berg          2007-09-20  4371  static int nl80211_=
set_wiphy(struct sk_buff *skb, struct genl_info *info)
556829657397b9 Johannes Berg          2007-09-20  4372  {
a05829a7222e9d Johannes Berg          2021-01-22  4373  	struct cfg80211_re=
gistered_device *rdev =3D NULL;
f444de05d20e27 Johannes Berg          2010-05-05  4374  	struct net_device =
*netdev =3D NULL;
ef27674b8471b5 Johannes Berg          2026-10-11  4375  	struct wireless_de=
v *wdev =3D NULL;
a1e567c83f5414 Bill Jordan            2010-09-10  4376  	int result =3D 0, =
rem_txq_params =3D 0;
318884875bdddc Jouni Malinen          2008-10-30  4377  	struct nlattr *nl_=
txq_params;
ef27674b8471b5 Johannes Berg          2026-10-11  4378  	u32 changed, wdev_=
id =3D 0;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4379  	u8 retry_short =3D =
0, retry_long =3D 0;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4380  	u32 frag_threshold=
 =3D 0, rts_threshold =3D 0;
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4381  	u8 cover=
age_class =3D 0;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4382  	u32 txq_=
limit =3D 0, txq_memory_limit =3D 0, txq_quantum =3D 0;
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4383  	int radio_idx =3D =
-1;
556829657397b9 Johannes Berg          2007-09-20  4384 =20
ef27674b8471b5 Johannes Berg          2026-10-11  4385  	/* keeps the wiphy=
 registered and its netns stable */
ef27674b8471b5 Johannes Berg          2026-10-11  4386  	mutex_lock(&cfg802=
11_mutex);
f444de05d20e27 Johannes Berg          2010-05-05  4387  	/*
f444de05d20e27 Johannes Berg          2010-05-05  4388  	 * Try to find the=
 wiphy and netdev. Normally this
f444de05d20e27 Johannes Berg          2010-05-05  4389  	 * function should=
n't need the netdev, but this is
f444de05d20e27 Johannes Berg          2010-05-05  4390  	 * done for backwa=
rd compatibility -- previously
f444de05d20e27 Johannes Berg          2010-05-05  4391  	 * setting the cha=
nnel was done per wiphy, but now
f444de05d20e27 Johannes Berg          2010-05-05  4392  	 * it is per netde=
v. Previous userland like hostapd
f444de05d20e27 Johannes Berg          2010-05-05  4393  	 * also passed a n=
etdev to set_wiphy, so that it is
f444de05d20e27 Johannes Berg          2010-05-05  4394  	 * possible to let=
 that go to the right netdev!
f444de05d20e27 Johannes Berg          2010-05-05  4395  	 */
4bbf4d56583dd5 Johannes Berg          2009-03-24  4396 =20
f444de05d20e27 Johannes Berg          2010-05-05  4397  	if (info->attrs[NL=
80211_ATTR_IFINDEX]) {
f444de05d20e27 Johannes Berg          2010-05-05  4398  		int ifindex =3D n=
la_get_u32(info->attrs[NL80211_ATTR_IFINDEX]);
f444de05d20e27 Johannes Berg          2010-05-05  4399 =20
ef27674b8471b5 Johannes Berg          2026-10-11  4400  		rcu_read_lock();
ef27674b8471b5 Johannes Berg          2026-10-11  4401  		netdev =3D dev_ge=
t_by_index_rcu(genl_info_net(info), ifindex);
ef27674b8471b5 Johannes Berg          2026-10-11  4402  		if (netdev && net=
dev->ieee80211_ptr) {
f26cbf401be935 Zhao, Gang             2014-04-21  4403  			rdev =3D wiphy_t=
o_rdev(netdev->ieee80211_ptr->wiphy);
ef27674b8471b5 Johannes Berg          2026-10-11  4404  			wdev_id =3D netd=
ev->ieee80211_ptr->identifier;
ef27674b8471b5 Johannes Berg          2026-10-11  4405  		}
ef27674b8471b5 Johannes Berg          2026-10-11  4406  		rcu_read_unlock();
f444de05d20e27 Johannes Berg          2010-05-05  4407  	}
f444de05d20e27 Johannes Berg          2010-05-05  4408 =20
ef27674b8471b5 Johannes Berg          2026-10-11  4409  	if (!rdev) {
ef27674b8471b5 Johannes Berg          2026-10-11  4410  		/* RCU for the wd=
ev list walk, cfg80211_mutex keeps rdev */
ef27674b8471b5 Johannes Berg          2026-10-11  4411  		rcu_read_lock();
878d9ec7367816 Johannes Berg          2012-06-15  4412  		rdev =3D __cfg802=
11_rdev_from_attrs(genl_info_net(info),
878d9ec7367816 Johannes Berg          2012-06-15  4413  						  info->attrs=
);
ef27674b8471b5 Johannes Berg          2026-10-11  4414  		rcu_read_unlock();
a05829a7222e9d Johannes Berg          2021-01-22  4415  		if (IS_ERR(rdev))=
 {
ef27674b8471b5 Johannes Berg          2026-10-11  4416  			mutex_unlock(&cf=
g80211_mutex);
4c476991062a0a Johannes Berg          2010-10-04  4417  			return PTR_ERR(r=
dev);
a05829a7222e9d Johannes Berg          2021-01-22  4418  		}
ef27674b8471b5 Johannes Berg          2026-10-11  4419  	}
f444de05d20e27 Johannes Berg          2010-05-05  4420 =20
f42d22d3f79639 Johannes Berg          2024-11-22  4421  	guard(wiphy)(&rdev=
->wiphy);
a05829a7222e9d Johannes Berg          2021-01-22  4422 =20
ef27674b8471b5 Johannes Berg          2026-10-11  4423  	/* the netdev may =
have been unregistered after the lookup */
ef27674b8471b5 Johannes Berg          2026-10-11  4424  	if (wdev_id) {
ef27674b8471b5 Johannes Berg          2026-10-11  4425  		list_for_each_ent=
ry(wdev, &rdev->wiphy.wdev_list, list) {
ef27674b8471b5 Johannes Berg          2026-10-11  4426  			if (wdev->identi=
fier =3D=3D wdev_id)
ef27674b8471b5 Johannes Berg          2026-10-11  4427  				break;
ef27674b8471b5 Johannes Berg          2026-10-11  4428  		}
ef27674b8471b5 Johannes Berg          2026-10-11  4429  		if (list_entry_is=
_head(wdev, &rdev->wiphy.wdev_list, list)) {
ef27674b8471b5 Johannes Berg          2026-10-11  4430  			mutex_unlock(&cf=
g80211_mutex);
ef27674b8471b5 Johannes Berg          2026-10-11  4431  			return -ENODEV;
ef27674b8471b5 Johannes Berg          2026-10-11  4432  		}
ef27674b8471b5 Johannes Berg          2026-10-11 @4433  		netdev =3D wdev->=
netdev;
ef27674b8471b5 Johannes Berg          2026-10-11  4434  	} else {
ef27674b8471b5 Johannes Berg          2026-10-11  4435  		netdev =3D NULL;
ef27674b8471b5 Johannes Berg          2026-10-11  4436  	}
ef27674b8471b5 Johannes Berg          2026-10-11  4437 =20
f444de05d20e27 Johannes Berg          2010-05-05  4438  	/*
f444de05d20e27 Johannes Berg          2010-05-05  4439  	 * end workaround =
code, by now the rdev is available
f444de05d20e27 Johannes Berg          2010-05-05  4440  	 * and locked, and=
 wdev may or may not be NULL.
f444de05d20e27 Johannes Berg          2010-05-05  4441  	 */
4bbf4d56583dd5 Johannes Berg          2009-03-24  4442 =20
4bbf4d56583dd5 Johannes Berg          2009-03-24  4443  	if (info->attrs[NL=
80211_ATTR_WIPHY_NAME])
318884875bdddc Jouni Malinen          2008-10-30  4444  		result =3D cfg802=
11_dev_rename(
318884875bdddc Jouni Malinen          2008-10-30  4445  			rdev, nla_data(i=
nfo->attrs[NL80211_ATTR_WIPHY_NAME]));
ef27674b8471b5 Johannes Berg          2026-10-11  4446  	mutex_unlock(&cfg8=
0211_mutex);
4bbf4d56583dd5 Johannes Berg          2009-03-24  4447 =20
318884875bdddc Jouni Malinen          2008-10-30  4448  	if (result)
f42d22d3f79639 Johannes Berg          2024-11-22  4449  		return result;
318884875bdddc Jouni Malinen          2008-10-30  4450 =20
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4451  	if (info->attrs[NL=
80211_ATTR_WIPHY_RADIO_INDEX]) {
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4452  		/* Radio idx is n=
ot expected for non-multi radio wiphy */
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4453  		if (rdev->wiphy.n=
_radio <=3D 0)
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4454  			return -EINVAL;
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4455 =20
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4456  		radio_idx =3D nla=
_get_u8(
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4457  				info->attrs[NL8=
0211_ATTR_WIPHY_RADIO_INDEX]);
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4458  		if (radio_idx >=
=3D rdev->wiphy.n_radio)
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4459  			return -EINVAL;
264637941cf45c Roopni Devanathan      2025-06-15  4460 =20
264637941cf45c Roopni Devanathan      2025-06-15  4461  		return nl80211_se=
t_wiphy_radio(info, rdev, radio_idx);
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4462  	}
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4463 =20
318884875bdddc Jouni Malinen          2008-10-30  4464  	if (info->attrs[NL=
80211_ATTR_WIPHY_TXQ_PARAMS]) {
318884875bdddc Jouni Malinen          2008-10-30  4465  		struct ieee80211_=
txq_params txq_params;
318884875bdddc Jouni Malinen          2008-10-30  4466  		struct nlattr *tb=
[NL80211_TXQ_ATTR_MAX + 1];
318884875bdddc Jouni Malinen          2008-10-30  4467 =20
f42d22d3f79639 Johannes Berg          2024-11-22  4468  		if (!rdev->ops->s=
et_txq_params)
f42d22d3f79639 Johannes Berg          2024-11-22  4469  			return -EOPNOTSU=
PP;
318884875bdddc Jouni Malinen          2008-10-30  4470 =20
f42d22d3f79639 Johannes Berg          2024-11-22  4471  		if (!netdev)
f42d22d3f79639 Johannes Berg          2024-11-22  4472  			return -EINVAL;
f70f01c2ebbe31 Eliad Peller           2011-09-25  4473 =20
133a3ff2c93422 Johannes Berg          2011-11-03  4474  		if (netdev->ieee8=
0211_ptr->iftype !=3D NL80211_IFTYPE_AP &&
f42d22d3f79639 Johannes Berg          2024-11-22  4475  		    netdev->ieee8=
0211_ptr->iftype !=3D NL80211_IFTYPE_P2P_GO)
f42d22d3f79639 Johannes Berg          2024-11-22  4476  			return -EINVAL;
133a3ff2c93422 Johannes Berg          2011-11-03  4477 =20
f42d22d3f79639 Johannes Berg          2024-11-22  4478  		if (!netif_runnin=
g(netdev))
f42d22d3f79639 Johannes Berg          2024-11-22  4479  			return -ENETDOWN;
2b5f8b0b44e17e Johannes Berg          2012-04-02  4480 =20
318884875bdddc Jouni Malinen          2008-10-30  4481  		nla_for_each_nest=
ed(nl_txq_params,
318884875bdddc Jouni Malinen          2008-10-30  4482  				    info->attrs=
[NL80211_ATTR_WIPHY_TXQ_PARAMS],
318884875bdddc Jouni Malinen          2008-10-30  4483  				    rem_txq_par=
ams) {
8cb081746c031f Johannes Berg          2019-04-26  4484  			result =3D nla_p=
arse_nested_deprecated(tb,
8cb081746c031f Johannes Berg          2019-04-26  4485  							     NL80211=
_TXQ_ATTR_MAX,
bfe2c7b1cce4a1 Johannes Berg          2016-10-26  4486  							     nl_txq_=
params,
fe52145f91fe81 Johannes Berg          2017-04-12  4487  							     txq_par=
ams_policy,
fe52145f91fe81 Johannes Berg          2017-04-12  4488  							     info->e=
xtack);
ae811e21df28de Johannes Berg          2014-01-24  4489  			if (result)
f42d22d3f79639 Johannes Berg          2024-11-22  4490  				return result;
f42d22d3f79639 Johannes Berg          2024-11-22  4491 =20
318884875bdddc Jouni Malinen          2008-10-30  4492  			result =3D parse=
_txq_params(tb, &txq_params);
318884875bdddc Jouni Malinen          2008-10-30  4493  			if (result)
f42d22d3f79639 Johannes Berg          2024-11-22  4494  				return result;
318884875bdddc Jouni Malinen          2008-10-30  4495 =20
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4496  			txq_params.link_=
id =3D
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4497  				nl80211_link_id=
_or_invalid(info->attrs);
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4498 =20
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4499  			if (txq_params.l=
ink_id >=3D 0 &&
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4500  			    !(netdev->ie=
ee80211_ptr->valid_links &
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4501  			      BIT(txq_pa=
rams.link_id)))
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4502  				result =3D -ENO=
LINK;
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4503  			else if (txq_par=
ams.link_id >=3D 0 &&
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4504  				 !netdev->ieee8=
0211_ptr->valid_links)
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4505  				result =3D -EIN=
VAL;
9d2bb84d54a403 Shaul Triebitz         2022-08-02  4506  			else
e35e4d28b687d4 Hila Gonen             2012-06-27  4507  				result =3D rdev=
_set_txq_params(rdev, netdev,
318884875bdddc Jouni Malinen          2008-10-30  4508  							     &txq_pa=
rams);
318884875bdddc Jouni Malinen          2008-10-30  4509  			if (result)
f42d22d3f79639 Johannes Berg          2024-11-22  4510  				return result;
318884875bdddc Jouni Malinen          2008-10-30  4511  		}
318884875bdddc Jouni Malinen          2008-10-30  4512  	}
556829657397b9 Johannes Berg          2007-09-20  4513 =20
72bdcf34380917 Jouni Malinen          2008-11-26  4514  	if (info->attrs[NL=
80211_ATTR_WIPHY_FREQ]) {
69c3f2d30c3576 Ilan Peer              2022-06-12  4515  		int link_id =3D n=
l80211_link_id_or_invalid(info->attrs);
69c3f2d30c3576 Ilan Peer              2022-06-12  4516 =20
4e2f3d67e3afef Johannes Berg          2022-06-20  4517  		if (wdev) {
e16821bcfb364b Jouni Malinen          2014-04-28  4518  			result =3D __nl8=
0211_set_channel(
e16821bcfb364b Jouni Malinen          2014-04-28  4519  				rdev,
e16821bcfb364b Jouni Malinen          2014-04-28  4520  				nl80211_can_set=
_dev_channel(wdev) ? netdev : NULL,
69c3f2d30c3576 Ilan Peer              2022-06-12  4521  				info, link_id);
4e2f3d67e3afef Johannes Berg          2022-06-20  4522  		} else {
69c3f2d30c3576 Ilan Peer              2022-06-12  4523  			result =3D __nl8=
0211_set_channel(rdev, netdev, info, link_id);
4e2f3d67e3afef Johannes Berg          2022-06-20  4524  		}
69c3f2d30c3576 Ilan Peer              2022-06-12  4525 =20
72bdcf34380917 Jouni Malinen          2008-11-26  4526  		if (result)
f42d22d3f79639 Johannes Berg          2024-11-22  4527  			return result;
72bdcf34380917 Jouni Malinen          2008-11-26  4528  	}
72bdcf34380917 Jouni Malinen          2008-11-26  4529 =20
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4530  	if (info->attrs[NL=
80211_ATTR_WIPHY_TX_POWER_SETTING]) {
c8442118ad9cd0 Johannes Berg          2012-10-24  4531  		struct wireless_d=
ev *txp_wdev =3D wdev;
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4532  		enum nl80211_tx_p=
ower_setting type;
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4533  		int idx, mbm =3D =
0;
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4534 =20
c8442118ad9cd0 Johannes Berg          2012-10-24  4535  		if (!(rdev->wiphy=
.features & NL80211_FEATURE_VIF_TXPOWER))
c8442118ad9cd0 Johannes Berg          2012-10-24  4536  			txp_wdev =3D NUL=
L;
c8442118ad9cd0 Johannes Berg          2012-10-24  4537 =20
f42d22d3f79639 Johannes Berg          2024-11-22  4538  		if (!rdev->ops->s=
et_tx_power)
f42d22d3f79639 Johannes Berg          2024-11-22  4539  			return -EOPNOTSU=
PP;
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4540 =20
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4541  		idx =3D NL80211_A=
TTR_WIPHY_TX_POWER_SETTING;
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4542  		type =3D nla_get_=
u32(info->attrs[idx]);
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4543 =20
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4544  		if (!info->attrs[=
NL80211_ATTR_WIPHY_TX_POWER_LEVEL] &&
f42d22d3f79639 Johannes Berg          2024-11-22  4545  		    (type !=3D NL=
80211_TX_POWER_AUTOMATIC))
f42d22d3f79639 Johannes Berg          2024-11-22  4546  			return -EINVAL;
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4547 =20
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4548  		if (type !=3D NL8=
0211_TX_POWER_AUTOMATIC) {
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4549  			idx =3D NL80211_=
ATTR_WIPHY_TX_POWER_LEVEL;
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4550  			mbm =3D nla_get_=
u32(info->attrs[idx]);
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4551  		}
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4552 =20
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4553  		result =3D rdev_s=
et_tx_power(rdev, txp_wdev, radio_idx, type,
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4554  					   mbm);
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4555  		if (result)
f42d22d3f79639 Johannes Berg          2024-11-22  4556  			return result;
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4557  	}
98d2ff8bec82fc Juuso Oikarinen        2010-06-23  4558 =20
afe0cbf87500f0 Bruno Randolf          2010-11-10  4559  	if (info->attrs[NL=
80211_ATTR_WIPHY_ANTENNA_TX] &&
afe0cbf87500f0 Bruno Randolf          2010-11-10  4560  	    info->attrs[NL=
80211_ATTR_WIPHY_ANTENNA_RX]) {
afe0cbf87500f0 Bruno Randolf          2010-11-10  4561  		u32 tx_ant, rx_an=
t;
7a087e7484c9e4 Kirtika Ruchandani     2016-05-29  4562 =20
7f531e03abf016 Bruno Randolf          2010-12-16  4563  		if ((!rdev->wiphy=
.available_antennas_tx &&
7f531e03abf016 Bruno Randolf          2010-12-16  4564  		     !rdev->wiphy=
.available_antennas_rx) ||
f42d22d3f79639 Johannes Berg          2024-11-22  4565  		    !rdev->ops->s=
et_antenna)
f42d22d3f79639 Johannes Berg          2024-11-22  4566  			return -EOPNOTSU=
PP;
afe0cbf87500f0 Bruno Randolf          2010-11-10  4567 =20
afe0cbf87500f0 Bruno Randolf          2010-11-10  4568  		tx_ant =3D nla_ge=
t_u32(info->attrs[NL80211_ATTR_WIPHY_ANTENNA_TX]);
afe0cbf87500f0 Bruno Randolf          2010-11-10  4569  		rx_ant =3D nla_ge=
t_u32(info->attrs[NL80211_ATTR_WIPHY_ANTENNA_RX]);
afe0cbf87500f0 Bruno Randolf          2010-11-10  4570 =20
a7ffac9591a2a0 Bruno Randolf          2010-12-08  4571  		/* reject antenna=
 configurations which don't match the
7f531e03abf016 Bruno Randolf          2010-12-16  4572  		 * available ante=
nna masks, except for the "all" mask */
7f531e03abf016 Bruno Randolf          2010-12-16  4573  		if ((~tx_ant && (=
tx_ant & ~rdev->wiphy.available_antennas_tx)) ||
f42d22d3f79639 Johannes Berg          2024-11-22  4574  		    (~rx_ant && (=
rx_ant & ~rdev->wiphy.available_antennas_rx)))
f42d22d3f79639 Johannes Berg          2024-11-22  4575  			return -EINVAL;
a7ffac9591a2a0 Bruno Randolf          2010-12-08  4576 =20
7f531e03abf016 Bruno Randolf          2010-12-16  4577  		tx_ant =3D tx_ant=
 & rdev->wiphy.available_antennas_tx;
7f531e03abf016 Bruno Randolf          2010-12-16  4578  		rx_ant =3D rx_ant=
 & rdev->wiphy.available_antennas_rx;
a7ffac9591a2a0 Bruno Randolf          2010-12-08  4579 =20
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4580  		result =3D rdev_s=
et_antenna(rdev, radio_idx, tx_ant, rx_ant);
afe0cbf87500f0 Bruno Randolf          2010-11-10  4581  		if (result)
f42d22d3f79639 Johannes Berg          2024-11-22  4582  			return result;
afe0cbf87500f0 Bruno Randolf          2010-11-10  4583  	}
afe0cbf87500f0 Bruno Randolf          2010-11-10  4584 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4585  	changed =3D 0;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4586 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4587  	if (info->attrs[NL=
80211_ATTR_WIPHY_RETRY_SHORT]) {
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4588  		retry_short =3D n=
la_get_u8(
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4589  			info->attrs[NL80=
211_ATTR_WIPHY_RETRY_SHORT]);
7f2b8562c2ee6e Ying Xue               2014-01-15  4590 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4591  		changed |=3D WIPH=
Y_PARAM_RETRY_SHORT;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4592  	}
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4593 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4594  	if (info->attrs[NL=
80211_ATTR_WIPHY_RETRY_LONG]) {
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4595  		retry_long =3D nl=
a_get_u8(
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4596  			info->attrs[NL80=
211_ATTR_WIPHY_RETRY_LONG]);
7f2b8562c2ee6e Ying Xue               2014-01-15  4597 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4598  		changed |=3D WIPH=
Y_PARAM_RETRY_LONG;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4599  	}
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4600 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4601  	if (info->attrs[NL=
80211_ATTR_WIPHY_FRAG_THRESHOLD]) {
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4602  		frag_threshold =
=3D nla_get_u32(
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4603  			info->attrs[NL80=
211_ATTR_WIPHY_FRAG_THRESHOLD]);
f42d22d3f79639 Johannes Berg          2024-11-22  4604  		if (frag_threshol=
d < 256)
f42d22d3f79639 Johannes Berg          2024-11-22  4605  			return -EINVAL;
7f2b8562c2ee6e Ying Xue               2014-01-15  4606 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4607  		if (frag_threshol=
d !=3D (u32) -1) {
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4608  			/*
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4609  			 * Fragments (ap=
art from the last one) are required to
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4610  			 * have even len=
gth. Make the fragmentation code
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4611  			 * simpler by st=
ripping LSB should someone try to use
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4612  			 * odd threshold=
 value.
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4613  			 */
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4614  			frag_threshold &=
=3D ~0x1;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4615  		}
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4616  		changed |=3D WIPH=
Y_PARAM_FRAG_THRESHOLD;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4617  	}
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4618 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4619  	if (info->attrs[NL=
80211_ATTR_WIPHY_RTS_THRESHOLD]) {
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4620  		rts_threshold =3D =
nla_get_u32(
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4621  			info->attrs[NL80=
211_ATTR_WIPHY_RTS_THRESHOLD]);
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4622  		changed |=3D WIPH=
Y_PARAM_RTS_THRESHOLD;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4623  	}
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4624 =20
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4625  	if (info=
->attrs[NL80211_ATTR_WIPHY_COVERAGE_CLASS]) {
f42d22d3f79639 Johannes Berg          2024-11-22  4626  		if (info->attrs[N=
L80211_ATTR_WIPHY_DYN_ACK])
f42d22d3f79639 Johannes Berg          2024-11-22  4627  			return -EINVAL;
3057dbfdab1b86 Lorenzo Bianconi       2014-09-04  4628 =20
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4629  		coverag=
e_class =3D nla_get_u8(
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4630  			info->=
attrs[NL80211_ATTR_WIPHY_COVERAGE_CLASS]);
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4631  		changed=
 |=3D WIPHY_PARAM_COVERAGE_CLASS;
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4632  	}
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4633 =20
3057dbfdab1b86 Lorenzo Bianconi       2014-09-04  4634  	if (info->attrs[NL=
80211_ATTR_WIPHY_DYN_ACK]) {
f42d22d3f79639 Johannes Berg          2024-11-22  4635  		if (!(rdev->wiphy=
.features & NL80211_FEATURE_ACKTO_ESTIMATION))
f42d22d3f79639 Johannes Berg          2024-11-22  4636  			return -EOPNOTSU=
PP;
3057dbfdab1b86 Lorenzo Bianconi       2014-09-04  4637 =20
3057dbfdab1b86 Lorenzo Bianconi       2014-09-04  4638  		changed |=3D WIPH=
Y_PARAM_DYN_ACK;
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4639  	}
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4640 =20
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4641  	if (info=
->attrs[NL80211_ATTR_TXQ_LIMIT]) {
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4642  		if (!wi=
phy_ext_feature_isset(&rdev->wiphy,
f42d22d3f79639 Johannes Berg          2024-11-22  4643  					     NL80211_E=
XT_FEATURE_TXQS))
f42d22d3f79639 Johannes Berg          2024-11-22  4644  			return -EOPNOTSU=
PP;
f42d22d3f79639 Johannes Berg          2024-11-22  4645 =20
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4646  		txq_lim=
it =3D nla_get_u32(
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4647  			info->=
attrs[NL80211_ATTR_TXQ_LIMIT]);
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4648  		changed=
 |=3D WIPHY_PARAM_TXQ_LIMIT;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4649  	}
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4650 =20
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4651  	if (info=
->attrs[NL80211_ATTR_TXQ_MEMORY_LIMIT]) {
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4652  		if (!wi=
phy_ext_feature_isset(&rdev->wiphy,
f42d22d3f79639 Johannes Berg          2024-11-22  4653  					     NL80211_E=
XT_FEATURE_TXQS))
f42d22d3f79639 Johannes Berg          2024-11-22  4654  			return -EOPNOTSU=
PP;
f42d22d3f79639 Johannes Berg          2024-11-22  4655 =20
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4656  		txq_mem=
ory_limit =3D nla_get_u32(
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4657  			info->=
attrs[NL80211_ATTR_TXQ_MEMORY_LIMIT]);
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4658  		changed=
 |=3D WIPHY_PARAM_TXQ_MEMORY_LIMIT;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4659  	}
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4660 =20
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4661  	if (info=
->attrs[NL80211_ATTR_TXQ_QUANTUM]) {
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4662  		if (!wi=
phy_ext_feature_isset(&rdev->wiphy,
f42d22d3f79639 Johannes Berg          2024-11-22  4663  					     NL80211_E=
XT_FEATURE_TXQS))
f42d22d3f79639 Johannes Berg          2024-11-22  4664  			return -EOPNOTSU=
PP;
f42d22d3f79639 Johannes Berg          2024-11-22  4665 =20
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4666  		txq_qua=
ntum =3D nla_get_u32(
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4667  			info->=
attrs[NL80211_ATTR_TXQ_QUANTUM]);
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4668  		changed=
 |=3D WIPHY_PARAM_TXQ_QUANTUM;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4669  	}
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4670 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4671  	if (changed) {
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4672  		u8 old_retry_shor=
t, old_retry_long;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4673  		u32 old_frag_thre=
shold, old_rts_threshold;
264637941cf45c Roopni Devanathan      2025-06-15  4674  		u8 old_coverage_c=
lass, i;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4675  		u32 old=
_txq_limit, old_txq_memory_limit, old_txq_quantum;
264637941cf45c Roopni Devanathan      2025-06-15  4676  		u32 *old_radio_rt=
s_threshold =3D NULL;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4677 =20
f42d22d3f79639 Johannes Berg          2024-11-22  4678  		if (!rdev->ops->s=
et_wiphy_params)
f42d22d3f79639 Johannes Berg          2024-11-22  4679  			return -EOPNOTSU=
PP;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4680 =20
264637941cf45c Roopni Devanathan      2025-06-15  4681  		if (rdev->wiphy.n=
_radio) {
264637941cf45c Roopni Devanathan      2025-06-15  4682  			old_radio_rts_th=
reshold =3D kcalloc(rdev->wiphy.n_radio,
264637941cf45c Roopni Devanathan      2025-06-15  4683  							  sizeof(u32=
),
264637941cf45c Roopni Devanathan      2025-06-15  4684  							  GFP_KERNEL=
);
264637941cf45c Roopni Devanathan      2025-06-15  4685  			if (!old_radio_r=
ts_threshold)
264637941cf45c Roopni Devanathan      2025-06-15  4686  				return -ENOMEM;
264637941cf45c Roopni Devanathan      2025-06-15  4687  		}
264637941cf45c Roopni Devanathan      2025-06-15  4688 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4689  		old_retry_short =
=3D rdev->wiphy.retry_short;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4690  		old_retry_long =
=3D rdev->wiphy.retry_long;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4691  		old_frag_threshol=
d =3D rdev->wiphy.frag_threshold;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4692  		old_rts_threshold=
 =3D rdev->wiphy.rts_threshold;
264637941cf45c Roopni Devanathan      2025-06-15  4693  		if (old_radio_rts=
_threshold) {
264637941cf45c Roopni Devanathan      2025-06-15  4694  			for (i =3D 0 ; i=
 < rdev->wiphy.n_radio; i++)
264637941cf45c Roopni Devanathan      2025-06-15  4695  				old_radio_rts_t=
hreshold[i] =3D
264637941cf45c Roopni Devanathan      2025-06-15  4696  					rdev->wiphy.ra=
dio_cfg[i].rts_threshold;
264637941cf45c Roopni Devanathan      2025-06-15  4697  		}
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4698  		old_cov=
erage_class =3D rdev->wiphy.coverage_class;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4699  		old_txq=
_limit =3D rdev->wiphy.txq_limit;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4700  		old_txq=
_memory_limit =3D rdev->wiphy.txq_memory_limit;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4701  		old_txq=
_quantum =3D rdev->wiphy.txq_quantum;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4702 =20
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4703  		if (changed & WIP=
HY_PARAM_RETRY_SHORT)
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4704  			rdev->wiphy.retr=
y_short =3D retry_short;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4705  		if (changed & WIP=
HY_PARAM_RETRY_LONG)
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4706  			rdev->wiphy.retr=
y_long =3D retry_long;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4707  		if (changed & WIP=
HY_PARAM_FRAG_THRESHOLD)
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4708  			rdev->wiphy.frag=
_threshold =3D frag_threshold;
9eda41e3226380 Stanislaw Gruszka      2026-09-19  4709  		if (changed & WIP=
HY_PARAM_RTS_THRESHOLD) {
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4710  			rdev->wiphy.rts_=
threshold =3D rts_threshold;
9eda41e3226380 Stanislaw Gruszka      2026-09-19  4711  			if (old_radio_rt=
s_threshold) {
264637941cf45c Roopni Devanathan      2025-06-15  4712  				for (i =3D 0; i=
 < rdev->wiphy.n_radio; i++)
264637941cf45c Roopni Devanathan      2025-06-15  4713  					rdev->wiphy.ra=
dio_cfg[i].rts_threshold =3D
264637941cf45c Roopni Devanathan      2025-06-15  4714  						rdev->wiphy.r=
ts_threshold;
264637941cf45c Roopni Devanathan      2025-06-15  4715  			}
9eda41e3226380 Stanislaw Gruszka      2026-09-19  4716  		}
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4717  		if (cha=
nged & WIPHY_PARAM_COVERAGE_CLASS)
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4718  			rdev->=
wiphy.coverage_class =3D coverage_class;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4719  		if (cha=
nged & WIPHY_PARAM_TXQ_LIMIT)
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4720  			rdev->=
wiphy.txq_limit =3D txq_limit;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4721  		if (cha=
nged & WIPHY_PARAM_TXQ_MEMORY_LIMIT)
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4722  			rdev->=
wiphy.txq_memory_limit =3D txq_memory_limit;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4723  		if (cha=
nged & WIPHY_PARAM_TXQ_QUANTUM)
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4724  			rdev->=
wiphy.txq_quantum =3D txq_quantum;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4725 =20
b74947b4f6ff7c Roopni Devanathan      2025-06-15  4726  		result =3D rdev_s=
et_wiphy_params(rdev, radio_idx, changed);
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4727  		if (result) {
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4728  			rdev->wiphy.retr=
y_short =3D old_retry_short;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4729  			rdev->wiphy.retr=
y_long =3D old_retry_long;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4730  			rdev->wiphy.frag=
_threshold =3D old_frag_threshold;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4731  			rdev->wiphy.rts_=
threshold =3D old_rts_threshold;
264637941cf45c Roopni Devanathan      2025-06-15  4732  			if (old_radio_rt=
s_threshold) {
264637941cf45c Roopni Devanathan      2025-06-15  4733  				for (i =3D 0 ; =
i < rdev->wiphy.n_radio; i++)
264637941cf45c Roopni Devanathan      2025-06-15  4734  					rdev->wiphy.ra=
dio_cfg[i].rts_threshold =3D
264637941cf45c Roopni Devanathan      2025-06-15  4735  						old_radio_rts=
_threshold[i];
264637941cf45c Roopni Devanathan      2025-06-15  4736  			}
81077e82c3f591 Luk=C3=A1=C5=A1 Turek            2009-12-21  4737  			rdev->=
wiphy.coverage_class =3D old_coverage_class;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4738  			rdev->=
wiphy.txq_limit =3D old_txq_limit;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4739  			rdev->=
wiphy.txq_memory_limit =3D old_txq_memory_limit;
52539ca89f365d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  4740  			rdev->=
wiphy.txq_quantum =3D old_txq_quantum;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4741  		}
264637941cf45c Roopni Devanathan      2025-06-15  4742 =20
264637941cf45c Roopni Devanathan      2025-06-15  4743  		kfree(old_radio_r=
ts_threshold);
264637941cf45c Roopni Devanathan      2025-06-15  4744  		return result;
b9a5f8cab751d3 Jouni Malinen          2009-04-20  4745  	}
a05829a7222e9d Johannes Berg          2021-01-22  4746 =20
f42d22d3f79639 Johannes Berg          2024-11-22  4747  	return 0;
556829657397b9 Johannes Berg          2007-09-20  4748  }
556829657397b9 Johannes Berg          2007-09-20  4749 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
