Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E262F28FA
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 00:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764118228; cv=none; b=GoVD7PqicJDX8maIqYXVLym/G/t/DVZlFT/57G1McpdXhaYVyJpEW1u3LdG3s3QVgIVmcUNozxQY5lq39hsejsSR8dXOSaIwqkC1e6+Bbr4DWnK9Nae0ETKmt3ksfFilpVQBq2bkLNwk4IPe6l0k/NNiSU+4CeXOrZluaHTLqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764118228; c=relaxed/simple;
	bh=7QYkubS0Gt9qBXyQbQUT7MNh2NZo+6XM4q0I1dD8R94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRvY5Lj0SKLWG5plAmdzmSLbl06Qz2VWKIaKuQvFHWefhUNhB+a8gYNzdujzLi3eigBvu/CZibYC4Cf5wkJhIAr8Irrgy81lvo8hlgeGpRGVo0er+/5SCYKUCFyegD1ooFQNOuGii6AGZa7esn5TgKfM/qE1V9XMHKvIw5IyCGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWvIt0fm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWvIt0fm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764118226; x=1795654226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QYkubS0Gt9qBXyQbQUT7MNh2NZo+6XM4q0I1dD8R94=;
  b=BWvIt0fmREXcr9Odt3nHNI602q6l97nMZWDuzCu6AjBnd18vqg2bf8Cn
   kXtpuKtuqnA8iHgnwJ5Cx9PFHNfcNSIHBJi2pT4wiRhR8DI2gD2ERDovp
   134RtCaB9THTYZGQKpaIoXk99dDXszm9zyYxJUTb7CxWspzgzTtGFpRLS
   caWWSrNHQxe/wSnx8LA4s6SjZ8Eh3m0LnyRx1LJFbkVMYmxVtlAKXWpKo
   Yx28q9D5snip5B2xAe/uk19oJtxCVa3hfAJp88SfPNcUW/ryx5H+AyCq2
   egqHvFrvu7Jw4djWcrYUeJ+UuivXTnIU/KoYykcnSOlV7dGmpEuVkqqQ7
   g==;
X-CSE-ConnectionGUID: ml/2upZMS7+gkGlH5SpMYw==
X-CSE-MsgGUID: 6FywCMIhRfeDqnW8AUExfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66190039"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="66190039"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 16:50:26 -0800
X-CSE-ConnectionGUID: DCmbpvGyRJGOVhY981lEkg==
X-CSE-MsgGUID: pQDppt+6RTC/neUVOH8UVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="197271433"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2025 16:50:25 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO3ji-000000002O9-1CdF;
	Wed, 26 Nov 2025 00:50:22 +0000
Date: Wed, 26 Nov 2025 08:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v1 4/5] net: bonding: add the
 READ_ONCE/WRITE_ONCE for outside lock accessing
Message-ID: <202511260730.QubKBTo6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251125084451.11632-5-tonghao@bamaicloud.com>
References: <20251125084451.11632-5-tonghao@bamaicloud.com>
TO: Tonghao Zhang <tonghao@bamaicloud.com>
TO: netdev@vger.kernel.org
CC: Tonghao Zhang <tonghao@bamaicloud.com>
CC: Jay Vosburgh <jv@jvosburgh.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: Nikolay Aleksandrov <razor@blackwall.org>
CC: Hangbin Liu <liuhangbin@gmail.com>

Hi Tonghao,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tonghao-Zhang/net-bonding-use-workqueue-to-make-sure-peer-notify-updated-in-lacp-mode/20251125-164825
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251125084451.11632-5-tonghao%40bamaicloud.com
patch subject: [PATCH net-next v1 4/5] net: bonding: add the READ_ONCE/WRITE_ONCE for outside lock accessing
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251126/202511260730.QubKBTo6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260730.QubKBTo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511260730.QubKBTo6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/bonding/bond_main.c: In function 'bond_peer_notify_reset':
>> drivers/net/bonding/bond_main.c:6585:37: error: unterminated argument list invoking macro "WRITE_ONCE"
    6585 | MODULE_IMPORT_NS("NETDEV_INTERNAL");
         |                                     ^
