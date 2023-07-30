Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE25380
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Jul 2023 01:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690681157; x=1722217157;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KUDXXl59aFyQpUXF5UqTyUyU7Xj98AWSbSFlpNPq+qc=;
  b=dECebr/G3Si8Iv+0iWsTDvjusF+c2d9/a8sNzdDw0c6ozPsGsMpM49ga
   TBdZhkGk/feXoVOVjL+RfTAxBsklHuIGNx7ApDqzAItCl5y8tbbp9xgNZ
   aax++3PdfZAuVPaIAZTO5t4nTqz70w43oacZCYUpVxbtMR/5WgXaH1PXJ
   +TTScX6stzx+waBalrM4+TGf3t8E6o7Mtl64UBLfZypFHvqcQ24fWXTt2
   Eg81le18sARNvzH5+hE7DuNXXzS5tQcMa7lR6X6I604nL6/IDbWi+rlSq
   JyBpo0GhSYTF7Cay2k2CS9EQq4YLwbZQc3LSQx5wd9Gq6jDU+McoBXQM1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="366273848"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="366273848"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 18:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="731174003"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="731174003"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jul 2023 18:39:14 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPvOr-0004ND-31;
	Sun, 30 Jul 2023 01:39:13 +0000
Date: Sun, 30 Jul 2023 09:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307300918.oUVHSjyY-lkp@intel.com>
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
 sound/usb/mixer_scarlett.c:325:23: sparse: sparse: bad integer constant ex=
pression"
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
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-2=
0230728]
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
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r072-20230730 (https://download.01.org/0day-ci/a=
rchive/20230730/202307300918.oUVHSjyY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300918.o=
UVHSjyY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307300918.oUVHSjyY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/mixer_scarlett.c:325:23: sparse: sparse: bad integer constant =
expression
>> sound/usb/mixer_scarlett.c:325:23: sparse: sparse: static assertion fail=
ed: "clamp() low limit -128 greater than high limit (int)kctl->private_valu=
e"
   sound/usb/mixer_scarlett.c:420:15: sparse: sparse: bad integer constant =
expression
>> sound/usb/mixer_scarlett.c:420:15: sparse: sparse: static assertion fail=
ed: "clamp() low limit 0 greater than high limit opt->len-1"
--
>> drivers/thermal/qcom/tsens.c:708:19: sparse: sparse: bad integer constan=
t expression
>> drivers/thermal/qcom/tsens.c:708:19: sparse: sparse: static assertion fa=
iled: "clamp() low limit (typeof(high))(priv->feat->trip_min_temp) greater =
than high limit (typeof(high))(priv->feat->trip_max_temp)"
   drivers/thermal/qcom/tsens.c:709:19: sparse: sparse: bad integer constan=
t expression
>> drivers/thermal/qcom/tsens.c:709:19: sparse: sparse: static assertion fa=
iled: "clamp() low limit (typeof(low))(priv->feat->trip_min_temp) greater t=
han high limit (typeof(low))(priv->feat->trip_max_temp)"
--
>> net/netfilter/ipvs/ip_vs_conn.c:1497:15: sparse: sparse: bad integer con=
stant expression
>> net/netfilter/ipvs/ip_vs_conn.c:1497:15: sparse: sparse: static assertio=
n failed: "clamp() low limit min greater than high limit max_avail"
   net/netfilter/ipvs/ip_vs_conn.c:1498:31: sparse: sparse: bad integer con=
stant expression
>> net/netfilter/ipvs/ip_vs_conn.c:1498:31: sparse: sparse: static assertio=
n failed: "clamp() low limit (typeof(ip_vs_conn_tab_bits))(min) greater tha=
n high limit (typeof(ip_vs_conn_tab_bits))(max)"
--
>> net/netfilter/ipvs/ip_vs_sync.c:1282:23: sparse: sparse: bad integer con=
stant expression
>> net/netfilter/ipvs/ip_vs_sync.c:1282:23: sparse: sparse: static assertio=
n failed: "clamp() low limit (int)((((2048 + ((((sizeof(struct sk_buff))) +=
 ((__typeof__((sizeof(struct sk_buff))))(((1 << 6))) - 1)) & ~((__typeof__(=
(sizeof(struct sk_buff))))(((1 << 6))) - 1))) * 2) + 1) / 2) greater than h=
igh limit (int)(({ do { __attribute__((__noreturn__)) extern void __compile=
time_assert_510(void) __attribute__((__error__("Unsupported access size for=
 {READ,WRITE}_ONCE()."))); if (!((sizeof(sysctl_wmem_max) =3D=3D sizeof(cha=
r) || sizeof(sysctl_wmem_max) =3D=3D sizeof(short) || sizeof(sysctl_wmem_ma=
x) =3D=3D sizeof(int) || sizeof(sysctl_wmem_max) =3D=3D sizeof(long)) || si=
zeof(sysctl_wmem_max) =3D=3D sizeof(long long))) __compiletime_assert_510()=
; } while (0); (*(const volatile typeof( _Generic((sysctl_wmem_max), char: =
(char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsi=
gned short: (unsigned short)0, signed short: (signed short)0, unsigned int:=
 (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)=
0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, =
signed long long: (signed long long)0, default: (sysctl_wmem_max))) *)&(sys=
ctl_wmem_max)); }))"
   net/netfilter/ipvs/ip_vs_sync.c:1287:23: sparse: sparse: bad integer con=
