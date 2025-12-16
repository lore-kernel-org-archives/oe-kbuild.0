Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6631FDA8E
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907664; cv=none; b=T5ma8kGiI53RNW1QISP6rUre9Ici1tFAhdxfAS78JXJP/XUcNpwAp9aFwR620n/LQOnPm1W+DFBeM+L4ebCOjlIvlYiIqkMxOCma+uoOl6ATi/KxPKwC3ctC+mrM6hx0Wd84ypMHDo7asfi7t0SXSj6jpONE1MEWCFiDcOmVK7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907664; c=relaxed/simple;
	bh=I/TvcmwRHSjOFGx/wAK/FHJMg56a+z81lTqkfHgMjGo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gOjmHN0ocMLFCr2SbG9Y9N1fRRLT4/yowhDc8gCBQDbJINL7TPejWgTB65wbfzROQsMc3wDCgymdcsFUF6a4H4Sruu1wdUw9t8tXxOijaRJsyD/bUqLooc3I+yErqoZ1SjZzX41UdkVYV6pm0lNQ0gnLcFwz8mycQAW6fJdfK84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5CFfKjl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5CFfKjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765907663; x=1797443663;
  h=date:from:to:subject:message-id:mime-version;
  bh=I/TvcmwRHSjOFGx/wAK/FHJMg56a+z81lTqkfHgMjGo=;
  b=I5CFfKjlugOhZrCD83/d+/0qD99kDvPxTVh1zyg0Lg0cqKrx7p5fVk0a
   mAkiLL63D5xCd3GOD8i5FnFMGRrMteCKB4rheZO3R3rk3S5Rma7tnNHIU
   YX39rfTVYye87bZ7cee149oH44J3I6l0XT22EJy0pl5imeF8I8zl5zCAi
   GY6TOUyPpY08YrMdMvmEoGhAhwI4FYt1AIcFfT/lTVKo/nH7RUREEKJcN
   5gOCrec0pAUV/F8G7y1giInWPmqD1bG/YG3sQo2sGzelV3YE/sjw4dVRD
   hLG8ITQAl9t9nxtJwKaV3FnKJ5s/rO87fjRIFA31RTOEgj+bjEvgssf2X
   g==;
X-CSE-ConnectionGUID: CaGv1ru+Soaahj4V2DbEXw==
X-CSE-MsgGUID: 7+STA+NVSLWKlzarmxr4kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="93308153"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="93308153"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 09:54:22 -0800
X-CSE-ConnectionGUID: CJ67hEvCSVe4TA3naWFa8w==
X-CSE-MsgGUID: EICg8uWlRDGLkr3nomEkCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="221468343"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Dec 2025 09:54:21 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVZFb-000000003DS-0Mjj
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 17:54:19 +0000
Date: Tue, 16 Dec 2025 18:53:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tnguy-net-queue:40GbE 23/25] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'Bochs'
Message-ID: <202512161835.UERswO63-lkp@intel.com>
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
TO: Victor Nogueira <victor@mojatatu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git 40GbE
head:   885bebac9909994050bbbeed0829c727e42bd1b7
commit: b1e125ae425aba9b45252e933ca8df52a843ec70 [23/25] net/sched: ets: Remove drr class from the active list if it changes to strict
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512161835.UERswO63-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Bochs'
#31: 
[   59.281977][  T365] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
