Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672421;
	b=S0tGm+qTSRYkboSsW2TpaERcVP/GpyOq33zG57SdWiWlW+BLgxwx1MBSKFNtXeSdKcaM
	 UfMhBFimyCZj/G7fp2/B2RmAQnukCN3oZkqkOpQNJ4LgJHygXJ3d0jp0S2qJBoJZJA0Wh
	 pZ24MOeetQDseBl+Novcw5A+iSiOj0hEIWzA8utvpmi4ICPN8ntwAEbSSmZ2zAOpaqLJi
	 Vb/XzS0Fr7xma6V73Wy1Nk1a5jE7Ec99SeYsw+uCWPP5AsgIegtr++o9qp0b2F2bDogFp
	 6jfd05hUqTLE0UxrEcq4MX1mqJGJfBwn3wiU695hUl8gC9SyqCYon2BtxVo0WZTOjpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672421;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9+xY895YyKOb8r+4/F2H0gdE5r8HoCWq1ug1oHEE9gs=;
	b=N+11MyN9GRX2DkG3g3vnNCH0V38GQx9pr7o4xfCC+W4SufVXf/B0vhKQPFu+jiJ0S91W
	 VIgOfvm2W3EEEMJo3fGK6CYGHx/kYVSW563ICiwTfhIHiwka79BXCtU2RStQkTVhZcima
	 5eFNnyE7m/xYJieZeeK+DkRk1f3mq6KTgJSd06zvX7aWoQN6i/S/r2QUnCyyYHVbeEIM8
	 89v3EB1o18XMevwD9MuL5sxTLoUB/Pp+0XxU9f8mNxTQ/noZI5eATIchhg7P4yO7ibQon
	 UOfI05DB+1/F952dCyAHGO6JyS6yKCjBnUoKaG0zqCO85smTnZ1tYkjKY2tNG3fKi0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="lwn/Fwfk";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0224606A323
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 16:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0224606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lwn/Fwfk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794672421; x=1826208421;
  h=date:from:to:cc:subject:message-id;
  bh=XOJ4v0nOQlj9ghY/ZB4FfZ1s5coV3Nh+pSAeNu2sTm0=;
  b=lwn/FwfkyrRXXrEFK8kkEL12LFZXrpQ/vPwfvXdZoTWNFgowa6VZVB+d
   u8YSt1p1NiDZbUxCdfMlA78bV0y+OdZGQyhjvuqgqgBUyGHpVYVNzDW2B
   toDeY9JHNY/6UNcgKY1Gq0S1HVQ/68Z2s8f9IZ0b6sUH7e7+OmrJKcVLL
   C7ZhIfAHw0sOpMpBsTFlgg20qfz8G11vmNfSulUDQxHy8g7P5lLzxTDD1
   rOhekIC9rlCdlsEADOkpbLebayaA/mMXfiOgOGhMbP0IgPr78N8bpFBpl
   jKYYWx0gfb9uU8xcBRz7Y0Y2s3lhdzovRT3xBeBlBnugN7L9oOabdnEYV
   w==;
X-CSE-ConnectionGUID: ws1+5YvLSOasJaCXX7FR8A==
X-CSE-MsgGUID: 3Om8Brd1T9iG+vRAgCNLZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3453884"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3453884"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 08:07:00 -0800
X-CSE-ConnectionGUID: 3UexBo1BRdSd9jIN5Mvd6w==
X-CSE-MsgGUID: 32VMIvzSQ+SfcYuaAt96mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9095075"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 14 Nov 2026 08:06:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSGHH-000000001oR-4AOj;
	Sat, 14 Nov 2026 16:06:55 +0000
Date: Sat, 14 Nov 2026 17:06:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [sj:damon/next 30/107] mm/damon/sysfs.c:3104:39-56:
 opportunity for str_on_off(producer -> enabled)
Message-ID: <202611141631.mSd4HrD7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: SJ Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   3c1c49cc0b153ce7fd29195e7b1a7e91f0daafdd
commit: e8b924f2b4acab3086c456b670a24e6a69381be2 [30/107] mm/damon/sysfs: implement reports infra and user_report
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: openrisc-randconfig-r2107-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141631.mSd4HrD7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611141631.mSd4HrD7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/damon/sysfs.c:3104:39-56: opportunity for str_on_off(producer -> enabled)

vim +3104 mm/damon/sysfs.c

e8b924f2b4acab SJ Park 2026-11-11  3097  
e8b924f2b4acab SJ Park 2026-11-11  3098  static ssize_t producer_state_show(struct kobject *kobj,
e8b924f2b4acab SJ Park 2026-11-11  3099  		struct kobj_attribute *attr, char *buf)
e8b924f2b4acab SJ Park 2026-11-11  3100  {
e8b924f2b4acab SJ Park 2026-11-11  3101          struct damon_sysfs_producer *producer = container_of(kobj,
e8b924f2b4acab SJ Park 2026-11-11  3102                          struct damon_sysfs_producer, kobj);
e8b924f2b4acab SJ Park 2026-11-11  3103  
e8b924f2b4acab SJ Park 2026-11-11 @3104          return sysfs_emit(buf, "%s\n", producer->enabled ? "on" : "off");
e8b924f2b4acab SJ Park 2026-11-11  3105  }
e8b924f2b4acab SJ Park 2026-11-11  3106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
