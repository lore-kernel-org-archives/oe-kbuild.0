Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B627587C
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 03:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299934; cv=none; b=hu/6TlfZ9hUyMgDTUQQL34hG1Y+DOpCcmnWZxJX08zenPUPtTHxEvaMbe1avR0GPyJ3WDK4ajZqGqRtEMivAWSgl7nUteHEWi9+SaqLLbmQSCmH5AOhjSbrlOx4C+O64iFHjSOjtRXoo3UvebtQX+i6IDG889NoaWIAe9QL9Bf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299934; c=relaxed/simple;
	bh=TF6Vg1Tp2FriizHpEus7lGHjA8iVHrqqJQ6MbjNjy/U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=febJrrp5YSgFywpS9DOJAOEZU04nKuGv9+VWPEQIiUyKY3G8ypAMAW4/77LRS+Ga0W1cPaSFsxzkuKrXb/HzW2vMPQPDYJ99+PuriNsamMLcBRErMgLmA7pbS4Let0vVdnSa974UnaKBufznW3AIGEOaVUQpL+JKSmg6al3piG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQBYaLa4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQBYaLa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764299932; x=1795835932;
  h=date:from:to:subject:message-id:mime-version;
  bh=TF6Vg1Tp2FriizHpEus7lGHjA8iVHrqqJQ6MbjNjy/U=;
  b=JQBYaLa4r3Gvp4MGthbWzCZiZDJBQvOg1Ijpr1a+ty3rXxfiUYipuYD5
   9vYRtETwJg1NMq65QL+y8FwcmCO6ghNKVjdymhH2M99dr5gz9reRRaICE
   QbTZE9Dt9SQMQ7GILP4jzgYsNn9mZm8liFSBaTE7e7NJa8ektu1psHhvN
   o36gacsxXTcWuaITmZzF64uM5qbnxiqRf4KNm4Db7IgI03cSLU9RrkONu
   TzC+iYFCp5M7JPYGpYiJ7bW73ysLrh04NDJUC1NUHN4kNaEfKIWm6l+kQ
   BIBUs9/atXfr8Jnsm2S38H8uep4h8ACjOiupMguBhKn8IenBP3Tnq3GJQ
   g==;
X-CSE-ConnectionGUID: Hgnp5m+7QbqobRT3EV/JDg==
X-CSE-MsgGUID: r1txa5yRTTaRVvCU9v/UPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="76967037"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="76967037"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 19:18:50 -0800
X-CSE-ConnectionGUID: ndQYlIrPQK+JnZlKieU7yg==
X-CSE-MsgGUID: QZa/lsbFRk+dn78RCGjyPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="216712100"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 27 Nov 2025 19:18:49 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOp0R-000000001v7-0qit
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 03:18:47 +0000
Date: Fri, 28 Nov 2025 04:17:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Antony-Antony/xfrm-set-ipv4-no_pmtu_disc-flag-only-on-output-sa-when-direction-is-set/20251127-220911
 1/1] checkpatch: ERROR:BAD_SIGN_OFF: Unrecognized email address:
 'https://github.com/roth-m'
Message-ID: <202511280424.sw2Gx9Ct-lkp@intel.com>
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
TO: Antony Antony <antony.antony@secunet.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Antony-Antony/xfrm-set-ipv4-no_pmtu_disc-flag-only-on-output-sa-when-direction-is-set/20251127-220911
head:   987b885dad661975ac4b451eb0d71e3e1f08370a
commit: 987b885dad661975ac4b451eb0d71e3e1f08370a [1/1] xfrm: set ipv4 no_pmtu_disc flag only on output sa when direction is set
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511280424.sw2Gx9Ct-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'https://github.com/roth-m'
#14: 
Reported-by: https://github.com/roth-m

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
