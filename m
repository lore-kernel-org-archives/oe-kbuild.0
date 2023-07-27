Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAC017F5
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 03:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690428576; x=1721964576;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9jNgq+h2cQcTZlUz5zIpCRsIr8XqC4Wto7BWlosG4lw=;
  b=RvXioo/f/CjmUd5b2ERGiIJl/NAk/ROyy2vcsCJx7XiSOyPkE2ZchSbf
   yQPsR7vvRLOdJ5855T/hQw4N1pUMZEmtx11X7sw92KQB17OK8AP2rXd2Q
   xayHGlOahTpCbd8kt2r86+7FE8B0y+N3Ek7Kxa7b7NDSEeW331+askGJk
   nU8JmtwcL5xH11RNW27j6JT174w3W93TitsrVRN72IAvK9uU7Vs7eWKEV
   q6NFSnaYoTQxyWEUGPZK3aqhEWyx6Wo+6IxT6fl9EM5R0/LFxZ3sBTIPM
   P3IQTw4BKEdpm3J0a4R4ubjyDlw6fPNPY1c9CXIsm0ejAkQiMLm5lmAzj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348473364"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="348473364"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 20:27:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676948393"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="676948393"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 20:27:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOrf9-0001cN-0z;
	Thu, 27 Jul 2023 03:27:39 +0000
Date: Thu, 27 Jul 2023 11:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307271134.BYUR61oT-lkp@intel.com>
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
 fs/inode.c:2462:20: sparse: sparse: bad integer constant expression"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
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
[also build test WARNING on linus/master v6.5-rc3 next-20230726]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-=
Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-2049=
40
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ever=
ything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%4=
0AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if=
 the arguments have the same signedness.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r092-20230725 (https://download.01.org/0day-c=
i/archive/20230727/202307271134.BYUR61oT-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271134.B=
YUR61oT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307271134.BYUR61oT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/inode.c:2462:20: sparse: sparse: bad integer constant expression
>> fs/inode.c:2462:20: sparse: sparse: static assertion failed: "clamp() lo=
w limit sb->s_time_min greater than high limit sb->s_time_max"
--
>> kernel/workqueue.c:4579:16: sparse: sparse: bad integer constant express=
ion
>> kernel/workqueue.c:4579:16: sparse: sparse: static assertion failed: "cl=
amp() low limit (typeof(max_active))(1) greater than high limit (typeof(max=
_active))(lim)"
--
>> lib/dynamic_queue_limits.c:101:17: sparse: sparse: bad integer constant =
expression
>> lib/dynamic_queue_limits.c:101:17: sparse: sparse: static assertion fail=
ed: "clamp() low limit dql->min_limit greater than high limit dql->max_limi=
t"
--
>> mm/mm_init.c:908:21: sparse: sparse: bad integer constant expression
>> mm/mm_init.c:908:21: sparse: sparse: static assertion failed: "clamp() l=
ow limit zone_start_pfn greater than high limit zone_end_pfn"
   mm/mm_init.c:909:19: sparse: sparse: bad integer constant expression
   mm/mm_init.c:909:19: sparse: sparse: static assertion failed: "clamp() l=
ow limit zone_start_pfn greater than high limit zone_end_pfn"
   mm/mm_init.c:1145:29: sparse: sparse: bad integer constant expression
>> mm/mm_init.c:1145:29: sparse: sparse: static assertion failed: "clamp() =
low limit range_start_pfn greater than high limit range_end_pfn"
   mm/mm_init.c:1146:27: sparse: sparse: bad integer constant expression
   mm/mm_init.c:1146:27: sparse: sparse: static assertion failed: "clamp() =
low limit range_start_pfn greater than high limit range_end_pfn"
   mm/mm_init.c:1189:37: sparse: sparse: bad integer constant expression
   mm/mm_init.c:1189:37: sparse: sparse: static assertion failed: "clamp() =
low limit zone_start_pfn greater than high limit zone_end_pfn"
   mm/mm_init.c:1191:35: sparse: sparse: bad integer constant expression
   mm/mm_init.c:1191:35: sparse: sparse: static assertion failed: "clamp() =
low limit zone_start_pfn greater than high limit zone_end_pfn"
   mm/mm_init.c:1222:27: sparse: sparse: bad integer constant expression
>> mm/mm_init.c:1222:27: sparse: sparse: static assertion failed: "clamp() =
low limit zone_low greater than high limit zone_high"
   mm/mm_init.c:1223:25: sparse: sparse: bad integer constant expression
   mm/mm_init.c:1223:25: sparse: sparse: static assertion failed: "clamp() =
low limit zone_low greater than high limit zone_high"
--
>> mm/page_alloc.c:2415:17: sparse: sparse: bad integer constant expression
>> mm/page_alloc.c:2415:17: sparse: sparse: static assertion failed: "clamp=
() low limit min_nr_free greater than high limit max_nr_free"
--
>> mm/memblock.c:222:30: sparse: sparse: bad integer constant expression
>> mm/memblock.c:222:30: sparse: sparse: static assertion failed: "clamp() =
low limit start greater than high limit end"
   mm/memblock.c:223:28: sparse: sparse: bad integer constant expression
   mm/memblock.c:223:28: sparse: sparse: static assertion failed: "clamp() =
low limit start greater than high limit end"
   mm/memblock.c:258:30: sparse: sparse: bad integer constant expression
   mm/memblock.c:258:30: sparse: sparse: static assertion failed: "clamp() =
low limit start greater than high limit end"
   mm/memblock.c:259:28: sparse: sparse: bad integer constant expression
   mm/memblock.c:259:28: sparse: sparse: static assertion failed: "clamp() =
low limit start greater than high limit end"
--
>> drivers/clk/clk.c:1484:29: sparse: sparse: bad integer constant expressi=
on
>> drivers/clk/clk.c:1484:29: sparse: sparse: static assertion failed: "cla=
mp() low limit req->min_rate greater than high limit req->max_rate"
   drivers/clk/clk.c:2613:16: sparse: sparse: bad integer constant expressi=
on
>> drivers/clk/clk.c:2613:16: sparse: sparse: static assertion failed: "cla=
mp() low limit min greater than high limit max"
--
>> drivers/clk/clk-versaclock5.c:456:16: sparse: sparse: bad integer consta=
nt expression
>> drivers/clk/clk-versaclock5.c:456:16: sparse: sparse: static assertion f=
ailed: "clamp() low limit 2500000000UL greater than high limit vc5->chip_in=
fo->vco_max"
--
>> drivers/hwmon/w83793.c:201:16: sparse: sparse: bad integer constant expr=
ession
>> drivers/hwmon/w83793.c:201:16: sparse: sparse: static assertion failed: =
"clamp() low limit (typeof((val + (val < 0 ? -500 : 500)) / 1000))(min) gre=
ater than high limit (typeof((val + (val < 0 ? -500 : 500)) / 1000))(max)"
--
>> drivers/hwmon/w83795.c:273:16: sparse: sparse: bad integer constant expr=
ession
>> drivers/hwmon/w83795.c:273:16: sparse: sparse: static assertion failed: =
"clamp() low limit (typeof(val / 1000))(min) greater than high limit (typeo=
f(val / 1000))(max)"
--
>> drivers/hwmon/adm1026.c:498:28: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/adm1026.c:498:28: sparse: sparse: static assertion failed:=
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
(-((int)(~0U >> 1)) - 1))))1)), "clamp() 'lo' signedness error"); _Static_a=
ssert(((((typeof((typeof(val))(val)))(-1)) < (__attribute__((force)) typeof=
((typeof(val))(val)))1) =3D=3D (((typeof((typeof(val))(((int)(~0U >> 1)) - =
16000)))(-1)) < (__attribute__((force)) typeof((typeof(val))(((int)(~0U >> =
1)) - 16000)))1)), "clamp() 'hi' signedness error"); ((__UNIQUE_ID___val326=
) >=3D (__UNIQUE_ID___hi328) ? (__UNIQUE_ID___hi328) : ((__UNIQUE_ID___val3=
26) <=3D (__UNIQUE_ID___lo327) ? (__UNIQUE_ID___lo327) : (__UNIQUE_ID___val=
326))); })); }) + 16000))(0) greater than high limit (typeof(({ __builtin_c=
hoose_expr((sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(((typeof(val))=
(val)) - ((typeof(val))((-((int)(~0U >> 1)) - 1))) + ((typeof(val))(((int)(=
~0U >> 1)) - 16000))) * 0l)) : (int *)8))), (((typeof(val))(val)) >=3D ((ty=
peof(val))(((int)(~0U >> 1)) - 16000)) ? ((typeof(val))(((int)(~0U >> 1)) -=
 16000)) : (((typeof(val))(val)) <=3D ((typeof(val))((-((int)(~0U >> 1)) - =
1))) ? ((typeof(val))((-((int)(~0U >> 1)) - 1))) : ((typeof(val))(val)))), =
({ typeof((typeof(val))(val)) __UNIQUE_ID___val326 =3D ((typeof(val))(val))=
; typeof((typeof(val))((-((int)(~0U >> 1)) - 1))) __UNIQUE_ID___lo327 =3D (=
(typeof(val))((-((int)(~0U >> 1)) - 1))); typeof((typeof(val))(((int)(~0U >=
> 1)) - 16000)) __UNIQUE_ID___hi328 =3D ((typeof(val))(((int)(~0U >> 1)) - =
16000)); _Static_assert(!(sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(=
((typeof(val))((-((int)(~0U >> 1)) - 1))) > ((typeof(val))(((int)(~0U >> 1)=
) - 16000))) * 0l)) : (int *)8))) || ((typeof(val))((-((int)(~0U >> 1)) - 1=
))) <=3D ((typeof(val))(((int)(~0U >> 1)) - 16000)), "clamp() low limit " "=
(typeof(val))((-((int)(~0U >> 1)) - 1))" " greater than high limit " "(type=
of(val))(((int)(~0U >> 1)) - 16000)"); _Static_assert(((((typeof((typeof(va=
l))(val)))(-1)) < (__attribute__((force)) typeof((typeof(val))(val)))1) =3D=
=3D (((typeof((typeof(val))((-((int)(~0U >> 1)) - 1))))(-1)) < (__attribute=
__((force)) typeof((typeof(val))((-((int)(~0U >> 1)) - 1))))1)), "clamp() '=
lo' signedness error"); _Static_assert(((((typeof((typeof(val))(val)))(-1))=
 < (__attribute__((force)) typeof((typeof(val))(val)))1) =3D=3D (((typeof((=
typeof(val))(((int)(~0U >> 1)) - 16000)))(-1)) < (__attribute__((force)) ty=
peof((typeof(val))(((int)(~0U >> 1)) - 16000)))1)), "clamp() 'hi' signednes=
s error"); ((__UNIQUE_ID___val326) >=3D (__UNIQUE_ID___hi328) ? (__UNIQUE_I=
D___hi328) : ((__UNIQUE_ID___val326) <=3D (__UNIQUE_ID___lo327) ? (__UNIQUE=
_ID___lo327) : (__UNIQUE_ID___val326))); })); }) + 16000))(255 * adm1026_sc=
aling[16] / 192)"
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
(-((int)(~0U >> 1)) - 1))))1)), "clamp() 'lo' signedness error"); _Static_a=
ssert(((((typeof((typeof(val))(val)))(-1)) < (__attribute__((force)) typeof=
((typeof(val))(val)))1) =3D=3D (((typeof((typeof(val))(((int)(~0U >> 1)) - =
16000)))(-1)) < (__attribute__((force)) typeof((typeof(val))(((int)(~0U >> =
1)) - 16000)))1)), "clamp() 'hi' signedness error"); ((__UNIQUE_ID___val332=
) >=3D (__UNIQUE_ID___hi334) ? (__UNIQUE_ID___hi334) : ((__UNIQUE_ID___val3=
32) <=3D (__UNIQUE_ID___lo333) ? (__UNIQUE_ID___lo333) : (__UNIQUE_ID___val=
332))); })); }) + 16000))(0) greater than high limit (typeof(({ __builtin_c=
hoose_expr((sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(((typeof(val))=
(val)) - ((typeof(val))((-((int)(~0U >> 1)) - 1))) + ((typeof(val))(((int)(=
~0U >> 1)) - 16000))) * 0l)) : (int *)8))), (((typeof(val))(val)) >=3D ((ty=
peof(val))(((int)(~0U >> 1)) - 16000)) ? ((typeof(val))(((int)(~0U >> 1)) -=
 16000)) : (((typeof(val))(val)) <=3D ((typeof(val))((-((int)(~0U >> 1)) - =
1))) ? ((typeof(val))((-((int)(~0U >> 1)) - 1))) : ((typeof(val))(val)))), =
({ typeof((typeof(val))(val)) __UNIQUE_ID___val332 =3D ((typeof(val))(val))=
; typeof((typeof(val))((-((int)(~0U >> 1)) - 1))) __UNIQUE_ID___lo333 =3D (=
(typeof(val))((-((int)(~0U >> 1)) - 1))); typeof((typeof(val))(((int)(~0U >=
> 1)) - 16000)) __UNIQUE_ID___hi334 =3D ((typeof(val))(((int)(~0U >> 1)) - =
16000)); _Static_assert(!(sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(=
((typeof(val))((-((int)(~0U >> 1)) - 1))) > ((typeof(val))(((int)(~0U >> 1)=
) - 16000))) * 0l)) : (int *)8))) || ((typeof(val))((-((int)(~0U >> 1)) - 1=
))) <=3D ((typeof(val))(((int)(~0U >> 1)) - 16000)), "clamp() low limit " "=
(typeof(val))((-((int)(~0U >> 1)) - 1))" " greater than high limit " "(type=
of(val))(((int)(~0U >> 1)) - 16000)"); _Static_assert(((((typeof((typeof(va=
l))(val)))(-1)) < (__attribute__((force)) typeof((typeof(val))(val)))1) =3D=
=3D (((typeof((typeof(val))((-((int)(~0U >> 1)) - 1))))(-1)) < (__attribute=
__((force)) typeof((typeof(val))((-((int)(~0U >> 1)) - 1))))1)), "clamp() '=
lo' signedness error"); _Static_assert(((((typeof((typeof(val))(val)))(-1))=
 < (__attribute__((force)) typeof((typeof(val))(val)))1) =3D=3D (((typeof((=
typeof(val))(((int)(~0U >> 1)) - 16000)))(-1)) < (__attribute__((force)) ty=
peof((typeof(val))(((int)(~0U >> 1)) - 16000)))1)), "clamp() 'hi' signednes=
s error"); ((__UNIQUE_ID___val332) >=3D (__UNIQUE_ID___hi334) ? (__UNIQUE_I=
D___hi334) : ((__UNIQUE_ID___val332) <=3D (__UNIQUE_ID___lo333) ? (__UNIQUE=
_ID___lo333) : (__UNIQUE_ID___val332))); })); }) + 16000))(255 * adm1026_sc=
aling[16] / 192)"
   /bin/bash: line 1: 51808 Segmentation fault      sparse -D__linux__ -Dli=
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
--
>> drivers/hwmon/adm9240.c:89:15: sparse: sparse: bad integer constant expr=
ession
>> drivers/hwmon/adm9240.c:89:15: sparse: sparse: static assertion failed: =
"clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(n=
om_mv[n] * 255 / 192)"
--
>> drivers/hwmon/adt7411.c:464:15: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/adt7411.c:464:15: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(=
255 * data->vref_cached / 256)"
--
>> drivers/hwmon/adt7462.c:899:16: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/adt7462.c:899:16: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(temp))(0) greater than high limit (typeof(temp)=
)(255 * x / 1000)"
   drivers/hwmon/adt7462.c:939:16: sparse: sparse: bad integer constant exp=
