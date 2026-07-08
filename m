Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49550420896
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jul 2026 02:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783478102; cv=none; b=DkCpakSbLktPVrkwXfJAkh9hJT5L+MZYIlsbKpVIhvR2/LrEYoMx9m9tSAK9nkp5nXbnnUwlpiTLD45NnpBXuaLQu6qlJZjzVKarNyaqXJeGG0sfge5VW/L7EkZZyofJpR19zrJSR7Ej0x00DtKtd/054HkrpB6yio3pTRL4U2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783478102; c=relaxed/simple;
	bh=DTcGFM9PcGB13QFoTFpiNtJrCUekGDYmfW2+kvQHy8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aDJ+ohJB8t5xkOBjZLLyq/bCIBnRrVrkhuXabqlsbKB6l05HBKYTREgBdCARuguP5/VuAwXHGxbr+h+ojK1HDAAJilWvaVsOICdd/8HbjglgBvEhPR2DPSTUsFnmwuvbhqu3cgOIIjLt6NH1g+xEM4r+hhE6fCaqHct5kusrT6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJJ7Ne/S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJJ7Ne/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783478100; x=1815014100;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DTcGFM9PcGB13QFoTFpiNtJrCUekGDYmfW2+kvQHy8o=;
  b=ZJJ7Ne/SmdYfqsva3cDmPl1v+9k/vZNCW5Uwdz83NUVTEBgPl0BYqnJX
   u9U4hb4ky/XXP82GQA8DqhDls0sEWJgo3wehWzzRracaFi0HlF87vihrR
   qNwyOcQUmKF5FoYy1Zr2ankycVvNimvOBgnDl3ijRnAsyA08tJ4hM/EDn
   NrQdNCptuEUbS15dj0BykeiBPZVg2HgqEVMLUijXxZbn2igIkEq7JPqQG
   CVyRvOUlqkKejEi5aWnqCuDmrfZwgcYHfgeAR9COgug8Qi4qPfIbAZJpq
   2MvDWuF/YD9vd7KDbQP69bi5Al81i73+qnKXbkODChslaS5B2Hxag0xbF
   A==;
X-CSE-ConnectionGUID: flAfEfibTWeqSmSY1eopbg==
X-CSE-MsgGUID: 5SmUawHdSH+Zy/6R5LQL6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83991332"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83991332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 19:35:00 -0700
X-CSE-ConnectionGUID: P/SxKsCWSBuzEUEl+MSo5w==
X-CSE-MsgGUID: Ug50OK0VSyKqvITLsO45fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258470215"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 07 Jul 2026 19:34:59 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whI7k-000000002ef-3JfM;
	Wed, 08 Jul 2026 02:34:56 +0000
Date: Wed, 08 Jul 2026 04:34:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:entry/rework 18/18]
 arch/powerpc/kernel/syscall.c:22:17: error: expected ')' before 'return'
Message-ID: <202607080446.aXiq0dpo-lkp@intel.com>
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
TO: "Michal Such=C3=A1nek" <msuchanek@suse.de>
CC: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entr=
y/rework
head:   af0a53579c942e9d22020e22347b4bf94686bcf0
commit: af0a53579c942e9d22020e22347b4bf94686bcf0 [18/18] entry, treewide: M=
ake syscall_enter_from_user_mode[_work]() indicate syscall execution
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20260708/202607080446.aXiq0dpo-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260708/202607080446.aXiq0dpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607080446.aXiq0dpo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/powerpc/kernel/syscall.c: In function 'system_call_exception':
>> arch/powerpc/kernel/syscall.c:22:17: error: expected ')' before 'return'
      22 |                 return syscall_get_error(current, regs);
         |                 ^~~~~~
   arch/powerpc/kernel/syscall.c:21:12: note: to match this '('
      21 |         if (unlikely(!syscall_enter_from_user_mode_randomize_sta=
ck(regs, &r0))
         |            ^
>> arch/powerpc/kernel/syscall.c:63:1: error: expected expression before '}=
' token
      63 | }
         | ^
>> arch/powerpc/kernel/syscall.c:19:20: warning: unused variable 'f' [-Wunu=
sed-variable]
      19 |         syscall_fn f;
         |                    ^
>> arch/powerpc/kernel/syscall.c:18:14: warning: unused variable 'ret' [-Wu=
nused-variable]
      18 |         long ret;
         |              ^~~
>> arch/powerpc/kernel/syscall.c:63:1: warning: control reaches end of non-=
void function [-Wreturn-type]
      63 | }
         | ^


vim +22 arch/powerpc/kernel/syscall.c

