Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AE87C
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 02:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690511207; x=1722047207;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t8JfPcC6QJV9FicMmhN38v0MLLCNc3U36TqyP27+n40=;
  b=Mw5EeHNueXhB2iZoAGI+o36qsyxQRD2vBUfSJAQgp9Knvk1yUQtMewi7
   RxkTMYlXXjASs+zimUF6/O/u+d/8uSjJn9ISTqON+SUydfcFzfq5J2YID
   c1/JzlH0SAqeE+aXxrzGwBrcmYDamKGhzyb7t3sSVEaySIpY9KV6GF/ph
   xrU8/6E7fQpa5PHbRUe4V5FqozwneRMVBMgFW2TVa/VJi1WCbVcU9yVyg
   DMsm51TgnNFmd/OXcFG1v2Pl6uogqM/apIk2m7rJkJnzjYS7TfinzPT8K
   6yRTkV381VrqqvGKRi+EQ9yes1J1d/ser/x1B/d2Ly7VeGd1iqrqv8y65
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434772713"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="434772713"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 19:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730576831"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="730576831"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jul 2023 19:26:44 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPDBk-0002nR-0N;
	Fri, 28 Jul 2023 02:26:44 +0000
Date: Fri, 28 Jul 2023 10:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 4/5] minmax: Allow comparisons of 'int'
 against 'unsigned char/short'.
Message-ID: <202307281006.KbhrGgb3-lkp@intel.com>
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
 drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token expansion"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a3309fcd947a4fb3826f1e8b8b9da585@AcuMS.aculab.com>