ression
   drivers/hwmon/adt7462.c:939:16: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(temp))(0) greater than high limit (typeof(temp)=
)(255 * x / 1000)"
--
>> drivers/hwmon/asc7621.c:214:18: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/asc7621.c:214:18: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(reqval))(0) greater than high limit (typeof(req=
val))(param->mask[0])"
   drivers/hwmon/asc7621.c:479:18: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/asc7621.c:479:18: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(reqval))(auto_point1 + 2000) greater than high =
limit (typeof(reqval))(auto_point1 + 80000)"
--
>> drivers/hwmon/dme1737.c:269:15: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/dme1737.c:269:15: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(=
255 * nominal / 192)"
   drivers/hwmon/dme1737.c:325:16: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/dme1737.c:325:16: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(hyst))(temp - 15000) greater than high limit (t=
ypeof(hyst))(temp)"
   drivers/hwmon/dme1737.c:1050:23: sparse: sparse: bad integer constant ex=
pression
>> drivers/hwmon/dme1737.c:1050:23: sparse: sparse: static assertion failed=
: "clamp() low limit (typeof(val))(temp) greater than high limit (typeof(va=
l))(temp + 80000)"
--
>> drivers/hwmon/emc6w201.c:205:15: sparse: sparse: bad integer constant ex=
pression
>> drivers/hwmon/emc6w201.c:205:15: sparse: sparse: static assertion failed=
: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))=
(255 * nominal_mv[nr] / 192)"
--
>> drivers/hwmon/f71882fg.c:616:15: sparse: sparse: bad integer constant ex=
pression
>> drivers/hwmon/f71882fg.c:616:15: sparse: sparse: static assertion failed=
: "clamp() low limit (typeof(val))(data->temp_high[nr] - 15) greater than h=
igh limit (typeof(val))(data->temp_high[nr])"
   drivers/hwmon/f71882fg.c:1591:15: sparse: sparse: bad integer constant e=
