Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941797;
	b=qu7R+eP4YrM/VKAJ/Zpv4nInhHwAML0hKZEtQcw+zgi15rRfPzGiAX+F2V9D2HyuDcDF
	 wf57IECWHgpG94Mb4W46Cn6Amw7/GD5B9T+0PMEBepDYwkUiJkflmGuZXfGIatXCJLV2m
	 d1DCngGGP+bJYDZcctFMHtGY64EPd4MqjEyf5F+Ja1tGwFeTtNwGnv3rdwZnkQr7/RYFp
	 4kY3Bba9Qc+Dxu2gvKaJn4fuKz7ufxcjIIO7uj5xqkZX3YgzE3BLT84d3gzVXthy6zn+z
	 Krp+7AzuCN9VOAsRPcsfQvMAY4I7kqXQfTU/yOaveR3369o6OO8RJsmxD6qdtyDuViQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941797;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EBnQwEg8vrXT4EHcI46I4aiblJbaL/ogjPD28jJxEAw=;
	b=NJXUDK65MSMk9AYt7xcHA4MHKhR7GgOmIEvenQsNloQXCR87YAluIlS58c62RvOD1wTo
	 QuApyW8n5mjZLzAVYR77AFWhVfXFNKsVg06ksnRqJjeU9mFSFh4KvAENy9mBaZ/xJFcIj
	 wmJ6m8MvYg8T4YBmhyymIz2Wmp854mt7F9he2V5WEffhRXe1AeBILBaDG2iE4LU5a/bl6
	 9wMbbBURCffIurfHLshwtC1a/V3GRSn58Jst2nXWfq0fZdeF4czh8mM358BP2fpjfcLr9
	 50lv/gZiAgvnqnxYqZnQKNHP3qnyXpSnn38q4RYPdNz3i73uR6tcaltRV0xmkJ2wcVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d0350nOv;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB719606A31E
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Oct 2026 15:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB719606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d0350nOv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792941795; x=1824477795;
  h=date:from:to:cc:subject:message-id;
  bh=w+/7Bq89UOEI/EOC9EIUjKiSbUMx6+el5tSkaGOxAAw=;
  b=d0350nOvs2hfb58ceVvLAoCKrJIBhjX5fUtpr+KhhhEJhX211ZKAWIX1
   InVKndCE+bYteqgBi7F6bAmS29B0970bDPdY6X7OgzpVH24p07wjLIrvv
   Y3naTu8PLlFWnuSFIDdBCW0Wfd99rHrPrRFeYyLGrcM4gnj2iD5NUkLD2
   YrWgiY8BSb0UpEtT6QcFHvYv7O0m7/zhHpBB7jfVpnPOadSB+W56fwUaB
   0vRjmHUBf7zd5dXH5KgU5bB3rzfSs2dqD6JM27k3ggeytLNRAqTykcxnw
   t30dj0KMDyJr0T70a7tgZyRseVkvE/0vPV0cVUR+C1LaTtvB+ll1dbmZR
   A==;
X-CSE-ConnectionGUID: HqQekEtXTcGEeDcro4h9rA==
X-CSE-MsgGUID: xgGR2W/LTieAO6FQfiPGHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1514653"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1514653"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:23:14 -0700
X-CSE-ConnectionGUID: l+jI/RAgQBa1Zug093YUyg==
X-CSE-MsgGUID: USWe6QQYRJ+sk1sZtgp3rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="5888125"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 25 Oct 2026 08:23:13 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL03y-000000003jD-2KS0;
	Sun, 25 Oct 2026 15:23:10 +0000
Date: Sun, 25 Oct 2026 16:22:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/netc/netc_main.c:1356
 netc_port_set_vlan_entry() warn: missing error code 'err'
