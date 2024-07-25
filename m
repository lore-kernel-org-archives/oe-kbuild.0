Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64CC3A8C0
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jul 2024 20:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721937807; cv=none; b=dIEjWtFgkojDSO2oP4pCJuffK3Sp/7wfvF+HuR3sZPTQS2Ar0U2IKjqs6EKuSo7SrE+//cK4NUnSB5ItBdoyYPFEZRxqE4ovqUHcorwYwYEFeoBxqfNLpSv0TP9sWJH1p5TlO1NUjp4EmCVfjiBBjZoNQz4tO0R1KjhoZlvVNiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721937807; c=relaxed/simple;
	bh=TOSZzmNednPgrhQ1EVG/KacJT3bdimWYqmGqNy/BRPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JzBL+lUn5ZKs27E5VuV9v6+CQZhDAVneDoJ5ySe9p6g9iZHLHK3Ozj5B0vc4tXw12XB1FoWVfr2ejpug6lqb+coGYqJ9jo3+uvAd4PAC45zMHSV2ydqONoV5YxgerYHpGpbEbPr0clh6AQ60EUkRFTqt9GMT3uycCZ7l66LncSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJ8DjKce; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJ8DjKce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721937804; x=1753473804;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TOSZzmNednPgrhQ1EVG/KacJT3bdimWYqmGqNy/BRPI=;
  b=EJ8DjKce+kiBESqGL2l3KUQJQC5+W8V/sFX/i35GduTbMOQR4hNQb3V6
   5TLhPD3sP4WwzIxdqPKybbe6hzVXV7fwuL64N18O/29jWNk4/FbkMi1wg
   bJAtwBvcOVWlChvlA91YwOpH3K8r+8OCqLPnKxV3P1Ly8r40TwQqfPf66
   vmFj15vQDwZD+BRuWTeNu9PYawr2b/nXTgZGw4xXY4b9aEipNoVRntxay
   l2dkj48uU7JlAlsUazBC0Y5wOo/f0VxL26A1CY9LK4LzD53alYXX499Sb
   3yECS9nda8zrbPYNVh4C69RaR1kiHgrljCUlH3Y+0hRuWgdW6VCgM7Ms1
   w==;
X-CSE-ConnectionGUID: o+t509nJQGGRwzCcm5AJYg==
X-CSE-MsgGUID: LRVmYEPgTd+9e8jri52BRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19583223"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="19583223"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 13:03:23 -0700
X-CSE-ConnectionGUID: tiW8EGavSKurgnvMlnzVfQ==
X-CSE-MsgGUID: 165DiJ04T/adlbM4RlhQtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="53812007"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Jul 2024 13:03:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX4gI-000oPa-2O;
	Thu, 25 Jul 2024 20:03:18 +0000
Date: Fri, 26 Jul 2024 04:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/7] minmax: Simplify signedness check
Message-ID: <202407260322.dNzOOE6d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 crypto/skcipher.c:83:16: sparse: sparse: bad integer constant expression"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <03601661326c4efba4e618ead15fa0e2@AcuMS.aculab.com>
References: <03601661326c4efba4e618ead15fa0e2@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Linus Torvalds'" <torvalds@linuxfoundation.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Dan Carpenter'" <dan.carpenter@linaro.org>
CC: "'Arnd Bergmann'" <arnd@kernel.org>
CC: "'Jason@zx2c4.com'" <Jason@zx2c4.com>
CC: "'pedro.falcato@gmail.com'" <pedro.falcato@gmail.com>
CC: "'Mateusz Guzik'" <mjguzik@gmail.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.10 next-20240725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-=
Put-all-the-clamp-definitions-together/20240724-224832
base:   linux/master
patch link:    https://lore.kernel.org/r/03601661326c4efba4e618ead15fa0e2%4=
0AcuMS.aculab.com
patch subject: [PATCH 4/7] minmax: Simplify signedness check
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-121-20240725 (https://download.01.org/0day-ci/arc=
hive/20240726/202407260322.dNzOOE6d-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240726/202407260322.dNzOOE6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407260322.dNzOOE6d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/skcipher.c:83:16: sparse: sparse: bad integer constant expression
>> crypto/skcipher.c:83:16: sparse: sparse: static assertion failed: "max(s=
tart, end_page) signedness error, fix types or consider umax() before max_t=
()"
--
>> mm/percpu.c:3098:24: sparse: sparse: bad integer constant expression
>> mm/percpu.c:3098:24: sparse: sparse: static assertion failed: "min(ptr, =
base) signedness error, fix types or consider umin() before min_t()"
--
>> drivers/gpu/drm/drm_modes.c:2475:29: sparse: sparse: bad integer constan=
t expression
>> drivers/gpu/drm/drm_modes.c:2475:29: sparse: sparse: static assertion fa=
iled: "max(bpp_end_ptr, refresh_end_ptr) signedness error, fix types or con=
sider umax() before max_t()"
--
>> net/ceph/osdmap.c:1773:54: sparse: sparse: bad integer constant expressi=
on
>> net/ceph/osdmap.c:1773:54: sparse: sparse: static assertion failed: "min=
(*p + len, end) signedness error, fix types or consider umin() before min_t=
()"
   net/ceph/osdmap.c:2000:46: sparse: sparse: bad integer constant expressi=
