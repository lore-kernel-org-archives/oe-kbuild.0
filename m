Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192BA43B3D1
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Aug 2026 12:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787227916; cv=none; b=WlX4VtRCvod7SN11feN69cbv5OHEiqzCo1VpdjgVW3K9V4h728a7SvhYL1HbYxGVaHRMSzIu2c3cVRQNbdXks1RMF1uhiexHIT6HpzFUHsX3s8t2JHNkM5AK3a3gFG6bPDX/7shjll4u4f8ORpzuJ287Fxl+l5ov5c95Wo3yoaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787227916; c=relaxed/simple;
	bh=Yfmdr44yHE2HBk/GdMODzItXPcNVOyBNVqMggLpFsw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bmeauEb+YSInPZmEHLsc2EjkfqjXp5jnBkddPl4VlZEcVNqulDq2PyG4x029S/LLu3Xz49CsE30gx3kcJ57G0h3ES8GOompmtWg0Px+3EWw5qAnMsYqrrYeahgFqfk/g2JqMGdcHMUys1gaYy3LF1DMf1EzxCGOai0Sd+ArXI6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVr8gTNz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVr8gTNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787227909; x=1818763909;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Yfmdr44yHE2HBk/GdMODzItXPcNVOyBNVqMggLpFsw4=;
  b=iVr8gTNzp63CBhwqKpWNyp56s1DNcDnSU6p8Hcf1O1rJ/ljDIhmEWAWg
   9B0H6lXDEh99sZx22CyA29Qy+dDtwIrFOzInrloGBss6YMKAQOJJIMPuk
   XJvWGEYeM6hg087C9O4bIIDcwT6aCQbjVNg4OzXvzqNCo0KNZperX5drf
   MjXly1/HM64Q90vzv3Et4Q/T8iHLHGOeTjjNvbDv6GTaBHMrFI+v7JOYf
   hENI4mgqeN0jOj7B2B+6II4SGaLDoGYzwVBHUbsDOBpTnLZokhMNWGv+Z
   ac6KbB5opUa6oSoyA+EpFk4QHFondpKPdpT0+xIRiEv46t32eaUadDs/9
   Q==;
X-CSE-ConnectionGUID: SyR4l8FfSv2premiGhpHng==
X-CSE-MsgGUID: 40kezOhZTVqrrkeN01bvbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99282093"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="99282093"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 05:11:46 -0700
X-CSE-ConnectionGUID: UUOuHJpPSsS7Z9ETKW3Fng==
X-CSE-MsgGUID: 0Bh/dabzSaKy404e2+yuMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="263355104"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2026 05:11:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx1cT-00000000ixF-3WFH;
	Thu, 20 Aug 2026 12:11:41 +0000
Date: Thu, 20 Aug 2026 20:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:dd-ratelimit-2 69/76]
 include/linux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reserved
 word 'return' as identifier
Message-ID: <202608202019.d1pcn16z-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reserved word 're=
turn' as identifier"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-ratelimit-2
head:   31212444bcca4d1547711ec572b5a398d74640ca
commit: d2c50b9f1ea47af25160807084fb88501dce9be4 [69/76] dyndbg: Enforce mu=
tually exclusive modes in 3-bit state machine
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r132-20260820 (https://download.01.org/0day-ci=
/archive/20260820/202608202019.d1pcn16z-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260820/202608202019.d1pcn16z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608202019.d1pcn16z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/string.h:319:13: sparse: sparse: got parse_option_str
   include/linux/string.h:322:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:322:13: sparse: sparse: got sysfs_streq
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/panic.h:15:38: sparse: sparse: Expected ) in function decl=
arator
   include/linux/panic.h:15:38: sparse: sparse: got args
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cp=
u_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nouserta=
int
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifi=
ers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/printk.h:86:17: sparse: sparse: expected ; at end of decla=
ration
   include/linux/printk.h:86:17: sparse: sparse: Expected } at end of speci=
fier
   include/linux/printk.h:86:17: sparse: sparse: got *
   include/linux/printk.h:87:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/printk.h:87:1: sparse: sparse: got }
   include/linux/printk.h:152:43: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:152:43: sparse: sparse: got args
   include/linux/printk.h:155:38: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:155:38: sparse: sparse: got args
   include/linux/printk.h:157:47: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:157:47: sparse: sparse: got args
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acqu=
ire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of decla=
ration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h=
, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of d=
eclaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initial=
ized
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/=
powerpc/include/asm/jump_label.h, include/linux/jump_label.h, include/linux=
/dynamic_debug.h, include/linux/printk.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expect=
ed ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got st=
atic_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.=
h, include/asm-generic/bug.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_st=
atic_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to us=
e reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; a=
t end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; a=
t the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to us=
e reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; a=
t end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; a=
t the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h=
, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_bra=
nch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved=
 word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_t=
