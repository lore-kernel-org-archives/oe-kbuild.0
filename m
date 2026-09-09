Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A65C39A803
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 19:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982111; cv=none; b=tARjjbF6qFqAv1grZeK5aJQ+rKFvaUmKIZlXCNtGYwPtgE545ZI4520+t5m2+xdRKXMoaeu39MAaLvJFLYjeq2G5BWylScE8ZEA58nMKishZkiGofez1Q40fmfFge1gYn6SX0zrYvjDl20XqhhVZAFvvQoUKKEMksSpeH0oDtx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982111; c=relaxed/simple;
	bh=rKlqmttymdTEqKF+eyCqoiThKxZPvA32G7XPv0zE+r4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ch/iCS0zwPkBr8pOr+ryc3SQj+Y+glr1dMbuijojK6/ZyfM6lUPpWI7pioUxUubE3idisAeWK8tb9kKQBMrQDjMTjFhlBW9KNnGgxI7b2vZYUfkQ5MZV/fFBxS68phdZQq4ZFWHhkmistis4LgzoPuuzHRBqyEXbM3bYPScxn0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTul+D7F; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTul+D7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788982109; x=1820518109;
  h=date:from:to:cc:subject:message-id;
  bh=rKlqmttymdTEqKF+eyCqoiThKxZPvA32G7XPv0zE+r4=;
  b=KTul+D7FnXHOR+ceUEesZdd2ujGX26cztGGDuhiem0iWwzQxoKoKICcn
   i1fVl5cvd9jkw1xGrE2QgfZFqr+hcUSB9Id+kMpYkR8kOQdslXxgiI7fJ
   gtfZpDwlKoUlkxdsaWrwHwHqNlYymAeY9xYzx55/e+QFI39SH2UnleC7A
   ldjXqepcP7CWiICkT8U6+sJ6sUEZ3O4xY7EwP/C6Pz8rM0cnD57I3NRFS
   SmSnruohQ8Ycl9X4sbvgddPtkJG/Bo9h6JV1VUPGzr9F2HeyT7Q+SvKh8
   R1QOPC4FfqdKYVrNEvSaADkfk5i1NnOr/BRLynE7PMnIJMkh+EjE0jBCV
   g==;
X-CSE-ConnectionGUID: vMfJ1J8LTyOVDCsy9BEZpQ==
X-CSE-MsgGUID: UmOQaJdkRBC1lgtxTgKstw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91938231"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="91938231"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 12:28:28 -0700
X-CSE-ConnectionGUID: KnzaXIp5TcWCNwGAR82daA==
X-CSE-MsgGUID: 6hBypGiBTvuP5aVdYqS2qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="273374524"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Sep 2026 12:28:28 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Ny5-000000000qs-3JRe;
	Wed, 09 Sep 2026 19:28:25 +0000
Date: Thu, 10 Sep 2026 03:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/wireless/nl80211.c:19576:14: error: 'n_dl_tids'
 undeclared
Message-ID: <202609100357.Y0annlK7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pooventhiran-G/net-skbuff-Add-SKB-extension-support-to-wireless-drivers/20260908-223929, commit: 5759d7244ab491b9e71de0281e62985f9db9ea7a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: Aditya Sathish <asathish@qti.qualcomm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pooventhiran-G/net-skbuff-Add-SKB-extension-support-to-wireless-drivers/20260908-223929
head:   682493f4354196bc329dcf05f25bbd6d7a63dea0
commit: 5759d7244ab491b9e71de0281e62985f9db9ea7a wifi: nl80211: Pack SMD dynamic context along with frame
date:   26 hours ago
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609100357.Y0annlK7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100357.Y0annlK7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609100357.Y0annlK7-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/wireless/nl80211.c: In function '_nl80211_smd_ctx_nl_ba_param_size':
>> net/wireless/nl80211.c:19576:14: error: 'n_dl_tids' undeclared (first use in this function)
   19576 |         n += n_dl_tids * (nla_total_size(0) + /* tid nest header */
         |              ^~~~~~~~~
   net/wireless/nl80211.c:19576:14: note: each undeclared identifier is reported only once for each function it appears in


vim +/n_dl_tids +19576 net/wireless/nl80211.c

904c277342936b Ilan Peer      2025-01-02  19570  
5759d7244ab491 Pooventhiran G 2026-09-08  19571  static size_t _nl80211_smd_ctx_nl_ba_param_size(void)
5759d7244ab491 Pooventhiran G 2026-09-08  19572  {
5759d7244ab491 Pooventhiran G 2026-09-08  19573  	size_t n = 0;
5759d7244ab491 Pooventhiran G 2026-09-08  19574  
5759d7244ab491 Pooventhiran G 2026-09-08  19575  	n += nla_total_size(0); /* ba_params nest header */
5759d7244ab491 Pooventhiran G 2026-09-08 @19576  	n += n_dl_tids * (nla_total_size(0) + /* tid nest header */
5759d7244ab491 Pooventhiran G 2026-09-08  19577  			nla_total_size(sizeof(u16)) + /* buff_size */
5759d7244ab491 Pooventhiran G 2026-09-08  19578  			nla_total_size(sizeof(u8)) + /* policy */
5759d7244ab491 Pooventhiran G 2026-09-08  19579  			nla_total_size(0) + /* amsdu_support */
5759d7244ab491 Pooventhiran G 2026-09-08  19580  			nla_total_size(sizeof(u16)) + /* timeout */
5759d7244ab491 Pooventhiran G 2026-09-08  19581  			nla_total_size(0) + /* ext_no_frag */
5759d7244ab491 Pooventhiran G 2026-09-08  19582  			nla_total_size(sizeof(u8)) + /* ext_frag_lvl */
5759d7244ab491 Pooventhiran G 2026-09-08  19583  			nla_total_size(sizeof(u16))); /* ext_buff_size */
5759d7244ab491 Pooventhiran G 2026-09-08  19584  
5759d7244ab491 Pooventhiran G 2026-09-08  19585  	return n;
5759d7244ab491 Pooventhiran G 2026-09-08  19586  }
5759d7244ab491 Pooventhiran G 2026-09-08  19587  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