on
   net/ceph/osdmap.c:2000:46: sparse: sparse: static assertion failed: "min=
(*p+len, end) signedness error, fix types or consider umin() before min_t()"
   net/ceph/osdmap.c:2007:57: sparse: sparse: bad integer constant expressi=
on
   net/ceph/osdmap.c:2007:57: sparse: sparse: static assertion failed: "min=
(*p + len, end) signedness error, fix types or consider umin() before min_t=
()"
--
   fs/bcachefs/backpointers.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/backpointers.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 28617 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.backpointers.o.d -nostdinc -Iarch/x86/include -I./arch=
/x86/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./ar=
ch/x86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -in=
clude include/linux/compiler-version.h -include include/linux/kconfig.h -in=
clude include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WA=
RN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-st=
rict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-=
jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack=
-boundary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel =
-Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk=
-extern -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-ju=
mp-tables -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-ra=
ces=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline=
-functions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-sta=
ck-check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declara=
tion -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototyp=
es -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declara=
tions -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-=
pointer-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Dda=
te-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wex=
tra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-con=
st-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-neg=
ative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-paramete=
r -g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gc=
c-plugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_p=
lugin.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plug=
in-track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missi=
ng-prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-c=
ompare -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wfor=
mat-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/b=
cachefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"b=
ackpointers"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bca=
chefs fs/bcachefs/backpointers.c
--
   fs/bcachefs/alloc_background.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/alloc_background.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 28881 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.alloc_background.o.d -nostdinc -Iarch/x86/include -I./=
arch/x86/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I=
=2E/arch/x86/include/generated/uapi -Iinclude/uapi -I./include/generated/ua=
pi -include include/linux/compiler-version.h -include include/linux/kconfig=
=2Eh -include include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_=
EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE=
 -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 =
-falign-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferr=
ed-stack-boundary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=
=3Dkernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-bran=
ch=3Dthunk-extern -mindirect-branch-register -mfunction-return=3Dthunk-exte=
rn -fno-jump-tables -fno-delete-null-pointer-checks -Os --param=3Dallow-sto=
re-data-races=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -=
fno-inline-functions-called-once -falign-functions=3D16 -fno-strict-overflo=
w -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstric=
t-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissi=
ng-declarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -=
Wvla -Wno-pointer-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -W=
error=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated=
-init -Wextra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -W=
unused-const-variable -Wno-missing-field-initializers -Wno-type-limits -Wno=
-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unuse=
d-parameter -g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./=
scripts/gcc-plugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/s=
tackleak_plugin.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stac=
kleak_plugin-track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 =
-Wno-missing-prototypes -Wno-missing-declarations -Wno-override-init -Wtaut=
ological-compare -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wu=
ndef -Wformat-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcach=
efs -Ifs/bcachefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASE=
NAME=3D'"alloc_background"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODN=
AME=3Dkmod_bcachefs fs/bcachefs/alloc_background.c
--
   fs/bcachefs/bkey_sort.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/bkey_sort.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 29305 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.bkey_sort.o.d -nostdinc -Iarch/x86/include -I./arch/x8=
6/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/=
x86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -inclu=
de include/linux/compiler-version.h -include include/linux/kconfig.h -inclu=
de include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1=
 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-stric=
t-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jum=
ps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-bo=
undary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-ex=
tern -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-=
tables -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"bkey=
_sort"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs =
fs/bcachefs/bkey_sort.c
--
   fs/bcachefs/btree_node_scan.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/btree_node_scan.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 29986 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.btree_node_scan.o.d -nostdinc -Iarch/x86/include -I./a=
