Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC62F6918
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 01:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774316436; cv=none; b=j1o3uvcfo6x3CRzsiOB8XaLLhNKAQawU+Zr5gw5WX5L6OqLLCY8Z26cGCMMhswKPCVPBfpuXpvQNNpUeqYXxeQyK+ATGGX6Fjh69viXroua8qs/fWivpMInOeuKE82oUYY8mU+Vs2Qmb//xS+SOhCC4u3p0/Kx52jZdTS6WQPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774316436; c=relaxed/simple;
	bh=DLnS4haYu+7ml+15MuNx98iW082nZhYc8c5DYHQGhVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YYXTdqq9GyoE0HJcFCEvgssqAfk2lqnyMQsXS06UiK94jPv97SAv7kZNFeFfkytvvoAU3N625ZZuI73EzpU79A2eec5Ix6zl3aPm82AMhPT6J6q2kMLBZ88x28i3rL2hyIoqWBiw4C578Z78O/OZ94/xY8QuhZtsrCqEhnrtVPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9+jmbq9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9+jmbq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774316434; x=1805852434;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DLnS4haYu+7ml+15MuNx98iW082nZhYc8c5DYHQGhVE=;
  b=T9+jmbq91/l2pdGihkxjDY9fShodncdDLOOr8Upg3efUFldxtHXus1bR
   z4/h/0/32R0rZvISZr085ilfOkhYAVMbRsG5hz7iNa2zT0M9sJPWTwqrd
   I+Hd+TrYp5F5zf0S7tD+kIkFsrZA7gFcFoAiz/YUT3orXc6GEYIvZNWID
   ZfUubXEpeOLfoHsAJBxbsxZxUeDrlQa0F20JjVIkxXjgs/EH5S7OMIOpQ
   ojIEdxQMuFVuwRPryY/LmTBinyQkO8zIuOeBh6r+RPwdbR8ri+qW8ZM96
   55tqHdJO+o92jiVDd6WLQ95pnM+7vV/e+CfDUIaRc7/tzB4ePY9EtcJDS
   g==;
X-CSE-ConnectionGUID: pH8c7cocQ12zRsoDxbiU8A==
X-CSE-MsgGUID: Me8y4XpvRImlN1IA6IEVrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75394527"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75394527"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:40:34 -0700
X-CSE-ConnectionGUID: J11AF/K8QWmM72SIa8q8IA==
X-CSE-MsgGUID: kKDZKob2Qgy7k6oGCTjFng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224213041"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2026 18:40:32 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qkv-000000003W7-1pVH;
	Tue, 24 Mar 2026 01:40:29 +0000
Date: Tue, 24 Mar 2026 09:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/8250/8250_port.c:2221
 serial8250_init_mctrl() warn: bitwise AND condition is false here
Message-ID: <202603240949.uYqvzxpP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 7bdf59c79cf3757fc25c00800f73093cdd6323d4 serial: 8250: extract seri=
al8250_init_mctrl()
date:   9 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-r073-20260323 (https://download.01.org/0day-ci/=
archive/20260324/202603240949.uYqvzxpP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603240949.uYqvzxpP-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/8250/8250_port.c:2221 serial8250_init_mctrl() warn: bitw=
ise AND condition is false here

Old smatch warnings:
drivers/tty/serial/8250/8250_port.c:1221 autoconfig_irq() warn: bitwise AND=
 condition is false here
drivers/tty/serial/8250/8250_port.c:1240 autoconfig_irq() warn: bitwise AND=
 condition is false here
drivers/tty/serial/8250/8250_port.c:1261 autoconfig_irq() warn: bitwise AND=
 condition is false here
drivers/tty/serial/8250/8250_port.c:2361 serial8250_do_startup() warn: bitw=
ise AND condition is false here
drivers/tty/serial/8250/8250_port.c:2406 serial8250_do_shutdown() warn: bit=
wise AND condition is false here

vim +2221 drivers/tty/serial/8250/8250_port.c

a194597c0cd35a7 Jiri Slaby (SUSE  2025-06-11  2218)=20
7bdf59c79cf3757 Jiri Slaby (SUSE  2025-06-24  2219) static void serial8250_=
init_mctrl(struct uart_port *port)
75f8abe8bee53a2 Jiri Slaby (SUSE  2025-06-11  2220) {
795158691cc0248 Jiri Slaby (SUSE  2025-06-11 @2221) 	if (port->flags & UPF_=
FOURPORT) {
795158691cc0248 Jiri Slaby (SUSE  2025-06-11  2222) 		if (!port->irq)
795158691cc0248 Jiri Slaby (SUSE  2025-06-11  2223) 			port->mctrl |=3D TIO=
CM_OUT1;
795158691cc0248 Jiri Slaby (SUSE  2025-06-11  2224) 	} else {
795158691cc0248 Jiri Slaby (SUSE  2025-06-11  2225) 		/* Most PC uarts need=
 OUT2 raised to enable interrupts. */
795158691cc0248 Jiri Slaby (SUSE  2025-06-11  2226) 		if (port->irq)
795158691cc0248 Jiri Slaby (SUSE  2025-06-11  2227) 			port->mctrl |=3D TIO=
CM_OUT2;
795158691cc0248 Jiri Slaby (SUSE  2025-06-11  2228) 	}
795158691cc0248 Jiri Slaby (SUSE  2025-06-11  2229)=20
795158691cc0248 Jiri Slaby (SUSE  2025-06-11  2230) 	serial8250_set_mctrl(p=
ort, port->mctrl);
7bdf59c79cf3757 Jiri Slaby (SUSE  2025-06-24  2231) }
7bdf59c79cf3757 Jiri Slaby (SUSE  2025-06-24  2232)=20

:::::: The code at line 2221 was first introduced by commit
:::::: 795158691cc02488264a59398fc6d8ce930d60ac serial: 8250: extract seria=
l8250_initialize()

:::::: TO: Jiri Slaby (SUSE) <jirislaby@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