xpression
>> drivers/hwmon/f71882fg.c:1591:15: sparse: sparse: static assertion faile=
d: "clamp() low limit (typeof(val))(data->pwm_auto_point_temp[nr][point] - =
15) greater than high limit (typeof(val))(data->pwm_auto_point_temp[nr][poi=
nt])"
--
>> drivers/hwmon/g762.c:191:15: sparse: sparse: bad integer constant expres=
sion
>> drivers/hwmon/g762.c:191:15: sparse: sparse: static assertion failed: "c=
lamp() low limit (typeof(rpm))(f1 / (255 * f2)) greater than high limit (ty=
peof(rpm))((~0UL) / f2)"
--
>> drivers/hwmon/gl520sm.c:390:13: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/gl520sm.c:390:13: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(v))((480000 >> (data->fan_div[n])) / 255) great=
er than high limit (typeof(v))((480000 >> (data->fan_div[n])))"
>> drivers/hwmon/gl520sm.c:390:13: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/gl520sm.c:390:13: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(v))((480000 >> (data->fan_div[n])) / 255) great=
er than high limit (typeof(v))((480000 >> (data->fan_div[n])))"
>> drivers/hwmon/gl520sm.c:390:13: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/gl520sm.c:390:13: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(v))((480000 >> (data->fan_div[n])) / 255) great=
er than high limit (typeof(v))((480000 >> (data->fan_div[n])))"
--
>> drivers/hwmon/ina3221.c:448:22: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/ina3221.c:448:22: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(val))((-((int)(~0U >> 1)) - 1) / resistance_uo)=
 greater than high limit (typeof(val))(((int)(~0U >> 1)) / resistance_uo)"
--
>> drivers/hwmon/jc42.c:219:21: sparse: sparse: bad integer constant expres=
sion
>> drivers/hwmon/jc42.c:219:21: sparse: sparse: static assertion failed: "c=
lamp() low limit (typeof(temp))(extended ? (-40000) : 0) greater than high =
limit (typeof(temp))(125000)"
   drivers/hwmon/jc42.c:359:23: sparse: sparse: bad integer constant expres=
sion
>> drivers/hwmon/jc42.c:359:23: sparse: sparse: static assertion failed: "c=
lamp() low limit (typeof(val))((data->extended ? (-40000) : 0) - 6000) grea=
ter than high limit (typeof(val))(125000)"
--
>> drivers/hwmon/lm85.c:874:28: sparse: sparse: bad integer constant expres=
sion
>> drivers/hwmon/lm85.c:874:28: sparse: sparse: static assertion failed: "c=
lamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(255=
 * lm85_scaling[nr] / 192)"
   drivers/hwmon/lm85.c:902:28: sparse: sparse: bad integer constant expres=
sion
   drivers/hwmon/lm85.c:902:28: sparse: sparse: static assertion failed: "c=
lamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(255=
 * lm85_scaling[nr] / 192)"
--
>> drivers/hwmon/lm93.c:361:25: sparse: sparse: bad integer constant expres=
sion
>> drivers/hwmon/lm93.c:361:25: sparse: sparse: static assertion failed: "c=
lamp() low limit (typeof(val))(lm93_vin_val_min[nr]) greater than high limi=
t (typeof(val))(lm93_vin_val_max[nr])"
   drivers/hwmon/lm93.c:375:18: sparse: sparse: bad integer constant expres=
sion
>> drivers/hwmon/lm93.c:375:18: sparse: sparse: static assertion failed: "c=
lamp() low limit (typeof(result))(lm93_vin_reg_min[nr]) greater than high l=
imit (typeof(result))(lm93_vin_reg_max[nr])"
   drivers/hwmon/lm93.c:462:15: sparse: sparse: bad integer constant expres=
sion
>> drivers/hwmon/lm93.c:462:15: sparse: sparse: static assertion failed: "c=
lamp() low limit (typeof(off))((0)) greater than high limit (typeof(off))(m=
ode ? (75) : (150))"
--
>> drivers/hwmon/max6697.c:316:16: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/max6697.c:316:16: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(temp))(0) greater than high limit (typeof(temp)=
)(data->type =3D=3D max6581 ? 255 : 127)"
--
>> drivers/hwmon/sbrmi.c:239:15: sparse: sparse: bad integer constant expre=
ssion
>> drivers/hwmon/sbrmi.c:239:15: sparse: sparse: static assertion failed: "=
clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(da=
ta->pwr_limit_max)"
--
>> drivers/hwmon/smsc47m192.c:67:15: sparse: sparse: bad integer constant e=
xpression
>> drivers/hwmon/smsc47m192.c:67:15: sparse: sparse: static assertion faile=
d: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val)=
)(nom_mv[n] * 255 / 192)"
--
>> drivers/hwmon/tmp401.c:388:23: sparse: sparse: bad integer constant expr=
ession
>> drivers/hwmon/tmp401.c:388:23: sparse: sparse: static assertion failed: =
"clamp() low limit (typeof(val))(temp - 255000) greater than high limit (ty=
peof(val))(temp)"
--
>> drivers/dma/dw/core.c:791:17: sparse: sparse: bad integer constant expre=
ssion
>> drivers/dma/dw/core.c:791:17: sparse: sparse: static assertion failed: "=
clamp() low limit 0U greater than high limit dwc->max_burst"
   drivers/dma/dw/core.c:793:17: sparse: sparse: bad integer constant expre=
ssion
   drivers/dma/dw/core.c:793:17: sparse: sparse: static assertion failed: "=
clamp() low limit 0U greater than high limit dwc->max_burst"
--
>> drivers/leds/led-class-flash.c:383:13: sparse: sparse: bad integer const=
ant expression
>> drivers/leds/led-class-flash.c:383:13: sparse: sparse: static assertion =
failed: "clamp() low limit s->min greater than high limit s->max"
--
>> net/core/flow_dissector.c:949:28: sparse: sparse: bad integer constant e=
xpression
>> net/core/flow_dissector.c:949:28: sparse: sparse: static assertion faile=
d: "clamp() low limit (u16)(nhoff) greater than high limit (u16)(hlen)"
   net/core/flow_dissector.c:950:28: sparse: sparse: bad integer constant e=
xpression
>> net/core/flow_dissector.c:950:28: sparse: sparse: static assertion faile=
d: "clamp() low limit (u16)(flow_keys->nhoff) greater than high limit (u16)=
(hlen)"
--
>> net/dccp/ccids/ccid3.c:75:30: sparse: sparse: bad integer constant expre=
ssion
>> net/dccp/ccids/ccid3.c:75:30: sparse: sparse: static assertion failed: "=
clamp() low limit (__u32)(2 * hc->tx_s) greater than high limit (__u32)(4 *=
 hc->tx_s)"
--
>> security/apparmor/lsm.c:1559:42: sparse: sparse: bad integer constant ex=
pression
>> security/apparmor/lsm.c:1559:42: sparse: sparse: static assertion failed=
: "clamp() low limit zstd_min_clevel() greater than high limit zstd_max_cle=
vel()"
--
>> net/ipv4/ip_tunnel.c:1186:23: sparse: sparse: bad integer constant expre=
ssion
>> net/ipv4/ip_tunnel.c:1186:23: sparse: sparse: static assertion failed: "=
clamp() low limit (unsigned int)68 greater than high limit max"
--
>> drivers/spi/spi-cadence.c:313:15: sparse: sparse: bad integer constant e=
xpression
>> drivers/spi/spi-cadence.c:313:15: sparse: sparse: static assertion faile=
d: "clamp() low limit 0 greater than high limit xspi->tx_bytes"
   drivers/spi/spi-cadence.c:314:15: sparse: sparse: bad integer constant e=
