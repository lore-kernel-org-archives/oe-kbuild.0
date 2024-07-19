Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3642612D76F
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 18:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721414384; cv=none; b=IXoSDQmCOhRqQoMjPCr97jyGanWe0XPDENbP/JSqTdVUCnua6/MNKdmeTklhcioTYWk08PXSTY2S4NBQNrgWhUWDfqouPadQr9o0QfMQgDUjmYYnnWaXZCkkTdC3dM3RZEgsQtqtPI+TjsKHuJMM76/1XxIoicXbA4QGSJXNeIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721414384; c=relaxed/simple;
	bh=83ysIxU+yoo+1RN32CWzSQ2eBzbbk/X/Up0jIOaVFyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lEqJooUXsTElHODL8j+R1RE4N++u49zjwdSbmMZKlZQZHvc5Zs3DBcCRB061DAyrv3pPQdC5FynZcoRv3OLRe1rD+Kwbipf9ZIHwUVmubXLs0ztdZg0RggZSXp3E9rninIL6CkKhqPLQBURA/3buf1/Zifi4Xhg+uma2eqLi//8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWVt+Vdm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWVt+Vdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721414382; x=1752950382;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=83ysIxU+yoo+1RN32CWzSQ2eBzbbk/X/Up0jIOaVFyU=;
  b=OWVt+VdmyhSCcVIk1vuumx2OFycot85/pWIT84JD0OZvHGQpMlODnnFS
   6ulrqXvZMDaeoxrp3nu9s68G0FgVH24db3a61lB2DxySmaCB8DNYgmmtD
   q6KHOvL3hFYQ42u3ga+dosHVUrmCoHGwXNAflbwowXKiaXtaQGN8TvQLF
   2tCdjuV8xOr3ZD2Ri++j5Vf8jKJo/9G++ffWo/aEpu7XZ0nKp9QHqGlZU
   rjZVMDffyvyf4488zn8qEegZ71g90C4krsHipduquTBQhLk74RjjytAlt
   Xhzjua0z615tJdCmhvqQY1F9F/QUTOuUJePW/Ssl7hHn7L0q57Zz7Xpdk
   A==;
X-CSE-ConnectionGUID: Pc0oh282QlqLCHP6n7lCag==
X-CSE-MsgGUID: 58rCRj51RBqw8eDX+sTtAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22813580"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="22813580"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 11:39:42 -0700
X-CSE-ConnectionGUID: xFcUmHlsRIijh1cxsCS0Ug==
X-CSE-MsgGUID: 5FGSLB52RbK2eDGiO4P7Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="51280503"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jul 2024 11:39:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUsW2-000iTu-0Z;
	Fri, 19 Jul 2024 18:39:38 +0000
Date: Sat, 20 Jul 2024 02:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/cznic/turris-omnia-mcu-gpio.c:257
 omnia_ctl_cmd_locked() error: uninitialized symbol 'len'.
Message-ID: <202407200203.WwIiHoQj-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   720261cfc7329406a50c2a8536e0039b9dd9a4e5
commit: dfa556e45ae9ecc199e598222debc8f1883a7cce platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
date:   3 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: arc-randconfig-r071-20240719 (https://download.01.org/0day-ci/archive/20240720/202407200203.WwIiHoQj-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407200203.WwIiHoQj-lkp@intel.com/

New smatch warnings:
drivers/platform/cznic/turris-omnia-mcu-gpio.c:257 omnia_ctl_cmd_locked() error: uninitialized symbol 'len'.

Old smatch warnings:
internal error: arch/arc/include/asm/bitops.h:137 SQL error #2: near "and": syntax error
internal error: arch/arc/include/asm/bitops.h:137 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
