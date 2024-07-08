Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A572C3C0C
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 02:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720405196; cv=none; b=teBskyfUCzJ3aCJKBpD5YbwrKsbNyGdC+DLL2Spq8J24bzhdOWNyyhUsvfUyunIIv9yfhvnXsPqe9bX3q+fzXcM/E1hVV93KBmRZgC9XX+HB4hFvU75fAkjYVcKAsxYnRTsD4+S2+gSWlNe2t73o4DFbey+7sTLzeo8ht8ZWlJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720405196; c=relaxed/simple;
	bh=bYvk70cHngiak67HsGMrEjmquuhDw/qKpSzjU3gr7vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F00rgA92bRXIU3ujpCos16+x5lXNpV76sB9n63iFYkSvM8VNPD+UGd3uWTypDmY64QYqMFqxtWzN551Q/uqfuhWtttQXF3R+va6HjikEoOSl6HAAudd1SH2Pg+b8P/DpPTjYVq0NFDPxe6QQd0Vh/PUyiMSVbyvLa0f7O9n9Eug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LW3kmclA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LW3kmclA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720405193; x=1751941193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYvk70cHngiak67HsGMrEjmquuhDw/qKpSzjU3gr7vs=;
  b=LW3kmclAwUdQDTL0U5H+FyPROQ32XJ1zdGnsNdjVgR9KdsZqMMH64n+d
   4/2RU49oPmrSsPbSZo1ii7iIJecuCJmkVgu2U6fbqd3YyPAujEQEGAn6M
   6QGcVQhL2K01YQlYNSdsAi7O47UIS7T+lMZi68rAHfAQYyoXjq/oyqIHm
   5qRAAUe1WwlY87smVXZ1RUoCgWzgGYARm28/ABOkxXANps/dXu+ydomUo
   CgLKpXQtIEHPNfPojTj6AiaSiRqK+Y5wld/M7cPjOHTFu//xxx1vvaxg5
   12ddmNuxfbqIU+CRtAol+5MyLYo7bm/k55aYREEK2q++9eZ3sJ+mD8tCX
   g==;
X-CSE-ConnectionGUID: gcyPOgq/TdqG7TgxH2b4Tw==
X-CSE-MsgGUID: p844P1o+QZ+bhwGgDTLFbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17464305"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17464305"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 19:19:52 -0700
X-CSE-ConnectionGUID: nORcOM/1Q0eD7G+DcEWaUg==
X-CSE-MsgGUID: ATUgxmOtR/S0uidzUmzfNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47248009"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jul 2024 19:19:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQdyn-000VSC-1w;
	Mon, 08 Jul 2024 02:19:49 +0000
Date: Mon, 8 Jul 2024 10:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 6865/10596]
 drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:68:39: sparse: sparse:
 invalid bitfield specifier for type restricted __le16.