stant expression
>> net/netfilter/ipvs/ip_vs_sync.c:1287:23: sparse: sparse: static assertio=
n failed: "clamp() low limit (int)(((2048 + ((((sizeof(struct sk_buff))) + =
((__typeof__((sizeof(struct sk_buff))))(((1 << 6))) - 1)) & ~((__typeof__((=
sizeof(struct sk_buff))))(((1 << 6))) - 1))) + 1) / 2) greater than high li=
mit (int)(({ do { __attribute__((__noreturn__)) extern void __compiletime_a=
ssert_514(void) __attribute__((__error__("Unsupported access size for {READ=
,WRITE}_ONCE()."))); if (!((sizeof(sysctl_rmem_max) =3D=3D sizeof(char) || =
sizeof(sysctl_rmem_max) =3D=3D sizeof(short) || sizeof(sysctl_rmem_max) =3D=
=3D sizeof(int) || sizeof(sysctl_rmem_max) =3D=3D sizeof(long)) || sizeof(s=
ysctl_rmem_max) =3D=3D sizeof(long long))) __compiletime_assert_514(); } wh=
ile (0); (*(const volatile typeof( _Generic((sysctl_rmem_max), char: (char)=
0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned s=
hort: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsi=
gned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, sig=
ned long: (signed long)0, unsigned long long: (unsigned long long)0, signed=
 long long: (signed long long)0, default: (sysctl_rmem_max))) *)&(sysctl_rm=
em_max)); }))"
   net/netfilter/ipvs/ip_vs_sync.c:1806:34: sparse: sparse: bad integer con=
stant expression
>> net/netfilter/ipvs/ip_vs_sync.c:1806:34: sparse: sparse: static assertio=
n failed: "clamp() low limit (unsigned int)(min_mtu) greater than high limi=
t (unsigned int)(65535 - hlen)"
   /bin/bash: line 1: 21870 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__sparc__ -D__sparc_v9__ -=
D__arch64__ --arch=3Dsparc64 -mbig-endian -m64 -Wp,-MMD,net/netfilter/ipvs/=
=2Eip_vs_sync.o.d -nostdinc -Iarch/sparc/include -I./arch/sparc/include/gen=
erated -Iinclude -I./include -Iarch/sparc/include/uapi -I./arch/sparc/inclu=
de/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include includ=
e/linux/compiler-version.h -include include/linux/kconfig.h -include includ=
e/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=3D=3D -Wundef -DKB=
UILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fn=
o-PIE -fno-strict-aliasing -Wall -Wundef -Werror=3Dimplicit-function-declar=
ation -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototy=
pes -Wno-format-security -Wno-trigraphs -m64 -pipe -mno-fpu -mcpu=3Dultrasp=
arc -mcmodel=3Dmedlow -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compar=
e -Wa,--undeclared-regs -mtune=3Dultrasparc3 -fno-delete-null-pointer-check=
s -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addre=
ss-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=3D2=
048 -fno-stack-protector -Wno-main -Wno-unused-but-set-variable -Wno-unused=
-const-variable -Wno-dangling-pointer -fomit-frame-pointer -ftrivial-auto-v=
ar-init=3Dpattern -fno-stack-clash-protection -fno-inline-functions-called-=
once -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation =
-Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-array-bo=
unds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D5 -fno-strict-ove=
rflow -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincom=
patible-pointer-types -Werror=3Ddesignated-init -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -Wno=
-type-limits -Wno-shift-negative-value -I net/netfilter/ipvs -I ./net/netfi=
lter/ipvs -DKBUILD_MODFILE=3D'"net/netfilter/ipvs/ip_vs"' -DKBUILD_BASENAME=
=3D'"ip_vs_sync"' -DKBUILD_MODNAME=3D'"ip_vs"' -D__KBUILD_MODNAME=3Dkmod_ip=
_vs net/netfilter/ipvs/ip_vs_sync.c

