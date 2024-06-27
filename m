Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7E2139CE
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jun 2024 03:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719459981; cv=none; b=G/gc9/yEhqglKnudB7O8JYXM80lcXRqGj8YDmGMSjOl8xKRk+Uu4QWRj8WZz0Pl+hFwJZkGgWqgp29D55Rh22s/1Pu847X9Am5JeWShpbBlHzavOyPDSaj57VnS698iVxpzm0BYkGO6xttsx0ZHtT9BCh05KBW0KJsne5E94lFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719459981; c=relaxed/simple;
	bh=zrByUsQ/51htRxMitDvo+Mf0Dda+uRJogc+iS90R4uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mbK3TKPRmSBrlfhOKcBg6P0E8W7cZ0lvkKdb/vERxwJqq+C+hzRO/ecK2a3RbKto/J2ZTfRVpx4vzYg2N21OYmqdHFuXH3fCHdPnbGN4Xa7WqqYcOqO2KeFfrbeORBruWaUi7pHQzPHLQdfaWW6jNaHnqTIS+c1wb8Dtceyu/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2biJxEl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2biJxEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719459980; x=1750995980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zrByUsQ/51htRxMitDvo+Mf0Dda+uRJogc+iS90R4uw=;
  b=l2biJxElaiUEzUhT5TfQpYh5zf+d18y4xircURvzZbS+90WFMEGpESWp
   iZUr5FKBwghDYr8+ix2QnUS1may1aWUvM3a6/XF8QEB59t71+Cf/VvUHL
   zkUc54VmVbdXHC1OzaPFopgtApC+eQEYuSBijYkoVP9ar1QqNxfe7M688
   fu7MOWFrYSXXQ2zhcdRKrdVBOr9RQj4jsNHk7vEsDIUu2IqOsPYaPjt2y
   lJ8MlCC9hs0c6plQsry7VOqgXBHbMHmllTXoqfiqbnvSkdUSO5+sDR51S
   4jRvW3myyKWc509UQyD9cq7iuMNsWfSvuNW0JiV8X4T5sJxwM/UdePVoa
   Q==;
X-CSE-ConnectionGUID: 8mTnkOdPRgyFvqlWKGhZBw==
X-CSE-MsgGUID: SUbAmG9iST2++XIIHaOMGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19454507"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19454507"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 20:46:19 -0700
X-CSE-ConnectionGUID: 90Br7HViR5SzRf14pmXXhg==
X-CSE-MsgGUID: Eqgh77X2RiCm3zD9jAEadw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="48699892"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 20:46:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMg5P-000Fqw-2O;
	Thu, 27 Jun 2024 03:46:15 +0000
Date: Thu, 27 Jun 2024 11:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5978/8719] drivers/gpu/drm/xe/xe_perf.c:40
 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression :
 perf_ctl_table[1]->procname
Message-ID: <202406271102.PGADVcMb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: fe8929bdf83512ed7e413a28e543c725bf536354 [5978/8719] drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
:::::: branch date: 8 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20240626 (https://download.01.org/0day-ci/archive/20240627/202406271102.PGADVcMb-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406271102.PGADVcMb-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_perf.c:40 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : perf_ctl_table[1]->procname
drivers/gpu/drm/xe/xe_perf.c:40 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : perf_ctl_table[1]->proc_handler

vim +40 drivers/gpu/drm/xe/xe_perf.c

fe8929bdf83512 Ashutosh Dixit 2024-06-17  39  
fe8929bdf83512 Ashutosh Dixit 2024-06-17 @40  static struct ctl_table perf_ctl_table[] = {
fe8929bdf83512 Ashutosh Dixit 2024-06-17  41  	{
fe8929bdf83512 Ashutosh Dixit 2024-06-17  42  	 .procname = "perf_stream_paranoid",
fe8929bdf83512 Ashutosh Dixit 2024-06-17  43  	 .data = &xe_perf_stream_paranoid,
fe8929bdf83512 Ashutosh Dixit 2024-06-17  44  	 .maxlen = sizeof(xe_perf_stream_paranoid),
fe8929bdf83512 Ashutosh Dixit 2024-06-17  45  	 .mode = 0644,
fe8929bdf83512 Ashutosh Dixit 2024-06-17  46  	 .proc_handler = proc_dointvec_minmax,
fe8929bdf83512 Ashutosh Dixit 2024-06-17  47  	 .extra1 = SYSCTL_ZERO,
fe8929bdf83512 Ashutosh Dixit 2024-06-17  48  	 .extra2 = SYSCTL_ONE,
fe8929bdf83512 Ashutosh Dixit 2024-06-17  49  	 },
fe8929bdf83512 Ashutosh Dixit 2024-06-17  50  	{}
fe8929bdf83512 Ashutosh Dixit 2024-06-17  51  };
fe8929bdf83512 Ashutosh Dixit 2024-06-17  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
