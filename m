Content-Type: multipart/mixed; boundary="===============7445077866396528194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/ingenic/ingenic-drm-drv.c:431:70: warning: Parameter 'plane' can be declared with const [constParameter]
Date: Tue, 19 Apr 2022 12:32:55 +0800
Message-ID: <202204191219.aPh3PQ33-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7445077866396528194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 68b433fe6937cfa3f8975d18643d5956254edd6a drm/ingenic: Switch IPU pl=
ane to type OVERLAY
date:   11 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 11 months ago
compiler: riscv32-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 68b433fe6937cfa3f8975d18643d5956254edd6a
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:431:70: warning: Parameter 'pl=
ane' can be declared with const [constParameter]
   void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *pla=
ne)
                                                                        ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:417:28: warning: Parameter 'pl=
ane' can be declared with const [constParameter]
            struct drm_plane *plane)
                              ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1137:49: warning: Parameter 'd=
ata' can be declared with const [constParameter]
   static int compare_of(struct device *dev, void *data)
                                                   ^
--
>> drivers/gpu/drm/mcde/mcde_dsi.c:810:11: warning: Signed integer overflow=
 for expression '0x3fff<<18'. [integerOverflow]
     (0x3fff << DSI_MCTL_DPHY_TIMEOUT_LPRX_TO_VAL_SHIFT);
             ^

vim +/plane +431 drivers/gpu/drm/ingenic/ingenic-drm-drv.c

3c9bea4ef32bdcd Paul Cercueil 2020-07-16  430  =

fc1acf317b01083 Paul Cercueil 2020-07-16 @431  void ingenic_drm_plane_disab=
le(struct device *dev, struct drm_plane *plane)
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  432  {
fc1acf317b01083 Paul Cercueil 2020-07-16  433  	struct ingenic_drm *priv =
=3D dev_get_drvdata(dev);
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  434  	unsigned int en_bit;
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  435  =

3c9bea4ef32bdcd Paul Cercueil 2020-07-16  436  	if (priv->soc_info->has_osd=
) {
68b433fe6937cfa Paul Cercueil 2021-03-29  437  		if (plane !=3D &priv->f0)
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  438  			en_bit =3D JZ_LCD_OSDC_F1=
EN;
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  439  		else
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  440  			en_bit =3D JZ_LCD_OSDC_F0=
EN;
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  441  =

3c9bea4ef32bdcd Paul Cercueil 2020-07-16  442  		regmap_clear_bits(priv->ma=
p, JZ_REG_LCD_OSDC, en_bit);
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  443  	}
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  444  }
3c9bea4ef32bdcd Paul Cercueil 2020-07-16  445  =


:::::: The code at line 431 was first introduced by commit
:::::: fc1acf317b01083d47228c0d21cfc0764f37a04e drm/ingenic: Add support fo=
r the IPU

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Paul Cercueil <paul@crapouillou.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7445077866396528194==--

