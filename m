Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ADB18D65F
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Aug 2024 06:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723701724; cv=none; b=tuzvFx09a2E76Eo5CDjyGK9AAz5oMyhtp50vlK4CGu5e1sPGQI//7Vzdwn2Etu5dDsGVP0Dg4X/u+Gfk13rQJfaEne9pq7JNsAGNBt6bR03Ut1Xe8WBrgAvhQQOb1bGNEHDiceTbtqEPT43PS1Y9FWHAOwMxWRRBflE6YMCb1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723701724; c=relaxed/simple;
	bh=bB7NUf6EMX6gGkLGeXJaWOm/4qlsTNkuU0+/yKx0peY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d19cJGRwYPVzUbTy3tsf4pO7xAHo9SWkSmnQR1AOi4fAgkZfaoix7saOr/4kFWnb0OJSJsp59208HwGPq//W8VmEx5eC6XnS1KlCrzPa3POa7iY56TfeYR2bz3FWpJ7HE6P4hCjISJAouQwfCL/GGeoke7wX4lPVlvdD1T3r9+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcKH6Ht6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcKH6Ht6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723701720; x=1755237720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bB7NUf6EMX6gGkLGeXJaWOm/4qlsTNkuU0+/yKx0peY=;
  b=UcKH6Ht62b1kvGOUBhjyE4cJRDrIBfTdCJwBa3kG+cUIqzJcoCjvG7lD
   0NjKZ4JZU3orZCwW4Rv0BdhC2Ayf5wlzJudgWX4i5248ei9IYToOfmJhq
   digEaMtySOEoaXg3gAkv1rkMh4xxgwJjp5F//dK/3EYl13lb/wNGHZPqv
   MkzMZKByFcCanLtXHLBYasO2V3QpKiW3vSnk7HyLQO6c6w5paw5AMXC43
   esY9GEo5ZFWU25FrIAwT5Mdn+RKHxIflPf/SaXARdosa9W5FyeTr2+n2i
   wSEY2muRzHPsL/mPDgsLWyKlWoTCCadmzvkMhPGTPNBR2Ik8/3lFMtIO7
   w==;
X-CSE-ConnectionGUID: 7okLT0r3R5SxN4s8maDipQ==
X-CSE-MsgGUID: e1ydwnouTfarbiNJAFkfRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="24851119"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="24851119"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 23:02:00 -0700
X-CSE-ConnectionGUID: wWunNp5USJ257KXhLpCQyA==
X-CSE-MsgGUID: mI4aSZe1TL+sxl2FD8lJFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="64091423"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2024 23:01:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seTYa-0003Fc-0a;
	Thu, 15 Aug 2024 06:01:56 +0000
Date: Thu, 15 Aug 2024 14:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 7044/13428]
 drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse:
 sparse: invalid bitfield specifier for type restricted __le16.
