Content-Type: multipart/mixed; boundary="===============4749315062802208057=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kbingham-rcar:kbingham/drm-misc/next/sn65dsi86/hpd 9/15] drivers/gpu/drm/bridge/ti-sn65dsi86.c:736:1: sparse: sparse: unused label 'err_conn_init'
Date: Fri, 11 Mar 2022 15:52:40 +0800
Message-ID: <202203111542.OMmVBGXd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4749315062802208057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git k=
bingham/drm-misc/next/sn65dsi86/hpd
head:   94aa000441bc3f2b262da3580845e490e1c31017
commit: d0c79c4748a2554386ec1ac3ea3dbaa317e0c273 [9/15] squash: drm/bridge:=
 ti-sn65dsi86: Add NO_CONNECTOR support
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: m68k-randconfig-s031-20220310 (https://download.01.org/0day-ci/arch=
ive/20220311/202203111542.OMmVBGXd-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git=
/commit/?id=3Dd0c79c4748a2554386ec1ac3ea3dbaa317e0c273
        git remote add kbingham-rcar https://git.kernel.org/pub/scm/linux/k=
ernel/git/kbingham/rcar.git
        git fetch --no-tags kbingham-rcar kbingham/drm-misc/next/sn65dsi86/=
hpd
        git checkout d0c79c4748a2554386ec1ac3ea3dbaa317e0c273
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
68k SHELL=3D/bin/bash drivers/gpu/drm/bridge/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:736:1: sparse: sparse: unused labe=
l 'err_conn_init'

vim +/err_conn_init +736 drivers/gpu/drm/bridge/ti-sn65dsi86.c

c3b75d4734cb82 Maxime Ripard    2021-10-25  695  =

c3b75d4734cb82 Maxime Ripard    2021-10-25  696  static int ti_sn_bridge_at=
tach(struct drm_bridge *bridge,
c3b75d4734cb82 Maxime Ripard    2021-10-25  697  			       enum drm_bridge_=
attach_flags flags)
c3b75d4734cb82 Maxime Ripard    2021-10-25  698  {
c3b75d4734cb82 Maxime Ripard    2021-10-25  699  	struct ti_sn65dsi86 *pdat=
a =3D bridge_to_ti_sn65dsi86(bridge);
c3b75d4734cb82 Maxime Ripard    2021-10-25  700  	int ret;
c3b75d4734cb82 Maxime Ripard    2021-10-25  701  =

c3b75d4734cb82 Maxime Ripard    2021-10-25  702  	pdata->aux.drm_dev =3D br=
idge->dev;
c3b75d4734cb82 Maxime Ripard    2021-10-25  703  	ret =3D drm_dp_aux_regist=
er(&pdata->aux);
c3b75d4734cb82 Maxime Ripard    2021-10-25  704  	if (ret < 0) {
c3b75d4734cb82 Maxime Ripard    2021-10-25  705  		drm_err(bridge->dev, "Fa=
iled to register DP AUX channel: %d\n", ret);
c3b75d4734cb82 Maxime Ripard    2021-10-25  706  		return ret;
c3b75d4734cb82 Maxime Ripard    2021-10-25  707  	}
c3b75d4734cb82 Maxime Ripard    2021-10-25  708  =

d0c79c4748a255 Kieran Bingham   2022-03-09  709  	/*
d0c79c4748a255 Kieran Bingham   2022-03-09  710  	 * Attach the next bridge=
 We never want the next bridge to *also* create
d0c79c4748a255 Kieran Bingham   2022-03-09  711  	 * a connector:
d0c79c4748a255 Kieran Bingham   2022-03-09  712  	 */
4e5763f03e105f Laurent Pinchart 2021-06-24  713  	ret =3D drm_bridge_attach=
(bridge->encoder, pdata->next_bridge,
d0c79c4748a255 Kieran Bingham   2022-03-09  714  				&pdata->bridge,
d0c79c4748a255 Kieran Bingham   2022-03-09  715  				flags | DRM_BRIDGE_ATT=
ACH_NO_CONNECTOR);
4e5763f03e105f Laurent Pinchart 2021-06-24  716  	if (ret < 0)
e283820cbf8092 Douglas Anderson 2022-02-04  717  		goto err_initted_aux;
e283820cbf8092 Douglas Anderson 2022-02-04  718  =

d0c79c4748a255 Kieran Bingham   2022-03-09  719  	if (flags & DRM_BRIDGE_AT=
TACH_NO_CONNECTOR)
d0c79c4748a255 Kieran Bingham   2022-03-09  720  		return 0;
d0c79c4748a255 Kieran Bingham   2022-03-09  721  =

e283820cbf8092 Douglas Anderson 2022-02-04  722  	pdata->connector =3D drm_=
bridge_connector_init(pdata->bridge.dev,
e283820cbf8092 Douglas Anderson 2022-02-04  723  						     pdata->bridge.e=
ncoder);
e283820cbf8092 Douglas Anderson 2022-02-04  724  	if (IS_ERR(pdata->connect=
or)) {
e283820cbf8092 Douglas Anderson 2022-02-04  725  		ret =3D PTR_ERR(pdata->c=
onnector);
e283820cbf8092 Douglas Anderson 2022-02-04  726  		goto err_initted_aux;
e283820cbf8092 Douglas Anderson 2022-02-04  727  	}
e283820cbf8092 Douglas Anderson 2022-02-04  728  =

e283820cbf8092 Douglas Anderson 2022-02-04  729  	drm_connector_attach_enco=
der(pdata->connector, pdata->bridge.encoder);
4e5763f03e105f Laurent Pinchart 2021-06-24  730  =

a095f15c00e278 Sandeep Panda    2018-07-20  731  	return 0;
a095f15c00e278 Sandeep Panda    2018-07-20  732  =

e283820cbf8092 Douglas Anderson 2022-02-04  733  err_initted_aux:
c2e21d20a45501 Rob Clark        2022-02-06  734  	if (!(flags & DRM_BRIDGE_=
ATTACH_NO_CONNECTOR))
d0c79c4748a255 Kieran Bingham   2022-03-09  735  		drm_connector_cleanup(pd=
ata->connector);
c2e21d20a45501 Rob Clark        2022-02-06 @736  err_conn_init:
61712618753032 Lyude Paul       2021-02-19  737  	drm_dp_aux_unregister(&pd=
ata->aux);
a095f15c00e278 Sandeep Panda    2018-07-20  738  	return ret;
a095f15c00e278 Sandeep Panda    2018-07-20  739  }
a095f15c00e278 Sandeep Panda    2018-07-20  740  =


:::::: The code at line 736 was first introduced by commit
:::::: c2e21d20a45501f593674d6b5fee0e874cf0dab8 drm/bridge: ti-sn65dsi86: A=
dd NO_CONNECTOR support

:::::: TO: Rob Clark <robdclark@chromium.org>
:::::: CC: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4749315062802208057==--

