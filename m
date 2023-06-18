Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0513D74
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jun 2023 19:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687116390; x=1718652390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aV8O6TtAm6m4InU0kiv/MGdv5gUfDhz2ywBlnJY4dXM=;
  b=TzUAzpH8uUVoieq5P70IlVw0/fE5f65AbMiPJ754j7aS49aCh6p1uA2P
   dI4m9KIkv/gdlLs8E/p7mEmwCYCgDJMDTzhbrEiKI9wkuecnTnxKvgWC3
   YqqlcshhI4OZcKYYHhiRicJUC/UJTSx967qN2PhDyqUBWli+2Lb+AtzKm
   gI2GUyoFPpaI5gv7F2BCbSutDuKRUw1cPOl1tpG5urr4x413/EhXYdXuG
   xfQAXIziX7F4OOM/7LmGlSxEdyNtZg3LORjvnt6G8nVRVFrO0HVqklCMe
   n/IMR5+wBZvcxx/VT5tFIjzvUmW6RFv/9ah1ZwEUcX+la4dOs+VmFDwJp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="358374345"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="358374345"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 12:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="960221576"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="960221576"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jun 2023 12:26:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAy2e-0003yu-2Q;
	Sun, 18 Jun 2023 19:26:28 +0000
Date: Mon, 19 Jun 2023 03:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stable:linux-5.10.y 4576/9999] signal.c:undefined reference to
 `uml_pm_wake'
Message-ID: <202306190324.eHhGGnWP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Johannes Berg <johannes.berg@intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Richard Weinberger <richard@nod.at>
CC: Sasha Levin <sashal@kernel.org>

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   a1f0beb13d9b8955e00caa48f909462fb70e6f73
commit: b58294ce1a8ac8e234abd991255b1d1905520aed [4576/9999] um: Allow PM with suspend-to-idle
:::::: branch date: 4 days ago
:::::: commit date: 10 months ago
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230619/202306190324.eHhGGnWP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190324.eHhGGnWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306190324.eHhGGnWP-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: arch/x86/um/checksum_32.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/um/os-Linux/signal.o: in function `sigusr1_handler':
>> signal.c:(.text+0x231): undefined reference to `uml_pm_wake'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