ransform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_i=
nc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_i=
nc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_i=
nc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of d=
eclaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_l=
ock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_=
error
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.=
h, include/linux/bug.h, ...):
   include/linux/dynamic_debug.h:124:20: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:124:20: sparse: sparse: got ddebug_mode_ha=
s_print
>> include/linux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:127:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:127:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:133:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:133:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:138:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:138:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:138:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:140:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:140:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:145:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:145:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:145:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:147:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:147:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:152:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:152:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:539:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:539:6: sparse: sparse: got ddebug_apply_ra=
telimit_solo
   include/linux/dynamic_debug.h:540:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:540:6: sparse: sparse: got ddebug_apply_ra=
telimit_shared
   include/linux/dynamic_debug.h:546:29: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:546:29: sparse: sparse: got ddebug_apply_e=
xecution_state
   include/linux/dynamic_debug.h:551:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:551:13: sparse: sparse: got (
>> include/linux/dynamic_debug.h:551:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:555:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:555:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:555:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:557:26: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:557:26: sparse: sparse: got =3D=3D
   include/linux/dynamic_debug.h:557:17: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/dynamic_debug.h:559:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:559:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:564:17: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/dynamic_debug.h:564:24: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:564:24: sparse: sparse: got true
   include/linux/dynamic_debug.h:565:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:565:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:568:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:568:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:573:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:573:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:576:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:576:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:579:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:579:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/printk.h:760:36: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:760:36: sparse: sparse: got ascii
   include/linux/printk.h:764:62: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:764:62: sparse: sparse: got ascii
   include/linux/printk.h:805:75: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:805:75: sparse: sparse: got ascii
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/linux/bug.h, include/linux/fortify-string.h, include/linux/string.h, arc=
h/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: Expected ; at end=
 of declaration
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: got die_will_crash
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/linux/fortify-string.h, include/linux/string.h, arch/powerpc/include/asm=
/paca.h, arch/powerpc/include/asm/current.h, ...):
   include/linux/bug.h:94:33: sparse: sparse: Expected ; at end of declarat=
ion
   include/linux/bug.h:94:33: sparse: sparse: got check_data_corruption
   include/linux/bug.h:94:75: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/bug.h:94:75: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/linux/string.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/as=
m/current.h, include/linux/sched.h, ...):
   include/linux/fortify-string.h:412:23: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:412:23: sparse: sparse: got fortify_memse=
t_chk
   include/linux/fortify-string.h:429:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:429:21: sparse: sparse: got (
   include/linux/fortify-string.h:429:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:431:9: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:431:9: sparse: sparse: got }
   include/linux/fortify-string.h:448:9: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/fortify-string.h:448:16: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:448:16: sparse: sparse: got false
   include/linux/fortify-string.h:449:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:449:1: sparse: sparse: got }
   include/linux/fortify-string.h:515:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:515:21: sparse: sparse: got (
   include/linux/fortify-string.h:515:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:520:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:520:21: sparse: sparse: got (
   include/linux/fortify-string.h:520:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:527:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:527:21: sparse: sparse: got (
   include/linux/fortify-string.h:527:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:531:9: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:531:9: sparse: sparse: got }
   include/linux/fortify-string.h:548:9: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/fortify-string.h:548:14: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:548:14: sparse: sparse: got if
   include/linux/fortify-string.h:562:26: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:562:26: sparse: sparse: got !=3D
   include/linux/fortify-string.h:562:9: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/fortify-string.h:566:9: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/fortify-string.h:566:16: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:566:16: sparse: sparse: got false
   include/linux/fortify-string.h:567:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:567:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/=
powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/lin=
ux/sched.h, ...):
   include/linux/string.h:564:20: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:564:20: sparse: sparse: got strstarts
   include/linux/string.h:567:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/string.h:567:1: sparse: sparse: got }
   include/linux/string.h:582:21: sparse: sparse: Expected ) in function de=
clarator
   include/linux/string.h:582:21: sparse: sparse: got <
   include/linux/string.h:582:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/string.h:585:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/string.h:585:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:585:16: sparse: sparse: got !
   include/linux/string.h:586:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/string.h:586:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h,=
 arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: Ex=
