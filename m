Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A301943147
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205900; cv=none; b=BYDlfQrEl9B6q1P+iQbOmQQcUlPlh8iqrIYQ7WwgV0HaQ4CygHQuc/TzSUi7UaDZSPsJOlleKVoQoodPxOAMHyZxGWbD8oAB15NC9uoPM/DxPxAGksnSXMQriZ5e4cpEbw0gKEbPDTgZTvjZr/dGCR5Q3grYLcMQUP4sqk3sUb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205900; c=relaxed/simple;
	bh=vXa/qgjYZj407yjXfK4Si9Ktk+9/FoIXZVINlWPl5kc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k4sL6ShYFmTJCptm+BnpsfOjxkb/KnaVixJIvwBT/RnDXPIiN6Uae4XK/wESd2K3SpOUtXZH7++auh6SCOyvlmxbUOSsYCDb9cDcERlKm56IiwjjB0cXDQmibEOE913DtLYMwnfWRltKjNDfnlnIjyjbBJ17ai80F4j/gzlF31o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0otiBYt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0otiBYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205899; x=1806741899;
  h=date:from:to:cc:subject:message-id;
  bh=vXa/qgjYZj407yjXfK4Si9Ktk+9/FoIXZVINlWPl5kc=;
  b=b0otiBYtjABUsmzRJ5aRXuVHXoAnyu0JHs72YCEcgaSIQVilsemMoNX7
   qR2X57jCF08SuxSdA4zL8C8G45kz0lMGBrdRU5nUAXSoz1mU/5hoVHaAv
   T2/gzMQlbG2BifnLDGSDdb/fIm5lYbztNN5sieQzACM8AIB6St1PQPfnb
   bSpVqjR2Ipy5swBikvErxEJZsgSZd/16TfPgIY4rGTMZI2J6KVQ3SkWil
   9+OpfkeYsQhSoJ3lf7p9/dWmDwOD6DoNwOfLzcHUAHrVZXaRfnFDuMi3w
   q9EfG+2/J8b9yqfm8aFSa8c30U2IcwCyBL4gESSO7mBl8VZmadaQCKUSO
   g==;
X-CSE-ConnectionGUID: ZTbRTn9LQWaxEMbMmqkX8w==
X-CSE-MsgGUID: BBPFNnaYRt62K6blw+lIEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86974165"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86974165"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:44:59 -0700
X-CSE-ConnectionGUID: eTs4Hp+vSIORerizmIOAKw==
X-CSE-MsgGUID: viJ1OGWrSSyNLuso+delWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228834577"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 01:44:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015V-1U0L;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 03 Apr 2026 16:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10338/10705]
 tools/testing/selftests/kselftest.h:427:13: error: implicit declaration of
 function 'vasprintf'; did you mean 'vsprintf'?
Message-ID: <202604030814.5B6AanyA-lkp@intel.com>
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
TO: Chunyu Hu <chuhu@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd0f139e5fc11182777b81cefc3893ea508544ec
commit: cc0b04b10a7b98fd8df2fd539177e94e0f83a5c3 [10338/10705] selftests: ksft_exit_fail_perror: support printf style arguments
:::::: branch date: 34 hours ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260403/202604030814.5B6AanyA-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030814.5B6AanyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604030814.5B6AanyA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from za-fork.c:12:
   ../../kselftest.h: In function 'ksft_exit_fail_perror':
>> ../../kselftest.h:427:13: error: implicit declaration of function 'vasprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
     427 |         if (vasprintf(&buf, msg, args) == -1) {
         |             ^~~~~~~~~
         |             vsprintf
--
   In file included from basic-gcs.c:16:
   tools/testing/selftests/kselftest.h: In function 'ksft_exit_fail_perror':
>> tools/testing/selftests/kselftest.h:427:13: error: implicit declaration of function 'vasprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
     427 |         if (vasprintf(&buf, msg, args) == -1) {
         |             ^~~~~~~~~
         |             vsprintf


vim +427 tools/testing/selftests/kselftest.h

b6a4b66d845ae4 Paul Elder           2017-06-12  419  
cc0b04b10a7b98 Chunyu Hu            2026-03-30  420  static inline __noreturn __printf(1, 2) void ksft_exit_fail_perror(const char *msg, ...)
86483f8b4e8d3e Muhammad Usama Anjum 2024-04-04  421  {
cc0b04b10a7b98 Chunyu Hu            2026-03-30  422  	va_list args;
cc0b04b10a7b98 Chunyu Hu            2026-03-30  423  	char *buf = NULL;
cc0b04b10a7b98 Chunyu Hu            2026-03-30  424  	int saved_errno = errno;
cc0b04b10a7b98 Chunyu Hu            2026-03-30  425  
cc0b04b10a7b98 Chunyu Hu            2026-03-30  426  	va_start(args, msg);
cc0b04b10a7b98 Chunyu Hu            2026-03-30 @427  	if (vasprintf(&buf, msg, args) == -1) {
cc0b04b10a7b98 Chunyu Hu            2026-03-30  428  		va_end(args);
cc0b04b10a7b98 Chunyu Hu            2026-03-30  429  		ksft_exit_fail_msg("vasprintf failed: %s (%d)\n", strerror(saved_errno),
cc0b04b10a7b98 Chunyu Hu            2026-03-30  430  				saved_errno);
cc0b04b10a7b98 Chunyu Hu            2026-03-30  431  	}
cc0b04b10a7b98 Chunyu Hu            2026-03-30  432  	va_end(args);
cc0b04b10a7b98 Chunyu Hu            2026-03-30  433  
cc0b04b10a7b98 Chunyu Hu            2026-03-30  434  	errno = saved_errno;
cc0b04b10a7b98 Chunyu Hu            2026-03-30  435  	ksft_exit_fail_msg("%s: %s (%d)\n", buf, strerror(errno), errno);
cc0b04b10a7b98 Chunyu Hu            2026-03-30  436  
cc0b04b10a7b98 Chunyu Hu            2026-03-30  437  	free(buf);
86483f8b4e8d3e Muhammad Usama Anjum 2024-04-04  438  }
86483f8b4e8d3e Muhammad Usama Anjum 2024-04-04  439  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
