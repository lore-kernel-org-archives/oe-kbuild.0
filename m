Content-Type: multipart/mixed; boundary="===============1948432787188014498=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10040/12552] drivers/media/usb/uvc/uvc_ctrl.c:2472 uvc_ctrl_init_ctrl() error: we previously assumed 'mapping' could be null (see line 2458)
Date: Mon, 25 Jul 2022 16:58:21 +0000
Message-ID: <202207240824.md1EuAnG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1948432787188014498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ricardo Ribalda <ribalda@chromium.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18c107a1f120d095404d141dfad8f594bdc44020
commit: 86f7ef77315687df144042762325c53d9a3a28c9 [10040/12552] media: uvcvi=
deo: Add support for per-device control mapping overrides
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: xtensa-randconfig-m041-20220721 (https://download.01.org/0day-ci/ar=
chive/20220724/202207240824.md1EuAnG-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/usb/uvc/uvc_ctrl.c:2472 uvc_ctrl_init_ctrl() error: we previo=
usly assumed 'mapping' could be null (see line 2458)

vim +/mapping +2472 drivers/media/usb/uvc/uvc_ctrl.c

2bdd29cf3d4d32 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-12-=
06  2406  =

ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2407  /*
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2408   * Add control information and hardcoded stock control mappings t=
o the given
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2409   * device.
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2410   */
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2411  static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2412  			       struct uvc_control *ctrl)
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2413  {
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2414  	const struct uvc_control_info *info =3D uvc_ctrls;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2415  	const struct uvc_control_info *iend =3D info + ARRAY_SIZE(uvc_ct=
rls);
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2416  	const struct uvc_control_mapping *mapping =3D uvc_ctrl_mappings;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2417  	const struct uvc_control_mapping *mend =3D
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2418  		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2419  =

699b9a86a3f03a drivers/media/usb/uvc/uvc_ctrl.c   Laurent Pinchart 2022-06-=
08  2420  	/*
699b9a86a3f03a drivers/media/usb/uvc/uvc_ctrl.c   Laurent Pinchart 2022-06-=
08  2421  	 * XU controls initialization requires querying the device for c=
ontrol
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2422  	 * information. As some buggy UVC devices will crash when queried
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2423  	 * repeatedly in a tight loop, delay XU controls initialization =
until
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2424  	 * first use.
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2425  	 */
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2426  	if (UVC_ENTITY_TYPE(ctrl->entity) =3D=3D UVC_VC_EXTENSION_UNIT)
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2427  		return;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2428  =

ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2429  	for (; info < iend; ++info) {
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2430  		if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2431  		    ctrl->index =3D=3D info->index) {
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2432  			uvc_ctrl_add_info(chain->dev, ctrl, info);
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2433  			/*
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2434  			 * Retrieve control flags from the device. Ignore errors
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2435  			 * and work with default flag values from the uvc_ctrl
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2436  			 * array when the device doesn't properly implement
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2437  			 * GET_INFO on standard controls.
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2438  			 */
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2439  			uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2440  			break;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2441  		 }
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2442  	}
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2443  =

071c8bb827c80a drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2444  	if (!ctrl->initialized)
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2445  		return;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2446  =

86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2447  	/*
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2448  	 * First check if the device provides a custom mapping for this =
control,
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2449  	 * used to override standard mappings for non-conformant devices=
. Don't
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2450  	 * process standard mappings if a custom mapping is found. This
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2451  	 * mechanism doesn't support combining standard and custom mappi=
ngs for
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2452  	 * a single control.
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2453  	 */
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2454  	if (chain->dev->info->mappings) {
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2455  		bool custom =3D false;
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2456  		unsigned int i;
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2457  =

86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07 @2458  		for (i =3D 0; (mapping =3D chain->dev->info->mappings[i]); ++i)=
 {
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2459  			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2460  			    ctrl->info.selector =3D=3D mapping->selector) {
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2461  				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2462  				custom =3D true;
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2463  			}
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2464  		}
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2465  =

86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2466  		if (custom)
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2467  			return;
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2468  	}
86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2469  =

86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2470  	/* Process common mappings next. */
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2471  	for (; mapping < mend; ++mapping) {
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07 @2472  		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2473  		    ctrl->info.selector =3D=3D mapping->selector)
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2474  			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2475  	}
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2476  =

86f7ef77315687 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2477  	/* Finally process version-specific mappings. */
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2478  	if (chain->dev->uvc_version < 0x0150) {
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2479  		mapping =3D uvc_ctrl_mappings_uvc11;
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2480  		mend =3D mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2481  	} else {
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2482  		mapping =3D uvc_ctrl_mappings_uvc15;
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2483  		mend =3D mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc15);
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2484  	}
710871163510cd drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
07  2485  =

ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2486  	for (; mapping < mend; ++mapping) {
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2487  		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
071c8bb827c80a drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2488  		    ctrl->info.selector =3D=3D mapping->selector)
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2489  			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2490  	}
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2491  }
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2492  =


:::::: The code at line 2472 was first introduced by commit
:::::: 710871163510cd78948a095e929e28c1434b4506 media: uvcvideo: Add missin=
g value for power_line_frequency

:::::: TO: Ricardo Ribalda <ribalda@chromium.org>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1948432787188014498==--

