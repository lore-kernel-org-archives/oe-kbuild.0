Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826052;
	b=OHJFqYZtKiwzPGeuMa3uM5+1LBs6Vk37cincmhfXyLyCHkdCNCCgfGN83UAc9be+KlhD
	 3WdDQqXvoZStPsFYJjxNS7PqygO2RCKoD1dlrtc0OG0sziQFvXmReCbCaU0Jl/CqKG2j7
	 X05Vq08y6LwRTWFbshcOh72ePdzPUaenk4szw6jxNxSsoqIt+k3uPaGk5RNz1ZvqnFBQs
	 mnJURQnJ/7Od3rUB7R9x/YvVCFP3iEbXNoWQ//6GwY5rmMIhXgsS5/q60zQ6ff5lZWPZB
	 Rux/A3jDiFlJeKpsF/tetSS0EBpScDnEhLPqQNV0CsVOp04SDrvVZUbo+CsrqqlHFFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826052;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=odjA9/AQi60nExgE/zMwXCS0KeHr9moDggiWPjwafAU=;
	b=h3DM7CspD6YBbr/Y+F8Rb4uZqzjdl74eoBWHLkj+joH8nsT52OsoAQTkA0AMI+T2XznW
	 3hUYUt9rFKD9vMaYnP1yU6JuqBQjs9fp7JAxFcJpadgwNFne7S2/sOrPmXUBAMW8+0MDl
	 MUM/zrK5KB4iUElDIaVPLf4yc9Tpy6XVHNs2fEuBnm/css3/TxPpOgQxVDHk/H8CC3KR9
	 EHjDikNvcPLQkox/bDnKS1hM1a/m3WI417S255vR6imSj0hZPZaUdOfYaeSe9t7dBJNcX
	 P68Ek2kZoZDfJDLWamsTXjKnu1SsZE6smwLhgeVcPX18x7RxsU1/3s5e0y66fTamEhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gdK7CvFg;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02810606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Nov 2026 00:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02810606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gdK7CvFg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795826051; x=1827362051;
  h=date:from:to:cc:subject:message-id;
  bh=atSlNDHsSS9V/us7qFfYw8fSx8gVF57HuBzIn0ga18E=;
  b=gdK7CvFgxFGHZL+kDcCiwCeOIAnPOWDPTp6VB6VfEzY94t6jjYwOwSLj
   3WRd7eWtue+a26x0kE6NAfKpocJi5zC0stZqgLlZtp87OXENFMiNWSQQC
   sKZwkmbKefPPu1+JuDCepnPAXpHhNcCk9IGs+b6JQDfogIY18WLGH4jBh
   c12PfU3HBPzxcEhbslTy62KEOjGXpyYMJ8Af14xh8KMJNyRYHqce1tJt2
   4Z76TDPG90D+WLNHT66sKTm+vdN6ZraoV9z5dJU4xJundKeCt2Q1PziOs
   HFb/skSc5Tt1jp9FswxsVXcdmtPRiI7l5RoHYp5ert/l+wRTRwyocq4yI
   w==;
X-CSE-ConnectionGUID: e7czJr7FTLa7wUtsL2h86Q==
X-CSE-MsgGUID: GBgYpb3GSOyPsdaDo1A23g==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4723209"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4723209"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 16:34:10 -0800
X-CSE-ConnectionGUID: gwtoRjZlQ7S61GftVTyU6Q==
X-CSE-MsgGUID: x1Lql5rhR6eTL/R/KPAXPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12645946"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2026 16:34:09 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX6OF-000000000Sc-1W37;
	Sat, 28 Nov 2026 00:34:07 +0000
Date: Sat, 28 Nov 2026 01:33:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hid:for-next 4/10] drivers/hid/hidraw.h:30:30: error: use
 of undeclared identifier 'HIDRAW_BUFFER_SIZE'
Message-ID: <20261128013045.S8yaDskj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-input@vger.kernel.org
TO: Jiri Kosina <jkosina@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   e61d3737e144924bc27c536a31da8147f1b55554
commit: 3203bc9bc0795c44c25ce7b7762eeb35f73e82c4 [4/10] Merge branch 'for-7.4/upstream-fixes' into for-next
:::::: branch date: 16 hours ago
:::::: commit date: 17 hours ago
config: loongarch-randconfig-2000-20261127 (https://download.01.org/0day-ci/archive/20261128/20261128013045.S8yaDskj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128013045.S8yaDskj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261128013045.S8yaDskj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/hid-core.c:37:
>> drivers/hid/hidraw.h:30:30: error: use of undeclared identifier 'HIDRAW_BUFFER_SIZE'
      30 |         struct hidraw_report buffer[HIDRAW_BUFFER_SIZE];
         |                                     ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/HIDRAW_BUFFER_SIZE +30 drivers/hid/hidraw.h

86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  28  
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  29  struct hidraw_list {
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14 @30  	struct hidraw_report buffer[HIDRAW_BUFFER_SIZE];
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  31  	int head;
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  32  	int tail;
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  33  	struct fasync_struct *fasync;
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  34  	struct hidraw *hidraw;
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  35  	struct list_head node;
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  36  	struct mutex read_mutex;
b31c9d9dc34314 include/linux/hidraw.h Peter Hutterer 2024-08-27  37  	bool revoked;
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  38  };
86166b7bcda0bc include/linux/hidraw.h Jiri Kosina    2007-05-14  39  

:::::: The code at line 30 was first introduced by commit
:::::: 86166b7bcda0bcb53525114fa1c87ac432be478e HID: add hidraw interface

:::::: TO: Jiri Kosina <jkosina@suse.cz>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