References: <a3309fcd947a4fb3826f1e8b8b9da585@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.5-rc3 next-20230727]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-=
Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-2049=
40
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ever=
ything
patch link:    https://lore.kernel.org/r/a3309fcd947a4fb3826f1e8b8b9da585%4=
0AcuMS.aculab.com
patch subject: [PATCH next resend 4/5] minmax: Allow comparisons of 'int' a=
gainst 'unsigned char/short'.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: microblaze-randconfig-r092-20230725 (https://download.01.org/0day-c=
i/archive/20230728/202307281006.KbhrGgb3-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281006.K=
bhrGgb3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307281006.KbhrGgb3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/adm1026.c:609:28: sparse: sparse: too long token expansion
   drivers/hwmon/adm1026.c:638:28: sparse: sparse: too long token expansion
   drivers/hwmon/adm1026.c:498:28: sparse: sparse: bad integer constant exp=
ression
   drivers/hwmon/adm1026.c:498:28: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(=
255 * adm1026_scaling[nr] / 192)"
   drivers/hwmon/adm1026.c:526:28: sparse: sparse: bad integer constant exp=
ression
   drivers/hwmon/adm1026.c:526:28: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(=
255 * adm1026_scaling[nr] / 192)"
   drivers/hwmon/adm1026.c:609:28: sparse: sparse: bad integer constant exp=
ression
   drivers/hwmon/adm1026.c:609:28: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(({ __builtin_choose_expr((sizeof(int) =3D=3D si=
zeof(*(8 ? ((void *)((long)(((typeof(val))(val)) - ((typeof(val))((-((int)(=
~0U >> 1)) - 1))) + ((typeof(val))(((int)(~0U >> 1)) - 16000))) * 0l)) : (i=
nt *)8))), (((typeof(val))(val)) >=3D ((typeof(val))(((int)(~0U >> 1)) - 16=
000)) ? ((typeof(val))(((int)(~0U >> 1)) - 16000)) : (((typeof(val))(val)) =
<=3D ((typeof(val))((-((int)(~0U >> 1)) - 1))) ? ((typeof(val))((-((int)(~0=
U >> 1)) - 1))) : ((typeof(val))(val)))), ({ typeof((typeof(val))(val)) __U=
NIQUE_ID___val326 =3D ((typeof(val))(val)); typeof((typeof(val))((-((int)(~=
0U >> 1)) - 1))) __UNIQUE_ID___lo327 =3D ((typeof(val))((-((int)(~0U >> 1))=
 - 1))); typeof((typeof(val))(((int)(~0U >> 1)) - 16000)) __UNIQUE_ID___hi3=
28 =3D ((typeof(val))(((int)(~0U >> 1)) - 16000)); _Static_assert(!(sizeof(=
int) =3D=3D sizeof(*(8 ? ((void *)((long)(((typeof(val))((-((int)(~0U >> 1)=
) - 1))) > ((typeof(val))(((int)(~0U >> 1)) - 16000))) * 0l)) : (int *)8)))=
 || ((typeof(val))((-((int)(~0U >> 1)) - 1))) <=3D ((typeof(val))(((int)(~0=
U >> 1)) - 16000)), "clamp() low limit " "(typeof(val))((-((int)(~0U >> 1))=
 - 1))" " greater than high limit " "(typeof(val))(((int)(~0U >> 1)) - 1600=
0)"); _Static_assert(((((typeof((typeof(val))(val)))(-1)) < (__attribute__(=
(force)) typeof((typeof(val))(val)))1) =3D=3D (((typeof((typeof(val))((-((i=
nt)(~0U >> 1)) - 1))))(-1)) < (__attribute__((force)) typeof((typeof(val))(=
(-((int)(~0U >> 1)) - 1))))1) || (((typeof(((typeof(val))(val)) + 0))(-1)) =
< (__attribute__((force)) typeof(((typeof(val))(val)) + 0))1) =3D=3D (((typ=
eof(((typeof(val))((-((int)(~0U >> 1)) - 1))) + 0))(-1)) < (__attribute__((=
force)) typeof(((typeof(val))((-((int)(~0U >> 1)) - 1))) + 0))1)), "clamp()=
 'lo' signedness error"); _Static_assert(((((typeof((typeof(val))(val)))(-1=
)) < (__attribute__((force)) typeof((typeof(val))(val)))1) =3D=3D (((typeof=
((typeof(val))(((int)(~0U >> 1)) - 16000)))(-1)) < (__attribute__((force)) =
typeof((typeof(val))(((int)(~0U >> 1)) - 16000)))1) || (((typeof(((typeof(v=
al))(val)) + 0))(-1)) < (__attribute__((force)) typeof(((typeof(val))(val))=
 + 0))1) =3D=3D (((typeof(((typeof(val))(((int)(~0U >> 1)) - 16000)) + 0))(=
-1)) < (__attribute__((force)) typeof(((typeof(val))(((int)(~0U >> 1)) - 16=
000)) + 0))1)), "clamp() 'hi' signedness error"); ((__UNIQUE_ID___val326) >=
=3D (__UNIQUE_ID___hi328) ? (__UNIQUE_ID___hi328) : ((__UNIQUE_ID___val326)=
 <=3D (__UNIQUE_ID___lo327) ? (__UNIQUE_ID___lo327) : (__UNIQUE_ID___val326=
))); })); }) + 16000))(0) greater than high limit (typeof(({ __builtin_choo=
se_expr((sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(((typeof(val))(va=
l)) - ((typeof(val))((-((int)(~0U >> 1)) - 1))) + ((typeof(val))(((int)(~0U=
 >> 1)) - 16000))) * 0l)) : (int *)8))), (((typeof(val))(val)) >=3D ((typeo=
f(val))(((int)(~0U >> 1)) - 16000)) ? ((typeof(val))(((int)(~0U >> 1)) - 16=
000)) : (((typeof(val))(val)) <=3D ((typeof(val))((-((int)(~0U >> 1)) - 1))=
) ? ((typeof(val))((-((int)(~0U >> 1)) - 1))) : ((typeof(val))(val)))), ({ =
typeof((typeof(val))(val)) __UNIQUE_ID___val326 =3D ((typeof(val))(val)); t=
ypeof((typeof(val))((-((int)(~0U >> 1)) - 1))) __UNIQUE_ID___lo327 =3D ((ty=
peof(val))((-((int)(~0U >> 1)) - 1))); typeof((typeof(val))(((int)(~0U >> 1=
)) - 16000)) __UNIQUE_ID___hi328 =3D ((typeof(val))(((int)(~0U >> 1)) - 160=
00)); _Static_assert(!(sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(((t=
ypeof(val))((-((int)(~0U >> 1)) - 1))) > ((typeof(val))(((int)(~0U >> 1)) -=
 16000))) * 0l)) : (int *)8))) || ((typeof(val))((-((int)(~0U >> 1)) - 1)))=
 <=3D ((typeof(val))(((int)(~0U >> 1)) - 16000)), "clamp() low limit " "(ty=
