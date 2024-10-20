Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96D328F4
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 02:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729393097; cv=none; b=jdjBAbtRrEo4E1ZVzlNRkk2yuYypkFq2CyTlCmzpmxYmSrjO4GRbNCq1TSE98ZBLt2dOG58chEkEipMSnBfE/Oo74mTHJYRNJMgfCfUo/g7TWfz5HFkb2xy9FlTVNCrYuR/WcSjV1cOW7sLnPSJh9BXothn3I/AVTQ0yXnv2YQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729393097; c=relaxed/simple;
	bh=fDnfKqetTW6DFs9LIhNKomVMqf9D4eP+dUa786BDAzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vCPp2W5pmOOd1BK0wmo3SNKAmsi++kRcS4Ztu2yGbjuHRphBYmudcHQgDFh0i9p8BC+8hEJHUJk0vakNS0tD+KN0I3ef6hnaRhYPE/6fvZsr5zGA/1+kSf9olTRQxxA+//z8oL93i2JM6LIKnzFKQd+uQbLEEv2C56sl8oqfqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwDvJ8pq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwDvJ8pq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729393094; x=1760929094;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fDnfKqetTW6DFs9LIhNKomVMqf9D4eP+dUa786BDAzI=;
  b=CwDvJ8pqEeM2x+yihuTo6axRnAFYUfZ2cHArk88GikUw/XTzH6zx3NkB
   4a6iISkBvOY3slrbFMLw5/4qreKmh9pcNQa/NYpekIcl6D8gJkhgE2vR1
   r+UjRvAs2Oz37bYDGA19tC5uyvXSX4giLHCE7VoY3QZB3Cg9vWS6pE2D7
   Gl0utk7zdu27IpecKI7Xhc496WJ9ibYEEYPLTDovotzHSBJ581roQonnf
   yeMn9keQ3GNceAEp3OZQYx1hZhFE793bTwIS8nWN4Ae9b6vNgFyQdHn+t
   F36lr9d1jnxOxPKF9BlAB0tvjcsz4ne51x0N1LVRRxCcZMYjlrsM5fS9F
   w==;
X-CSE-ConnectionGUID: 5BuEQG0eSCOnN3isbKee5w==
X-CSE-MsgGUID: L3oo3EeJQT+ntSf+Z1VzbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="32809668"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="32809668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 19:58:13 -0700
X-CSE-ConnectionGUID: rSoulVw9RI20Efbv2JKwnw==
X-CSE-MsgGUID: KhiiHFx8TIiAUuSI89lNaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84030984"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Oct 2024 19:58:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2M8v-000Po5-2A;
	Sun, 20 Oct 2024 02:58:09 +0000
Date: Sun, 20 Oct 2024 10:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/cznic/turris-omnia-mcu-gpio.c:257
 omnia_ctl_cmd_locked() error: uninitialized symbol 'len'.
Message-ID: <202410201033.sEvOUguy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Marek Behún" <kabel@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Marek,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: 74a22fced5a012c57f56d1cf7ea926cc366a2a3a platform: cznic: turris-omnia-mcu: Make poweroff and wakeup code optional
date:   2 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 months ago
config: arc-randconfig-r073-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201033.sEvOUguy-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410201033.sEvOUguy-lkp@intel.com/

smatch warnings:
drivers/platform/cznic/turris-omnia-mcu-gpio.c:257 omnia_ctl_cmd_locked() error: uninitialized symbol 'len'.

vim +/len +257 drivers/platform/cznic/turris-omnia-mcu-gpio.c

dfa556e45ae9ec Marek Behún 2024-07-01  232  
dfa556e45ae9ec Marek Behún 2024-07-01  233  static int omnia_ctl_cmd_locked(struct omnia_mcu *mcu, u8 cmd, u16 val, u16 mask)
dfa556e45ae9ec Marek Behún 2024-07-01  234  {
dfa556e45ae9ec Marek Behún 2024-07-01  235  	unsigned int len;
dfa556e45ae9ec Marek Behún 2024-07-01  236  	u8 buf[5];
dfa556e45ae9ec Marek Behún 2024-07-01  237  
dfa556e45ae9ec Marek Behún 2024-07-01  238  	buf[0] = cmd;
dfa556e45ae9ec Marek Behún 2024-07-01  239  
dfa556e45ae9ec Marek Behún 2024-07-01  240  	switch (cmd) {
dfa556e45ae9ec Marek Behún 2024-07-01  241  	case OMNIA_CMD_GENERAL_CONTROL:
dfa556e45ae9ec Marek Behún 2024-07-01  242  		buf[1] = val;
dfa556e45ae9ec Marek Behún 2024-07-01  243  		buf[2] = mask;
dfa556e45ae9ec Marek Behún 2024-07-01  244  		len = 3;
dfa556e45ae9ec Marek Behún 2024-07-01  245  		break;
dfa556e45ae9ec Marek Behún 2024-07-01  246  
dfa556e45ae9ec Marek Behún 2024-07-01  247  	case OMNIA_CMD_EXT_CONTROL:
dfa556e45ae9ec Marek Behún 2024-07-01  248  		put_unaligned_le16(val, &buf[1]);
dfa556e45ae9ec Marek Behún 2024-07-01  249  		put_unaligned_le16(mask, &buf[3]);
dfa556e45ae9ec Marek Behún 2024-07-01  250  		len = 5;
dfa556e45ae9ec Marek Behún 2024-07-01  251  		break;
dfa556e45ae9ec Marek Behún 2024-07-01  252  
dfa556e45ae9ec Marek Behún 2024-07-01  253  	default:
dfa556e45ae9ec Marek Behún 2024-07-01  254  		BUG();
dfa556e45ae9ec Marek Behún 2024-07-01  255  	}
dfa556e45ae9ec Marek Behún 2024-07-01  256  
dfa556e45ae9ec Marek Behún 2024-07-01 @257  	return omnia_cmd_write(mcu->client, buf, len);
dfa556e45ae9ec Marek Behún 2024-07-01  258  }
dfa556e45ae9ec Marek Behún 2024-07-01  259  

:::::: The code at line 257 was first introduced by commit
:::::: dfa556e45ae9ecc199e598222debc8f1883a7cce platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs

:::::: TO: Marek Behún <kabel@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
