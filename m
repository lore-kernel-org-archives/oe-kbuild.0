Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC86FA6
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690360723; x=1721896723;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HS0flijMuHQWkUC9NYHKnYmfrj1pJ2VqynF7SDNYY3Y=;
  b=Zsj2qhQH/AJh9M9oFzyI8nx42ysUXMovoFafvZFKBpT6NpXm1ah/MF3i
   fSlbt7DvGzVB6Yw07++DCCgoyjQWbH+LIOGonjq1NwMcpzxiSzIqsaU4g
   JzwLHQEuPzwvjnaqml9TN5ExA7zhn5u5HC/ybc6rKchgQleKrMTDuVgS5
   gqihapihhZlumcv4MxLCNf78hZYLDSDXoz3GEIFVb8sQPJiyM3LjPjktH
   Y+3eXjBGgjAsbn8pvPutzvdzbKur1dbVbKReiWq/w3HQbDm7RfSI0u919
   CUI7SkyxTxrz4ynU2a1nIQgKun0c4UO/YNLa2ALjO3aGnwn5OQSZJOdwK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431757262"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="431757262"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 01:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="816577838"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="816577838"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 01:38:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOa15-0000p5-1n;
	Wed, 26 Jul 2023 08:37:26 +0000
Date: Wed, 26 Jul 2023 16:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307261626.a8kcGs73-lkp@intel.com>
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
 drivers/clk/clk-axi-clkgen.c:161:32: sparse: sparse: bad integer constant =
