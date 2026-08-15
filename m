Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9E635A925
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786786008; cv=none; b=rZflUp4lMccB7MPQued82uiAVD5nOZtKuwN1eOVavyDBRmWdNeXO2/YA4y0+3jfmn9MKyImYyO+xje646gkP4gBwGEJFwtKncFBbS4HDeoMYSJs4XQncXHoq+8LTW6a4yj8BA3G3f6COdg3XGHCgaeH5419+Jc3abg28otuba6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786786008; c=relaxed/simple;
	bh=mkrAMBhlj5YWNhYUXK2ExPBB+asDgKyKDKm1fsm1f4Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k7OwsrpjCvF+9zwDSLnm3wP5NkMhR1/l2NswflpJAdvjwO6p1k9yK/rzlfuw8Tp37KDy1fEUAsLhLjP9aFF9SqHDMaMd9Z7vwdQ7NHgsBCsqzNAYyGyOkxjkMFB8TMDAmGveHcU2NZHNMcE/fJcgPeMTS79Yo9xdHiGBOCBohWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAergdRF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAergdRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786786006; x=1818322006;
  h=date:from:to:cc:subject:message-id;
  bh=mkrAMBhlj5YWNhYUXK2ExPBB+asDgKyKDKm1fsm1f4Q=;
  b=WAergdRFA1lsjyRSWFsbxg7FFH0+DkF0R7a9vBXIX3uAsaAfHMFRNXTu
   rxU4tMfOgL1bHjNeD+1hUBxtFeDnXGU2LdxqmIRGLv66RUv9frsiDPoj7
   VLRU1L8IVaJJ5QpbCAwggJNDdEzMq8XwotZakqBuE5gi7mn31gnZ10F5T
   SUGIYab/Ke1mB4Fez4XzSo8DEzEePf2AnEfidWzsf0QSDqv8Vr3lipBng
   A+qqr776z4MK+a/RICHwDIwor6A1qik43HBW/w54Mts6jH26q7Gv47ngg
   3emCT2DTpcE5QiBV8065I7eSbCP2QH8c7p3ppK8hsO4PCE7cQw0GnnGiI
   w==;
X-CSE-ConnectionGUID: 02Ek8t0wQneXwX2Ih6oIeg==
X-CSE-MsgGUID: bTTzN1shTwOZgy17IrcNAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="86465673"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="86465673"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 02:26:45 -0700
X-CSE-ConnectionGUID: 248InrOOTjmNuhp/wTFaUw==
X-CSE-MsgGUID: 9106nJ5iRhy4O+tltS/DxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="264479071"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Aug 2026 02:26:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvAf3-00000000beI-3hIF;
	Sat, 15 Aug 2026 09:26:41 +0000
