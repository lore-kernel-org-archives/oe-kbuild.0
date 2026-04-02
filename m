Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4A0228CB0
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775090357; cv=none; b=mdQXEOYunbSKULMZw50k3OX3ItdDLYshxJ6rsaEo8oC0CcHnWAVAyGI/zU3RhwnCXixDgWPwfh1zboc38LN3QDTMGY1X85MEwXR9vqbHO58jtTMT6Qe/QZEZVdSnIbQjbZqC33oRkn+RKx3vskrS8tSTqsNNOl5cZ/HrisxS8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775090357; c=relaxed/simple;
	bh=3mldGdO3eUUqFve9DVr3K9w4/3bwAM57SOT2WzPu8wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qn1HjBQCKupp8n699Wkii1VMBOash6AgDQVoLAW2zd90bg5Qytp5hzWPjfEFKAGNWJipDMNOQW5ge3Df84MWKim2aczEv1/o7qaF9NIbPa0Ty/vLSjlj1Q7V9fw0jxYCCOs6nK9X/YJt01XOxpsttMHshT3+WqiuhanBkR2jQYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDhky3jf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDhky3jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775090354; x=1806626354;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3mldGdO3eUUqFve9DVr3K9w4/3bwAM57SOT2WzPu8wg=;
  b=FDhky3jfJRDqCKPoFOsSX8oKLLv/HEb9e6quwzXoy7l/ysOu8kVE0ARH
   wNCPlYNoo2Qkc32dAhFbbdSvCmy3FqbVZdv0kww6XDjm3ronQzW+bueuO
   p4JnjJ+GW70bdqkkR4N4EM+JiE2lXLS4vIx8hmffDMMpiQ5tFvuzn0ats
   UQGnwsVRUlK6pWSSbO4ZLfkK/4XtsKfYJMD8P7adXV+xZP2BwHnyZkwOw
   UolTDsWQ4y2OJiYHiX9i58DREp+fGY6M4R4e7Bur2QZfhR7Tp2UJxY+1a
   A2LCoSs6kKw6vEoYhIvYNZLDuj4m5mcXA9GtZL/LPeCFHazawyHk6fXqN
   w==;
X-CSE-ConnectionGUID: Oh0pd6UnSEOW1pxjFJu3jw==
X-CSE-MsgGUID: JhCWCemvQK+HzGprgfnqgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86760065"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="86760065"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 17:39:13 -0700
X-CSE-ConnectionGUID: GoATd3aFTcKHwOmaiwy3oQ==
X-CSE-MsgGUID: 8ORFqsrsSpSt9Nj/H5TpLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="223952639"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 01 Apr 2026 17:39:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w865W-000000008tp-2G5W;
	Thu, 02 Apr 2026 00:39:10 +0000
Date: Thu, 02 Apr 2026 02:38:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mic:next 4/19] audit.h:354:42: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 4 has type
 '__u64' {aka 'long unsigned int'}
Message-ID: <202604020206.62zgOTeP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   e64b5bb393de35f8a63351bf96f8e4bb1975f5cc
commit: 608d0288d7b32882578cf4d686ab64873c9a1a52 [4/19] selftests/landlock:=
 Skip stale records in audit_match_record()
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20260402/202604020206.62zgOTeP-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260402/202604020206.62zgOTeP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604020206.62zgOTeP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs_test.c:44:
   audit.h: In function 'matches_log_domain_deallocated':
>> audit.h:354:42: warning: format '%llx' expects argument of type 'long lo=
ng unsigned int', but argument 4 has type '__u64' {aka 'long unsigned int'}=
 [-Wformat=3D]
     354 |                                          log_template_with_id,
         |                                          ^~~~~~~~~~~~~~~~~~~~
     355 |                                          expected_domain_id, num=
_denials);
         |                                          ~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          __u64 {aka long unsigne=
d int}
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gn=
u/bin/ld: cannot find -lcap: No such file or directory
   collect2: error: ld returned 1 exit status
--
   In file included from audit_test.c:21:
   audit.h: In function 'matches_log_domain_deallocated':
>> audit.h:354:42: warning: format '%llx' expects argument of type 'long lo=
ng unsigned int', but argument 4 has type '__u64' {aka 'long unsigned int'}=
 [-Wformat=3D]
     354 |                                          log_template_with_id,
         |                                          ^~~~~~~~~~~~~~~~~~~~
     355 |                                          expected_domain_id, num=
_denials);
         |                                          ~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          __u64 {aka long unsigne=
d int}
   In file included from common.h:20,
                    from audit_test.c:22:
   audit_test.c: In function 'audit_layers':
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:116:40: warning: format '%llx' expects argument of type 'long long uns=
igned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wfo=
rmat=3D]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   audit_test.c:155:25: note: in expansion of macro 'TH_LOG'
     155 |                         TH_LOG("Failed to match domain %llx (#%d=
)",
         |                         ^~~~~~
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gn=
u/bin/ld: cannot find -lcap: No such file or directory
   collect2: error: ld returned 1 exit status
--
   In file included from net_test.c:23:
   audit.h: In function 'matches_log_domain_deallocated':
>> audit.h:354:42: warning: format '%llx' expects argument of type 'long lo=
ng unsigned int', but argument 4 has type '__u64' {aka 'long unsigned int'}=
 [-Wformat=3D]
     354 |                                          log_template_with_id,
         |                                          ^~~~~~~~~~~~~~~~~~~~
     355 |                                          expected_domain_id, num=
_denials);
         |                                          ~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          __u64 {aka long unsigne=
d int}
   In file included from common.h:20,
                    from net_test.c:24:
   net_test.c: In function 'mini_network_access_rights':
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:116:40: warning: format '%llx' expects argument of type 'long long uns=
igned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wfo=
rmat=3D]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harne=
ss.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   net_test.c:1358:25: note: in expansion of macro 'TH_LOG'
    1358 |                         TH_LOG("Failed to add rule with access 0=
x%llx: %s",
         |                         ^~~~~~
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gn=
u/bin/ld: cannot find -lcap: No such file or directory
   collect2: error: ld returned 1 exit status

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