pected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: go=
t generic___test_and_set_bit
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: E=
xpected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: g=
ot &
   include/asm-generic/bitops/generic-non-atomic.h:80:9: sparse: sparse: Tr=
ying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: Ex=
pected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: go=
t }
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: =
Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: =
got &
   include/asm-generic/bitops/generic-non-atomic.h:100:9: sparse: sparse: T=
rying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: E=
xpected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: g=
ot }
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: =
Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: =
got &
   include/asm-generic/bitops/generic-non-atomic.h:112:9: sparse: sparse: T=
rying to use reserved word 'return' as identifier
--
   include/linux/string.h:319:13: sparse: sparse: got parse_option_str
   include/linux/string.h:322:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:322:13: sparse: sparse: got sysfs_streq
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/panic.h:15:38: sparse: sparse: Expected ) in function decl=
arator
   include/linux/panic.h:15:38: sparse: sparse: got args
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cp=
u_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nouserta=
int
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifi=
ers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/printk.h:86:17: sparse: sparse: expected ; at end of decla=
ration
   include/linux/printk.h:86:17: sparse: sparse: Expected } at end of speci=
fier
   include/linux/printk.h:86:17: sparse: sparse: got *
   include/linux/printk.h:87:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/printk.h:87:1: sparse: sparse: got }
   include/linux/printk.h:152:43: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:152:43: sparse: sparse: got args
   include/linux/printk.h:155:38: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:155:38: sparse: sparse: got args
   include/linux/printk.h:157:47: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:157:47: sparse: sparse: got args
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acqu=
ire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of decla=
ration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h=
, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of d=
eclaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initial=
ized
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/=
powerpc/include/asm/jump_label.h, include/linux/jump_label.h, include/linux=
/dynamic_debug.h, include/linux/printk.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expect=
ed ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got st=
atic_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.=
h, include/asm-generic/bug.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_st=
atic_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to us=
e reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; a=
t end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; a=
t the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to us=
e reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; a=
t end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; a=
t the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h=
, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_bra=
nch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved=
 word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_t=
ransform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_i=
nc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_i=
nc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_i=
nc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of d=
eclaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_l=
ock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_=
error
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.=
h, include/linux/bug.h, ...):
   include/linux/dynamic_debug.h:124:20: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:124:20: sparse: sparse: got ddebug_mode_ha=
s_print
>> include/linux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:127:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:127:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:133:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:133:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:138:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:138:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:138:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:140:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:140:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:145:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:145:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:145:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:147:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:147:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:152:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:152:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:539:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:539:6: sparse: sparse: got ddebug_apply_ra=
telimit_solo
   include/linux/dynamic_debug.h:540:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:540:6: sparse: sparse: got ddebug_apply_ra=
telimit_shared
   include/linux/dynamic_debug.h:546:29: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:546:29: sparse: sparse: got ddebug_apply_e=
xecution_state
   include/linux/dynamic_debug.h:551:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:551:13: sparse: sparse: got (
>> include/linux/dynamic_debug.h:551:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:555:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:555:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:555:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:557:26: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:557:26: sparse: sparse: got =3D=3D
   include/linux/dynamic_debug.h:557:17: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/dynamic_debug.h:559:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:559:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:564:17: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/dynamic_debug.h:564:24: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:564:24: sparse: sparse: got true
   include/linux/dynamic_debug.h:565:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:565:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:568:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:568:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:573:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:573:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:576:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:576:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:579:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:579:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/printk.h:760:36: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:760:36: sparse: sparse: got ascii
   include/linux/printk.h:764:62: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:764:62: sparse: sparse: got ascii
   include/linux/printk.h:805:75: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:805:75: sparse: sparse: got ascii
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/linux/bug.h, include/linux/fortify-string.h, include/linux/string.h, arc=
h/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: Expected ; at end=
 of declaration
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: got die_will_crash
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/linux/fortify-string.h, include/linux/string.h, arch/powerpc/include/asm=
/paca.h, arch/powerpc/include/asm/current.h, ...):
   include/linux/bug.h:94:33: sparse: sparse: Expected ; at end of declarat=
ion
   include/linux/bug.h:94:33: sparse: sparse: got check_data_corruption
   include/linux/bug.h:94:75: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/bug.h:94:75: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/linux/string.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/as=
m/current.h, include/linux/sched.h, ...):
   include/linux/fortify-string.h:412:23: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:412:23: sparse: sparse: got fortify_memse=
