Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53879476CED
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Aug 2026 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242864; cv=none; b=FGIqqBhj3haJax1rmwSlh+hQAArQX2ii6moO1zcHP5D4Y/jY/GIHMf6gufM9aYFPrD30IAO8VbRfOnYEypnMd8xTklWQ5jxErxq7Av+gOWzMwLqIMa/Dq60vY5f0wQIzJKMXIrbssvTk5nV5nQFsEkS+uD07P0fhEIJSJ4cU3jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242864; c=relaxed/simple;
	bh=y5ddLXRK+EQ3+OmDw1dGkfwz4pHWMV8I3ODfVIpkVLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dv/5KyKgI9CKxaRagE/Ydyz3wySgTiM/f3VYYUDTPRxDyBuRqI61l5Imy/l9td7utW9zCh/MXzYpQM/WlQyVIdabEzqAB8kFlkUNqwvKodH9GpDo3zaANK6YLFkNb/aRr42rjciF91hxj8YN+u0tqu0UXOfgViXLcGqSfmHAHJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEgwb1aQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEgwb1aQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787242859; x=1818778859;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=y5ddLXRK+EQ3+OmDw1dGkfwz4pHWMV8I3ODfVIpkVLk=;
  b=QEgwb1aQVIjm/9Kh/Qulhlgmm1ix/3Yi8yy4bD9lw8Kk5Kf1xnP42/sq
   2AozV16P6uK0soVR+zkToWBklgkWrEenZ8fnvuke95J6O+ruAPFjhtAhh
   qvaS+L3hBdXbnpe5MpMFTiZjYbq/+zzbWClpIAlgBIFFvAknAjypzmlpK
   qD5uAt4pm4hHP1trh45Rj76Fn+tnoDp4Izxy0Dv+fKr/Z+ve0QemvH9pS
   JsdB/Q/GuPIJZIUgUhtO7HikiQ+0uJWGqcQkSMR9P23zdPI40plidOyZS
   FyYTl+UCtCxzNYB7MwrnbAeLsxJC/5pryiQ+Ld1dSZIToNS8Kwcwn6zu7
   Q==;
X-CSE-ConnectionGUID: x8GQ0fm2SzyAs+bOWfdlcQ==
X-CSE-MsgGUID: 40khkIr1TYaq/IcEd+k7qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87656078"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87656078"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:20:58 -0700
X-CSE-ConnectionGUID: q4qebSg1RQaaR9Q7sbzD1Q==
X-CSE-MsgGUID: A69walq+R9ywlcw3CSv8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="261823387"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2026 09:20:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx5Ve-00000000mnJ-3RR3;
	Thu, 20 Aug 2026 16:20:54 +0000
Date: Fri, 21 Aug 2026 00:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:dd-ratelimit-2 71/76]
 include/linux/dynamic_debug.h:181:9: sparse: sparse: Trying to use reserved
 word 'switch' as identifier
