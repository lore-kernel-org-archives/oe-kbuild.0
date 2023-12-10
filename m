Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1063A
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtKUNdsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702212728; x=1733748728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AonU4sUJlIh+YwPs6/zj+9CCuVObJFc9JdUFl5PTLrE=;
  b=XtKUNdsBOOO1FDvdpPgVsczQgw/LfSsgi2f7Vd8Q/mJxvpkL5EZDOtG4
   C0Z1FlXaasnsc8gh2U5TbTQkbUfBfQQa8iXuA9d6Fzcs2/I/TyuTc1SLE
   PV9ZJEvnTV7EPF/J+UU1WAvzH0tmj0fJMDTpYz50GHSSQ7m6ljVttQJ7z
   tpOXHvSvccvXVedfkVP59XWe8FlCIC7o30qGz5gnZEvmdYMcpfMylVPQH
   6P1ClCpfmFws88xMnSjfxggqI0+6FieCtZcex2domw0/ouDKCSLm2tKkd
   xmA8sM7e2Zdd/LfxI9TIB9wK64WzQ9Nj+rmfbMOZABRr4tfP/i4CG+gFN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="398412137"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="398412137"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 04:52:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="843173269"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="843173269"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2023 04:52:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCJHv-000Gq8-1k;
	Sun, 10 Dec 2023 12:52:03 +0000
Date: Sun, 10 Dec 2023 20:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c:1157
 mlxsw_sp_bridge_port_vlan_add() error: uninitialized symbol 'proto'.