t_chk
   include/linux/fortify-string.h:429:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:429:21: sparse: sparse: got (
   include/linux/fortify-string.h:429:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:431:9: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:431:9: sparse: sparse: got }
   include/linux/fortify-string.h:448:9: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/fortify-string.h:448:16: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:448:16: sparse: sparse: got false
   include/linux/fortify-string.h:449:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:449:1: sparse: sparse: got }
   include/linux/fortify-string.h:515:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:515:21: sparse: sparse: got (
   include/linux/fortify-string.h:515:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:520:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:520:21: sparse: sparse: got (
   include/linux/fortify-string.h:520:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:527:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:527:21: sparse: sparse: got (
   include/linux/fortify-string.h:527:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:531:9: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:531:9: sparse: sparse: got }
   include/linux/fortify-string.h:548:9: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/fortify-string.h:548:14: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:548:14: sparse: sparse: got if
   include/linux/fortify-string.h:562:26: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:562:26: sparse: sparse: got !=3D
   include/linux/fortify-string.h:562:9: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/fortify-string.h:566:9: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/fortify-string.h:566:16: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:566:16: sparse: sparse: got false
   include/linux/fortify-string.h:567:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:567:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/=
powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/lin=
ux/sched.h, ...):
   include/linux/string.h:564:20: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:564:20: sparse: sparse: got strstarts
   include/linux/string.h:567:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/string.h:567:1: sparse: sparse: got }
   include/linux/string.h:582:21: sparse: sparse: Expected ) in function de=
clarator
   include/linux/string.h:582:21: sparse: sparse: got <
   include/linux/string.h:582:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/string.h:585:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/string.h:585:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:585:16: sparse: sparse: got !
   include/linux/string.h:586:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/string.h:586:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h,=
 arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: Ex=
pected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: go=
t generic___test_and_set_bit
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: E=
xpected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: g=
ot &
   include/asm-generic/bitops/generic-non-atomic.h:80:9: sparse: sparse: Tr=
ying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: Ex=
pected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: go=
t }
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: =
Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: =
got &
   include/asm-generic/bitops/generic-non-atomic.h:100:9: sparse: sparse: T=
rying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: E=
xpected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: g=
ot }
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: =
Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: =
got &
   include/asm-generic/bitops/generic-non-atomic.h:112:9: sparse: sparse: T=
rying to use reserved word 'return' as identifier
--
   include/linux/string.h:319:13: sparse: sparse: got parse_option_str
   include/linux/string.h:322:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:322:13: sparse: sparse: got sysfs_streq
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/panic.h:15:38: sparse: sparse: Expected ) in function decl=
arator
   include/linux/panic.h:15:38: sparse: sparse: got args
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cp=
u_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nouserta=
int
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifi=
ers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/printk.h:86:17: sparse: sparse: expected ; at end of decla=
ration
   include/linux/printk.h:86:17: sparse: sparse: Expected } at end of speci=
fier
   include/linux/printk.h:86:17: sparse: sparse: got *
   include/linux/printk.h:87:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/printk.h:87:1: sparse: sparse: got }
   include/linux/printk.h:152:43: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:152:43: sparse: sparse: got args
   include/linux/printk.h:155:38: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:155:38: sparse: sparse: got args
   include/linux/printk.h:157:47: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:157:47: sparse: sparse: got args
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acqu=
ire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of decla=
ration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h=
, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of d=
eclaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initial=
ized
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/=
powerpc/include/asm/jump_label.h, include/linux/jump_label.h, include/linux=
/dynamic_debug.h, include/linux/printk.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expect=
ed ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got st=
atic_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.=
h, include/asm-generic/bug.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_st=
atic_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to us=
e reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; a=
t end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; a=
t the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to us=
e reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; a=
t end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; a=
t the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h=
, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_bra=
nch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved=
 word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_t=
ransform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_i=
nc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_i=
nc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_i=
nc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of d=
eclaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_l=
ock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_=
error
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.=
h, include/linux/bug.h, ...):
   include/linux/dynamic_debug.h:124:20: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:124:20: sparse: sparse: got ddebug_mode_ha=
s_print
>> include/linux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:127:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:127:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:133:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:133:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:138:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:138:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:138:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:140:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:140:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:145:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:145:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:145:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:147:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:147:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:152:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:152:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:539:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:539:6: sparse: sparse: got ddebug_apply_ra=
telimit_solo
   include/linux/dynamic_debug.h:540:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:540:6: sparse: sparse: got ddebug_apply_ra=
