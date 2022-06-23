Content-Type: multipart/mixed; boundary="===============5505510725950830041=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/mgag200/mgag200_pll.c:239:23: warning: Division by zero. [zerodiv]
Date: Thu, 23 Jun 2022 14:06:40 +0800
Message-ID: <202206231429.SeqzZatU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5505510725950830041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/mgag200/mgag200_pll.c:239:23: warning: Division by zero. [zerodiv]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   de5c208d533a46a074eb46ea17f672cc005a7269
commit: 2545ac960364d0395802a27374b46f13827b4cf5 drm/mgag200: Abstract pixe=
l PLL via struct mgag200_pll
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 2545ac960364d0395802a27374b46f13827b4cf5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:342:14: warning: Local var=
iable 'spti' shadows outer variable [shadowVariable]
      const u32 spti =3D pteb * sptn;
                ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:303:6: note: Shadowed decl=
aration
    u32 spti =3D ptei & (sptn - 1), lpti, pteb;
        ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:342:14: note: Shadow varia=
ble
      const u32 spti =3D pteb * sptn;
                ^
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:987:20: warning: Local var=
iable 'vma' shadows outer variable [shadowVariable]
     struct nvkm_vma *vma =3D rb_entry(node, typeof(*vma), tree);
                      ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:980:19: note: Shadowed dec=
laration
    struct nvkm_vma *vma;
                     ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:987:20: note: Shadow varia=
ble
     struct nvkm_vma *vma =3D rb_entry(node, typeof(*vma), tree);
                      ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/mgag200/mgag200_pll.c:239:23: warning: Division by zero.=
 [zerodiv]
    fvv =3D pllreffreq * n / m;
                         ^
   drivers/gpu/drm/mgag200/mgag200_pll.c:203:0: note: Assignment 'm=3D0', a=
ssigned value is 0
    m =3D n =3D p =3D s =3D 0;
   ^
   drivers/gpu/drm/mgag200/mgag200_pll.c:213:17: note: Assuming condition i=
s false
    for (i =3D 0 ; i < ARRAY_SIZE(pvalues_e4); i++) {
                   ^
   drivers/gpu/drm/mgag200/mgag200_pll.c:239:23: note: Division by zero
    fvv =3D pllreffreq * n / m;
                         ^
>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c:49:39: warning: Signed =
integer overflow for expression '128<<24'. [integerOverflow]
    nvkm_wo32(memory, offset + 0x0, (128 << 24) | (3 << 16) | 0x00000001);
                                         ^
--
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1082:13: warning: Local va=
riable 'size' shadows outer argument [shadowArgument]
     const u32 size =3D pd_header + desc->size * (1 << desc->bits);
               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1035:51: note: Shadowed de=
claration
          u32 pd_header, bool managed, u64 addr, u64 size,
                                                     ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1082:13: note: Shadow vari=
able
     const u32 size =3D pd_header + desc->size * (1 << desc->bits);
               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1240:7: warning: Local var=
iable 'size' shadows outer argument [shadowArgument]
     u64 size =3D limit - start;
         ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1210:64: note: Shadowed de=
claration
   nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64=
 *pfn)
                                                                  ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1240:7: note: Shadow varia=
ble
     u64 size =3D limit - start;
         ^
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1241:7: warning: Local var=
iable 'addr' shadows outer argument [shadowArgument]
     u64 addr =3D start;
         ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1210:54: note: Shadowed de=
claration
   nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64=
 *pfn)
                                                        ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:1241:7: note: Shadow varia=
ble
     u64 addr =3D start;
         ^

vim +239 drivers/gpu/drm/mgag200/mgag200_pll.c