xpression
>> drivers/spi/spi-cadence.c:314:15: sparse: sparse: static assertion faile=
d: "clamp() low limit 0 greater than high limit xspi->rx_bytes"
--
>> drivers/spi/spi-cadence-xspi.c:436:27: sparse: sparse: bad integer const=
ant expression
>> drivers/spi/spi-cadence-xspi.c:436:27: sparse: sparse: static assertion =
failed: "clamp() low limit (typeof(op->data.nbytes))(0) greater than high l=
imit (typeof(op->data.nbytes))(cdns_xspi->sdmasize)"
--
   drivers/gpu/drm/drm_atomic.c: note: in included file (through include/dr=
m/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_atomic_uapi.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_blend.c: note: in included file (through include/drm=
/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_bridge.c: note: in included file (through include/dr=
m/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_client.c: note: in included file (through include/dr=
m/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_client.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_client_modeset.c: note: in included file (through in=
clude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_color_mgmt.c: note: in included file (through includ=
e/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
>> drivers/gpu/drm/drm_color_mgmt.c:142:15: sparse: sparse: bad integer con=
stant expression
>> drivers/gpu/drm/drm_color_mgmt.c:142:15: sparse: sparse: static assertio=
n failed: "clamp() low limit (typeof(mag))(0) greater than high limit (type=
of(mag))(negative ? ((((1ULL))) << (n + m - 1)) : ((((1ULL))) << (n + m - 1=
)) - 1)"
--
   drivers/gpu/drm/drm_crtc.c: note: in included file (through include/drm/=
drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_connector.c: note: in included file (through include=
/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_encoder.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_drv.c: note: in included file (through include/drm/d=
rm_plane.h, include/drm/drm_crtc.h, include/drm/drm_client.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_encoder.c: note: in included file (through include/d=
rm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_edid.c: note: in included file (through include/drm/=
drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_encoder.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_file.c: note: in included file (through include/drm/=
drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_client.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_framebuffer.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_ioctl.c: note: in included file (through include/drm=
/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_lease.c: note: in included file (through include/drm=
/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_mode_config.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_encoder.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_mode_object.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_modes.c: note: in included file (through include/drm=
/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
   drivers/gpu/drm/drm_modes.c:2474:29: sparse: sparse: bad integer constan=
t expression
   drivers/gpu/drm/drm_modes.c:2474:29: sparse: sparse: static assertion fa=
iled: "max(bpp_end_ptr, refresh_end_ptr) signedness error, fix types or con=
sider max_unsigned() before max_t()"
--
   drivers/gpu/drm/drm_modeset_lock.c: note: in included file (through incl=
ude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_plane.c: note: in included file (through include/drm=
/drm_plane.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_property.c: note: in included file (through include/=
drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_vblank_work.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_vblank.c: note: in included file (through include/dr=
m/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_writeback.c: note: in included file (through include=
/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_panel.c: note: in included file (through include/drm=
/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_of.c: note: in included file (through include/drm/dr=
m_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_debugfs.c: note: in included file (through include/d=
rm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_debugfs_crc.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_fb_dma_helper.c: note: in included file (through inc=
lude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper=
=2Eh, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_atomic_state_helper.c: note: in included file (throu=
gh include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.=
h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_bridge_connector.c: note: in included file (through =
include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, =
=2E..):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_crtc_helper.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_atomic_helper.c: note: in included file (through inc=
lude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_damage_helper.c: note: in included file (through inc=
lude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_encoder_slave.c: note: in included file (through inc=
lude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_encoder_slave=
=2Eh):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_gem_atomic_helper.c: note: in included file (through=
 include/drm/drm_plane.h, include/drm/drm_gem_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_kms_helper_common.c: note: in included file (through=
 include/drm/drm_plane.h, include/drm/drm_crtc.h, drivers/gpu/drm/drm_crtc_=
helper_internal.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_gem_framebuffer_helper.c: note: in included file (th=
rough include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atom=
ic_helper.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_plane_helper.c: note: in included file (through incl=
ude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_modeset_helper.c: note: in included file (through in=
clude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helpe=
r.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_probe_helper.c: note: in included file (through incl=
ude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_simple_kms_helper.c: note: in included file (through=
 include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_self_refresh_helper.c: note: in included file (throu=
gh include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.=
h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/panel.c: note: in included file (through include/=
drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/drm_mipi_dbi.c: note: in included file (through include/=
drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h, .=
=2E.):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
>> net/ipv6/ip6_vti.c:674:28: sparse: sparse: bad integer constant expressi=
on
>> net/ipv6/ip6_vti.c:674:28: sparse: sparse: static assertion failed: "cla=
mp() low limit dev->min_mtu greater than high limit dev->max_mtu"
--
>> drivers/usb/core/config.c:347:37: sparse: sparse: bad integer constant e=
xpression
>> drivers/usb/core/config.c:347:37: sparse: sparse: static assertion faile=
d: "clamp() low limit i greater than high limit j"
   drivers/usb/core/config.c:355:37: sparse: sparse: bad integer constant e=
xpression
   drivers/usb/core/config.c:355:37: sparse: sparse: static assertion faile=
d: "clamp() low limit i greater than high limit j"
--
>> drivers/media/i2c/max2175.c:1107:16: sparse: sparse: bad integer constan=
t expression
>> drivers/media/i2c/max2175.c:1107:16: sparse: sparse: static assertion fa=
iled: "clamp() low limit ctx->bands_rf->rangelow greater than high limit ct=
x->bands_rf->rangehigh"
--
>> drivers/media/i2c/imx296.c:711:25: sparse: sparse: bad integer constant =
expression
>> drivers/media/i2c/imx296.c:711:25: sparse: sparse: static assertion fail=
ed: "clamp() low limit (unsigned int)(crop->width / 2) greater than high li=
mit (unsigned int)(crop->width)"
   drivers/media/i2c/imx296.c:713:26: sparse: sparse: bad integer constant =
expression
>> drivers/media/i2c/imx296.c:713:26: sparse: sparse: static assertion fail=
ed: "clamp() low limit (unsigned int)(crop->height / 2) greater than high l=
imit (unsigned int)(crop->height)"
--
>> drivers/media/i2c/mt9m001.c:281:21: sparse: sparse: bad integer constant=
 expression
>> drivers/media/i2c/mt9m001.c:281:21: sparse: sparse: static assertion fai=
led: "clamp() low limit (u32)(20) greater than high limit (u32)(20 + 1280 -=
 rect.width)"
   drivers/media/i2c/mt9m001.c:286:20: sparse: sparse: bad integer constant=
 expression
>> drivers/media/i2c/mt9m001.c:286:20: sparse: sparse: static assertion fai=
led: "clamp() low limit (u32)(12) greater than high limit (u32)(12 + 1024 -=
 rect.height)"
--
>> drivers/media/i2c/mt9v032.c:515:17: sparse: sparse: bad integer constant=
 expression
   drivers/media/i2c/mt9v032.c:515:17: sparse: sparse: static assertion fai=
led: "clamp() low limit __builtin_choose_expr((sizeof(int) =3D=3D sizeof(*(=
8 ? ((void *)((long)(((unsigned int)(__crop->width / 4)) - ((unsigned int)(=
1))) * 0l)) : (int *)8))), (((unsigned int)(__crop->width / 4)) > ((unsigne=
d int)(1)) ? ((unsigned int)(__crop->width / 4)) : ((unsigned int)(1))), ({=
 typeof((unsigned int)(__crop->width / 4)) __UNIQUE_ID___x322 =3D ((unsigne=
d int)(__crop->width / 4)); typeof((unsigned int)(1)) __UNIQUE_ID___y323 =
=3D ((unsigned int)(1)); _Static_assert(((((typeof((unsigned int)(__crop->w=
idth / 4)))(-1)) < (__attribute__((force)) typeof((unsigned int)(__crop->wi=
dth / 4)))1) =3D=3D (((typeof((unsigned int)(1)))(-1)) < (__attribute__((fo=
rce)) typeof((unsigned int)(1)))1)), "max" "(" "(unsigned int)(__crop->widt=
h / 4)" ", " "(unsigned int)(1)" ") signedness error, fix types or consider=
 " "max" "_unsigned() before " "max" "_t()"); ((__UNIQUE_ID___x322) > (__UN=
IQUE_ID___y323) ? (__UNIQUE_ID___x322) : (__UNIQUE_ID___y323)); })) greater=
 than high limit __crop->width"
   drivers/media/i2c/mt9v032.c:519:18: sparse: sparse: bad integer constant=
 expression
   drivers/media/i2c/mt9v032.c:519:18: sparse: sparse: static assertion fai=
led: "clamp() low limit __builtin_choose_expr((sizeof(int) =3D=3D sizeof(*(=
8 ? ((void *)((long)(((unsigned int)(__crop->height / 4)) - ((unsigned int)=
(1))) * 0l)) : (int *)8))), (((unsigned int)(__crop->height / 4)) > ((unsig=
ned int)(1)) ? ((unsigned int)(__crop->height / 4)) : ((unsigned int)(1))),=
 ({ typeof((unsigned int)(__crop->height / 4)) __UNIQUE_ID___x327 =3D ((uns=
igned int)(__crop->height / 4)); typeof((unsigned int)(1)) __UNIQUE_ID___y3=
28 =3D ((unsigned int)(1)); _Static_assert(((((typeof((unsigned int)(__crop=
->height / 4)))(-1)) < (__attribute__((force)) typeof((unsigned int)(__crop=
->height / 4)))1) =3D=3D (((typeof((unsigned int)(1)))(-1)) < (__attribute_=
_((force)) typeof((unsigned int)(1)))1)), "max" "(" "(unsigned int)(__crop-=
>height / 4)" ", " "(unsigned int)(1)" ") signedness error, fix types or co=
nsider " "max" "_unsigned() before " "max" "_t()"); ((__UNIQUE_ID___x327) >=
 (__UNIQUE_ID___y328) ? (__UNIQUE_ID___x327) : (__UNIQUE_ID___y328)); })) g=
reater than high limit __crop->height"
   /bin/bash: line 1: 62201 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ --arch=3Dmicroblaze -mlittle=
-endian -m32 -Wp,-MMD,drivers/media/i2c/.mt9v032.o.d -nostdinc -Iarch/micro=
blaze/include -I./arch/microblaze/include/generated -Iinclude -I./include -=
Iarch/microblaze/include/uapi -I./arch/microblaze/include/generated/uapi -I=
include/uapi -I./include/generated/uapi -include include/linux/compiler-ver=
sion.h -include include/linux/kconfig.h -include include/linux/compiler_typ=
es.h -D__KERNEL__ -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -st=
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
dwarf-4 -fno-var-tracking -femit-struct-debug-baseonly -gz=3Dzlib -I driver=
s/media/i2c -I ./drivers/media/i2c -DKBUILD_MODFILE=3D'"drivers/media/i2c/m=
t9v032"' -DKBUILD_BASENAME=3D'"mt9v032"' -DKBUILD_MODNAME=3D'"mt9v032"' -D_=
_KBUILD_MODNAME=3Dkmod_mt9v032 drivers/media/i2c/mt9v032.c
--
>> drivers/media/i2c/mt9p031.c:604:17: sparse: sparse: bad integer constant=
 expression
   drivers/media/i2c/mt9p031.c:604:17: sparse: sparse: static assertion fai=
led: "clamp() low limit (unsigned int)(__builtin_choose_expr((sizeof(int) =
=3D=3D sizeof(*(8 ? ((void *)((long)(((unsigned int)(__crop->width / 7)) - =
((unsigned int)(2))) * 0l)) : (int *)8))), (((unsigned int)(__crop->width /=
 7)) > ((unsigned int)(2)) ? ((unsigned int)(__crop->width / 7)) : ((unsign=
ed int)(2))), ({ typeof((unsigned int)(__crop->width / 7)) __UNIQUE_ID___x3=
24 =3D ((unsigned int)(__crop->width / 7)); typeof((unsigned int)(2)) __UNI=
QUE_ID___y325 =3D ((unsigned int)(2)); _Static_assert(((((typeof((unsigned =
int)(__crop->width / 7)))(-1)) < (__attribute__((force)) typeof((unsigned i=
nt)(__crop->width / 7)))1) =3D=3D (((typeof((unsigned int)(2)))(-1)) < (__a=
ttribute__((force)) typeof((unsigned int)(2)))1)), "max" "(" "(unsigned int=
)(__crop->width / 7)" ", " "(unsigned int)(2)" ") signedness error, fix typ=
es or consider " "max" "_unsigned() before " "max" "_t()"); ((__UNIQUE_ID__=
_x324) > (__UNIQUE_ID___y325) ? (__UNIQUE_ID___x324) : (__UNIQUE_ID___y325)=
); }))) greater than high limit (unsigned int)(__crop->width)"
   drivers/media/i2c/mt9p031.c:608:18: sparse: sparse: bad integer constant=
 expression
   drivers/media/i2c/mt9p031.c:608:18: sparse: sparse: static assertion fai=
led: "clamp() low limit (unsigned int)(__builtin_choose_expr((sizeof(int) =
=3D=3D sizeof(*(8 ? ((void *)((long)(((unsigned int)(__crop->height / 8)) -=
 ((unsigned int)(2))) * 0l)) : (int *)8))), (((unsigned int)(__crop->height=
 / 8)) > ((unsigned int)(2)) ? ((unsigned int)(__crop->height / 8)) : ((uns=
igned int)(2))), ({ typeof((unsigned int)(__crop->height / 8)) __UNIQUE_ID_=
__x329 =3D ((unsigned int)(__crop->height / 8)); typeof((unsigned int)(2)) =
__UNIQUE_ID___y330 =3D ((unsigned int)(2)); _Static_assert(((((typeof((unsi=
gned int)(__crop->height / 8)))(-1)) < (__attribute__((force)) typeof((unsi=
gned int)(__crop->height / 8)))1) =3D=3D (((typeof((unsigned int)(2)))(-1))=
 < (__attribute__((force)) typeof((unsigned int)(2)))1)), "max" "(" "(unsig=
ned int)(__crop->height / 8)" ", " "(unsigned int)(2)" ") signedness error,=
 fix types or consider " "max" "_unsigned() before " "max" "_t()"); ((__UNI=
QUE_ID___x329) > (__UNIQUE_ID___y330) ? (__UNIQUE_ID___x329) : (__UNIQUE_ID=
___y330)); }))) greater than high limit (unsigned int)(__crop->height)"
   /bin/bash: line 1: 62278 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ --arch=3Dmicroblaze -mlittle=
-endian -m32 -Wp,-MMD,drivers/media/i2c/.mt9p031.o.d -nostdinc -Iarch/micro=
blaze/include -I./arch/microblaze/include/generated -Iinclude -I./include -=
Iarch/microblaze/include/uapi -I./arch/microblaze/include/generated/uapi -I=
include/uapi -I./include/generated/uapi -include include/linux/compiler-ver=
sion.h -include include/linux/kconfig.h -include include/linux/compiler_typ=
es.h -D__KERNEL__ -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -st=
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
dwarf-4 -fno-var-tracking -femit-struct-debug-baseonly -gz=3Dzlib -I driver=
s/media/i2c -I ./drivers/media/i2c -DKBUILD_MODFILE=3D'"drivers/media/i2c/m=
t9p031"' -DKBUILD_BASENAME=3D'"mt9p031"' -DKBUILD_MODNAME=3D'"mt9p031"' -D_=
_KBUILD_MODNAME=3Dkmod_mt9p031 drivers/media/i2c/mt9p031.c
--
>> drivers/media/i2c/ov4689.c:638:19: sparse: sparse: bad integer constant =
expression
>> drivers/media/i2c/ov4689.c:638:19: sparse: sparse: static assertion fail=
ed: "clamp() low limit range->physical_min greater than high limit range->p=
hysical_max"
--
>> drivers/media/i2c/ov5640.c:2770:15: sparse: sparse: bad integer constant=
 expression
>> drivers/media/i2c/ov5640.c:2770:15: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(( { typeof(fi->denominator) __x =3D fi->den=
ominator; typeof(fi->numerator) __d =3D fi->numerator; (((typeof(fi->denomi=
nator))-1) > 0 || ((typeof(fi->numerator))-1) > 0 || (((__x) > 0) =3D=3D ((=
__d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (_=
_d)); } )))(minfps) greater than high limit (typeof(( { typeof(fi->denomina=
tor) __x =3D fi->denominator; typeof(fi->numerator) __d =3D fi->numerator; =
(((typeof(fi->denominator))-1) > 0 || ((typeof(fi->numerator))-1) > 0 || ((=
(__x) > 0) =3D=3D ((__d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x)=
 - ((__d) / 2)) / (__d)); } )))(maxfps)"
   drivers/media/i2c/ov5640.c:2934:24: sparse: sparse: bad integer constant=
 expression
>> drivers/media/i2c/ov5640.c:2934:24: sparse: sparse: static assertion fai=
led: "clamp() low limit (s32)(sensor->ctrls.exposure->minimum) greater than=
 high limit (s32)(exposure_max)"
   /bin/bash: line 1: 64522 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ --arch=3Dmicroblaze -mlittle=
-endian -m32 -Wp,-MMD,drivers/media/i2c/.ov5640.o.d -nostdinc -Iarch/microb=
laze/include -I./arch/microblaze/include/generated -Iinclude -I./include -I=
arch/microblaze/include/uapi -I./arch/microblaze/include/generated/uapi -Ii=
nclude/uapi -I./include/generated/uapi -include include/linux/compiler-vers=
ion.h -include include/linux/kconfig.h -include include/linux/compiler_type=
s.h -D__KERNEL__ -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=
=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-ali=
asing -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimpli=
cit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-secur=
ity -Wno-trigraphs -mlittle-endian -ffixed-r31 -mcpu=3Dv7.10.d -fno-delete-=
null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-o=
verflow -Wno-address-of-packed-member -Os -fno-allow-store-data-races -fno-=
reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining -Wframe-larger-than=
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
dwarf-4 -fno-var-tracking -femit-struct-debug-baseonly -gz=3Dzlib -I driver=
s/media/i2c -I ./drivers/media/i2c -DKBUILD_MODFILE=3D'"drivers/media/i2c/o=
v5640"' -DKBUILD_BASENAME=3D'"ov5640"' -DKBUILD_MODNAME=3D'"ov5640"' -D__KB=
UILD_MODNAME=3Dkmod_ov5640 drivers/media/i2c/ov5640.c
--
>> drivers/media/i2c/ov5693.c:963:17: sparse: sparse: bad integer constant =
expression
>> drivers/media/i2c/ov5693.c:963:17: sparse: sparse: static assertion fail=
ed: "clamp() low limit (unsigned int)(2) greater than high limit (unsigned =
int)(crop->width)"
   drivers/media/i2c/ov5693.c:965:18: sparse: sparse: bad integer constant =
expression
>> drivers/media/i2c/ov5693.c:965:18: sparse: sparse: static assertion fail=
ed: "clamp() low limit (unsigned int)(2) greater than high limit (unsigned =
int)(crop->height)"
--
>> drivers/media/radio/radio-tea5777.c:178:16: sparse: sparse: bad integer =
constant expression
>> drivers/media/radio/radio-tea5777.c:178:16: sparse: sparse: static asser=
tion failed: "clamp() low limit bands[tea->band].rangelow greater than high=
 limit bands[tea->band].rangehigh"
   drivers/media/radio/radio-tea5777.c:398:37: sparse: sparse: bad integer =
constant expression
>> drivers/media/radio/radio-tea5777.c:398:37: sparse: sparse: static asser=
tion failed: "clamp() low limit rangelow greater than high limit rangehigh"
--
>> drivers/media/radio/radio-si476x.c:699:16: sparse: sparse: bad integer c=
onstant expression
>> drivers/media/radio/radio-si476x.c:699:16: sparse: sparse: static assert=
ion failed: "clamp() low limit si476x_bands[band].rangelow greater than hig=
h limit si476x_bands[band].rangehigh"
--
>> drivers/media/radio/tea575x.c:170:16: sparse: sparse: bad integer consta=
nt expression
>> drivers/media/radio/tea575x.c:170:16: sparse: sparse: static assertion f=
ailed: "clamp() low limit bands[tea->band].rangelow greater than high limit=
 bands[tea->band].rangehigh"
   drivers/media/radio/tea575x.c:350:21: sparse: sparse: bad integer consta=
nt expression
>> drivers/media/radio/tea575x.c:350:21: sparse: sparse: static assertion f=
ailed: "clamp() low limit (u32)(bands[tea->band].rangelow) greater than hig=
h limit (u32)(bands[tea->band].rangehigh)"
   drivers/media/radio/tea575x.c:384:37: sparse: sparse: bad integer consta=
nt expression
>> drivers/media/radio/tea575x.c:384:37: sparse: sparse: static assertion f=
ailed: "clamp() low limit bands[i].rangelow greater than high limit bands[i=
].rangehigh"
--
>> drivers/media/radio/radio-ma901.c:252:43: sparse: sparse: bad integer co=
nstant expression
>> drivers/media/radio/radio-ma901.c:252:43: sparse: sparse: static asserti=
on failed: "clamp() low limit (unsigned)(87.5 * 16000) greater than high li=
mit (unsigned)(108.0 * 16000)"
--
>> drivers/media/radio/radio-mr800.c:198:16: sparse: sparse: bad integer co=
nstant expression
>> drivers/media/radio/radio-mr800.c:198:16: sparse: sparse: static asserti=
on failed: "clamp() low limit (unsigned)(87.5 * 16000) greater than high li=
mit (unsigned)(108.0 * 16000)"
--
>> drivers/media/radio/radio-raremono.c:256:16: sparse: sparse: bad integer=
 constant expression
>> drivers/media/radio/radio-raremono.c:256:16: sparse: sparse: static asse=
rtion failed: "clamp() low limit (u32)(bands[band].rangelow) greater than h=
igh limit (u32)(bands[band].rangehigh)"
--
>> drivers/usb/host/xhci-mem.c:1231:20: sparse: sparse: bad integer constan=
t expression
>> drivers/usb/host/xhci-mem.c:1231:20: sparse: sparse: static assertion fa=
iled: "clamp() low limit (typeof(interval))(min_exponent) greater than high=
 limit (typeof(interval))(max_exponent)"
--
>> drivers/iio/magnetometer/ak8975.c:745:16: sparse: sparse: bad integer co=
nstant expression
>> drivers/iio/magnetometer/ak8975.c:745:16: sparse: sparse: static asserti=
on failed: "clamp() low limit (s16)(-def->range) greater than high limit (s=
16)(def->range)"
   drivers/iio/magnetometer/ak8975.c:855:34: sparse: sparse: bad integer co=
nstant expression
   drivers/iio/magnetometer/ak8975.c:855:34: sparse: sparse: static asserti=
on failed: "clamp() low limit (s16)(-def->range) greater than high limit (s=
16)(def->range)"
   drivers/iio/magnetometer/ak8975.c:856:34: sparse: sparse: bad integer co=
nstant expression
   drivers/iio/magnetometer/ak8975.c:856:34: sparse: sparse: static asserti=
on failed: "clamp() low limit (s16)(-def->range) greater than high limit (s=
16)(def->range)"
   drivers/iio/magnetometer/ak8975.c:857:34: sparse: sparse: bad integer co=
nstant expression
   drivers/iio/magnetometer/ak8975.c:857:34: sparse: sparse: static asserti=
on failed: "clamp() low limit (s16)(-def->range) greater than high limit (s=
16)(def->range)"
--
>> drivers/power/supply/cpcap-battery.c:730:31: sparse: sparse: bad integer=
 constant expression
>> drivers/power/supply/cpcap-battery.c:730:31: sparse: sparse: static asse=
rtion failed: "clamp() low limit 0 greater than high limit ddata->charge_fu=
ll"
--
>> drivers/power/supply/max77976_charger.c:259:16: sparse: sparse: bad inte=
ger constant expression
>> drivers/power/supply/max77976_charger.c:259:16: sparse: sparse: static a=
ssertion failed: "clamp() low limit (typeof(regval * mult))(clamp_min) grea=
ter than high limit (typeof(regval * mult))(clamp_max)"
   drivers/power/supply/max77976_charger.c:270:18: sparse: sparse: bad inte=
ger constant expression
>> drivers/power/supply/max77976_charger.c:270:18: sparse: sparse: static a=
ssertion failed: "clamp() low limit (typeof(val))(clamp_min) greater than h=
igh limit (typeof(val))(clamp_max)"
--
>> drivers/power/supply/bq256xx_charger.c:525:16: sparse: sparse: bad integ=
er constant expression
>> drivers/power/supply/bq256xx_charger.c:525:16: sparse: sparse: static as=
sertion failed: "clamp() low limit 0 greater than high limit ichg_max"
   drivers/power/supply/bq256xx_charger.c:538:16: sparse: sparse: bad integ=
er constant expression
   drivers/power/supply/bq256xx_charger.c:538:16: sparse: sparse: static as=
sertion failed: "clamp() low limit 0 greater than high limit ichg_max"
   drivers/power/supply/bq256xx_charger.c:638:19: sparse: sparse: bad integ=
er constant expression
>> drivers/power/supply/bq256xx_charger.c:638:19: sparse: sparse: static as=
sertion failed: "clamp() low limit 3504000 greater than high limit vbatreg_=
max"
   drivers/power/supply/bq256xx_charger.c:660:19: sparse: sparse: bad integ=
er constant expression
   drivers/power/supply/bq256xx_charger.c:660:19: sparse: sparse: static as=
sertion failed: "clamp() low limit 3494000 greater than high limit vbatreg_=
max"
   drivers/power/supply/bq256xx_charger.c:681:19: sparse: sparse: bad integ=
er constant expression
   drivers/power/supply/bq256xx_charger.c:681:19: sparse: sparse: static as=
sertion failed: "clamp() low limit 3856000 greater than high limit vbatreg_=
max"
   drivers/power/supply/bq256xx_charger.c:696:19: sparse: sparse: bad integ=
er constant expression
   drivers/power/supply/bq256xx_charger.c:696:19: sparse: sparse: static as=
sertion failed: "clamp() low limit 3847000 greater than high limit vbatreg_=
max"
--
>> drivers/media/tuners/e4000.c:338:28: sparse: sparse: bad integer constan=
t expression
>> drivers/media/tuners/e4000.c:338:28: sparse: sparse: static assertion fa=
iled: "clamp() low limit (unsigned int)(bands[0].rangelow) greater than hig=
h limit (unsigned int)(bands[1].rangehigh)"
--
>> drivers/media/tuners/fc2580.c:431:28: sparse: sparse: bad integer consta=
nt expression
>> drivers/media/tuners/fc2580.c:431:28: sparse: sparse: static assertion f=
ailed: "clamp() low limit (unsigned int)(bands[0].rangelow) greater than hi=
gh limit (unsigned int)(bands[0].rangehigh)"
--
>> drivers/media/tuners/msi001.c:341:24: sparse: sparse: bad integer consta=
nt expression
>> drivers/media/tuners/msi001.c:341:24: sparse: sparse: static assertion f=
ailed: "clamp() low limit (unsigned int)(bands[band].rangelow) greater than=
 high limit (unsigned int)(bands[band].rangehigh)"
--
>> drivers/video/backlight/bd6107.c:159:28: sparse: sparse: bad integer con=
stant expression
>> drivers/video/backlight/bd6107.c:159:28: sparse: sparse: static assertio=
n failed: "clamp() low limit (unsigned int)(0) greater than high limit (uns=
igned int)(props.max_brightness)"
--
>> drivers/media/v4l2-core/v4l2-common.c:100:13: sparse: sparse: bad intege=
r constant expression
>> drivers/media/v4l2-core/v4l2-common.c:100:13: sparse: sparse: static ass=
ertion failed: "clamp() low limit (min + ~mask) & mask greater than high li=
mit max & mask"
   drivers/media/v4l2-core/v4l2-common.c:112:13: sparse: sparse: bad intege=
r constant expression
>> drivers/media/v4l2-core/v4l2-common.c:112:13: sparse: sparse: static ass=
ertion failed: "clamp() low limit min greater than high limit max"
--
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:1188:24: sparse: sparse: bad i=
nteger constant expression
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:1188:24: sparse: sparse: stati=
c assertion failed: "clamp() low limit (typeof(ptr.p_s32[idx]))((ctrl)->min=
imum) greater than high limit (typeof(ptr.p_s32[idx]))((ctrl)->maximum)"
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1199:23: sparse: sparse: bad i=
nteger constant expression
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:1199:23: sparse: sparse: stati=
c assertion failed: "clamp() low limit (s64)(ctrl->minimum) greater than hi=
gh limit (s64)(ctrl->maximum)"
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1205:24: sparse: sparse: bad i=
nteger constant expression
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:1205:24: sparse: sparse: stati=
c assertion failed: "clamp() low limit (typeof(ptr.p_u8[idx]))((ctrl)->mini=
mum) greater than high limit (typeof(ptr.p_u8[idx]))((ctrl)->maximum)"
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1207:24: sparse: sparse: bad i=
nteger constant expression
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:1207:24: sparse: sparse: stati=
c assertion failed: "clamp() low limit (typeof(ptr.p_u16[idx]))((ctrl)->min=
imum) greater than high limit (typeof(ptr.p_u16[idx]))((ctrl)->maximum)"
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1209:24: sparse: sparse: bad i=
nteger constant expression
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:1209:24: sparse: sparse: stati=
c assertion failed: "clamp() low limit (typeof(ptr.p_u32[idx]))((ctrl)->min=
imum) greater than high limit (typeof(ptr.p_u32[idx]))((ctrl)->maximum)"
--
>> drivers/usb/gadget/function/u_audio.c:801:15: sparse: sparse: bad intege=
r constant expression
>> drivers/usb/gadget/function/u_audio.c:801:15: sparse: sparse: static ass=
ertion failed: "clamp() low limit prm->volume_min greater than high limit p=
rm->volume_max"
   drivers/usb/gadget/function/u_audio.c:1041:18: sparse: sparse: bad integ=
