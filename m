Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF7385622
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 23:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715643007; cv=none; b=ceiB+gUuT3+0sgDbQvcJIhIv5UvPkRCYHliMsGpNzf8gsuCcB4yc6nVyCeDNpl1PE0dNPgagkdp8zyOezfWC2F9yaG6RsOvBc2UCX1tbbiI1P3U9hQQldAYoRIAVcm4W9zky72934OKVKeIoLL+xln2in2053CXhEW2BKIbo4yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715643007; c=relaxed/simple;
	bh=IUH/E1rIMm47U19X4IQBuz+niqP8h61ydAeuWn9XZYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKZh8qpkX15XOaNFb+CBn5YlwBLVIxkTrmIC52U5uFkk/cPGMzDk2dJcciLAYW7yejGsS776oEZBThNT6QZ4fmuu2tWnvKvl4SkWsQi7tbk4/2yrnqlmVzv+ggQ0BjhOezfk8pmkdoVFVCRQ+e/vS/FAOjDttOT4ycCK8QSklP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpUkcM28; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpUkcM28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715643005; x=1747179005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUH/E1rIMm47U19X4IQBuz+niqP8h61ydAeuWn9XZYA=;
  b=MpUkcM28MZ7ox8qj8qU6OIDR+JgLrTKvniqPwz0ULxjSOhftKtZKv0Pj
   5E7MXVoDAPb1o0xpXQdCYgbTzQExGtK1uV6VegkGmY8GJV08/d/sQOXV7
   mXYvdrE1Z3gjJxZVZLtsBF3CLOD4qOV2761VucDKR7LWGsoFMntnxOPrY
   pRuqn6APIWBHV5gN3hS8zneI1sGlHjo1pPk3vLJGhNsy7M8KwVK/GKNL9
   xMImG0iAzjkWYdPpqT6kEttJ1D4bCvsZAsNI3qi79qzZCzHU+ppWhfyyD
   wMKyKOqKr/hhlU+2GcHo/iHbMswe9I+8FgPdW+HntdK+9KWL/2WAteqJl
   g==;
X-CSE-ConnectionGUID: zvCRPiJRSxCI+hDVNa6RQA==
X-CSE-MsgGUID: e/YpE6mgQ06+0omnfuvaFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15393862"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="15393862"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 16:30:01 -0700
X-CSE-ConnectionGUID: 5AsnJtDCRjKXYVbOB4QT2Q==
X-CSE-MsgGUID: KTfdnyVDReyWEs0rRZKzKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30556803"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2024 16:30:00 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6f7F-000AnX-2r;
	Mon, 13 May 2024 23:29:57 +0000
Date: Tue, 14 May 2024 07:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12296/12321] scm_rights.c:3:9: warning:
 '_GNU_SOURCE' macro redefined
Message-ID: <202405140701.RhrkqSah-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Shuah Khan <skhan@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba6c795dc73c22ce2c86006f17c4aa802db2a60
commit: 78e0bf04a88a0a3e27ca2651f5f2d12fa39b56e3 [12296/12321] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140701.RhrkqSah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405140701.RhrkqSah-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scm_rights.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   scm_rights.c:203:18: warning: field 'cmsghdr' with variable sized type 'struct cmsghdr' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
     203 |                 struct cmsghdr cmsghdr;
         |                                ^
   2 warnings generated.
--
>> watermark_signal.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> mseal_test.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> seal_elf.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
