Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793658350;
	b=sM8ZhgGhlzhS+s0EgpRUn2NfZybHckEiPyHWM2ufdZL/KmaBOXBmcH53NlNKXyyC5SLw
	 6cDywnAXyXsLJX8ZJQSMqwf4HU0JLw4+go+fSqcLj4fTqLulHLCoca5dyy2SK5gkLyTNH
	 vqxBRtgwdpjfVLJqZTrtET5KG0cTfwGQ+Ks5vaa+d+iiiW4kT8rU97okQ8IiVOb/6G3Wv
	 SCYzlDw9QkDgzNktoEaDft6MdpgNZgjjklalM1o9qhiyRMJnfiAl8zY1SMKAM/tQoia7s
	 yv6soWq+Uoj9DqDo7HB9v0sOz8FTiOJlIGzUTR4QDiqHDjAy8w48VLjFy5bGt7ODABQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658350;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wtC7xD+6NNUAoXLP4iMISj8k3yD4DX91l3RGBJ87shE=;
	b=sZ/WmYDh/Ct3GqGKreweZhruJV+awTWM5lHOTl/AomE1boqkZKTrlghl2Bjo1H0tu0Dk
	 9oKfhgaEzF/KpOFAVenfahcAbc7LR6HH/xEReYbpE9UF07puzIN+a2Qy44Yw2f7eiDmii
	 FUJKeJP/OWaUFZVbb4pAfFjQ9M6Mx5Zg20TldnVToV1nXQM1KcAbTXuFCG/hVPvup5t9/
	 +n6UqHUezD0p9gsU2roWbIHGIpvwNRnNKJiT0a//dX+HepPKxToU6QRnfQ4+0A3dA8RxX
	 0QFdpXAgDmOmf9OuPG+WkmMznYWTHe4eSu97M+wvvnwD+bgDoBqoVLOeQZKJNvyuUYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="VX/dtmLw";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055E606A334
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Nov 2026 22:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E055E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VX/dtmLw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793658351; x=1825194351;
  h=date:from:to:cc:subject:message-id;
  bh=elyagQWvP7jglDrfZ62c7ExGN49vpX49RQ+T20evoXM=;
  b=VX/dtmLwORRg+8hkGUwyi507Put0eWOusuJsMDoyOSrz/9GCagVeeSOi
   vernMLmlbpK8bqWcvqfffiVYF5rKlTMuXcv/8pMgsF2d4Ui0Egg+iP+1d
   vT836AXQgelWt07jT+RyvSqW/Rsl46kvyAwIaMc3COsuMD2fW6OSa1/w2
   VX5CSp66Np4YZwbtyEo0CECY1tJTGHwaYlFNS/e57z3RTjmyPwyNv0fj/
   dT/YA8BGRzUpMGhZ81BwTC5f9hZ1HOprzKlEjCc+G0W1H6Or+d4YHK7UG
   B4Xpclw5eWB/XffIx/db8n3x9DV9LvdygFpenliukonxuDaET142vloOe
   w==;
X-CSE-ConnectionGUID: 6WlUVJJHRmyzzg0qgU76+Q==
X-CSE-MsgGUID: WI3TKzw0RpKFHbKnUgR7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2251679"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2251679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:25:50 -0800
X-CSE-ConnectionGUID: BF2gLqXwRiyKMHmdQ6JSRQ==
X-CSE-MsgGUID: zUcbjqOMRDa8WI182dk+Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6582225"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Nov 2026 14:25:49 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO0TK-000000008jD-1eeN;
	Mon, 02 Nov 2026 22:25:46 +0000
Date: Mon, 02 Nov 2026 23:25:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 20/20] progs/hid.c:487:18:
 error: incompatible pointer types passing 'struct bpf_wq *' to parameter of
 type 'struct bpf_wq___not_used *'
Message-ID: <202611022352.NAKTNUj6-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e92b73070f9a9cf42236e34fdc16537c05349f91
commit: 9cd1005cecfcc92143e4c64f11864a9606038524 [20/20] selftests/hid: fix compilation when bpf_wq and hid_device are not exported
:::::: branch date: 31 hours ago
:::::: commit date: 7 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261102/202611022352.NAKTNUj6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611022352.NAKTNUj6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611022352.NAKTNUj6-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD e92b73070f9a9cf42236e34fdc16537c05349f91 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:126:12: error: conflicting types for 'bpf_wq_init'
     126 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |            ^
   tools/testing/selftests/hid/tools/include/vmlinux.h:121334:12: note: previous declaration is here
    121334 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
           |            ^
   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:127:12: error: conflicting types for 'bpf_wq_start'
     127 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |            ^
   tools/testing/selftests/hid/tools/include/vmlinux.h:121336:12: note: previous declaration is here
    121336 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
           |            ^
   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:128:12: error: conflicting types for 'bpf_wq_set_callback_impl'
     128 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |            ^
   tools/testing/selftests/hid/tools/include/vmlinux.h:121335:12: note: previous declaration is here
    121335 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq, int (*callback_fn)(void *, int *, void *), unsigned int flags, void *aux__ign) __weak __ksym;
           |            ^
>> progs/hid.c:487:18: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq___not_used *' [-Wincompatible-pointer-types]
     487 |         if (bpf_wq_init(wq, &hmap, 0) != 0)
         |                         ^~
   tools/testing/selftests/hid/tools/include/vmlinux.h:121334:39: note: passing argument to parameter 'wq' here
    121334 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
           |                                       ^
   progs/hid.c:490:26: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq___not_used *' [-Wincompatible-pointer-types]
     490 |         if (bpf_wq_set_callback(wq, wq_cb_sleepable, 0))
         |                                 ^~
   tools/testing/selftests/hid/tools/include/vmlinux.h:121335:52: note: passing argument to parameter 'wq' here
    121335 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq, int (*callback_fn)(void *, int *, void *), unsigned int flags, void *aux__ign) __weak __ksym;
           |                                                    ^
   progs/hid.c:493:19: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq___not_used *' [-Wincompatible-pointer-types]
     493 |         if (bpf_wq_start(wq, 0))
         |                          ^~
   tools/testing/selftests/hid/tools/include/vmlinux.h:121336:40: note: passing argument to parameter 'wq' here
    121336 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
           |                                        ^
   6 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
