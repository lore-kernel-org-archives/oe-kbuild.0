Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585FA38F624
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776425376; cv=none; b=nC6ekVGObUReF52svatDjyAvvYv09x6fqVq0lMq8v0NSH4oYGXKVrEqF+uHGp3tENmE1xDJOP4cNJeGBhNTB3ZhniO4Yw/tJA1Nolzm6BVxr8UNDZ9+7OG0xCpE7l/y3nNDZeFAjHmPcx/so1b+TCy36ChvnHxI958GrRJ2ywLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776425376; c=relaxed/simple;
	bh=wyuVYcjmg91Rn13yCrOJS5SHwozCRsw+vORjRS6sRuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QxEdroBXexK58/k0f9qabDKNbHaZ2oBrZ7eOzArJHKmz/K/LEZSJUiXrzUQ2gGxGmxv1w3z0BYa+rZrfh5FBHrHeICuxRvD5Ff6cnRkonWMqW20H9xs4bnxFdnShL/SR70aWMNLSLM2bPoT3+cXLo3E1b8qU0UA7F8+IHjGJOKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoFa59zf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoFa59zf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776425374; x=1807961374;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wyuVYcjmg91Rn13yCrOJS5SHwozCRsw+vORjRS6sRuc=;
  b=AoFa59zfJ2EmNHo6TxjE2LivTBvlfAwRKzBUDu/adE8uNVqFjNFn8JWW
   WaPj10ol29eD3yVPAp7oJHZcZyxthPzzwp9z1FFCwKaK5uM90VRSXWoFM
   7bJwoxlkpjLg6He9QqEQ8ajlNOdSF9Y+49cUpOxU3ESwH4a94HgvBJ4b/
   R8yTiFRiU2bEDycwRxvi/eKoDrIbZckgFe+PoJPPnI97dlBd6+C4sa4Sb
   CJtpU8P9WQVjWkTfvBbWZf62+WX5tTeCLtc4/w1qABfWaDqyqy5+8VA1s
   lsYkTuyAaN/1cpXtq07VK6ySnLy4mm/y9UwxfXusXkNTbhMpIFGYZvdi/
   g==;
X-CSE-ConnectionGUID: dvMeHQZ8T0yFUs7WvYnI5Q==
X-CSE-MsgGUID: GfrmxOdVS3SAc1nYCdgKPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="102901214"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="102901214"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 04:29:34 -0700
X-CSE-ConnectionGUID: u3h8uaTyQ26jP69kf+w37Q==
X-CSE-MsgGUID: PrWOP4I3S9a0zOSZkT3P6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="254235059"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Apr 2026 04:29:33 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDhO6-000000000ID-3WK8;
	Fri, 17 Apr 2026 11:29:30 +0000
Date: Fri, 17 Apr 2026 19:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] gcov: use atomic counter updates to fix concurrent
 access crashes
Message-ID: <202604171926.AK0Gl5MD-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260402141831.1437357-2-khorenko@virtuozzo.com>
References: <20260402141831.1437357-2-khorenko@virtuozzo.com>
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
TO: Peter Oberparleiter <oberpar@linux.ibm.com>
TO: Mikhail Zaslonko <zaslonko@linux.ibm.com>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nicolas Schier <nsc@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: "Thomas Weiﬂschuh" <linux@weissschuh.net>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Steffen Klassert <steffen.klassert@secunet.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
CC: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
CC: Jakub Kicinski <kuba@kernel.org>

Hi Konstantin,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on v7.0 next-20260416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Khorenko/gcov-use-atomic-counter-updates-to-fix-concurrent-access-crashes/20260411-133428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260402141831.1437357-2-khorenko%40virtuozzo.com
patch subject: [PATCH] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-buildonly-randconfig-005-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171926.AK0Gl5MD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171926.AK0Gl5MD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604171926.AK0Gl5MD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/trace/ftrace.o: in function `symbols_cmp':
>> kernel/trace/ftrace.c:9213:(.text+0x18): undefined reference to `__atomic_fetch_add_8'
>> ld: kernel/trace/ftrace.c:9217:(.text+0x36): undefined reference to `__atomic_fetch_add_8'
   ld: kernel/trace/ftrace.o: in function `ftrace_pid_release':
   kernel/trace/ftrace.c:8961:(.text+0x5c): undefined reference to `__atomic_fetch_add_8'
   ld: kernel/trace/ftrace.c:8964:(.text+0x7a): undefined reference to `__atomic_fetch_add_8'
   ld: kernel/trace/ftrace.c:8966:(.text+0x98): undefined reference to `__atomic_fetch_add_8'
   ld: kernel/trace/ftrace.o:kernel/trace/ftrace.c:8852: more undefined references to `__atomic_fetch_add_8' follow


vim +9213 kernel/trace/ftrace.c

b0fc494fae96a7 Steven Rostedt 2008-05-12  9211  
bed0d9a50dacee Jiri Olsa      2022-05-10  9212  static int symbols_cmp(const void *a, const void *b)
bed0d9a50dacee Jiri Olsa      2022-05-10 @9213  {
bed0d9a50dacee Jiri Olsa      2022-05-10  9214  	const char **str_a = (const char **) a;
bed0d9a50dacee Jiri Olsa      2022-05-10  9215  	const char **str_b = (const char **) b;
bed0d9a50dacee Jiri Olsa      2022-05-10  9216  
bed0d9a50dacee Jiri Olsa      2022-05-10 @9217  	return strcmp(*str_a, *str_b);
bed0d9a50dacee Jiri Olsa      2022-05-10  9218  }
bed0d9a50dacee Jiri Olsa      2022-05-10  9219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
