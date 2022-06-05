Content-Type: multipart/mixed; boundary="===============3067762722220983472=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/marvell/mmp-driver.c:63:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 05 Jun 2022 13:55:08 +0800
Message-ID: <202206051358.UsqlQ4m0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3067762722220983472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/marvell/mmp-driver.c:63:17: warning: Value stored to 'dev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   952923ddc01120190dcf671e7b354364ce1d1362
commit: dc7bbea90075b57772e9a28043061bf71d96f06f media: platform: rename ma=
rvell-ccic/ to marvell/
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220605 (https://download.01.org/0day-ci/archi=
ve/20220605/202206051358.UsqlQ4m0-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddc7bbea90075b57772e9a28043061bf71d96f06f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dc7bbea90075b57772e9a28043061bf71d96f06f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:644:2: note: 'fs_info' initialized here
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:645:2: note: 'block_rsv' initialized here
           struct btrfs_block_rsv *block_rsv =3D &fs_info->global_block_rsv;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:646:24: note: Passing value via 1st parameter 'value_pt=
r'
           return btrfs_show_u64(&block_rsv->reserved, &block_rsv->lock, bu=
f);
                                 ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:646:9: note: Calling 'btrfs_show_u64'
           return btrfs_show_u64(&block_rsv->reserved, &block_rsv->lock, bu=
f);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/sysfs.c:624:6: note: Assuming 'lock' is null
           if (lock)
               ^~~~
   fs/btrfs/sysfs.c:624:2: note: Taking false branch
           if (lock)
           ^
   fs/btrfs/sysfs.c:626:8: note: Dereference of null pointer (loaded from v=
ariable 'value_ptr')
           val =3D *value_ptr;
                 ^~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/core/timer.c:1260:9: warning: Access to field 'number' results in =
a dereference of a null pointer (loaded from field 'card') [clang-analyzer-=
core.NullDereference]
                                       timer->card->number, timer->tmr_devi=
ce);
                                       ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   sound/core/timer.c:1251:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry(timer, &snd_timer_list, device_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/core/timer.c:1252:7: note: Assuming field 'card' is null
                   if (timer->card && timer->card->shutdown)
                       ^~~~~~~~~~~
   sound/core/timer.c:1252:19: note: Left side of '&&' is false
                   if (timer->card && timer->card->shutdown)
                                   ^
   sound/core/timer.c:1254:3: note: Control jumps to 'case SNDRV_TIMER_CLAS=
S_CARD:'  at line 1258
                   switch (timer->tmr_class) {
                   ^
   sound/core/timer.c:1260:9: note: Access to field 'number' results in a d=
ereference of a null pointer (loaded from field 'card')
                                       timer->card->number, timer->tmr_devi=
ce);
                                       ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   sound/core/timer.c:1263:39: warning: Access to field 'number' results in=
 a dereference of a null pointer (loaded from field 'card') [clang-analyzer=
-core.NullDereference]
                           snd_iprintf(buffer, "P%i-%i-%i: ", timer->card->=
number,
                                                              ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   sound/core/timer.c:1251:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry(timer, &snd_timer_list, device_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/core/timer.c:1252:7: note: Assuming field 'card' is null
                   if (timer->card && timer->card->shutdown)
                       ^~~~~~~~~~~
   sound/core/timer.c:1252:19: note: Left side of '&&' is false
                   if (timer->card && timer->card->shutdown)
                                   ^
   sound/core/timer.c:1254:3: note: Control jumps to 'case SNDRV_TIMER_CLAS=
S_PCM:'  at line 1262
                   switch (timer->tmr_class) {
                   ^
   sound/core/timer.c:1263:39: note: Access to field 'number' results in a =
dereference of a null pointer (loaded from field 'card')
                           snd_iprintf(buffer, "P%i-%i-%i: ", timer->card->=
number,
                                                              ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   1 warning generated.
   sound/usb/midi.c:2354:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->name, umidi->card->shortname);
           ^~~~~~
   sound/usb/midi.c:2354:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(rmidi->name, umidi->card->shortname);
           ^~~~~~
   2 warnings generated.
   sound/usb/misc/ua101.c:1250:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, name);
           ^~~~~~
   sound/usb/misc/ua101.c:1250:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(card->shortname, name);
           ^~~~~~
   sound/usb/misc/ua101.c:1275:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ua->pcm->name, name);
           ^~~~~~
   sound/usb/misc/ua101.c:1275:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(ua->pcm->name, name);
           ^~~~~~
   2 warnings generated.
>> drivers/media/platform/marvell/mmp-driver.c:63:17: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct device *dev =3D &cam->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/marvell/mmp-driver.c:63:17: note: Value stored to=
 'dev' during its initialization is never read
           struct device *dev =3D &cam->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/omap3isp/isp.c:529:17: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct device *dev =3D isp->dev;
                          ^~~   ~~~~~~~~
   drivers/media/platform/omap3isp/isp.c:529:17: note: Value stored to 'dev=
' during its initialization is never read
           struct device *dev =3D isp->dev;
                          ^~~   ~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/md/dm-sysfs.c:73:2: warning: Call to function 'strcat' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/md/dm-sysfs.c:73:2: note: Call to function 'strcat' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   drivers/md/dm-sysfs.c:82:2: warning: Call to function 'strcat' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/md/dm-sysfs.c:82:2: note: Call to function 'strcat' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   1 warning generated.
   fs/btrfs/free-space-cache.c:755:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D -1;
           ^     ~~
   fs/btrfs/free-space-cache.c:755:2: note: Value stored to 'ret' is never =
read
           ret =3D -1;
           ^     ~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/core/oss/mixer_oss.c:1089:3: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(str, ptr->name);
                   ^~~~~~
   sound/core/oss/mixer_oss.c:1089:3: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
                   strcpy(str, ptr->name);
                   ^~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   3 warnings generated.
   drivers/media/usb/em28xx/em28xx-cards.c:4107:2: warning: Value stored to=
 'retval' is never read [clang-analyzer-deadcode.DeadStores]
           retval =3D media_device_register(dev->media_dev);
           ^
   drivers/media/usb/em28xx/em28xx-cards.c:4107:2: note: Value stored to 'r=
etval' is never read
   Suppressed 2 warnings (2 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   drivers/md/md-faulty.c:247:7: warning: Although the value stored to 'n' =
is used in the enclosing expression, the value is never actually read from =
'n' [clang-analyzer-deadcode.DeadStores]
           if ((n=3Datomic_read(&conf->counters[WriteAll])) !=3D 0)
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-faulty.c:247:7: note: Although the value stored to 'n' is =
used in the enclosing expression, the value is never actually read from 'n'
           if ((n=3Datomic_read(&conf->counters[WriteAll])) !=3D 0)
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
   drivers/md/md.c:2461:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D sysfs_create_link(&rdev->kobj, bdev_kobj(rdev->bdev), "b=
lock");
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/md/md.c:2461:2: note: Value stored to 'err' is never read
           err =3D sysfs_create_link(&rdev->kobj, bdev_kobj(rdev->bdev), "b=
lock");
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/md/md.c:5222:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(page, "none\n");
           ^~~~~~
   drivers/md/md.c:5222:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(page, "none\n");
           ^~~~~~
   drivers/md/md.c:5707:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(disk->disk_name, name);
                   ^~~~~~
   drivers/md/md.c:5707:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(disk->disk_name, name);
                   ^~~~~~
   drivers/md/md.c:9692:5: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                                   ret =3D remove_and_add_spares(mddev, rde=
v2);
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md.c:9692:5: note: Value stored to 'ret' is never read

vim +/dev +63 drivers/media/platform/marvell/mmp-driver.c

67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Co=
rbet       2011-06-11   49  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   50  /*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   51   * calc the dphy register values
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   52   * There are three dphy registers being used.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   53   * dphy[0] - CSI2_DPHY3
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   54   * dphy[1] - CSI2_DPHY5
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   55   * dphy[2] - CSI2_DPHY6
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   56   * CSI2_DPHY3 and CSI2_DPHY6 can be set with a =
default value
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   57   * or be calculated dynamically
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   58   */
e81afa6f28f974 drivers/media/platform/marvell-ccic/mmp-driver.c Mauro Carva=
lho Chehab 2018-04-05   59  static void mmpcam_calc_dphy(struct mcam_camera=
 *mcam)
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   60  {
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   61  	struct mmp_camera *cam =3D mcam_to_cam(mcam);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   62  	struct mmp_camera_platform_data *pdata =3D cam=
->pdev->dev.platform_data;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  @63  	struct device *dev =3D &cam->pdev->dev;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   64  	unsigned long tx_clk_esc;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   65  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   66  	/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   67  	 * If CSI2_DPHY3 is calculated dynamically,
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   68  	 * pdata->lane_clk should be already set
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   69  	 * either in the board driver statically
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   70  	 * or in the sensor driver dynamically.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   71  	 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   72  	/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   73  	 * dphy[0] - CSI2_DPHY3:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   74  	 *  bit 0 ~ bit 7: HS Term Enable.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   75  	 *   defines the time that the DPHY
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   76  	 *   wait before enabling the data
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   77  	 *   lane termination after detecting
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   78  	 *   that the sensor has driven the data
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   79  	 *   lanes to the LP00 bridge state.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   80  	 *   The value is calculated by:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   81  	 *   (Max T(D_TERM_EN)/Period(DDR)) - 1
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   82  	 *  bit 8 ~ bit 15: HS_SETTLE
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   83  	 *   Time interval during which the HS
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   84  	 *   receiver shall ignore any Data Lane
8b72c18d467fad drivers/media/platform/marvell-ccic/mmp-driver.c Mauro Carva=
lho Chehab 2019-02-18   85  	 *   HS transitions.
8b72c18d467fad drivers/media/platform/marvell-ccic/mmp-driver.c Mauro Carva=
lho Chehab 2019-02-18   86  	 *   The value has been calibrated on
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   87  	 *   different boards. It seems to work well.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   88  	 *
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   89  	 *  More detail please refer
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   90  	 *  MIPI Alliance Spectification for D-PHY
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   91  	 *  document for explanation of HS-SETTLE
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   92  	 *  and D-TERM-EN.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   93  	 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   94  	switch (pdata->dphy3_algo) {
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   95  	case DPHY3_ALGO_PXA910:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   96  		/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   97  		 * Calculate CSI2_DPHY3 algo for PXA910
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   98  		 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03   99  		pdata->dphy[0] =3D
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  100  			(((1 + (pdata->lane_clk * 80) / 1000) & 0xff=
) << 8)
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  101  			| (1 + pdata->lane_clk * 35 / 1000);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  102  		break;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  103  	case DPHY3_ALGO_PXA2128:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  104  		/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  105  		 * Calculate CSI2_DPHY3 algo for PXA2128
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  106  		 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  107  		pdata->dphy[0] =3D
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  108  			(((2 + (pdata->lane_clk * 110) / 1000) & 0xf=
f) << 8)
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  109  			| (1 + pdata->lane_clk * 35 / 1000);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  110  		break;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  111  	default:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  112  		/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  113  		 * Use default CSI2_DPHY3 value for PXA688/PX=
A988
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  114  		 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  115  		dev_dbg(dev, "camera: use the default CSI2_DP=
HY3 value\n");
67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Co=
rbet       2011-06-11  116  	}
67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Co=
rbet       2011-06-11  117  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  118  	/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  119  	 * mipi_clk will never be changed, it is a fix=
ed value on MMP
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  120  	 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  121  	if (IS_ERR(cam->mipi_clk))
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  122  		return;
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  123  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  124  	/* get the escape clk, this is hard coded */
326f5a3fc502f9 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-11-05  125  	clk_prepare_enable(cam->mipi_clk);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  126  	tx_clk_esc =3D (clk_get_rate(cam->mipi_clk) / =
1000000) / 12;
326f5a3fc502f9 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-11-05  127  	clk_disable_unprepare(cam->mipi_clk);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  128  	/*
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  129  	 * dphy[2] - CSI2_DPHY6:
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  130  	 * bit 0 ~ bit 7: CK Term Enable
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  131  	 *  Time for the Clock Lane receiver to enable=
 the HS line
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  132  	 *  termination. The value is calculated simil=
arly with
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  133  	 *  HS Term Enable
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  134  	 * bit 8 ~ bit 15: CK Settle
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  135  	 *  Time interval during which the HS receiver=
 shall ignore
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  136  	 *  any Clock Lane HS transitions.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  137  	 *  The value is calibrated on the boards.
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  138  	 */
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  139  	pdata->dphy[2] =3D
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  140  		((((534 * tx_clk_esc) / 2000 - 1) & 0xff) << =
8)
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  141  		| (((38 * tx_clk_esc) / 1000 - 1) & 0xff);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  142  =

05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  143  	dev_dbg(dev, "camera: DPHY sets: dphy3=3D0x%x,=
 dphy5=3D0x%x, dphy6=3D0x%x\n",
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  144  		pdata->dphy[0], pdata->dphy[1], pdata->dphy[2=
]);
05fed81625bf75 drivers/media/platform/marvell-ccic/mmp-driver.c Libin Yang =
           2013-07-03  145  }
67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Co=
rbet       2011-06-11  146  =


:::::: The code at line 63 was first introduced by commit
:::::: 05fed81625bf755cc67c5864cdfd18b69ea828d1 [media] marvell-ccic: add M=
IPI support for marvell-ccic driver

:::::: TO: Libin Yang <lbyang@marvell.com>
:::::: CC: Mauro Carvalho Chehab <m.chehab@samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3067762722220983472==--

