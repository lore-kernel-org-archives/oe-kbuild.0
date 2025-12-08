Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8654086331
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765204849; cv=none; b=DGxM+1ptenI0kaiZ7Hc3B2+3xiMMWeFfE8cwkOaBisW2fUwqhFc0NvV3V00uG1e0QnXg7WyfJgx7d63ffJbYzr9KG/VdP+A5hncLWi9R2p/rDYy7hBxJyylmpO2kPktnQyPwinAigIUSZls1YYN97Uf9KRH3g+jpbYKJxypJpZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765204849; c=relaxed/simple;
	bh=kyEyBAt7c1oV05FyF/QVRR5r5NzivMtJ01T8OViRRUQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CfFT4IuhFKs4cYcw7bSrh8BwhAoadHTwxRImSVBmI+RMWQY0hDzk9/6Aizz0QuVCu4N1S2OwXI/8T40IGlciNY25UmEN7BbEcpLAMI3P61Nm0ZLwawaRcQICuyj3lwDyLJp/x9ImM0q2Jy89VJ0SWMcJZ2hUcXtsyRcEOQy2p64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpiqcQwd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpiqcQwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765204847; x=1796740847;
  h=date:from:to:subject:message-id:mime-version;
  bh=kyEyBAt7c1oV05FyF/QVRR5r5NzivMtJ01T8OViRRUQ=;
  b=FpiqcQwdIMt8TAfg9X4hN0dNkTfI/1KdftbfSJZGN7myc+wvWyYj+f69
   Juk0dv3XI5OvqojjKs7hIrlfxAycPooLVqQalFaXNb6kTufB9VjrKAOrW
   R5U40a80rFcboOkm0jv8HVMachQ0SISi1U5W9fqX1mjq5fNUvPeMA1Inx
   DuRGPQBW44so4MyLfXDQ1OuDvx9+rRp1yB2ZvNdSB4KFoK0Ze/sTmTBc/
   WUaZJ1JChVW3EeJVCsb28kR5pMQcMvdwD6IC3iEqz23z5Xg90yZsKtmGm
   nOhFExwecIEPTrHCBE24peyi5d2VYIl7MCka/vqYvnWf7aajz8C1A3wSV
   w==;
X-CSE-ConnectionGUID: uBFcpd3PRau+fECkIGdCRw==
X-CSE-MsgGUID: xo9ZZ6v+QGWKcIeDRZBS8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="70998577"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="70998577"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 06:40:47 -0800
X-CSE-ConnectionGUID: Ht5MobYyTcKAjYehtvu0tw==
X-CSE-MsgGUID: zuIs4kP4S1uhbOn3oC5psw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195223943"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2025 06:40:47 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vScPs-0000000007X-0Sv6
	for oe-kbuild@lists.linux.dev;
	Mon, 08 Dec 2025 14:40:44 +0000
Date: Mon, 8 Dec 2025 15:40:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Cen-Zhang/Bluetooth-sco-Serialize-state-check-in-sco_sock_connect-to-fix-UAF/20251208-180247
 1/1] checkpatch: ERROR:SPACING: space required before the open brace '{'
Message-ID: <202512081536.78TWIpoU-lkp@intel.com>
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
TO: Cen Zhang <zzzccc427@gmail.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Cen-Zhang/Bluetooth-sco-Serialize-state-check-in-sco_sock_connect-to-fix-UAF/20251208-180247
head:   db3cb578abc8b13cd2d06a33f291b1dbe981d3f3
commit: db3cb578abc8b13cd2d06a33f291b1dbe981d3f3 [1/1] Bluetooth: sco: Serialize state check in sco_sock_connect to fix UAF
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251208/202512081536.78TWIpoU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#95: FILE: net/bluetooth/sco.c:657:
+	if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND){

ERROR:SPACING: space required before the open brace '{'
#99: FILE: net/bluetooth/sco.c:661:
+	if (sk->sk_type != SOCK_SEQPACKET){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