telimit_shared
   include/linux/dynamic_debug.h:546:29: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:546:29: sparse: sparse: got ddebug_apply_e=
xecution_state
   include/linux/dynamic_debug.h:551:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:551:13: sparse: sparse: got (
>> include/linux/dynamic_debug.h:551:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:555:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:555:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:555:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:557:26: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:557:26: sparse: sparse: got =3D=3D
   include/linux/dynamic_debug.h:557:17: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/dynamic_debug.h:559:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:559:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:564:17: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/dynamic_debug.h:564:24: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:564:24: sparse: sparse: got true
   include/linux/dynamic_debug.h:565:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:565:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:568:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:568:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:573:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:573:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:576:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:576:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:579:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:579:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/printk.h:760:36: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:760:36: sparse: sparse: got ascii
   include/linux/printk.h:764:62: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:764:62: sparse: sparse: got ascii
   include/linux/printk.h:805:75: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:805:75: sparse: sparse: got ascii
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/linux/bug.h, include/linux/fortify-string.h, include/linux/string.h, arc=
h/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: Expected ; at end=
 of declaration
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: got die_will_crash
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/linux/fortify-string.h, include/linux/string.h, arch/powerpc/include/asm=
/paca.h, arch/powerpc/include/asm/current.h, ...):
   include/linux/bug.h:94:33: sparse: sparse: Expected ; at end of declarat=
ion
   include/linux/bug.h:94:33: sparse: sparse: got check_data_corruption
   include/linux/bug.h:94:75: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/bug.h:94:75: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/linux/string.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/as=
m/current.h, include/linux/sched.h, ...):
   include/linux/fortify-string.h:412:23: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:412:23: sparse: sparse: got fortify_memse=
t_chk
   include/linux/fortify-string.h:429:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:429:21: sparse: sparse: got (
   include/linux/fortify-string.h:429:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:431:9: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:431:9: sparse: sparse: got }
   include/linux/fortify-string.h:448:9: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/fortify-string.h:448:16: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:448:16: sparse: sparse: got false
   include/linux/fortify-string.h:449:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:449:1: sparse: sparse: got }
   include/linux/fortify-string.h:515:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:515:21: sparse: sparse: got (
   include/linux/fortify-string.h:515:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:520:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:520:21: sparse: sparse: got (
   include/linux/fortify-string.h:520:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:527:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:527:21: sparse: sparse: got (
   include/linux/fortify-string.h:527:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:531:9: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:531:9: sparse: sparse: got }
   include/linux/fortify-string.h:548:9: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/fortify-string.h:548:14: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:548:14: sparse: sparse: got if
   include/linux/fortify-string.h:562:26: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:562:26: sparse: sparse: got !=3D
   include/linux/fortify-string.h:562:9: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/fortify-string.h:566:9: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/fortify-string.h:566:16: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:566:16: sparse: sparse: got false
   include/linux/fortify-string.h:567:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:567:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/=
powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/lin=
ux/sched.h, ...):
   include/linux/string.h:564:20: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:564:20: sparse: sparse: got strstarts
   include/linux/string.h:567:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/string.h:567:1: sparse: sparse: got }
   include/linux/string.h:582:21: sparse: sparse: Expected ) in function de=
clarator
   include/linux/string.h:582:21: sparse: sparse: got <
   include/linux/string.h:582:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/string.h:585:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/string.h:585:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:585:16: sparse: sparse: got !
   include/linux/string.h:586:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/string.h:586:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h,=
 arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: Ex=
pected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: go=
t generic___test_and_set_bit
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: E=
xpected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: g=
ot &
   include/asm-generic/bitops/generic-non-atomic.h:80:9: sparse: sparse: Tr=
ying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: Ex=
pected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: go=
t }
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: =
Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: =
got &
   include/asm-generic/bitops/generic-non-atomic.h:100:9: sparse: sparse: T=
rying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: E=
xpected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: g=
ot }
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: =
Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: =
got &
   include/asm-generic/bitops/generic-non-atomic.h:112:9: sparse: sparse: T=
rying to use reserved word 'return' as identifier
--
   include/linux/string.h:319:13: sparse: sparse: got parse_option_str
   include/linux/string.h:322:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:322:13: sparse: sparse: got sysfs_streq
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/panic.h:15:38: sparse: sparse: Expected ) in function decl=
arator
   include/linux/panic.h:15:38: sparse: sparse: got args
   include/linux/panic.h:20:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:20:13: sparse: sparse: got oops_may_print
   include/linux/panic.h:22:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:22:13: sparse: sparse: got panic_triggering_all_cp=
