Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A808374746
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827625; cv=none; b=aBDzbsCw/Cqd6sAp76LRYLSN13DfrhKAn8RAsfPgr6gn09XLiRormO1NXjq4La3Ed+JjkN3mfgHGw/jcVZP72FJK0ahWttR5bWMIok+lSGlSXNeNF9tN552m2XwaeUVPl0WptSdSGR0VYX8UzbzCMcExIOpPrc00exLLwWZNMJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827625; c=relaxed/simple;
	bh=/GC3Ey/b1y1Ub5J8zegRoXXLY+HPGzZix/Kaae4c8FA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gSsq9peyCbzOi2qEcMkobPRZU6ICGgYehGHhubs9aKsHsnnGEAV9IYxItX+jjw9u2gL7PHBf0GvGEtyTaR18rNxq3K9OBZAEDrc6bkWNQBLdGe6vc9Ag2oOyoNhjz7QVErC59XIDR3UaLZb/0fLECTFdnPQeVfjFSTY/uf1rJlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DatGPebi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DatGPebi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772827622; x=1804363622;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/GC3Ey/b1y1Ub5J8zegRoXXLY+HPGzZix/Kaae4c8FA=;
  b=DatGPebiaHU4ykwNTMrYwF34W/oqPFOeF1SEVude2PLNPC1TgGKIZKwd
   xhMlsUD6pDP1v57/aecVSYjGo1ukruEnZEgO+zFQxA6uxK1q76XhsnvSH
   9lls9A2aKJldebTlor4okAchomtdAXzdxtHAmzytnuK/Ob4f2IQiXcjRj
   I12txTD35Th48iAR2xC5BGVKS0SYgPivU9GO6YSH3oWdg3DOZs+AYE7ef
   ufkjmmdZ1oQo4MoAsoR0a2004KCkcusL3lM5ptl3ys6reheDxduRMaHpl
   r4spJcs3U+KsHdXq0HfNZv1EjkMFLWXK0Oh6p+RZdXE9J2wLn01+vGN6V
   Q==;
X-CSE-ConnectionGUID: 2NI1Tcp1RDu7uyCT+1szEQ==
X-CSE-MsgGUID: +fDlLbQ7TXu0EWw1BWZspA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="96559187"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="96559187"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:07:01 -0800
X-CSE-ConnectionGUID: 3Xh7pfORQyudmOYEK03IVA==
X-CSE-MsgGUID: hcc0a2ECRuCBaRZuzeUO9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223595148"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 12:07:01 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybRq-000000002Jh-0ny2;
	Fri, 06 Mar 2026 20:06:58 +0000
Date: Fri, 06 Mar 2026 21:06:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-vmlinux-h 2/6]
 getdelays.c:209:15: error: invalid use of undefined type 'struct
 __kernel_timespec'
Message-ID: <202603062103.Z5fecwZD-lkp@intel.com>
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
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-vmlinux-h
head:   8004855a92a2320932629e08adcf6e3048ff774c
commit: dc4d07a89d0af09d050c7954444aebe6c8b2c028 [2/6] bpftool
:::::: branch date: 44 minutes ago
:::::: commit date: 44 minutes ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0306/202603062103.Z5fecwZD-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260306/202603062103.Z5fecwZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603062103.Z5fecwZD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> getdelays.c:202:43: warning: 'struct __kernel_timespec' declared inside =
parameter list will not be visible outside of this definition or declaration
     202 | static const char *format_timespec(struct __kernel_timespec *ts)
         |                                           ^~~~~~~~~~~~~~~~~
   getdelays.c: In function 'format_timespec':
>> getdelays.c:209:15: error: invalid use of undefined type 'struct __kerne=
l_timespec'
     209 |         if (ts->tv_sec =3D=3D 0 && ts->tv_nsec =3D=3D 0)
         |               ^~
   getdelays.c:209:34: error: invalid use of undefined type 'struct __kerne=
l_timespec'
     209 |         if (ts->tv_sec =3D=3D 0 && ts->tv_nsec =3D=3D 0)
         |                                  ^~
   getdelays.c:212:22: error: invalid use of undefined type 'struct __kerne=
l_timespec'
     212 |         time_sec =3D ts->tv_sec;
         |                      ^~
   getdelays.c: In function 'print_delayacct':
>> getdelays.c:258:55: error: 'struct taskstats' has no member named 'cpu_d=
elay_max'; did you mean 'cpu_delay_total'?
     258 |                                 delay_ms((double)(t)->cpu_delay_=
max), \
         |                                                       ^~~~~~~~~~=
~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
>> getdelays.c:259:55: error: 'struct taskstats' has no member named 'cpu_d=
elay_min'; did you mean 'cpu_delay_total'?
     259 |                                 delay_ms((double)(t)->cpu_delay_=
min), \
         |                                                       ^~~~~~~~~~=
~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
>> getdelays.c:260:53: error: 'struct taskstats' has no member named 'cpu_d=
elay_max_ts'
     260 |                                 format_timespec(&(t)->cpu_delay_=
max_ts)); \
         |                                                     ^~
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
   getdelays.c:271:55: error: 'struct taskstats' has no member named 'cpu_d=
elay_max'; did you mean 'cpu_delay_total'?
     271 |                                 delay_ms((double)(t)->cpu_delay_=
max), \
         |                                                       ^~~~~~~~~~=
~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
   getdelays.c:272:55: error: 'struct taskstats' has no member named 'cpu_d=
elay_min'; did you mean 'cpu_delay_total'?
     272 |                                 delay_ms((double)(t)->cpu_delay_=
min)); \
         |                                                       ^~~~~~~~~~=