Message-ID: <202408151357.KENE3M0T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16."
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Dong Yibo <dong100@mucse.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   80659f8a805633d663edc260627f7fa51fd8b474
commit: bf177ad1d8f72824180b44563c09f37562f645de [7044/13428] drivers: initial support for rnpgbevf drivers from Mucse Technology
:::::: branch date: 23 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r123-20240815 (https://download.01.org/0day-ci/archive/20240815/202408151357.KENE3M0T-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240815/202408151357.KENE3M0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408151357.KENE3M0T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mucse/rnpgbevf/vf.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
>> drivers/net/ethernet/mucse/rnpgbevf/vf.c:236:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:236:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:236:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:238:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:238:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:238:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:239:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:239:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:239:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:240:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:240:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:240:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:241:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:241:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:241:9: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_mbx.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h, drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_mbx.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h, drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_sysfs.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h, drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h, drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:111:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:111:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:111:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1969:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1969:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1969:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2026:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2026:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2026:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3163:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3163:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3163:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3206:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3206:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3206:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3283:25: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3283:25: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3283:25: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3343:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3343:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3343:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3347:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3347:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3347:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3424:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3424:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3424:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3466:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3466:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3466:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4031:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4031:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4031:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4035:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4035:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4035:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4133:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4133:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4133:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4137:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4137:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4137:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4277:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4277:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4277:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4367:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4367:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4367:9: sparse:    void *

vim +64 drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h

bf177ad1d8f728 Dong Yibo 2024-03-22  51  
bf177ad1d8f728 Dong Yibo 2024-03-22  52  /* Transmit Descriptor - Advanced */
bf177ad1d8f728 Dong Yibo 2024-03-22  53  struct rnp_tx_desc {
bf177ad1d8f728 Dong Yibo 2024-03-22  54  	union {
bf177ad1d8f728 Dong Yibo 2024-03-22  55  		__le64 pkt_addr; /* Packet buffer address */
bf177ad1d8f728 Dong Yibo 2024-03-22  56  		struct {
bf177ad1d8f728 Dong Yibo 2024-03-22  57  			__le32 adr_lo;
bf177ad1d8f728 Dong Yibo 2024-03-22  58  			__le32 adr_hi;
bf177ad1d8f728 Dong Yibo 2024-03-22  59  		};
bf177ad1d8f728 Dong Yibo 2024-03-22  60  	};
bf177ad1d8f728 Dong Yibo 2024-03-22  61  	__le16 blen;
bf177ad1d8f728 Dong Yibo 2024-03-22  62  	union {
bf177ad1d8f728 Dong Yibo 2024-03-22  63  		struct {
bf177ad1d8f728 Dong Yibo 2024-03-22 @64  			__le16 ip_len : 9;
bf177ad1d8f728 Dong Yibo 2024-03-22  65  			__le16 mac_len : 7;
bf177ad1d8f728 Dong Yibo 2024-03-22  66  		};
bf177ad1d8f728 Dong Yibo 2024-03-22  67  		__le16 mac_ip_len; /* used only in  tso & csum */
bf177ad1d8f728 Dong Yibo 2024-03-22  68  	};
bf177ad1d8f728 Dong Yibo 2024-03-22  69  	__le16 vlan;
bf177ad1d8f728 Dong Yibo 2024-03-22  70  #define RNPGBE_TXD_FLAGS_VLAN_PRIO_MASK 0xe000
bf177ad1d8f728 Dong Yibo 2024-03-22  71  #define RNPGBE_TX_FLAGS_VLAN_PRIO_SHIFT 13
bf177ad1d8f728 Dong Yibo 2024-03-22  72  #define RNPGBE_TX_FLAGS_VLAN_CFI_SHIFT 12
bf177ad1d8f728 Dong Yibo 2024-03-22  73  
bf177ad1d8f728 Dong Yibo 2024-03-22  74  	__le16 cmd;
bf177ad1d8f728 Dong Yibo 2024-03-22  75  #define RNPGBE_TXD_VLAN_VALID (0x1 << 15)
bf177ad1d8f728 Dong Yibo 2024-03-22  76  #define RNPGBE_TXD_SVLAN_TYPE (0x1 << 9)
bf177ad1d8f728 Dong Yibo 2024-03-22  77  #define RNPGBE_TXD_VLAN_CTRL_NOP (0x00 << 13)
bf177ad1d8f728 Dong Yibo 2024-03-22  78  #define RNPGBE_TXD_VLAN_CTRL_RM_VLAN (0x01 << 13)
bf177ad1d8f728 Dong Yibo 2024-03-22  79  #define RNPGBE_TXD_VLAN_CTRL_INSERT_VLAN (0x02 << 13)
bf177ad1d8f728 Dong Yibo 2024-03-22  80  #define RNPGBE_TXD_L4_CSUM (0x1 << 12)
bf177ad1d8f728 Dong Yibo 2024-03-22  81  #define RNPGBE_TXD_IP_CSUM (0x1 << 11)
bf177ad1d8f728 Dong Yibo 2024-03-22  82  #define RNPGBE_TXD_TUNNEL_MASK (0x3000000)
bf177ad1d8f728 Dong Yibo 2024-03-22  83  #define RNPGBE_TXD_TUNNEL_VXLAN (0x01 << 8)
bf177ad1d8f728 Dong Yibo 2024-03-22  84  #define RNPGBE_TXD_TUNNEL_NVGRE (0x02 << 8)
bf177ad1d8f728 Dong Yibo 2024-03-22  85  #define RNPGBE_TXD_L4_TYPE_UDP (0x03 << 6)
bf177ad1d8f728 Dong Yibo 2024-03-22  86  #define RNPGBE_TXD_L4_TYPE_TCP (0x01 << 6)
bf177ad1d8f728 Dong Yibo 2024-03-22  87  #define RNPGBE_TXD_L4_TYPE_SCTP (0x02 << 6)
bf177ad1d8f728 Dong Yibo 2024-03-22  88  #define RNPGBE_TXD_FLAG_IPv4 (0x0 << 5)
bf177ad1d8f728 Dong Yibo 2024-03-22  89  #define RNPGBE_TXD_FLAG_IPv6 (0x1 << 5)
bf177ad1d8f728 Dong Yibo 2024-03-22  90  #define RNPGBE_TXD_FLAG_TSO (0x1 << 4)
bf177ad1d8f728 Dong Yibo 2024-03-22  91  #define RNPGBE_TXD_CMD_RS (0x1 << 2)
bf177ad1d8f728 Dong Yibo 2024-03-22  92  #define RNPGBE_TXD_STAT_DD (0x1 << 1)
bf177ad1d8f728 Dong Yibo 2024-03-22  93  #define RNPGBE_TXD_CMD_EOP (0x1 << 0)
bf177ad1d8f728 Dong Yibo 2024-03-22  94  } __packed;
bf177ad1d8f728 Dong Yibo 2024-03-22  95  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
