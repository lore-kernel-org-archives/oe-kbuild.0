Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080935;
	b=djbt2Rl+CAAoa6owp2YTJxMnfBFhJjigeoQoQLCsqWZnW8gUpX5njk6ejOLn23JrVc6o
	 guRvEFjm5EdbrVq+rFj778tWBYACSa5Z66Vzgrwdp0i4VUvr6XnC3F6BUzE4VvqoN0JXr
	 6b0hPi4T07HKdo4FNYTildop/gs0V6yjBp2LBbNXdxgD9nTHxIhLQhsay1KzvLVBlKDDW
	 rIrBYX5JeqeTRsrTU9NZMgfxCMUe4TxOjXS+wloFC+lNEJujfEXLrPgnxBL6oWPUrhewm
	 d9AlAXV3PfNe1HmGW7vLgIbjo/VY+6IJp0mq/eKqLRjezDgb+mu8zipcTyhpSWNdhiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080935;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6EHPczEvpRvc2h1240HfNblvv/Zfy6seK6AFhIPDsLQ=;
	b=Lro41IXNZGLxJ88SA+SsQpAtB0CiCezO5v9NiuODTkR5Ewj6HGmHBXzjGb1vTvdedh7e
	 H3mSW9sD6jek0I+FRKURJQhxVlSIYnnpPTFdTVoAmRFomlrWmTPN2U8zwlKtmedeoQXpN
	 NlC0wpjXuitd4fiyOaqCPihRTi36tkm98fgDr4x5my/FHK4Yot55xRpyevxS0Ph3Zc6Mp
	 RXPQZ00o2+r6pr2zy4pHOvh8pisrFVA2gfuUsMcnz+JdqQsTrAnKxSHQooQuwZSXs32es
	 A8K/Nm0IQczTzDXqm77N5xlBxPn2q3vJ1dVSgtZ0gZ62afY5ewhvNNM/nSdD+B/MghQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqEfwrk5;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4369A606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 19:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4369A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqEfwrk5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794080933; x=1825616933;
  h=date:from:to:cc:subject:message-id;
  bh=XkCZN0Z9wCv6/V43MCKNwNu5B7uHiP4r6V1Nbdz9zDw=;
  b=EqEfwrk5M2I2TnWytaZHa33ozw5bBlYDKErdS2p5Flz0QZPi9EUCZEnU
   JYrQQFy4AMcA8XZD96cUvmo3rDiFmuBqrvA7xpuEDvaH3p2xzuwdX6afp
   GcBEGET5BqWDESPeFU2x40wP36AX4CFKELHAILNIpQM4A5DBUpvuc4uMJ
   4GYSFaa1LmXdazABkWZ2VkXHT1AtT7l34SLr2QGdHZ5Qcp/rSgW4Y/IM0
   oUm7qiHO1Bzmlw06wXV/YE9HlZnnvyibN1gXzFzpLhi+7HnIcZkJC+hmb
   gxCMytTXpk0uV9PY5ZfhRjuEmjtsEJPgqXlKQp3EK6G4QA9hWpTRMLu/i
   w==;
X-CSE-ConnectionGUID: LxkzyOxJTLqw8ekE7p18bA==
X-CSE-MsgGUID: /nip3Zi9Qbylk0Q5+gjWjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2879768"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2879768"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 11:48:52 -0800
X-CSE-ConnectionGUID: QeB3HsNVRSWWN7b+K/uFKw==
X-CSE-MsgGUID: 3ecUfNVeSxSNPkgql5mu1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7402412"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2026 11:48:51 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPmPA-00000000AmR-31qL;
	Sat, 07 Nov 2026 19:48:48 +0000
Date: Sat, 07 Nov 2026 20:47:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-5.15 53/53] vec-syscfg.c:24:9:
 warning: "ARRAY_SIZE" redefined
Message-ID: <202611072047.QzF5UC6t-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Shuah,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   1a375345fc11dcaa5d3c779b6de76b8ca9d934d1
commit: c9e52db90031b7a89bf667057df5ca9c25cd68ff [53/53] tools: fix ARRAY_SIZE defines in tools and selftests hdrs
:::::: branch date: 19 hours ago
:::::: commit date: 3 years, 9 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261107/202611072047.QzF5UC6t-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072047.QzF5UC6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611072047.QzF5UC6t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vec-syscfg.c:24:9: warning: "ARRAY_SIZE" redefined
      24 | #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
         |         ^~~~~~~~~~
   In file included from vec-syscfg.c:21:
   ../../kselftest.h:52:9: note: this is the location of the previous definition
      52 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |         ^~~~~~~~~~
   vec-syscfg.c: In function 'get_child_rdvl':
   vec-syscfg.c:112:33: warning: too many arguments for format [-Wformat-extra-args]
     112 |                 fprintf(stderr, "execl(%s) failed: %d\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   vec-syscfg.c: At top level:
   vec-syscfg.c:326:13: warning: 'prctl_set_same' defined but not used [-Wunused-function]
     326 | static void prctl_set_same(struct vec_data *data)
         |             ^~~~~~~~~~~~~~
   vec-syscfg.c: In function 'file_write_integer':
   vec-syscfg.c:195:12: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     195 |         if (ret < 0) {
         |            ^
   vec-syscfg.c:183:13: note: 'ret' was declared here
     183 |         int ret;
         |             ^~~
--
>> vec-syscfg.c:24:9: warning: "ARRAY_SIZE" redefined
      24 | #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
         |         ^~~~~~~~~~
   In file included from vec-syscfg.c:21:
   ../../kselftest.h:52:9: note: this is the location of the previous definition
      52 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |         ^~~~~~~~~~
   vec-syscfg.c: In function 'get_child_rdvl':
   vec-syscfg.c:112:33: warning: too many arguments for format [-Wformat-extra-args]
     112 |                 fprintf(stderr, "execl(%s) failed: %d\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   vec-syscfg.c: At top level:
   vec-syscfg.c:326:13: warning: 'prctl_set_same' defined but not used [-Wunused-function]
     326 | static void prctl_set_same(struct vec_data *data)
         |             ^~~~~~~~~~~~~~
   vec-syscfg.c: In function 'file_write_integer':
   vec-syscfg.c:195:12: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     195 |         if (ret < 0) {
         |            ^
   vec-syscfg.c:183:13: note: 'ret' was declared here
     183 |         int ret;
         |             ^~~
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: /tmp/ccVVhx2c.o:(.data.rel+0x20): undefined reference to `rdvl_sve'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
