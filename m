Content-Type: multipart/mixed; boundary="===============2215492878124394950=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:for-linux-next 2/3] drivers/dma-buf/st-dma-fence-unwrap.c:148:4: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Mar 2022 04:24:18 +0800
Message-ID: <202203270435.TtRcG3Pv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2215492878124394950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   519f490db07e1a539490612f376487f61e48e39c
commit: 64a8f92fd783e750cdb81af75942dcd53bbf61bd [2/3] dma-buf: add dma_fen=
ce_unwrap v2
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: riscv-randconfig-c006-20220324 (https://download.01.org/0day-ci/arc=
hive/20220327/202203270435.TtRcG3Pv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc for-linux-next
        git checkout 64a8f92fd783e750cdb81af75942dcd53bbf61bd
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~
   fs/ubifs/dir.c:376:2: note: Taking false branch
           if (err) {
           ^
   fs/ubifs/dir.c:382:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   fs/ubifs/dir.c:382:2: note: Taking false branch
           if (err) {
           ^
   fs/ubifs/dir.c:389:6: note: Calling 'IS_ERR'
           if (IS_ERR(inode)) {
               ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/dir.c:389:6: note: Returning from 'IS_ERR'
           if (IS_ERR(inode)) {
               ^~~~~~~~~~~~~
   fs/ubifs/dir.c:389:2: note: Taking true branch
           if (IS_ERR(inode)) {
           ^
   fs/ubifs/dir.c:391:3: note: Control jumps to line 436
                   goto out_budg;
                   ^
   fs/ubifs/dir.c:437:7: note: 'instantiated' is 0
           if (!instantiated)
                ^~~~~~~~~~~~
   fs/ubifs/dir.c:437:2: note: Taking true branch
           if (!instantiated)
           ^
   fs/ubifs/dir.c:441:2: note: Returning without writing to '*whiteout'
           return err;
           ^
   fs/ubifs/dir.c:441:2: note: Returning value (loaded from 'err'), which p=
articipates in a condition later
           return err;
           ^~~~~~~~~~
   fs/ubifs/dir.c:1334:9: note: Returning from 'do_tmpfile'
                   err =3D do_tmpfile(old_dir, old_dentry, S_IFCHR | WHITEO=
UT_MODE, &whiteout);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   fs/ubifs/dir.c:1335:7: note: Assuming 'err' is 0
                   if (err) {
                       ^~~
   fs/ubifs/dir.c:1335:3: note: Taking false branch
                   if (err) {
                   ^
   fs/ubifs/dir.c:1341:21: note: Access to field 'i_state' results in a der=
eference of a null pointer (loaded from variable 'whiteout')
                   whiteout->i_state |=3D I_LINKABLE;
                   ~~~~~~~~          ^
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (12 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/dma-buf/st-dma-fence-unwrap.c:148:4: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:148:4: note: Value stored to 'err'=
 is never read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:154:3: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:154:3: note: Value stored to 'err'=
 is never read
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:190:4: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:190:4: note: Value stored to 'err'=
 is never read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:196:3: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:196:3: note: Value stored to 'err'=
 is never read
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:236:4: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:236:4: note: Value stored to 'err'=
 is never read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:242:3: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/dma-buf/st-dma-fence-unwrap.c:242:3: note: Value stored to 'err'=
 is never read
                   err =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 9 warnings (5 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/net/can/dev/bittiming.c:173:33: warning: Division by zero [clang=
-analyzer-core.DivideZero]
           bt->bitrate =3D priv->clock.freq /
                                          ^
   drivers/net/can/dev/bittiming.c:277:6: note: Assuming field 'tq' is 0
           if (!bt->tq && bt->bitrate && btc)
               ^~~~~~~
   drivers/net/can/dev/bittiming.c:277:6: note: Left side of '&&' is true
   drivers/net/can/dev/bittiming.c:277:17: note: Assuming field 'bitrate' i=
s not equal to 0
           if (!bt->tq && bt->bitrate && btc)
                          ^~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:277:6: note: Left side of '&&' is true
           if (!bt->tq && bt->bitrate && btc)
               ^
   drivers/net/can/dev/bittiming.c:277:32: note: Assuming 'btc' is non-null
           if (!bt->tq && bt->bitrate && btc)
                                         ^~~
   drivers/net/can/dev/bittiming.c:277:2: note: Taking true branch
           if (!bt->tq && bt->bitrate && btc)
           ^
   drivers/net/can/dev/bittiming.c:278:9: note: Calling 'can_calc_bittiming'
                   err =3D can_calc_bittiming(dev, bt, btc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:77:2: note: 'best_brp' initialized to 0
           unsigned int best_brp =3D 0;              /* current best value =
for brp */
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:82:6: note: Assuming field 'sample_point=
' is not equal to 0
           if (bt->sample_point) {
               ^~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:82:2: note: Taking true branch
           if (bt->sample_point) {
           ^
   drivers/net/can/dev/bittiming.c:95:7: note: Assuming the condition is tr=
ue
                tseg >=3D (btc->tseg1_min + btc->tseg2_min) * 2; tseg--) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:94:2: note: Loop condition is true.  Ent=
ering loop body
           for (tseg =3D (btc->tseg1_max + btc->tseg2_max) * 2 + 1;
           ^
   drivers/net/can/dev/bittiming.c:103:7: note: Assuming 'brp' is < field '=
brp_min'
                   if (brp < btc->brp_min || brp > btc->brp_max)
                       ^~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:103:26: note: Left side of '||' is true
                   if (brp < btc->brp_min || brp > btc->brp_max)
                                          ^
   drivers/net/can/dev/bittiming.c:104:4: note:  Execution continues on lin=
e 95
                           continue;
                           ^
   drivers/net/can/dev/bittiming.c:95:7: note: Assuming the condition is fa=
lse
                tseg >=3D (btc->tseg1_min + btc->tseg2_min) * 2; tseg--) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:94:2: note: Loop condition is false. Exe=
cution continues on line 131
           for (tseg =3D (btc->tseg1_max + btc->tseg2_max) * 2 + 1;
           ^
   drivers/net/can/dev/bittiming.c:131:6: note: 'best_bitrate_error' is 429=
4967295
           if (best_bitrate_error) {
               ^~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/bittiming.c:131:2: note: Taking true branch

vim +/err +148 drivers/dma-buf/st-dma-fence-unwrap.c

64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  120  =

64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  121  static int unwrap_arr=
ay(void *arg)
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  122  {
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  123  	struct dma_fence *fe=
nce, *f1, *f2, *array;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  124  	struct dma_fence_unw=
rap iter;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  125  	int err =3D 0;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  126  =

64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  127  	f1 =3D mock_fence();
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  128  	if (!f1)
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  129  		return -ENOMEM;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  130  =

64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  131  	f2 =3D mock_fence();
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  132  	if (!f2) {
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  133  		dma_fence_put(f1);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  134  		return -ENOMEM;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  135  	}
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  136  =

64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  137  	array =3D mock_array=
(2, f1, f2);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  138  	if (!array)
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  139  		return -ENOMEM;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  140  =

64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  141  	dma_fence_unwrap_for=
_each(fence, &iter, array) {
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  142  		if (fence =3D=3D f1=
) {
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  143  			f1 =3D NULL;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  144  		} else if (fence =
=3D=3D f2) {
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  145  			f2 =3D NULL;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  146  		} else {
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  147  			pr_err("Unexpected=
 fence!\n");
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11 @148  			err =3D -EINVAL;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  149  		}
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  150  	}
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  151  =

64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  152  	if (f1 || f2) {
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  153  		pr_err("Not all fen=
ces seen!\n");
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  154  		err =3D -EINVAL;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  155  	}
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  156  =

64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  157  	dma_fence_signal(f1);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  158  	dma_fence_signal(f2);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  159  	dma_fence_put(array);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  160  	return 0;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  161  }
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  162  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2215492878124394950==--