Message-ID: <202407081028.X8nBI09C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:68:39: sparse: sparse: invalid bitfield specifier for type restricted __le16."
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Dong Yibo <dong100@mucse.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3b421b6002e287e38790cbdad4a3e08baf7e1bc4
commit: 6adab536d69347a10c2366aaf6b86de963d5994b [6865/10596] drivers: initial support for rnpvf drivers from Mucse Technology
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r132-20240707 (https://download.01.org/0day-ci/archive/20240708/202407081028.X8nBI09C-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407081028.X8nBI09C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407081028.X8nBI09C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mucse/rnpvf/rnpvf_sysfs.c: note: in included file (through drivers/net/ethernet/mucse/rnpvf/vf.h, drivers/net/ethernet/mucse/rnpvf/rnpvf.h):
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:68:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:69:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/mucse/rnpvf/mbx.c: note: in included file (through drivers/net/ethernet/mucse/rnpvf/vf.h, drivers/net/ethernet/mucse/rnpvf/mbx.h):
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:68:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:69:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/mucse/rnpvf/vf.c: note: in included file (through drivers/net/ethernet/mucse/rnpvf/vf.h):
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:68:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:69:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
>> drivers/net/ethernet/mucse/rnpvf/vf.c:233:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/vf.c:233:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/vf.c:233:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/vf.c:235:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/vf.c:235:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/vf.c:235:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/vf.c:236:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/vf.c:236:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/vf.c:236:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/vf.c:237:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/vf.c:237:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/vf.c:237:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/vf.c:238:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/vf.c:238:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/vf.c:238:9: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpvf/ethtool.c: note: in included file (through drivers/net/ethernet/mucse/rnpvf/vf.h, drivers/net/ethernet/mucse/rnpvf/rnpvf.h):
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:68:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:69:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: note: in included file (through drivers/net/ethernet/mucse/rnpvf/vf.h, drivers/net/ethernet/mucse/rnpvf/rnpvf.h):
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:68:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h:69:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:119:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:119:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:119:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2120:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2120:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2120:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2180:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2180:17: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2180:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3283:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3283:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3283:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3326:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3326:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3326:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3403:25: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3403:25: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3403:25: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3543:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3543:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3543:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3547:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3547:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3547:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3619:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3619:17: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3619:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3657:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3657:17: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3657:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4231:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4231:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4231:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4235:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4235:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4235:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4341:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4341:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4341:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4345:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4345:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4345:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4489:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4489:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4489:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4579:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4579:9: sparse:    void
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4579:9: sparse:    void *

vim +68 drivers/net/ethernet/mucse/rnpvf/rnpvf_defines.h

6adab536d69347 Dong Yibo 2024-03-21  55  
6adab536d69347 Dong Yibo 2024-03-21  56  /* Transmit Descriptor - Advanced */
6adab536d69347 Dong Yibo 2024-03-21  57  struct rnp_tx_desc {
6adab536d69347 Dong Yibo 2024-03-21  58  	union {
6adab536d69347 Dong Yibo 2024-03-21  59  		__le64 pkt_addr; /* Packet buffer address */
6adab536d69347 Dong Yibo 2024-03-21  60  		struct {
6adab536d69347 Dong Yibo 2024-03-21  61  			__le32 adr_lo;
6adab536d69347 Dong Yibo 2024-03-21  62  			__le32 adr_hi;
6adab536d69347 Dong Yibo 2024-03-21  63  		};
6adab536d69347 Dong Yibo 2024-03-21  64  	};
6adab536d69347 Dong Yibo 2024-03-21  65  	__le16 blen;
6adab536d69347 Dong Yibo 2024-03-21  66  	union {
6adab536d69347 Dong Yibo 2024-03-21  67  		struct {
6adab536d69347 Dong Yibo 2024-03-21 @68  			__le16 ip_len : 9;
6adab536d69347 Dong Yibo 2024-03-21  69  			__le16 mac_len : 7;
6adab536d69347 Dong Yibo 2024-03-21  70  		};
6adab536d69347 Dong Yibo 2024-03-21  71  		__le16 mac_ip_len; /* used only in  tso & csum */
6adab536d69347 Dong Yibo 2024-03-21  72  	};
6adab536d69347 Dong Yibo 2024-03-21  73  	__le16 vlan;
6adab536d69347 Dong Yibo 2024-03-21  74  #define RNP_TXD_FLAGS_VLAN_PRIO_MASK 0xe000
6adab536d69347 Dong Yibo 2024-03-21  75  #define RNP_TX_FLAGS_VLAN_PRIO_SHIFT 13
6adab536d69347 Dong Yibo 2024-03-21  76  #define RNP_TX_FLAGS_VLAN_CFI_SHIFT 12
6adab536d69347 Dong Yibo 2024-03-21  77  
6adab536d69347 Dong Yibo 2024-03-21  78  	__le16 cmd;
6adab536d69347 Dong Yibo 2024-03-21  79  #define RNP_TXD_VLAN_VALID (0x1 << 15)
6adab536d69347 Dong Yibo 2024-03-21  80  #define RNP_TXD_SVLAN_TYPE (0x1 << 14)
6adab536d69347 Dong Yibo 2024-03-21  81  #define RNP_TXD_VLAN_CTRL_NOP (0x00 << 13)
6adab536d69347 Dong Yibo 2024-03-21  82  #define RNP_TXD_VLAN_CTRL_RM_VLAN (0x01 << 13)
6adab536d69347 Dong Yibo 2024-03-21  83  #define RNP_TXD_VLAN_CTRL_INSERT_VLAN (0x02 << 13)
6adab536d69347 Dong Yibo 2024-03-21  84  #define RNP_TXD_L4_CSUM (0x1 << 12) /* udp tcp sctp csum */
6adab536d69347 Dong Yibo 2024-03-21  85  #define RNP_TXD_IP_CSUM (0x1 << 11)
6adab536d69347 Dong Yibo 2024-03-21  86  #define RNP_TXD_TUNNEL_MASK (0x3000000)
6adab536d69347 Dong Yibo 2024-03-21  87  #define RNP_TXD_TUNNEL_VXLAN (0x01 << 8)
6adab536d69347 Dong Yibo 2024-03-21  88  #define RNP_TXD_TUNNEL_NVGRE (0x02 << 8)
6adab536d69347 Dong Yibo 2024-03-21  89  #define RNP_TXD_L4_TYPE_UDP (0x03 << 6)
6adab536d69347 Dong Yibo 2024-03-21  90  #define RNP_TXD_L4_TYPE_TCP (0x01 << 6)
6adab536d69347 Dong Yibo 2024-03-21  91  #define RNP_TXD_L4_TYPE_SCTP (0x02 << 6)
6adab536d69347 Dong Yibo 2024-03-21  92  #define RNP_TXD_FLAG_IPv4 (0 << 5)
6adab536d69347 Dong Yibo 2024-03-21  93  #define RNP_TXD_FLAG_IPv6 (0x1 << 5)
6adab536d69347 Dong Yibo 2024-03-21  94  #define RNP_TXD_FLAG_TSO (0x1 << 4)
6adab536d69347 Dong Yibo 2024-03-21  95  #define RNP_TXD_CMD_RS (0x1 << 2)
6adab536d69347 Dong Yibo 2024-03-21  96  #define RNP_TXD_STAT_DD (0x1 << 1)
6adab536d69347 Dong Yibo 2024-03-21  97  #define RNP_TXD_CMD_EOP (0x1 << 0)
6adab536d69347 Dong Yibo 2024-03-21  98  } __packed;
6adab536d69347 Dong Yibo 2024-03-21  99  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