u_backtrace
   include/linux/panic.h:29:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:29:13: sparse: sparse: got panic_on_taint_nouserta=
int
   include/linux/panic.h:33:13: sparse: sparse: Expected ; at end of declar=
ation
   include/linux/panic.h:33:13: sparse: sparse: got crash_kexec_post_notifi=
ers
   include/linux/panic.h:54:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:54:6: sparse: sparse: got panic_try_start
   include/linux/panic.h:56:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:56:6: sparse: sparse: got panic_in_progress
   include/linux/panic.h:57:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:57:6: sparse: sparse: got panic_on_this_cpu
   include/linux/panic.h:58:6: sparse: sparse: Expected ; at end of declara=
tion
   include/linux/panic.h:58:6: sparse: sparse: got panic_on_other_cpu
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/printk.h:86:17: sparse: sparse: expected ; at end of decla=
ration
   include/linux/printk.h:86:17: sparse: sparse: Expected } at end of speci=
fier
   include/linux/printk.h:86:17: sparse: sparse: got *
   include/linux/printk.h:87:1: sparse: sparse: Expected ; at the end of ty=
pe declaration
   include/linux/printk.h:87:1: sparse: sparse: got }
   include/linux/printk.h:152:43: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:152:43: sparse: sparse: got args
   include/linux/printk.h:155:38: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:155:38: sparse: sparse: got args
   include/linux/printk.h:157:47: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:157:47: sparse: sparse: got args
   include/linux/printk.h:188:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/printk.h:188:13: sparse: sparse: got printk_timed_ratelimit
   include/linux/printk.h:208:13: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/printk.h:208:13: sparse: sparse: got nbcon_device_try_acqu=
ire
   include/linux/printk.h:211:6: sparse: sparse: Expected ; at end of decla=
ration
   include/linux/printk.h:211:6: sparse: sparse: got pr_flush
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h=
, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of d=
eclaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initial=
ized
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/=
powerpc/include/asm/jump_label.h, include/linux/jump_label.h, include/linux=
/dynamic_debug.h, include/linux/printk.h, ...):
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: Expect=
ed ; at end of declaration
   arch/powerpc/include/asm/feature-fixups.h:294:13: sparse: sparse: got st=
atic_key_feature_checks_initialized
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/linux/jump_label.h, include/linux/dynamic_debug.h, include/linux/printk.=
h, include/asm-generic/bug.h, ...):
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:18:29: sparse: sparse: got arch_st=
atic_branch
   arch/powerpc/include/asm/jump_label.h:28:9: sparse: sparse: Trying to us=
e reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:28:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: Expected ; a=
t end of declaration
   arch/powerpc/include/asm/jump_label.h:29:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: Expected ; a=
t the end of type declaration
   arch/powerpc/include/asm/jump_label.h:31:1: sparse: sparse: got }
   arch/powerpc/include/asm/jump_label.h:43:9: sparse: sparse: Trying to us=
e reserved word 'return' as identifier
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: Expected ; =
at end of declaration
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; a=
t end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; a=
t the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/linux/dynamic_debug.h, include/linux/printk.h, include/asm-generic/bug.h=
, arch/powerpc/include/asm/bug.h, ...):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_bra=
nch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved=
 word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_t=
ransform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_i=
nc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_i=
nc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_i=
nc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of d=
eclaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_l=
ock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of =
declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_=
error
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/linux/printk.h, include/asm-generic/bug.h, arch/powerpc/include/asm/bug.=
h, include/linux/bug.h, ...):
   include/linux/dynamic_debug.h:124:20: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:124:20: sparse: sparse: got ddebug_mode_ha=
s_print
>> include/linux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:127:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:127:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:133:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:133:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:138:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:138:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:138:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:140:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:140:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:145:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:145:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:145:16: sparse: sparse: got mode
   include/linux/dynamic_debug.h:147:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:147:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:152:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:152:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:539:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:539:6: sparse: sparse: got ddebug_apply_ra=
telimit_solo
   include/linux/dynamic_debug.h:540:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:540:6: sparse: sparse: got ddebug_apply_ra=
telimit_shared
   include/linux/dynamic_debug.h:546:29: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:546:29: sparse: sparse: got ddebug_apply_e=
