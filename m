Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB4A1DDF1
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Apr 2024 20:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713124996; cv=none; b=XCS109rCbv68oa8ZLrhx+ZDnR9qg5Vjih9w93komzgWWgpcTGTDFmg4xtF8bULJ0KCpci0VX8T369HUs7ElYMdU4yaz0YBLjBAjp4/aQFV+7txTsOBLQSQl4zF+PEBJSdW0RZJQmiy5+7L5M0f0YRt27927q1rGpR8XEslFx/9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713124996; c=relaxed/simple;
	bh=yoSNzRfYjvPl3w0Ys6595LLo+IpVE6E0tVTsaz4r+4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xf+IK8zytxL1CrqizFp4wOEKqsC8xYKsAIiILXZUb2rZPr8Ki9pboS59Jyjj2o9NA0LuAe42kGxYxqnEzgAGxGdQy/yWr5Nl3PvSg1zbnRFB22Me5yByLP8nvdL6WIjWgbC9f4xaQx5mShI0a7maYvNQ7m/zrAF1vcKDVW2i8IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZfHt8B6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZfHt8B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713124995; x=1744660995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yoSNzRfYjvPl3w0Ys6595LLo+IpVE6E0tVTsaz4r+4U=;
  b=PZfHt8B6pj5hANKHGrSxzoRroO0YXUohBEYfMps1FbQmSyx+okbMQJbC
   HnCBgO5b7DQnivd8F9ySM/xtCSEPG71Cm2PhxxlPYhXNOm8h6xk0kcvjd
   jAXRVbxVwI8CfV4ABXanyQsvoTap5ii/IYgV4Vd31aPEAUNtSlVFO7ZKG
   m70+OcNBWSATwn3C8c675TqkjOBl/OILSPUUwyhMwXOPOOf3oKk7wdZpK
   JYJnGeFhAi0F7KPrurkS/bSf/Ee/Jee/rBxrhuKw1mcak1+u1fX7WgRQ4
   +utQQ1PuANHxHsfLdu1RVShrFAYKZFNtRXi2E8LSat4GMkAVGwiHjSywq
   w==;
X-CSE-ConnectionGUID: ODaJJbNEQHef9FRjgS2H0g==
X-CSE-MsgGUID: QG8OfNBgRkKplYCeh3hxnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8368156"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="8368156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 13:03:14 -0700
X-CSE-ConnectionGUID: Lt78nfiETZGHTBxi6GeQtw==
X-CSE-MsgGUID: oDXyZWhYRwu7Bc+SuRU/BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="52660971"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Apr 2024 13:03:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rw64E-0003nc-1n;
	Sun, 14 Apr 2024 20:03:10 +0000
Date: Mon, 15 Apr 2024 04:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [char-misc:char-misc-next 17/28] drivers/misc/ds1682.c:209:12-13:
 WARNING opportunity for min()
Message-ID: <202404150312.uABRht3i-lkp@intel.com>
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
TO: Sean Anderson <sean.anderson@linux.dev>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
head:   4b9f86214c054ea2da2917f6c107b34f7076c181
commit: 115ee55351c1d3fee16515f01133144205ddb29b [17/28] misc: ds1682: Add NVMEM support
:::::: branch date: 33 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-102-20240415 (https://download.01.org/0day-ci/archive/20240415/202404150312.uABRht3i-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404150312.uABRht3i-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/misc/ds1682.c:209:12-13: WARNING opportunity for min()
   drivers/misc/ds1682.c:220:12-13: WARNING opportunity for min()

vim +209 drivers/misc/ds1682.c

5162b75b24963e drivers/i2c/chips/ds1682.c Grant Likely  2007-07-12  200  
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  201  static int ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  202  			     size_t bytes)
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  203  {
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  204  	struct i2c_client *client = priv;
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  205  	int ret;
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  206  
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  207  	ret = i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + offset,
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  208  					    bytes, val);
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15 @209  	return ret < 0 ? ret : 0;
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  210  }
115ee55351c1d3 drivers/misc/ds1682.c      Sean Anderson 2024-03-15  211  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