Message-ID: <202312102006.YxunZ5rf-lkp@intel.com>
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
TO: Amit Cohen <amcohen@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Petr Machata <petrm@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 3ae7a65b6424154cb5d606ccae27ffd0ac76ed56 mlxsw: Make EtherType configurable when pushing VLAN at ingress
date:   3 years ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 years ago
config: i386-randconfig-141-20230929 (https://download.01.org/0day-ci/archive/20231210/202312102006.YxunZ5rf-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312102006.YxunZ5rf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312102006.YxunZ5rf-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c:1157 mlxsw_sp_bridge_port_vlan_add() error: uninitialized symbol 'proto'.
drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c:1834 mlxsw_sp_bridge_port_vlan_del() error: uninitialized symbol 'proto'.

vim +/proto +1157 drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c

c57529e1d5d882 Ido Schimmel 2017-05-26  1122  
c57529e1d5d882 Ido Schimmel 2017-05-26  1123  static int
c57529e1d5d882 Ido Schimmel 2017-05-26  1124  mlxsw_sp_bridge_port_vlan_add(struct mlxsw_sp_port *mlxsw_sp_port,
c57529e1d5d882 Ido Schimmel 2017-05-26  1125  			      struct mlxsw_sp_bridge_port *bridge_port,
7357eb3d4b3e33 Petr Machata 2018-12-12  1126  			      u16 vid, bool is_untagged, bool is_pvid,
457e20d659247a Ido Schimmel 2019-01-08  1127  			      struct netlink_ext_ack *extack)
c57529e1d5d882 Ido Schimmel 2017-05-26  1128  {
c57529e1d5d882 Ido Schimmel 2017-05-26  1129  	u16 pvid = mlxsw_sp_port_pvid_determine(mlxsw_sp_port, vid, is_pvid);
c57529e1d5d882 Ido Schimmel 2017-05-26  1130  	struct mlxsw_sp_port_vlan *mlxsw_sp_port_vlan;
c57529e1d5d882 Ido Schimmel 2017-05-26  1131  	u16 old_pvid = mlxsw_sp_port->pvid;
3ae7a65b642415 Amit Cohen   2020-11-29  1132  	u16 proto;
c57529e1d5d882 Ido Schimmel 2017-05-26  1133  	int err;
c57529e1d5d882 Ido Schimmel 2017-05-26  1134  
635c8c8bba670d Ido Schimmel 2018-12-19  1135  	/* The only valid scenario in which a port-vlan already exists, is if
635c8c8bba670d Ido Schimmel 2018-12-19  1136  	 * the VLAN flags were changed and the port-vlan is associated with the
635c8c8bba670d Ido Schimmel 2018-12-19  1137  	 * correct bridge port
635c8c8bba670d Ido Schimmel 2018-12-19  1138  	 */
635c8c8bba670d Ido Schimmel 2018-12-19  1139  	mlxsw_sp_port_vlan = mlxsw_sp_port_vlan_find_by_vid(mlxsw_sp_port, vid);
635c8c8bba670d Ido Schimmel 2018-12-19  1140  	if (mlxsw_sp_port_vlan &&
635c8c8bba670d Ido Schimmel 2018-12-19  1141  	    mlxsw_sp_port_vlan->bridge_port != bridge_port)
635c8c8bba670d Ido Schimmel 2018-12-19  1142  		return -EEXIST;
635c8c8bba670d Ido Schimmel 2018-12-19  1143  
635c8c8bba670d Ido Schimmel 2018-12-19  1144  	if (!mlxsw_sp_port_vlan) {
635c8c8bba670d Ido Schimmel 2018-12-19  1145  		mlxsw_sp_port_vlan = mlxsw_sp_port_vlan_create(mlxsw_sp_port,
635c8c8bba670d Ido Schimmel 2018-12-19  1146  							       vid);
c57529e1d5d882 Ido Schimmel 2017-05-26  1147  		if (IS_ERR(mlxsw_sp_port_vlan))
c57529e1d5d882 Ido Schimmel 2017-05-26  1148  			return PTR_ERR(mlxsw_sp_port_vlan);
635c8c8bba670d Ido Schimmel 2018-12-19  1149  	}
c57529e1d5d882 Ido Schimmel 2017-05-26  1150  
c57529e1d5d882 Ido Schimmel 2017-05-26  1151  	err = mlxsw_sp_port_vlan_set(mlxsw_sp_port, vid, vid, true,
c57529e1d5d882 Ido Schimmel 2017-05-26  1152  				     is_untagged);
c57529e1d5d882 Ido Schimmel 2017-05-26  1153  	if (err)
c57529e1d5d882 Ido Schimmel 2017-05-26  1154  		goto err_port_vlan_set;
c57529e1d5d882 Ido Schimmel 2017-05-26  1155  
3ae7a65b642415 Amit Cohen   2020-11-29  1156  	br_vlan_get_proto(bridge_port->bridge_device->dev, &proto);
3ae7a65b642415 Amit Cohen   2020-11-29 @1157  	err = mlxsw_sp_port_pvid_set(mlxsw_sp_port, pvid, proto);
c57529e1d5d882 Ido Schimmel 2017-05-26  1158  	if (err)
c57529e1d5d882 Ido Schimmel 2017-05-26  1159  		goto err_port_pvid_set;
c57529e1d5d882 Ido Schimmel 2017-05-26  1160  
7357eb3d4b3e33 Petr Machata 2018-12-12  1161  	err = mlxsw_sp_port_vlan_bridge_join(mlxsw_sp_port_vlan, bridge_port,
7357eb3d4b3e33 Petr Machata 2018-12-12  1162  					     extack);
c57529e1d5d882 Ido Schimmel 2017-05-26  1163  	if (err)
c57529e1d5d882 Ido Schimmel 2017-05-26  1164  		goto err_port_vlan_bridge_join;
c57529e1d5d882 Ido Schimmel 2017-05-26  1165  
c57529e1d5d882 Ido Schimmel 2017-05-26  1166  	return 0;
c57529e1d5d882 Ido Schimmel 2017-05-26  1167  
c57529e1d5d882 Ido Schimmel 2017-05-26  1168  err_port_vlan_bridge_join:
3ae7a65b642415 Amit Cohen   2020-11-29  1169  	mlxsw_sp_port_pvid_set(mlxsw_sp_port, old_pvid, proto);
b07a966c700761 Ido Schimmel 2015-11-19  1170  err_port_pvid_set:
fe9ccc785de5f8 Ido Schimmel 2017-05-16  1171  	mlxsw_sp_port_vlan_set(mlxsw_sp_port, vid, vid, false, false);
fe9ccc785de5f8 Ido Schimmel 2017-05-16  1172  err_port_vlan_set:
635c8c8bba670d Ido Schimmel 2018-12-19  1173  	mlxsw_sp_port_vlan_destroy(mlxsw_sp_port_vlan);
b07a966c700761 Ido Schimmel 2015-11-19  1174  	return err;
56ade8fe3fe1e1 Jiri Pirko   2015-10-16  1175  }
56ade8fe3fe1e1 Jiri Pirko   2015-10-16  1176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