vim +325 sound/usb/mixer_scarlett.c

76b188c4b37087 Chris J Arges 2014-11-12  313 =20
76b188c4b37087 Chris J Arges 2014-11-12  314  static int scarlett_ctl_get(s=
truct snd_kcontrol *kctl,
76b188c4b37087 Chris J Arges 2014-11-12  315  			    struct snd_ctl_elem_va=
lue *ucontrol)
76b188c4b37087 Chris J Arges 2014-11-12  316  {
76b188c4b37087 Chris J Arges 2014-11-12  317  	struct usb_mixer_elem_info *=
elem =3D kctl->private_data;
76b188c4b37087 Chris J Arges 2014-11-12  318  	int i, err, val;
76b188c4b37087 Chris J Arges 2014-11-12  319 =20
76b188c4b37087 Chris J Arges 2014-11-12  320  	for (i =3D 0; i < elem->chan=
nels; i++) {
76b188c4b37087 Chris J Arges 2014-11-12  321  		err =3D snd_usb_get_cur_mix=
_value(elem, i, i, &val);
76b188c4b37087 Chris J Arges 2014-11-12  322  		if (err < 0)
76b188c4b37087 Chris J Arges 2014-11-12  323  			return err;
76b188c4b37087 Chris J Arges 2014-11-12  324 =20
76b188c4b37087 Chris J Arges 2014-11-12 @325  		val =3D clamp(val / 256, -1=
28, (int)kctl->private_value) +
76b188c4b37087 Chris J Arges 2014-11-12  326  				    SND_SCARLETT_LEVEL_BI=
AS;
76b188c4b37087 Chris J Arges 2014-11-12  327  		ucontrol->value.integer.val=
ue[i] =3D val;
76b188c4b37087 Chris J Arges 2014-11-12  328  	}
76b188c4b37087 Chris J Arges 2014-11-12  329 =20
76b188c4b37087 Chris J Arges 2014-11-12  330  	return 0;
76b188c4b37087 Chris J Arges 2014-11-12  331  }
76b188c4b37087 Chris J Arges 2014-11-12  332 =20
76b188c4b37087 Chris J Arges 2014-11-12  333  static int scarlett_ctl_put(s=
truct snd_kcontrol *kctl,
76b188c4b37087 Chris J Arges 2014-11-12  334  			    struct snd_ctl_elem_va=
lue *ucontrol)
76b188c4b37087 Chris J Arges 2014-11-12  335  {
76b188c4b37087 Chris J Arges 2014-11-12  336  	struct usb_mixer_elem_info *=
elem =3D kctl->private_data;
76b188c4b37087 Chris J Arges 2014-11-12  337  	int i, changed =3D 0;
76b188c4b37087 Chris J Arges 2014-11-12  338  	int err, oval, val;
76b188c4b37087 Chris J Arges 2014-11-12  339 =20
76b188c4b37087 Chris J Arges 2014-11-12  340  	for (i =3D 0; i < elem->chan=
nels; i++) {
76b188c4b37087 Chris J Arges 2014-11-12  341  		err =3D snd_usb_get_cur_mix=
_value(elem, i, i, &oval);
76b188c4b37087 Chris J Arges 2014-11-12  342  		if (err < 0)
76b188c4b37087 Chris J Arges 2014-11-12  343  			return err;
76b188c4b37087 Chris J Arges 2014-11-12  344 =20
76b188c4b37087 Chris J Arges 2014-11-12  345  		val =3D ucontrol->value.int=
eger.value[i] -
76b188c4b37087 Chris J Arges 2014-11-12  346  			SND_SCARLETT_LEVEL_BIAS;
76b188c4b37087 Chris J Arges 2014-11-12  347  		val =3D val * 256;
76b188c4b37087 Chris J Arges 2014-11-12  348  		if (oval !=3D val) {
76b188c4b37087 Chris J Arges 2014-11-12  349  			err =3D snd_usb_set_cur_mi=
x_value(elem, i, i, val);
76b188c4b37087 Chris J Arges 2014-11-12  350  			if (err < 0)
76b188c4b37087 Chris J Arges 2014-11-12  351  				return err;
76b188c4b37087 Chris J Arges 2014-11-12  352 =20
76b188c4b37087 Chris J Arges 2014-11-12  353  			changed =3D 1;
76b188c4b37087 Chris J Arges 2014-11-12  354  		}
76b188c4b37087 Chris J Arges 2014-11-12  355  	}
76b188c4b37087 Chris J Arges 2014-11-12  356 =20
76b188c4b37087 Chris J Arges 2014-11-12  357  	return changed;
76b188c4b37087 Chris J Arges 2014-11-12  358  }
76b188c4b37087 Chris J Arges 2014-11-12  359 =20
76b188c4b37087 Chris J Arges 2014-11-12  360  static void scarlett_generate=
_name(int i, char *dst, int offsets[])
76b188c4b37087 Chris J Arges 2014-11-12  361  {
76b188c4b37087 Chris J Arges 2014-11-12  362  	if (i > offsets[SCARLETT_OFF=
SET_MIX])
76b188c4b37087 Chris J Arges 2014-11-12  363  		sprintf(dst, "Mix %c",
76b188c4b37087 Chris J Arges 2014-11-12  364  			'A'+(i - offsets[SCARLETT_=
OFFSET_MIX] - 1));
76b188c4b37087 Chris J Arges 2014-11-12  365  	else if (i > offsets[SCARLET=
T_OFFSET_ADAT])
76b188c4b37087 Chris J Arges 2014-11-12  366  		sprintf(dst, "ADAT %d", i -=
 offsets[SCARLETT_OFFSET_ADAT]);
76b188c4b37087 Chris J Arges 2014-11-12  367  	else if (i > offsets[SCARLET=
T_OFFSET_SPDIF])
76b188c4b37087 Chris J Arges 2014-11-12  368  		sprintf(dst, "SPDIF %d", i =
- offsets[SCARLETT_OFFSET_SPDIF]);
76b188c4b37087 Chris J Arges 2014-11-12  369  	else if (i > offsets[SCARLET=
T_OFFSET_ANALOG])
76b188c4b37087 Chris J Arges 2014-11-12  370  		sprintf(dst, "Analog %d", i=
 - offsets[SCARLETT_OFFSET_ANALOG]);
76b188c4b37087 Chris J Arges 2014-11-12  371  	else if (i > offsets[SCARLET=
T_OFFSET_PCM])
76b188c4b37087 Chris J Arges 2014-11-12  372  		sprintf(dst, "PCM %d", i - =
offsets[SCARLETT_OFFSET_PCM]);
76b188c4b37087 Chris J Arges 2014-11-12  373  	else
76b188c4b37087 Chris J Arges 2014-11-12  374  		sprintf(dst, "Off");
76b188c4b37087 Chris J Arges 2014-11-12  375  }
76b188c4b37087 Chris J Arges 2014-11-12  376 =20
76b188c4b37087 Chris J Arges 2014-11-12  377  static int scarlett_ctl_enum_=
dynamic_info(struct snd_kcontrol *kctl,
76b188c4b37087 Chris J Arges 2014-11-12  378  					  struct snd_ctl_elem_in=
fo *uinfo)
76b188c4b37087 Chris J Arges 2014-11-12  379  {
76b188c4b37087 Chris J Arges 2014-11-12  380  	struct usb_mixer_elem_info *=
elem =3D kctl->private_data;
76b188c4b37087 Chris J Arges 2014-11-12  381  	struct scarlett_mixer_elem_e=
num_info *opt =3D elem->private_data;
76b188c4b37087 Chris J Arges 2014-11-12  382  	unsigned int items =3D opt->=
len;
76b188c4b37087 Chris J Arges 2014-11-12  383 =20
76b188c4b37087 Chris J Arges 2014-11-12  384  	uinfo->type =3D SNDRV_CTL_EL=
EM_TYPE_ENUMERATED;
76b188c4b37087 Chris J Arges 2014-11-12  385  	uinfo->count =3D elem->chann=
els;
76b188c4b37087 Chris J Arges 2014-11-12  386  	uinfo->value.enumerated.item=
s =3D items;
76b188c4b37087 Chris J Arges 2014-11-12  387 =20
76b188c4b37087 Chris J Arges 2014-11-12  388  	if (uinfo->value.enumerated.=
item >=3D items)
76b188c4b37087 Chris J Arges 2014-11-12  389  		uinfo->value.enumerated.ite=
m =3D items - 1;
76b188c4b37087 Chris J Arges 2014-11-12  390 =20
76b188c4b37087 Chris J Arges 2014-11-12  391  	/* generate name dynamically=
 based on item number and offset info */
76b188c4b37087 Chris J Arges 2014-11-12  392  	scarlett_generate_name(uinfo=
->value.enumerated.item,
76b188c4b37087 Chris J Arges 2014-11-12  393  			       uinfo->value.enumer=
ated.name,
76b188c4b37087 Chris J Arges 2014-11-12  394  			       opt->offsets);
76b188c4b37087 Chris J Arges 2014-11-12  395 =20
76b188c4b37087 Chris J Arges 2014-11-12  396  	return 0;
76b188c4b37087 Chris J Arges 2014-11-12  397  }
76b188c4b37087 Chris J Arges 2014-11-12  398 =20
76b188c4b37087 Chris J Arges 2014-11-12  399  static int scarlett_ctl_enum_=
info(struct snd_kcontrol *kctl,
76b188c4b37087 Chris J Arges 2014-11-12  400  				  struct snd_ctl_elem_inf=
o *uinfo)
76b188c4b37087 Chris J Arges 2014-11-12  401  {
76b188c4b37087 Chris J Arges 2014-11-12  402  	struct usb_mixer_elem_info *=
elem =3D kctl->private_data;
76b188c4b37087 Chris J Arges 2014-11-12  403  	struct scarlett_mixer_elem_e=
num_info *opt =3D elem->private_data;
76b188c4b37087 Chris J Arges 2014-11-12  404 =20
76b188c4b37087 Chris J Arges 2014-11-12  405  	return snd_ctl_enum_info(uin=
fo, elem->channels, opt->len,
76b188c4b37087 Chris J Arges 2014-11-12  406  				 (const char * const *)op=
t->names);
76b188c4b37087 Chris J Arges 2014-11-12  407  }
76b188c4b37087 Chris J Arges 2014-11-12  408 =20
76b188c4b37087 Chris J Arges 2014-11-12  409  static int scarlett_ctl_enum_=
get(struct snd_kcontrol *kctl,
76b188c4b37087 Chris J Arges 2014-11-12  410  				 struct snd_ctl_elem_valu=
e *ucontrol)
76b188c4b37087 Chris J Arges 2014-11-12  411  {
76b188c4b37087 Chris J Arges 2014-11-12  412  	struct usb_mixer_elem_info *=
elem =3D kctl->private_data;
76b188c4b37087 Chris J Arges 2014-11-12  413  	struct scarlett_mixer_elem_e=
num_info *opt =3D elem->private_data;
76b188c4b37087 Chris J Arges 2014-11-12  414  	int err, val;
76b188c4b37087 Chris J Arges 2014-11-12  415 =20
76b188c4b37087 Chris J Arges 2014-11-12  416  	err =3D snd_usb_get_cur_mix_=
value(elem, 0, 0, &val);
76b188c4b37087 Chris J Arges 2014-11-12  417  	if (err < 0)
76b188c4b37087 Chris J Arges 2014-11-12  418  		return err;
76b188c4b37087 Chris J Arges 2014-11-12  419 =20
76b188c4b37087 Chris J Arges 2014-11-12 @420  	val =3D clamp(val - opt->sta=
rt, 0, opt->len-1);
76b188c4b37087 Chris J Arges 2014-11-12  421 =20
76b188c4b37087 Chris J Arges 2014-11-12  422  	ucontrol->value.enumerated.i=
tem[0] =3D val;
76b188c4b37087 Chris J Arges 2014-11-12  423 =20
76b188c4b37087 Chris J Arges 2014-11-12  424  	return 0;
76b188c4b37087 Chris J Arges 2014-11-12  425  }
76b188c4b37087 Chris J Arges 2014-11-12  426 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
