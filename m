Content-Type: multipart/mixed; boundary="===============0004749218422524091=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: samples/vfio-mdev/mbochs.c:326:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 18 Dec 2021 12:03:04 +0800
Message-ID: <202112181159.fVX2bApP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0004749218422524091==
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
head:   5d65f6f3df56021ec76761ea6986bc8139f537d2
commit: af3ab3f9b986cdbc1b97b8a3341ce78851edb0dd vfio/mdev: Remove CONFIG_V=
FIO_MDEV_DEVICE
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-c001-20211215 (https://download.01.org/0day-ci/arch=
ive/20211218/202112181159.fVX2bApP-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
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
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/comedi/drivers/adv_pci1710.c:597:6: note: Assuming field 'conver=
t_src' is not equal to TRIG_TIMER
           if (cmd->convert_src =3D=3D TRIG_TIMER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/adv_pci1710.c:597:2: note: Taking false branch
           if (cmd->convert_src =3D=3D TRIG_TIMER)
           ^
   drivers/comedi/drivers/adv_pci1710.c:605:6: note: Assuming field 'stop_s=
rc' is not equal to TRIG_COUNT
           if (cmd->stop_src =3D=3D TRIG_COUNT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/adv_pci1710.c:605:2: note: Taking false branch
           if (cmd->stop_src =3D=3D TRIG_COUNT)
           ^
   drivers/comedi/drivers/adv_pci1710.c:610:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/comedi/drivers/adv_pci1710.c:610:2: note: Taking false branch
           if (err)
           ^
   drivers/comedi/drivers/adv_pci1710.c:615:11: note: Field 'convert_src' i=
s not equal to TRIG_TIMER
           if (cmd->convert_src =3D=3D TRIG_TIMER) {
                    ^
   drivers/comedi/drivers/adv_pci1710.c:615:2: note: Taking false branch
           if (cmd->convert_src =3D=3D TRIG_TIMER) {
           ^
   drivers/comedi/drivers/adv_pci1710.c:622:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/comedi/drivers/adv_pci1710.c:622:2: note: Taking false branch
           if (err)
           ^
   drivers/comedi/drivers/adv_pci1710.c:627:9: note: Calling 'pci1710_ai_ch=
eck_chanlist'
           err |=3D pci1710_ai_check_chanlist(dev, s, cmd);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/adv_pci1710.c:193:6: note: Assuming field 'chanli=
st_len' is not equal to 1
           if (cmd->chanlist_len =3D=3D 1) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/adv_pci1710.c:193:2: note: Taking false branch
           if (cmd->chanlist_len =3D=3D 1) {
           ^
   drivers/comedi/drivers/adv_pci1710.c:201:14: note: Assuming 'i' is < fie=
ld 'chanlist_len'
           for (i =3D 1; i < cmd->chanlist_len; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/adv_pci1710.c:201:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 1; i < cmd->chanlist_len; i++) {
           ^
   drivers/comedi/drivers/adv_pci1710.c:205:7: note: Assuming the condition=
 is true
                   if (cmd->chanlist[0] =3D=3D cmd->chanlist[i])
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/adv_pci1710.c:205:3: note: Taking true branch
                   if (cmd->chanlist[0] =3D=3D cmd->chanlist[i])
                   ^
   drivers/comedi/drivers/adv_pci1710.c:206:4: note:  Execution continues o=
n line 227
                           break;  /*  we detected a loop, stop */
                           ^
   drivers/comedi/drivers/adv_pci1710.c:229:14: note: 'i' is < field 'chanl=
ist_len'
           for (i =3D 0; i < cmd->chanlist_len; i++) {
                       ^
   drivers/comedi/drivers/adv_pci1710.c:229:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < cmd->chanlist_len; i++) {
           ^
   drivers/comedi/drivers/adv_pci1710.c:230:3: note: Taking false branch
                   if (cmd->chanlist[i] !=3D chansegment[i % seglen]) {
                   ^
   drivers/comedi/drivers/adv_pci1710.c:229:14: note: 'i' is < field 'chanl=
ist_len'
           for (i =3D 0; i < cmd->chanlist_len; i++) {
                       ^
   drivers/comedi/drivers/adv_pci1710.c:229:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < cmd->chanlist_len; i++) {
           ^
   drivers/comedi/drivers/adv_pci1710.c:230:3: note: Taking false branch
                   if (cmd->chanlist[i] !=3D chansegment[i % seglen]) {
                   ^
   drivers/comedi/drivers/adv_pci1710.c:229:37: note: The value 2 is assign=
ed to 'i'
           for (i =3D 0; i < cmd->chanlist_len; i++) {
                                              ^~~
   drivers/comedi/drivers/adv_pci1710.c:229:14: note: Assuming 'i' is < fie=
ld 'chanlist_len'
           for (i =3D 0; i < cmd->chanlist_len; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/adv_pci1710.c:229:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < cmd->chanlist_len; i++) {
           ^
   drivers/comedi/drivers/adv_pci1710.c:230:7: note: Assuming the condition=
 is true
                   if (cmd->chanlist[i] !=3D chansegment[i % seglen]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/adv_pci1710.c:230:3: note: Taking true branch
                   if (cmd->chanlist[i] !=3D chansegment[i % seglen]) {
                   ^
   drivers/comedi/drivers/adv_pci1710.c:233:8: note: The left operand of '&=
' is a garbage value
                                   i, CR_CHAN(chansegment[i]),
                                      ^
   include/linux/dev_printk.h:112:32: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                         ^~~~~~~~~~~
   drivers/comedi/drivers/../comedi.h:61:25: note: expanded from macro 'CR_=
CHAN'
   #define CR_CHAN(a)      ((a) & 0xffff)
                             ~  ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> samples/vfio-mdev/mbochs.c:326:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:326:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:356:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:356:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:432:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev);
                          ^~~   ~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:432:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev);
                          ^~~   ~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:722:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:722:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:795:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:795:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:810:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:810:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> samples/vfio-mdev/mbochs.c:811:6: warning: Value stored to 'fourcc' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 fourcc =3D dmabuf->mode.drm_format;
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:811:6: note: Value stored to 'fourcc' during =
its initialization is never read
           u32 fourcc =3D dmabuf->mode.drm_format;
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:827:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:827:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:856:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:856:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(dmabuf->mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:869:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:869:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D mdev_dev(mdev_state->mdev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:1070:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mdev_dev(mdev);
                          ^~~   ~~~~~~~~~~~~~~
   samples/vfio-mdev/mbochs.c:1070:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D mdev_dev(mdev);
                          ^~~   ~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/linux/hid.h:1004:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-multitouch.c:1310:6: note: Assuming 'rdata' is non-null
           if (!rdata) {
               ^~~~~~
   drivers/hid/hid-multitouch.c:1310:2: note: Taking false branch
           if (!rdata) {
           ^
   drivers/hid/hid-multitouch.c:1323:6: note: Assuming field 'export_all_in=
puts' is true
           if (!td->mtclass.export_all_inputs &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1323:37: note: Left side of '&&' is false
           if (!td->mtclass.export_all_inputs &&
                                              ^
   drivers/hid/hid-multitouch.c:1341:6: note: Assuming field 'application' =
is equal to HID_VD_ASUS_CUSTOM_MEDIA_KEYS
           if (field->application =3D=3D HID_VD_ASUS_CUSTOM_MEDIA_KEYS &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1341:6: note: Left side of '&&' is true
   drivers/hid/hid-multitouch.c:1342:6: note: Assuming the condition is true
               application->quirks & MT_QUIRK_ASUS_CUSTOM_UP &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1341:6: note: Left side of '&&' is true
           if (field->application =3D=3D HID_VD_ASUS_CUSTOM_MEDIA_KEYS &&
               ^
   drivers/hid/hid-multitouch.c:1343:6: note: Assuming the condition is true
               (usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_CUSTOM) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1341:2: note: Taking true branch
           if (field->application =3D=3D HID_VD_ASUS_CUSTOM_MEDIA_KEYS &&
           ^
   drivers/hid/hid-multitouch.c:1345:7: note: Assuming the condition is fal=
se
                   if (field->flags & HID_MAIN_ITEM_VARIABLE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-multitouch.c:1345:3: note: Taking false branch
                   if (field->flags & HID_MAIN_ITEM_VARIABLE)
                   ^
   drivers/hid/hid-multitouch.c:1347:3: note: Control jumps to 'case 108:' =
 at line 1352
                   switch (usage->hid & HID_USAGE) {
                   ^
   drivers/hid/hid-multitouch.c:1352:14: note: Calling 'hid_map_usage_clear'
                   case 0x6c: mt_map_key_clear(KEY_SLEEP);                 =
break;
                              ^
   drivers/hid/hid-multitouch.c:1299:29: note: expanded from macro 'mt_map_=
key_clear'
   #define mt_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1032:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:979:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:983:2: note: Control jumps to 'case 1:'  at line 992
           switch (type) {
           ^
   include/linux/hid.h:995:3: note:  Execution continues on line 1002
                   break;
                   ^
   include/linux/hid.h:1002:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1002:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1002:28: note: Assuming 'bmap' is null

vim +/dev +326 samples/vfio-mdev/mbochs.c

a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  322  =

a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  323  static void handle_mmio_write=
(struct mdev_state *mdev_state, u16 offset,
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  324  			      char *buf, u32 count)
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  325  {
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11 @326  	struct device *dev =3D mdev_=
dev(mdev_state->mdev);
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  327  	int index;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  328  	u16 reg16;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  329  =

a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  330  	switch (offset) {
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  331  	case 0x400 ... 0x41f: /* vga=
 ioports remapped */
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  332  		goto unhandled;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  333  	case 0x500 ... 0x515: /* boc=
hs dispi interface */
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  334  		if (count !=3D 2)
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  335  			goto unhandled;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  336  		index =3D (offset - 0x500) =
/ 2;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  337  		reg16 =3D *(u16 *)buf;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  338  		if (index < ARRAY_SIZE(mdev=
_state->vbe))
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  339  			mdev_state->vbe[index] =3D=
 reg16;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  340  		dev_dbg(dev, "%s: vbe write=
 %d =3D %d (%s)\n",
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  341  			__func__, index, reg16, vb=
e_name(index));
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  342  		break;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  343  	case 0x600 ... 0x607: /* qem=
u extended regs */
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  344  		goto unhandled;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  345  	default:
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  346  unhandled:
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  347  		dev_dbg(dev, "%s: @0x%03x, =
count %d (unhandled)\n",
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  348  			__func__, offset, count);
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  349  		break;
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  350  	}
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  351  }
a5e6e6505f38f7 Gerd Hoffmann 2018-05-11  352  =


:::::: The code at line 326 was first introduced by commit
:::::: a5e6e6505f38f7bce1d3576503a2bffff3fa888c sample: vfio bochs vbe disp=
lay (host device for bochs-drm)

:::::: TO: Gerd Hoffmann <kraxel@redhat.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0004749218422524091==--