Message-ID: <202608210020.JZnLn6Ie-lkp@intel.com>
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
inux/dynamic_debug.h:181:9: sparse: sparse: Trying to use reserved word 'sw=
itch' as identifier"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-ratelimit-2
head:   31212444bcca4d1547711ec572b5a398d74640ca
commit: 5431913f1c32e528c1560f4959a01aeef714a64f [71/76] lib/dynamic_debug:=
 map virtual flags to physical 3-bit mode representation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r132-20260820 (https://download.01.org/0day-ci=
/archive/20260821/202608210020.JZnLn6Ie-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260821/202608210020.JZnLn6Ie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608210020.JZnLn6Ie-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   include/linux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reser=
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
   include/linux/dynamic_debug.h:181:32: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:181:32: sparse: sparse: got (
>> include/linux/dynamic_debug.h:181:9: sparse: sparse: Trying to use reser=
ved word 'switch' as identifier
>> include/linux/dynamic_debug.h:184:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:185:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:185:14: sparse: sparse: got 2
>> include/linux/dynamic_debug.h:185:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:187:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:188:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:188:14: sparse: sparse: got 3
   include/linux/dynamic_debug.h:188:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:190:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:191:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:191:14: sparse: sparse: got 4
   include/linux/dynamic_debug.h:191:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:194:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:195:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:195:14: sparse: sparse: got 6
   include/linux/dynamic_debug.h:195:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:197:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:198:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:198:14: sparse: sparse: got 7
   include/linux/dynamic_debug.h:198:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:200:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
>> include/linux/dynamic_debug.h:201:9: sparse: sparse: Trying to use reser=
ved word 'default' as identifier
   include/linux/dynamic_debug.h:201:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:201:16: sparse: sparse: got :
   include/linux/dynamic_debug.h:203:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:203:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:205:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:205:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:213:14: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:213:14: sparse: sparse: got virt_print
   include/linux/dynamic_debug.h:216:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
>> include/linux/dynamic_debug.h:216:13: sparse: sparse: missing type decla=
ration for parameter 'virt_print'
>> include/linux/dynamic_debug.h:238:11: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/dynamic_debug.h:238:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:238:16: sparse: sparse: got {
   include/linux/dynamic_debug.h:241:17: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/dynamic_debug.h:242:25: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:242:25: sparse: sparse: got mode
   include/linux/dynamic_debug.h:243:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:243:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:246:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:246:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:246:16: sparse: sparse: got phys_flags
   include/linux/dynamic_debug.h:247:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:247:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:624:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:624:6: sparse: sparse: got ddebug_apply_ra=
telimit_solo
   include/linux/dynamic_debug.h:625:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:625:6: sparse: sparse: got ddebug_apply_ra=
telimit_shared
   include/linux/dynamic_debug.h:631:29: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:631:29: sparse: sparse: got ddebug_apply_e=
xecution_state
   include/linux/dynamic_debug.h:636:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:636:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:636:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:640:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:640:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:640:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:642:26: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:642:26: sparse: sparse: got =3D=3D
   include/linux/dynamic_debug.h:642:17: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/dynamic_debug.h:644:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:644:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:649:17: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/dynamic_debug.h:649:24: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:649:24: sparse: sparse: got true
   include/linux/dynamic_debug.h:650:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:650:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:653:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:653:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:658:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:658:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:661:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:661:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:664:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:664:1: sparse: sparse: got }
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
--
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
   include/linux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reser=
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
   include/linux/dynamic_debug.h:181:32: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:181:32: sparse: sparse: got (
>> include/linux/dynamic_debug.h:181:9: sparse: sparse: Trying to use reser=
ved word 'switch' as identifier
>> include/linux/dynamic_debug.h:184:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:185:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:185:14: sparse: sparse: got 2
>> include/linux/dynamic_debug.h:185:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:187:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:188:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:188:14: sparse: sparse: got 3
   include/linux/dynamic_debug.h:188:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:190:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:191:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:191:14: sparse: sparse: got 4
   include/linux/dynamic_debug.h:191:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:194:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:195:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:195:14: sparse: sparse: got 6
   include/linux/dynamic_debug.h:195:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:197:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:198:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:198:14: sparse: sparse: got 7
   include/linux/dynamic_debug.h:198:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:200:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
>> include/linux/dynamic_debug.h:201:9: sparse: sparse: Trying to use reser=
ved word 'default' as identifier
   include/linux/dynamic_debug.h:201:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:201:16: sparse: sparse: got :
   include/linux/dynamic_debug.h:203:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:203:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:205:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:205:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:213:14: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:213:14: sparse: sparse: got virt_print
   include/linux/dynamic_debug.h:216:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
>> include/linux/dynamic_debug.h:216:13: sparse: sparse: missing type decla=
ration for parameter 'virt_print'
>> include/linux/dynamic_debug.h:238:11: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/dynamic_debug.h:238:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:238:16: sparse: sparse: got {
   include/linux/dynamic_debug.h:241:17: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/dynamic_debug.h:242:25: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:242:25: sparse: sparse: got mode
   include/linux/dynamic_debug.h:243:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:243:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:246:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:246:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:246:16: sparse: sparse: got phys_flags
   include/linux/dynamic_debug.h:247:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:247:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:624:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:624:6: sparse: sparse: got ddebug_apply_ra=
telimit_solo
   include/linux/dynamic_debug.h:625:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:625:6: sparse: sparse: got ddebug_apply_ra=
telimit_shared
   include/linux/dynamic_debug.h:631:29: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:631:29: sparse: sparse: got ddebug_apply_e=
xecution_state
   include/linux/dynamic_debug.h:636:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:636:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:636:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:640:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:640:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:640:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:642:26: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:642:26: sparse: sparse: got =3D=3D
   include/linux/dynamic_debug.h:642:17: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/dynamic_debug.h:644:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:644:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:649:17: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/dynamic_debug.h:649:24: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:649:24: sparse: sparse: got true
   include/linux/dynamic_debug.h:650:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:650:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:653:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:653:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:658:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:658:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:661:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:661:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:664:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:664:1: sparse: sparse: got }
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
--
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
   include/linux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reser=
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
   include/linux/dynamic_debug.h:181:32: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:181:32: sparse: sparse: got (
>> include/linux/dynamic_debug.h:181:9: sparse: sparse: Trying to use reser=
ved word 'switch' as identifier
>> include/linux/dynamic_debug.h:184:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:185:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:185:14: sparse: sparse: got 2
>> include/linux/dynamic_debug.h:185:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:187:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:188:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:188:14: sparse: sparse: got 3
   include/linux/dynamic_debug.h:188:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:190:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:191:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:191:14: sparse: sparse: got 4
   include/linux/dynamic_debug.h:191:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:194:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:195:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:195:14: sparse: sparse: got 6
   include/linux/dynamic_debug.h:195:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:197:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:198:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:198:14: sparse: sparse: got 7
   include/linux/dynamic_debug.h:198:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:200:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
>> include/linux/dynamic_debug.h:201:9: sparse: sparse: Trying to use reser=
ved word 'default' as identifier
   include/linux/dynamic_debug.h:201:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:201:16: sparse: sparse: got :
   include/linux/dynamic_debug.h:203:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:203:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:205:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:205:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:213:14: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:213:14: sparse: sparse: got virt_print
   include/linux/dynamic_debug.h:216:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
>> include/linux/dynamic_debug.h:216:13: sparse: sparse: missing type decla=
ration for parameter 'virt_print'
>> include/linux/dynamic_debug.h:238:11: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/dynamic_debug.h:238:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:238:16: sparse: sparse: got {
   include/linux/dynamic_debug.h:241:17: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/dynamic_debug.h:242:25: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:242:25: sparse: sparse: got mode
   include/linux/dynamic_debug.h:243:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:243:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:246:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:246:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:246:16: sparse: sparse: got phys_flags
   include/linux/dynamic_debug.h:247:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:247:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:624:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:624:6: sparse: sparse: got ddebug_apply_ra=
telimit_solo
   include/linux/dynamic_debug.h:625:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:625:6: sparse: sparse: got ddebug_apply_ra=
telimit_shared
   include/linux/dynamic_debug.h:631:29: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:631:29: sparse: sparse: got ddebug_apply_e=
xecution_state
   include/linux/dynamic_debug.h:636:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:636:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:636:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:640:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:640:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:640:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:642:26: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:642:26: sparse: sparse: got =3D=3D
   include/linux/dynamic_debug.h:642:17: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/dynamic_debug.h:644:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:644:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:649:17: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/dynamic_debug.h:649:24: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:649:24: sparse: sparse: got true
   include/linux/dynamic_debug.h:650:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:650:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:653:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:653:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:658:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:658:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:661:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:661:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:664:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:664:1: sparse: sparse: got }
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
--
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
   include/linux/dynamic_debug.h:127:9: sparse: sparse: Trying to use reser=
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
   include/linux/dynamic_debug.h:181:32: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:181:32: sparse: sparse: got (
>> include/linux/dynamic_debug.h:181:9: sparse: sparse: Trying to use reser=
ved word 'switch' as identifier
>> include/linux/dynamic_debug.h:184:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:185:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:185:14: sparse: sparse: got 2
>> include/linux/dynamic_debug.h:185:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:187:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:188:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:188:14: sparse: sparse: got 3
   include/linux/dynamic_debug.h:188:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:190:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:191:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:191:14: sparse: sparse: got 4
   include/linux/dynamic_debug.h:191:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:194:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:195:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:195:14: sparse: sparse: got 6
   include/linux/dynamic_debug.h:195:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:197:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
   include/linux/dynamic_debug.h:198:14: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:198:14: sparse: sparse: got 7
   include/linux/dynamic_debug.h:198:9: sparse: sparse: Trying to use reser=
ved word 'case' as identifier
   include/linux/dynamic_debug.h:200:17: sparse: sparse: Trying to use rese=
rved word 'break' as identifier
>> include/linux/dynamic_debug.h:201:9: sparse: sparse: Trying to use reser=
ved word 'default' as identifier
   include/linux/dynamic_debug.h:201:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:201:16: sparse: sparse: got :
   include/linux/dynamic_debug.h:203:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:203:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:205:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:205:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:213:14: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:213:14: sparse: sparse: got virt_print
   include/linux/dynamic_debug.h:216:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
>> include/linux/dynamic_debug.h:216:13: sparse: sparse: missing type decla=
ration for parameter 'virt_print'
>> include/linux/dynamic_debug.h:238:11: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/dynamic_debug.h:238:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:238:16: sparse: sparse: got {
   include/linux/dynamic_debug.h:241:17: sparse: sparse: Trying to use rese=
rved word 'else' as identifier
   include/linux/dynamic_debug.h:242:25: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:242:25: sparse: sparse: got mode
   include/linux/dynamic_debug.h:243:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:243:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:246:9: sparse: sparse: Trying to use reser=
ved word 'return' as identifier
   include/linux/dynamic_debug.h:246:16: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:246:16: sparse: sparse: got phys_flags
   include/linux/dynamic_debug.h:247:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:247:1: sparse: sparse: got }
   include/linux/dynamic_debug.h:624:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:624:6: sparse: sparse: got ddebug_apply_ra=
telimit_solo
   include/linux/dynamic_debug.h:625:6: sparse: sparse: Expected ; at end o=
f declaration
   include/linux/dynamic_debug.h:625:6: sparse: sparse: got ddebug_apply_ra=
telimit_shared
   include/linux/dynamic_debug.h:631:29: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:631:29: sparse: sparse: got ddebug_apply_e=
xecution_state
   include/linux/dynamic_debug.h:636:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:636:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:636:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:640:13: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:640:13: sparse: sparse: got (
   include/linux/dynamic_debug.h:640:9: sparse: sparse: Trying to use reser=
ved word 'if' as identifier
   include/linux/dynamic_debug.h:642:26: sparse: sparse: Expected ) in func=
tion declarator
   include/linux/dynamic_debug.h:642:26: sparse: sparse: got =3D=3D
   include/linux/dynamic_debug.h:642:17: sparse: sparse: Trying to use rese=
rved word 'if' as identifier
   include/linux/dynamic_debug.h:644:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:644:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:649:17: sparse: sparse: Trying to use rese=
rved word 'return' as identifier
   include/linux/dynamic_debug.h:649:24: sparse: sparse: Expected ; at end =
of declaration
   include/linux/dynamic_debug.h:649:24: sparse: sparse: got true
   include/linux/dynamic_debug.h:650:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:650:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:653:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:653:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:658:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:658:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:661:9: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:661:9: sparse: sparse: got }
   include/linux/dynamic_debug.h:664:1: sparse: sparse: Expected ; at the e=
nd of type declaration
   include/linux/dynamic_debug.h:664:1: sparse: sparse: got }
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

vim +/switch +181 include/linux/dynamic_debug.h

d2c50b9f1ea47a Jim Cromie 2026-07-04  141 =20
d2c50b9f1ea47a Jim Cromie 2026-07-04  142  static inline bool ddebug_mode_h=
as_ratelimit(unsigned int flags)
d2c50b9f1ea47a Jim Cromie 2026-07-04  143  {
d2c50b9f1ea47a Jim Cromie 2026-07-04  144  	unsigned int mode =3D ddebug_ge=
t_mode(flags);
d2c50b9f1ea47a Jim Cromie 2026-07-04 @145  	return mode =3D=3D _DPRINTK_MOD=
E_RATELIMIT_SOLO ||
d2c50b9f1ea47a Jim Cromie 2026-07-04  146  	       mode =3D=3D _DPRINTK_MOD=
E_RATELIMIT_SHARED;
d2c50b9f1ea47a Jim Cromie 2026-07-04 @147  }
d2c50b9f1ea47a Jim Cromie 2026-07-04  148 =20
d2c50b9f1ea47a Jim Cromie 2026-07-04  149  static inline bool ddebug_mode_e=
nabled(unsigned int flags)
d2c50b9f1ea47a Jim Cromie 2026-07-04  150  {
d2c50b9f1ea47a Jim Cromie 2026-07-04  151  	return ddebug_get_mode(flags) !=
=3D _DPRINTK_MODE_DISABLED;
d2c50b9f1ea47a Jim Cromie 2026-07-04  152  }
d2c50b9f1ea47a Jim Cromie 2026-07-04  153 =20
d2c50b9f1ea47a Jim Cromie 2026-07-04  154  #define _DPRINTK_FLAGS_ANY_RATEL=
IMIT \
d2c50b9f1ea47a Jim Cromie 2026-07-04  155  	(_DPRINTK_MODE_RATELIMIT_SOLO |=
 _DPRINTK_MODE_RATELIMIT_SHARED)
d2c50b9f1ea47a Jim Cromie 2026-07-04  156 =20
d2c50b9f1ea47a Jim Cromie 2026-07-04  157  #define _DPRINTK_FLAGS_ENABLED \
d2c50b9f1ea47a Jim Cromie 2026-07-04  158  	(_DPRINTK_MODE_PRINT | _DPRINTK=
_MODE_COUNT | _DPRINTK_MODE_PRINT_COUNT | \
d2c50b9f1ea47a Jim Cromie 2026-07-04  159  	 _DPRINTK_MODE_ONCE | _DPRINTK_=
MODE_ONCE_FIRED | \
d2c50b9f1ea47a Jim Cromie 2026-07-04  160  	 _DPRINTK_MODE_RATELIMIT_SOLO |=
 _DPRINTK_MODE_RATELIMIT_SHARED)
d2c50b9f1ea47a Jim Cromie 2026-07-04  161 =20
d2c50b9f1ea47a Jim Cromie 2026-07-04  162  #define _DPRINTK_FLAGS_ACTIVE  _=
DPRINTK_FLAGS_ENABLED
d2c50b9f1ea47a Jim Cromie 2026-07-04  163 =20
5431913f1c32e5 Jim Cromie 2026-07-17  164  #define DDEBUG_VIRTUAL_TO_PHYSIC=
AL_CONST(virt_flags) ( \
5431913f1c32e5 Jim Cromie 2026-07-17  165  	((virt_flags) & ~(_DPRINTK_FLAG=
S_PRINT | _DPRINTK_FLAGS_COUNT | \
5431913f1c32e5 Jim Cromie 2026-07-17  166  			  _DPRINTK_FLAGS_RATELIMIT_SO=
LO | _DPRINTK_FLAGS_RATELIMIT_SHARED | \
5431913f1c32e5 Jim Cromie 2026-07-17  167  			  _DPRINTK_FLAGS_ONCE)) | \
5431913f1c32e5 Jim Cromie 2026-07-17  168  	(((virt_flags) & _DPRINTK_FLAGS=
_ONCE) ? _DPRINTK_MODE_ONCE : \
5431913f1c32e5 Jim Cromie 2026-07-17  169  	 ((virt_flags) & _DPRINTK_FLAGS=
_RATELIMIT_SOLO) ? _DPRINTK_MODE_RATELIMIT_SOLO : \
5431913f1c32e5 Jim Cromie 2026-07-17  170  	 ((virt_flags) & _DPRINTK_FLAGS=
_RATELIMIT_SHARED) ? _DPRINTK_MODE_RATELIMIT_SHARED : \
5431913f1c32e5 Jim Cromie 2026-07-17  171  	 (((virt_flags) & _DPRINTK_FLAG=
S_PRINT) && ((virt_flags) & _DPRINTK_FLAGS_COUNT)) ? _DPRINTK_MODE_PRINT_CO=
UNT : \
5431913f1c32e5 Jim Cromie 2026-07-17  172  	 ((virt_flags) & _DPRINTK_FLAGS=
_PRINT) ? _DPRINTK_MODE_PRINT : \
5431913f1c32e5 Jim Cromie 2026-07-17  173  	 ((virt_flags) & _DPRINTK_FLAGS=
_COUNT) ? _DPRINTK_MODE_COUNT : \
5431913f1c32e5 Jim Cromie 2026-07-17  174  	 _DPRINTK_MODE_DISABLED) \
5431913f1c32e5 Jim Cromie 2026-07-17  175  )
5431913f1c32e5 Jim Cromie 2026-07-17  176 =20
5431913f1c32e5 Jim Cromie 2026-07-17  177  static inline unsigned int ddebu=
g_physical_to_virtual(unsigned int phys_flags)
5431913f1c32e5 Jim Cromie 2026-07-17  178  {
5431913f1c32e5 Jim Cromie 2026-07-17  179  	unsigned int virt_flags =3D phy=
s_flags & ~_DPRINTK_MODE_MASK;
5431913f1c32e5 Jim Cromie 2026-07-17  180 =20
5431913f1c32e5 Jim Cromie 2026-07-17 @181  	switch (ddebug_get_mode(phys_fl=
ags)) {
5431913f1c32e5 Jim Cromie 2026-07-17  182  	case _DPRINTK_MODE_PRINT:
5431913f1c32e5 Jim Cromie 2026-07-17  183  		virt_flags |=3D _DPRINTK_FLAGS=
_PRINT;
5431913f1c32e5 Jim Cromie 2026-07-17 @184  		break;
5431913f1c32e5 Jim Cromie 2026-07-17 @185  	case _DPRINTK_MODE_COUNT:
5431913f1c32e5 Jim Cromie 2026-07-17  186  		virt_flags |=3D _DPRINTK_FLAGS=
_COUNT;
5431913f1c32e5 Jim Cromie 2026-07-17  187  		break;
5431913f1c32e5 Jim Cromie 2026-07-17  188  	case _DPRINTK_MODE_PRINT_COUNT:
5431913f1c32e5 Jim Cromie 2026-07-17  189  		virt_flags |=3D _DPRINTK_FLAGS=
_PRINT | _DPRINTK_FLAGS_COUNT;
5431913f1c32e5 Jim Cromie 2026-07-17  190  		break;
5431913f1c32e5 Jim Cromie 2026-07-17  191  	case _DPRINTK_MODE_ONCE:
5431913f1c32e5 Jim Cromie 2026-07-17  192  	case _DPRINTK_MODE_ONCE_FIRED:
5431913f1c32e5 Jim Cromie 2026-07-17  193  		virt_flags |=3D _DPRINTK_FLAGS=
_PRINT | _DPRINTK_FLAGS_ONCE;
5431913f1c32e5 Jim Cromie 2026-07-17 @194  		break;
5431913f1c32e5 Jim Cromie 2026-07-17  195  	case _DPRINTK_MODE_RATELIMIT_SO=
LO:
5431913f1c32e5 Jim Cromie 2026-07-17  196  		virt_flags |=3D _DPRINTK_FLAGS=
_PRINT | _DPRINTK_FLAGS_RATELIMIT_SOLO;
5431913f1c32e5 Jim Cromie 2026-07-17  197  		break;
5431913f1c32e5 Jim Cromie 2026-07-17  198  	case _DPRINTK_MODE_RATELIMIT_SH=
ARED:
5431913f1c32e5 Jim Cromie 2026-07-17  199  		virt_flags |=3D _DPRINTK_FLAGS=
_PRINT | _DPRINTK_FLAGS_RATELIMIT_SHARED;
5431913f1c32e5 Jim Cromie 2026-07-17  200  		break;
5431913f1c32e5 Jim Cromie 2026-07-17 @201  	default:
5431913f1c32e5 Jim Cromie 2026-07-17  202  		break;
5431913f1c32e5 Jim Cromie 2026-07-17  203  	}
5431913f1c32e5 Jim Cromie 2026-07-17  204  	return virt_flags;
5431913f1c32e5 Jim Cromie 2026-07-17  205  }
5431913f1c32e5 Jim Cromie 2026-07-17  206 =20
5431913f1c32e5 Jim Cromie 2026-07-17  207  static inline unsigned int ddebu=
g_virtual_to_physical(unsigned int virt_flags, unsigned int orig_phys_flags=
, unsigned int modifiers_flags)
5431913f1c32e5 Jim Cromie 2026-07-17  208  {
5431913f1c32e5 Jim Cromie 2026-07-17  209  	unsigned int phys_flags =3D vir=
t_flags & ~(_DPRINTK_FLAGS_PRINT | _DPRINTK_FLAGS_COUNT |
5431913f1c32e5 Jim Cromie 2026-07-17  210  						 _DPRINTK_FLAGS_RATELIMIT_=
SOLO | _DPRINTK_FLAGS_RATELIMIT_SHARED |
5431913f1c32e5 Jim Cromie 2026-07-17  211  						 _DPRINTK_FLAGS_ONCE);
5431913f1c32e5 Jim Cromie 2026-07-17  212  	unsigned int mode =3D _DPRINTK_=
MODE_DISABLED;
5431913f1c32e5 Jim Cromie 2026-07-17  213  	bool virt_print =3D (virt_flags=
 & _DPRINTK_FLAGS_PRINT) ||
5431913f1c32e5 Jim Cromie 2026-07-17  214  			  (modifiers_flags & (_DPRINT=
K_FLAGS_ONCE | _DPRINTK_FLAGS_RATELIMIT_SOLO | _DPRINTK_FLAGS_RATELIMIT_SHA=
RED));
5431913f1c32e5 Jim Cromie 2026-07-17  215 =20
5431913f1c32e5 Jim Cromie 2026-07-17 @216  	if (virt_print) {
5431913f1c32e5 Jim Cromie 2026-07-17  217  		if (modifiers_flags & _DPRINTK=
_FLAGS_ONCE) {
5431913f1c32e5 Jim Cromie 2026-07-17  218  			mode =3D _DPRINTK_MODE_ONCE;
5431913f1c32e5 Jim Cromie 2026-07-17  219  		} else if (modifiers_flags & _=
DPRINTK_FLAGS_RATELIMIT_SOLO) {
5431913f1c32e5 Jim Cromie 2026-07-17  220  			mode =3D _DPRINTK_MODE_RATELI=
MIT_SOLO;
5431913f1c32e5 Jim Cromie 2026-07-17  221  		} else if (modifiers_flags & _=
DPRINTK_FLAGS_RATELIMIT_SHARED) {
5431913f1c32e5 Jim Cromie 2026-07-17  222  			mode =3D _DPRINTK_MODE_RATELI=
MIT_SHARED;
5431913f1c32e5 Jim Cromie 2026-07-17  223  		} else if (virt_flags & _DPRIN=
TK_FLAGS_ONCE) {
5431913f1c32e5 Jim Cromie 2026-07-17  224  			unsigned int orig_mode =3D dd=
ebug_get_mode(orig_phys_flags);
5431913f1c32e5 Jim Cromie 2026-07-17  225  			if (orig_mode =3D=3D _DPRINTK=
_MODE_ONCE_FIRED)
5431913f1c32e5 Jim Cromie 2026-07-17  226  				mode =3D _DPRINTK_MODE_ONCE_=
FIRED;
5431913f1c32e5 Jim Cromie 2026-07-17  227  			else
5431913f1c32e5 Jim Cromie 2026-07-17  228  				mode =3D _DPRINTK_MODE_ONCE;
5431913f1c32e5 Jim Cromie 2026-07-17  229  		} else if (virt_flags & _DPRIN=
TK_FLAGS_RATELIMIT_SOLO) {
5431913f1c32e5 Jim Cromie 2026-07-17  230  			mode =3D _DPRINTK_MODE_RATELI=
MIT_SOLO;
5431913f1c32e5 Jim Cromie 2026-07-17  231  		} else if (virt_flags & _DPRIN=
TK_FLAGS_RATELIMIT_SHARED) {
5431913f1c32e5 Jim Cromie 2026-07-17  232  			mode =3D _DPRINTK_MODE_RATELI=
MIT_SHARED;
5431913f1c32e5 Jim Cromie 2026-07-17  233  		} else if (virt_flags & _DPRIN=
TK_FLAGS_COUNT) {
5431913f1c32e5 Jim Cromie 2026-07-17  234  			mode =3D _DPRINTK_MODE_PRINT_=
COUNT;
5431913f1c32e5 Jim Cromie 2026-07-17  235  		} else {
5431913f1c32e5 Jim Cromie 2026-07-17  236  			mode =3D _DPRINTK_MODE_PRINT;
5431913f1c32e5 Jim Cromie 2026-07-17  237  		}
5431913f1c32e5 Jim Cromie 2026-07-17 @238  	} else {
5431913f1c32e5 Jim Cromie 2026-07-17  239  		if (virt_flags & _DPRINTK_FLAG=
S_COUNT)
5431913f1c32e5 Jim Cromie 2026-07-17  240  			mode =3D _DPRINTK_MODE_COUNT;
5431913f1c32e5 Jim Cromie 2026-07-17  241  		else
5431913f1c32e5 Jim Cromie 2026-07-17  242  			mode =3D _DPRINTK_MODE_DISABL=
ED;
5431913f1c32e5 Jim Cromie 2026-07-17  243  	}
5431913f1c32e5 Jim Cromie 2026-07-17  244 =20
5431913f1c32e5 Jim Cromie 2026-07-17  245  	phys_flags |=3D mode;
5431913f1c32e5 Jim Cromie 2026-07-17  246  	return phys_flags;
5431913f1c32e5 Jim Cromie 2026-07-17  247  }
5431913f1c32e5 Jim Cromie 2026-07-17  248 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
