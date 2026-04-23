Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B1C25A354
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Apr 2026 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776964434; cv=none; b=eAGeIv2Cyk3piEW0aPYck/SW+XxNF+VMNoTv/oNTn30Dq4d9BIvW544mffTRA2rlmDgy3/0S4sQ/2csEQgYCePOdxCRq2COTrLtMFmAAGAu4mF3pcteU2WtN9GlWKG2tHo353PdzKM2u1USNIlboY3FLGPSW4OdBBR1OdNBrp6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776964434; c=relaxed/simple;
	bh=sAgQmwFudcXSMZpyLbN+YFTkZUQkDLsfF8yLXAgSEyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MTKHwvYPQ2wuBFRxbi5MFzzmk+HobTXl/R3xSk1gfMTruWaSckP9iqUw52F4LeIkSlJx6amhKhM+L5RPuvep25eGEnTkRlbXQVq8rBoupPDLHo+meJDOraeNRnTnEn7JPt1wYCANkZ0hOeKEjw89UdAZRXGH7sCT4dZdSOPqRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqvsHxJK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqvsHxJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776964432; x=1808500432;
  h=date:from:to:cc:subject:message-id;
  bh=sAgQmwFudcXSMZpyLbN+YFTkZUQkDLsfF8yLXAgSEyc=;
  b=DqvsHxJKg2spMkBDd15fF+bPgM9uzWKH9QIlmbk/nq+T2n2SdZSGDzPa
   0Ln/y8zy4G3wMzJqhc9YQhz3V+72qajYYJtTojD/WxsIXSbIN6UX56StX
   c6sQf+R4kqwEKFq0H1ufn5y08s3JuBypUzcPBtdTvP6B0SZN/cHcX1ktX
   aogXR5Y4HVfq9R5/N1XyC4swShf1r8pnIqZrISK2i9/BOqkuDEVbDYIUX
   Jh3xbPAOdUAlMDR1NRNglm+CrkGeQ0gAFGxklJVVnPgi+8CQpd0DP/Hpm
   wEp4dO+5b31TseGVFxL7kVQQtLgeRYrON584aFbqZV8UoC0PIxv1J/L3j
   A==;
X-CSE-ConnectionGUID: eqaBmCEgQYq42f4oq4fxgg==
X-CSE-MsgGUID: oRYeiEWZTdmuLEfBikWnng==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="76972573"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="76972573"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 10:13:51 -0700
X-CSE-ConnectionGUID: ah+W/2HgSOOmRK+o5OmJPg==
X-CSE-MsgGUID: FkZwWxz0SCKcQN74EZaEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="231682943"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 23 Apr 2026 10:13:50 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFxcZ-0000000031r-3gil;
	Thu, 23 Apr 2026 17:13:47 +0000
Date: Thu, 23 Apr 2026 19:13:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: openat2_test.c:59:34: error: invalid application of 'sizeof'
 to incomplete type 'struct open_how'
Message-ID: <202604231922.tqSj8shv-lkp@intel.com>
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
TO: Jori Koolstra <jkoolstra@xs4all.nl>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jori-Koolstra/selftest-add-tests-for-O_EMPTYPATH/20260423-101051
head:   ac96d3c2c8ba4cf10aa48078dc5ab2ffd791d79d
commit: ac96d3c2c8ba4cf10aa48078dc5ab2ffd791d79d selftest: add tests for O_EMPTYPATH
date:   15 hours ago
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260423/202604231922.tqSj8shv-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604231922.tqSj8shv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604231922.tqSj8shv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from openat2_test.c:19:
>> helpers.h:30:33: warning: 'struct open_how' declared inside parameter list will not be visible outside of this definition or declaration
      30 | bool needs_openat2(const struct open_how *how);
         |                                 ^~~~~~~~
   helpers.h:63:51: warning: 'struct open_how' declared inside parameter list will not be visible outside of this definition or declaration
      63 | int sys_openat2(int dfd, const char *path, struct open_how *how);
         |                                                   ^~~~~~~~
   helpers.h:64:50: warning: 'struct open_how' declared inside parameter list will not be visible outside of this definition or declaration
      64 | int sys_openat(int dfd, const char *path, struct open_how *how);
         |                                                  ^~~~~~~~
>> openat2_test.c:33:25: error: field 'inner' has incomplete type
      33 |         struct open_how inner;
         |                         ^~~~~
   openat2_test.c: In function 'test_openat2_struct':
>> openat2_test.c:58:19: error: field name not in record or union initializer
      58 |                   .arg.inner.flags = O_RDONLY,
         |                   ^
   openat2_test.c:58:19: note: (near initialization for 'tests[0].arg')
