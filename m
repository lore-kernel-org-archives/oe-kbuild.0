Content-Type: multipart/mixed; boundary="===============8357341887027425439=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 2/8] media: uvcvideo: Add support for per-device control mapping overrides
Date: Thu, 30 Jun 2022 11:54:20 +0800
Message-ID: <202206301144.r7yv0yk2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8357341887027425439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220617103645.71560-3-ribalda@chromium.org>
References: <20220617103645.71560-3-ribalda@chromium.org>
TO: Ricardo Ribalda <ribalda@chromium.org>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: tfiga(a)chromium.org
TO: senozhatsky(a)chromium.org
TO: yunkec(a)google.com
CC: Ricardo Ribalda <ribalda@chromium.org>

Hi Ricardo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v5.19-rc4 next-20220629]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Ribalda/uvcv=
ideo-Fix-handling-of-power_line_frequency/20220617-185644
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: microblaze-randconfig-m031-20220629 (https://download.01.org/0day-c=
i/archive/20220630/202206301144.r7yv0yk2-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/usb/uvc/uvc_ctrl.c:2459 uvc_ctrl_init_ctrl() error: uninitial=
ized symbol 'mapping'.

vim +/mapping +2459 drivers/media/usb/uvc/uvc_ctrl.c

2bdd29cf3d4d32 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2008-12-=
06  2396  =

ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2397  /*
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2398   * Add control information and hardcoded stock control mappings t=
o the given
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2399   * device.
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2400   */
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2401  static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2402  			       struct uvc_control *ctrl)
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2403  {
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2404  	const struct uvc_control_info *info =3D uvc_ctrls;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2405  	const struct uvc_control_info *iend =3D info + ARRAY_SIZE(uvc_ct=
rls);
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2406  	const struct uvc_control_mapping *mapping;
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2407  	const struct uvc_control_mapping *mend;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2408  =

52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2409  	/* XU controls initialization requires querying the device for c=
ontrol
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2410  	 * information. As some buggy UVC devices will crash when queried
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2411  	 * repeatedly in a tight loop, delay XU controls initialization =
until
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2412  	 * first use.
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2413  	 */
52c58ad6f95ff6 drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2414  	if (UVC_ENTITY_TYPE(ctrl->entity) =3D=3D UVC_VC_EXTENSION_UNIT)
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2415  		return;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2416  =

ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2417  	for (; info < iend; ++info) {
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2418  		if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2419  		    ctrl->index =3D=3D info->index) {
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2420  			uvc_ctrl_add_info(chain->dev, ctrl, info);
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2421  			/*
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2422  			 * Retrieve control flags from the device. Ignore errors
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2423  			 * and work with default flag values from the uvc_ctrl
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2424  			 * array when the device doesn't properly implement
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2425  			 * GET_INFO on standard controls.
93df48d37c3f03 drivers/media/usb/uvc/uvc_ctrl.c   Hans de Goede    2020-07-=
28  2426  			 */
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2427  			uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2428  			break;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2429  		 }
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2430  	}
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2431  =

071c8bb827c80a drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2432  	if (!ctrl->initialized)
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2433  		return;
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2434  =

10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2435  	/*
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2436  	 * First check if the device provides a custom mapping for this =
control,
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2437  	 * used to override standard mappings for non-conformant devices=
. Don't
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2438  	 * process standard mappings if a custom mapping is found. This
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2439  	 * mechanism doesn't support combining standard and custom mappi=
ngs for
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2440  	 * a single control.
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2441  	 */
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2442  	if (chain->dev->info->mappings) {
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2443  		bool custom =3D false;
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2444  		unsigned int i;
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2445  =

10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2446  		for (i =3D 0; (mapping =3D chain->dev->info->mappings[i]); ++i)=
 {
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2447  			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2448  			    ctrl->info.selector =3D=3D mapping->selector) {
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2449  				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2450  				custom =3D true;
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2451  			}
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2452  		}
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2453  =

10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2454  		if (custom)
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2455  			return;
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2456  	}
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2457  =

10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2458  	/* Process common mappings next. */
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17 @2459  	mend =3D mapping + ARRAY_SIZE(uvc_ctrl_mappings);
10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2460  	for (mapping =3D uvc_ctrl_mappings; mapping < mend; ++mapping) {
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2461  		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2462  		    ctrl->info.selector =3D=3D mapping->selector)
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2463  			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2464  	}
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2465  =

10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2466  	/* Finally process version-specific mappings. */
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2467  	if (chain->dev->uvc_version < 0x0150) {
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2468  		mapping =3D uvc_ctrl_mappings_uvc11;
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2469  		mend =3D mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2470  	} else {
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2471  		mapping =3D uvc_ctrl_mappings_uvc15;
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2472  		mend =3D mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc15);
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2473  	}
87c205087585a0 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022-06-=
17  2474  =

ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2475  	for (; mapping < mend; ++mapping) {
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2476  		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
071c8bb827c80a drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
29  2477  		    ctrl->info.selector =3D=3D mapping->selector)
866c6bdd5663d4 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2021-06-=
18  2478  			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2479  	}
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2480  }
ba2fa99668bb9b drivers/media/video/uvc/uvc_ctrl.c Laurent Pinchart 2010-09-=
20  2481  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8357341887027425439==--

