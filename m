Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74AB562612
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 19:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982114; cv=none; b=D9RCv+SVEgLcvRRKrE6pBZlFApGeeVg/okspFZ8tpexfYiDDGuTSED1B5PVfEmqZ3csqLcroaY8LI48KVKZfTLgkX2geoSd25LjPs3GvEiqANCcmbjQFBnD9wTQJ8fQrWhUdaYuEq9wk0q3dVK9K/N6yGEmFVsoykynS+G5g3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982114; c=relaxed/simple;
	bh=ytri85sHPwOGeQxJsIFfKrf71RohPlTl84c1/mhjHm0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rIGnvB9ISpJ6+CoELGDb47MHMxWoDNNL2PhoGxss7sXVOblcKI13C5fhWa9BOrAzGprHs3euNkY5LDA2bEvYpFySkxzDzx2abgapCdw3JRfpRajutd7zT6wpyfhapvonvElvSw643e5FYdldo8VUt05Y8o+WW4epjDnVRYBYRvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RputNTE5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RputNTE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788982112; x=1820518112;
  h=date:from:to:cc:subject:message-id;
  bh=ytri85sHPwOGeQxJsIFfKrf71RohPlTl84c1/mhjHm0=;
  b=RputNTE5aJvI2+yI2wk/m9o2nVNDj8TR6/u42UMfUOY1srKNEhashpYe
   O4ljtB7PxY7hTV2WH1wIXGotbk2XZcMkXh6TRhFQUnPzsmUMAAYg0rGJk
   pA6E3AHkJdFl2Ovdf1sGKEaNpr5jAcLnotrYfv659xF3fHS+UVg0MzSXc
   jhvlhx5dGpUVfnwmhRSGJc1RPe5wSbW9sDpv6UJqJSpjWzCh+SsuWtzWi
   9AJ2hikh4DItltf1RqDxv+kJawL2nosiDwjbdpixSC2on3x/8BpLmQdep
   ntaRFeNk4YaJMme1SSQgynY09V9zlEPF+LlMQfvAGHxWIOUpk/Swn7j5q
   w==;
X-CSE-ConnectionGUID: ftvH5AXUToi1RYTHGsSwig==
X-CSE-MsgGUID: nZ+hdJtSSKiC57IM0WazfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91938232"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="91938232"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 12:28:29 -0700
X-CSE-ConnectionGUID: NNQbGSY+QAm7oU/a6vAFUg==
X-CSE-MsgGUID: FuoX9628QsiOEc+yv/AXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="273374526"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Sep 2026 12:28:28 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Ny5-000000000qq-3F0d;
	Wed, 09 Sep 2026 19:28:25 +0000
Date: Thu, 10 Sep 2026 03:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/net/mac80211.h:8285:26: error: 'SKB_EXT_WIRELESS'
 undeclared
Message-ID: <202609100349.H06ONXwq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pooventhiran-G/net-skbuff-Add-SKB-extension-support-to-wireless-drivers/20260908-223929, commit: c6dbd12c6fcd4291c87e9c11caea9b323d05b951"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pooventhiran-G/net-skbuff-Add-SKB-extension-support-to-wireless-drivers/20260908-223929
head:   682493f4354196bc329dcf05f25bbd6d7a63dea0
commit: c6dbd12c6fcd4291c87e9c11caea9b323d05b951 wifi: mac80211: Define SMD BSS Transition context for transport
date:   26 hours ago
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: openrisc-randconfig-r133-20260909 (https://download.01.org/0day-ci/archive/20260910/202609100349.H06ONXwq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100349.H06ONXwq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609100349.H06ONXwq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/wireless/tests/../../mac80211/ieee80211_i.h:32,
                    from net/wireless/tests/scan.c:15:
   include/net/mac80211.h: In function 'ieee80211_skb_ext_add_uhr':
>> include/net/mac80211.h:8285:26: error: 'SKB_EXT_WIRELESS' undeclared (first use in this function)
    8285 |         skb_ext_del(skb, SKB_EXT_WIRELESS);
         |                          ^~~~~~~~~~~~~~~~
   include/net/mac80211.h:8285:26: note: each undeclared identifier is reported only once for each function it appears in
>> include/net/mac80211.h:8287:15: error: implicit declaration of function 'skb_ext_add'; did you mean 'skb_ext_del'? [-Wimplicit-function-declaration]
    8287 |         ext = skb_ext_add(skb, SKB_EXT_WIRELESS);
         |               ^~~~~~~~~~~
         |               skb_ext_del


vim +/SKB_EXT_WIRELESS +8285 include/net/mac80211.h

c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8250  
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8251  /**
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8252   * ieee80211_skb_ext_add_uhr - attach or replace a UHR SMD context on
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8253   *	SKB_EXT_WIRELESS
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8254   * @skb: the SKB to attach the extension to
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8255   * @ctx: the SMD context; must be a kmalloc-ed buffer by the caller
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8256   *
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8257   * Allocates a &struct wireless_skb_ext_smd_ctx container, sets @ctx to it with
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8258   * @refcnt initialized to 1, and attaches it to @skb on SKB_EXT_WIRELESS.
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8259   * If SKB_EXT_WIRELESS is already active, the existing @container is released
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8260   * before the new one is attached.
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8261   *
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8262   * Ownership of @ctx transfers to @container on success - the core will
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8263   * kfree() both when the last reference is released.
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8264   * Upon error, @ctx ownership is not transferred from the caller; old @container
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8265   * may get freed.
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8266   *
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8267   * Drivers must use this helper to attach SKB_EXT_WIRELESS extension to
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8268   * properly handle clone and COW copies.
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8269   *
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8270   * Returns 0 on success; -ENOMEM on allocation failure.
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8271   */
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8272  static inline int ieee80211_skb_ext_add_uhr(struct sk_buff *skb,
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8273  					    struct ieee80211_smd_ctx *ctx)
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8274  {
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8275  	struct wireless_skb_ext_smd_ctx *container;
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8276  	struct wireless_skb_ext *ext;
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8277  
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8278  	container = kzalloc_obj(*container, GFP_ATOMIC);
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8279  	if (!container)
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8280  		return -ENOMEM;
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8281  
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8282  	refcount_set(&container->refcnt, 1);
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8283  	container->smd_ctx = ctx;
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8284  
c6dbd12c6fcd42 Pooventhiran G 2026-09-08 @8285  	skb_ext_del(skb, SKB_EXT_WIRELESS);
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8286  
c6dbd12c6fcd42 Pooventhiran G 2026-09-08 @8287  	ext = skb_ext_add(skb, SKB_EXT_WIRELESS);
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8288  	if (!ext) {
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8289  		kfree(container);
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8290  		return -ENOMEM;
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8291  	}
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8292  
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8293  	ext->uhr_smd_ctx = container;
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8294  	ext->type = WIRELESS_SKB_EXT_UHR_SMD;
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8295  
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8296  	return 0;
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8297  }
c6dbd12c6fcd42 Pooventhiran G 2026-09-08  8298  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