er constant expression
   drivers/usb/gadget/function/u_audio.c:1041:18: sparse: sparse: static as=
sertion failed: "clamp() low limit prm->volume_min greater than high limit =
prm->volume_max"
--
>> drivers/media/usb/msi2500/msi2500.c:1043:30: sparse: sparse: bad integer=
 constant expression
>> drivers/media/usb/msi2500/msi2500.c:1043:30: sparse: sparse: static asse=
rtion failed: "clamp() low limit (unsigned int)(bands[0].rangelow) greater =
than high limit (unsigned int)(bands[0].rangehigh)"
--
>> drivers/media/usb/stk1160/stk1160-v4l.c:385:17: sparse: sparse: bad inte=
ger constant expression
>> drivers/media/usb/stk1160/stk1160-v4l.c:385:17: sparse: sparse: static a=
ssertion failed: "clamp() low limit (unsigned int)(base_width / 20) greater=
 than high limit (unsigned int)(base_width)"
   drivers/media/usb/stk1160/stk1160-v4l.c:387:18: sparse: sparse: bad inte=
ger constant expression
>> drivers/media/usb/stk1160/stk1160-v4l.c:387:18: sparse: sparse: static a=
ssertion failed: "clamp() low limit (unsigned int)(base_height / 20) greate=
r than high limit (unsigned int)(base_height)"
--
>> drivers/media/usb/uvc/uvc_driver.c:454:25: sparse: sparse: bad integer c=
onstant expression
>> drivers/media/usb/uvc/uvc_driver.c:454:25: sparse: sparse: static assert=
ion failed: "clamp() low limit frame->dwFrameInterval[0] greater than high =
limit frame->dwFrameInterval[maxIntervalIndex]"
--
>> drivers/media/usb/uvc/uvc_ctrl.c:1922:40: sparse: sparse: bad integer co=
nstant expression
>> drivers/media/usb/uvc/uvc_ctrl.c:1922:40: sparse: sparse: static asserti=
on failed: "clamp() low limit min greater than high limit max"
   drivers/media/usb/uvc/uvc_ctrl.c:1924:40: sparse: sparse: bad integer co=
