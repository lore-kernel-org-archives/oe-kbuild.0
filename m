Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368C28FD
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Feb 2025 02:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739066981; cv=none; b=lrhjUfx8ra7hFk78oNvChT1rx06QZMvYFDhEdigso2S4XZoT+1JJx2OE4rNy7QOUZOWzaPOI6hukkhtHuP52zgMHWKC+mMMKMp10lwL2ZGG3dTg8lJt3/ggD4iW0VG/gPHZrKP9TquX6jxB7L8O9jTPwATbNP6wO6H/9ByvcsHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739066981; c=relaxed/simple;
	bh=nLb9agZbF8kwk7qs0H7HtW/MUPD/jR8cj0vOceMhEM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T2oZvUbdMQwpk+71KEFvwFVlNTOQdaV51COGqrmGt+dVJltAXRWdwpEKMQZTxUSDVEAxDSp4r0QrAZadVCQUB2EbYoLZwaJ8GnUvFo045ClwliEFjcihlvR9HCOqmnW4xx+aHijEfdewYQ3ygzEwY5jO0pXmcsbQAJT1fJLmnsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgBqe+1r; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgBqe+1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739066979; x=1770602979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLb9agZbF8kwk7qs0H7HtW/MUPD/jR8cj0vOceMhEM8=;
  b=AgBqe+1r5btRkR+n83sYN59Q7KbkAhmSWdGlcad6kXmkOR0g5gPR9JDn
   ny/tga0pfcC02uVbbkeb1PfGv728e3sssfwP0vZVFZlqJ1b+0LvNiwsUo
   oWQhlEeNrL/+g1MdNNds48m3/9geFVjwzyG5s/OZons1seaH7Rbdq1xQy
   QRdFNyQASmWoaPMWx6tkjMT/bpRhGlbaqRXYwdRGlrFXD0Mr485fCAxED
   4wa6MgBfCQpXVtVBf/ofxnxiWXC5I5UXL7q6RdSbB4Cerxta42OLw81oJ
   GKsNA+1PmJAGt2hKRSEvpueJ+zQ2UXh6+3toxNi6F1TnWsJmHFMdCbS8M
   w==;
X-CSE-ConnectionGUID: hXrGHIxESxu9A+Xg51tLsA==
X-CSE-MsgGUID: WTi9EYq4QFqNz9yAbpeN5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50314410"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="50314410"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 18:09:38 -0800
X-CSE-ConnectionGUID: 23BosGuPSQCn7h06N/whyQ==
X-CSE-MsgGUID: Us4ykGucSrGBQ2G3nykj3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111697661"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 18:09:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgwlK-0010vx-1w;
	Sun, 09 Feb 2025 02:09:34 +0000
Date: Sun, 9 Feb 2025 10:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)'
 and 'vmlinux.a(xprtsock.o at 797124)'
Message-ID: <202502090914.AnKPmldC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9946eaf552b194bb352c2945b54ff98c8193b3f1
commit: 695ed93bb30e03e9f826ee70abdd83f970741a37 kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
date:   8 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 days ago
config: riscv-randconfig-001-20250209 (https://download.01.org/0day-ci/archive/20250209/202502090914.AnKPmldC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090914.AnKPmldC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502090914.AnKPmldC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(xprtsock.o at 797124)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(xhci.o at 751764)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(page_alloc.o at 694044)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(ring_buffer.o at 690504)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(tcp.o at 791604)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(trace.o at 690564)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(slub.o at 694284)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(dir.o at 703464)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(ip6_output.o at 794544)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(spi.o at 748404)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(skbuff.o at 786204)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(namei.o at 695544)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(filter.o at 787284)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(auth_gss.o at 798444)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(af_packet.o at 796884)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(xdr.o at 797904)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(ip_output.o at 791304)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(svcsock.o at 797544)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(svcauth_gss.o at 798624)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 681384)' and 'vmlinux.a(xhci-ring.o at 751944)'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