~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
>> getdelays.c:350:25: error: 'struct taskstats' has no member named 'blkio=
_delay_max'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_=
delay_max_ts);
         |                         ^~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:350:42: error: 'struct taskstats' has no member named 'blkio=
_delay_min'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_=
delay_max_ts);
         |                                          ^~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:350:59: error: 'struct taskstats' has no member named 'blkio=
_delay_max_ts'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_=
delay_max_ts);
         |                                                           ^~~~~~=
~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH=
_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
>> getdelays.c:350:25: error: 'struct taskstats' has no member named 'blkio=
_delay_max'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_=
delay_max_ts);
         |                         ^~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:350:42: error: 'struct taskstats' has no member named 'blkio=
_delay_min'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_=
delay_max_ts);
         |                                          ^~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:354:25: error: 'struct taskstats' has no member named 'swapi=
n_delay_max'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swap=
in_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:354:43: error: 'struct taskstats' has no member named 'swapi=
n_delay_min'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swap=
in_delay_max_ts);
         |                                           ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:354:61: error: 'struct taskstats' has no member named 'swapi=
n_delay_max_ts'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swap=
in_delay_max_ts);
         |                                                             ^~~~=
~~~~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH=
_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
>> getdelays.c:354:25: error: 'struct taskstats' has no member named 'swapi=
n_delay_max'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swap=
in_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:354:43: error: 'struct taskstats' has no member named 'swapi=
n_delay_min'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swap=
in_delay_max_ts);
         |                                           ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:358:25: error: 'struct taskstats' has no member named 'freep=
ages_delay_max'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min=
, freepages_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version,=
 t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:358:46: error: 'struct taskstats' has no member named 'freep=
ages_delay_min'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min=
, freepages_delay_max_ts);
         |                                              ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version,=
 t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:358:67: error: 'struct taskstats' has no member named 'freep=
ages_delay_max_ts'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min=
, freepages_delay_max_ts);
         |                                                                 =
  ^~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH=
_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
>> getdelays.c:358:25: error: 'struct taskstats' has no member named 'freep=
ages_delay_max'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min=
, freepages_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version,=
 t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:358:46: error: 'struct taskstats' has no member named 'freep=
ages_delay_min'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min=
, freepages_delay_max_ts);
         |                                              ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version,=
 t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:362:25: error: 'struct taskstats' has no member named 'thras=
hing_delay_max'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min=
, thrashing_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->versio=
n, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:362:46: error: 'struct taskstats' has no member named 'thras=
hing_delay_min'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min=
, thrashing_delay_max_ts);
         |                                              ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->versio=
n, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:362:67: error: 'struct taskstats' has no member named 'thras=
hing_delay_max_ts'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min=
, thrashing_delay_max_ts);
         |                                                                 =
  ^~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH=
_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
   getdelays.c:362:25: error: 'struct taskstats' has no member named 'thras=
hing_delay_max'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min=
, thrashing_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->versio=
n, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:362:46: error: 'struct taskstats' has no member named 'thras=
hing_delay_min'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min=
, thrashing_delay_max_ts);
         |                                              ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->versio=
n, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:367:33: error: 'struct taskstats' has no member named 'compa=
ct_delay_max'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay=
_min, compact_delay_max_ts);
         |                                 ^~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->=
version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:367:52: error: 'struct taskstats' has no member named 'compa=
ct_delay_min'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay=
_min, compact_delay_max_ts);
         |                                                    ^~~~~~~~~~~~~=
~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->=
version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:367:71: error: 'struct taskstats' has no member named 'compa=
ct_delay_max_ts'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay=
_min, compact_delay_max_ts);
         |                                                                 =
      ^~~~~~~~~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH=
_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
   getdelays.c:367:33: error: 'struct taskstats' has no member named 'compa=
ct_delay_max'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay=
_min, compact_delay_max_ts);
         |                                 ^~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->=
version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:367:52: error: 'struct taskstats' has no member named 'compa=
ct_delay_min'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay=
_min, compact_delay_max_ts);
         |                                                    ^~~~~~~~~~~~~=
~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->=
version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:373:33: error: 'struct taskstats' has no member named 'wpcop=
y_delay_max'; did you mean 'wpcopy_delay_total'?
     373 |                                 wpcopy_delay_max, wpcopy_delay_m=
in, wpcopy_delay_max_ts);
         |                                 ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:371:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_=
TS'
     371 |                         PRINT_FILED_DELAY_WITH_TS("WPCOPY", t->v=
ersion, t,
--
>> cc1: warning: arch/arm64/include/generated: No such file or directory [-=
Wmissing-include-dirs]
>> cc1: warning: arch/arm64/include/generated/uapi: No such file or directo=
ry [-Wmissing-include-dirs]
>> cc1: warning: include/generated/uapi: No such file or directory [-Wmissi=
ng-include-dirs]
   In file included from include/linux/types.h:5,
                    from include/linux/io.h:10,
                    from include/linux/libnvdimm.h:10,
                    from ../../../drivers/nvdimm/core.c:5:
>> include/uapi/linux/types.h:5:10: fatal error: asm/types.h: No such file =
or directory
       5 | #include <asm/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: arch/arm64/include/generated: No such file or directory [-=
Wmissing-include-dirs]
>> cc1: warning: arch/arm64/include/generated/uapi: No such file or directo=
ry [-Wmissing-include-dirs]
>> cc1: warning: include/generated/uapi: No such file or directory [-Wmissi=
ng-include-dirs]
   In file included from include/linux/stat.h:6,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from ../../../drivers/nvdimm/btt.c:6:
>> arch/arm64/include/asm/stat.h:8:10: fatal error: uapi/asm/stat.h: No suc=
h file or directory
       8 | #include <uapi/asm/stat.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
..

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