>> drivers/net/bonding/bond_main.c:1207:9: error: 'WRITE_ONCE' undeclared (first use in this function)
    1207 |         WRITE_ONCE(bond->send_peer_notif,
         |         ^~~~~~~~~~
   drivers/net/bonding/bond_main.c:1207:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/bonding/bond_main.c:1207:19: error: expected ';' at end of input
    1207 |         WRITE_ONCE(bond->send_peer_notif,
         |                   ^
         |                   ;
   ......
>> drivers/net/bonding/bond_main.c:1207:9: error: expected declaration or statement at end of input
    1207 |         WRITE_ONCE(bond->send_peer_notif,
         |         ^~~~~~~~~~
   drivers/net/bonding/bond_main.c: At top level:
>> drivers/net/bonding/bond_main.c:263:12: warning: 'bond_init' declared 'static' but never defined [-Wunused-function]
     263 | static int bond_init(struct net_device *bond_dev);
         |            ^~~~~~~~~
>> drivers/net/bonding/bond_main.c:264:13: warning: 'bond_uninit' declared 'static' but never defined [-Wunused-function]
     264 | static void bond_uninit(struct net_device *bond_dev);
         |             ^~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:265:13: warning: 'bond_get_stats' declared 'static' but never defined [-Wunused-function]
     265 | static void bond_get_stats(struct net_device *bond_dev,
         |             ^~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:267:13: warning: 'bond_slave_arr_handler' declared 'static' but never defined [-Wunused-function]
     267 | static void bond_slave_arr_handler(struct work_struct *work);
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:268:13: warning: 'bond_time_in_interval' declared 'static' but never defined [-Wunused-function]
     268 | static bool bond_time_in_interval(struct bonding *bond, unsigned long last_act,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:270:13: warning: 'bond_netdev_notify_work' declared 'static' but never defined [-Wunused-function]
     270 | static void bond_netdev_notify_work(struct work_struct *work);
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:1205:13: warning: 'bond_peer_notify_reset' defined but not used [-Wunused-function]
    1205 | static void bond_peer_notify_reset(struct bonding *bond)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:1166:13: warning: 'bond_should_notify_peers' defined but not used [-Wunused-function]
    1166 | static bool bond_should_notify_peers(struct bonding *bond)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:1142:22: warning: 'bond_find_best_slave' defined but not used [-Wunused-function]
    1142 | static struct slave *bond_find_best_slave(struct bonding *bond)
         |                      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:1004:13: warning: 'bond_do_fail_over_mac' defined but not used [-Wunused-function]
    1004 | static void bond_do_fail_over_mac(struct bonding *bond,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:922:13: warning: 'bond_hw_addr_swap' defined but not used [-Wunused-function]
     922 | static void bond_hw_addr_swap(struct bonding *bond, struct slave *new_active,
         |             ^~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:884:13: warning: 'bond_resend_igmp_join_requests_delayed' defined but not used [-Wunused-function]
     884 | static void bond_resend_igmp_join_requests_delayed(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:858:12: warning: 'bond_set_allmulti' defined but not used [-Wunused-function]
     858 | static int bond_set_allmulti(struct bonding *bond, int inc)
         |            ^~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:835:12: warning: 'bond_set_promiscuity' defined but not used [-Wunused-function]
     835 | static int bond_set_promiscuity(struct bonding *bond, int inc)
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:788:12: warning: 'bond_update_speed_duplex' defined but not used [-Wunused-function]
     788 | static int bond_update_speed_duplex(struct slave *slave)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:735:33: warning: 'bond_xfrmdev_ops' defined but not used [-Wunused-const-variable=]
     735 | static const struct xfrmdev_ops bond_xfrmdev_ops = {
         |                                 ^~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:593:13: warning: 'bond_ipsec_del_sa_all' defined but not used [-Wunused-function]
     593 | static void bond_ipsec_del_sa_all(struct bonding *bond)
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:516:13: warning: 'bond_ipsec_add_sa_all' defined but not used [-Wunused-function]
     516 | static void bond_ipsec_add_sa_all(struct bonding *bond)
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:404:12: warning: 'bond_vlan_rx_kill_vid' defined but not used [-Wunused-function]
     404 | static int bond_vlan_rx_kill_vid(struct net_device *bond_dev,
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:370:12: warning: 'bond_vlan_rx_add_vid' defined but not used [-Wunused-function]
     370 | static int bond_vlan_rx_add_vid(struct net_device *bond_dev,
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:314:13: warning: 'bond_sk_check' defined but not used [-Wunused-function]
     314 | static bool bond_sk_check(struct bonding *bond)
         |             ^~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:259:30: warning: 'flow_keys_bonding' defined but not used [-Wunused-variable]
     259 | static struct flow_dissector flow_keys_bonding __read_mostly;
         |                              ^~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:216:40: warning: 'flow_keys_bonding_keys' defined but not used [-Wunused-const-variable=]
     216 | static const struct flow_dissector_key flow_keys_bonding_keys[] = {
         |                                        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:122:27: warning: 'bonding_defaults' defined but not used [-Wunused-variable]
     122 | static struct bond_params bonding_defaults;
         |                           ^~~~~~~~~~~~~~~~


vim +/WRITE_ONCE +6585 drivers/net/bonding/bond_main.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  6579  
^1da177e4c3f41 Linus Torvalds     2005-04-16  6580  module_init(bonding_init);
^1da177e4c3f41 Linus Torvalds     2005-04-16  6581  module_exit(bonding_exit);
^1da177e4c3f41 Linus Torvalds     2005-04-16  6582  MODULE_LICENSE("GPL");
2b526b56e39628 Leon Romanovsky    2020-02-24  6583  MODULE_DESCRIPTION(DRV_DESCRIPTION);
^1da177e4c3f41 Linus Torvalds     2005-04-16  6584  MODULE_AUTHOR("Thomas Davis, tadavis@lbl.gov and many others");
0413a34ef678c3 Stanislav Fomichev 2025-07-17 @6585  MODULE_IMPORT_NS("NETDEV_INTERNAL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