nstant expression
>> drivers/media/usb/uvc/uvc_ctrl.c:1924:40: sparse: sparse: static asserti=
on failed: "clamp() low limit (u32)(min) greater than high limit (u32)(max)"
--
>> drivers/media/radio/si470x/radio-si470x-common.c:281:16: sparse: sparse:=
 bad integer constant expression
>> drivers/media/radio/si470x/radio-si470x-common.c:281:16: sparse: sparse:=
 static assertion failed: "clamp() low limit bands[radio->band].rangelow gr=
eater than high limit bands[radio->band].rangehigh"
--
>> drivers/media/i2c/ccs/ccs-core.c:1461:17: sparse: sparse: bad integer co=
nstant expression
>> drivers/media/i2c/ccs/ccs-core.c:1461:17: sparse: sparse: static asserti=
on failed: "clamp() low limit (u32)(1) greater than high limit (u32)(tmp)"
   drivers/media/i2c/ccs/ccs-core.c:2247:17: sparse: sparse: bad integer co=
nstant expression
>> drivers/media/i2c/ccs/ccs-core.c:2247:17: sparse: sparse: static asserti=
on failed: "clamp() low limit ccs_get_limit(sensor, 79, 0) greater than hig=
h limit ccs_get_limit(sensor, 81, 0)"
   drivers/media/i2c/ccs/ccs-core.c:2251:17: sparse: sparse: bad integer co=
