Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4296838C406
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Oct 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898800; cv=none; b=BCreHb3M8aphrnjdTHRfoBd0+VfYVS7w3x09HMy95mmBAG4FZTlnS0md/aDRFzc8i1xGDzrAAxZyLfE5yUk9NGktGlH8B144IGwltpUusbilpfaUEZNxc1zzuTqzXTS9gxwj9oLmo0tLIvpaXQ1pAyIh3Vn0ejO+W/QpXevCJP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898800; c=relaxed/simple;
	bh=c8Drpxn/Lo86htWu39SrYqcZSEWxb6pBSC2yoVWS0IM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V5lFu7vIkfdJOm4qCtHNcHpkOquCkPWnGGSSUehJkhmrCujifplEdd7gJDMSKnvB80dHRsVCXS/L2uRLe8ZUUsoBTHfjKUW63UnW9yd2+nWzED7RZyhXkozFmBWe2UUXz3sWxld9ILd/PuaOOMa+I1rmMTLgrAAuE+4tTdlblbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQQHigwF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQQHigwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791898797; x=1823434797;
  h=date:from:to:cc:subject:message-id;
  bh=c8Drpxn/Lo86htWu39SrYqcZSEWxb6pBSC2yoVWS0IM=;
  b=XQQHigwFtgAhTOiPDpRPg64/g+AQPtBQ92yA3N5E+nQt7g2H0TxSNa2w
   ynGPj+pknk4rpfP27ZgIHwTcOg6N2LdE2xsQJdn0DbERbTRbkSj1cko2B
   71BCM/pdF4ZyRXFrZzxSnfjtEGxnBMgiWoxz0kw4N3Iqx88L2KCY2cAog
   EiYoH2OPjvMj7t8hvujIW7e3duCRdNnWgs/zaBsNSlrVw0cdXJ8okBorL
   qT3fBtU4rDTpYH+KpY/4+cmspzwKpu2pfo1RzqT53J9kxbLoQhGZm0Xyh
   Q4cY9+Z49azU1tUmQJnxyrJzLWHhmArIjVrY2uXpPl+pL3R7XaVrflCQP
   A==;
X-CSE-ConnectionGUID: 682eIWYlQzuGOBtNVJ1JqA==
X-CSE-MsgGUID: KFJKrk8sRQ2juTWjWg2Oaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="520587"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="520587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:39:57 -0700
X-CSE-ConnectionGUID: OJQik69zQimM1guwpEmy8w==
X-CSE-MsgGUID: MkBdAJVpSG2/UEHDH+R26A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1360651"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Oct 2026 06:39:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGcjR-00000000AVv-0mN3;
	Tue, 13 Oct 2026 13:39:53 +0000
Date: Tue, 13 Oct 2026 15:39:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android17-6.18 10/10]
 kernel/fork.c:2554:1-7: preceding lock on line 2373
Message-ID: <202610131522.v0Br7n3c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   0e49b045d561ca646100887fe91cf33baa10c650
commit: fa573af4b2ab4a7c778dfaf0bb0a081ed59327f8 [10/10] ANDROID: vendor_hooks: add hooks for process authenticator security module
:::::: branch date: 3 hours ago
:::::: commit date: 12 hours ago
config: arm-randconfig-r2100-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131522.v0Br7n3c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131522.v0Br7n3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610131522.v0Br7n3c-lkp@intel.com/

All warnings (new ones prefixed by >>):

         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/sys.h:24,
                    from drivers/android/vendor_hooks.c:68:
   include/trace/stages/init.h:2:23: warning: 'str__sys__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/suspend.h:28,
                    from drivers/android/vendor_hooks.c:67:
   include/trace/stages/init.h:2:23: warning: 'str__suspend__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/softlockup.h:17,
                    from drivers/android/vendor_hooks.c:66:
   include/trace/stages/init.h:2:23: warning: 'str__softlockup__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/signal.h:22,
                    from drivers/android/vendor_hooks.c:65:
   include/trace/stages/init.h:2:23: warning: 'str__signal__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/selinux.h:20,
                    from drivers/android/vendor_hooks.c:64:
   include/trace/stages/init.h:2:23: warning: 'str__selinux__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/security.h:49,
                    from drivers/android/vendor_hooks.c:63:
