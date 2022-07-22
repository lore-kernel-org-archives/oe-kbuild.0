Content-Type: multipart/mixed; boundary="===============7983494093335317100=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-kiwi-5.10 8804/9999] drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long virtio_cread_v'
Date: Fri, 22 Jul 2022 09:12:38 +0800
Message-ID: <202207220922.XbjL4sWH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7983494093335317100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/v=
irtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsi=
gned long long virtio_cread_v'"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>
TO: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android12-kiwi-5.10
head:   edf4da79d443f97049926ace891b5d6d235f7539
commit: 029865ac9555743665dd106b4bbefb2f371849e9 [8804/9999] ANDROID: virti=
o: virtio_pvclock: initial driver impl
:::::: branch date: 4 months ago
:::::: commit date: 6 months ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220722=
/202207220922.XbjL4sWH-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/029865ac9555743=
665dd106b4bbefb2f371849e9
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android12-kiwi-5.10
        git checkout 029865ac9555743665dd106b4bbefb2f371849e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_pvclock.c:295:9: sparse: sparse: mixing declaratio=
ns and code
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selecti=
on for 'unsigned long long virtio_cread_v'
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: incompatible types=
 in comparison expression (different base types):
>> drivers/virtio/virtio_pvclock.c:58:9: sparse:    bad type *
>> drivers/virtio/virtio_pvclock.c:58:9: sparse:    unsigned long long *
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selecti=
on for 'unsigned long long [addressable] virtio_cread_v'

vim +58 drivers/virtio/virtio_pvclock.c

029865ac9555743 Colin Downs-Razouk 2021-09-07  48  =

029865ac9555743 Colin Downs-Razouk 2021-09-07  49  void update_suspend_time=
(struct work_struct *work)
029865ac9555743 Colin Downs-Razouk 2021-09-07  50  {
029865ac9555743 Colin Downs-Razouk 2021-09-07  51  	u64 suspend_ns, suspend=
_time_delta =3D 0;
029865ac9555743 Colin Downs-Razouk 2021-09-07  52  	struct timespec64 injec=
t_time;
029865ac9555743 Colin Downs-Razouk 2021-09-07  53  	struct virtio_pvclock *=
vp;
029865ac9555743 Colin Downs-Razouk 2021-09-07  54  =

029865ac9555743 Colin Downs-Razouk 2021-09-07  55  	vp =3D container_of(wor=
k, struct virtio_pvclock,
029865ac9555743 Colin Downs-Razouk 2021-09-07  56  			  update_suspend_time=
_work);
029865ac9555743 Colin Downs-Razouk 2021-09-07  57  =

029865ac9555743 Colin Downs-Razouk 2021-09-07 @58  	virtio_cread(vp->vdev, =
struct virtio_pvclock_config, suspend_time_ns,
029865ac9555743 Colin Downs-Razouk 2021-09-07  59  		     &suspend_ns);
029865ac9555743 Colin Downs-Razouk 2021-09-07  60  =

029865ac9555743 Colin Downs-Razouk 2021-09-07  61  	mutex_lock(&vp->inject_=
suspend_lock);
029865ac9555743 Colin Downs-Razouk 2021-09-07  62  	if (suspend_ns > vp->in=
jected_suspend_ns) {
029865ac9555743 Colin Downs-Razouk 2021-09-07  63  		suspend_time_delta =3D=
 suspend_ns - vp->injected_suspend_ns;
029865ac9555743 Colin Downs-Razouk 2021-09-07  64  		vp->injected_suspend_n=
s =3D suspend_ns;
029865ac9555743 Colin Downs-Razouk 2021-09-07  65  	}
029865ac9555743 Colin Downs-Razouk 2021-09-07  66  	mutex_unlock(&vp->injec=
t_suspend_lock);
029865ac9555743 Colin Downs-Razouk 2021-09-07  67  =

029865ac9555743 Colin Downs-Razouk 2021-09-07  68  	if (suspend_time_delta =
=3D=3D 0) {
029865ac9555743 Colin Downs-Razouk 2021-09-07  69  		dev_err(&vp->vdev->dev,
029865ac9555743 Colin Downs-Razouk 2021-09-07  70  			"%s: suspend_time_ns =
is less than injected_suspend_ns\n",
029865ac9555743 Colin Downs-Razouk 2021-09-07  71  			__func__);
029865ac9555743 Colin Downs-Razouk 2021-09-07  72  		return;
029865ac9555743 Colin Downs-Razouk 2021-09-07  73  	}
029865ac9555743 Colin Downs-Razouk 2021-09-07  74  =

029865ac9555743 Colin Downs-Razouk 2021-09-07  75  	inject_time =3D ns_to_t=
imespec64(suspend_time_delta);
029865ac9555743 Colin Downs-Razouk 2021-09-07  76  =

029865ac9555743 Colin Downs-Razouk 2021-09-07  77  	timekeeping_inject_slee=
ptime64(&inject_time);
029865ac9555743 Colin Downs-Razouk 2021-09-07  78  =

029865ac9555743 Colin Downs-Razouk 2021-09-07  79  	dev_info(&vp->vdev->dev=
, "injected sleeptime: %llu ns\n",
029865ac9555743 Colin Downs-Razouk 2021-09-07  80  		 suspend_time_delta);
029865ac9555743 Colin Downs-Razouk 2021-09-07  81  }
029865ac9555743 Colin Downs-Razouk 2021-09-07  82  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7983494093335317100==--

