Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B680919007C
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719425545; cv=none; b=cMjcVK+6I94Sqolj4NkxT3+qducMLHNBFKqotSsL3vcw7VRcGiv5hFm09b3ChxS2F/7HMn8dga5hCXg3BTf5/nDTisL1BkhzJbpGnjDSTJ3Ss+GwDt4djcz1izALHu7UFM25gYRmZ1JGBioxxQEWtccoUWCzXAqH3nor4LNRz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719425545; c=relaxed/simple;
	bh=sM+P5c5RXI/yVJtklcJBj4F2veZFEkYLFhgbN/7NOks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UwXgkzIDQdCchP7ScHrmawzJGsKR2ZQuUkqjAahmEho4+H1S9cq/1sbrl1jTvUvBWiz4GUGaSaxqedD5hIJx+IgAiFaNRU19rVW8O0jBoEFyEn8y26F52YVDJ/2yN5Jf4/GK7uv0PU3a++ogfjQB9dr91T9lzmqFDAyrF6Be6Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0z9sHXu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0z9sHXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719425544; x=1750961544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sM+P5c5RXI/yVJtklcJBj4F2veZFEkYLFhgbN/7NOks=;
  b=R0z9sHXuyiFF/DrJqvOCY/tXB6UAPs1oULx/serRdAMuQi60MK54u7EZ
   hArzzrXqW6Q++olxc79b/LWOOhJ/8uwRwc9R8668AxJOJVm4lojEKqZpt
   xo60DvqlUlCwsIyiggecipvo5qn3SJjlkOoThAwt+lPOEH/a3ocSI+vN+
   FUoi4LsAobNLm/A/9CPzlEUn8vUj7C695KUBi9n8owYf04am6xtOAu/6y
   zQDEpAAaMQ22h69zD2aMKWbNF/0rT6xud8JlQeXPfMFqB97YrtZoZ5Ej6
   BS6gDUVPSflUr3Lyx1SnUc55TaHcuEp3vKrj7cDOgIZ1Cm1FlTTJikni/
   Q==;
X-CSE-ConnectionGUID: ygU5Dpg5SOGA7+iT83DKUA==
X-CSE-MsgGUID: jW9vJf7xSD6GK5F0LlhNLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27915384"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="27915384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 11:12:23 -0700
X-CSE-ConnectionGUID: X/gh0AK7T2yBDXVPVrvonA==
X-CSE-MsgGUID: Cvl6BB0zR0um0qOwh5e99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="43970331"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2024 11:12:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMX80-000FTK-0z;
	Wed, 26 Jun 2024 18:12:20 +0000
Date: Thu, 27 Jun 2024 02:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 net 02/11] selftest: af_unix: Add msg_oob.c.
Message-ID: <202406270118.ajdL2qcN-lkp@intel.com>
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
In-Reply-To: <20240625013645.45034-3-kuniyu@amazon.com>
References: <20240625013645.45034-3-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: Rao Shoaib <Rao.Shoaib@oracle.com>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/selftest-af_unix-Remove-test_unix_oob-c/20240626-033725
base:   net/main
patch link:    https://lore.kernel.org/r/20240625013645.45034-3-kuniyu%40amazon.com
patch subject: [PATCH v1 net 02/11] selftest: af_unix: Add msg_oob.c.
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270118.ajdL2qcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406270118.ajdL2qcN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from msg_oob.c:11:
   msg_oob.c: In function '__recvpair':
>> ../../kselftest_harness.h:119:40: warning: format '%s' expects argument of type 'char *', but argument 6 has type 'const void *' [-Wformat=]
     119 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../../kselftest_harness.h:114:17: note: in expansion of macro '__TH_LOG'
     114 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   msg_oob.c:120:17: note: in expansion of macro 'TH_LOG'
     120 |                 TH_LOG("Expected:%s", expected_errno ? strerror(expected_errno) : expected_buf);
         |                 ^~~~~~
>> ../../kselftest_harness.h:119:40: warning: format '%s' expects argument of type 'char *', but argument 6 has type 'const void *' [-Wformat=]
     119 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../../kselftest_harness.h:114:17: note: in expansion of macro '__TH_LOG'
     114 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   msg_oob.c:140:25: note: in expansion of macro 'TH_LOG'
     140 |                         TH_LOG("Expected:%s", expected_errno ? strerror(expected_errno) : expected_buf);
         |                         ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