>> include/trace/stages/init.h:2:23: warning: 'str__security__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/rwsem.h:58,
                    from drivers/android/vendor_hooks.c:62:
   include/trace/stages/init.h:2:23: warning: 'str__rwsem__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/remoteproc.h:26,
                    from drivers/android/vendor_hooks.c:61:
   include/trace/stages/init.h:2:23: warning: 'str__remoteproc__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/regmap.h:24,
                    from drivers/android/vendor_hooks.c:60:
   include/trace/stages/init.h:2:23: warning: 'str__regmap__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/reboot.h:18,
                    from drivers/android/vendor_hooks.c:59:
   include/trace/stages/init.h:2:23: warning: 'str__reboot__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/rcu.h:32,
                    from drivers/android/vendor_hooks.c:58:
   include/trace/stages/init.h:2:23: warning: 'str__rcu__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/ptrace.h:22,
                    from drivers/android/vendor_hooks.c:57:
>> include/trace/stages/init.h:2:23: warning: 'str__ptrace__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/psi.h:25,
                    from drivers/android/vendor_hooks.c:56:
   include/trace/stages/init.h:2:23: warning: 'str__psi__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/psci.h:25,
                    from drivers/android/vendor_hooks.c:55:
   include/trace/stages/init.h:2:23: warning: 'str__psci__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/printk.h:28,
                    from drivers/android/vendor_hooks.c:54:
   include/trace/stages/init.h:2:23: warning: 'str__printk__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/preemptirq.h:31,
                    from drivers/android/vendor_hooks.c:53:
   include/trace/stages/init.h:2:23: warning: 'str__preemptirq__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/power.h:59,
                    from drivers/android/vendor_hooks.c:52:
   include/trace/stages/init.h:2:23: warning: 'str__power__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~

cocci warnings: (new ones prefixed by >>)
>> kernel/fork.c:2554:1-7: preceding lock on line 2373

vim +2554 kernel/fork.c

