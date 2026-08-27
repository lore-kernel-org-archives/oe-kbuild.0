Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3638DC58
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Aug 2026 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822341; cv=none; b=QxILH5qT95IZl75nDcbRltGk6ayfYHjfsY4P4Hncrn8kn2MXs/raZQrAaJ4glOYExMqWHzX7hWwK9NofRziUgXYrYZ2mRbOZjcWS/1AVzjItHiMXXz8K8cBW4AtqFae0sQLpMDMUA26TOOSs9gQtl+Y1YllNVNl8GJDm9UWrtcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822341; c=relaxed/simple;
	bh=ESfRD/T2ZZ2D5hZM9/4+hCtzLVk3M7ztI3eLIodp+QQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e9v6+3gQAXDa5p4AokaZFVnQDHmtmiXlgADWFJLMIzSfp4Xn95TeGn28OyD93K0jKiTf1ZxGG3qcQRWzyUUj0MlLmoMcHp0wO+FOnk22e8OlGpzx63FoJmuNQYzu+hErSfxKfIinadsmzXHeXhhabaGU1gWk/7EOtJcsrNk1uVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAY6ut3i; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAY6ut3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787822331; x=1819358331;
  h=date:from:to:cc:subject:message-id;
  bh=ESfRD/T2ZZ2D5hZM9/4+hCtzLVk3M7ztI3eLIodp+QQ=;
  b=UAY6ut3iw/L1hgDnijm4fi3afSTw+sCl/o68NTk7/4JZ/Bg9hHWSxuDn
   tU06/hA3QkdPKuWvLrRJ6VISiHisWndr7PicOegyDJwm0/1F8uUdnalUO
   /AmhSXuFQUjvSJ8gqYcwb6IqnL6NP5j/WjNaMt3QBbB9GT9Q39OZ3rfkT
   q6BT8a5CeZjJWkQdqeu1/ijMXeW+pqTH0/BR1C33sPNeUtBirtsieZvsV
   U+ptd7l6owqDgqkrbHBZ99/iDNr3HLspMurO70Zs2jlr5x3KMvdRYFkJj
   lx/2xTG+QIvuGzApG24Oc2V36Bd5Jlog8gDRWK0KjSZqWd9YMfMxbbcaq
   Q==;
X-CSE-ConnectionGUID: 6RfJfTJcSqy/sjw9DS86bw==
X-CSE-MsgGUID: +/m+QujtRcmMyNdSckuH1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="75859495"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="75859495"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:18:43 -0700
X-CSE-ConnectionGUID: dDtcXzR3RC6dTCRFNoHP2g==
X-CSE-MsgGUID: uSfxRFuyROScn8wDQ+AJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="267233418"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2026 02:18:43 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzWFs-000000000l3-2mrc;
	Thu, 27 Aug 2026 09:18:40 +0000
Date: Thu, 27 Aug 2026 11:17:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 254/254]
 test_cpu_identity.c:943:62: warning: 'snprintf' output may be truncated
 before the last format character
Message-ID: <202608271113.nWwO5k5V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   1cb14b8ebd706a55e3cb0251941355687e595e1d
commit: fdeec2f4f3f7d414eb7b9cf11360e7268bed1615 [254/254] anolis: tools/selftest: add cpu identity coverage
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260827/202608271113.nWwO5k5V-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271113.nWwO5k5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608271113.nWwO5k5V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   test_cpu_identity.c: In function 'test_identity_hierarchy_counts':
>> test_cpu_identity.c:943:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     943 |         snprintf(expeller_path, sizeof(expeller_path), "%s/%s", parent_path,
         |                                                              ^
   test_cpu_identity.c:943:9: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
     943 |         snprintf(expeller_path, sizeof(expeller_path), "%s/%s", parent_path,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     944 |                  strrchr(expeller, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c:945:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     945 |         snprintf(expellee_path, sizeof(expellee_path), "%s/%s", parent_path,
         |                                                              ^
   test_cpu_identity.c:945:9: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
     945 |         snprintf(expellee_path, sizeof(expellee_path), "%s/%s", parent_path,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     946 |                  strrchr(expellee, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c: In function 'run_multi_child_parent_throttle_pressure':
>> test_cpu_identity.c:1555:76: warning: '/' directive output may be truncated writing 1 byte into a region of size between 0 and 4095 [-Wformat-truncation=]
    1555 |         snprintf(throttle_parent_path, sizeof(throttle_parent_path), "%s/%s/%s",
         |                                                                            ^
   test_cpu_identity.c:1555:9: note: 'snprintf' output 3 or more bytes (assuming 4098) into a destination of size 4096
    1555 |         snprintf(throttle_parent_path, sizeof(throttle_parent_path), "%s/%s/%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1556 |                  parent_path, strrchr(normal, '/') + 1, strrchr(throttle_parent, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c:1558:72: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1558 |                 snprintf(child_paths[i], sizeof(child_paths[i]), "%s/%s",
         |                                                                        ^
   test_cpu_identity.c:1558:17: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
    1558 |                 snprintf(child_paths[i], sizeof(child_paths[i]), "%s/%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1559 |                          throttle_parent_path, strrchr(children[i], '/') + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
