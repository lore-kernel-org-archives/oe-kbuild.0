Content-Type: multipart/mixed; boundary="===============5120259594838777129=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: samples/vfio-mdev/mtty.c:930:14: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 06 Nov 2021 15:32:20 +0800
Message-ID: <202111061506.7suosGhE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5120259594838777129==
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
head:   fe91c4725aeed35023ba4f7a1e1adfebb6878c23
commit: af3ab3f9b986cdbc1b97b8a3341ce78851edb0dd vfio/mdev: Remove CONFIG_V=
FIO_MDEV_DEVICE
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-c001-20211013 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project adf55a=
c6657693f7bfbe3087b599b4031a765a44)
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
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/greybus/manifest.c:196:2: note: Loop condition is false.  Exitin=
g loop
           list_for_each_entry(descriptor, &intf->manifest_descs, links) {
           ^
   include/linux/list.h:630:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
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
   drivers/greybus/manifest.c:196:2: note: Loop condition is true.  Enterin=
g loop body
           list_for_each_entry(descriptor, &intf->manifest_descs, links) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/greybus/manifest.c:197:7: note: Use of memory after it is freed
                   if (descriptor->type !=3D GREYBUS_TYPE_STRING)
                       ^~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  898  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  899  static int mtty_set_irqs(st=
ruct mdev_device *mdev, uint32_t flags,
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  900  			 unsigned int index, uns=
igned int start,
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  901  			 unsigned int count, voi=
d *data)
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  902  {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  903  	int ret =3D 0;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  904  	struct mdev_state *mdev_st=
ate;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  905  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  906  	if (!mdev)
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  907  		return -EINVAL;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  908  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  909  	mdev_state =3D mdev_get_dr=
vdata(mdev);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  910  	if (!mdev_state)
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  911  		return -EINVAL;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  912  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  913  	mutex_lock(&mdev_state->op=
s_lock);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  914  	switch (index) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  915  	case VFIO_PCI_INTX_IRQ_IND=
EX:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  916  		switch (flags & VFIO_IRQ_=
SET_ACTION_TYPE_MASK) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  917  		case VFIO_IRQ_SET_ACTION_=
MASK:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  918  		case VFIO_IRQ_SET_ACTION_=
UNMASK:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  919  			break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  920  		case VFIO_IRQ_SET_ACTION_=
TRIGGER:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  921  		{
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  922  			if (flags & VFIO_IRQ_SET=
_DATA_NONE) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  923  				pr_info("%s: disable IN=
Tx\n", __func__);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  924  				if (mdev_state->intx_ev=
tfd)
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  925  					eventfd_ctx_put(mdev_s=
tate->intx_evtfd);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  926  				break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  927  			}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  928  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  929  			if (flags & VFIO_IRQ_SET=
_DATA_EVENTFD) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17 @930  				int fd =3D *(int *)data;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  931  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  932  				if (fd > 0) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  933  					struct eventfd_ctx *ev=
t;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  934  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  935  					evt =3D eventfd_ctx_fd=
get(fd);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  936  					if (IS_ERR(evt)) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  937  						ret =3D PTR_ERR(evt);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  938  						break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  939  					}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  940  					mdev_state->intx_evtfd=
 =3D evt;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  941  					mdev_state->irq_fd =3D=
 fd;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  942  					mdev_state->irq_index =
=3D index;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  943  					break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  944  				}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  945  			}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  946  			break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  947  		}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  948  		}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  949  		break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  950  	case VFIO_PCI_MSI_IRQ_INDE=
X:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  951  		switch (flags & VFIO_IRQ_=
SET_ACTION_TYPE_MASK) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  952  		case VFIO_IRQ_SET_ACTION_=
MASK:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  953  		case VFIO_IRQ_SET_ACTION_=
UNMASK:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  954  			break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  955  		case VFIO_IRQ_SET_ACTION_=
TRIGGER:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  956  			if (flags & VFIO_IRQ_SET=
_DATA_NONE) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  957  				if (mdev_state->msi_evt=
fd)
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  958  					eventfd_ctx_put(mdev_s=
tate->msi_evtfd);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  959  				pr_info("%s: disable MS=
I\n", __func__);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  960  				mdev_state->irq_index =
=3D VFIO_PCI_INTX_IRQ_INDEX;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  961  				break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  962  			}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  963  			if (flags & VFIO_IRQ_SET=
_DATA_EVENTFD) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  964  				int fd =3D *(int *)data;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  965  				struct eventfd_ctx *evt;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  966  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  967  				if (fd <=3D 0)
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  968  					break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  969  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  970  				if (mdev_state->msi_evt=
fd)
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  971  					break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  972  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  973  				evt =3D eventfd_ctx_fdg=
et(fd);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  974  				if (IS_ERR(evt)) {
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  975  					ret =3D PTR_ERR(evt);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  976  					break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  977  				}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  978  				mdev_state->msi_evtfd =
=3D evt;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  979  				mdev_state->irq_fd =3D =
fd;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  980  				mdev_state->irq_index =
=3D index;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  981  			}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  982  			break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  983  	}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  984  	break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  985  	case VFIO_PCI_MSIX_IRQ_IND=
EX:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  986  		pr_info("%s: MSIX_IRQ\n",=
 __func__);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  987  		break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  988  	case VFIO_PCI_ERR_IRQ_INDE=
X:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  989  		pr_info("%s: ERR_IRQ\n", =
__func__);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  990  		break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  991  	case VFIO_PCI_REQ_IRQ_INDE=
X:
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  992  		pr_info("%s: REQ_IRQ\n", =
__func__);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  993  		break;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  994  	}
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  995  =

9d1a546c53b4c1c Kirti Wankhede 2016-11-17  996  	mutex_unlock(&mdev_state->=
ops_lock);
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  997  	return ret;
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  998  }
9d1a546c53b4c1c Kirti Wankhede 2016-11-17  999  =


:::::: The code at line 930 was first introduced by commit
:::::: 9d1a546c53b4c1c378b0f34de84ddee2c7d4c90c docs: Sample driver to demo=
nstrate how to use Mediated device framework.

:::::: TO: Kirti Wankhede <kwankhede@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5120259594838777129==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Gjr2Z0o/EjX/Td4a5P7gsKj/AAqBIfHbqgEA
--===============5120259594838777129==--