d741bf41d7c7db4 Peter Zijlstra             2020-08-29  2313  
7586bc1597204df T.J. Mercier               2025-07-22  2314  	retval = copy_dmabuf_info(clone_flags, p);
7586bc1597204df T.J. Mercier               2025-07-22  2315  	if (retval) {
7586bc1597204df T.J. Mercier               2025-07-22  2316  		pr_err("failed to copy dmabuf accounting info, err %d\n", retval);
7586bc1597204df T.J. Mercier               2025-07-22  2317  		goto bad_fork_put_pidfd;
7586bc1597204df T.J. Mercier               2025-07-22  2318  	}
7586bc1597204df T.J. Mercier               2025-07-22  2319  
7e47682ea555e7c Aleksa Sarai               2015-06-09  2320  	/*
7e47682ea555e7c Aleksa Sarai               2015-06-09  2321  	 * Ensure that the cgroup subsystem policies allow the new process to be
7b7b8a2c9560efb Randy Dunlap               2020-10-15  2322  	 * forked. It should be noted that the new process's css_set can be changed
7e47682ea555e7c Aleksa Sarai               2015-06-09  2323  	 * between here and cgroup_post_fork() if an organisation operation is in
7e47682ea555e7c Aleksa Sarai               2015-06-09  2324  	 * progress.
7e47682ea555e7c Aleksa Sarai               2015-06-09  2325  	 */
ef2c41cf38a7559 Christian Brauner          2020-02-05  2326  	retval = cgroup_can_fork(p, args);
7e47682ea555e7c Aleksa Sarai               2015-06-09  2327  	if (retval)
7586bc1597204df T.J. Mercier               2025-07-22  2328  		goto bad_fork_cleanup_dmabuf;
7e47682ea555e7c Aleksa Sarai               2015-06-09  2329  
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2330  	/*
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2331  	 * Now that the cgroups are pinned, re-clone the parent cgroup and put
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2332  	 * the new task on the correct runqueue. All this *before* the task
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2333  	 * becomes visible.
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2334  	 *
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2335  	 * This isn't part of ->can_fork() because while the re-cloning is
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2336  	 * cgroup specific, it unconditionally needs to place the task on a
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2337  	 * runqueue.
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2338  	 */
304b3f2bc07ba7c Tejun Heo                  2024-06-18  2339  	retval = sched_cgroup_fork(p, args);
304b3f2bc07ba7c Tejun Heo                  2024-06-18  2340  	if (retval)
304b3f2bc07ba7c Tejun Heo                  2024-06-18  2341  		goto bad_fork_cancel_cgroup;
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2342  
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2343  	/*
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2344  	 * Allocate a default futex hash for the user process once the first
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2345  	 * thread spawns.
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2346  	 */
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2347  	if (need_futex_hash_allocate_default(clone_flags)) {
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2348  		retval = futex_hash_allocate_default();
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2349  		if (retval)
4ec3c15462b9f44 Sebastian Andrzej Siewior  2025-09-18  2350  			goto bad_fork_cancel_cgroup;
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2351  		/*
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2352  		 * If we fail beyond this point we don't free the allocated
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2353  		 * futex hash map. We assume that another thread will be created
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2354  		 * and makes use of it. The hash map will be freed once the main
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2355  		 * thread terminates.
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2356  		 */
7c4f75a21f63648 Sebastian Andrzej Siewior  2025-04-16  2357  	}
7b55851367136b1 David Rheinsberg           2019-01-08  2358  	/*
7b55851367136b1 David Rheinsberg           2019-01-08  2359  	 * From this point on we must avoid any synchronous user-space
7b55851367136b1 David Rheinsberg           2019-01-08  2360  	 * communication until we take the tasklist-lock. In particular, we do
7b55851367136b1 David Rheinsberg           2019-01-08  2361  	 * not want user-space to be able to predict the process start-time by
7b55851367136b1 David Rheinsberg           2019-01-08  2362  	 * stalling fork(2) after we recorded the start_time but before it is
7b55851367136b1 David Rheinsberg           2019-01-08  2363  	 * visible to the system.
7b55851367136b1 David Rheinsberg           2019-01-08  2364  	 */
7b55851367136b1 David Rheinsberg           2019-01-08  2365  
7b55851367136b1 David Rheinsberg           2019-01-08  2366  	p->start_time = ktime_get_ns();
cf25e24db61cc9d Peter Zijlstra             2019-11-07  2367  	p->start_boottime = ktime_get_boottime_ns();
7b55851367136b1 David Rheinsberg           2019-01-08  2368  
18c830df771f2ba Oleg Nesterov              2013-07-03  2369  	/*
18c830df771f2ba Oleg Nesterov              2013-07-03  2370  	 * Make it visible to the rest of the system, but dont wake it up yet.
18c830df771f2ba Oleg Nesterov              2013-07-03  2371  	 * Need tasklist lock for parent etc handling!
18c830df771f2ba Oleg Nesterov              2013-07-03  2372  	 */
^1da177e4c3f415 Linus Torvalds             2005-04-16 @2373  	write_lock_irq(&tasklist_lock);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2374  
^1da177e4c3f415 Linus Torvalds             2005-04-16  2375  	/* CLONE_PARENT re-uses the old parent */
2d5516cbb9daf7d Oleg Nesterov              2009-03-02  2376  	if (clone_flags & (CLONE_PARENT|CLONE_THREAD)) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  2377  		p->real_parent = current->real_parent;
2d5516cbb9daf7d Oleg Nesterov              2009-03-02  2378  		p->parent_exec_id = current->parent_exec_id;
b4e00444cab4c3f Eddy Wu                    2020-11-07  2379  		if (clone_flags & CLONE_THREAD)
b4e00444cab4c3f Eddy Wu                    2020-11-07  2380  			p->exit_signal = -1;
b4e00444cab4c3f Eddy Wu                    2020-11-07  2381  		else
b4e00444cab4c3f Eddy Wu                    2020-11-07  2382  			p->exit_signal = current->group_leader->exit_signal;
2d5516cbb9daf7d Oleg Nesterov              2009-03-02  2383  	} else {
^1da177e4c3f415 Linus Torvalds             2005-04-16  2384  		p->real_parent = current;
2d5516cbb9daf7d Oleg Nesterov              2009-03-02  2385  		p->parent_exec_id = current->self_exec_id;
b4e00444cab4c3f Eddy Wu                    2020-11-07  2386  		p->exit_signal = args->exit_signal;
2d5516cbb9daf7d Oleg Nesterov              2009-03-02  2387  	}
^1da177e4c3f415 Linus Torvalds             2005-04-16  2388  
d83a7cb375eec21 Josh Poimboeuf             2017-02-13  2389  	klp_copy_process(p);
d83a7cb375eec21 Josh Poimboeuf             2017-02-13  2390  
85dd3f61203c5cf Peter Zijlstra             2021-03-29  2391  	sched_core_fork(p);
85dd3f61203c5cf Peter Zijlstra             2021-03-29  2392  
^1da177e4c3f415 Linus Torvalds             2005-04-16  2393  	spin_lock(&current->sighand->siglock);
4a2c7a7837da1b9 Oleg Nesterov              2006-03-28  2394  
792575348ff70e0 Daniel Bristot de Oliveira 2022-07-29  2395  	rv_task_fork(p);
792575348ff70e0 Daniel Bristot de Oliveira 2022-07-29  2396  
d7822b1e24f2df5 Mathieu Desnoyers          2018-06-02  2397  	rseq_fork(p, clone_flags);
d7822b1e24f2df5 Mathieu Desnoyers          2018-06-02  2398  
4ca1d3ee46130e9 Eric W. Biederman          2018-07-13  2399  	/* Don't start children in a dying pid namespace */
e8cfbc245e24887 Gargi Sharma               2017-11-17  2400  	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
3fd37226216620c Kirill Tkhai               2017-05-12  2401  		retval = -ENOMEM;
304b3f2bc07ba7c Tejun Heo                  2024-06-18  2402  		goto bad_fork_core_free;
3fd37226216620c Kirill Tkhai               2017-05-12  2403  	}
4a2c7a7837da1b9 Oleg Nesterov              2006-03-28  2404  
7673bf553b2732a Eric W. Biederman          2018-07-23  2405  	/* Let kill terminate clone/fork in the middle */
7673bf553b2732a Eric W. Biederman          2018-07-23  2406  	if (fatal_signal_pending(current)) {
7673bf553b2732a Eric W. Biederman          2018-07-23  2407  		retval = -EINTR;
304b3f2bc07ba7c Tejun Heo                  2024-06-18  2408  		goto bad_fork_core_free;
7673bf553b2732a Eric W. Biederman          2018-07-23  2409  	}
7673bf553b2732a Eric W. Biederman          2018-07-23  2410  
fa573af4b2ab4a7 Oleksii Beketov            2026-09-11  2411  	trace_android_rvh_copy_process_integrity(clone_flags, p, &retval);
fa573af4b2ab4a7 Oleksii Beketov            2026-09-11  2412  	if (retval)
fa573af4b2ab4a7 Oleksii Beketov            2026-09-11  2413  		goto bad_fork_cancel_cgroup;
fa573af4b2ab4a7 Oleksii Beketov            2026-09-11  2414  
a1140cb215fa13d Kuniyuki Iwashima          2022-08-23  2415  	/* No more failure paths after this point. */
a1140cb215fa13d Kuniyuki Iwashima          2022-08-23  2416  
a1140cb215fa13d Kuniyuki Iwashima          2022-08-23  2417  	/*
a1140cb215fa13d Kuniyuki Iwashima          2022-08-23  2418  	 * Copy seccomp details explicitly here, in case they were changed
a1140cb215fa13d Kuniyuki Iwashima          2022-08-23  2419  	 * before holding sighand lock.
a1140cb215fa13d Kuniyuki Iwashima          2022-08-23  2420  	 */
a1140cb215fa13d Kuniyuki Iwashima          2022-08-23  2421  	copy_seccomp(p);
a1140cb215fa13d Kuniyuki Iwashima          2022-08-23  2422  
2c4704756cab7cf Eric W. Biederman          2017-09-26  2423  	init_task_pid_links(p);
73b9ebfe126a4a8 Oleg Nesterov              2006-03-28  2424  	if (likely(p->pid)) {
4b9d33e6d83cc05 Tejun Heo                  2011-06-17  2425  		ptrace_init_task(p, (clone_flags & CLONE_PTRACE) || trace);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2426  
8190773985141f0 Oleg Nesterov              2013-07-03  2427  		init_task_pid(p, PIDTYPE_PID, pid);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2428  		if (thread_group_leader(p)) {
6883f81aac6f44e Eric W. Biederman          2017-06-04  2429  			init_task_pid(p, PIDTYPE_TGID, pid);
8190773985141f0 Oleg Nesterov              2013-07-03  2430  			init_task_pid(p, PIDTYPE_PGID, task_pgrp(current));
8190773985141f0 Oleg Nesterov              2013-07-03  2431  			init_task_pid(p, PIDTYPE_SID, task_session(current));
8190773985141f0 Oleg Nesterov              2013-07-03  2432  
1c4042c29bd2e85 Eric W. Biederman          2010-07-12  2433  			if (is_child_reaper(pid)) {
17cf22c33e1f1b5 Eric W. Biederman          2010-03-02  2434  				ns_of_pid(pid)->child_reaper = p;
1c4042c29bd2e85 Eric W. Biederman          2010-07-12  2435  				p->signal->flags |= SIGNAL_UNKILLABLE;
1c4042c29bd2e85 Eric W. Biederman          2010-07-12  2436  			}
c3ad2c3b02e953e Eric W. Biederman          2018-07-23  2437  			p->signal->shared_pending.signal = delayed.signal;
9c9f4ded90a59ee Alan Cox                   2008-10-13  2438  			p->signal->tty = tty_kref_get(current->signal->tty);
749860ce242798f Pavel Tikhomirov           2017-01-30  2439  			/*
749860ce242798f Pavel Tikhomirov           2017-01-30  2440  			 * Inherit has_child_subreaper flag under the same
749860ce242798f Pavel Tikhomirov           2017-01-30  2441  			 * tasklist_lock with adding child to the process tree
749860ce242798f Pavel Tikhomirov           2017-01-30  2442  			 * for propagate_has_child_subreaper optimization.
749860ce242798f Pavel Tikhomirov           2017-01-30  2443  			 */
749860ce242798f Pavel Tikhomirov           2017-01-30  2444  			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
749860ce242798f Pavel Tikhomirov           2017-01-30  2445  							 p->real_parent->signal->is_child_subreaper;
9cd80bbb07fcd6d Oleg Nesterov              2009-12-17  2446  			list_add_tail(&p->sibling, &p->real_parent->children);
5e85d4abe3f43bb Eric W. Biederman          2006-04-18  2447  			list_add_tail_rcu(&p->tasks, &init_task.tasks);
6883f81aac6f44e Eric W. Biederman          2017-06-04  2448  			attach_pid(p, PIDTYPE_TGID);
8190773985141f0 Oleg Nesterov              2013-07-03  2449  			attach_pid(p, PIDTYPE_PGID);
8190773985141f0 Oleg Nesterov              2013-07-03  2450  			attach_pid(p, PIDTYPE_SID);
909ea96468096b0 Christoph Lameter          2010-12-08  2451  			__this_cpu_inc(process_counts);
80628ca06c5d429 Oleg Nesterov              2013-07-03  2452  		} else {
80628ca06c5d429 Oleg Nesterov              2013-07-03  2453  			current->signal->nr_threads++;
d80f7d7b2c75c59 Eric W. Biederman          2022-06-21  2454  			current->signal->quick_threads++;
80628ca06c5d429 Oleg Nesterov              2013-07-03  2455  			atomic_inc(&current->signal->live);
60d4de3ff7f7755 Elena Reshetova            2019-01-18  2456  			refcount_inc(&current->signal->sigcnt);
924de3b8c9410c4 Eric W. Biederman          2018-07-23  2457  			task_join_group_stop(p);
0c740d0afc3bff0 Oleg Nesterov              2014-01-21  2458  			list_add_tail_rcu(&p->thread_node,
0c740d0afc3bff0 Oleg Nesterov              2014-01-21  2459  					  &p->signal->thread_head);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2460  		}
8190773985141f0 Oleg Nesterov              2013-07-03  2461  		attach_pid(p, PIDTYPE_PID);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2462  		nr_threads++;
73b9ebfe126a4a8 Oleg Nesterov              2006-03-28  2463  	}
230fddf0eefffe6 chenweitao                 2025-03-11  2464  	trace_android_vh_copy_process(current, nr_threads);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2465  	total_forks++;
c3ad2c3b02e953e Eric W. Biederman          2018-07-23  2466  	hlist_del_init(&delayed.node);
3f17da699431ec4 Oleg Nesterov              2006-02-15  2467  	spin_unlock(&current->sighand->siglock);
4af4206be2bd193 Oleg Nesterov              2014-04-13  2468  	syscall_tracepoint_update(p);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2469  	write_unlock_irq(&tasklist_lock);
4af4206be2bd193 Oleg Nesterov              2014-04-13  2470  
ddc204b517e60ae Waiman Long                2022-02-08  2471  	if (pidfile)
ddc204b517e60ae Waiman Long                2022-02-08  2472  		fd_install(pidfd, pidfile);
ddc204b517e60ae Waiman Long                2022-02-08  2473  
c13cf856cbe16ae Andrew Morton              2005-11-28  2474  	proc_fork_connector(p);
b1e8206582f9d68 Peter Zijlstra             2022-02-14  2475  	sched_post_fork(p);
ef2c41cf38a7559 Christian Brauner          2020-02-05  2476  	cgroup_post_fork(p, args);
cdd6c482c9ff9c5 Ingo Molnar                2009-09-21  2477  	perf_event_fork(p);
43d2b113241d679 KAMEZAWA Hiroyuki          2012-01-10  2478  
43d2b113241d679 KAMEZAWA Hiroyuki          2012-01-10  2479  	trace_task_newtask(p, clone_flags);
3ab679661721b1e Oleg Nesterov              2013-10-16  2480  	uprobe_copy_process(p, clone_flags);
fd593511cdfc0b0 Beau Belgrave              2023-03-28  2481  	user_events_fork(p, clone_flags);
43d2b113241d679 KAMEZAWA Hiroyuki          2012-01-10  2482  
6716c91bc4a9ee8 Hu Xile                    2026-03-24  2483  	trace_android_vh_lock_task_fork(p);
67197a4f28d28d0 Suren Baghdasaryan         2020-10-13  2484  	copy_oom_score_adj(clone_flags, p);
67197a4f28d28d0 Suren Baghdasaryan         2020-10-13  2485  
^1da177e4c3f415 Linus Torvalds             2005-04-16  2486  	return p;
^1da177e4c3f415 Linus Torvalds             2005-04-16  2487  
304b3f2bc07ba7c Tejun Heo                  2024-06-18  2488  bad_fork_core_free:
85dd3f61203c5cf Peter Zijlstra             2021-03-29  2489  	sched_core_free(p);
3fd37226216620c Kirill Tkhai               2017-05-12  2490  	spin_unlock(&current->sighand->siglock);
3fd37226216620c Kirill Tkhai               2017-05-12  2491  	write_unlock_irq(&tasklist_lock);
304b3f2bc07ba7c Tejun Heo                  2024-06-18  2492  bad_fork_cancel_cgroup:
ef2c41cf38a7559 Christian Brauner          2020-02-05  2493  	cgroup_cancel_fork(p, args);
7586bc1597204df T.J. Mercier               2025-07-22  2494  bad_fork_cleanup_dmabuf:
09725f5bd79ddb1 T.J. Mercier               2025-11-12  2495  	put_dmabuf_info(p->dmabuf_info);
b3e5838252665ee Christian Brauner          2019-03-27  2496  bad_fork_put_pidfd:
6fd2fe494b17bf2 Al Viro                    2019-06-26  2497  	if (clone_flags & CLONE_PIDFD) {
6fd2fe494b17bf2 Al Viro                    2019-06-26  2498  		fput(pidfile);
6fd2fe494b17bf2 Al Viro                    2019-06-26  2499  		put_unused_fd(pidfd);
6fd2fe494b17bf2 Al Viro                    2019-06-26  2500  	}
425fb2b4bf5dde2 Pavel Emelyanov            2007-10-18  2501  bad_fork_free_pid:
425fb2b4bf5dde2 Pavel Emelyanov            2007-10-18  2502  	if (pid != &init_struct_pid)
425fb2b4bf5dde2 Pavel Emelyanov            2007-10-18  2503  		free_pid(pid);
0740aa5f6375681 Jiri Slaby                 2016-05-20  2504  bad_fork_cleanup_thread:
0740aa5f6375681 Jiri Slaby                 2016-05-20  2505  	exit_thread(p);
fd0928df98b9578 Jens Axboe                 2008-01-24  2506  bad_fork_cleanup_io:
b69f2292063d2ca Louis Rilling              2009-12-04  2507  	if (p->io_context)
b69f2292063d2ca Louis Rilling              2009-12-04  2508  		exit_io_context(p);
ab516013ad9ca47 Serge Hallyn               2006-10-02  2509  bad_fork_cleanup_namespaces:
444f378b237a0f7 Linus Torvalds             2007-01-30  2510  	exit_task_namespaces(p);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2511  bad_fork_cleanup_mm:
c3f3ce049f7d97c Andrea Arcangeli           2019-05-14  2512  	if (p->mm) {
c3f3ce049f7d97c Andrea Arcangeli           2019-05-14  2513  		mm_clear_owner(p->mm, p);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2514  		mmput(p->mm);
c3f3ce049f7d97c Andrea Arcangeli           2019-05-14  2515  	}
^1da177e4c3f415 Linus Torvalds             2005-04-16  2516  bad_fork_cleanup_signal:
4ab6c08336535f8 Oleg Nesterov              2009-08-26  2517  	if (!(clone_flags & CLONE_THREAD))
1c5354de90c900b Mike Galbraith             2011-01-05  2518  		free_signal_struct(p->signal);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2519  bad_fork_cleanup_sighand:
a7e5328a06a2bee Oleg Nesterov              2006-03-28  2520  	__cleanup_sighand(p->sighand);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2521  bad_fork_cleanup_fs:
^1da177e4c3f415 Linus Torvalds             2005-04-16  2522  	exit_fs(p); /* blocking */
^1da177e4c3f415 Linus Torvalds             2005-04-16  2523  bad_fork_cleanup_files:
^1da177e4c3f415 Linus Torvalds             2005-04-16  2524  	exit_files(p); /* blocking */
^1da177e4c3f415 Linus Torvalds             2005-04-16  2525  bad_fork_cleanup_semundo:
^1da177e4c3f415 Linus Torvalds             2005-04-16  2526  	exit_sem(p);
e4e55b47ed9ae2c Tetsuo Handa               2017-03-24  2527  bad_fork_cleanup_security:
e4e55b47ed9ae2c Tetsuo Handa               2017-03-24  2528  	security_task_free(p);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2529  bad_fork_cleanup_audit:
^1da177e4c3f415 Linus Torvalds             2005-04-16  2530  	audit_free(p);
6c72e3501d0d62f Peter Zijlstra             2014-10-02  2531  bad_fork_cleanup_perf:
cdd6c482c9ff9c5 Ingo Molnar                2009-09-21  2532  	perf_event_free_task(p);
304b3f2bc07ba7c Tejun Heo                  2024-06-18  2533  bad_fork_sched_cancel_fork:
304b3f2bc07ba7c Tejun Heo                  2024-06-18  2534  	sched_cancel_fork(p);
6c72e3501d0d62f Peter Zijlstra             2014-10-02  2535  bad_fork_cleanup_policy:
b09be676e0ff25b Byungchul Park             2017-08-07  2536  	lockdep_free_task(p);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2537  #ifdef CONFIG_NUMA
f0be3d32b05d3fe Lee Schermerhorn           2008-04-28  2538  	mpol_put(p->mempolicy);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2539  #endif
ff8288ff475e475 Eric W. Biederman          2021-12-20  2540  bad_fork_cleanup_delayacct:
35df17c57cecb08 Shailabh Nagar             2006-08-31  2541  	delayacct_tsk_free(p);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2542  bad_fork_cleanup_count:
21d1c5e386bc751 Alexey Gladkov             2021-04-22  2543  	dec_rlimit_ucounts(task_ucounts(p), UCOUNT_RLIMIT_NPROC, 1);
e0e817392b9acf2 David Howells              2009-09-02  2544  	exit_creds(p);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2545  bad_fork_free:
2f064a59a11ff9b Peter Zijlstra             2021-06-11  2546  	WRITE_ONCE(p->__state, TASK_DEAD);
1a03d3f13ffe5dd Sebastian Andrzej Siewior  2022-02-17  2547  	exit_task_stack_account(p);
68f24b08ee892d4 Andy Lutomirski            2016-09-15  2548  	put_task_stack(p);
c3f3ce049f7d97c Andrea Arcangeli           2019-05-14  2549  	delayed_free_task(p);
fe7d37d1fbf8ffe Oleg Nesterov              2006-01-08  2550  fork_out:
c3ad2c3b02e953e Eric W. Biederman          2018-07-23  2551  	spin_lock_irq(&current->sighand->siglock);
c3ad2c3b02e953e Eric W. Biederman          2018-07-23  2552  	hlist_del_init(&delayed.node);
c3ad2c3b02e953e Eric W. Biederman          2018-07-23  2553  	spin_unlock_irq(&current->sighand->siglock);
fe7d37d1fbf8ffe Oleg Nesterov              2006-01-08 @2554  	return ERR_PTR(retval);
^1da177e4c3f415 Linus Torvalds             2005-04-16  2555  }
^1da177e4c3f415 Linus Torvalds             2005-04-16  2556  

:::::: The code at line 2554 was first introduced by commit
:::::: fe7d37d1fbf8ffe78abd72728b24fb0c64f7af55 [PATCH] copy_process: error path cleanup

:::::: TO: Oleg Nesterov <oleg@tv-sign.ru>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
