Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9018719E838
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Aug 2024 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724860750; cv=none; b=tbj2ZZKADWO6BlWNNi3zjT9PpBuUgDnw9pXsZkmo5sRGEJbpuWrLEukkBU9KsZeBUBGAdc8vzXzl+4pFJUbwXdZHXO9L4oazGM+hTQlJ5Jvyn7SQJeT9vxbpJ9nPG7CzBrkgyfL70Q6lFcQKPrfFsO+2ihALUb9eeeI4uPKY5p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724860750; c=relaxed/simple;
	bh=Y5cr+MrS6VDUa1HLccFwiV3xRH8QBfEyzpKpliy2o4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qO4uztAt3uGsj492nnFzCfOO4S4aBQ2qgnIcnwV/XtHvsZtJfp898tKMYBJj2edCJEppi3ERsuPHU18QRc+bkVZU5ZxcqI0Dc2hzfJWLiveWlNlABgOWC4ypc+/faPr3YaejFYCSLtglU8ezbt+td6XWKEDbghCp/bUqBTHNLx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBeocI0U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBeocI0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724860749; x=1756396749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y5cr+MrS6VDUa1HLccFwiV3xRH8QBfEyzpKpliy2o4U=;
  b=hBeocI0U3Abvmg1sbYjq858OssgFeSGmpK1Go0NbOt17QoED4wtWi0AW
   WMScmPr42fhZ5bq2U6U8wYfkOZwZEb6PlLdrtYaunq0mrs8wErBQD49IO
   VCkuqhbaLSZ81/eWh1eXHBmXeFMPCHxhMzSnF/Ln2aPg41IHSTNAfx6wy
   x78fE64FrGMlEfAJ1BVronlfHOqgedDx4A1eJx/yiA2Da6weFNzk+JF1g
   TRl+JJp7vUL1nSlg2WXvOWL4MXow1fWWEMCvmbmlw9WqG0Acd4D4OqY/Z
   xIL4YZofTe+wd09djRLMylpmlfe1w6xdZYSpKfQdNF/AoRZg45Y+D8Ytn
   Q==;
X-CSE-ConnectionGUID: EtUZL2c5TpKJ59HeJl1UIw==
X-CSE-MsgGUID: Sf5g8MRuS4mci5Hd3zDK+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="22980919"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="22980919"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 08:58:20 -0700
X-CSE-ConnectionGUID: Y9IDPVpVS6GG2feXPOg4Yw==
X-CSE-MsgGUID: Cy4VgkBERka9jGXFMXWf7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="62981698"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2024 08:58:19 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjL3o-000L7G-2o;
	Wed, 28 Aug 2024 15:58:16 +0000
Date: Wed, 28 Aug 2024 23:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tnguy-next-queue:dev-queue 62/65] net/devlink/health.c:1276:9:
 sparse: sparse: no generic selection for 'restricted __wsum const [usertype]
 csum'
Message-ID: <202408282344.ctEZHnnY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/devlink/health.c:1276:9: sparse: sparse: no generic selection for 'restricted __wsum const [usertype] csum'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Przemek Kitszel <przemyslaw.kitszel@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   025f455f893c9f39ec392d7237d1de55d2d00101
commit: f2df8ad68c42de78ee14476961851314459825b1 [62/65] devlink: add devlink_fmsg_dump_skb() function
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-122-20240828 (https://download.01.org/0day-ci/archive/20240828/202408282344.ctEZHnnY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408282344.ctEZHnnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408282344.ctEZHnnY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/devlink/health.c:1276:9: sparse: sparse: no generic selection for 'restricted __wsum const [usertype] csum'

vim +1276 net/devlink/health.c

f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1244  
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1245  /**
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1246   * devlink_fmsg_dump_skb - Dump sk_buffer structure
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1247   * @fmsg: devlink formatted message pointer
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1248   * @skb: pointer to skb
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1249   *
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1250   * Dump diagnostic information about sk_buff structure, like headroom, length,
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1251   * tailroom, MAC, etc.
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1252   */
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1253  void devlink_fmsg_dump_skb(struct devlink_fmsg *fmsg, const struct sk_buff *skb)
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1254  {
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1255  	struct skb_shared_info *sh = skb_shinfo(skb);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1256  	struct sock *sk = skb->sk;
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1257  	bool has_mac, has_trans;
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1258  
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1259  	has_mac = skb_mac_header_was_set(skb);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1260  	has_trans = skb_transport_header_was_set(skb);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1261  
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1262  	devlink_fmsg_pair_nest_start(fmsg, "skb");
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1263  	devlink_fmsg_obj_nest_start(fmsg);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1264  	devlink_fmsg_put(fmsg, "actual len", skb->len);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1265  	devlink_fmsg_put(fmsg, "head len", skb_headlen(skb));
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1266  	devlink_fmsg_put(fmsg, "data len", skb->data_len);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1267  	devlink_fmsg_put(fmsg, "tail len", skb_tailroom(skb));
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1268  	devlink_fmsg_put(fmsg, "MAC", has_mac ? skb->mac_header : -1);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1269  	devlink_fmsg_put(fmsg, "MAC len",
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1270  			 has_mac ? skb_mac_header_len(skb) : -1);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1271  	devlink_fmsg_put(fmsg, "network hdr", skb->network_header);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1272  	devlink_fmsg_put(fmsg, "network hdr len",
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1273  			 has_trans ? skb_network_header_len(skb) : -1);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1274  	devlink_fmsg_put(fmsg, "transport hdr",
f2df8ad68c42de Mateusz Polchlopek 2024-08-21  1275  			 has_trans ? skb->transport_header : -1);
f2df8ad68c42de Mateusz Polchlopek 2024-08-21 @1276  	devlink_fmsg_put(fmsg, "csum", skb->csum);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
