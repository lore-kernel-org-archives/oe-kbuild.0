Content-Type: multipart/mixed; boundary="===============0172859745337766376=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/zoned.c:2039:15: warning: Uninitialized variable: device->zone_info [uninitvar]
Date: Mon, 18 Jul 2022 14:41:11 +0800
Message-ID: <202207181459.tULJY4Z6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0172859745337766376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/btrfs/=
zoned.c:2039:15: warning: Uninitialized variable: device->zone_info [uninit=
var]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Naohiro Aota <naohiro.aota@wdc.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ff6992735ade75aae3e35d16b17da1008d753d28
commit: 16beac87e95e2fb278b552397c8260637f8a63f7 btrfs: zoned: cache report=
ed zone during mount
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 16beac87e95e2fb278b552397c8260637f8a63f7
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   fs/btrfs/zoned.c:117:7: warning: Local variable 'i' shadows outer variab=
le [shadowVariable]
     int i;
         ^
   fs/btrfs/zoned.c:83:6: note: Shadowed declaration
    int i;
        ^
   fs/btrfs/zoned.c:117:7: note: Shadow variable
     int i;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   fs/btrfs/zoned.c:658:14: warning: Redundant initialization for 'zone_inf=
o'. The initialized value is overwritten before it is read. [redundantIniti=
alization]
      zone_info =3D device->zone_info;
                ^
   fs/btrfs/zoned.c:655:46: note: zone_info is initialized
      struct btrfs_zoned_device_info *zone_info =3D
                                                ^
   fs/btrfs/zoned.c:658:14: note: zone_info is overwritten
      zone_info =3D device->zone_info;
                ^
   fs/btrfs/zoned.c:336:16: warning: Uninitialized variable: device->bdev [=
uninitvar]
     if (!device->bdev)
                  ^
   fs/btrfs/zoned.c:330:6: note: Assuming condition is false
    if (!btrfs_fs_incompat(fs_info, ZONED))
        ^
   fs/btrfs/zoned.c:336:16: note: Uninitialized variable: device->bdev
     if (!device->bdev)
                  ^
   fs/btrfs/zoned.c:642:16: warning: Uninitialized variable: device->bdev [=
uninitvar]
     if (!device->bdev)
                  ^
   fs/btrfs/zoned.c:661:17: warning: Uninitialized variable: zone_info [uni=
nitvar]
       zone_size =3D zone_info->zone_size;
                   ^
   fs/btrfs/zoned.c:642:7: note: Assuming condition is false
     if (!device->bdev)
         ^
   fs/btrfs/zoned.c:658:22: note: Assignment 'zone_info=3Ddevice->zone_info=
', assigned value is <Uninit>
      zone_info =3D device->zone_info;
                        ^
   fs/btrfs/zoned.c:661:17: note: Uninitialized variable: zone_info
       zone_size =3D zone_info->zone_size;
                   ^
>> fs/btrfs/zoned.c:2039:15: warning: Uninitialized variable: device->zone_=
info [uninitvar]
     if (device->zone_info) {
                 ^
   fs/btrfs/zoned.c:2034:6: note: Assuming condition is false
    if (!btrfs_is_zoned(fs_info))
        ^
   fs/btrfs/zoned.c:2039:15: note: Uninitialized variable: device->zone_info
     if (device->zone_info) {
                 ^
>> kernel/time/posix-timers.c:119:32: warning: Parameter 'sig' can be decla=
red with const [constParameter]
            struct signal_struct *sig,
                                  ^
>> kernel/time/posix-timers.c:318:9: warning: Uninitialized variable: __tim=
r [uninitvar]
    timr =3D lock_timer(info->si_tid, &flags);
           ^
   kernel/time/posix-timers.c:722:9: warning: Uninitialized variable: __tim=
r [uninitvar]
    timr =3D lock_timer(timer_id, &flags);
           ^
   kernel/time/posix-timers.c:783:9: warning: Uninitialized variable: __tim=
r [uninitvar]
    timr =3D lock_timer(timer_id, &flags);
           ^
   kernel/time/posix-timers.c:854:9: warning: Uninitialized variable: __tim=
r [uninitvar]
    return lock_timer(timer_id, flags);
           ^
   kernel/time/posix-timers.c:914:9: warning: Uninitialized variable: __tim=
r [uninitvar]
    timr =3D lock_timer(timer_id, &flags);
           ^
   kernel/time/posix-timers.c:1009:10: warning: Uninitialized variable: __t=
imr [uninitvar]
    timer =3D lock_timer(timer_id, &flags);
            ^

vim +2039 fs/btrfs/zoned.c

16beac87e95e2f Naohiro Aota 2021-11-11  2028  =

16beac87e95e2f Naohiro Aota 2021-11-11  2029  void btrfs_free_zone_cache(st=
ruct btrfs_fs_info *fs_info)
16beac87e95e2f Naohiro Aota 2021-11-11  2030  {
16beac87e95e2f Naohiro Aota 2021-11-11  2031  	struct btrfs_fs_devices *fs_=
devices =3D fs_info->fs_devices;
16beac87e95e2f Naohiro Aota 2021-11-11  2032  	struct btrfs_device *device;
16beac87e95e2f Naohiro Aota 2021-11-11  2033  =

16beac87e95e2f Naohiro Aota 2021-11-11  2034  	if (!btrfs_is_zoned(fs_info))
16beac87e95e2f Naohiro Aota 2021-11-11  2035  		return;
16beac87e95e2f Naohiro Aota 2021-11-11  2036  =

16beac87e95e2f Naohiro Aota 2021-11-11  2037  	mutex_lock(&fs_devices->devi=
ce_list_mutex);
16beac87e95e2f Naohiro Aota 2021-11-11  2038  	list_for_each_entry(device, =
&fs_devices->devices, dev_list) {
16beac87e95e2f Naohiro Aota 2021-11-11 @2039  		if (device->zone_info) {

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0172859745337766376==--

