Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2CC2AEE1
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 04:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766289717; cv=none; b=Vy2/fD6D8NIKNVmB99yxnrKBRYdn/89PePKLC93imYv6sSdVzcc7/TPADNjHKVLQyL1sEqgJ+VIyFXbSccfEjoqDTMx/F30G4EomQizeLIasW9wYj4VKawU/oUyhvLgrbvdOX9prytOof2FrVV0BKb2CNCGPE3N2RIoG/B3+NSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766289717; c=relaxed/simple;
	bh=b1xmr5J1xQysFt6Byx+l8Zlo7h7EfNoo7eYapY8HkWM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMDwwPccWW7OqiUPtrzHGOwahCn6MMEOn0gzQD3d92tuApjipcLbXZ3uetaderieIka/Ay4hd6i1HlPsO8yYw71WzgYxeFZbIAN2olbhe9eHoGHup5eJPvsCQgeC//+UCkcyVkE3tj83Z+P7RpjCpR+g0U3i7hUNaUSonoF3ksk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/M1skbS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/M1skbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766289716; x=1797825716;
  h=date:from:to:subject:message-id:mime-version;
  bh=b1xmr5J1xQysFt6Byx+l8Zlo7h7EfNoo7eYapY8HkWM=;
  b=L/M1skbSeYgSn5Z37rV+/8+j52czi3P+wGcA4asdJ/ODyUqm6/V7IvG0
   1MV1CUq2DCMvqo32rQjuskMvomWUHdY1eUMU2b4LlulNYy2GxrjNf46Fv
   9zqviQuz2kon49eczRkvnosfM6CKE10JS0PeuM9vgTlPqGZ3fMeA2N6Xl
   hiSCbKE+xmkQKc+VJqyqTLA/hXB0VymvRpEgfWRPbl4pmxx5oB/HXxwWT
   pLW7uJqOTp4EL09cU9a7mpSYeA6d8t8bqcd88Gsu1sOYJ0BbkQRaZr9C/
   oH4NAgyY79goUVz35V0XU25LiChIpBmqiynY5MQFCJNXFeIx59bld9CjK
   g==;
X-CSE-ConnectionGUID: DV55DsipSFOy7iZH1jQeYg==
X-CSE-MsgGUID: z7ZUuPqwSM6evVdjAEv2jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67945452"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67945452"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 20:01:55 -0800
X-CSE-ConnectionGUID: eTaAGr/pQmyoNBFJx5fsvQ==
X-CSE-MsgGUID: 7EhKnUsCT82YB+KIQZDGUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="229879920"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2025 20:01:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXAdk-000000004va-0Id4
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 04:01:52 +0000
Date: Sun, 21 Dec 2025 05:01:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gfs2:bio-cleanups 9/17] checkpatch: ERROR:SPACING: space required
 before the open parenthesis '('
Message-ID: <202512210555.WAIAQ35S-lkp@intel.com>
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
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git bio-cleanups
head:   e78dbad88b9429cb8fc8317ab11ed977eebaccd7
commit: 13565283e99d40cf145e49e9d2adc7bd99305238 [9/17] block: turn blk_errors array into a macro
:::::: branch date: 82 minutes ago
:::::: commit date: 89 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210555.WAIAQ35S-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#87: FILE: block/blk-core.c:164:
+	switch(errno) {

ERROR:SPACING: space required before the open parenthesis '('
#106: FILE: block/blk-core.c:178:
+	switch(status) {

ERROR:SPACING: space required before the open parenthesis '('
#124: FILE: block/blk-core.c:192:
+	switch(status) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