xecution_state
   include/linux/dynamic_debug.h:551:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:551:13: sparse: sparse: got (
>> include/linux/dynamic_debug.h:551:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:555:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:555:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:555:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:557:26: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:557:26: sparse: sparse: got =3D=3D
   include/linux/dynamic_debug.h:557:17: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/dynamic_debug.h:559:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:559:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:564:17: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/dynamic_debug.h:564:24: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:564:24: sparse: sparse: got true
   include/linux/dynamic_debug.h:565:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:565:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:568:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:568:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:573:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:573:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:576:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:576:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:579:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:579:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/asm-generic/bug.h, arch/powerpc/include/asm/bug.h, include/linux/bug.h, =
include/linux/fortify-string.h, ...):
   include/linux/printk.h:760:36: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:760:36: sparse: sparse: got ascii
   include/linux/printk.h:764:62: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:764:62: sparse: sparse: got ascii
   include/linux/printk.h:805:75: sparse: sparse: Expected ) in function de=
clarator
   include/linux/printk.h:805:75: sparse: sparse: got ascii
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/linux/bug.h, include/linux/fortify-string.h, include/linux/string.h, arc=
h/powerpc/include/asm/paca.h, ...):
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: Expected ; at end=
 of declaration
   arch/powerpc/include/asm/bug.h:128:13: sparse: sparse: got die_will_crash
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/linux/fortify-string.h, include/linux/string.h, arch/powerpc/include/asm=
/paca.h, arch/powerpc/include/asm/current.h, ...):
   include/linux/bug.h:94:33: sparse: sparse: Expected ; at end of declarat=
ion
   include/linux/bug.h:94:33: sparse: sparse: got check_data_corruption
   include/linux/bug.h:94:75: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/bug.h:94:75: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/linux/string.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/as=
m/current.h, include/linux/sched.h, ...):
   include/linux/fortify-string.h:412:23: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:412:23: sparse: sparse: got fortify_memse=
t_chk
   include/linux/fortify-string.h:429:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:429:21: sparse: sparse: got (
   include/linux/fortify-string.h:429:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:431:9: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:431:9: sparse: sparse: got }
   include/linux/fortify-string.h:448:9: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/fortify-string.h:448:16: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:448:16: sparse: sparse: got false
   include/linux/fortify-string.h:449:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:449:1: sparse: sparse: got }
   include/linux/fortify-string.h:515:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:515:21: sparse: sparse: got (
   include/linux/fortify-string.h:515:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:520:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:520:21: sparse: sparse: got (
   include/linux/fortify-string.h:520:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:527:21: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:527:21: sparse: sparse: got (
   include/linux/fortify-string.h:527:17: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   include/linux/fortify-string.h:531:9: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:531:9: sparse: sparse: got }
   include/linux/fortify-string.h:548:9: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/fortify-string.h:548:14: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:548:14: sparse: sparse: got if
   include/linux/fortify-string.h:562:26: sparse: sparse: Expected ) in fun=
ction declarator
   include/linux/fortify-string.h:562:26: sparse: sparse: got !=3D
   include/linux/fortify-string.h:562:9: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/fortify-string.h:566:9: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/fortify-string.h:566:16: sparse: sparse: Expected ; at end=
 of declaration
   include/linux/fortify-string.h:566:16: sparse: sparse: got false
   include/linux/fortify-string.h:567:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/fortify-string.h:567:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/=
powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, include/lin=
ux/sched.h, ...):
   include/linux/string.h:564:20: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:564:20: sparse: sparse: got strstarts
   include/linux/string.h:567:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/string.h:567:1: sparse: sparse: got }
   include/linux/string.h:582:21: sparse: sparse: Expected ) in function de=
clarator
   include/linux/string.h:582:21: sparse: sparse: got <
   include/linux/string.h:582:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/string.h:585:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/string.h:585:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/string.h:585:16: sparse: sparse: got !
   include/linux/string.h:586:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/string.h:586:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h,=
 arch/powerpc/include/asm/mmu.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: Ex=
pected ; at end of declaration
   include/asm-generic/bitops/generic-non-atomic.h:73:1: sparse: sparse: go=
t generic___test_and_set_bit
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: E=
xpected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:80:21: sparse: sparse: g=
ot &
   include/asm-generic/bitops/generic-non-atomic.h:80:9: sparse: sparse: Tr=
ying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: Ex=
pected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:81:1: sparse: sparse: go=
t }
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: =
Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:100:21: sparse: sparse: =
got &
   include/asm-generic/bitops/generic-non-atomic.h:100:9: sparse: sparse: T=