1547db7d1f4481 Xiu Jianfeng            2022-07-01  13 =20
1547db7d1f4481 Xiu Jianfeng            2022-07-01  14 =20
1547db7d1f4481 Xiu Jianfeng            2022-07-01  15  /* Has to run notrac=
e because it is entered not completely "reconciled" */
f8971c627b1404 Rohan McLure            2022-09-21  16  notrace long system_=
call_exception(struct pt_regs *regs, unsigned long r0)
1547db7d1f4481 Xiu Jianfeng            2022-07-01  17  {
f4a0318f278d98 Xiu Jianfeng            2022-07-01 @18  	long ret;
1547db7d1f4481 Xiu Jianfeng            2022-07-01 @19  	syscall_fn f;
1547db7d1f4481 Xiu Jianfeng            2022-07-01  20 =20
af0a53579c942e Michal Such=C3=A1nek         2026-07-06 @21  	if (unlikely(!=
syscall_enter_from_user_mode_randomize_stack(regs, &r0))
af0a53579c942e Michal Such=C3=A1nek         2026-07-06 @22  		return syscal=
l_get_error(current, regs);
a96ef5848cb096 Ryan Roberts            2026-03-03  23 =20
bee25f97ad2464 Mukesh Kumar Chaurasiya 2026-04-27  24  	if (unlikely(r0 >=
=3D NR_syscalls)) {
1547db7d1f4481 Xiu Jianfeng            2022-07-01  25  		if (unlikely(trap_=
is_unsupported_scv(regs))) {
1547db7d1f4481 Xiu Jianfeng            2022-07-01  26  			/* Unsupported sc=
v vector */
1547db7d1f4481 Xiu Jianfeng            2022-07-01  27  			_exception(SIGILL=
, regs, ILL_ILLOPC, regs->nip);
1547db7d1f4481 Xiu Jianfeng            2022-07-01  28  			return regs->gpr[=
3];
1547db7d1f4481 Xiu Jianfeng            2022-07-01  29  		}
1547db7d1f4481 Xiu Jianfeng            2022-07-01  30  		return -ENOSYS;
1547db7d1f4481 Xiu Jianfeng            2022-07-01  31  	}
1547db7d1f4481 Xiu Jianfeng            2022-07-01  32 =20
1547db7d1f4481 Xiu Jianfeng            2022-07-01  33  	/* May be faster to=
 do array_index_nospec? */
1547db7d1f4481 Xiu Jianfeng            2022-07-01  34  	barrier_nospec();
1547db7d1f4481 Xiu Jianfeng            2022-07-01  35 =20
7e92e01b724526 Rohan McLure            2022-09-21  36  #ifdef CONFIG_ARCH_H=
AS_SYSCALL_WRAPPER
7e92e01b724526 Rohan McLure            2022-09-21  37  	// No COMPAT if we =
have SYSCALL_WRAPPER, see Kconfig
7e92e01b724526 Rohan McLure            2022-09-21  38  	f =3D (void *)sys_c=
all_table[r0];
7e92e01b724526 Rohan McLure            2022-09-21  39  	ret =3D f(regs);
7e92e01b724526 Rohan McLure            2022-09-21  40  #else
1547db7d1f4481 Xiu Jianfeng            2022-07-01  41  	if (unlikely(is_com=
pat_task())) {
7e92e01b724526 Rohan McLure            2022-09-21  42  		unsigned long r3, =
r4, r5, r6, r7, r8;
7e92e01b724526 Rohan McLure            2022-09-21  43 =20
1547db7d1f4481 Xiu Jianfeng            2022-07-01  44  		f =3D (void *)comp=
at_sys_call_table[r0];
1547db7d1f4481 Xiu Jianfeng            2022-07-01  45 =20
7e92e01b724526 Rohan McLure            2022-09-21  46  		r3 =3D regs->gpr[3=
] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  47  		r4 =3D regs->gpr[4=
] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  48  		r5 =3D regs->gpr[5=
] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  49  		r6 =3D regs->gpr[6=
] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  50  		r7 =3D regs->gpr[7=
] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  51  		r8 =3D regs->gpr[8=
] & 0x00000000ffffffffULL;
1547db7d1f4481 Xiu Jianfeng            2022-07-01  52 =20
7e92e01b724526 Rohan McLure            2022-09-21  53  		ret =3D f(r3, r4, =
r5, r6, r7, r8);
1547db7d1f4481 Xiu Jianfeng            2022-07-01  54  	} else {
1547db7d1f4481 Xiu Jianfeng            2022-07-01  55  		f =3D (void *)sys_=
call_table[r0];
1547db7d1f4481 Xiu Jianfeng            2022-07-01  56 =20
7e92e01b724526 Rohan McLure            2022-09-21  57  		ret =3D f(regs->gp=
r[3], regs->gpr[4], regs->gpr[5],
7e92e01b724526 Rohan McLure            2022-09-21  58  			regs->gpr[6], reg=
s->gpr[7], regs->gpr[8]);
7e92e01b724526 Rohan McLure            2022-09-21  59  	}
7e92e01b724526 Rohan McLure            2022-09-21  60  #endif
f4a0318f278d98 Xiu Jianfeng            2022-07-01  61 =20
f4a0318f278d98 Xiu Jianfeng            2022-07-01  62  	return ret;
1547db7d1f4481 Xiu Jianfeng            2022-07-01 @63  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