peof(val))((-((int)(~0U >> 1)) - 1))" " greater than high limit " "(typeof(=
val))(((int)(~0U >> 1)) - 16000)"); _Static_assert(((((typeof((typeof(val))=
(val)))(-1)) < (__attribute__((force)) typeof((typeof(val))(val)))1) =3D=3D=
 (((typeof((typeof(val))((-((int)(~0U >> 1)) - 1))))(-1)) < (__attribute__(=
(force)) typeof((typeof(val))((-((int)(~0U >> 1)) - 1))))1) || (((typeof(((=
typeof(val))(val)) + 0))(-1)) < (__attribute__((force)) typeof(((typeof(val=
))(val)) + 0))1) =3D=3D (((typeof(((typeof(val))((-((int)(~0U >> 1)) - 1)))=
 + 0))(-1)) < (__attribute__((force)) typeof(((typeof(val))((-((int)(~0U >>=
 1)) - 1))) + 0))1)), "clamp() 'lo' signedness error"); _Static_assert(((((=
typeof((typeof(val))(val)))(-1)) < (__attribute__((force)) typeof((typeof(v=
al))(val)))1) =3D=3D (((typeof((typeof(val))(((int)(~0U >> 1)) - 16000)))(-=
1)) < (__attribute__((force)) typeof((typeof(val))(((int)(~0U >> 1)) - 1600=
0)))1) || (((typeof(((typeof(val))(val)) + 0))(-1)) < (__attribute__((force=
)) typeof(((typeof(val))(val)) + 0))1) =3D=3D (((typeof(((typeof(val))(((in=
t)(~0U >> 1)) - 16000)) + 0))(-1)) < (__attribute__((force)) typeof(((typeo=
f(val))(((int)(~0U >> 1)) - 16000)) + 0))1)), "clamp() 'hi' signedness erro=
r"); ((__UNIQUE_ID___val326) >=3D (__UNIQUE_ID___hi328) ? (__UNIQUE_ID___hi=
328) : ((__UNIQUE_ID___val326) <=3D (__UNIQUE_ID___lo327) ? (__UNIQUE_ID___=
lo327) : (__UNIQUE_ID___val326))); })); }) + 16000))(255 * adm1026_scaling[=
16] / 192)"
   drivers/hwmon/adm1026.c:638:28: sparse: sparse: bad integer constant exp=