>> openat2_test.c:59:34: error: invalid application of 'sizeof' to incomplete type 'struct open_how'
      59 |                   .size = sizeof(struct open_how) },
         |                                  ^~~~~~
   openat2_test.c:62:19: error: field name not in record or union initializer
      62 |                   .arg.inner.flags = O_RDONLY,
         |                   ^
   openat2_test.c:62:19: note: (near initialization for 'tests[1].arg')
   openat2_test.c:69:19: error: field name not in record or union initializer
      69 |                   .arg.inner.flags = O_RDONLY, .size = 0, .err = -EINVAL },
         |                   ^
   openat2_test.c:69:19: note: (near initialization for 'tests[2].arg')
   openat2_test.c:71:19: error: field name not in record or union initializer
      71 |                   .arg.inner.flags = O_RDONLY,
         |                   ^
   openat2_test.c:71:19: note: (near initialization for 'tests[3].arg')
   openat2_test.c:76:19: error: field name not in record or union initializer
      76 |                   .arg.inner.flags = O_RDONLY, .arg.extra1 = 0xdeadbeef,
         |                   ^
   openat2_test.c:76:19: note: (near initialization for 'tests[4].arg')
   openat2_test.c:79:19: error: field name not in record or union initializer
      79 |                   .arg.inner.flags = O_RDONLY, .arg.extra2 = 0xfeedcafe,
         |                   ^
   openat2_test.c:79:19: note: (near initialization for 'tests[5].arg')
   openat2_test.c:82:19: error: field name not in record or union initializer
      82 |                   .arg.inner.flags = O_RDONLY, .arg.extra3 = 0xabad1dea,
         |                   ^
   openat2_test.c:82:19: note: (near initialization for 'tests[6].arg')
>> helpers.h:21:47: error: negative width in bit-field '<anonymous>'
      21 | #define BUILD_BUG_ON(e) ((void)(sizeof(struct { int:(-!!(e)); })))
         |                                               ^
   openat2_test.c:87:9: note: in expansion of macro 'BUILD_BUG_ON'
      87 |         BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_OPENAT2_STRUCT_TESTS);
         |         ^~~~~~~~~~~~
   openat2_test.c: At top level:
>> openat2_test.c:159:25: error: field 'how' has incomplete type
     159 |         struct open_how how;
         |                         ^~~
   openat2_test.c: In function 'test_openat2_flags':
   openat2_test.c:170:19: error: field name not in record or union initializer
     170 |                   .how.flags = O_TMPFILE | O_PATH | O_RDWR, .err = -EINVAL },
         |                   ^
   openat2_test.c:170:19: note: (near initialization for 'tests[0]')
   openat2_test.c:172:19: error: field name not in record or union initializer
     172 |                   .how.flags = O_TMPFILE | O_CREAT | O_RDWR, .err = -EINVAL },
         |                   ^
   openat2_test.c:172:19: note: (near initialization for 'tests[1]')
   openat2_test.c:176:19: error: field name not in record or union initializer
     176 |                   .how.flags = O_PATH | O_CLOEXEC },
         |                   ^
   openat2_test.c:176:19: note: (near initialization for 'tests[2]')
   openat2_test.c:178:19: error: field name not in record or union initializer
     178 |                   .how.flags = O_PATH | O_DIRECTORY },
         |                   ^
   openat2_test.c:178:19: note: (near initialization for 'tests[3]')
   openat2_test.c:180:19: error: field name not in record or union initializer
     180 |                   .how.flags = O_PATH | O_NOFOLLOW },
         |                   ^
   openat2_test.c:180:19: note: (near initialization for 'tests[4]')
   openat2_test.c:183:19: error: field name not in record or union initializer
     183 |                   .how.flags = O_PATH | O_RDWR, .err = -EINVAL },
         |                   ^
   openat2_test.c:183:19: note: (near initialization for 'tests[5]')
   openat2_test.c:185:19: error: field name not in record or union initializer
     185 |                   .how.flags = O_PATH | O_CREAT, .err = -EINVAL },
         |                   ^
   openat2_test.c:185:19: note: (near initialization for 'tests[6]')
   openat2_test.c:187:19: error: field name not in record or union initializer
     187 |                   .how.flags = O_PATH | O_EXCL, .err = -EINVAL },
         |                   ^
   openat2_test.c:187:19: note: (near initialization for 'tests[7]')
   openat2_test.c:189:19: error: field name not in record or union initializer
     189 |                   .how.flags = O_PATH | O_NOCTTY, .err = -EINVAL },
         |                   ^
   openat2_test.c:189:19: note: (near initialization for 'tests[8]')
   openat2_test.c:191:19: error: field name not in record or union initializer
     191 |                   .how.flags = O_PATH | O_DIRECT, .err = -EINVAL },
         |                   ^
   openat2_test.c:191:19: note: (near initialization for 'tests[9]')
   openat2_test.c:193:19: error: field name not in record or union initializer
     193 |                   .how.flags = O_PATH | O_LARGEFILE, .err = -EINVAL },
         |                   ^
   openat2_test.c:193:19: note: (near initialization for 'tests[10]')
   openat2_test.c:197:19: error: field name not in record or union initializer
     197 |                   .how.flags = O_RDONLY, .how.mode = 0600, .err = -EINVAL },
         |                   ^
   openat2_test.c:197:19: note: (near initialization for 'tests[11]')
   openat2_test.c:197:42: error: field name not in record or union initializer
     197 |                   .how.flags = O_RDONLY, .how.mode = 0600, .err = -EINVAL },
         |                                          ^
   openat2_test.c:197:42: note: (near initialization for 'tests[11]')
   openat2_test.c:199:19: error: field name not in record or union initializer
     199 |                   .how.flags = O_PATH,   .how.mode = 0600, .err = -EINVAL },
         |                   ^
   openat2_test.c:199:19: note: (near initialization for 'tests[12]')
   openat2_test.c:199:42: error: field name not in record or union initializer
     199 |                   .how.flags = O_PATH,   .how.mode = 0600, .err = -EINVAL },
         |                                          ^
   openat2_test.c:199:42: note: (near initialization for 'tests[12]')
   openat2_test.c:201:19: error: field name not in record or union initializer
     201 |                   .how.flags = O_CREAT,  .how.mode = 0600 },
         |                   ^
   openat2_test.c:201:19: note: (near initialization for 'tests[13]')
   openat2_test.c:201:42: error: field name not in record or union initializer
     201 |                   .how.flags = O_CREAT,  .how.mode = 0600 },
         |                                          ^
   openat2_test.c:201:42: note: (near initialization for 'tests[13]')
   openat2_test.c:203:19: error: field name not in record or union initializer
     203 |                   .how.flags = O_TMPFILE | O_RDWR, .how.mode = 0600 },
         |                   ^
   openat2_test.c:203:19: note: (near initialization for 'tests[14]')
   openat2_test.c:203:52: error: field name not in record or union initializer
     203 |                   .how.flags = O_TMPFILE | O_RDWR, .how.mode = 0600 },
         |                                                    ^
   openat2_test.c:203:52: note: (near initialization for 'tests[14]')
   openat2_test.c:206:19: error: field name not in record or union initializer
     206 |                   .how.flags = O_CREAT,
         |                   ^
   openat2_test.c:206:19: note: (near initialization for 'tests[15]')
   openat2_test.c:207:19: error: field name not in record or union initializer
     207 |                   .how.mode = 0xFFFF, .err = -EINVAL },
         |                   ^
   openat2_test.c:207:19: note: (near initialization for 'tests[15]')
   openat2_test.c:209:19: error: field name not in record or union initializer
     209 |                   .how.flags = O_CREAT,
         |                   ^
   openat2_test.c:209:19: note: (near initialization for 'tests[16]')
   openat2_test.c:210:19: error: field name not in record or union initializer
     210 |                   .how.mode = 0xC000000000000000ULL, .err = -EINVAL },
         |                   ^
   openat2_test.c:210:19: note: (near initialization for 'tests[16]')
   openat2_test.c:212:19: error: field name not in record or union initializer
     212 |                   .how.flags = O_TMPFILE | O_RDWR,
         |                   ^
   openat2_test.c:212:19: note: (near initialization for 'tests[17]')
   openat2_test.c:213:19: error: field name not in record or union initializer
     213 |                   .how.mode = 0x1337, .err = -EINVAL },
         |                   ^
   openat2_test.c:213:19: note: (near initialization for 'tests[17]')
   openat2_test.c:215:19: error: field name not in record or union initializer
     215 |                   .how.flags = O_TMPFILE | O_RDWR,
         |                   ^
   openat2_test.c:215:19: note: (near initialization for 'tests[18]')
   openat2_test.c:216:19: error: field name not in record or union initializer
     216 |                   .how.mode = 0x0000A00000000000ULL, .err = -EINVAL },
         |                   ^
   openat2_test.c:216:19: note: (near initialization for 'tests[18]')
   openat2_test.c:220:19: error: field name not in record or union initializer
     220 |                   .how.flags = O_RDONLY,
         |                   ^
   openat2_test.c:220:19: note: (near initialization for 'tests[19]')
   openat2_test.c:221:19: error: field name not in record or union initializer
     221 |                   .how.resolve = RESOLVE_BENEATH | RESOLVE_IN_ROOT,
         |                   ^
   openat2_test.c:221:19: note: (near initialization for 'tests[19]')
