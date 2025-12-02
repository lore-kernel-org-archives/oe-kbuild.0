Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677230215D
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671977; cv=none; b=YiIV+VycXLHLaUC00n2+Gnowa4rlflJZ+9bFA24KOKsIGno2nMdJeMwpQBhicBBFWeFYebYNSHo7tnIyz1VelQG1Lunez0ltyFpvyOl0I1on2t1Mvx1qX9NeeW6p6f6rBhMYU2dcQVxfyundpP8AP5lVatT9fCtIjMIad/8Q0m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671977; c=relaxed/simple;
	bh=uKN6P272nfkVgS1VPWKcGNaMcsyZhDW5DvnrZFSyJk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQtqL9ZEKvdsrVe7o+pnIxXL9zanOhC7k/1JNxwt4DgkbKsDWWTxoufDYq6cjI0hkv82lwH8ROxaWInzmvlbk+XbEGeyQXXa9/QXtxrF5lN7kBo5CAnqDGpK5k/Fz3iRnoJHhHAj9UFk9EwMcJxxJSqLVtsg5uLFBdE7zU9Y/lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=na7kaWZ/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="na7kaWZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764671976; x=1796207976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKN6P272nfkVgS1VPWKcGNaMcsyZhDW5DvnrZFSyJk0=;
  b=na7kaWZ/oblnT6RTVYjCqYbEoMvgtbawQRN7uWYc5Z41yjw5N6cYtM6V
   itkYehGN76hyJYRet+inReQdtv+sIvbv8esRXV3COn4t5Df7VZjgUykvs
   629+ZgbWW7uESSfD4pm9NPgmYl0j1N3Jf9B0s2aFigNvY3cpVYJKJFWF3
   EtUyAfGsxVgtONXelDjbQV6yJZ+lTsEtu4aEPXAkc9J5fHp2HBziVzfwt
   Gg+znwv88UK3UiJTGUlZE2VJ4khz5KAtPEkDjkbRA/KwxDEJQTxstveTC
   OBj3MNf2rBXGNJy4HbMw2VsGyW7atgavsgZaPdl8bGCi0/fQh6bky2tu0
   A==;
X-CSE-ConnectionGUID: DtgLs+dATSGrgxqbUytC8Q==
X-CSE-MsgGUID: ZrYhNyc9S/OvyB9uJPGZWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77734253"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="77734253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 02:39:35 -0800
X-CSE-ConnectionGUID: TVgJ0ccURHus/6Ck9MGrmg==
X-CSE-MsgGUID: 8booZgNdRf+E0pa9861PMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="193635178"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2025 02:39:34 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQNn9-000000002r7-3lVq;
	Tue, 02 Dec 2025 10:39:31 +0000
Date: Tue, 2 Dec 2025 11:38:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-lts 14/14]
 drivers/block/loop.c:1989:6: warning: no previous prototype for function
 'loop_process_cmd_list'
Message-ID: <202512021118.vPp25EEq-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   039073ca9a42736c777c0eb2bb7f177568c5866f
commit: aa8a9034d8a0e18d37fff6c6053f470be77637ae [14/14] ANDROID: loop: export loop_process_cmd_list
:::::: branch date: 14 hours ago
:::::: commit date: 3 weeks ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021118.vPp25EEq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021118.vPp25EEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021118.vPp25EEq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1989:6: warning: no previous prototype for function 'loop_process_cmd_list' [-Wmissing-prototypes]
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^
   drivers/block/loop.c:1989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         | ^
         | static 
   1 warning generated.


vim +/loop_process_cmd_list +1989 drivers/block/loop.c

b5dd2f6047ca10 Ming Lei   2014-12-31  1988  
aa8a9034d8a0e1 jiayingrui 2025-11-10 @1989  void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
aa8a9034d8a0e1 jiayingrui 2025-11-10  1990  {
aa8a9034d8a0e1 jiayingrui 2025-11-10  1991  	struct loop_device *lo = disk->private_data;
aa8a9034d8a0e1 jiayingrui 2025-11-10  1992  	loop_process_work(NULL, cmd_list, lo);
aa8a9034d8a0e1 jiayingrui 2025-11-10  1993  }
aa8a9034d8a0e1 jiayingrui 2025-11-10  1994  EXPORT_SYMBOL_GPL(loop_process_cmd_list);
aa8a9034d8a0e1 jiayingrui 2025-11-10  1995  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