2545ac960364d03 Thomas Zimmermann 2021-07-14  187  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  188  static int mgag200_pixpl=
l_compute_g200se_04(struct mgag200_pll *pixpll, long clock,
2545ac960364d03 Thomas Zimmermann 2021-07-14  189  					    struct mgag200_=
pll_values *pixpllc)
2545ac960364d03 Thomas Zimmermann 2021-07-14  190  {
2545ac960364d03 Thomas Zimmermann 2021-07-14  191  	static const unsigned i=
nt vcomax =3D 1600000;
2545ac960364d03 Thomas Zimmermann 2021-07-14  192  	static const unsigned i=
nt vcomin =3D 800000;
2545ac960364d03 Thomas Zimmermann 2021-07-14  193  	static const unsigned i=
nt pllreffreq =3D 25000;
2545ac960364d03 Thomas Zimmermann 2021-07-14  194  	static const unsigned i=
nt pvalues_e4[] =3D {16, 14, 12, 10, 8, 6, 4, 2, 1};
2545ac960364d03 Thomas Zimmermann 2021-07-14  195  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  196  	unsigned int delta, tmp=
delta, permitteddelta;
2545ac960364d03 Thomas Zimmermann 2021-07-14  197  	unsigned int testp, tes=
tm, testn;
2545ac960364d03 Thomas Zimmermann 2021-07-14  198  	unsigned int p, m, n, s;
2545ac960364d03 Thomas Zimmermann 2021-07-14  199  	unsigned int computed;
2545ac960364d03 Thomas Zimmermann 2021-07-14  200  	unsigned int fvv;
2545ac960364d03 Thomas Zimmermann 2021-07-14  201  	unsigned int i;
2545ac960364d03 Thomas Zimmermann 2021-07-14  202  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  203  	m =3D n =3D p =3D s =3D=
 0;
2545ac960364d03 Thomas Zimmermann 2021-07-14  204  	delta =3D 0xffffffff;
2545ac960364d03 Thomas Zimmermann 2021-07-14  205  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  206  	if (clock < 25000)
2545ac960364d03 Thomas Zimmermann 2021-07-14  207  		clock =3D 25000;
2545ac960364d03 Thomas Zimmermann 2021-07-14  208  	clock =3D clock * 2;
2545ac960364d03 Thomas Zimmermann 2021-07-14  209  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  210  	/* Permited delta is 0.=
5% as VESA Specification */
2545ac960364d03 Thomas Zimmermann 2021-07-14  211  	permitteddelta =3D cloc=
k * 5 / 1000;
2545ac960364d03 Thomas Zimmermann 2021-07-14  212  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  213  	for (i =3D 0 ; i < ARRA=
Y_SIZE(pvalues_e4); i++) {
2545ac960364d03 Thomas Zimmermann 2021-07-14  214  		testp =3D pvalues_e4[i=
];
2545ac960364d03 Thomas Zimmermann 2021-07-14  215  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  216  		if ((clock * testp) > =
vcomax)
2545ac960364d03 Thomas Zimmermann 2021-07-14  217  			continue;
2545ac960364d03 Thomas Zimmermann 2021-07-14  218  		if ((clock * testp) < =
vcomin)
2545ac960364d03 Thomas Zimmermann 2021-07-14  219  			continue;
2545ac960364d03 Thomas Zimmermann 2021-07-14  220  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  221  		for (testn =3D 50; tes=
tn <=3D 256; testn++) {
2545ac960364d03 Thomas Zimmermann 2021-07-14  222  			for (testm =3D 1; tes=
tm <=3D 32; testm++) {
2545ac960364d03 Thomas Zimmermann 2021-07-14  223  				computed =3D (pllref=
freq * testn) / (testm * testp);
2545ac960364d03 Thomas Zimmermann 2021-07-14  224  				if (computed > clock)
2545ac960364d03 Thomas Zimmermann 2021-07-14  225  					tmpdelta =3D comput=
ed - clock;
2545ac960364d03 Thomas Zimmermann 2021-07-14  226  				else
2545ac960364d03 Thomas Zimmermann 2021-07-14  227  					tmpdelta =3D clock =
- computed;
2545ac960364d03 Thomas Zimmermann 2021-07-14  228  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  229  				if (tmpdelta < delta=
) {
2545ac960364d03 Thomas Zimmermann 2021-07-14  230  					delta =3D tmpdelta;
2545ac960364d03 Thomas Zimmermann 2021-07-14  231  					m =3D testm;
2545ac960364d03 Thomas Zimmermann 2021-07-14  232  					n =3D testn;
2545ac960364d03 Thomas Zimmermann 2021-07-14  233  					p =3D testp;
2545ac960364d03 Thomas Zimmermann 2021-07-14  234  				}
2545ac960364d03 Thomas Zimmermann 2021-07-14  235  			}
2545ac960364d03 Thomas Zimmermann 2021-07-14  236  		}
2545ac960364d03 Thomas Zimmermann 2021-07-14  237  	}
2545ac960364d03 Thomas Zimmermann 2021-07-14  238  =

2545ac960364d03 Thomas Zimmermann 2021-07-14 @239  	fvv =3D pllreffreq * n =
/ m;
2545ac960364d03 Thomas Zimmermann 2021-07-14  240  	fvv =3D (fvv - 800000) =
/ 50000;
2545ac960364d03 Thomas Zimmermann 2021-07-14  241  	if (fvv > 15)
2545ac960364d03 Thomas Zimmermann 2021-07-14  242  		fvv =3D 15;
2545ac960364d03 Thomas Zimmermann 2021-07-14  243  	s =3D fvv << 1;
2545ac960364d03 Thomas Zimmermann 2021-07-14  244  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  245  	if (delta > permittedde=
lta) {
2545ac960364d03 Thomas Zimmermann 2021-07-14  246  		pr_warn("PLL delta too=
 large\n");
2545ac960364d03 Thomas Zimmermann 2021-07-14  247  		return -EINVAL;
2545ac960364d03 Thomas Zimmermann 2021-07-14  248  	}
2545ac960364d03 Thomas Zimmermann 2021-07-14  249  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  250  	pixpllc->m =3D m;
2545ac960364d03 Thomas Zimmermann 2021-07-14  251  	pixpllc->n =3D n;
2545ac960364d03 Thomas Zimmermann 2021-07-14  252  	pixpllc->p =3D p;
2545ac960364d03 Thomas Zimmermann 2021-07-14  253  	pixpllc->s =3D s;
2545ac960364d03 Thomas Zimmermann 2021-07-14  254  =

2545ac960364d03 Thomas Zimmermann 2021-07-14  255  	return 0;
2545ac960364d03 Thomas Zimmermann 2021-07-14  256  }
2545ac960364d03 Thomas Zimmermann 2021-07-14  257  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5505510725950830041==--

