Content-Type: multipart/mixed; boundary="===============6168249200623957883=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/radeon/radeon_agp.c:338 radeon_agp_init() warn: should 'rdev->agp->agp_info.aper_size << 20' be a 64 bit type?
Date: Sat, 12 Mar 2022 10:28:27 +0800
Message-ID: <202203121033.QdZktsc7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6168249200623957883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   68453767131a5deec1e8f9ac92a9042f929e585d
commit: 43359786a51e7fa7d89a45908de0ecee2d1dafa6 drm/radeon: Move AGP data =
structures into radeon
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: parisc-randconfig-m031-20220310 (https://download.01.org/0day-ci/ar=
chive/20220312/202203121033.QdZktsc7-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/radeon/radeon_agp.c:338 radeon_agp_init() warn: should 'rde=
v->agp->agp_info.aper_size << 20' be a 64 bit type?

vim +338 drivers/gpu/drm/radeon/radeon_agp.c

771fe6b912fca5 Jerome Glisse     2009-06-05  219  =

771fe6b912fca5 Jerome Glisse     2009-06-05  220  int radeon_agp_init(struc=
t radeon_device *rdev)
771fe6b912fca5 Jerome Glisse     2009-06-05  221  {
a7fb8a23c1afa6 Daniel Vetter     2015-09-09  222  #if IS_ENABLED(CONFIG_AGP)
771fe6b912fca5 Jerome Glisse     2009-06-05  223  	struct radeon_agpmode_qu=
irk *p =3D radeon_agpmode_quirk_list;
43359786a51e7f Thomas Zimmermann 2021-05-07  224  	struct radeon_agp_mode m=
ode;
43359786a51e7f Thomas Zimmermann 2021-05-07  225  	struct radeon_agp_info i=
nfo;
771fe6b912fca5 Jerome Glisse     2009-06-05  226  	uint32_t agp_status;
771fe6b912fca5 Jerome Glisse     2009-06-05  227  	int default_mode;
771fe6b912fca5 Jerome Glisse     2009-06-05  228  	bool is_v3;
771fe6b912fca5 Jerome Glisse     2009-06-05  229  	int ret;
771fe6b912fca5 Jerome Glisse     2009-06-05  230  =

771fe6b912fca5 Jerome Glisse     2009-06-05  231  	/* Acquire AGP. */
43359786a51e7f Thomas Zimmermann 2021-05-07  232  	ret =3D radeon_agp_head_=
acquire(rdev);
771fe6b912fca5 Jerome Glisse     2009-06-05  233  	if (ret) {
771fe6b912fca5 Jerome Glisse     2009-06-05  234  		DRM_ERROR("Unable to ac=
quire AGP: %d\n", ret);
771fe6b912fca5 Jerome Glisse     2009-06-05  235  		return ret;
771fe6b912fca5 Jerome Glisse     2009-06-05  236  	}
771fe6b912fca5 Jerome Glisse     2009-06-05  237  =

43359786a51e7f Thomas Zimmermann 2021-05-07  238  	ret =3D radeon_agp_head_=
info(rdev, &info);
771fe6b912fca5 Jerome Glisse     2009-06-05  239  	if (ret) {
43359786a51e7f Thomas Zimmermann 2021-05-07  240  		radeon_agp_head_release=
(rdev);
771fe6b912fca5 Jerome Glisse     2009-06-05  241  		DRM_ERROR("Unable to ge=
t AGP info: %d\n", ret);
771fe6b912fca5 Jerome Glisse     2009-06-05  242  		return ret;
771fe6b912fca5 Jerome Glisse     2009-06-05  243  	}
2dea2e29b9fad4 John Kacur        2010-01-31  244  =

43359786a51e7f Thomas Zimmermann 2021-05-07  245  	if (rdev->agp->agp_info.=
aper_size < 32) {
43359786a51e7f Thomas Zimmermann 2021-05-07  246  		radeon_agp_head_release=
(rdev);
2dea2e29b9fad4 John Kacur        2010-01-31  247  		dev_warn(rdev->dev, "AG=
P aperture too small (%zuM) "
2dea2e29b9fad4 John Kacur        2010-01-31  248  			"need at least 32M, di=
sabling AGP\n",
43359786a51e7f Thomas Zimmermann 2021-05-07  249  			rdev->agp->agp_info.ap=
er_size);
2dea2e29b9fad4 John Kacur        2010-01-31  250  		return -EINVAL;
2dea2e29b9fad4 John Kacur        2010-01-31  251  	}
2dea2e29b9fad4 John Kacur        2010-01-31  252  =

771fe6b912fca5 Jerome Glisse     2009-06-05  253  	mode.mode =3D info.mode;
e57415d85f72e3 Alex Deucher      2010-08-18  254  	/* chips with the agp to=
 pcie bridge don't have the AGP_STATUS register
e57415d85f72e3 Alex Deucher      2010-08-18  255  	 * Just use the whatever=
 mode the host sets up.
e57415d85f72e3 Alex Deucher      2010-08-18  256  	 */
e57415d85f72e3 Alex Deucher      2010-08-18  257  	if (rdev->family <=3D CH=
IP_RV350)
771fe6b912fca5 Jerome Glisse     2009-06-05  258  		agp_status =3D (RREG32(=
RADEON_AGP_STATUS) | RADEON_AGPv3_MODE) & mode.mode;
e57415d85f72e3 Alex Deucher      2010-08-18  259  	else
e57415d85f72e3 Alex Deucher      2010-08-18  260  		agp_status =3D mode.mod=
e;
771fe6b912fca5 Jerome Glisse     2009-06-05  261  	is_v3 =3D !!(agp_status =
& RADEON_AGPv3_MODE);
771fe6b912fca5 Jerome Glisse     2009-06-05  262  =

771fe6b912fca5 Jerome Glisse     2009-06-05  263  	if (is_v3) {
771fe6b912fca5 Jerome Glisse     2009-06-05  264  		default_mode =3D (agp_s=
tatus & RADEON_AGPv3_8X_MODE) ? 8 : 4;
771fe6b912fca5 Jerome Glisse     2009-06-05  265  	} else {
771fe6b912fca5 Jerome Glisse     2009-06-05  266  		if (agp_status & RADEON=
_AGP_4X_MODE) {
771fe6b912fca5 Jerome Glisse     2009-06-05  267  			default_mode =3D 4;
771fe6b912fca5 Jerome Glisse     2009-06-05  268  		} else if (agp_status &=
 RADEON_AGP_2X_MODE) {
771fe6b912fca5 Jerome Glisse     2009-06-05  269  			default_mode =3D 2;
771fe6b912fca5 Jerome Glisse     2009-06-05  270  		} else {
771fe6b912fca5 Jerome Glisse     2009-06-05  271  			default_mode =3D 1;
771fe6b912fca5 Jerome Glisse     2009-06-05  272  		}
771fe6b912fca5 Jerome Glisse     2009-06-05  273  	}
771fe6b912fca5 Jerome Glisse     2009-06-05  274  =

771fe6b912fca5 Jerome Glisse     2009-06-05  275  	/* Apply AGPMode Quirks =
*/
771fe6b912fca5 Jerome Glisse     2009-06-05  276  	while (p && p->chip_devi=
ce !=3D 0) {
771fe6b912fca5 Jerome Glisse     2009-06-05  277  		if (info.id_vendor =3D=
=3D p->hostbridge_vendor &&
771fe6b912fca5 Jerome Glisse     2009-06-05  278  		    info.id_device =3D=
=3D p->hostbridge_device &&
771fe6b912fca5 Jerome Glisse     2009-06-05  279  		    rdev->pdev->vendor =
=3D=3D p->chip_vendor &&
771fe6b912fca5 Jerome Glisse     2009-06-05  280  		    rdev->pdev->device =
=3D=3D p->chip_device &&
771fe6b912fca5 Jerome Glisse     2009-06-05  281  		    rdev->pdev->subsyst=
em_vendor =3D=3D p->subsys_vendor &&
771fe6b912fca5 Jerome Glisse     2009-06-05  282  		    rdev->pdev->subsyst=
em_device =3D=3D p->subsys_device) {
771fe6b912fca5 Jerome Glisse     2009-06-05  283  			default_mode =3D p->de=
fault_mode;
771fe6b912fca5 Jerome Glisse     2009-06-05  284  		}
771fe6b912fca5 Jerome Glisse     2009-06-05  285  		++p;
771fe6b912fca5 Jerome Glisse     2009-06-05  286  	}
771fe6b912fca5 Jerome Glisse     2009-06-05  287  =

771fe6b912fca5 Jerome Glisse     2009-06-05  288  	if (radeon_agpmode > 0) {
771fe6b912fca5 Jerome Glisse     2009-06-05  289  		if ((radeon_agpmode < (=
is_v3 ? 4 : 1)) ||
771fe6b912fca5 Jerome Glisse     2009-06-05  290  		    (radeon_agpmode > (=
is_v3 ? 8 : 4)) ||
771fe6b912fca5 Jerome Glisse     2009-06-05  291  		    (radeon_agpmode & (=
radeon_agpmode - 1))) {
771fe6b912fca5 Jerome Glisse     2009-06-05  292  			DRM_ERROR("Illegal AGP=
 Mode: %d (valid %s), leaving at %d\n",
771fe6b912fca5 Jerome Glisse     2009-06-05  293  				  radeon_agpmode, is_=
v3 ? "4, 8" : "1, 2, 4",
771fe6b912fca5 Jerome Glisse     2009-06-05  294  				  default_mode);
771fe6b912fca5 Jerome Glisse     2009-06-05  295  			radeon_agpmode =3D def=
ault_mode;
771fe6b912fca5 Jerome Glisse     2009-06-05  296  		} else {
771fe6b912fca5 Jerome Glisse     2009-06-05  297  			DRM_INFO("AGP mode req=
uested: %d\n", radeon_agpmode);
771fe6b912fca5 Jerome Glisse     2009-06-05  298  		}
771fe6b912fca5 Jerome Glisse     2009-06-05  299  	} else {
771fe6b912fca5 Jerome Glisse     2009-06-05  300  		radeon_agpmode =3D defa=
ult_mode;
771fe6b912fca5 Jerome Glisse     2009-06-05  301  	}
771fe6b912fca5 Jerome Glisse     2009-06-05  302  =

771fe6b912fca5 Jerome Glisse     2009-06-05  303  	mode.mode &=3D ~RADEON_A=
GP_MODE_MASK;
771fe6b912fca5 Jerome Glisse     2009-06-05  304  	if (is_v3) {
771fe6b912fca5 Jerome Glisse     2009-06-05  305  		switch (radeon_agpmode)=
 {
771fe6b912fca5 Jerome Glisse     2009-06-05  306  		case 8:
771fe6b912fca5 Jerome Glisse     2009-06-05  307  			mode.mode |=3D RADEON_=
AGPv3_8X_MODE;
771fe6b912fca5 Jerome Glisse     2009-06-05  308  			break;
771fe6b912fca5 Jerome Glisse     2009-06-05  309  		case 4:
771fe6b912fca5 Jerome Glisse     2009-06-05  310  		default:
771fe6b912fca5 Jerome Glisse     2009-06-05  311  			mode.mode |=3D RADEON_=
AGPv3_4X_MODE;
771fe6b912fca5 Jerome Glisse     2009-06-05  312  			break;
771fe6b912fca5 Jerome Glisse     2009-06-05  313  		}
771fe6b912fca5 Jerome Glisse     2009-06-05  314  	} else {
771fe6b912fca5 Jerome Glisse     2009-06-05  315  		switch (radeon_agpmode)=
 {
771fe6b912fca5 Jerome Glisse     2009-06-05  316  		case 4:
771fe6b912fca5 Jerome Glisse     2009-06-05  317  			mode.mode |=3D RADEON_=
AGP_4X_MODE;
771fe6b912fca5 Jerome Glisse     2009-06-05  318  			break;
771fe6b912fca5 Jerome Glisse     2009-06-05  319  		case 2:
771fe6b912fca5 Jerome Glisse     2009-06-05  320  			mode.mode |=3D RADEON_=
AGP_2X_MODE;
771fe6b912fca5 Jerome Glisse     2009-06-05  321  			break;
771fe6b912fca5 Jerome Glisse     2009-06-05  322  		case 1:
771fe6b912fca5 Jerome Glisse     2009-06-05  323  		default:
771fe6b912fca5 Jerome Glisse     2009-06-05  324  			mode.mode |=3D RADEON_=
AGP_1X_MODE;
771fe6b912fca5 Jerome Glisse     2009-06-05  325  			break;
771fe6b912fca5 Jerome Glisse     2009-06-05  326  		}
771fe6b912fca5 Jerome Glisse     2009-06-05  327  	}
771fe6b912fca5 Jerome Glisse     2009-06-05  328  =

771fe6b912fca5 Jerome Glisse     2009-06-05  329  	mode.mode &=3D ~RADEON_A=
GP_FW_MODE; /* disable fw */
43359786a51e7f Thomas Zimmermann 2021-05-07  330  	ret =3D radeon_agp_head_=
enable(rdev, mode);
771fe6b912fca5 Jerome Glisse     2009-06-05  331  	if (ret) {
771fe6b912fca5 Jerome Glisse     2009-06-05  332  		DRM_ERROR("Unable to en=
able AGP (mode =3D 0x%lx)\n", mode.mode);
43359786a51e7f Thomas Zimmermann 2021-05-07  333  		radeon_agp_head_release=
(rdev);
771fe6b912fca5 Jerome Glisse     2009-06-05  334  		return ret;
771fe6b912fca5 Jerome Glisse     2009-06-05  335  	}
771fe6b912fca5 Jerome Glisse     2009-06-05  336  =

43359786a51e7f Thomas Zimmermann 2021-05-07  337  	rdev->mc.agp_base =3D rd=
ev->agp->agp_info.aper_base;
43359786a51e7f Thomas Zimmermann 2021-05-07 @338  	rdev->mc.gtt_size =3D rd=
ev->agp->agp_info.aper_size << 20;
d594e46ace22af Jerome Glisse     2010-02-17  339  	rdev->mc.gtt_start =3D r=
dev->mc.agp_base;
d594e46ace22af Jerome Glisse     2010-02-17  340  	rdev->mc.gtt_end =3D rde=
v->mc.gtt_start + rdev->mc.gtt_size - 1;
d594e46ace22af Jerome Glisse     2010-02-17  341  	dev_info(rdev->dev, "GTT=
: %lluM 0x%08llX - 0x%08llX\n",
d594e46ace22af Jerome Glisse     2010-02-17  342  		rdev->mc.gtt_size >> 20=
, rdev->mc.gtt_start, rdev->mc.gtt_end);
771fe6b912fca5 Jerome Glisse     2009-06-05  343  =

771fe6b912fca5 Jerome Glisse     2009-06-05  344  	/* workaround some hw is=
sues */
771fe6b912fca5 Jerome Glisse     2009-06-05  345  	if (rdev->family < CHIP_=
R200) {
771fe6b912fca5 Jerome Glisse     2009-06-05  346  		WREG32(RADEON_AGP_CNTL,=
 RREG32(RADEON_AGP_CNTL) | 0x000e0000);
771fe6b912fca5 Jerome Glisse     2009-06-05  347  	}
771fe6b912fca5 Jerome Glisse     2009-06-05  348  	return 0;
771fe6b912fca5 Jerome Glisse     2009-06-05  349  #else
771fe6b912fca5 Jerome Glisse     2009-06-05  350  	return 0;
771fe6b912fca5 Jerome Glisse     2009-06-05  351  #endif
771fe6b912fca5 Jerome Glisse     2009-06-05  352  }
771fe6b912fca5 Jerome Glisse     2009-06-05  353  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6168249200623957883==--

