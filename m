Content-Type: multipart/mixed; boundary="===============3783979055754251283=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stored to 'isc_clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 05 Jun 2022 15:26:09 +0800
Message-ID: <202206051524.bvHWT74V-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3783979055754251283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stored to 'isc_c=
lk' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Jacopo Mondi <jacopo+renesas@jmondi.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   952923ddc01120190dcf671e7b354364ce1d1362
commit: 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0 media: atmel: atmel-isc: s=
plit the clock code into separate source file
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220605 (https://download.01.org/0day-ci/archi=
ve/20220605/202206051524.bvHWT74V-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                               ^~~~~
   fs/xfs/libxfs/xfs_ialloc.c:1084:4: note: Taking false branch
                           if (error)
                           ^
   fs/xfs/libxfs/xfs_ialloc.c:1091:10: note: Left side of '&&' is true
                   while (--searchdistance > 0 && (!doneleft || !doneright)=
) {
                          ^
   fs/xfs/libxfs/xfs_ialloc.c:1091:36: note: 'doneleft' is 1
                   while (--searchdistance > 0 && (!doneleft || !doneright)=
) {
                                                    ^~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:1091:35: note: Left side of '||' is false
                   while (--searchdistance > 0 && (!doneleft || !doneright)=
) {
                                                   ^
   fs/xfs/libxfs/xfs_ialloc.c:1091:48: note: Assuming 'doneright' is 0
                   while (--searchdistance > 0 && (!doneleft || !doneright)=
) {
                                                                ^~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:1091:3: note: Loop condition is true.  Enteri=
ng loop body
                   while (--searchdistance > 0 && (!doneleft || !doneright)=
) {
                   ^
   fs/xfs/libxfs/xfs_ialloc.c:1095:9: note: 'doneleft' is 1
                           if (!doneleft && !doneright) {
                                ^~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:1095:18: note: Left side of '&&' is false
                           if (!doneleft && !doneright) {
                                         ^
   fs/xfs/libxfs/xfs_ialloc.c:1104:8: note: 'useleft' is 0
                           if (useleft && trec.ir_freecount) {
                               ^~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:1104:16: note: Left side of '&&' is false
                           if (useleft && trec.ir_freecount) {
                                       ^
   fs/xfs/libxfs/xfs_ialloc.c:1116:9: note: 'useleft' is 0
                           if (!useleft && rec.ir_freecount) {
                                ^~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:1116:8: note: Left side of '&&' is true
                           if (!useleft && rec.ir_freecount) {
                               ^
   fs/xfs/libxfs/xfs_ialloc.c:1116:20: note: Assuming field 'ir_freecount' =
is not equal to 0
                           if (!useleft && rec.ir_freecount) {
                                           ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:1116:4: note: Taking true branch
                           if (!useleft && rec.ir_freecount) {
                           ^
   fs/xfs/libxfs/xfs_ialloc.c:1119:23: note: Assigned value is garbage or u=
ndefined
                                   pag->pagl_leftrec =3D trec.ir_startino;
                                                     ^ ~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:2669:33: warning: The left operand of '>' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (error || irec.ir_startino > high)
                                                 ^
   fs/xfs/libxfs/xfs_ialloc.c:2704:9: note: Calling 'xfs_ialloc_has_inode_r=
ecord'
           return xfs_ialloc_has_inode_record(cur, low, high, exists);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:2666:10: note: Calling 'xfs_inobt_lookup'
           error =3D xfs_inobt_lookup(cur, low, XFS_LOOKUP_LE, &has_record);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:46:9: note: Value assigned to 'has_record', w=
hich participates in a condition later
           return xfs_btree_lookup(cur, dir, stat);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:2666:10: note: Returning from 'xfs_inobt_look=
up'
           error =3D xfs_inobt_lookup(cur, low, XFS_LOOKUP_LE, &has_record);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:2667:9: note: Assuming 'error' is equal to 0
           while (error =3D=3D 0 && has_record) {
                  ^~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:2667:9: note: Left side of '&&' is true
   fs/xfs/libxfs/xfs_ialloc.c:2667:2: note: Loop condition is true.  Enteri=
ng loop body
           while (error =3D=3D 0 && has_record) {
           ^
   fs/xfs/libxfs/xfs_ialloc.c:2668:11: note: Calling 'xfs_inobt_get_rec'
                   error =3D xfs_inobt_get_rec(cur, &irec, &has_record);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:114:6: note: Assuming 'error' is 0, which par=
ticipates in a condition later
           if (error || *stat =3D=3D 0)
               ^~~~~
   fs/xfs/libxfs/xfs_ialloc.c:114:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_ialloc.c:114:15: note: Assuming the condition is true
           if (error || *stat =3D=3D 0)
                        ^~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:114:2: note: Taking true branch
           if (error || *stat =3D=3D 0)
           ^
   fs/xfs/libxfs/xfs_ialloc.c:115:3: note: Returning without writing to 'ir=
ec->ir_startino'
                   return error;
                   ^
   fs/xfs/libxfs/xfs_ialloc.c:115:3: note: Returning zero (loaded from 'err=
or'), which participates in a condition later
                   return error;
                   ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:2668:11: note: Returning from 'xfs_inobt_get_=
rec'
                   error =3D xfs_inobt_get_rec(cur, &irec, &has_record);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:2669:7: note: 'error' is 0
                   if (error || irec.ir_startino > high)
                       ^~~~~
   fs/xfs/libxfs/xfs_ialloc.c:2669:7: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_ialloc.c:2669:33: note: The left operand of '>' is a g=
arbage value
                   if (error || irec.ir_startino > high)
                                ~~~~~~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stor=
ed to 'isc_clk' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   drivers/media/platform/atmel/atmel-isc-clk.c:125:18: note: Value stored =
to 'isc_clk' during its initialization is never read
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/media/usb/airspy/airspy.c:246:16: warning: Value stored to 'msec=
s' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
                   unsigned int msecs =3D jiffies_to_msecs(jiffies -
                                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/airspy/airspy.c:246:16: note: Value stored to 'msecs' =
during its initialization is never read
                   unsigned int msecs =3D jiffies_to_msecs(jiffies -
                                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/airspy/airspy.c:248:16: warning: Value stored to 'samp=
les' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
                   unsigned int samples =3D s->sample - s->sample_measured;
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/airspy/airspy.c:248:16: note: Value stored to 'samples=
' during its initialization is never read
                   unsigned int samples =3D s->sample - s->sample_measured;
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   19 warnings generated.
   drivers/media/usb/hackrf/hackrf.c:237:24: warning: Value stored to 'intf=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:237:24: note: Value stored to 'intf' d=
uring its initialization is never read
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:462:16: warning: Value stored to 'msec=
s' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
                   unsigned int msecs =3D jiffies_to_msecs(jiffies -
                                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:462:16: note: Value stored to 'msecs' =
during its initialization is never read
                   unsigned int msecs =3D jiffies_to_msecs(jiffies -
                                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:464:16: warning: Value stored to 'samp=
les' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
                   unsigned int samples =3D dev->sample - dev->sample_measu=
red;
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:464:16: note: Value stored to 'samples=
' during its initialization is never read
                   unsigned int samples =3D dev->sample - dev->sample_measu=
red;
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:730:24: warning: Value stored to 'intf=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:730:24: note: Value stored to 'intf' d=
uring its initialization is never read
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:793:24: warning: Value stored to 'intf=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:793:24: note: Value stored to 'intf' d=
uring its initialization is never read
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:862:24: warning: Value stored to 'intf=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:862:24: note: Value stored to 'intf' d=
uring its initialization is never read
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:898:24: warning: Value stored to 'intf=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:898:24: note: Value stored to 'intf' d=
uring its initialization is never read
           struct usb_interface *intf =3D dev->intf;
                                 ^~~~   ~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:966:21: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct hackrf_dev *dev =3D video_drvdata(file);
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:966:21: note: Value stored to 'dev' du=
ring its initialization is never read
           struct hackrf_dev *dev =3D video_drvdata(file);
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:988:21: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct hackrf_dev *dev =3D video_drvdata(file);
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:988:21: note: Value stored to 'dev' du=
ring its initialization is never read
           struct hackrf_dev *dev =3D video_drvdata(file);
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:1003:21: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct hackrf_dev *dev =3D video_drvdata(file);
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:1003:21: note: Value stored to 'dev' d=
uring its initialization is never read
           struct hackrf_dev *dev =3D video_drvdata(file);
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:1020:21: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct hackrf_dev *dev =3D video_drvdata(file);
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:1020:21: note: Value stored to 'dev' d=
uring its initialization is never read
           struct hackrf_dev *dev =3D video_drvdata(file);
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:1049:21: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct hackrf_dev *dev =3D video_drvdata(file);
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/hackrf/hackrf.c:1049:21: note: Value stored to 'dev' d=
uring its initialization is never read
           struct hackrf_dev *dev =3D video_drvdata(file);

vim +/isc_clk +125 drivers/media/platform/atmel/atmel-isc-clk.c

118bf76a35bc2e Eugen Hristev 2021-12-13  121  =

118bf76a35bc2e Eugen Hristev 2021-12-13  122  static int isc_clk_determine_=
rate(struct clk_hw *hw,
118bf76a35bc2e Eugen Hristev 2021-12-13  123  				  struct clk_rate_request=
 *req)
118bf76a35bc2e Eugen Hristev 2021-12-13  124  {
118bf76a35bc2e Eugen Hristev 2021-12-13 @125  	struct isc_clk *isc_clk =3D =
to_isc_clk(hw);
118bf76a35bc2e Eugen Hristev 2021-12-13  126  	long best_rate =3D -EINVAL;
118bf76a35bc2e Eugen Hristev 2021-12-13  127  	int best_diff =3D -1;
118bf76a35bc2e Eugen Hristev 2021-12-13  128  	unsigned int i, div;
118bf76a35bc2e Eugen Hristev 2021-12-13  129  =

118bf76a35bc2e Eugen Hristev 2021-12-13  130  	for (i =3D 0; i < clk_hw_get=
_num_parents(hw); i++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  131  		struct clk_hw *parent;
118bf76a35bc2e Eugen Hristev 2021-12-13  132  		unsigned long parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  133  =

118bf76a35bc2e Eugen Hristev 2021-12-13  134  		parent =3D clk_hw_get_paren=
t_by_index(hw, i);
118bf76a35bc2e Eugen Hristev 2021-12-13  135  		if (!parent)
118bf76a35bc2e Eugen Hristev 2021-12-13  136  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  137  =

118bf76a35bc2e Eugen Hristev 2021-12-13  138  		parent_rate =3D clk_hw_get_=
rate(parent);
118bf76a35bc2e Eugen Hristev 2021-12-13  139  		if (!parent_rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  140  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  141  =

118bf76a35bc2e Eugen Hristev 2021-12-13  142  		for (div =3D 1; div < ISC_C=
LK_MAX_DIV + 2; div++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  143  			unsigned long rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  144  			int diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  145  =

118bf76a35bc2e Eugen Hristev 2021-12-13  146  			rate =3D DIV_ROUND_CLOSEST=
(parent_rate, div);
118bf76a35bc2e Eugen Hristev 2021-12-13  147  			diff =3D abs(req->rate - r=
ate);
118bf76a35bc2e Eugen Hristev 2021-12-13  148  =

118bf76a35bc2e Eugen Hristev 2021-12-13  149  			if (best_diff < 0 || best_=
diff > diff) {
118bf76a35bc2e Eugen Hristev 2021-12-13  150  				best_rate =3D rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  151  				best_diff =3D diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  152  				req->best_parent_rate =3D=
 parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  153  				req->best_parent_hw =3D p=
arent;
118bf76a35bc2e Eugen Hristev 2021-12-13  154  			}
118bf76a35bc2e Eugen Hristev 2021-12-13  155  =

118bf76a35bc2e Eugen Hristev 2021-12-13  156  			if (!best_diff || rate < r=
eq->rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  157  				break;
118bf76a35bc2e Eugen Hristev 2021-12-13  158  		}
118bf76a35bc2e Eugen Hristev 2021-12-13  159  =

118bf76a35bc2e Eugen Hristev 2021-12-13  160  		if (!best_diff)
118bf76a35bc2e Eugen Hristev 2021-12-13  161  			break;
118bf76a35bc2e Eugen Hristev 2021-12-13  162  	}
118bf76a35bc2e Eugen Hristev 2021-12-13  163  =

118bf76a35bc2e Eugen Hristev 2021-12-13  164  	dev_dbg(isc_clk->dev,
118bf76a35bc2e Eugen Hristev 2021-12-13  165  		"ISC CLK: %s, best_rate =3D=
 %ld, parent clk: %s @ %ld\n",
118bf76a35bc2e Eugen Hristev 2021-12-13  166  		__func__, best_rate,
118bf76a35bc2e Eugen Hristev 2021-12-13  167  		__clk_get_name((req->best_p=
arent_hw)->clk),
118bf76a35bc2e Eugen Hristev 2021-12-13  168  		req->best_parent_rate);
118bf76a35bc2e Eugen Hristev 2021-12-13  169  =

118bf76a35bc2e Eugen Hristev 2021-12-13  170  	if (best_rate < 0)
118bf76a35bc2e Eugen Hristev 2021-12-13  171  		return best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  172  =

118bf76a35bc2e Eugen Hristev 2021-12-13  173  	req->rate =3D best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  174  =

118bf76a35bc2e Eugen Hristev 2021-12-13  175  	return 0;
118bf76a35bc2e Eugen Hristev 2021-12-13  176  }
118bf76a35bc2e Eugen Hristev 2021-12-13  177  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3783979055754251283==--

