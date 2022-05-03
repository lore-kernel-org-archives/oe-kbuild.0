Content-Type: multipart/mixed; boundary="===============3300949904961489761=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/via/via-camera.c:1259:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 04 May 2022 05:55:27 +0800
Message-ID: <202205040517.9G08vceY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3300949904961489761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef8e4d3c2ab1f47f63b6c7e578266b7e5cc9cd1b
commit: 81acf39488cfe99319b0a25f2b9a0e2e3bb40b6d media: platform: place Via=
 drivers on a separate dir
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-c006-20220503 (https://download.01.org/0day-ci/arc=
hive/20220504/202205040517.9G08vceY-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a=
645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D81acf39488cfe99319b0a25f2b9a0e2e3bb40b6d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 81acf39488cfe99319b0a25f2b9a0e2e3bb40b6d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~
   drivers/md/dm-kcopyd.c:913:2: note: Taking false branch
           if (!kc)
           ^
   drivers/md/dm-kcopyd.c:916:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_init(&kc->job_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/md/dm-kcopyd.c:924:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/md/dm-kcopyd.c:924:2: note: Taking false branch
           if (r)
           ^
   drivers/md/dm-kcopyd.c:927:2: note: Loop condition is false.  Exiting lo=
op
           INIT_WORK(&kc->kcopyd_work, do_work);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/md/dm-kcopyd.c:929:6: note: Assuming field 'kcopyd_wq' is non-nu=
ll
           if (!kc->kcopyd_wq) {
               ^~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:929:2: note: Taking false branch
           if (!kc->kcopyd_wq) {
           ^
   drivers/md/dm-kcopyd.c:939:6: note: Calling 'client_reserve_pages'
           r =3D client_reserve_pages(kc, reserve_pages);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:309:20: note: 'pl' initialized to a null pointer =
value
           struct page_list *pl =3D NULL, *next;
                             ^~
   drivers/md/dm-kcopyd.c:311:14: note: Assuming 'i' is >=3D 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:311:2: note: Loop condition is false. Execution c=
ontinues on line 322
           for (i =3D 0; i < nr_pages; i++) {
           ^
   drivers/md/dm-kcopyd.c:323:23: note: Passing null pointer value via 2nd =
parameter 'pl'
           kcopyd_put_pages(kc, pl);
                                ^~
   drivers/md/dm-kcopyd.c:323:2: note: Calling 'kcopyd_put_pages'
           kcopyd_put_pages(kc, pl);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:246:10: note: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'pl')
                   next =3D pl->next;
                          ^~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   lib/842/842_compress.c:534:4: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           ret =3D add_repeat_template(p, repeat_count);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/842/842_compress.c:534:4: note: Value stored to 'ret' is never read
                           ret =3D add_repeat_template(p, repeat_count);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/platform/via/via-camera.c:1259:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D vb2_queue_init(vq);
           ^     ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/via/via-camera.c:1259:2: note: Value stored to 'r=
et' is never read
           ret =3D vb2_queue_init(vq);
           ^     ~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/power/supply/generic-adc-battery.c:288:4: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D PTR_ERR(adc_bat->channel[chan]);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/generic-adc-battery.c:288:4: note: Value stored to =
'ret' is never read
                           ret =3D PTR_ERR(adc_bat->channel[chan]);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/ret +1259 drivers/media/platform/via/via-camera.c

a39fbb1d747aa8 drivers/media/video/via-camera.c    Daniel Drake       2012-=
04-30  1136  =

4c62e9764ab403 drivers/media/platform/via-camera.c Greg Kroah-Hartman 2012-=
12-21  1137  static int viacam_probe(struct platform_device *pdev)
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1138  {
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1139  	int ret;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1140  	struct i2c_adapter *sensor_adapter;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1141  	struct viafb_dev *viadev =3D pdev->dev.platform_data;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1142  	struct vb2_queue *vq;
a39fbb1d747aa8 drivers/media/video/via-camera.c    Daniel Drake       2012-=
04-30  1143  	struct i2c_board_info ov7670_info =3D {
a39fbb1d747aa8 drivers/media/video/via-camera.c    Daniel Drake       2012-=
04-30  1144  		.type =3D "ov7670",
a39fbb1d747aa8 drivers/media/video/via-camera.c    Daniel Drake       2012-=
04-30  1145  		.addr =3D 0x42 >> 1,
a39fbb1d747aa8 drivers/media/video/via-camera.c    Daniel Drake       2012-=
04-30  1146  		.platform_data =3D &sensor_cfg,
a39fbb1d747aa8 drivers/media/video/via-camera.c    Daniel Drake       2012-=
04-30  1147  	};
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1148  =

024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1149  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1150  	 * Note that there are actually two capture channels on
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1151  	 * the device.	We only deal with one for now.	That
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1152  	 * is encoded here; nothing else assumes it's dealing with
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1153  	 * a unique capture device.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1154  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1155  	struct via_camera *cam;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1156  =

024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1157  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1158  	 * Ensure that frame buffer memory has been set aside for
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1159  	 * this purpose.  As an arbitrary limit, refuse to work
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1160  	 * with less than two frames of VGA 16-bit data.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1161  	 *
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1162  	 * If we ever support the second port, we'll need to set
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1163  	 * aside more memory.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1164  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1165  	if (viadev->camera_fbmem_size < (VGA_HEIGHT*VGA_WIDTH*4)) {
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1166  		printk(KERN_ERR "viacam: insufficient FB memory reserved\n");
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1167  		return -ENOMEM;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1168  	}
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1169  	if (viadev->engine_mmio =3D=3D NULL) {
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1170  		printk(KERN_ERR "viacam: No I/O memory, so no pictures\n");
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1171  		return -ENOMEM;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1172  	}
c6384c886dfed8 drivers/media/video/via-camera.c    Daniel Drake       2011-=
03-03  1173  =

c6384c886dfed8 drivers/media/video/via-camera.c    Daniel Drake       2011-=
03-03  1174  	if (machine_is_olpc() && viacam_serial_is_enabled())
c6384c886dfed8 drivers/media/video/via-camera.c    Daniel Drake       2011-=
03-03  1175  		return -EBUSY;
c6384c886dfed8 drivers/media/video/via-camera.c    Daniel Drake       2011-=
03-03  1176  =

024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1177  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1178  	 * Basic structure initialization.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1179  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1180  	cam =3D kzalloc (sizeof(struct via_camera), GFP_KERNEL);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1181  	if (cam =3D=3D NULL)
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1182  		return -ENOMEM;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1183  	via_cam_info =3D cam;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1184  	cam->platdev =3D pdev;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1185  	cam->viadev =3D viadev;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1186  	cam->opstate =3D S_IDLE;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1187  	cam->user_format =3D cam->sensor_format =3D viacam_def_pix_fo=
rmat;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1188  	mutex_init(&cam->lock);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1189  	INIT_LIST_HEAD(&cam->buffer_queue);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1190  	cam->mmio =3D viadev->engine_mmio;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1191  	cam->fbmem =3D viadev->fbmem;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1192  	cam->fb_offset =3D viadev->camera_fbmem_offset;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1193  	cam->flags =3D 1 << CF_CONFIG_NEEDED;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1194  	cam->mbus_code =3D via_def_mbus_code;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1195  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1196  	 * Tell V4L that we exist.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1197  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1198  	ret =3D v4l2_device_register(&pdev->dev, &cam->v4l2_dev);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1199  	if (ret) {
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1200  		dev_err(&pdev->dev, "Unable to register v4l2 device\n");
dbf8f4e5839869 drivers/media/platform/via-camera.c Javier Martin      2013-=
01-29  1201  		goto out_free;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1202  	}
dbf8f4e5839869 drivers/media/platform/via-camera.c Javier Martin      2013-=
01-29  1203  	ret =3D v4l2_ctrl_handler_init(&cam->ctrl_handler, 10);
dbf8f4e5839869 drivers/media/platform/via-camera.c Javier Martin      2013-=
01-29  1204  	if (ret)
dbf8f4e5839869 drivers/media/platform/via-camera.c Javier Martin      2013-=
01-29  1205  		goto out_unregister;
dbf8f4e5839869 drivers/media/platform/via-camera.c Javier Martin      2013-=
01-29  1206  	cam->v4l2_dev.ctrl_handler =3D &cam->ctrl_handler;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1207  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1208  	 * Convince the system that we can do DMA.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1209  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1210  	pdev->dev.dma_mask =3D &viadev->pdev->dma_mask;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1211  	dma_set_mask(&pdev->dev, 0xffffffff);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1212  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1213  	 * Fire up the capture port.  The write to 0x78 looks purely
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1214  	 * OLPCish; any system will need to tweak 0x1e.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1215  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1216  	via_write_reg_mask(VIASR, 0x78, 0, 0x80);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1217  	via_write_reg_mask(VIASR, 0x1e, 0xc0, 0xc0);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1218  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1219  	 * Get the sensor powered up.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1220  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1221  	ret =3D via_sensor_power_setup(cam);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1222  	if (ret)
dbf8f4e5839869 drivers/media/platform/via-camera.c Javier Martin      2013-=
01-29  1223  		goto out_ctrl_hdl_free;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1224  	via_sensor_power_up(cam);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1225  =

024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1226  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1227  	 * See if we can't find it on the bus.	The VIA_PORT_31 assump=
tion
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1228  	 * is OLPC-specific.  0x42 assumption is ov7670-specific.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1229  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1230  	sensor_adapter =3D viafb_find_i2c_adapter(VIA_PORT_31);
a39fbb1d747aa8 drivers/media/video/via-camera.c    Daniel Drake       2012-=
04-30  1231  	cam->sensor =3D v4l2_i2c_new_subdev_board(&cam->v4l2_dev, sen=
sor_adapter,
a39fbb1d747aa8 drivers/media/video/via-camera.c    Daniel Drake       2012-=
04-30  1232  			&ov7670_info, NULL);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1233  	if (cam->sensor =3D=3D NULL) {
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1234  		dev_err(&pdev->dev, "Unable to find the sensor!\n");
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1235  		ret =3D -ENODEV;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1236  		goto out_power_down;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1237  	}
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1238  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1239  	 * Get the IRQ.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1240  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1241  	viacam_int_disable(cam);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1242  	ret =3D request_threaded_irq(viadev->pdev->irq, viacam_quick_=
irq,
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1243  			viacam_irq, IRQF_SHARED, "via-camera", cam);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1244  	if (ret)
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1245  		goto out_power_down;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1246  =

4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1247  	vq =3D &cam->vq;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1248  	vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1249  	vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_RE=
AD;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1250  	vq->drv_priv =3D cam;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1251  	vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1252  	vq->buf_struct_size =3D sizeof(struct via_buffer);
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1253  	vq->dev =3D cam->v4l2_dev.dev;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1254  =

4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1255  	vq->ops =3D &viacam_vb2_ops;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1256  	vq->mem_ops =3D &vb2_dma_sg_memops;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1257  	vq->lock =3D &cam->lock;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1258  =

4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28 @1259  	ret =3D vb2_queue_init(vq);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1260  	/*
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1261  	 * Tell V4l2 that we exist.
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1262  	 */
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1263  	cam->vdev =3D viacam_v4l_template;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1264  	cam->vdev.v4l2_dev =3D &cam->v4l2_dev;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1265  	cam->vdev.lock =3D &cam->lock;
4590c07462fbff drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-28  1266  	cam->vdev.queue =3D vq;
4965bcd3c1f3d3 drivers/media/platform/via-camera.c Hans Verkuil       2019-=
07-17  1267  	video_set_drvdata(&cam->vdev, cam);
70cad4495a7438 drivers/media/platform/via-camera.c Hans Verkuil       2020-=
02-03  1268  	ret =3D video_register_device(&cam->vdev, VFL_TYPE_VIDEO, -1);
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1269  	if (ret)
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1270  		goto out_irq;
024fafbac36b17 drivers/media/video/via-camera.c    Jonathan Corbet    2010-=
10-19  1271  =


:::::: The code at line 1259 was first introduced by commit
:::::: 4590c07462fbff4ecbfe1deec44431c16191bd19 media: via-camera: convert =
to the vb2 framework

:::::: TO: Hans Verkuil <hverkuil@xs4all.nl>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3300949904961489761==--

