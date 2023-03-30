Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D319455
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 20:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680206591; x=1711742591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gr9Ebg0ya5GXPpsDIPBm2LcTKmkiGQI0G0IK+z3Uxy0=;
  b=T+BIz1wk/JOtvNhS6m7N4KD6Gw6CTHo6Tawq32Gyln0U/t54gN2TBHCa
   LuS30wTbUFbKvq88sn2zzgR0nojt1MfUTkqeKdRK218NtNkqXAIPBpK/6
   8WuTJrodN8u8N/iC6h7fKLj0NnGfe3Pzc5GC2pOY4er8/3a3tAFtJAFZh
   tMEHNr6vmnSQYJYFY1FYZkyx98s0oX2fZqELdT0uS0vC8FFay/UR5ZnP8
   +vfIMojQFKs9imVYK5yZp8jGiitZCBX0J2pB/TZ3RELm0LAa/8URMw5ZD
   b34TDhMwR9rasKx5EDFegbaM5/er8VlNU/5l8ayKTnsJPivoGG2pcE0Op
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="403970579"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="403970579"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 13:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662154350"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="662154350"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Mar 2023 13:03:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phyUG-000LAq-1J;
	Thu, 30 Mar 2023 20:03:08 +0000
Date: Fri, 31 Mar 2023 04:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c:500
 sparx5_handle_port_mdb_add() error: we previously assumed 'entry' could be
 null (see line 493)
Message-ID: <202303310341.kyGezXTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Casper Andersson <casper.casan@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bb95a1662f8b97c443984550a7aefbe5a1a064e
commit: c8a3ea43b5cb5a7db48130a32384f7e48b148de9 net: sparx5: add list for mdb entries in driver
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310341.kyGezXTB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303310341.kyGezXTB-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c:500 sparx5_handle_port_mdb_add() error: we previously assumed 'entry' could be null (see line 493)

vim +/entry +500 drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c

c8a3ea43b5cb5a Casper Andersson 2022-08-25  467  
3bacfccdcb2d32 Casper Andersson 2022-03-21  468  static int sparx5_handle_port_mdb_add(struct net_device *dev,
3bacfccdcb2d32 Casper Andersson 2022-03-21  469  				      struct notifier_block *nb,
3bacfccdcb2d32 Casper Andersson 2022-03-21  470  				      const struct switchdev_obj_port_mdb *v)
3bacfccdcb2d32 Casper Andersson 2022-03-21  471  {
3bacfccdcb2d32 Casper Andersson 2022-03-21  472  	struct sparx5_port *port = netdev_priv(dev);
3bacfccdcb2d32 Casper Andersson 2022-03-21  473  	struct sparx5 *spx5 = port->sparx5;
c8a3ea43b5cb5a Casper Andersson 2022-08-25  474  	struct sparx5_mdb_entry *entry;
fbb89d02e33a8c Casper Andersson 2022-06-14  475  	bool is_host;
c8a3ea43b5cb5a Casper Andersson 2022-08-25  476  	int err;
c8a3ea43b5cb5a Casper Andersson 2022-08-25  477  	u16 vid;
3bacfccdcb2d32 Casper Andersson 2022-03-21  478  
9c5de246c1dbe7 Casper Andersson 2022-06-30  479  	if (!sparx5_netdevice_check(dev))
9c5de246c1dbe7 Casper Andersson 2022-06-30  480  		return -EOPNOTSUPP;
9c5de246c1dbe7 Casper Andersson 2022-06-30  481  
fbb89d02e33a8c Casper Andersson 2022-06-14  482  	is_host = netif_is_bridge_master(v->obj.orig_dev);
1c1ed5a48411e1 Casper Andersson 2022-05-03  483  
3bacfccdcb2d32 Casper Andersson 2022-03-21  484  	/* When VLAN unaware the vlan value is not parsed and we receive vid 0.
3bacfccdcb2d32 Casper Andersson 2022-03-21  485  	 * Fall back to bridge vid 1.
3bacfccdcb2d32 Casper Andersson 2022-03-21  486  	 */
3bacfccdcb2d32 Casper Andersson 2022-03-21  487  	if (!br_vlan_enabled(spx5->hw_bridge_dev))
3bacfccdcb2d32 Casper Andersson 2022-03-21  488  		vid = 1;
3bacfccdcb2d32 Casper Andersson 2022-03-21  489  	else
3bacfccdcb2d32 Casper Andersson 2022-03-21  490  		vid = v->vid;
3bacfccdcb2d32 Casper Andersson 2022-03-21  491  
c8a3ea43b5cb5a Casper Andersson 2022-08-25  492  	entry = sparx5_mdb_get_entry(spx5, v->addr, vid);
c8a3ea43b5cb5a Casper Andersson 2022-08-25 @493  	if (!entry) {
c8a3ea43b5cb5a Casper Andersson 2022-08-25  494  		err = sparx5_alloc_mdb_entry(spx5, v->addr, vid, &entry);
c8a3ea43b5cb5a Casper Andersson 2022-08-25  495  		if (err)
3bacfccdcb2d32 Casper Andersson 2022-03-21  496  			return err;
3bacfccdcb2d32 Casper Andersson 2022-03-21  497  	}
3bacfccdcb2d32 Casper Andersson 2022-03-21  498  
c8a3ea43b5cb5a Casper Andersson 2022-08-25  499  	mutex_lock(&spx5->mdb_lock);
c8a3ea43b5cb5a Casper Andersson 2022-08-25 @500  	if (is_host && !entry->cpu_copy) {
c8a3ea43b5cb5a Casper Andersson 2022-08-25  501  		sparx5_cpu_copy_ena(spx5, entry->pgid_idx, true);
c8a3ea43b5cb5a Casper Andersson 2022-08-25  502  		entry->cpu_copy = true;
c8a3ea43b5cb5a Casper Andersson 2022-08-25  503  	} else if (!is_host) {
c8a3ea43b5cb5a Casper Andersson 2022-08-25  504  		sparx5_pgid_update_mask(port, entry->pgid_idx, true);
c8a3ea43b5cb5a Casper Andersson 2022-08-25  505  		set_bit(port->portno, entry->port_mask);
3bacfccdcb2d32 Casper Andersson 2022-03-21  506  	}
c8a3ea43b5cb5a Casper Andersson 2022-08-25  507  	mutex_unlock(&spx5->mdb_lock);
3bacfccdcb2d32 Casper Andersson 2022-03-21  508  
c8a3ea43b5cb5a Casper Andersson 2022-08-25  509  	sparx5_mact_learn(spx5, entry->pgid_idx, entry->addr, entry->vid);
3bacfccdcb2d32 Casper Andersson 2022-03-21  510  
3bacfccdcb2d32 Casper Andersson 2022-03-21  511  	return 0;
3bacfccdcb2d32 Casper Andersson 2022-03-21  512  }
3bacfccdcb2d32 Casper Andersson 2022-03-21  513  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
