Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66135B15F
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761477365; cv=none; b=rRBkHTFRDJ5E34mTEB/n552+Ved+OEmpRGumhhcwsxMRw1qweGOups5Zp4+T+/LH/sDIXPtrHlEBvzedDZoKaZFZfIAIVYYkYWd0P4MyZzHA6ONF+iDsp5MsvrmStOoRu5GzebumWvrqo7VjTeqhfcTnsAsQ4r0ZEJ8QAK3F0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761477365; c=relaxed/simple;
	bh=0maGU5zS9TzfOEW0vP079YKfzaWwmy/IgJFffqLtHEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzmF1MflgnMpM/mGWhVmSQ4pkQm9rkjvD3kdc1D6ejYPldnHt7R3xC2wVA/fkJvO3iQEBoDBTDRFz0scTgrORAi/RPludXxk9NQvPQTXPel7f1HoyNlqfxRNbPIghB6IUIPf8H43qF7+DtEP6xbMWZ1yNdA/lW8whRHgy+7nSLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQFd9Uae; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQFd9Uae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761477360; x=1793013360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0maGU5zS9TzfOEW0vP079YKfzaWwmy/IgJFffqLtHEs=;
  b=dQFd9UaeXj/oECANZgF2+PFyo1FrUxkGG5mUd5okL80FFvfPzPkgW3fC
   SUYQCPXiRtcbaJ0vASkQzfQ7WP5eHVl9Z09Qba3T018aSbycSNqnAYzHq
   D4WHao4sjsRR8Cv7OMdYzE5EsF9q8MxABwtfIAiJfgcu2xld93rI16wu4
   ElS0zMhxcX4p7rqdegdv0lOUVnMB7Xx/A8G41TZHzVtoukC9HzMq77wuM
   QfCih54aVPfDlvPicNqcAcHuZYwbq3QUbr2nyCnxT6b6IfdBz0hVU6nAZ
   Tum9zjZM2Xd9kzFtXdylYgYTUpJ28rUj1pARdpr+vEbFi6YFR+gxD2CVU
   g==;
X-CSE-ConnectionGUID: GTKEEc0kQ32qLjwc9PFsMw==
X-CSE-MsgGUID: VD6bd5PBRs6qm9ySnHSe8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74928417"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="74928417"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 04:15:58 -0700
X-CSE-ConnectionGUID: Pn68hDDUQlKSxJrqghTuwg==
X-CSE-MsgGUID: PRlHryaTSCSc3oNUY0CJzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="215713816"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2025 04:15:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCyj4-000G4f-36;
	Sun, 26 Oct 2025 11:15:54 +0000
Date: Sun, 26 Oct 2025 19:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-kminext 1/1] ncdevmem.c:364:33:
 warning: unused variable 'queues'
Message-ID: <202510261913.ZLaXkWh7-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8979fee435bfd762771c71f3cf99f6f279038337
commit: d308312acd0cbbf40b97a018eff5659b09660fae [1/1] tests/ncdevmem: Fix double-free of queue array
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510261913.ZLaXkWh7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261913.ZLaXkWh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261913.ZLaXkWh7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ncdevmem.c: In function 'do_server':
>> ncdevmem.c:364:33: warning: unused variable 'queues' [-Wunused-variable]
     364 |         struct netdev_queue_id *queues;
         |                                 ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