expression"
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
[also build test WARNING on linus/master]
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
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-i063-20230725 (https://download.01.org/0day-ci/arch=
ive/20230726/202307261626.a8kcGs73-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261626.a=
8kcGs73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307261626.a8kcGs73-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/clk-axi-clkgen.c:161:32: sparse: sparse: bad integer constan=
t expression
>> drivers/clk/clk-axi-clkgen.c:161:32: sparse: sparse: static assertion fa=
iled: "clamp() low limit (unsigned long)(1) greater than high limit (unsign=
ed long)(128 << fract_shift)"
--
>> drivers/hwmon/dell-smm-hwmon.c:877:31: sparse: sparse: bad integer const=
ant expression
>> drivers/hwmon/dell-smm-hwmon.c:877:31: sparse: sparse: static assertion =
failed: "clamp() low limit (typeof(( { typeof(val) __x =3D val; typeof(data=
->i8k_pwm_mult) __d =3D data->i8k_pwm_mult; (((typeof(val))-1) > 0 || ((typ=
eof(data->i8k_pwm_mult))-1) > 0 || (((__x) > 0) =3D=3D ((__d) > 0))) ? (((_=
_x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } )))(0) gre=
ater than high limit (typeof(( { typeof(val) __x =3D val; typeof(data->i8k_=
pwm_mult) __d =3D data->i8k_pwm_mult; (((typeof(val))-1) > 0 || ((typeof(da=
ta->i8k_pwm_mult))-1) > 0 || (((__x) > 0) =3D=3D ((__d) > 0))) ? (((__x) + =
((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } )))(data->i8k_fa=
n_max)"
   /bin/bash: line 1: 77479 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,drivers/hwmon/.dell-smm-hwmon.o.d -nostdinc -Iar=
ch/x86/include -I./arch/x86/include/generated -Iinclude -I./include -Iarch/=
x86/include/uapi -I./arch/x86/include/generated/uapi -Iinclude/uapi -I./inc=
lude/generated/uapi -include include/linux/compiler-version.h -include incl=
ude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -f=
macro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wc=
har -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -Wall -Wundef=
 -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dr=
eturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs =
-mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=3Dnone -m32=
 -msoft-float -mregparm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-=
boundary=3D2 -march=3Di486 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreest=
anding -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=
=3Dthunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfu=
nction-return=3Dthunk-extern -fno-jump-tables -fno-delete-null-pointer-chec=
ks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addr=
ess-of-packed-member -Os -fno-allow-store-data-races -fno-reorder-blocks -f=
no-ipa-cp-clone -fno-partial-inlining -Wframe-larger-than=3D8192 -fno-stack=
-protector -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variabl=
e -Wno-dangling-pointer -fno-omit-frame-pointer -fno-optimize-sibling-calls=
 -ftrivial-auto-var-init=3Dpattern -fno-stack-clash-protection -fzero-call-=
used-regs=3Dused-gpr -fno-inline-functions-called-once -falign-functions=3D=
16 -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -W=
no-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-array-boun=
ds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D5 -fno-strict-overf=
low -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompa=
tible-pointer-types -Werror=3Ddesignated-init -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -Wno-t=
ype-limits -Wno-shift-negative-value -g -gdwarf-4 -fno-var-tracking -femit-=
struct-debug-baseonly -DRANDSTRUCT -fplugin=3D./scripts/gcc-plugins/randomi=
ze_layout_plugin.so -fplugin-arg-randomize_layout_plugin-performance-mode -=
fplugin=3D./scripts/gcc-plugins/latent_entropy_plugin.so -DLATENT_ENTROPY_P=
LUGIN -fsanitize=3Dbounds-strict -fsanitize=3Dshift -fsanitize=3Dunreachabl=
e -I drivers/hwmon -I ./drivers/hwmon -DKBUILD_MODFILE=3D'"drivers/hwmon/de=
ll-smm-hwmon"' -DKBUILD_BASENAME=3D'"dell_smm_hwmon"' -DKBUILD_MODNAME=3D'"=
dell_smm_hwmon"' -D__KBUILD_MODNAME=3Dkmod_dell_smm_hwmon drivers/hwmon/del=
l-smm-hwmon.c
--
>> drivers/hwmon/lm95245.c:292:23: sparse: sparse: bad integer constant exp=
ression
>> drivers/hwmon/lm95245.c:292:23: sparse: sparse: static assertion failed:=
 "clamp() low limit (typeof(val / 1000))(0) greater than high limit (typeof=
(val / 1000))(channel ? 255 : 127)"
--
>> drivers/hwmon/tmp513.c:257:26: sparse: sparse: bad integer constant expr=
ession
>> drivers/hwmon/tmp513.c:257:26: sparse: sparse: static assertion failed: =
"clamp() low limit (typeof(val))(-max_val) greater than high limit (typeof(=
val))(max_val)"
   drivers/hwmon/tmp513.c:265:23: sparse: sparse: bad integer constant expr=
ession
>> drivers/hwmon/tmp513.c:265:23: sparse: sparse: static assertion failed: =
"clamp() low limit (typeof(( { typeof(val) __x =3D val; typeof(4) __d =3D 4=
; (((typeof(val))-1) > 0 || ((typeof(4))-1) > 0 || (((__x) > 0) =3D=3D ((__=
d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d=
)); } )))(0) greater than high limit (typeof(( { typeof(val) __x =3D val; t=
ypeof(4) __d =3D 4; (((typeof(val))-1) > 0 || ((typeof(4))-1) > 0 || (((__x=
) > 0) =3D=3D ((__d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - (=
(__d) / 2)) / (__d)); } )))(max_val)"
--
>> drivers/video/fbdev/s3fb.c:906:17: sparse: sparse: bad integer constant =
expression
>> drivers/video/fbdev/s3fb.c:906:17: sparse: sparse: static assertion fail=
ed: "clamp() low limit hsstart + 4 greater than high limit htotal + 1"
--
>> drivers/media/pci/zoran/zoran_card.c:807:47: sparse: sparse: bad integer=
 constant expression
>> drivers/media/pci/zoran/zoran_card.c:807:47: sparse: sparse: static asse=
rtion failed: "clamp() low limit 0 greater than high limit (int)(zr->timing=
->wa)"
   drivers/media/pci/zoran/zoran_card.c:811:48: sparse: sparse: bad integer=
 constant expression
>> drivers/media/pci/zoran/zoran_card.c:811:48: sparse: sparse: static asse=
rtion failed: "clamp() low limit 0 greater than high limit (zr->timing->ha)=
 / 2"

vim +161 drivers/clk/clk-axi-clkgen.c

0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  124 =20
ac1ee86a9cdb00 Alexandru Ardelean 2020-12-03  125  static void axi_clkgen_c=
alc_params(const struct axi_clkgen_limits *limits,
ac1ee86a9cdb00 Alexandru Ardelean 2020-12-03  126  	unsigned long fin, unsi=
gned long fout,
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  127  	unsigned int *best_d, u=
nsigned int *best_m, unsigned int *best_dout)
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  128  {
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  129  	unsigned long d, d_min,=
 d_max, _d_min, _d_max;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  130  	unsigned long m, m_min,=
 m_max;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  131  	unsigned long f, dout, =
best_f, fvco;
86378cf646d323 Lars-Peter Clausen 2020-10-01  132  	unsigned long fract_shi=
ft =3D 0;
86378cf646d323 Lars-Peter Clausen 2020-10-01  133  	unsigned long fvco_min_=
fract, fvco_max_fract;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  134 =20
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  135  	fin /=3D 1000;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  136  	fout /=3D 1000;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  137 =20
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  138  	best_f =3D ULONG_MAX;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  139  	*best_d =3D 0;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  140  	*best_m =3D 0;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  141  	*best_dout =3D 0;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  142 =20
ac1ee86a9cdb00 Alexandru Ardelean 2020-12-03  143  	d_min =3D max_t(unsigne=
d long, DIV_ROUND_UP(fin, limits->fpfd_max), 1);
ac1ee86a9cdb00 Alexandru Ardelean 2020-12-03  144  	d_max =3D min_t(unsigne=
d long, fin / limits->fpfd_min, 80);
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  145 =20
86378cf646d323 Lars-Peter Clausen 2020-10-01  146  again:
ac1ee86a9cdb00 Alexandru Ardelean 2020-12-03  147  	fvco_min_fract =3D limi=
ts->fvco_min << fract_shift;
ac1ee86a9cdb00 Alexandru Ardelean 2020-12-03  148  	fvco_max_fract =3D limi=
ts->fvco_max << fract_shift;
86378cf646d323 Lars-Peter Clausen 2020-10-01  149 =20
86378cf646d323 Lars-Peter Clausen 2020-10-01  150  	m_min =3D max_t(unsigne=
d long, DIV_ROUND_UP(fvco_min_fract, fin) * d_min, 1);
86378cf646d323 Lars-Peter Clausen 2020-10-01  151  	m_max =3D min_t(unsigne=
d long, fvco_max_fract * d_max / fin, 64 << fract_shift);
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  152 =20
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  153  	for (m =3D m_min; m <=
=3D m_max; m++) {
86378cf646d323 Lars-Peter Clausen 2020-10-01  154  		_d_min =3D max(d_min, =
DIV_ROUND_UP(fin * m, fvco_max_fract));
86378cf646d323 Lars-Peter Clausen 2020-10-01  155  		_d_max =3D min(d_max, =
fin * m / fvco_min_fract);
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  156 =20
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  157  		for (d =3D _d_min; d <=
=3D _d_max; d++) {
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  158  			fvco =3D fin * m / d;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  159 =20
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  160  			dout =3D DIV_ROUND_CL=
OSEST(fvco, fout);
86378cf646d323 Lars-Peter Clausen 2020-10-01 @161  			dout =3D clamp_t(unsi=
gned long, dout, 1, 128 << fract_shift);
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  162  			f =3D fvco / dout;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  163  			if (abs(f - fout) < a=
bs(best_f - fout)) {
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  164  				best_f =3D f;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  165  				*best_d =3D d;
86378cf646d323 Lars-Peter Clausen 2020-10-01  166  				*best_m =3D m << (3 =
- fract_shift);
86378cf646d323 Lars-Peter Clausen 2020-10-01  167  				*best_dout =3D dout =
<< (3 - fract_shift);
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  168  				if (best_f =3D=3D fo=
ut)
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  169  					return;
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  170  			}
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  171  		}
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  172  	}
86378cf646d323 Lars-Peter Clausen 2020-10-01  173 =20
86378cf646d323 Lars-Peter Clausen 2020-10-01  174  	/* Lets see if we find =
a better setting in fractional mode */
86378cf646d323 Lars-Peter Clausen 2020-10-01  175  	if (fract_shift =3D=3D =
0) {
86378cf646d323 Lars-Peter Clausen 2020-10-01  176  		fract_shift =3D 3;
86378cf646d323 Lars-Peter Clausen 2020-10-01  177  		goto again;
86378cf646d323 Lars-Peter Clausen 2020-10-01  178  	}
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  179  }
0e646c52cf0ee1 Lars-Peter Clausen 2013-03-11  180 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