>> openat2_test.c:221:34: error: 'RESOLVE_BENEATH' undeclared (first use in this function)
     221 |                   .how.resolve = RESOLVE_BENEATH | RESOLVE_IN_ROOT,
         |                                  ^~~~~~~~~~~~~~~
   openat2_test.c:221:34: note: each undeclared identifier is reported only once for each function it appears in
>> openat2_test.c:221:52: error: 'RESOLVE_IN_ROOT' undeclared (first use in this function)
     221 |                   .how.resolve = RESOLVE_BENEATH | RESOLVE_IN_ROOT,
         |                                                    ^~~~~~~~~~~~~~~
   openat2_test.c:226:19: error: field name not in record or union initializer
     226 |                   .how.flags = O_RDONLY,
         |                   ^
   openat2_test.c:226:19: note: (near initialization for 'tests[20]')
   openat2_test.c:227:19: error: field name not in record or union initializer
     227 |                   .how.resolve = 0x1337, .err = -EINVAL },
         |                   ^
   openat2_test.c:227:19: note: (near initialization for 'tests[20]')
   openat2_test.c:229:19: error: field name not in record or union initializer
     229 |                   .how.flags = O_CREAT,
         |                   ^
   openat2_test.c:229:19: note: (near initialization for 'tests[21]')
   openat2_test.c:230:19: error: field name not in record or union initializer
     230 |                   .how.resolve = 0x1337, .err = -EINVAL },
         |                   ^
   openat2_test.c:230:19: note: (near initialization for 'tests[21]')
   openat2_test.c:232:19: error: field name not in record or union initializer
     232 |                   .how.flags = O_TMPFILE | O_RDWR,
         |                   ^
   openat2_test.c:232:19: note: (near initialization for 'tests[22]')
   openat2_test.c:233:19: error: field name not in record or union initializer
     233 |                   .how.resolve = 0x1337, .err = -EINVAL },
         |                   ^
   openat2_test.c:233:19: note: (near initialization for 'tests[22]')
   openat2_test.c:235:19: error: field name not in record or union initializer
     235 |                   .how.flags = O_PATH,
         |                   ^
   openat2_test.c:235:19: note: (near initialization for 'tests[23]')
   openat2_test.c:236:19: error: field name not in record or union initializer
     236 |                   .how.resolve = 0x1337, .err = -EINVAL },
         |                   ^
   openat2_test.c:236:19: note: (near initialization for 'tests[23]')
   openat2_test.c:240:19: error: field name not in record or union initializer
     240 |                   .how.flags = O_RDONLY | (1ULL << 63),
         |                   ^
   openat2_test.c:240:19: note: (near initialization for 'tests[24]')
   openat2_test.c:241:19: error: field name not in record or union initializer
     241 |                   .how.resolve = 0, .err = -EINVAL },
         |                   ^
   openat2_test.c:241:19: note: (near initialization for 'tests[24]')
>> helpers.h:21:47: error: negative width in bit-field '<anonymous>'
      21 | #define BUILD_BUG_ON(e) ((void)(sizeof(struct { int:(-!!(e)); })))
         |                                               ^
   openat2_test.c:244:9: note: in expansion of macro 'BUILD_BUG_ON'
     244 |         BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_OPENAT2_FLAG_TESTS);
         |         ^~~~~~~~~~~~
   In file included from helpers.c:15:
>> helpers.h:30:33: warning: 'struct open_how' declared inside parameter list will not be visible outside of this definition or declaration
      30 | bool needs_openat2(const struct open_how *how);
         |                                 ^~~~~~~~
   helpers.h:63:51: warning: 'struct open_how' declared inside parameter list will not be visible outside of this definition or declaration
      63 | int sys_openat2(int dfd, const char *path, struct open_how *how);
         |                                                   ^~~~~~~~
   helpers.h:64:50: warning: 'struct open_how' declared inside parameter list will not be visible outside of this definition or declaration
      64 | int sys_openat(int dfd, const char *path, struct open_how *how);
         |                                                  ^~~~~~~~
>> helpers.c:17:33: warning: 'struct open_how' declared inside parameter list will not be visible outside of this definition or declaration
      17 | bool needs_openat2(const struct open_how *how)
         |                                 ^~~~~~~~
