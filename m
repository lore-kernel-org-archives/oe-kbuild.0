Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338D83B8D79
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 01:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764985444; cv=none; b=Y0nWbVglZe2c+fnRjni0/wLK7D4FhR+ilAOGpyA9tH9X9Gul8PuhAwVlT6K07tDOS2UutjyNWIuO5qy9+5pK0eecGrFww9UpdLOHwYk0rbUMWGagfyQ4jLSw1PoveNQw1/12cVWAFppUOZK2S6f/FOc9k8vBk4lDzywFHmYuBf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764985444; c=relaxed/simple;
	bh=X1q/DhvIT6V+1q2rIZHqYTkP9mwfvuMEMF7Q5Grrrmg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aetygzRnyZ/VREfznCckXrnyLyQLO/owpErjghR8qvoLGVt8GZ8tCHTk8Z/AKY26O6I23m/a+fgmYZsoayN1khE68KWxHFC8adopmIDzA7chFWjprBaWbXs0SyCFf08irGeGV9yDP9dVFnQJQtjqsz4TXnQ0LKkWEkkI/f0bgoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiYv9ZSn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiYv9ZSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764985443; x=1796521443;
  h=date:from:to:subject:message-id:mime-version;
  bh=X1q/DhvIT6V+1q2rIZHqYTkP9mwfvuMEMF7Q5Grrrmg=;
  b=jiYv9ZSnWKJH6E3y4cyYOkkuDsXORGDO/txxNGOraMuf5g9YDO4/N9xj
   xTRJNQkY0JvNq066y+PQ1Tze6HvlloqaOwFFVh/UAjk2mhPQLxnBjaIp3
   azkksYegrAwtz9AWGckaeKU2H0L4q+VgrqlBMeu8Z72janPJF5UAbdsL+
   KIAsQaHVN8DgR7TmLzED+8ttxd+Qd39JNUtXq3W8YVq0VM2fszD3tFQan
   Kpr+CUHfMfzotghYaVv98ipfx6gJt3ugD1n1e8EDGlYETK+dLR79tsGVw
   jW7TWtSxaL9e0lqjlnhG0Hubho/PoPUWG5I/NW0vpvOH2yRSlHRMTb/0i
   w==;
X-CSE-ConnectionGUID: f/IO8Wo+SZujwewiuRDjIA==
X-CSE-MsgGUID: Y9RKdSp5QAqWqUHtB7ceTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77644854"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="77644854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 17:44:02 -0800
X-CSE-ConnectionGUID: ikaZiEfPSayh69iKLv6Wlg==
X-CSE-MsgGUID: jLrsXydpQnqIGXTr/ryj7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="195877305"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 17:43:59 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRhL0-0000000012f-3YwB
	for oe-kbuild@lists.linux.dev;
	Sat, 06 Dec 2025 01:43:54 +0000
Date: Sat, 6 Dec 2025 02:43:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-perf:kvm/protected-memory 5/17] checkpatch: ERROR:SPACING:
 space required before the open parenthesis '('
Message-ID: <202512060254.vuNtXX8z-lkp@intel.com>
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
TO: Quentin Perret <qperret@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/protected-memory
head:   844a375408e66647ee7b0c1ee710b6e5a60b59db
commit: 7cfbdc794df18c56d2ac075d4cf12fa7f3da30dd [5/17] KVM: arm64: Introduce hypercalls to reclaim guest memory
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251206/202512060254.vuNtXX8z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#231: FILE: arch/arm64/kvm/hyp/nvhe/mem_protect.c:1017:
+	switch(guest_get_page_state(pte, ipa)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
