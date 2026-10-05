Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B964DAFA1
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232141; cv=none; b=lcBlK0T53PQHEqiU/nq6Ol/IFURGEtg6ejSl7hcHIxpleBEZatvWSVI2SXFseIzW8jOCGh7lSTKWXVHAtAVUxYSn5h86/zFnfft6c12c9HVqwz7rj6pT+pTnI1Kl3cHFbc0aKngR5b/Gh/qlMLRhKVWW0+g3DD/HnEN8pUAIobo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232141; c=relaxed/simple;
	bh=33UJTS/MNNzXVu0Oyxt07CuxhkEzhaAjsOtGGGwLA8g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y2/+ZfdfER5GUFN6x1GGM85a4HUxrBBXKeeGP/uEr/Yyj99XHoMOsKeJV4egenbpFN7aIoU8ko9ivyHrWb82XUYer27HyaDnvILqAq1OrS+jHR4NjpxSISrX8FibTHDQm2ywJKiEMZ6CeDNyxekjlK9h1QtrZYyFDur5/5BwinA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8paEy3M; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8paEy3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791232132; x=1822768132;
  h=date:from:to:cc:subject:message-id;
  bh=33UJTS/MNNzXVu0Oyxt07CuxhkEzhaAjsOtGGGwLA8g=;
  b=V8paEy3MIvHBG89oeA0BuzzcvGW1hJHe8wp/A3ZYf19kreqpn2xAQe2B
   BfrItuEsKWpXsuCBD1UvX12u5Pa82UgoEnpvbwGFLrZ+whAXfSrboEQmj
   P8lyY2bcwqtWluwQVQEpp5KGf0b6utQPrJ3/2J/g5kZWvGaH4YS130/0u
   6fh8tjcM8mRswjNXaCG8dkav0EJEObCfMTaEQAD490ykpYNOIKuCklymS
   ATQ6A3jmhJOUGgBAjs6GiAyPPsuB2ZxOcaHQznvM8tibm0UFZiZqnXucm
   S0fpaWmVIXqSIgf6elNLne93wAf73SkeRdJbnJf/Bz4v6gd+KFe+Vs0dg
   A==;
X-CSE-ConnectionGUID: ngUbHaXFS/WLBXByX9JU+Q==
X-CSE-MsgGUID: wNkszeJrTKKg8NALcOw4Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="92024383"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="92024383"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 13:28:40 -0700
X-CSE-ConnectionGUID: /I696aHmT5G0u8kCHyxwag==
X-CSE-MsgGUID: Uwx1AHd4TKSBOC9qcmwb8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="274706601"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Oct 2026 13:28:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDpIa-000000000IZ-090q;
	Mon, 05 Oct 2026 20:28:36 +0000
Date: Mon, 05 Oct 2026 22:28:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/motorcomm/tc.c:1360 yt921x_acl_add() warn:
 missing unwind goto?
Message-ID: <202610052237.QhFR0MKg-lkp@intel.com>
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
TO: David Yang <mmyangfl@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Yang/net-dsa-motorcomm-Hoist-type-casting-helper-into-chip-h/20261002-044844
head:   1e2e08a7a9e93cec9030484583b19e0e0401524c
commit: e0a7ccfd6f4b92bb1b5bd903f07261327a9a79d0 net: dsa: motorcomm: Enable ACL on demand
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: alpha-randconfig-r2200-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052237.QhFR0MKg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610052237.QhFR0MKg-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/motorcomm/tc.c:1360 yt921x_acl_add() warn: missing unwind goto?

Old smatch warnings:
drivers/net/dsa/motorcomm/tc.c:677 yt921x_acl_rule_ext_parse_flow_entries() warn: missing unwind goto?

vim +1360 drivers/net/dsa/motorcomm/tc.c

