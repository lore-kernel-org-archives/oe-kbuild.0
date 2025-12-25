Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3842223708
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766663233; cv=none; b=FigkROr3WYUs/VAQZNKV+yatHYIjoUT7UAAh56wwWyRv+trSv0fXu6AYioXLaMR+Vu+sCglyBt1Iv5CEey/nYNbSBgkHKysTJyhllj0bOTkdOnQnKYoaLPc0eHghs0+Z2B9jZGkuOmQJi3NSFtx+9fy5v1/xFIbra0A0VkuE5dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766663233; c=relaxed/simple;
	bh=j/GCxwy84o6I6EqsCErW7rpXvPgRfEFrsVZybcMDeZk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q738VoJ2rNqTkA04vhNjEQU/Dnwp3tE4/aYxPdVeQtoRHmFoWfC+yH2slNea6hkDbvY3gc+z2NfHdyO+w1Soy50yWowf3KnTTNR+RWJdfFpLbMg6KC98BG8uDgEH+brUvtWq0MfIbBbAU8rbamsyZqISQtiJokm8mVpjtwKuB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL2MWVZc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL2MWVZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766663232; x=1798199232;
  h=date:from:to:subject:message-id:mime-version;
  bh=j/GCxwy84o6I6EqsCErW7rpXvPgRfEFrsVZybcMDeZk=;
  b=eL2MWVZcoNSFhmnKW47SpueULee/t9WeQ4AN68oxEqFMP60Rd6RjRpWt
   k/23CIkmduLcRj2oW4wkOTTQ4At9hLH6r4RTVeG7HiqfMwcvc4+zWb63d
   5gi3KYQcEDoTtaixUZJW20ujt4Ti1Jbv3cfVGfVHh8HRvY9SBoPyg9sS/
   GTDoctfaB5S2k41vr/AXSNRb7nCdkVzg/OyRW1xO3UD/2I2T44BfcRVOS
   MYUJL+rzQ1jgK04yEsAW1YkggVcsSZRW3BEF4XcBb15ByixvEgQwYTGVG
   ptZaaLTye8lbWaPZrjflCZrtmNh4GP4yV5OgLKxjjQnRfHi96gz41rg9q
   w==;
X-CSE-ConnectionGUID: 9SKFySxORRi9jr+oF4hBdA==
X-CSE-MsgGUID: QGM7Jg/oSO6iOfv1xbVczA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68402284"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68402284"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 03:47:10 -0800
X-CSE-ConnectionGUID: Jo315zuPT8CtT2Zkvh5KzA==
X-CSE-MsgGUID: PSTVXF8hQtGJHyBKfw1+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="199851606"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Dec 2025 03:47:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYjoB-000000006Yy-1vWW
	for oe-kbuild@lists.linux.dev;
	Thu, 25 Dec 2025 11:47:07 +0000
Date: Thu, 25 Dec 2025 12:47:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:WanLi-Niu/bpftool-add-missing-sign-option-to-help-output/20251225-172557
 1/1] checkpatch: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'hlleng
 <a909204013@gmail.com'
Message-ID: <202512251239.U61OV5ju-lkp@intel.com>
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
TO: WanLi Niu <niuwl1@chinatelecom.cn>

tree:   https://github.com/intel-lab-lkp/linux/commits/WanLi-Niu/bpftool-add-missing-sign-option-to-help-output/20251225-172557
head:   c7599723a8e912df489f0c216bde211b79a78f7c
commit: c7599723a8e912df489f0c216bde211b79a78f7c [1/1] bpftool: add missing --sign option to help output
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251225/202512251239.U61OV5ju-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'hlleng <a909204013@gmail.com'
#8: 
Signed-off-by: hlleng <a909204013@gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
