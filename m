Content-Type: multipart/mixed; boundary="===============5553660306373550628=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: samples/vfio-mdev/mtty.c:930:14: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 06 Jan 2022 22:24:51 +0800
Message-ID: <202201062233.8js3Y1GC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5553660306373550628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Cornelia Huck <cohuck@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Kirti Wankhede <kwankhede@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   75acfdb6fd922598a408a0d864486aeb167c1a97
commit: af3ab3f9b986cdbc1b97b8a3341ce78851edb0dd vfio/mdev: Remove CONFIG_V=
FIO_MDEV_DEVICE
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20220103 (https://download.01.org/0day-ci/ar=
chive/20220106/202201062233.8js3Y1GC-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea=
47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Daf3ab3f9b986cdbc1b97b8a3341ce78851edb0dd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout af3ab3f9b986cdbc1b97b8a3341ce78851edb0dd
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/w83793.c:1301:2: note: Loop condition is false.  Exiting l=
oop
           list_for_each_entry(pos, &watchdog_data_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwmon/w83793.c:1301:2: note: Loop condition is false. Execution =
continues on line 1309
           list_for_each_entry(pos, &watchdog_data_list, list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/hwmon/w83793.c:1315:6: note: Assuming 'watchdog_is_open' is 0
           if (!watchdog_is_open)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1315:2: note: Taking true branch
           if (!watchdog_is_open)
           ^
   drivers/hwmon/w83793.c:1321:6: note: 'watchdog_is_open' is 0
           if (watchdog_is_open)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1321:2: note: Taking false branch
           if (watchdog_is_open)
           ^
   drivers/hwmon/w83793.c:1325:18: note: Passing null pointer value via 1st=
 parameter 'data'
           watchdog_enable(data);
                           ^~~~
   drivers/hwmon/w83793.c:1325:2: note: Calling 'watchdog_enable'
           watchdog_enable(data);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1253:7: note: Access to field 'client' results in=
 a dereference of a null pointer (loaded from variable 'data')
           if (!data->client) {
                ^~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/siox/siox-core.c:240:4: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   drivers/siox/siox-core.c:240:4: note: Value stored to 'status' is never =
read
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> samples/vfio-mdev/mtty.c:930:14: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
                                   int fd =3D *(int *)data;
                                            ^
   samples/vfio-mdev/mtty.c:1118:6: note: Assuming 'mdev' is non-null
           if (!mdev)
               ^~~~~
   samples/vfio-mdev/mtty.c:1118:2: note: Taking false branch
           if (!mdev)
           ^
   samples/vfio-mdev/mtty.c:1121:15: note: Calling 'mdev_get_drvdata'
           mdev_state =3D mdev_get_drvdata(mdev);
                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mdev.h:159:2: note: Returning without writing to 'mdev->dr=
iver_data', which participates in a condition later
           return mdev->driver_data;
           ^
   include/linux/mdev.h:159:2: note: Returning pointer, which participates =
in a condition later
           return mdev->driver_data;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1121:15: note: Returning from 'mdev_get_drvdata'
           mdev_state =3D mdev_get_drvdata(mdev);
                        ^~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1122:6: note: Assuming 'mdev_state' is non-null
           if (!mdev_state)
               ^~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1122:2: note: Taking false branch
           if (!mdev_state)
           ^
   samples/vfio-mdev/mtty.c:1125:2: note: Control jumps to 'case 15214:'  a=
t line 1196
           switch (cmd) {
           ^
   samples/vfio-mdev/mtty.c:1199:7: note: 'data' initialized to a null poin=
ter value
                   u8 *data =3D NULL, *ptr =3D NULL;
                       ^~~~
   samples/vfio-mdev/mtty.c:1204:7: note: Calling 'copy_from_user'
                   if (copy_from_user(&hdr, (void __user *)arg, minsz))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   samples/vfio-mdev/mtty.c:1204:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(&hdr, (void __user *)arg, minsz))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1204:7: note: Assuming the condition is false
                   if (copy_from_user(&hdr, (void __user *)arg, minsz))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:1204:3: note: Taking false branch
                   if (copy_from_user(&hdr, (void __user *)arg, minsz))
                   ^
   samples/vfio-mdev/mtty.c:1211:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   samples/vfio-mdev/mtty.c:1211:3: note: Taking false branch
                   if (ret)
                   ^
   samples/vfio-mdev/mtty.c:1214:7: note: Assuming 'data_size' is 0
                   if (data_size) {
                       ^~~~~~~~~
   samples/vfio-mdev/mtty.c:1214:3: note: Taking false branch
                   if (data_size) {
                   ^
   samples/vfio-mdev/mtty.c:1222:20: note: Passing null pointer value via 6=
th parameter 'data'
                                       hdr.count, data);
                                                  ^~~~
   samples/vfio-mdev/mtty.c:1221:9: note: Calling 'mtty_set_irqs'
                   ret =3D mtty_set_irqs(mdev, hdr.flags, hdr.index, hdr.st=
art,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   samples/vfio-mdev/mtty.c:906:7: note: 'mdev' is non-null
           if (!mdev)
                ^~~~
   samples/vfio-mdev/mtty.c:906:2: note: Taking false branch
           if (!mdev)
           ^
   samples/vfio-mdev/mtty.c:909:15: note: Calling 'mdev_get_drvdata'
           mdev_state =3D mdev_get_drvdata(mdev);
                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mdev.h:159:2: note: Returning without writing to 'mdev->dr=
iver_data', which participates in a condition later
           return mdev->driver_data;
           ^
   include/linux/mdev.h:159:2: note: Returning pointer, which participates =
in a condition later
           return mdev->driver_data;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:909:15: note: Returning from 'mdev_get_drvdata'
           mdev_state =3D mdev_get_drvdata(mdev);
                        ^~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mtty.c:910:7: note: 'mdev_state' is non-null
           if (!mdev_state)
                ^~~~~~~~~~
   samples/vfio-mdev/mtty.c:910:2: note: Taking false branch
           if (!mdev_state)
           ^
   samples/vfio-mdev/mtty.c:914:2: note: Control jumps to 'case VFIO_PCI_IN=
TX_IRQ_INDEX:'  at line 915
           switch (index) {
           ^
   samples/vfio-mdev/mtty.c:916:3: note: Control jumps to 'case 32:'  at li=
ne 920
                   switch (flags & VFIO_IRQ_SET_ACTION_TYPE_MASK) {
                   ^
   samples/vfio-mdev/mtty.c:922:8: note: Assuming the condition is false
                           if (flags & VFIO_IRQ_SET_DATA_NONE) {

vim +930 samples/vfio-mdev/mtty.c

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  898  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  899  static int mtty_set_irqs(str=
uct mdev_device *mdev, uint32_t flags,
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  900  			 unsigned int index, unsi=
gned int start,
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  901  			 unsigned int count, void=
 *data)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  902  {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  903  	int ret =3D 0;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  904  	struct mdev_state *mdev_sta=
te;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  905  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  906  	if (!mdev)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  907  		return -EINVAL;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  908  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  909  	mdev_state =3D mdev_get_drv=
data(mdev);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  910  	if (!mdev_state)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  911  		return -EINVAL;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  912  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  913  	mutex_lock(&mdev_state->ops=
_lock);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  914  	switch (index) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  915  	case VFIO_PCI_INTX_IRQ_INDE=
X:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  916  		switch (flags & VFIO_IRQ_S=
ET_ACTION_TYPE_MASK) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  917  		case VFIO_IRQ_SET_ACTION_M=
ASK:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  918  		case VFIO_IRQ_SET_ACTION_U=
NMASK:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  919  			break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  920  		case VFIO_IRQ_SET_ACTION_T=
RIGGER:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  921  		{
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  922  			if (flags & VFIO_IRQ_SET_=
DATA_NONE) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  923  				pr_info("%s: disable INT=
x\n", __func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  924  				if (mdev_state->intx_evt=
fd)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  925  					eventfd_ctx_put(mdev_st=
ate->intx_evtfd);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  926  				break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  927  			}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  928  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  929  			if (flags & VFIO_IRQ_SET_=
DATA_EVENTFD) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17 @930  				int fd =3D *(int *)data;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  931  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  932  				if (fd > 0) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  933  					struct eventfd_ctx *evt;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  934  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  935  					evt =3D eventfd_ctx_fdg=
et(fd);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  936  					if (IS_ERR(evt)) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  937  						ret =3D PTR_ERR(evt);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  938  						break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  939  					}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  940  					mdev_state->intx_evtfd =
=3D evt;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  941  					mdev_state->irq_fd =3D =
fd;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  942  					mdev_state->irq_index =
=3D index;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  943  					break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  944  				}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  945  			}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  946  			break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  947  		}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  948  		}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  949  		break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  950  	case VFIO_PCI_MSI_IRQ_INDEX:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  951  		switch (flags & VFIO_IRQ_S=
ET_ACTION_TYPE_MASK) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  952  		case VFIO_IRQ_SET_ACTION_M=
ASK:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  953  		case VFIO_IRQ_SET_ACTION_U=
NMASK:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  954  			break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  955  		case VFIO_IRQ_SET_ACTION_T=
RIGGER:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  956  			if (flags & VFIO_IRQ_SET_=
DATA_NONE) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  957  				if (mdev_state->msi_evtf=
d)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  958  					eventfd_ctx_put(mdev_st=
ate->msi_evtfd);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  959  				pr_info("%s: disable MSI=
\n", __func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  960  				mdev_state->irq_index =
=3D VFIO_PCI_INTX_IRQ_INDEX;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  961  				break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  962  			}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  963  			if (flags & VFIO_IRQ_SET_=
DATA_EVENTFD) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  964  				int fd =3D *(int *)data;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  965  				struct eventfd_ctx *evt;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  966  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  967  				if (fd <=3D 0)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  968  					break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  969  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  970  				if (mdev_state->msi_evtf=
d)
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  971  					break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  972  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  973  				evt =3D eventfd_ctx_fdge=
t(fd);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  974  				if (IS_ERR(evt)) {
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  975  					ret =3D PTR_ERR(evt);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  976  					break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  977  				}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  978  				mdev_state->msi_evtfd =
=3D evt;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  979  				mdev_state->irq_fd =3D f=
d;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  980  				mdev_state->irq_index =
=3D index;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  981  			}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  982  			break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  983  	}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  984  	break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  985  	case VFIO_PCI_MSIX_IRQ_INDE=
X:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  986  		pr_info("%s: MSIX_IRQ\n", =
__func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  987  		break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  988  	case VFIO_PCI_ERR_IRQ_INDEX:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  989  		pr_info("%s: ERR_IRQ\n", _=
_func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  990  		break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  991  	case VFIO_PCI_REQ_IRQ_INDEX:
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  992  		pr_info("%s: REQ_IRQ\n", _=
_func__);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  993  		break;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  994  	}
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  995  =

9d1a546c53b4c1 Kirti Wankhede 2016-11-17  996  	mutex_unlock(&mdev_state->o=
ps_lock);
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  997  	return ret;
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  998  }
9d1a546c53b4c1 Kirti Wankhede 2016-11-17  999  =


:::::: The code at line 930 was first introduced by commit
:::::: 9d1a546c53b4c1c378b0f34de84ddee2c7d4c90c docs: Sample driver to demo=
nstrate how to use Mediated device framework.

:::::: TO: Kirti Wankhede <kwankhede@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5553660306373550628==--

