Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C5E2CA8
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jan 2025 00:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737680297; cv=none; b=TDJBrHfy+xpdyUEKe6xp7t1+avg/AR4Q/K47oRHFuKRNjlD/COSh+Zaa1pBxykaIybcl0C0Oj9TSFF0OtVsgq3N9c4GVOP+9NnKYnMF650FIX8NCtVyI+NSEIZ6G68XDr3Kuc4nEtn0cI1Y7qcNwKznfGYHtd39oXjyWYI57mmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737680297; c=relaxed/simple;
	bh=kpWAcQiCxVZuDdMMu5USBPyJov+yKZgMSWqd5OULIQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huWs0TigzamK0R+awFqXdJ/qkftYYmImUOKtNMIB26viCKIPrZHHQQd9zPBRtuHA9qhhfZKvKSX6rFunjUDwT1YOBuyMuwH3XJGD4fIc6dwHIuKCAe98NtA94P8BlJmOYDDLI4cnr0Kj9EkNi3MPW7J71sfdzBq/onj4L5po8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkQ398yT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkQ398yT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737680295; x=1769216295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpWAcQiCxVZuDdMMu5USBPyJov+yKZgMSWqd5OULIQc=;
  b=bkQ398yTU3TQImmc0vRhMQolbmIBvtbXhMceAMpBAfb+nSDOPX/igYdc
   6bfernFCWsJchYaXSEP7H/LNHcPd1oHETa9Js8obxq5H9+WzblfmoaNX8
   IIDFsB3U+dR7SKhbyjapIYwH8lS569GNkmweV+cZnuJpEikiie6cuuQc2
   8PIEJruu9R87PWzi5Q4zqDTItrtu59rC+1iW9Lp3Y9XV24Q/LYUqok3NC
   oIc94SuEOgkTwRxy6RnNuUWEsQSefz844Rw74iV3az1+4D0NltXVGsHMg
   f1noWuzLjL1av0eP/TnduW4OugB86m6fD1Sop/njwmIzJfQle8/zYyzb5
   A==;
X-CSE-ConnectionGUID: 0L/+po6+Q3SIXEnTX45Fcg==
X-CSE-MsgGUID: I7mHlEbgSdq6OY8nl78TNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38091251"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="38091251"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 16:58:15 -0800
X-CSE-ConnectionGUID: GR5eZ0D2QRu42/L5qECyjw==
X-CSE-MsgGUID: 90dyZIK+QxC3N/GyWJjB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130920066"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2025 16:58:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb81S-000bvp-34;
	Fri, 24 Jan 2025 00:58:10 +0000
Date: Fri, 24 Jan 2025 08:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/soundwire/debugfs.c:159:39-44: opportunity for
 str_read_write(value)
Message-ID: <202501240821.hGJS6MKf-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Rander Wang <rander.wang@intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
commit: fe46d2a4301de1299fb32c0317ec316706ceaad6 soundwire: debugfs: add interface to read/write commands
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-104-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240821.hGJS6MKf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501240821.hGJS6MKf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soundwire/debugfs.c:159:39-44: opportunity for str_read_write(value)

vim +159 drivers/soundwire/debugfs.c

fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  148  
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  149  static int set_command(void *data, u64 value)
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  150  {
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  151  	struct sdw_slave *slave = data;
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  152  
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  153  	if (value > 1)
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  154  		return -EINVAL;
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  155  
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  156  	/* Userspace changed the hardware state behind the kernel's back */
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  157  	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  158  
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03 @159  	dev_dbg(&slave->dev, "command: %s\n", value ? "read" : "write");
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  160  	cmd = value;
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  161  
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  162  	return 0;
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  163  }
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  164  DEFINE_DEBUGFS_ATTRIBUTE(set_command_fops, NULL,
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  165  			 set_command, "%llu\n");
fe46d2a4301de1 Pierre-Louis Bossart 2024-06-03  166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
