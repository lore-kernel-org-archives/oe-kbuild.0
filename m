Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166856;
	b=B7D/YyPyFNqzcrBbmXWOruZ+M7/XYOjVzNxSJykFp4C45QB+exoou2SIyw8AOQb+VCYz
	 DBil/Jjzep2mdZApmAFYiTPWUVw+ebb0ibLEPWVWyZGAvGcEo5C4ZMQfwC9EC//FBG43b
	 rF9WL5EAY8OxiPiwvllrIX6J+yamUGQIWMZ6DUiVqmIZFXpqvAsBbpeVzarCJVcoXVIYC
	 mog+yoDzjUhWIvYKv42AeyDhzvxLc/7EieSpp8izEjZGlUtWsAteydLpDUP5jyUpIMG9M
	 jAQh2fAHr3/iiRZyoja2kkWeMY9qTym4kCkpEe8az8Rp5bd5ShTZzn4j44FYectP/tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166856;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=voEreHErsMnm8cjFxfwd+awzf3BRFHFZ7D1f0f2Jotg=;
	b=TjUnMvVCuVsV8zEDJcAaJhbLEFiUCTlMntBT4qKQbx/jM7Yk4pL6qI0KbpQd5QhBLgv2
	 d8HPY6Vsf20M/UFFhRilvEY75cre4qrUCu+T4pOSV9vhil7PhN/GvLbTuQRe0GLtXwd2F
	 GBQooIDXMiZngAFijx0z++XoCmEE6D/orVjYajL/fxE4ZUi/YBDUqrvr6glJtYaR7HMCc
	 AHrzewRk7YXoaKJuR4s65rR1dBykHRSarwhb9e8rU4NbDCsqh72ysYxzYuEOoiS9LXTgI
	 Lshc5mWM+Tjytcf/4akiKW8Nyicg2DVknDakYsOfaZYdw9s+5jI/i+5IRPt3uAnDIhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IpMbsd1+;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B15606A325
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 09:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B15606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IpMbsd1+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795166856; x=1826702856;
  h=date:from:to:cc:subject:message-id;
  bh=wmffJS++nv8rMWv2CzRJ/hkiOaT5+VanndGIgYw82/M=;
  b=IpMbsd1+epbxqTIb9qDsVGn8qTlycacJqewuZ3/DquziBCZ/6Hbi6F8l
   45lSQvnKeHWRSQVrEbkRK0ZIp2n2frTxhSyEvz6A8BWjD00lMIcrTzRBY
   stEg2TCw/bRvn64dav2nWVAqQIXGoORTcl1bC4V6FWxf6GHh81fred46i
   KuBkNjFmdJ80ZXKhYGuGJHi15Ryo9qBdfc2669r0ODFEDqlNChVj4egTw
   LdEXdkd8Wii2mGFrnE9d55AJQcLPjGo4lmiF7qsqHjlWvzF6m6GbHH/+6
   k9FaUdowr2WU6MTlpqhefhWX/YPrAlfPtP4vRya4rsk8HdmQgET8Er7Uj
   g==;
X-CSE-ConnectionGUID: Du/rVoBRSxqJQlF03Vlc7Q==
X-CSE-MsgGUID: bSGJTR8/TX+6LulspvgRUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3888983"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3888983"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:27:36 -0800
X-CSE-ConnectionGUID: tXUFtk6yRCyAy/lz8Lpq6Q==
X-CSE-MsgGUID: uX7ll5zlTpSj9V4VVIh7lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10474377"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2026 01:27:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUKu3-0000000040b-3Nfg;
	Fri, 20 Nov 2026 09:27:31 +0000
Date: Fri, 20 Nov 2026 10:26:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/net/ethernet/intel/fm10k/fm10k_main.c:885:16: warning: division by
 zero is undefined
Message-ID: <20261120101813.PFWADJqI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   70fd5fa31bbb8f4609c0aa372ad919c238b16d37
commit: 3e1da3739d68558bacc60ea5f469fbddaf529c32 [1/1] ANDROID: GKI: Add GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-randconfig-r2302-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120101813.PFWADJqI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120101813.PFWADJqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261120101813.PFWADJqI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/fm10k/fm10k_main.c:8:
   In file included from include/net/tcp.h:45:
   include/net/xfrm.h:2088:30: error: no member named 'xfrm' in 'struct dst_entry'
    2088 |         struct xfrm_state *x = dst->xfrm;
         |                                ~~~  ^
   include/net/xfrm.h:2095:46: error: no member named 'xfrm' in 'struct dst_entry'
    2095 |         if (!x->xso.offload_handle && !xdst->child->xfrm)
         |                                        ~~~~~~~~~~~  ^
   include/net/xfrm.h:2098:20: error: no member named 'xfrm' in 'struct dst_entry'
    2098 |             !xdst->child->xfrm)
         |              ~~~~~~~~~~~  ^
>> drivers/net/ethernet/intel/fm10k/fm10k_main.c:885:16: warning: division by zero is undefined [-Wdivision-by-zero]
     885 |         desc_flags |= FM10K_SET_FLAG(tx_flags, FM10K_TX_FLAGS_CSUM,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     886 |                                      FM10K_TXD_FLAG_CSUM);
         |                                      ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/fm10k/fm10k_main.c:877:26: note: expanded from macro 'FM10K_SET_FLAG'
     877 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   1 warning and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=m] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +885 drivers/net/ethernet/intel/fm10k/fm10k_main.c

76a540d4728a37 Alexander Duyck 2014-09-20  873  
76a540d4728a37 Alexander Duyck 2014-09-20  874  #define FM10K_SET_FLAG(_input, _flag, _result) \
76a540d4728a37 Alexander Duyck 2014-09-20  875  	((_flag <= _result) ? \
76a540d4728a37 Alexander Duyck 2014-09-20  876  	 ((u32)(_input & _flag) * (_result / _flag)) : \
76a540d4728a37 Alexander Duyck 2014-09-20  877  	 ((u32)(_input & _flag) / (_flag / _result)))
76a540d4728a37 Alexander Duyck 2014-09-20  878  
76a540d4728a37 Alexander Duyck 2014-09-20  879  static u8 fm10k_tx_desc_flags(struct sk_buff *skb, u32 tx_flags)
76a540d4728a37 Alexander Duyck 2014-09-20  880  {
76a540d4728a37 Alexander Duyck 2014-09-20  881  	/* set type for advanced descriptor with frame checksum insertion */
76a540d4728a37 Alexander Duyck 2014-09-20  882  	u32 desc_flags = 0;
76a540d4728a37 Alexander Duyck 2014-09-20  883  
76a540d4728a37 Alexander Duyck 2014-09-20  884  	/* set checksum offload bits */
76a540d4728a37 Alexander Duyck 2014-09-20 @885  	desc_flags |= FM10K_SET_FLAG(tx_flags, FM10K_TX_FLAGS_CSUM,
76a540d4728a37 Alexander Duyck 2014-09-20  886  				     FM10K_TXD_FLAG_CSUM);
76a540d4728a37 Alexander Duyck 2014-09-20  887  
76a540d4728a37 Alexander Duyck 2014-09-20  888  	return desc_flags;
76a540d4728a37 Alexander Duyck 2014-09-20  889  }
76a540d4728a37 Alexander Duyck 2014-09-20  890  

:::::: The code at line 885 was first introduced by commit
:::::: 76a540d4728a379e022fb2e2e8766d502b6d345c fm10k: Add support for netdev offloads

:::::: TO: Alexander Duyck <alexander.h.duyck@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