rch/x86/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I.=
/arch/x86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi =
-include include/linux/compiler-version.h -include include/linux/kconfig.h =
-include include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA=
_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno=
-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -fali=
gn-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-st=
ack-boundary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkern=
el -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dth=
unk-extern -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno=
-jump-tables -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data=
-races=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inl=
ine-functions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-=
stack-check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-decl=
aration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-proto=
types -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-decl=
arations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -W=
no-pointer-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=
=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init=
 -Wextra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunuse=
d-const-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shif=
t-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-par=
ameter -g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scrip=
ts/gcc-plugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackl=
eak_plugin.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak=
_plugin-track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-=
missing-prototypes -Wno-missing-declarations -Wno-override-init -Wtautologi=
cal-compare -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef =
-Wformat-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -=
Ifs/bcachefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=
=3D'"btree_node_scan"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=
=3Dkmod_bcachefs fs/bcachefs/btree_node_scan.c
--
   fs/bcachefs/btree_gc.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/btree_gc.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 30092 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.btree_gc.o.d -nostdinc -Iarch/x86/include -I./arch/x86=
/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x=
86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -includ=
e include/linux/compiler-version.h -include include/linux/kconfig.h -includ=
e include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 =
-std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict=
-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jump=
s=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-bou=
ndary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno=
-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-ext=
ern -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-t=
ables -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"btre=
e_gc"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs f=
s/bcachefs/btree_gc.c
--
   fs/bcachefs/btree_io.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/btree_io.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 30290 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.btree_io.o.d -nostdinc -Iarch/x86/include -I./arch/x86=
/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x=
86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -includ=
e include/linux/compiler-version.h -include include/linux/kconfig.h -includ=
e include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 =
-std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict=
-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jump=
s=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-bou=
ndary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno=
-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-ext=
ern -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-t=
ables -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"btre=
e_io"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs f=
s/bcachefs/btree_io.c
--
   fs/bcachefs/btree_trans_commit.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/btree_trans_commit.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 30315 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.btree_trans_commit.o.d -nostdinc -Iarch/x86/include -I=
=2E/arch/x86/include/generated -Iinclude -I./include -Iarch/x86/include/uap=
i -I./arch/x86/include/generated/uapi -Iinclude/uapi -I./include/generated/=
uapi -include include/linux/compiler-version.h -include include/linux/kconf=
ig.h -include include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_=
EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE=
 -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 =
-falign-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferr=
ed-stack-boundary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=
=3Dkernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-bran=
ch=3Dthunk-extern -mindirect-branch-register -mfunction-return=3Dthunk-exte=
rn -fno-jump-tables -fno-delete-null-pointer-checks -Os --param=3Dallow-sto=
re-data-races=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -=
fno-inline-functions-called-once -falign-functions=3D16 -fno-strict-overflo=
w -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstric=
t-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissi=
ng-declarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -=
Wvla -Wno-pointer-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -W=
error=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated=
-init -Wextra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -W=
unused-const-variable -Wno-missing-field-initializers -Wno-type-limits -Wno=
-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unuse=
d-parameter -g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./=
scripts/gcc-plugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/s=
tackleak_plugin.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stac=
kleak_plugin-track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 =
-Wno-missing-prototypes -Wno-missing-declarations -Wno-override-init -Wtaut=
ological-compare -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wu=
ndef -Wformat-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcach=
efs -Ifs/bcachefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASE=
NAME=3D'"btree_trans_commit"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MO=
DNAME=3Dkmod_bcachefs fs/bcachefs/btree_trans_commit.c
--
   fs/bcachefs/btree_write_buffer.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/btree_write_buffer.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 30821 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.btree_write_buffer.o.d -nostdinc -Iarch/x86/include -I=
=2E/arch/x86/include/generated -Iinclude -I./include -Iarch/x86/include/uap=
i -I./arch/x86/include/generated/uapi -Iinclude/uapi -I./include/generated/=
uapi -include include/linux/compiler-version.h -include include/linux/kconf=
ig.h -include include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_=
EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE=
 -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 =
