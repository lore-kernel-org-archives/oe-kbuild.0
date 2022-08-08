Content-Type: multipart/mixed; boundary="===============2080161366123209369=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/panel/panel-edp.c:673:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 08 Aug 2022 09:23:44 +0800
Message-ID: <202208080945.wMO5cgEu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2080161366123209369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/panel/panel-edp.c:673:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Douglas Anderson <dianders@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bc1bc0b59d04e997db25b84babf459ca1cd80b7
commit: 5540cf8f3e8dac7ef2de28edcf2623c1516fbe45 drm/panel-edp: Implement g=
eneric "edp-panel"s probed by EDID
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220807 (https://download.01.org/0day-ci/archi=
ve/20220808/202208080945.wMO5cgEu-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5540cf8f3e8dac7ef2de28edcf2623c1516fbe45
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5540cf8f3e8dac7ef2de28edcf2623c1516fbe45
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/panel/panel-edp.c: In function 'generic_edp_panel_probe':
>> drivers/gpu/drm/panel/panel-edp.c:673:13: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     673 |         u16 product_id;
         |             ^~~~~~~~~~
     'generic_edp_panel_probe': event 1
       |
       |  673 |         u16 product_id;
       |      |             ^~~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +673 drivers/gpu/drm/panel/panel-edp.c

5540cf8f3e8dac Douglas Anderson 2021-09-14  666  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  667  static int generic_edp_pan=
el_probe(struct device *dev, struct panel_edp *panel)
5540cf8f3e8dac Douglas Anderson 2021-09-14  668  {
5540cf8f3e8dac Douglas Anderson 2021-09-14  669  	const struct edp_panel_en=
try *edp_panel;
5540cf8f3e8dac Douglas Anderson 2021-09-14  670  	struct panel_desc *desc;
5540cf8f3e8dac Douglas Anderson 2021-09-14  671  	u32 panel_id;
5540cf8f3e8dac Douglas Anderson 2021-09-14  672  	char vend[4];
5540cf8f3e8dac Douglas Anderson 2021-09-14 @673  	u16 product_id;
5540cf8f3e8dac Douglas Anderson 2021-09-14  674  	u32 reliable_ms =3D 0;
5540cf8f3e8dac Douglas Anderson 2021-09-14  675  	u32 absent_ms =3D 0;
5540cf8f3e8dac Douglas Anderson 2021-09-14  676  	int ret;
5540cf8f3e8dac Douglas Anderson 2021-09-14  677  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  678  	desc =3D devm_kzalloc(dev=
, sizeof(*desc), GFP_KERNEL);
5540cf8f3e8dac Douglas Anderson 2021-09-14  679  	if (!desc)
5540cf8f3e8dac Douglas Anderson 2021-09-14  680  		return -ENOMEM;
5540cf8f3e8dac Douglas Anderson 2021-09-14  681  	panel->desc =3D desc;
5540cf8f3e8dac Douglas Anderson 2021-09-14  682  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  683  	/*
5540cf8f3e8dac Douglas Anderson 2021-09-14  684  	 * Read the dts propertie=
s for the initial probe. These are used by
5540cf8f3e8dac Douglas Anderson 2021-09-14  685  	 * the runtime resume cod=
e which will get called by the
5540cf8f3e8dac Douglas Anderson 2021-09-14  686  	 * pm_runtime_get_sync() =
call below.
5540cf8f3e8dac Douglas Anderson 2021-09-14  687  	 */
5540cf8f3e8dac Douglas Anderson 2021-09-14  688  	of_property_read_u32(dev-=
>of_node, "hpd-reliable-delay-ms", &reliable_ms);
5540cf8f3e8dac Douglas Anderson 2021-09-14  689  	desc->delay.hpd_reliable =
=3D reliable_ms;
5540cf8f3e8dac Douglas Anderson 2021-09-14  690  	of_property_read_u32(dev-=
>of_node, "hpd-absent-delay-ms", &absent_ms);
5540cf8f3e8dac Douglas Anderson 2021-09-14  691  	desc->delay.hpd_reliable =
=3D absent_ms;
5540cf8f3e8dac Douglas Anderson 2021-09-14  692  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  693  	/* Power the panel on so =
we can read the EDID */
5540cf8f3e8dac Douglas Anderson 2021-09-14  694  	ret =3D pm_runtime_get_sy=
nc(dev);
5540cf8f3e8dac Douglas Anderson 2021-09-14  695  	if (ret < 0) {
5540cf8f3e8dac Douglas Anderson 2021-09-14  696  		dev_err(dev, "Couldn't p=
ower on panel to read EDID: %d\n", ret);
5540cf8f3e8dac Douglas Anderson 2021-09-14  697  		goto exit;
5540cf8f3e8dac Douglas Anderson 2021-09-14  698  	}
5540cf8f3e8dac Douglas Anderson 2021-09-14  699  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  700  	panel_id =3D drm_edid_get=
_panel_id(panel->ddc);
5540cf8f3e8dac Douglas Anderson 2021-09-14  701  	if (!panel_id) {
5540cf8f3e8dac Douglas Anderson 2021-09-14  702  		dev_err(dev, "Couldn't i=
dentify panel via EDID\n");
5540cf8f3e8dac Douglas Anderson 2021-09-14  703  		ret =3D -EIO;
5540cf8f3e8dac Douglas Anderson 2021-09-14  704  		goto exit;
5540cf8f3e8dac Douglas Anderson 2021-09-14  705  	}
5540cf8f3e8dac Douglas Anderson 2021-09-14  706  	drm_edid_decode_panel_id(=
panel_id, vend, &product_id);
5540cf8f3e8dac Douglas Anderson 2021-09-14  707  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  708  	edp_panel =3D find_edp_pa=
nel(panel_id);
5540cf8f3e8dac Douglas Anderson 2021-09-14  709  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  710  	/*
5540cf8f3e8dac Douglas Anderson 2021-09-14  711  	 * We're using non-optimi=
zed timings and want it really obvious that
5540cf8f3e8dac Douglas Anderson 2021-09-14  712  	 * someone needs to add a=
n entry to the table, so we'll do a WARN_ON
5540cf8f3e8dac Douglas Anderson 2021-09-14  713  	 * splat.
5540cf8f3e8dac Douglas Anderson 2021-09-14  714  	 */
5540cf8f3e8dac Douglas Anderson 2021-09-14  715  	if (WARN_ON(!edp_panel)) {
5540cf8f3e8dac Douglas Anderson 2021-09-14  716  		dev_warn(dev,
5540cf8f3e8dac Douglas Anderson 2021-09-14  717  			 "Unknown panel %s %#06=
x, using conservative timings\n",
5540cf8f3e8dac Douglas Anderson 2021-09-14  718  			 vend, product_id);
5540cf8f3e8dac Douglas Anderson 2021-09-14  719  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  720  		/*
5540cf8f3e8dac Douglas Anderson 2021-09-14  721  		 * It's highly likely th=
at the panel will work if we use very
5540cf8f3e8dac Douglas Anderson 2021-09-14  722  		 * conservative timings,=
 so let's do that. We already know that
5540cf8f3e8dac Douglas Anderson 2021-09-14  723  		 * the HPD-related delay=
s must have worked since we got this
5540cf8f3e8dac Douglas Anderson 2021-09-14  724  		 * far, so we really jus=
t need the "unprepare" / "enable"
5540cf8f3e8dac Douglas Anderson 2021-09-14  725  		 * delays. We don't need=
 "prepare_to_enable" since that
5540cf8f3e8dac Douglas Anderson 2021-09-14  726  		 * overlaps the "enable"=
 delay anyway.
5540cf8f3e8dac Douglas Anderson 2021-09-14  727  		 *
5540cf8f3e8dac Douglas Anderson 2021-09-14  728  		 * Nearly all panels hav=
e a "unprepare" delay of 500 ms though
5540cf8f3e8dac Douglas Anderson 2021-09-14  729  		 * there are a few with =
1000. Let's stick 2000 in just to be
5540cf8f3e8dac Douglas Anderson 2021-09-14  730  		 * super conservative.
5540cf8f3e8dac Douglas Anderson 2021-09-14  731  		 *
5540cf8f3e8dac Douglas Anderson 2021-09-14  732  		 * An "enable" delay of =
80 ms seems the most common, but we'll
5540cf8f3e8dac Douglas Anderson 2021-09-14  733  		 * throw in 200 ms to be=
 safe.
5540cf8f3e8dac Douglas Anderson 2021-09-14  734  		 */
5540cf8f3e8dac Douglas Anderson 2021-09-14  735  		desc->delay.unprepare =
=3D 2000;
5540cf8f3e8dac Douglas Anderson 2021-09-14  736  		desc->delay.enable =3D 2=
00;
5540cf8f3e8dac Douglas Anderson 2021-09-14  737  	} else {
5540cf8f3e8dac Douglas Anderson 2021-09-14  738  		dev_info(dev, "Detected =
%s %s (%#06x)\n",
5540cf8f3e8dac Douglas Anderson 2021-09-14  739  			 vend, edp_panel->name,=
 product_id);
5540cf8f3e8dac Douglas Anderson 2021-09-14  740  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  741  		/* Update the delay; eve=
rything else comes from EDID */
5540cf8f3e8dac Douglas Anderson 2021-09-14  742  		desc->delay =3D *edp_pan=
el->delay;
5540cf8f3e8dac Douglas Anderson 2021-09-14  743  	}
5540cf8f3e8dac Douglas Anderson 2021-09-14  744  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  745  	ret =3D 0;
5540cf8f3e8dac Douglas Anderson 2021-09-14  746  exit:
5540cf8f3e8dac Douglas Anderson 2021-09-14  747  	pm_runtime_mark_last_busy=
(dev);
5540cf8f3e8dac Douglas Anderson 2021-09-14  748  	pm_runtime_put_autosuspen=
d(dev);
5540cf8f3e8dac Douglas Anderson 2021-09-14  749  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  750  	return ret;
5540cf8f3e8dac Douglas Anderson 2021-09-14  751  }
5540cf8f3e8dac Douglas Anderson 2021-09-14  752  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2080161366123209369==--