>> helpers.c:17:6: error: conflicting types for 'needs_openat2'; have '_Bool(const struct open_how *)'
      17 | bool needs_openat2(const struct open_how *how)
         |      ^~~~~~~~~~~~~
   helpers.h:30:6: note: previous declaration of 'needs_openat2' with type '_Bool(const struct open_how *)'
      30 | bool needs_openat2(const struct open_how *how);
         |      ^~~~~~~~~~~~~
   helpers.c: In function 'needs_openat2':
>> helpers.c:19:19: error: invalid use of undefined type 'const struct open_how'
      19 |         return how->resolve != 0;
         |                   ^~
   helpers.c: At top level:
   helpers.c:28:51: warning: 'struct open_how' declared inside parameter list will not be visible outside of this definition or declaration
      28 | int sys_openat2(int dfd, const char *path, struct open_how *how)
         |                                                   ^~~~~~~~
>> helpers.c:28:5: error: conflicting types for 'sys_openat2'; have 'int(int,  const char *, struct open_how *)'
      28 | int sys_openat2(int dfd, const char *path, struct open_how *how)
         |     ^~~~~~~~~~~
   helpers.h:63:5: note: previous declaration of 'sys_openat2' with type 'int(int,  const char *, struct open_how *)'
      63 | int sys_openat2(int dfd, const char *path, struct open_how *how);
         |     ^~~~~~~~~~~
   helpers.c: In function 'sys_openat2':
>> helpers.c:30:50: error: invalid application of 'sizeof' to incomplete type 'struct open_how'
      30 |         return raw_openat2(dfd, path, how, sizeof(*how));
         |                                                  ^
   helpers.c: At top level:
   helpers.c:33:50: warning: 'struct open_how' declared inside parameter list will not be visible outside of this definition or declaration
      33 | int sys_openat(int dfd, const char *path, struct open_how *how)
         |                                                  ^~~~~~~~
>> helpers.c:33:5: error: conflicting types for 'sys_openat'; have 'int(int,  const char *, struct open_how *)'
      33 | int sys_openat(int dfd, const char *path, struct open_how *how)
         |     ^~~~~~~~~~
   helpers.h:64:5: note: previous declaration of 'sys_openat' with type 'int(int,  const char *, struct open_how *)'
      64 | int sys_openat(int dfd, const char *path, struct open_how *how);
         |     ^~~~~~~~~~
   helpers.c: In function 'sys_openat':
>> helpers.c:35:40: error: invalid use of undefined type 'struct open_how'
      35 |         int ret = openat(dfd, path, how->flags, how->mode);
         |                                        ^~
   helpers.c:35:52: error: invalid use of undefined type 'struct open_how'
      35 |         int ret = openat(dfd, path, how->flags, how->mode);
         |                                                    ^~
   helpers.c: In function 'init':
>> helpers.c:98:16: error: variable 'how' has initializer but incomplete type
      98 |         struct open_how how = {};
         |                ^~~~~~~~
>> helpers.c:98:25: error: storage size of 'how' isn't known
      98 |         struct open_how how = {};
         |                         ^~~
   helpers.c:101:29: error: invalid application of 'sizeof' to incomplete type 'struct open_how'
     101 |         BUILD_BUG_ON(sizeof(struct open_how) != OPEN_HOW_SIZE_VER0);
         |                             ^~~~~~
   helpers.h:21:58: note: in definition of macro 'BUILD_BUG_ON'
      21 | #define BUILD_BUG_ON(e) ((void)(sizeof(struct { int:(-!!(e)); })))
         |                                                          ^
>> helpers.h:21:47: error: bit-field '<anonymous>' width not an integer constant
      21 | #define BUILD_BUG_ON(e) ((void)(sizeof(struct { int:(-!!(e)); })))
         |                                               ^
   helpers.c:101:9: note: in expansion of macro 'BUILD_BUG_ON'
     101 |         BUILD_BUG_ON(sizeof(struct open_how) != OPEN_HOW_SIZE_VER0);
         |         ^~~~~~~~~~~~
   helpers.c:98:25: warning: unused variable 'how' [-Wunused-variable]
      98 |         struct open_how how = {};
         |                         ^~~
   helpers.c: In function 'needs_openat2':
   helpers.c:20:1: warning: control reaches end of non-void function [-Wreturn-type]
      20 | }
         | ^
   helpers.c: In function 'sys_openat2':
   helpers.c:31:1: warning: control reaches end of non-void function [-Wreturn-type]
      31 | }
         | ^
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
