Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333E10A36
	for <oe-kbuild@lists.linux.dev>; Thu,  9 May 2024 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715282364; cv=none; b=t867nM54zP5/kBm1ZGajTT7SfHDPmAmBIpO4QU6aYXGCH1sNhA0R9SQumaT9gk02oz2pFWmmJpgBK0V6N9g4VXKntWpCcbcZRZ6oNE2TkvXPMUHL7/WIQ54DA1pP7e1r6rsKpNOtB9CiB+WZOeVaH4HLvM3cMKCO+GLq/L5piUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715282364; c=relaxed/simple;
	bh=IqHgzFpPTBual6aGEHol92Ul3v7tUJf1d7+fxdSgMTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tVoUJZPdAZ5PR1rIZgjNPJ8lnAAHJiQdtpandwD3pK1cjJegst/xs2aMNB0SN5uoKDbN4k//haoykHRPfwbPsdDnbT3KL+orcA8UQF+plnGcTyDLZE9F0D7Cj4w1IKY4dWXHCEkA3qtmD0c7p0CmCAtbHso9gArSYOMt//Roci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdOU50Q0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdOU50Q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715282361; x=1746818361;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IqHgzFpPTBual6aGEHol92Ul3v7tUJf1d7+fxdSgMTw=;
  b=kdOU50Q0hBSSXBTxa9LmYLqXER2u9u4j6b2h2xRlMSBVFb5wpGgf0tDD
   Ls0VYiNDpA+2vf+AAP2k3A4egAg43zCQew9NzFBzqPT6yD3mCihdfyiNZ
   KB1ceYsRFL2W9Rdb4d+Da0bfvPnVdNabv5agwHmuyEXBw3u0WKnkc/hBl
   MqF94oxwnjXBU3jLB0gAFozUkZUqXvCp3JKxfzABNJSUrcKzLiAU7jAmb
   NAB8iP1Q9/Frg0ByifAVeIHdUzoTIOXPMOBhl9zOUMkaiEa2A4Rl7mMSN
   q9Ypc8LOt1JonzD6tkoIWgqveNi+LguSwNJhKXClsDxpwOBQbiB+sp63R
   w==;
X-CSE-ConnectionGUID: i/D3HAjaSAazubI73UmQkw==
X-CSE-MsgGUID: mgzOANoISZ+/zHgceRW6Dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21826311"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="21826311"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:19:21 -0700
X-CSE-ConnectionGUID: nAYYU5+XQfy1206ymgBM5w==
X-CSE-MsgGUID: 5onzivhbStOhkGQD1FsVYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="52544076"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2024 12:19:20 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s59IT-0005H0-2b;
	Thu, 09 May 2024 19:19:17 +0000
Date: Fri, 10 May 2024 03:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10918/12321] ../kselftest_harness.h:851:26:
 error: '_ip_local_port_range_late_bind_object' undeclared here (not in a
 function); did you mean 'ip_local_port_range_late_bind'?
Message-ID: <202405100339.vfBe0t9C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Mickaël Salaün" <mic@digikod.net>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   704ba27ac55579704ba1289392448b0c66b56258
commit: 8a25c905ae398bdd40f75cffed170516c749e7db [10918/12321] selftests/harness: Share _metadata between forked processes
:::::: branch date: 13 hours ago
:::::: commit date: 3 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100339.vfBe0t9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405100339.vfBe0t9C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ip_local_port_range.c:13:
>> ../kselftest_harness.h:851:26: error: '_ip_local_port_range_late_bind_object' undeclared here (not in a function); did you mean 'ip_local_port_range_late_bind'?
     851 |                 .test = &_##fixture_name##_##test_name##_object, \
         |                          ^
   ip_local_port_range.c:414:1: note: in expansion of macro 'XFAIL_ADD'
     414 | XFAIL_ADD(ip_local_port_range, ip4_stcp, late_bind);
         | ^~~~~~~~~


vim +851 tools/testing/selftests/net/../kselftest_harness.h

2709473c938602 Jakub Kicinski 2024-02-28  834  
2709473c938602 Jakub Kicinski 2024-02-28  835  /**
2709473c938602 Jakub Kicinski 2024-02-28  836   * XFAIL_ADD() - mark variant + test case combination as expected to fail
2709473c938602 Jakub Kicinski 2024-02-28  837   * @fixture_name: name of the fixture
2709473c938602 Jakub Kicinski 2024-02-28  838   * @variant_name: name of the variant
2709473c938602 Jakub Kicinski 2024-02-28  839   * @test_name: name of the test case
2709473c938602 Jakub Kicinski 2024-02-28  840   *
2709473c938602 Jakub Kicinski 2024-02-28  841   * Mark a combination of variant + test case for a given fixture as expected
2709473c938602 Jakub Kicinski 2024-02-28  842   * to fail. Tests marked this way will report XPASS / XFAIL return codes,
2709473c938602 Jakub Kicinski 2024-02-28  843   * instead of PASS / FAIL,and use respective counters.
2709473c938602 Jakub Kicinski 2024-02-28  844   */
2709473c938602 Jakub Kicinski 2024-02-28  845  #define XFAIL_ADD(fixture_name, variant_name, test_name) \
2709473c938602 Jakub Kicinski 2024-02-28  846  	static struct __test_xfail \
2709473c938602 Jakub Kicinski 2024-02-28  847  		_##fixture_name##_##variant_name##_##test_name##_xfail = \
2709473c938602 Jakub Kicinski 2024-02-28  848  	{ \
2709473c938602 Jakub Kicinski 2024-02-28  849  		.fixture = &_##fixture_name##_fixture_object, \
2709473c938602 Jakub Kicinski 2024-02-28  850  		.variant = &_##fixture_name##_##variant_name##_object, \
2709473c938602 Jakub Kicinski 2024-02-28 @851  		.test = &_##fixture_name##_##test_name##_object, \
2709473c938602 Jakub Kicinski 2024-02-28  852  	}; \
2709473c938602 Jakub Kicinski 2024-02-28  853  	static void __attribute__((constructor)) \
2709473c938602 Jakub Kicinski 2024-02-28  854  		_register_##fixture_name##_##variant_name##_##test_name##_xfail(void) \
2709473c938602 Jakub Kicinski 2024-02-28  855  	{ \
2709473c938602 Jakub Kicinski 2024-02-28  856  		__register_xfail(&_##fixture_name##_##variant_name##_##test_name##_xfail); \
2709473c938602 Jakub Kicinski 2024-02-28  857  	}
2709473c938602 Jakub Kicinski 2024-02-28  858  

:::::: The code at line 851 was first introduced by commit
:::::: 2709473c938602c3955b87000009e9bf3cd9bb32 selftests: kselftest_harness: support using xfail

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