ression
   drivers/hwmon/adm1026.c:638:28: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(({ __builtin_choose_expr((sizeof(int) =3D=3D si=
zeof(*(8 ? ((void *)((long)(((typeof(val))(val)) - ((typeof(val))((-((int)(=
~0U >> 1)) - 1))) + ((typeof(val))(((int)(~0U >> 1)) - 16000))) * 0l)) : (i=
nt *)8))), (((typeof(val))(val)) >=3D ((typeof(val))(((int)(~0U >> 1)) - 16=
000)) ? ((typeof(val))(((int)(~0U >> 1)) - 16000)) : (((typeof(val))(val)) =
<=3D ((typeof(val))((-((int)(~0U >> 1)) - 1))) ? ((typeof(val))((-((int)(~0=
U >> 1)) - 1))) : ((typeof(val))(val)))), ({ typeof((typeof(val))(val)) __U=
NIQUE_ID___val332 =3D ((typeof(val))(val)); typeof((typeof(val))((-((int)(~=
0U >> 1)) - 1))) __UNIQUE_ID___lo333 =3D ((typeof(val))((-((int)(~0U >> 1))=
 - 1))); typeof((typeof(val))(((int)(~0U >> 1)) - 16000)) __UNIQUE_ID___hi3=
34 =3D ((typeof(val))(((int)(~0U >> 1)) - 16000)); _Static_assert(!(sizeof(=
int) =3D=3D sizeof(*(8 ? ((void *)((long)(((typeof(val))((-((int)(~0U >> 1)=
) - 1))) > ((typeof(val))(((int)(~0U >> 1)) - 16000))) * 0l)) : (int *)8)))=
 || ((typeof(val))((-((int)(~0U >> 1)) - 1))) <=3D ((typeof(val))(((int)(~0=
U >> 1)) - 16000)), "clamp() low limit " "(typeof(val))((-((int)(~0U >> 1))=
 - 1))" " greater than high limit " "(typeof(val))(((int)(~0U >> 1)) - 1600=
0)"); _Static_assert(((((typeof((typeof(val))(val)))(-1)) < (__attribute__(=
(force)) typeof((typeof(val))(val)))1) =3D=3D (((typeof((typeof(val))((-((i=
nt)(~0U >> 1)) - 1))))(-1)) < (__attribute__((force)) typeof((typeof(val))(=
(-((int)(~0U >> 1)) - 1))))1) || (((typeof(((typeof(val))(val)) + 0))(-1)) =
< (__attribute__((force)) typeof(((typeof(val))(val)) + 0))1) =3D=3D (((typ=
eof(((typeof(val))((-((int)(~0U >> 1)) - 1))) + 0))(-1)) < (__attribute__((=
force)) typeof(((typeof(val))((-((int)(~0U >> 1)) - 1))) + 0))1)), "clamp()=
 'lo' signedness error"); _Static_assert(((((typeof((typeof(val))(val)))(-1=
)) < (__attribute__((force)) typeof((typeof(val))(val)))1) =3D=3D (((typeof=
((typeof(val))(((int)(~0U >> 1)) - 16000)))(-1)) < (__attribute__((force)) =
typeof((typeof(val))(((int)(~0U >> 1)) - 16000)))1) || (((typeof(((typeof(v=
al))(val)) + 0))(-1)) < (__attribute__((force)) typeof(((typeof(val))(val))=
 + 0))1) =3D=3D (((typeof(((typeof(val))(((int)(~0U >> 1)) - 16000)) + 0))(=
-1)) < (__attribute__((force)) typeof(((typeof(val))(((int)(~0U >> 1)) - 16=
000)) + 0))1)), "clamp() 'hi' signedness error"); ((__UNIQUE_ID___val332) >=
=3D (__UNIQUE_ID___hi334) ? (__UNIQUE_ID___hi334) : ((__UNIQUE_ID___val332)=
 <=3D (__UNIQUE_ID___lo333) ? (__UNIQUE_ID___lo333) : (__UNIQUE_ID___val332=
))); })); }) + 16000))(0) greater than high limit (typeof(({ __builtin_choo=
se_expr((sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(((typeof(val))(va=
l)) - ((typeof(val))((-((int)(~0U >> 1)) - 1))) + ((typeof(val))(((int)(~0U=
 >> 1)) - 16000))) * 0l)) : (int *)8))), (((typeof(val))(val)) >=3D ((typeo=
f(val))(((int)(~0U >> 1)) - 16000)) ? ((typeof(val))(((int)(~0U >> 1)) - 16=
000)) : (((typeof(val))(val)) <=3D ((typeof(val))((-((int)(~0U >> 1)) - 1))=
) ? ((typeof(val))((-((int)(~0U >> 1)) - 1))) : ((typeof(val))(val)))), ({ =
typeof((typeof(val))(val)) __UNIQUE_ID___val332 =3D ((typeof(val))(val)); t=
ypeof((typeof(val))((-((int)(~0U >> 1)) - 1))) __UNIQUE_ID___lo333 =3D ((ty=
peof(val))((-((int)(~0U >> 1)) - 1))); typeof((typeof(val))(((int)(~0U >> 1=
)) - 16000)) __UNIQUE_ID___hi334 =3D ((typeof(val))(((int)(~0U >> 1)) - 160=
00)); _Static_assert(!(sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(((t=
ypeof(val))((-((int)(~0U >> 1)) - 1))) > ((typeof(val))(((int)(~0U >> 1)) -=
 16000))) * 0l)) : (int *)8))) || ((typeof(val))((-((int)(~0U >> 1)) - 1)))=
 <=3D ((typeof(val))(((int)(~0U >> 1)) - 16000)), "clamp() low limit " "(ty=