nstant expression
   drivers/media/i2c/ccs/ccs-core.c:2251:17: sparse: sparse: static asserti=
on failed: "clamp() low limit ccs_get_limit(sensor, 80, 0) greater than hig=
h limit ccs_get_limit(sensor, 82, 0)"
   drivers/media/i2c/ccs/ccs-core.c:2391:13: sparse: sparse: bad integer co=
nstant expression
   drivers/media/i2c/ccs/ccs-core.c:2391:13: sparse: sparse: static asserti=
on failed: "clamp() low limit ccs_get_limit(sensor, 123, 0) greater than hi=
gh limit ccs_get_limit(sensor, 124, 0)"
   drivers/media/i2c/ccs/ccs-core.c:2393:13: sparse: sparse: bad integer co=
nstant expression
   drivers/media/i2c/ccs/ccs-core.c:2393:13: sparse: sparse: static asserti=
on failed: "clamp() low limit ccs_get_limit(sensor, 123, 0) greater than hi=
gh limit ccs_get_limit(sensor, 124, 0)"
   drivers/media/i2c/ccs/ccs-core.c:2395:17: sparse: sparse: bad integer co=
nstant expression
   drivers/media/i2c/ccs/ccs-core.c:2395:17: sparse: sparse: static asserti=
on failed: "clamp() low limit ccs_get_limit(sensor, 123, 0) greater than hi=
gh limit ccs_get_limit(sensor, 124, 0)"
--
>> drivers/media/i2c/cx25840/cx25840-core.c:1809:22: sparse: sparse: bad in=
teger constant expression
>> drivers/media/i2c/cx25840/cx25840-core.c:1809:22: sparse: sparse: static=
 assertion failed: "clamp() low limit (h_src + 15) / 16 greater than high l=
imit h_src"
   drivers/media/i2c/cx25840/cx25840-core.c:1812:31: sparse: sparse: bad in=
teger constant expression
>> drivers/media/i2c/cx25840/cx25840-core.c:1812:31: sparse: sparse: static=
 assertion failed: "clamp() low limit (u32)1 greater than high limit v_src =
- v_add"
   drivers/media/i2c/cx25840/cx25840-core.c:1814:31: sparse: sparse: bad in=
teger constant expression
>> drivers/media/i2c/cx25840/cx25840-core.c:1814:31: sparse: sparse: static=
 assertion failed: "clamp() low limit (v_src - v_add * 8 + 7) / 8 greater t=
