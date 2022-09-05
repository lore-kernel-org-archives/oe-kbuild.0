Content-Type: multipart/mixed; boundary="===============8420935305339259329=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/ingenic/ingenic-drm-drv.c:697:11: warning: Signed integer overflow for expression '0xff<<24'. [integerOverflow]
Date: Tue, 06 Sep 2022 01:33:12 +0800
Message-ID: <202209060103.YPvoskqc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8420935305339259329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/ingenic/ingenic-drm-drv.c:697:11: warning: Signed integer overflow f=
or expression '0xff<<24'. [integerOverflow]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paul Boddie <paul@boddie.org.uk>
CC: Paul Cercueil <paul@crapouillou.net>
CC: Ezequiel Garcia <ezequiel@collabora.com>
CC: "H. Nikolaus Schaller" <hns@goldelico.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e18e42e4b280c85b76967a9106a13ca61c16179
commit: b807fd2c43fe008eb6f4083e196ea38dadad9680 drm/ingenic: Add support f=
or JZ4780 and HDMI output
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b807fd2c43fe008eb6f4083e196ea38dadad9680
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:523:70: warning: Parameter 'pl=
ane' can be declared with const [constParameter]
   void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *pla=
ne)
                                                                        ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:509:28: warning: Parameter 'pl=
ane' can be declared with const [constParameter]
            struct drm_plane *plane)
                              ^
   drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1368:49: warning: Parameter 'd=
ata' can be declared with const [constParameter]
   static int compare_of(struct device *dev, void *data)
                                                   ^
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:697:11: warning: Signed intege=
r overflow for expression '0xff<<24'. [integerOverflow]
       (0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
             ^

vim +697 drivers/gpu/drm/ingenic/ingenic-drm-drv.c

686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  641  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019=
-06-03  642  static void ingenic_drm_plane_atomic_update(struct drm_plane *=
plane,
977697e20b3d75 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021=
-02-19  643  					    struct drm_atomic_state *state)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019=
-06-03  644  {
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-07-16  645  	struct ingenic_drm *priv =3D drm_device_get_priv(plane->dev);
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-05-23  646  	struct drm_plane_state *newstate =3D drm_atomic_get_new_plane=
_state(state, plane);
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-05-23  647  	struct drm_plane_state *oldstate =3D drm_atomic_get_old_plane=
_state(state, plane);
1bdb542da736e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-10-26  648  	unsigned int width, height, cpp, next_id, plane_id;
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-10-26  649  	struct ingenic_drm_private_state *priv_state;
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  650  	struct drm_crtc_state *crtc_state;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-07-16  651  	struct ingenic_dma_hwdesc *hwdesc;
354b051c5dcbeb drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019=
-12-10  652  	dma_addr_t addr;
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  653  	u32 fourcc;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019=
-06-03  654  =

41016fe1028e4b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021=
-02-19  655  	if (newstate && newstate->fb) {
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-05-23  656  		if (priv->soc_info->map_noncoherent)
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-05-23  657  			drm_fb_cma_sync_non_coherent(&priv->drm, oldstate, newstate=
);
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-05-23  658  =

41016fe1028e4b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021=
-02-19  659  		crtc_state =3D newstate->crtc->state;
1bdb542da736e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-10-26  660  		plane_id =3D !!(priv->soc_info->has_osd && plane !=3D &priv-=
>f0);
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  661  =

41016fe1028e4b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021=
-02-19  662  		addr =3D drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
41016fe1028e4b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021=
-02-19  663  		width =3D newstate->src_w >> 16;
41016fe1028e4b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021=
-02-19  664  		height =3D newstate->src_h >> 16;
41016fe1028e4b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021=
-02-19  665  		cpp =3D newstate->fb->format->cpp[0];
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019=
-06-03  666  =

6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-10-26  667  		priv_state =3D ingenic_drm_get_new_priv_state(priv, state);
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-10-26  668  		next_id =3D (priv_state && priv_state->use_palette) ? HWDESC=
_PALETTE : plane_id;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-07-16  669  =

6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-10-26  670  		hwdesc =3D &priv->dma_hwdescs->hwdesc[plane_id];
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-07-16  671  		hwdesc->addr =3D addr;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-07-16  672  		hwdesc->cmd =3D JZ_LCD_CMD_EOF_IRQ | (width * height * cpp /=
 4);
6055466203df46 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2021=
-10-26  673  		hwdesc->next =3D dma_hwdesc_addr(priv, next_id);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-07-16  674  =

b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  675  		if (priv->soc_info->use_extended_hwdesc) {
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  676  			hwdesc->cmd |=3D JZ_LCD_CMD_FRM_ENABLE;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  677  =

b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  678  			/* Extended 8-byte descriptor */
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  679  			hwdesc->cpos =3D 0;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  680  			hwdesc->offsize =3D 0;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  681  			hwdesc->pagewidth =3D 0;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  682  =

b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  683  			switch (newstate->fb->format->format) {
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  684  			case DRM_FORMAT_XRGB1555:
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  685  				hwdesc->cpos |=3D JZ_LCD_CPOS_RGB555;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  686  				fallthrough;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  687  			case DRM_FORMAT_RGB565:
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  688  				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_15_16;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  689  				break;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  690  			case DRM_FORMAT_XRGB8888:
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  691  				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_18_24;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  692  				break;
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  693  			}
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  694  			hwdesc->cpos |=3D (JZ_LCD_CPOS_COEFFICIENT_1 <<
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  695  					 JZ_LCD_CPOS_COEFFICIENT_OFFSET);
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  696  			hwdesc->dessize =3D
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02 @697  				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  698  				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK, height - 1) |
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  699  				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK, width - 1);
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  700  		}
b807fd2c43fe00 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Boddie   2021=
-12-02  701  =

686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  702  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
41016fe1028e4b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Maxime Ripard 2021=
-02-19  703  			fourcc =3D newstate->fb->format->format;
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  704  =

686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  705  			ingenic_drm_plane_config(priv->dev, plane, fourcc);
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  706  =

686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  707  			crtc_state->color_mgmt_changed =3D fourcc =3D=3D DRM_FORMAT=
_C8;
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  708  		}
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  709  =

686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  710  		if (crtc_state->color_mgmt_changed)
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil 2020=
-09-27  711  			ingenic_drm_update_palette(priv, crtc_state->gamma_lut->dat=
a);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019=
-06-03  712  	}
354b051c5dcbeb drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019=
-12-10  713  }
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil 2019=
-06-03  714  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8420935305339259329==--