-falign-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferr=
ed-stack-boundary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=
=3Dkernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-bran=
ch=3Dthunk-extern -mindirect-branch-register -mfunction-return=3Dthunk-exte=
rn -fno-jump-tables -fno-delete-null-pointer-checks -Os --param=3Dallow-sto=
re-data-races=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -=
fno-inline-functions-called-once -falign-functions=3D16 -fno-strict-overflo=
w -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstric=
t-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissi=
ng-declarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -=
Wvla -Wno-pointer-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -W=
error=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated=
-init -Wextra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -W=
unused-const-variable -Wno-missing-field-initializers -Wno-type-limits -Wno=
-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unuse=
d-parameter -g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./=
scripts/gcc-plugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/s=
tackleak_plugin.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stac=
kleak_plugin-track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 =
-Wno-missing-prototypes -Wno-missing-declarations -Wno-override-init -Wtaut=
ological-compare -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wu=
ndef -Wformat-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcach=
efs -Ifs/bcachefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASE=
NAME=3D'"btree_write_buffer"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MO=
DNAME=3Dkmod_bcachefs fs/bcachefs/btree_write_buffer.c
--
   fs/bcachefs/btree_update_interior.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/btree_update_interior.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 31082 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.btree_update_interior.o.d -nostdinc -Iarch/x86/include=
 -I./arch/x86/include/generated -Iinclude -I./include -Iarch/x86/include/ua=
pi -I./arch/x86/include/generated/uapi -Iinclude/uapi -I./include/generated=
/uapi -include include/linux/compiler-version.h -include include/linux/kcon=
fig.h -include include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD=
_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PI=
E -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64=
 -falign-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mprefer=
red-stack-boundary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=
=3Dkernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-bran=
ch=3Dthunk-extern -mindirect-branch-register -mfunction-return=3Dthunk-exte=
rn -fno-jump-tables -fno-delete-null-pointer-checks -Os --param=3Dallow-sto=
re-data-races=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -=
fno-inline-functions-called-once -falign-functions=3D16 -fno-strict-overflo=
w -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstric=
t-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissi=
ng-declarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -=
Wvla -Wno-pointer-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -W=
error=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated=
-init -Wextra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -W=
unused-const-variable -Wno-missing-field-initializers -Wno-type-limits -Wno=
-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unuse=
d-parameter -g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./=
scripts/gcc-plugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/s=
tackleak_plugin.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stac=
kleak_plugin-track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 =
-Wno-missing-prototypes -Wno-missing-declarations -Wno-override-init -Wtaut=
ological-compare -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wu=
ndef -Wformat-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcach=
efs -Ifs/bcachefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASE=
NAME=3D'"btree_update_interior"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD=
_MODNAME=3Dkmod_bcachefs fs/bcachefs/btree_update_interior.c
--
   fs/bcachefs/debug.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/debug.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 31969 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.debug.o.d -nostdinc -Iarch/x86/include -I./arch/x86/in=
clude/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/=
include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include i=
nclude/linux/compiler-version.h -include include/linux/kconfig.h -include i=
nclude/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 -st=
d=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=
=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boun=
dary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno-=
sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-exte=
rn -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-ta=
bles -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"debu=
g"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs fs/b=
cachefs/debug.c
--
   fs/bcachefs/extent_update.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/extent_update.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 32636 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.extent_update.o.d -nostdinc -Iarch/x86/include -I./arc=
h/x86/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./a=
rch/x86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -i=
nclude include/linux/compiler-version.h -include include/linux/kconfig.h -i=
nclude include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_W=
ARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-s=
trict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign=
-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stac=
k-boundary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel=
 -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthun=
k-extern -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-j=
ump-tables -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-r=
aces=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inlin=
e-functions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-st=
ack-check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declar=
ation -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototy=
pes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declar=
ations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno=
-pointer-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Dd=
ate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -We=
xtra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-co=
nst-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-ne=
gative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-paramet=
er -g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/g=
cc-plugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_=
plugin.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plu=
gin-track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-miss=
ing-prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-=
compare -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wfo=
rmat-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/=
bcachefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"=
extent_update"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_b=
cachefs fs/bcachefs/extent_update.c
--
   fs/bcachefs/journal_io.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/journal_io.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 34455 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.journal_io.o.d -nostdinc -Iarch/x86/include -I./arch/x=
86/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch=
/x86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -incl=
ude include/linux/compiler-version.h -include include/linux/kconfig.h -incl=
ude include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN=
1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-stri=
ct-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-ju=
mps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-b=
oundary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -W=
no-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-e=
xtern -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump=
-tables -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-race=
s=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-f=
unctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack=
-check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declarati=
on -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes=
 -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declarati=
