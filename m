Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795830973;
	b=L6KoeHmWj7hgqycJwQ9aObE1GLHVvudnoV1tEsA07cRKx00F3gimy7ar8uoRb8z+IzjL
	 mCYgluD1Ty5jBhCxiVD54LPEjUCLBndAtMm4tnOSC/YPmqY8zLSerKFHCmmKZiPuwZKed
	 yhFWiliElADoXnjtVfJ3vODtoDC89vM8hME1j05xvphScUh92YjDS2o+tlcDEYVhE0HBM
	 oElvvb9QmNBAH9fdwNQAS0WdazFU9mvJNufF+zG1G+uyRfE74CNd2HoPQVyz9/qC2kmFG
	 f6F2Y7HicZ51tR041nIK89XmawFe1L2qLCrlUyBJB6XlGCYTIhtF6FzyH7JFHuQgtxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830973;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=329Tg3c/Q6Rw4Juq8XNOvs/DyBsaHR+MvwO91rUOh8E=;
	b=psuN5Ti5evyvk3n/33U4OSZIMQmxzLerz1xXQYAQbMy6uqrKfRubSk4hv7kwjS0Rvqyk
	 vM4wTS8n2zJJCHsU866S9UNID+kYtg0kWafsTaeIuNT0a112Z5/xHOAQ+07dzDF3fMDRx
	 3lTrof+GjyF4lUNnwkG+FdVU+a0OmJepxSGkIjJmfrU1whPFxIoNMz8Sd6Jwb2CFfKu7I
	 tBdTw0kpmM4rdQ7sVyFG8L5336ci+5/LnZdj0ZDIFpigSo97xwUF61RJ3IGnqAMXwKe0e
	 pTIiy7ptJGEdIgj7B7L1Ow6K+C5la/fH4x2pCEBuYEqAP6khNj96t1MIbse4GpMXnyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mzr3EqpL;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F9F606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Nov 2026 01:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F9F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mzr3EqpL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795830973; x=1827366973;
  h=date:from:to:cc:subject:message-id;
  bh=+phlxKpAxyPq47+Qm5Hbosx2JCC51Ud/jsAnYNoxG5E=;
  b=mzr3EqpL7JrAo9kU2HuTxNM+OXj7qSww7MlMt+46PbxoCBjInkboyRSq
   gI7NwI98Y7WOrKHiYm10+vBA0f+fHbv/h1SM5yXl4ZatVYn/nOEMhDIS4
   NQc1CC4udIyIKZCpg61eLJTkVroLF+eufTweccPGJPG+5r+CCVvt31a60
   wrUSrHDhDHoyyswRY67xh9aAL4ISmQFRroZ3mjswwbZc27LViWpJrbDEZ
   QrguII0msOlcy24UMwuneEyT5UECJDWjzTCGgD/cmUzstSAI5V/u+kSfw
   FOX0yvjMYeYKIddfhsqv4bGtbk3g8oLvumWENi5NtxBnGOj+taM9FiKR1
   g==;
X-CSE-ConnectionGUID: QVh/gXYOQniWPSh/nC99xQ==
X-CSE-MsgGUID: kXKupQ0KSHqV4g1rnIjm4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4701615"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4701615"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 17:56:12 -0800
X-CSE-ConnectionGUID: G571iug7RjGKbL7L4Txr4w==
X-CSE-MsgGUID: v1lKvS6TS2WlBPhPLOHJdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12626115"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2026 17:56:11 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX7fc-000000000Ta-1T0j;
	Sat, 28 Nov 2026 01:56:08 +0000
Date: Sat, 28 Nov 2026 02:55:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/misc/mei/hw-me.c:995:1-7: preceding lock on line 958
Message-ID: <20261128024613.fBTx50a7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Simon Richter <Simon.Richter@hogyros.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f4585067150b85e33f60876149a6e742928da75e
commit: 25f9b0d351552f63ac3f72e6c655bc8f9994f7d2 misc/mei: Allow building Intel ME interface on non-x86
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-r2104-20261126 (https://download.01.org/0day-ci/archive/20261128/20261128024613.fBTx50a7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 25f9b0d35155 ("misc/mei: Allow building Intel ME interface on non-x86")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261128024613.fBTx50a7-lkp@intel.com/

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