Message-ID: <202610251656.wyHiQqEw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Wei Fang <wei.fang@nxp.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21a7f44fd0765fcc5194130b28767786eba1d1e7
commit: 84b4a3b30abd226ec528985d7c3cb63a3376d098 net: dsa: netc: add VLAN filter table and egress treatment management
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: alpha-randconfig-r2202-20261025 (https://download.01.org/0day-ci/archive/20261025/202610251656.wyHiQqEw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 84b4a3b30abd ("net: dsa: netc: add VLAN filter table and egress treatment management")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610251656.wyHiQqEw-lkp@intel.com/

smatch warnings:
drivers/net/dsa/netc/netc_main.c:1356 netc_port_set_vlan_entry() warn: missing error code 'err'

vim +/err +1356 drivers/net/dsa/netc/netc_main.c

84b4a3b30abd226 Wei Fang 2026-06-11  1324  
84b4a3b30abd226 Wei Fang 2026-06-11  1325  static int netc_port_set_vlan_entry(struct netc_port *np, u16 vid,
84b4a3b30abd226 Wei Fang 2026-06-11  1326  				    bool untagged)
84b4a3b30abd226 Wei Fang 2026-06-11  1327  {
84b4a3b30abd226 Wei Fang 2026-06-11  1328  	struct netc_switch *priv = np->switch_priv;
84b4a3b30abd226 Wei Fang 2026-06-11  1329  	struct netc_vlan_entry *entry;
84b4a3b30abd226 Wei Fang 2026-06-11  1330  	struct vft_cfge_data *cfge;
84b4a3b30abd226 Wei Fang 2026-06-11  1331  	int port = np->dp->index;
84b4a3b30abd226 Wei Fang 2026-06-11  1332  	bool changed;
84b4a3b30abd226 Wei Fang 2026-06-11  1333  	int err = 0;
84b4a3b30abd226 Wei Fang 2026-06-11  1334  
84b4a3b30abd226 Wei Fang 2026-06-11  1335  	mutex_lock(&priv->vft_lock);
84b4a3b30abd226 Wei Fang 2026-06-11  1336  
84b4a3b30abd226 Wei Fang 2026-06-11  1337  	entry = netc_lookup_vlan_entry(priv, vid);
84b4a3b30abd226 Wei Fang 2026-06-11  1338  	if (!entry) {
84b4a3b30abd226 Wei Fang 2026-06-11  1339  		err = netc_port_add_vlan_entry(np, vid, untagged);
84b4a3b30abd226 Wei Fang 2026-06-11  1340  		goto unlock_vft;
84b4a3b30abd226 Wei Fang 2026-06-11  1341  	}
84b4a3b30abd226 Wei Fang 2026-06-11  1342  
84b4a3b30abd226 Wei Fang 2026-06-11  1343  	/* Check whether the egress VLAN rule is changed */
84b4a3b30abd226 Wei Fang 2026-06-11  1344  	changed = netc_port_vlan_egress_rule_changed(entry, port, untagged);
84b4a3b30abd226 Wei Fang 2026-06-11  1345  	if (changed) {
84b4a3b30abd226 Wei Fang 2026-06-11  1346  		entry->untagged_port_bitmap ^= BIT(port);
84b4a3b30abd226 Wei Fang 2026-06-11  1347  		err = netc_port_update_vlan_egress_rule(np, entry);
84b4a3b30abd226 Wei Fang 2026-06-11  1348  		if (err) {
84b4a3b30abd226 Wei Fang 2026-06-11  1349  			entry->untagged_port_bitmap ^= BIT(port);
84b4a3b30abd226 Wei Fang 2026-06-11  1350  			goto unlock_vft;
84b4a3b30abd226 Wei Fang 2026-06-11  1351  		}
84b4a3b30abd226 Wei Fang 2026-06-11  1352  	}
84b4a3b30abd226 Wei Fang 2026-06-11  1353  
84b4a3b30abd226 Wei Fang 2026-06-11  1354  	cfge = &entry->cfge;
84b4a3b30abd226 Wei Fang 2026-06-11  1355  	if (cfge->bitmap_stg & cpu_to_le32(BIT(port)))
84b4a3b30abd226 Wei Fang 2026-06-11 @1356  		goto unlock_vft;
84b4a3b30abd226 Wei Fang 2026-06-11  1357  
84b4a3b30abd226 Wei Fang 2026-06-11  1358  	cfge->bitmap_stg |= cpu_to_le32(BIT(port));
84b4a3b30abd226 Wei Fang 2026-06-11  1359  	err = ntmp_vft_update_entry(&priv->ntmp, vid, cfge);
84b4a3b30abd226 Wei Fang 2026-06-11  1360  	if (err) {
84b4a3b30abd226 Wei Fang 2026-06-11  1361  		dev_err(priv->dev,
84b4a3b30abd226 Wei Fang 2026-06-11  1362  			"Failed to update VLAN %u entry on port %d\n",
84b4a3b30abd226 Wei Fang 2026-06-11  1363  			vid, port);
84b4a3b30abd226 Wei Fang 2026-06-11  1364  
84b4a3b30abd226 Wei Fang 2026-06-11  1365  		goto restore_bitmap_stg;
84b4a3b30abd226 Wei Fang 2026-06-11  1366  	}
84b4a3b30abd226 Wei Fang 2026-06-11  1367  
84b4a3b30abd226 Wei Fang 2026-06-11  1368  	mutex_unlock(&priv->vft_lock);
84b4a3b30abd226 Wei Fang 2026-06-11  1369  
84b4a3b30abd226 Wei Fang 2026-06-11  1370  	return 0;
84b4a3b30abd226 Wei Fang 2026-06-11  1371  
84b4a3b30abd226 Wei Fang 2026-06-11  1372  restore_bitmap_stg:
84b4a3b30abd226 Wei Fang 2026-06-11  1373  	cfge->bitmap_stg &= cpu_to_le32(~BIT(port));
84b4a3b30abd226 Wei Fang 2026-06-11  1374  	if (changed) {
84b4a3b30abd226 Wei Fang 2026-06-11  1375  		entry->untagged_port_bitmap ^= BIT(port);
84b4a3b30abd226 Wei Fang 2026-06-11  1376  		/* Recover the corresponding ETT entry. It doesn't matter
84b4a3b30abd226 Wei Fang 2026-06-11  1377  		 * if it fails because the bit corresponding to the port
84b4a3b30abd226 Wei Fang 2026-06-11  1378  		 * in the port bitmap of the VFT entry is not set. so the
84b4a3b30abd226 Wei Fang 2026-06-11  1379  		 * frame will not match that ETT entry.
84b4a3b30abd226 Wei Fang 2026-06-11  1380  		 */
84b4a3b30abd226 Wei Fang 2026-06-11  1381  		if (netc_port_update_vlan_egress_rule(np, entry))
84b4a3b30abd226 Wei Fang 2026-06-11  1382  			entry->untagged_port_bitmap ^= BIT(port);
84b4a3b30abd226 Wei Fang 2026-06-11  1383  	}
84b4a3b30abd226 Wei Fang 2026-06-11  1384  unlock_vft:
84b4a3b30abd226 Wei Fang 2026-06-11  1385  	mutex_unlock(&priv->vft_lock);
84b4a3b30abd226 Wei Fang 2026-06-11  1386  
84b4a3b30abd226 Wei Fang 2026-06-11  1387  	return err;
84b4a3b30abd226 Wei Fang 2026-06-11  1388  }
84b4a3b30abd226 Wei Fang 2026-06-11  1389  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