ons -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-po=
inter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate=
-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextr=
a -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const=
-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negat=
ive-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter =
-g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-=
plugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plu=
gin.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin=
-track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing=
-prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-com=
pare -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wforma=
t-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bca=
chefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"jou=
rnal_io"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachef=
s fs/bcachefs/journal_io.c
--
   fs/bcachefs/migrate.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/migrate.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 34697 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.migrate.o.d -nostdinc -Iarch/x86/include -I./arch/x86/=
include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x8=
6/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include=
 include/linux/compiler-version.h -include include/linux/kconfig.h -include=
 include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 -=
std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-=
aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=
=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boun=
dary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno-=
sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-exte=
rn -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-ta=
bles -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"migr=
ate"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs fs=
/bcachefs/migrate.c
--
>> fs/bcachefs/printbuf.c:103:29: sparse: sparse: bad integer constant expr=
ession
>> fs/bcachefs/printbuf.c:103:29: sparse: sparse: static assertion failed: =
"min(n, (char *) memscan(p, '\r', len)) signedness error, fix types or cons=
ider umin() before min_t()"
   fs/bcachefs/printbuf.c:104:29: sparse: sparse: bad integer constant expr=
ession
>> fs/bcachefs/printbuf.c:104:29: sparse: sparse: static assertion failed: =
"min(n, (char *) memscan(p, '\t', len)) signedness error, fix types or cons=
ider umin() before min_t()"
--
   fs/bcachefs/move.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/move.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 35027 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.move.o.d -nostdinc -Iarch/x86/include -I./arch/x86/inc=
lude/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/i=
nclude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include in=
clude/linux/compiler-version.h -include include/linux/kconfig.h -include in=
clude/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 -std=
=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-ali=
asing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=3D=
1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundar=
y=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno-sig=
n-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-extern =
-mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-table=
s -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=3D0 =
-fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-functio=
ns-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-check=
 -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaration -We=
rror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-=
format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declarations -W=
missing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-pointer-=
sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-time =
-Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra -Wun=
used -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-varia=
ble -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-va=
lue -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -fn=
o-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-plugin=
s/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plugin.so=
 -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-track=
-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-proto=
types -Wno-missing-declarations -Wno-override-init -Wtautological-compare -=
Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat-over=
flow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcachefs =
-DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"move"' -D=
KBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs fs/bcachef=
s/move.c
--
   fs/bcachefs/recovery.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/recovery.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 35483 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.recovery.o.d -nostdinc -Iarch/x86/include -I./arch/x86=
/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x=
86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -includ=
e include/linux/compiler-version.h -include include/linux/kconfig.h -includ=
e include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 =
-std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict=
-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jump=
s=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-bou=
ndary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno=
-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-ext=
ern -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-t=
ables -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"reco=
very"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs f=
s/bcachefs/recovery.c
--
   fs/bcachefs/sb-clean.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/sb-clean.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 35855 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.sb-clean.o.d -nostdinc -Iarch/x86/include -I./arch/x86=
/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x=
86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -includ=
e include/linux/compiler-version.h -include include/linux/kconfig.h -includ=
e include/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 =
-std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict=
-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jump=
s=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-bou=
ndary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno=
-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-ext=
ern -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-t=
ables -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"sb_c=
lean"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs f=
s/bcachefs/sb-clean.c
--
   fs/bcachefs/sysfs.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/sysfs.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 36978 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.sysfs.o.d -nostdinc -Iarch/x86/include -I./arch/x86/in=
clude/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/=
include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include i=
nclude/linux/compiler-version.h -include include/linux/kconfig.h -include i=
nclude/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 -st=
d=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=
=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boun=
dary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno-=
sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-exte=
rn -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-ta=
bles -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"sysf=
s"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs fs/b=
cachefs/sysfs.c
--
   fs/bcachefs/super.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/super.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 37065 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.super.o.d -nostdinc -Iarch/x86/include -I./arch/x86/in=
clude/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/=
include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include i=
nclude/linux/compiler-version.h -include include/linux/kconfig.h -include i=
nclude/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 -st=
d=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=
=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boun=
dary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno-=
sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-exte=
rn -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-ta=
bles -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"supe=
r"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs fs/b=
cachefs/super.c
--
   fs/bcachefs/trace.c: note: in included file:
   fs/bcachefs/bcachefs.h:993:9: sparse: sparse: array of flexible structur=
es
   fs/bcachefs/trace.c: note: in included file:
>> fs/bcachefs/btree_update_interior.h:278:40: sparse: sparse: bad integer =
constant expression
   *** buffer overflow detected ***: terminated
   /bin/bash: line 1: 37416 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited -fm=
ax-warnings=3Dunlimited -D__x86_64__ --arch=3Dx86_64 -mlittle-endian -m64 -=
Wp,-MMD,fs/bcachefs/.trace.o.d -nostdinc -Iarch/x86/include -I./arch/x86/in=
clude/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/=
include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include i=
nclude/linux/compiler-version.h -include include/linux/kconfig.h -include i=
nclude/linux/compiler_types.h -D__KERNEL__ -Wundef -DKBUILD_EXTRA_WARN1 -st=
d=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=
=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boun=
dary=3D3 -mskip-rax-setup -march=3Dk8 -mno-red-zone -mcmodel=3Dkernel -Wno-=
sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-exte=
rn -mindirect-branch-register -mfunction-return=3Dthunk-extern -fno-jump-ta=
bles -fno-delete-null-pointer-checks -Os --param=3Dallow-store-data-races=
=3D0 -fstack-protector-strong -pg -mfentry -DCC_USING_FENTRY -fno-inline-fu=
nctions-called-once -falign-functions=3D16 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Wall -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wmissing-declaratio=
ns -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-main -Wvla -Wno-poi=
nter-sign -Wno-stringop-overflow -Wimplicit-fallthrough=3D5 -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wextra=
 -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-=
variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -=
g -fno-var-tracking -femit-struct-debug-baseonly -fplugin=3D./scripts/gcc-p=
lugins/structleak_plugin.so -fplugin=3D./scripts/gcc-plugins/stackleak_plug=
in.so -DSTRUCTLEAK_PLUGIN -DSTACKLEAK_PLUGIN -fplugin-arg-stackleak_plugin-=
track-min-size=3D100 -fplugin-arg-stackleak_plugin-arch=3Dx86 -Wno-missing-=
prototypes -Wno-missing-declarations -Wno-override-init -Wtautological-comp=
are -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wformat=
-overflow -Wformat-truncation -Wrestrict -Wno-psabi -Ifs/bcachefs -Ifs/bcac=
hefs -DKBUILD_MODFILE=3D'"fs/bcachefs/bcachefs"' -DKBUILD_BASENAME=3D'"trac=
e"' -DKBUILD_MODNAME=3D'"bcachefs"' -D__KBUILD_MODNAME=3Dkmod_bcachefs fs/b=
cachefs/trace.c
--
>> lib/lzo/lzo1x_compress.c:53:54: sparse: sparse: bad integer constant exp=
ression
>> lib/lzo/lzo1x_compress.c:53:54: sparse: sparse: static assertion failed:=
 "min(ip_end, ip + (2047 + 4) + 1) signedness error, fix types or consider =
umin() before min_t()"
--
>> fs/ntfs3/lznt.c:157:16: sparse: sparse: bad integer constant expression
>> fs/ntfs3/lznt.c:157:16: sparse: sparse: static assertion failed: "min(cm=
pr + 0x1000 + sizeof(short), cmpr_end) signedness error, fix types or consi=
der umin() before min_t()"

vim +83 crypto/skcipher.c

b286d8b1a69066 Herbert Xu 2016-11-22  75 =20
b286d8b1a69066 Herbert Xu 2016-11-22  76  /* Get a spot of the specified le=
ngth that does not straddle a page.
b286d8b1a69066 Herbert Xu 2016-11-22  77   * The caller needs to ensure tha=
t there is enough space for this operation.
b286d8b1a69066 Herbert Xu 2016-11-22  78   */
b286d8b1a69066 Herbert Xu 2016-11-22  79  static inline u8 *skcipher_get_sp=
ot(u8 *start, unsigned int len)
b286d8b1a69066 Herbert Xu 2016-11-22  80  {
b286d8b1a69066 Herbert Xu 2016-11-22  81  	u8 *end_page =3D (u8 *)(((unsign=
ed long)(start + len - 1)) & PAGE_MASK);
b286d8b1a69066 Herbert Xu 2016-11-22  82 =20
b286d8b1a69066 Herbert Xu 2016-11-22 @83  	return max(start, end_page);
b286d8b1a69066 Herbert Xu 2016-11-22  84  }
b286d8b1a69066 Herbert Xu 2016-11-22  85 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