afdf8e0e7687234 David Yang 2026-10-02  1266  
afdf8e0e7687234 David Yang 2026-10-02  1267  static int
afdf8e0e7687234 David Yang 2026-10-02  1268  yt921x_acl_add(struct yt921x_priv *priv,
afdf8e0e7687234 David Yang 2026-10-02  1269  	       const struct yt921x_acl_rule_ext *ruleext,
afdf8e0e7687234 David Yang 2026-10-02  1270  	       struct netlink_ext_ack *extack)
afdf8e0e7687234 David Yang 2026-10-02  1271  {
afdf8e0e7687234 David Yang 2026-10-02  1272  	unsigned int entscnt = hweight8(ruleext->r.mask);
afdf8e0e7687234 David Yang 2026-10-02  1273  	struct yt921x_acl_rule *aclrule;
afdf8e0e7687234 David Yang 2026-10-02  1274  	struct yt921x_acl_blk *aclblk;
afdf8e0e7687234 David Yang 2026-10-02  1275  	bool use_trap = false;
afdf8e0e7687234 David Yang 2026-10-02  1276  	unsigned int meterid;
afdf8e0e7687234 David Yang 2026-10-02  1277  	unsigned int binid;
afdf8e0e7687234 David Yang 2026-10-02  1278  	unsigned int blkid;
afdf8e0e7687234 David Yang 2026-10-02  1279  	unsigned int entid;
e0a7ccfd6f4b92b David Yang 2026-10-02  1280  	unsigned long m;
afdf8e0e7687234 David Yang 2026-10-02  1281  	unsigned int o;
e0a7ccfd6f4b92b David Yang 2026-10-02  1282  	u32 ctrl;
afdf8e0e7687234 David Yang 2026-10-02  1283  	int res;
afdf8e0e7687234 David Yang 2026-10-02  1284  
afdf8e0e7687234 David Yang 2026-10-02  1285  	/* Allocate resources */
afdf8e0e7687234 David Yang 2026-10-02  1286  	entid = yt921x_acl_reserve(priv, entscnt, extack);
afdf8e0e7687234 David Yang 2026-10-02  1287  	if (entid == UINT_MAX)
afdf8e0e7687234 David Yang 2026-10-02  1288  		return -EOPNOTSUPP;
afdf8e0e7687234 David Yang 2026-10-02  1289  
afdf8e0e7687234 David Yang 2026-10-02  1290  	if (!(ruleext->r.action[0] & YT921X_ACL_ACTa_METER_EN)) {
afdf8e0e7687234 David Yang 2026-10-02  1291  		meterid = YT921X_METER_NUM;
afdf8e0e7687234 David Yang 2026-10-02  1292  	} else {
afdf8e0e7687234 David Yang 2026-10-02  1293  		meterid = find_first_zero_bit(priv->meters_map,
afdf8e0e7687234 David Yang 2026-10-02  1294  					      YT921X_METER_NUM);
afdf8e0e7687234 David Yang 2026-10-02  1295  		if (meterid < YT921X_METER_NUM) {
afdf8e0e7687234 David Yang 2026-10-02  1296  			res = yt921x_meter_config(priv, meterid,
afdf8e0e7687234 David Yang 2026-10-02  1297  						  &ruleext->marker);
afdf8e0e7687234 David Yang 2026-10-02  1298  			if (res)
afdf8e0e7687234 David Yang 2026-10-02  1299  				return res;
afdf8e0e7687234 David Yang 2026-10-02  1300  		} else if (ruleext->r.sw_assisted) {
afdf8e0e7687234 David Yang 2026-10-02  1301  			use_trap = true;
afdf8e0e7687234 David Yang 2026-10-02  1302  		} else {
afdf8e0e7687234 David Yang 2026-10-02  1303  			NL_SET_ERR_MSG_MOD(extack,
afdf8e0e7687234 David Yang 2026-10-02  1304  					   "No more meters available");
afdf8e0e7687234 David Yang 2026-10-02  1305  			return -EOPNOTSUPP;
afdf8e0e7687234 David Yang 2026-10-02  1306  		}
afdf8e0e7687234 David Yang 2026-10-02  1307  	}
afdf8e0e7687234 David Yang 2026-10-02  1308  
afdf8e0e7687234 David Yang 2026-10-02  1309  	/* Prepare acl block ctrlblk */
afdf8e0e7687234 David Yang 2026-10-02  1310  	blkid = entid / YT921X_ACL_ENT_PER_BLK;
afdf8e0e7687234 David Yang 2026-10-02  1311  	binid = entid % YT921X_ACL_ENT_PER_BLK;
afdf8e0e7687234 David Yang 2026-10-02  1312  	aclblk = priv->acl_blks[blkid];
afdf8e0e7687234 David Yang 2026-10-02  1313  	if (!aclblk) {
afdf8e0e7687234 David Yang 2026-10-02  1314  		aclblk = kvzalloc_obj(*aclblk);
afdf8e0e7687234 David Yang 2026-10-02  1315  		if (!aclblk)
afdf8e0e7687234 David Yang 2026-10-02  1316  			return -ENOMEM;
afdf8e0e7687234 David Yang 2026-10-02  1317  		priv->acl_blks[blkid] = aclblk;
afdf8e0e7687234 David Yang 2026-10-02  1318  	}
afdf8e0e7687234 David Yang 2026-10-02  1319  
afdf8e0e7687234 David Yang 2026-10-02  1320  	/* Prepare acl rule ctrlblk */
afdf8e0e7687234 David Yang 2026-10-02  1321  	aclrule = kvmemdup(&ruleext->r,
afdf8e0e7687234 David Yang 2026-10-02  1322  			   offsetof(struct yt921x_acl_rule, entries[entscnt]),
afdf8e0e7687234 David Yang 2026-10-02  1323  			   GFP_KERNEL);
afdf8e0e7687234 David Yang 2026-10-02  1324  	if (!aclrule) {
afdf8e0e7687234 David Yang 2026-10-02  1325  		res = -ENOMEM;
afdf8e0e7687234 David Yang 2026-10-02  1326  		goto err;
afdf8e0e7687234 David Yang 2026-10-02  1327  	}
afdf8e0e7687234 David Yang 2026-10-02  1328  
afdf8e0e7687234 David Yang 2026-10-02  1329  	/* Replace the placeholder resource IDs */
afdf8e0e7687234 David Yang 2026-10-02  1330  	aclrule->mask = 0;
e0a7ccfd6f4b92b David Yang 2026-10-02  1331  	m = priv->acl_masks[blkid];
e0a7ccfd6f4b92b David Yang 2026-10-02  1332  	for_each_clear_bit(o, &m, YT921X_ACL_ENT_PER_BLK) {
afdf8e0e7687234 David Yang 2026-10-02  1333  		aclrule->mask |= BIT(o);
afdf8e0e7687234 David Yang 2026-10-02  1334  		entscnt--;
afdf8e0e7687234 David Yang 2026-10-02  1335  		if (!entscnt)
afdf8e0e7687234 David Yang 2026-10-02  1336  			break;
afdf8e0e7687234 David Yang 2026-10-02  1337  	}
afdf8e0e7687234 David Yang 2026-10-02  1338  
afdf8e0e7687234 David Yang 2026-10-02  1339  	if (use_trap) {
afdf8e0e7687234 David Yang 2026-10-02  1340  		aclrule->action[2] &= ~YT921X_ACL_ACTc_FWD_REDIR_DPORTS_M &
afdf8e0e7687234 David Yang 2026-10-02  1341  				      ~YT921X_ACL_ACTc_FWD_M;
afdf8e0e7687234 David Yang 2026-10-02  1342  		aclrule->action[2] |= YT921X_ACL_ACTc_FWD_EN |
afdf8e0e7687234 David Yang 2026-10-02  1343  				      YT921X_ACL_ACTc_FWD_TRAP;
afdf8e0e7687234 David Yang 2026-10-02  1344  	}
afdf8e0e7687234 David Yang 2026-10-02  1345  	if (meterid < YT921X_METER_NUM)
afdf8e0e7687234 David Yang 2026-10-02  1346  		aclrule->action[0] |= YT921X_ACL_ACTa_METER_ID(meterid);
afdf8e0e7687234 David Yang 2026-10-02  1347  	else
afdf8e0e7687234 David Yang 2026-10-02  1348  		aclrule->action[0] &= ~YT921X_ACL_ACTa_METER_EN;
afdf8e0e7687234 David Yang 2026-10-02  1349  
e0a7ccfd6f4b92b David Yang 2026-10-02  1350  	/* Activate ACL if needed */
e0a7ccfd6f4b92b David Yang 2026-10-02  1351  	ctrl = 0;
e0a7ccfd6f4b92b David Yang 2026-10-02  1352  	m = FIELD_GET(YT921X_ACL_KEYb_SPORTS_M, ruleext->r.entries[0].key[1]);
e0a7ccfd6f4b92b David Yang 2026-10-02  1353  	for_each_set_bit(o, &m, YT921X_PORT_NUM)
e0a7ccfd6f4b92b David Yang 2026-10-02  1354  		if (!priv->ports[o].acl_cnt)
e0a7ccfd6f4b92b David Yang 2026-10-02  1355  			ctrl |= YT921X_ACL_PORT_PORTn(o);
e0a7ccfd6f4b92b David Yang 2026-10-02  1356  	if (ctrl) {
e0a7ccfd6f4b92b David Yang 2026-10-02  1357  		ctrl |= yt921x_acl_activated_ports(priv);
e0a7ccfd6f4b92b David Yang 2026-10-02  1358  		res = yt921x_reg_write(priv, YT921X_ACL_PORT, ctrl);
e0a7ccfd6f4b92b David Yang 2026-10-02  1359  		if (res)
e0a7ccfd6f4b92b David Yang 2026-10-02 @1360  			return res;
e0a7ccfd6f4b92b David Yang 2026-10-02  1361  	}
e0a7ccfd6f4b92b David Yang 2026-10-02  1362  
afdf8e0e7687234 David Yang 2026-10-02  1363  	/* Write rules */
afdf8e0e7687234 David Yang 2026-10-02  1364  	aclblk->rules[binid] = aclrule;
afdf8e0e7687234 David Yang 2026-10-02  1365  	res = yt921x_acl_commit(priv, entid, aclrule->mask);
afdf8e0e7687234 David Yang 2026-10-02  1366  	if (res) {
afdf8e0e7687234 David Yang 2026-10-02  1367  		aclblk->rules[binid] = NULL;
afdf8e0e7687234 David Yang 2026-10-02  1368  		kvfree(aclrule);
afdf8e0e7687234 David Yang 2026-10-02  1369  		goto err;
afdf8e0e7687234 David Yang 2026-10-02  1370  	}
afdf8e0e7687234 David Yang 2026-10-02  1371  
e0a7ccfd6f4b92b David Yang 2026-10-02  1372  	/* Bookkeeping */
e0a7ccfd6f4b92b David Yang 2026-10-02  1373  	m = FIELD_GET(YT921X_ACL_KEYb_SPORTS_M, ruleext->r.entries[0].key[1]);
e0a7ccfd6f4b92b David Yang 2026-10-02  1374  	for_each_set_bit(o, &m, YT921X_PORT_NUM)
e0a7ccfd6f4b92b David Yang 2026-10-02  1375  		priv->ports[o].acl_cnt++;
e0a7ccfd6f4b92b David Yang 2026-10-02  1376  
afdf8e0e7687234 David Yang 2026-10-02  1377  	if (meterid < YT921X_METER_NUM)
afdf8e0e7687234 David Yang 2026-10-02  1378  		set_bit(meterid, priv->meters_map);
afdf8e0e7687234 David Yang 2026-10-02  1379  	priv->acl_masks[blkid] |= aclrule->mask;
afdf8e0e7687234 David Yang 2026-10-02  1380  	return 0;
afdf8e0e7687234 David Yang 2026-10-02  1381  
afdf8e0e7687234 David Yang 2026-10-02  1382  err:
afdf8e0e7687234 David Yang 2026-10-02  1383  	if (!priv->acl_masks[blkid]) {
afdf8e0e7687234 David Yang 2026-10-02  1384  		kvfree(aclblk);
afdf8e0e7687234 David Yang 2026-10-02  1385  		priv->acl_blks[blkid] = NULL;
afdf8e0e7687234 David Yang 2026-10-02  1386  	}
afdf8e0e7687234 David Yang 2026-10-02  1387  	return res;
afdf8e0e7687234 David Yang 2026-10-02  1388  }
afdf8e0e7687234 David Yang 2026-10-02  1389  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