rying to use reserved word 'return' as identifier
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: E=
xpected ; at the end of type declaration
   include/asm-generic/bitops/generic-non-atomic.h:101:1: sparse: sparse: g=
ot }
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: =
Expected ) in function declarator
   include/asm-generic/bitops/generic-non-atomic.h:112:21: sparse: sparse: =
got &
   include/asm-generic/bitops/generic-non-atomic.h:112:9: sparse: sparse: T=
rying to use reserved word 'return' as identifier

vim +/return +127 include/linux/dynamic_debug.h

d2c50b9f1ea47a Jim Cromie 2026-07-04  123 =20
d2c50b9f1ea47a Jim Cromie 2026-07-04 @124  static inline bool ddebug_mode_h=
as_print(unsigned int flags)
d2c50b9f1ea47a Jim Cromie 2026-07-04  125  {
d2c50b9f1ea47a Jim Cromie 2026-07-04  126  	unsigned int mode =3D ddebug_ge=
t_mode(flags);
d2c50b9f1ea47a Jim Cromie 2026-07-04 @127  	return mode =3D=3D _DPRINTK_MOD=
E_PRINT ||
d2c50b9f1ea47a Jim Cromie 2026-07-04  128  	       mode =3D=3D _DPRINTK_MOD=
E_PRINT_COUNT ||
d2c50b9f1ea47a Jim Cromie 2026-07-04  129  	       mode =3D=3D _DPRINTK_MOD=
E_ONCE ||
d2c50b9f1ea47a Jim Cromie 2026-07-04  130  	       mode =3D=3D _DPRINTK_MOD=
E_ONCE_FIRED ||
d2c50b9f1ea47a Jim Cromie 2026-07-04  131  	       mode =3D=3D _DPRINTK_MOD=
E_RATELIMIT_SOLO ||
d2c50b9f1ea47a Jim Cromie 2026-07-04  132  	       mode =3D=3D _DPRINTK_MOD=
E_RATELIMIT_SHARED;
d2c50b9f1ea47a Jim Cromie 2026-07-04  133  }
d2c50b9f1ea47a Jim Cromie 2026-07-04  134 =20
d2c50b9f1ea47a Jim Cromie 2026-07-04  135  static inline bool ddebug_mode_h=
as_count(unsigned int flags)
d2c50b9f1ea47a Jim Cromie 2026-07-04  136  {
d2c50b9f1ea47a Jim Cromie 2026-07-04  137  	unsigned int mode =3D ddebug_ge=
t_mode(flags);
d2c50b9f1ea47a Jim Cromie 2026-07-04  138  	return mode =3D=3D _DPRINTK_MOD=
E_COUNT ||
d2c50b9f1ea47a Jim Cromie 2026-07-04  139  	       mode =3D=3D _DPRINTK_MOD=
E_PRINT_COUNT;
d2c50b9f1ea47a Jim Cromie 2026-07-04  140  }
d2c50b9f1ea47a Jim Cromie 2026-07-04  141 =20
d2c50b9f1ea47a Jim Cromie 2026-07-04  142  static inline bool ddebug_mode_h=
as_ratelimit(unsigned int flags)
d2c50b9f1ea47a Jim Cromie 2026-07-04  143  {
d2c50b9f1ea47a Jim Cromie 2026-07-04  144  	unsigned int mode =3D ddebug_ge=
t_mode(flags);
d2c50b9f1ea47a Jim Cromie 2026-07-04  145  	return mode =3D=3D _DPRINTK_MOD=
E_RATELIMIT_SOLO ||
d2c50b9f1ea47a Jim Cromie 2026-07-04  146  	       mode =3D=3D _DPRINTK_MOD=
E_RATELIMIT_SHARED;
d2c50b9f1ea47a Jim Cromie 2026-07-04  147  }
d2c50b9f1ea47a Jim Cromie 2026-07-04  148 =20
d2c50b9f1ea47a Jim Cromie 2026-07-04  149  static inline bool ddebug_mode_e=
nabled(unsigned int flags)
d2c50b9f1ea47a Jim Cromie 2026-07-04  150  {
d2c50b9f1ea47a Jim Cromie 2026-07-04  151  	return ddebug_get_mode(flags) !=
=3D _DPRINTK_MODE_DISABLED;
d2c50b9f1ea47a Jim Cromie 2026-07-04 @152  }
d2c50b9f1ea47a Jim Cromie 2026-07-04  153 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