peof(val))((-((int)(~0U >> 1)) - 1))" " greater than high limit " "(typeof(=
val))(((int)(~0U >> 1)) - 16000)"); _Static_assert(((((typeof((typeof(val))=
(val)))(-1)) < (__attribute__((force)) typeof((typeof(val))(val)))1) =3D=3D=
 (((typeof((typeof(val))((-((int)(~0U >> 1)) - 1))))(-1)) < (__attribute__(=
(force)) typeof((typeof(val))((-((int)(~0U >> 1)) - 1))))1) || (((typeof(((=
typeof(val))(val)) + 0))(-1)) < (__attribute__((force)) typeof(((typeof(val=
))(val)) + 0))1) =3D=3D (((typeof(((typeof(val))((-((int)(~0U >> 1)) - 1)))=
 + 0))(-1)) < (__attribute__((force)) typeof(((typeof(val))((-((int)(~0U >>=
 1)) - 1))) + 0))1)), "clamp() 'lo' signedness error"); _Static_assert(((((=
typeof((typeof(val))(val)))(-1)) < (__attribute__((force)) typeof((typeof(v=
al))(val)))1) =3D=3D (((typeof((typeof(val))(((int)(~0U >> 1)) - 16000)))(-=
1)) < (__attribute__((force)) typeof((typeof(val))(((int)(~0U >> 1)) - 1600=
0)))1) || (((typeof(((typeof(val))(val)) + 0))(-1)) < (__attribute__((force=
)) typeof(((typeof(val))(val)) + 0))1) =3D=3D (((typeof(((typeof(val))(((in=
t)(~0U >> 1)) - 16000)) + 0))(-1)) < (__attribute__((force)) typeof(((typeo=
f(val))(((int)(~0U >> 1)) - 16000)) + 0))1)), "clamp() 'hi' signedness erro=
r"); ((__UNIQUE_ID___val332) >=3D (__UNIQUE_ID___hi334) ? (__UNIQUE_ID___hi=
334) : ((__UNIQUE_ID___val332) <=3D (__UNIQUE_ID___lo333) ? (__UNIQUE_ID___=
lo333) : (__UNIQUE_ID___val332))); })); }) + 16000))(255 * adm1026_scaling[=
16] / 192)"
   /bin/bash: line 1:  8821 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ --arch=3Dmicroblaze -mlittle=
-endian -m32 -Wp,-MMD,drivers/hwmon/.adm1026.o.d -nostdinc -Iarch/microblaz=
e/include -I./arch/microblaze/include/generated -Iinclude -I./include -Iarc=
h/microblaze/include/uapi -I./arch/microblaze/include/generated/uapi -Iincl=
ude/uapi -I./include/generated/uapi -include include/linux/compiler-version=
=2Eh -include include/linux/kconfig.h -include include/linux/compiler_types=
=2Eh -D__KERNEL__ -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -st=
d=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimpl=
icit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-secu=
rity -Wno-trigraphs -mlittle-endian -ffixed-r31 -mcpu=3Dv7.10.d -fno-delete=
-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-=
overflow -Wno-address-of-packed-member -Os -fno-allow-store-data-races -fno=
-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining -Wframe-larger-than=
=3D1024 -fno-stack-protector -Wno-main -Wno-unused-but-set-variable -Wno-un=
used-const-variable -Wno-dangling-pointer -ftrivial-auto-var-init=3Dzero -f=
no-stack-clash-protection -fzero-call-used-regs=3Dused-gpr -pg -fno-inline-=
functions-called-once -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-str=
ingop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitiali=
zed -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D=
5 -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=3Ddate-tim=
e -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wno-packe=
d-not-aligned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations=
 -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition -Wm=
issing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpac=
ked-not-aligned -Wstringop-truncation -Wno-missing-field-initializers -Wno-=
sign-compare -Wno-type-limits -Wno-shift-negative-value -gsplit-dwarf -g -g=
dwarf-4 -fno-var-tracking -femit-struct-debug-baseonly -gz=3Dzlib -DDEBUG -=
I drivers/hwmon -I ./drivers/hwmon -DKBUILD_MODFILE=3D'"drivers/hwmon/adm10=
26"' -DKBUILD_BASENAME=3D'"adm1026"' -DKBUILD_MODNAME=3D'"adm1026"' -D__KBU=
ILD_MODNAME=3Dkmod_adm1026 drivers/hwmon/adm1026.c

vim +609 drivers/hwmon/adm1026.c

