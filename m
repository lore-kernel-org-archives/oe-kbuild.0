Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB36322A13
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069122; cv=none; b=WvEz+/kn5celXDaUEPwZaSbK/nDOzkP1BwGaK8hLOk09zBjk9f6OGr/iG9z2QvlBzv+0gStbKlv2pOfDlu7JPUfnGo2qh3Oux05OZztZ74xIEOn7GXduYmyDfpeiPFHnM+8HfPF2yNqbu+JNy9yxwnLpMVbCvGV1TOvxNmFAzhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069122; c=relaxed/simple;
	bh=cW87NijVNVBIgkAwLIXtQH4eaAkbDfpYKuTTgD/DCGw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gctvw/F85HbzaxaSmrviwn9Qt4ZOForw6o36RcMjPfsvNzMu5QHuRsccvFiofineFhW1ioQKtCbJzGSsoKJ36oQDRkuDzIMn02GMwDO99d2T1jvHoD6dotfVjpDYwitk7DblEz6+JpDupCb1WatGCk03PB/qe/AV96vv6WWqA7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7lHq74y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7lHq74y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069121; x=1794605121;
  h=date:from:to:subject:message-id:mime-version;
  bh=cW87NijVNVBIgkAwLIXtQH4eaAkbDfpYKuTTgD/DCGw=;
  b=n7lHq74yBaLHtkjuc9T1BdkjxP6CmJfZfQ7cIr5iSRiaAtC48/Awnp4p
   gD4Bi+PfHAsEivVArWNzwikoIiZrogtz1XPGtb0C0Du0uCHS+JlRNPXiE
   ZKeUJR+l4xdT4Q4uuW+luWvshqmAtwctDdS/uvsGzKNGiZRIDLBL0lc/g
   sX/uVfHbVvTKXno050eaWDN1MFb0zUfVUbO/g+SmkhagUYNND8xPqGI4N
   FhxdX5fKZeN3rVePDzReVUWyvoTa2ITtKZy27RQTaWAA5YrdGMU1mfmHK
   rjaX4wduqt81u83JTJNHgMvLFQS5QJsf7Tk6Ki9bSLtL3NiSku3H3BOV4
   w==;
X-CSE-ConnectionGUID: sOIiFRQYRNeKc5SZGh+8aQ==
X-CSE-MsgGUID: tzsswaFPTeyk0d+cgyx/dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75842408"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="75842408"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:25:17 -0800
X-CSE-ConnectionGUID: MHAj6gFHSbetYbvlv/UcnQ==
X-CSE-MsgGUID: sGyEX7l8TiGxl27Cc5RbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="213008643"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 13:25:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeob-0000000018m-3UXr
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:25:13 +0000
Date: Thu, 13 Nov 2025 22:25:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rcu:rcu/srcu 13/18] checkpatch: WARNING:EMBEDDED_FUNCTION_NAME:
 Prefer using '"%s...", __func__' to using 'srcu_read_unlock_fast_updown',
 this function's name, in a string
Message-ID: <202511131742.czRyhiBS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/srcu
head:   35587dbc58dd3e610f9d5f58323c845f0b9b7be9
commit: c1d2435f1aa94b690da9b45737e55ae73d51ea11 [13/18] srcu: Create an SRCU-fast-updown API
:::::: branch date: 3 hours ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131742.czRyhiBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131742.czRyhiBS-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'srcu_read_unlock_fast_updown', this function's name, in a string
#152: FILE: include/linux/srcu.h:499:
+			 "RCU must be watching srcu_read_unlock_fast_updown().");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