Date: Sat, 15 Aug 2026 17:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/misc/mei/hw-me.c:995:1-7: preceding lock on line 958
Message-ID: <202608151713.rh6MBeUQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Simon Richter <Simon.Richter@hogyros.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: 25f9b0d351552f63ac3f72e6c655bc8f9994f7d2 misc/mei: Allow building Intel ME interface on non-x86
date:   7 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-r053-20260812 (https://download.01.org/0day-ci/archive/20260815/202608151713.rh6MBeUQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 25f9b0d35155 ("misc/mei: Allow building Intel ME interface on non-x86")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608151713.rh6MBeUQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/misc/mei/hw-me.c:995:1-7: preceding lock on line 958
   drivers/misc/mei/hw-me.c:815:2-8: preceding lock on line 804
   drivers/misc/mei/hw-me.c:832:1-7: preceding lock on line 804

vim +995 drivers/misc/mei/hw-me.c

859ef2ffbfa785 Alexander Usyskin 2015-08-02  924  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  925  /**
859ef2ffbfa785 Alexander Usyskin 2015-08-02  926   * mei_me_d0i3_enter_sync - perform d0i3 entry procedure
859ef2ffbfa785 Alexander Usyskin 2015-08-02  927   *
859ef2ffbfa785 Alexander Usyskin 2015-08-02  928   * @dev: the device structure
859ef2ffbfa785 Alexander Usyskin 2015-08-02  929   *
859ef2ffbfa785 Alexander Usyskin 2015-08-02  930   * Return: 0 on success an error code otherwise
859ef2ffbfa785 Alexander Usyskin 2015-08-02  931   */
859ef2ffbfa785 Alexander Usyskin 2015-08-02  932  static int mei_me_d0i3_enter_sync(struct mei_device *dev)
859ef2ffbfa785 Alexander Usyskin 2015-08-02  933  {
859ef2ffbfa785 Alexander Usyskin 2015-08-02  934  	struct mei_me_hw *hw = to_me_hw(dev);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  935  	int ret;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  936  	u32 reg;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  937  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  938  	reg = mei_me_d0i3c_read(dev);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  939  	if (reg & H_D0I3C_I3) {
859ef2ffbfa785 Alexander Usyskin 2015-08-02  940  		/* we are in d0i3, nothing to do */
7704e6be4ed283 Alexander Usyskin 2025-08-26  941  		dev_dbg(&dev->dev, "d0i3 set not needed\n");
859ef2ffbfa785 Alexander Usyskin 2015-08-02  942  		ret = 0;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  943  		goto on;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  944  	}
859ef2ffbfa785 Alexander Usyskin 2015-08-02  945  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  946  	/* PGI entry procedure */
859ef2ffbfa785 Alexander Usyskin 2015-08-02  947  	dev->pg_event = MEI_PG_EVENT_WAIT;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  948  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  949  	ret = mei_hbm_pg(dev, MEI_PG_ISOLATION_ENTRY_REQ_CMD);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  950  	if (ret)
859ef2ffbfa785 Alexander Usyskin 2015-08-02  951  		/* FIXME: should we reset here? */
859ef2ffbfa785 Alexander Usyskin 2015-08-02  952  		goto out;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  953  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  954  	mutex_unlock(&dev->device_lock);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  955  	wait_event_timeout(dev->wait_pg,
95953618519632 Alexander Usyskin 2022-09-08  956  		dev->pg_event == MEI_PG_EVENT_RECEIVED,
95953618519632 Alexander Usyskin 2022-09-08  957  		dev->timeouts.pgi);
859ef2ffbfa785 Alexander Usyskin 2015-08-02 @958  	mutex_lock(&dev->device_lock);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  959  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  960  	if (dev->pg_event != MEI_PG_EVENT_RECEIVED) {
859ef2ffbfa785 Alexander Usyskin 2015-08-02  961  		ret = -ETIME;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  962  		goto out;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  963  	}
859ef2ffbfa785 Alexander Usyskin 2015-08-02  964  	/* end PGI entry procedure */
859ef2ffbfa785 Alexander Usyskin 2015-08-02  965  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  966  	dev->pg_event = MEI_PG_EVENT_INTR_WAIT;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  967  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  968  	reg = mei_me_d0i3_set(dev, true);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  969  	if (!(reg & H_D0I3C_CIP)) {
7704e6be4ed283 Alexander Usyskin 2025-08-26  970  		dev_dbg(&dev->dev, "d0i3 enter wait not needed\n");
859ef2ffbfa785 Alexander Usyskin 2015-08-02  971  		ret = 0;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  972  		goto on;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  973  	}
859ef2ffbfa785 Alexander Usyskin 2015-08-02  974  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  975  	mutex_unlock(&dev->device_lock);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  976  	wait_event_timeout(dev->wait_pg,
95953618519632 Alexander Usyskin 2022-09-08  977  		dev->pg_event == MEI_PG_EVENT_INTR_RECEIVED,
95953618519632 Alexander Usyskin 2022-09-08  978  		dev->timeouts.d0i3);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  979  	mutex_lock(&dev->device_lock);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  980  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  981  	if (dev->pg_event != MEI_PG_EVENT_INTR_RECEIVED) {
859ef2ffbfa785 Alexander Usyskin 2015-08-02  982  		reg = mei_me_d0i3c_read(dev);
859ef2ffbfa785 Alexander Usyskin 2015-08-02  983  		if (!(reg & H_D0I3C_I3)) {
859ef2ffbfa785 Alexander Usyskin 2015-08-02  984  			ret = -ETIME;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  985  			goto out;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  986  		}
859ef2ffbfa785 Alexander Usyskin 2015-08-02  987  	}
859ef2ffbfa785 Alexander Usyskin 2015-08-02  988  
859ef2ffbfa785 Alexander Usyskin 2015-08-02  989  	ret = 0;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  990  on:
859ef2ffbfa785 Alexander Usyskin 2015-08-02  991  	hw->pg_state = MEI_PG_ON;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  992  out:
859ef2ffbfa785 Alexander Usyskin 2015-08-02  993  	dev->pg_event = MEI_PG_EVENT_IDLE;
7704e6be4ed283 Alexander Usyskin 2025-08-26  994  	dev_dbg(&dev->dev, "d0i3 enter ret = %d\n", ret);
859ef2ffbfa785 Alexander Usyskin 2015-08-02 @995  	return ret;
859ef2ffbfa785 Alexander Usyskin 2015-08-02  996  }
859ef2ffbfa785 Alexander Usyskin 2015-08-02  997  

:::::: The code at line 995 was first introduced by commit
:::::: 859ef2ffbfa785d273567467088cc8743f80b5bd mei: me: d0i3: add d0i3 enter/exit state machine

:::::: TO: Alexander Usyskin <alexander.usyskin@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