7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  580 =
=20
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  581  =
static ssize_t in16_show(struct device *dev, struct device_attribute *attr,
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  582  =
			 char *buf)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  583  {
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  584  =
	struct adm1026_data *data =3D adm1026_update_device(dev);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  585  =
	return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in[16]) -
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  586  =
		NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  587  }
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  588  =
static ssize_t in16_min_show(struct device *dev,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  589  =
			     struct device_attribute *attr, char *buf)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  590  {
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  591  =
	struct adm1026_data *data =3D adm1026_update_device(dev);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  592  =
	return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_min[16])
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  593  =
		- NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  594  }
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  595  =
static ssize_t in16_min_store(struct device *dev,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  596  =
			      struct device_attribute *attr, const char *buf,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  597  =
			      size_t count)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  598  {
b591d3c1964e7c drivers/hwmon/adm1026.c     Axel Lin       2014-07-03  599  =
	struct adm1026_data *data =3D dev_get_drvdata(dev);
b591d3c1964e7c drivers/hwmon/adm1026.c     Axel Lin       2014-07-03  600  =
	struct i2c_client *client =3D data->client;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  601  =
	long val;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  602  =
	int err;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  603 =
=20
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  604  =
	err =3D kstrtol(buf, 10, &val);
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  605  =
	if (err)
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  606  =
		return err;
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  607 =
=20
9a61bf6300533d drivers/hwmon/adm1026.c     Ingo Molnar    2006-01-18  608  =
	mutex_lock(&data->update_lock);
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03 @609  =
	data->in_min[16] =3D INS_TO_REG(16,
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  610  =
				      clamp_val(val, INT_MIN,
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  611  =
						INT_MAX - NEG12_OFFSET) +
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  612  =
				      NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  613  =
	adm1026_write_value(client, ADM1026_REG_IN_MIN[16], data->in_min[16]);
9a61bf6300533d drivers/hwmon/adm1026.c     Ingo Molnar    2006-01-18  614  =
	mutex_unlock(&data->update_lock);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  615  =
	return count;
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  616  }
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  617  =
static ssize_t in16_max_show(struct device *dev,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  618  =
			     struct device_attribute *attr, char *buf)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  619  {
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  620  =
	struct adm1026_data *data =3D adm1026_update_device(dev);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  621  =
	return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_max[16])
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  622  =
			- NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  623  }
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  624  =
static ssize_t in16_max_store(struct device *dev,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  625  =
			      struct device_attribute *attr, const char *buf,
7ded2315ffe2b5 drivers/hwmon/adm1026.c     Guenter Roeck  2019-01-21  626  =
			      size_t count)
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  627  {
b591d3c1964e7c drivers/hwmon/adm1026.c     Axel Lin       2014-07-03  628  =
	struct adm1026_data *data =3D dev_get_drvdata(dev);
b591d3c1964e7c drivers/hwmon/adm1026.c     Axel Lin       2014-07-03  629  =
	struct i2c_client *client =3D data->client;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  630  =
	long val;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  631  =
	int err;
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  632 =
=20
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  633  =
	err =3D kstrtol(buf, 10, &val);
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  634  =
	if (err)
86aa3e22106be3 drivers/hwmon/adm1026.c     Guenter Roeck  2012-01-14  635  =
		return err;
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  636 =
=20
9a61bf6300533d drivers/hwmon/adm1026.c     Ingo Molnar    2006-01-18  637  =
	mutex_lock(&data->update_lock);
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  638  =
	data->in_max[16] =3D INS_TO_REG(16,
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  639  =
				      clamp_val(val, INT_MIN,
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  640  =
						INT_MAX - NEG12_OFFSET) +
f1b9baa99bd98f drivers/hwmon/adm1026.c     Guenter Roeck  2016-12-03  641  =
				      NEG12_OFFSET);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  642  =
	adm1026_write_value(client, ADM1026_REG_IN_MAX[16], data->in_max[16]);
9a61bf6300533d drivers/hwmon/adm1026.c     Ingo Molnar    2006-01-18  643  =
	mutex_unlock(&data->update_lock);
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  644  =
	return count;
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  645  }
^1da177e4c3f41 drivers/i2c/chips/adm1026.c Linus Torvalds 2005-04-16  646 =
=20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