han high limit v_src - v_add"
--
>> drivers/leds/flash/leds-mt6360.c:606:18: sparse: sparse: bad integer con=
stant expression
>> drivers/leds/flash/leds-mt6360.c:606:18: sparse: sparse: static assertio=
n failed: "clamp() low limit (typeof(val))(min) greater than high limit (ty=
peof(val))(max)"
--
>> drivers/leds/flash/leds-mt6370-flash.c:428:18: sparse: sparse: bad integ=
er constant expression
>> drivers/leds/flash/leds-mt6370-flash.c:428:18: sparse: sparse: static as=
sertion failed: "clamp() low limit (typeof(val))(min) greater than high lim=
it (typeof(val))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_drv.c: note: in included file =
(through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_a=
tomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_dev.c: note: in included file =
(through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_a=
tomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c: note: in include=
d file (through drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c: note: in included =
file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/=
drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c: note: in inc=
luded file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, includ=
e/drm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c: note: in includ=
ed file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/d=
rm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c: note: in included file =
(through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_a=
tomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_crtc.c: note: in included file=
 (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_=
atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_plane.c: note: in included fil=
e (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm=
_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c: note: in inclu=
ded file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/=
drm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c: note: in includ=
ed file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/d=
rm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/komeda_event.c: note: in included fil=
e (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm=
_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c: note: in included file=
 (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_=
atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/arm/display/komeda/d71/d71_component.c: note: in include=
d file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/dr=
m/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/display/drm_dp_helper.c: note: in included file (through=
 include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h,=
 ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/display/drm_dp_mst_topology.c: note: in included file (t=
hrough include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_ato=
mic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_drv.c: note: in included file (through in=
clude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helpe=
r.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_kms.c: note: in included file (through in=
clude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ..=
=2E):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_gem.c: note: in included file (through in=
clude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ..=
=2E):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_vram.c: note: in included file (through i=
nclude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, .=
=2E.):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_display.c: note: in included file (throug=
h include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_h=
elper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_fence.c: note: in included file (through =
include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, =
=2E..):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_vq.c: note: in included file (through inc=
lude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...=
):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_debugfs.c: note: in included file (throug=
h include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h=
, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_object.c: note: in included file (through=
 include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h,=
 ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_plane.c: note: in included file (through =
include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_hel=
per.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_ioctl.c: note: in included file (through =
include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, =
=2E..):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_prime.c: note: in included file (through =
include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, =
=2E..):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_trace_points.c: note: in included file (t=
hrough include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_ato=
mic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/virtio/virtgpu_submit.c: note: in included file (through=
 include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h,=
 ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/i2c/ch7006_drv.c: note: in included file (through includ=
e/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_encoder_slave.h,=
 ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/i2c/ch7006_mode.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_encoder_slave.h=
, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-lvds.c: note: in included file (through incl=
ude/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-ilitek-ili9341.c: note: in included file (th=
rough include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atom=
ic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-innolux-p079zca.c: note: in included file (t=
hrough include/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c: note: in included fi=
le (through include/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c: note: in included fi=
le (through include/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c: note: in included f=
ile (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/d=
rm_simple_kms_helper.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-newvision-nv3052c.c: note: in included file =
(through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_s=
imple_kms_helper.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c: note: in included=
 file (through include/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c: note: in included fi=
le (through include/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-samsung-db7430.c: note: in included file (th=
rough include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_simp=
le_kms_helper.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-raydium-rm67191.c: note: in included file (t=
hrough include/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c: note: in included fil=
e (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm=
_simple_kms_helper.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-samsung-s6d27a1.c: note: in included file (t=
hrough include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_sim=
ple_kms_helper.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c: note: in included file (th=
rough include/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/panel/panel-novatek-nt36523.c: note: in included file (t=
hrough include/drm/drm_plane.h, include/drm/drm_crtc.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/chrontel-ch7033.c: note: in included file (throug=
h include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_h=
elper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/display-connector.c: note: in included file (thro=
ugh include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic=
_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/lontium-lt9611.c: note: in included file (through=
 include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_he=
lper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/lontium-lt9611uxc.c: note: in included file (thro=
ugh include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic=
_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/ite-it6505.c: note: in included file (through inc=
lude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper=
=2Eh):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/lontium-lt9211.c: note: in included file (through=
 include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_he=
lper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/parade-ps8622.c: note: in included file (through =
include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_hel=
per.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/sil-sii8620.c: note: in included file (through in=
clude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ..=
=2E):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/sii9234.c: note: in included file (through includ=
e/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/simple-bridge.c: note: in included file (through =
include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_hel=
per.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/thc63lvd1024.c: note: in included file (through i=
nclude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, .=
=2E.):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/tc358762.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h=
):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/tc358764.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h=
):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/tc358768.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h=
):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/tc358767.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h=
):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/tc358775.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h=
):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/ti-tpd12s015.c: note: in included file (through i=
nclude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, .=
=2E.):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/ti-sn65dsi83.c: note: in included file (through i=
nclude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_help=
er.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/ti-tfp410.c: note: in included file (through incl=
ude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.=
h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/nwl-dsi.c: note: in included file (through includ=
e/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/ti-sn65dsi86.c: note: in included file (through i=
nclude/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/tiny/arcpgu.c: note: in included file (through include/d=
rm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/tiny/gm12u320.c: note: in included file (through include=
/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/tiny/hx8357d.c: note: in included file (through include/=
drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/tiny/ili9341.c: note: in included file (through include/=
drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/tiny/mi0283qt.c: note: in included file (through include=
/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/tiny/st7586.c: note: in included file (through include/d=
rm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/tiny/st7735r.c: note: in included file (through include/=
drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/tiny/repaper.c: note: in included file (through include/=
drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/solomon/ssd130x.c: note: in included file (through inclu=
de/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/solomon/ssd130x-spi.c: note: in included file (through i=
nclude/drm/drm_plane.h, include/drm/drm_crtc.h, drivers/gpu/drm/solomon/ssd=
130x.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c: note: in included fi=
le (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/dr=
m_atomic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/analogix/anx7625.c: note: in included file (throu=
gh include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic_=
helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: note: in included fi=
le (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/br=
idge/analogix_dp.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c: note: in included fil=
e (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/bri=
dge/analogix_dp.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
>> drivers/hwmon/pmbus/pmbus_core.c:969:20: sparse: sparse: too long token =
expansion
--
>> drivers/hwmon/pmbus/lm25066.c:394:46: sparse: sparse: bad integer consta=
nt expression
>> drivers/hwmon/pmbus/lm25066.c:394:46: sparse: sparse: static assertion f=
ailed: "clamp() low limit (typeof(word))(0) greater than high limit (typeof=
(word))(data->rlimit)"
   drivers/hwmon/pmbus/lm25066.c:398:46: sparse: sparse: bad integer consta=
nt expression
   drivers/hwmon/pmbus/lm25066.c:398:46: sparse: sparse: static assertion f=
ailed: "clamp() low limit (typeof(word))(0) greater than high limit (typeof=
(word))(data->rlimit)"
   drivers/hwmon/pmbus/lm25066.c:404:46: sparse: sparse: bad integer consta=
nt expression
   drivers/hwmon/pmbus/lm25066.c:404:46: sparse: sparse: static assertion f=
ailed: "clamp() low limit (typeof(word))(0) greater than high limit (typeof=
(word))(data->rlimit)"
   drivers/hwmon/pmbus/lm25066.c:412:46: sparse: sparse: bad integer consta=
nt expression
   drivers/hwmon/pmbus/lm25066.c:412:46: sparse: sparse: static assertion f=
ailed: "clamp() low limit (typeof(word))(0) greater than high limit (typeof=
(word))(data->rlimit)"
   drivers/hwmon/pmbus/lm25066.c:419:46: sparse: sparse: bad integer consta=
nt expression
   drivers/hwmon/pmbus/lm25066.c:419:46: sparse: sparse: static assertion f=
ailed: "clamp() low limit (typeof(word))(0) greater than high limit (typeof=
(word))(data->rlimit)"
--
   drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c: note: in included file (=
through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_at=
omic_helper.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c: note: in included file =
(through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_a=
tomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c: note: in included f=
ile (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/d=
rm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c: note: in included =
file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/=
drm_atomic.h, ...):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"
--
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: note: in included f=
ile (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/d=
rm_atomic.h):
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant=
 expression
>> include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion fai=
led: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(va=
l))(max)"

vim +2462 fs/inode.c

3cd886666ff19e Deepa Dinamani 2016-09-14  2447 =20
50e17c000c467f Deepa Dinamani 2018-01-21  2448  /**
50e17c000c467f Deepa Dinamani 2018-01-21  2449   * timestamp_truncate - Tru=
ncate timespec to a granularity
50e17c000c467f Deepa Dinamani 2018-01-21  2450   * @t: Timespec
50e17c000c467f Deepa Dinamani 2018-01-21  2451   * @inode: inode being upda=
ted
50e17c000c467f Deepa Dinamani 2018-01-21  2452   *
50e17c000c467f Deepa Dinamani 2018-01-21  2453   * Truncate a timespec to t=
he granularity supported by the fs
50e17c000c467f Deepa Dinamani 2018-01-21  2454   * containing the inode. Al=
ways rounds down. gran must
50e17c000c467f Deepa Dinamani 2018-01-21  2455   * not be 0 nor greater tha=
n a second (NSEC_PER_SEC, or 10^9 ns).
50e17c000c467f Deepa Dinamani 2018-01-21  2456   */
50e17c000c467f Deepa Dinamani 2018-01-21  2457  struct timespec64 timestamp=
_truncate(struct timespec64 t, struct inode *inode)
50e17c000c467f Deepa Dinamani 2018-01-21  2458  {
50e17c000c467f Deepa Dinamani 2018-01-21  2459  	struct super_block *sb =3D=
 inode->i_sb;
50e17c000c467f Deepa Dinamani 2018-01-21  2460  	unsigned int gran =3D sb->=
s_time_gran;
50e17c000c467f Deepa Dinamani 2018-01-21  2461 =20
50e17c000c467f Deepa Dinamani 2018-01-21 @2462  	t.tv_sec =3D clamp(t.tv_se=
c, sb->s_time_min, sb->s_time_max);
50e17c000c467f Deepa Dinamani 2018-01-21  2463  	if (unlikely(t.tv_sec =3D=
=3D sb->s_time_max || t.tv_sec =3D=3D sb->s_time_min))
50e17c000c467f Deepa Dinamani 2018-01-21  2464  		t.tv_nsec =3D 0;
50e17c000c467f Deepa Dinamani 2018-01-21  2465 =20
50e17c000c467f Deepa Dinamani 2018-01-21  2466  	/* Avoid division in the c=
ommon cases 1 ns and 1 s. */
50e17c000c467f Deepa Dinamani 2018-01-21  2467  	if (gran =3D=3D 1)
50e17c000c467f Deepa Dinamani 2018-01-21  2468  		; /* nothing */
50e17c000c467f Deepa Dinamani 2018-01-21  2469  	else if (gran =3D=3D NSEC_=
PER_SEC)
50e17c000c467f Deepa Dinamani 2018-01-21  2470  		t.tv_nsec =3D 0;
50e17c000c467f Deepa Dinamani 2018-01-21  2471  	else if (gran > 1 && gran =
< NSEC_PER_SEC)
50e17c000c467f Deepa Dinamani 2018-01-21  2472  		t.tv_nsec -=3D t.tv_nsec =
% gran;
50e17c000c467f Deepa Dinamani 2018-01-21  2473  	else
50e17c000c467f Deepa Dinamani 2018-01-21  2474  		WARN(1, "invalid file tim=
e granularity: %u", gran);
50e17c000c467f Deepa Dinamani 2018-01-21  2475  	return t;
50e17c000c467f Deepa Dinamani 2018-01-21  2476  }
50e17c000c467f Deepa Dinamani 2018-01-21  2477  EXPORT_SYMBOL(timestamp_tru=
ncate);
50e17c000c467f Deepa Dinamani 2018-01-21  2478 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
