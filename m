Content-Type: multipart/mixed; boundary="===============0963427710581478558=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/imx-jpeg/mxc-jpeg.c:797:20: warning: The result of the left shift is undefined because the left operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Mon, 08 Nov 2021 19:52:49 +0800
Message-ID: <202111081944.DO2w9ZLd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0963427710581478558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mirela Rabulea <mirela.rabulea@nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6b75d88fa81b122cce37ebf17428a849ccd3d0f1
commit: 2db16c6ed72ce644d5639b3ed15e5817442db4ba media: imx-jpeg: Add V4L2 =
driver for i.MX8 JPEG Encoder/Decoder
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20211017 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 8ca4b3=
ef19fe82d7ad6a6e1515317dcc01b41515)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2db16c6ed72ce644d5639b3ed15e5817442db4ba
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2db16c6ed72ce644d5639b3ed15e5817442db4ba
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1420:2: note: Taking true branch
           if (retval =3D=3D -EEXIST) {
           ^
   fs/reiserfs/namei.c:1421:7: note: Assuming 'new_dentry_inode' is non-null
                   if (!new_dentry_inode) {
                       ^~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1421:3: note: Taking false branch
                   if (!new_dentry_inode) {
                   ^
   fs/reiserfs/namei.c:1440:6: note: 'new_dentry_inode' is non-null
           if (new_dentry_inode)
               ^~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1440:2: note: Taking true branch
           if (new_dentry_inode)
           ^
   fs/reiserfs/namei.c:1443:2: note: Loop condition is true.  Entering loop=
 body
           while (1) {
           ^
   fs/reiserfs/namei.c:1448:3: note: Taking false branch
                   if ((retval =3D
                   ^
   fs/reiserfs/namei.c:1474:7: note: 'retval' is equal to NAME_FOUND_INVISI=
BLE
                   if (retval !=3D NAME_FOUND_INVISIBLE && retval !=3D NAME=
_FOUND) {
                       ^~~~~~
   fs/reiserfs/namei.c:1474:38: note: Left side of '&&' is false
                   if (retval !=3D NAME_FOUND_INVISIBLE && retval !=3D NAME=
_FOUND) {
                                                      ^
   fs/reiserfs/namei.c:1486:7: note: Assuming the condition is true
                   if (S_ISDIR(old_inode->i_mode)) {
                       ^
   include/uapi/linux/stat.h:23:21: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1486:3: note: Taking true branch
                   if (S_ISDIR(old_inode->i_mode)) {
                   ^
   fs/reiserfs/namei.c:1488:9: note: Calling 'search_by_entry_key'
                                search_by_entry_key(new_dir->i_sb,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:126:2: note: Control jumps to 'case 1:'  at line 136
           switch (retval) {
           ^
   fs/reiserfs/namei.c:137:3: note:  Execution continues on line 148
                   break;
                   ^
   fs/reiserfs/namei.c:148:2: note: Calling 'set_de_item_location'
           set_de_item_location(de, path);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:67:1: note: Returning without writing to 'de->de_ent=
ry_key.on_disk_key.k_offset'
   }
   ^
   fs/reiserfs/namei.c:148:2: note: Returning from 'set_de_item_location'
           set_de_item_location(de, path);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:151:6: note: Left side of '||' is false
           if (!is_direntry_le_ih(de->de_ih) ||
               ^
   fs/reiserfs/namei.c:152:6: note: Assuming the condition is false
               COMP_SHORT_KEYS(&de->de_ih->ih_key, key)) {
               ^
   fs/reiserfs/reiserfs.h:2659:25: note: expanded from macro 'COMP_SHORT_KE=
YS'
   #define COMP_SHORT_KEYS comp_short_keys
                           ^
   fs/reiserfs/namei.c:151:2: note: Taking false branch
           if (!is_direntry_le_ih(de->de_ih) ||
           ^
   fs/reiserfs/namei.c:164:38: note: Calling 'cpu_key_k_offset'
           retval =3D bin_search_in_dir_item(de, cpu_key_k_offset(key));
                                               ^~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1586:2: note: Undefined or garbage value returned=
 to caller
           return key->on_disk_key.k_offset;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:797:20: warning: The result o=
f the left shift is undefined because the left operand is negative [clang-a=
nalyzer-core.UndefinedBinaryOperatorResult]
           desc->stm_ctrl |=3D STM_CTRL_IMAGE_FORMAT(img_fmt);
                             ^
   drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded from=
 macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                              ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:904:2: note: Loop condition i=
s false.  Exiting loop
           spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:904:2: note: Loop condition i=
s false.  Exiting loop
           spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:6: note: Assuming 'src_bu=
f' is non-null
           if (!src_buf || !dst_buf) {
               ^~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:6: note: Left side of '||=
' is false
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:18: note: Assuming 'dst_b=
uf' is non-null
           if (!src_buf || !dst_buf) {
                           ^~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:2: note: Taking false bra=
nch
           if (!src_buf || !dst_buf) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:913:7: note: 'q_data_cap' is =
non-null
           if (!q_data_cap)
                ^~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:913:2: note: Taking false bra=
nch
           if (!q_data_cap)
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:916:7: note: 'q_data_out' is =
non-null
           if (!q_data_out)
                ^~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:916:2: note: Taking false bra=
nch
           if (!q_data_out)
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:924:6: note: Assuming field '=
jpeg_parse_error' is false
           if (jpeg_src_buf->jpeg_parse_error) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:924:2: note: Taking false bra=
nch
           if (jpeg_src_buf->jpeg_parse_error) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:945:11: note: Field 'slot' is=
 < MXC_MAX_SLOTS
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
                    ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:945:2: note: Taking false bra=
nch
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:949:2: note: Taking false bra=
nch
           if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:957:6: note: Assuming field '=
mode' is not equal to MXC_JPEG_ENCODE
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:957:2: note: Taking false bra=
nch
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:964:3: note: Taking false bra=
nch
                   dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:966:3: note: Calling 'mxc_jpe=
g_config_dec_desc'
                   mxc_jpeg_config_dec_desc(&dst_buf->vb2_buf, ctx,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:795:12: note: Calling 'mxc_jp=
eg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data_cap->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:387:2: note: Control jumps to=
 the 'default' case at line 400
           switch (fourcc) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:401:3: note: Returning the va=
lue -1
                   return MXC_JPEG_INVALID;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:795:12: note: Returning from =
'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data_cap->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:795:2: note: The value -1 is =
assigned to 'img_fmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data_cap->fmt->fourcc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:797:20: note: The result of t=
he left shift is undefined because the left operand is negative
           desc->stm_ctrl |=3D STM_CTRL_IMAGE_FORMAT(img_fmt);
                             ^
   drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded from=
 macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:880:5: warning: The result of=
 the left shift is undefined because the left operand is negative [clang-an=
alyzer-core.UndefinedBinaryOperatorResult]
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded from=
 macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                              ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:904:2: note: Loop condition i=
s false.  Exiting loop
           spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:904:2: note: Loop condition i=
s false.  Exiting loop
           spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:6: note: Assuming 'src_bu=
f' is non-null
           if (!src_buf || !dst_buf) {
               ^~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:6: note: Left side of '||=
' is false
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:18: note: Assuming 'dst_b=
uf' is non-null
           if (!src_buf || !dst_buf) {
                           ^~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:2: note: Taking false bra=
nch
           if (!src_buf || !dst_buf) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:913:7: note: 'q_data_cap' is =
non-null
           if (!q_data_cap)
                ^~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:913:2: note: Taking false bra=
nch
           if (!q_data_cap)
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:916:7: note: 'q_data_out' is =
non-null
           if (!q_data_out)
                ^~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:916:2: note: Taking false bra=
nch
           if (!q_data_out)
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:924:6: note: Assuming field '=
jpeg_parse_error' is false
           if (jpeg_src_buf->jpeg_parse_error) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:924:2: note: Taking false bra=
nch
           if (jpeg_src_buf->jpeg_parse_error) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:945:11: note: Field 'slot' is=
 < MXC_MAX_SLOTS
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
                    ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:945:2: note: Taking false bra=
nch
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:949:2: note: Taking false bra=
nch
           if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:957:6: note: Assuming field '=
mode' is equal to MXC_JPEG_ENCODE
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:957:2: note: Taking true bran=
ch
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:958:3: note: Taking false bra=
nch
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:960:3: note: Calling 'mxc_jpe=
g_config_enc_desc'
                   mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:12: note: Calling 'mxc_jp=
eg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:387:2: note: Control jumps to=
 the 'default' case at line 400
           switch (fourcc) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:401:3: note: Returning the va=
lue -1
                   return MXC_JPEG_INVALID;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:12: note: Returning from =
'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:2: note: The value -1 is =
assigned to 'img_fmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:6: note: 'img_fmt' is equ=
al to MXC_JPEG_INVALID
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
               ^~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:2: note: Taking true bran=
ch
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:880:5: note: The result of th=
e left shift is undefined because the left operand is negative
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded from=
 macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:979:17: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:979:17: note: Value stored to=
 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1005:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1005:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:7: warning: Branch condi=
tion evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (!q->sizeimage[0])
                       ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1752:8: note: Calling 'mxc_jp=
eg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:16: note: Assuming field=
 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:15: note: '?' condition =
is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: Taking false br=
anch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:7: note: 'fmt' is non-nu=
ll
           if (!fmt || fmt->flags !=3D q_type) {
                ^~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:6: note: Left side of '|=
|' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:14: note: Assuming 'q_ty=
pe' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:2: note: Taking false br=
anch
           if (!fmt || fmt->flags !=3D q_type) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1668:9: note: Calling 'mxc_jp=
eg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1544:11: note: Assuming field=
 'width' is >=3D MXC_JPEG_MAX_WIDTH
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1544:10: note: '?' condition =
is false
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:11: note: Assuming field=
 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:10: note: '?' condition =
is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:14: note: Assuming 'i' i=
s >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:2: note: Loop condition =
is false. Execution continues on line 1584
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Calling 'mxc_jp=
eg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:6: note: Assuming the co=
ndition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Returning from =
'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1585:2: note: Calling 'mxc_jp=
eg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:7: note: Branch conditio=
n evaluates to a garbage value
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1451:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1451:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:1591:22: warning: Assigned va=
lue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   pfmt->bytesperline =3D tmp_q.bytesperline[i];
                                      ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1752:8: note: Calling 'mxc_jp=
eg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:16: note: Assuming field=
 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:15: note: '?' condition =
is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: Taking false br=
anch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:7: note: 'fmt' is non-nu=
ll
           if (!fmt || fmt->flags !=3D q_type) {
                ^~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:6: note: Left side of '|=
|' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:14: note: Assuming 'q_ty=
pe' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:2: note: Taking false br=
anch
           if (!fmt || fmt->flags !=3D q_type) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1668:9: note: Calling 'mxc_jp=
eg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1544:11: note: Assuming field=
 'width' is >=3D MXC_JPEG_MAX_WIDTH
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1544:10: note: '?' condition =
is false
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:11: note: Assuming field=
 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:10: note: '?' condition =
is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:14: note: Assuming 'i' i=
s < field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:2: note: Loop condition =
is true.  Entering loop body
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:14: note: Assuming 'i' i=
s >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:2: note: Loop condition =
is false. Execution continues on line 1584
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Calling 'mxc_jp=
eg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:6: note: Assuming the co=
ndition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Returning from =
'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1585:2: note: Calling 'mxc_jp=
eg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:7: note: Assuming the co=
ndition is false
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:3: note: Taking false br=
anch
                   if (!q->sizeimage[0])
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1181:7: note: Assuming the co=
ndition is false
                   if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1181:3: note: Taking false br=
anch
                   if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)

vim +797 drivers/media/platform/imx-jpeg/mxc-jpeg.c

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  768  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  769  static void mxc_jpeg_config_=
dec_desc(struct vb2_buffer *out_buf,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  770  				     struct mxc_jpeg_ctx=
 *ctx,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  771  				     struct vb2_buffer *=
src_buf,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  772  				     struct vb2_buffer *=
dst_buf)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  773  {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  774  	enum v4l2_buf_type cap_type=
 =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  775  	struct mxc_jpeg_q_data *q_d=
ata_cap;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  776  	enum mxc_jpeg_image_format =
img_fmt;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  777  	struct mxc_jpeg_dev *jpeg =
=3D ctx->mxc_jpeg;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  778  	void __iomem *reg =3D jpeg-=
>base_reg;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  779  	unsigned int slot =3D ctx->=
slot;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  780  	struct mxc_jpeg_desc *desc =
=3D jpeg->slot_data[slot].desc;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  781  	struct mxc_jpeg_desc *cfg_d=
esc =3D jpeg->slot_data[slot].cfg_desc;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  782  	dma_addr_t desc_handle =3D =
jpeg->slot_data[slot].desc_handle;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  783  	dma_addr_t cfg_desc_handle =
=3D jpeg->slot_data[slot].cfg_desc_handle;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  784  	dma_addr_t cfg_stream_handl=
e =3D jpeg->slot_data[slot].cfg_stream_handle;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  785  	unsigned int *cfg_size =3D =
&jpeg->slot_data[slot].cfg_stream_size;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  786  	void *cfg_stream_vaddr =3D =
jpeg->slot_data[slot].cfg_stream_vaddr;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  787  	struct mxc_jpeg_src_buf *jp=
eg_src_buf;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  788  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  789  	jpeg_src_buf =3D vb2_to_mxc=
_buf(src_buf);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  790  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  791  	/* setup the decoding descr=
iptor */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  792  	desc->next_descpt_ptr =3D 0=
; /* end of chain */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  793  	q_data_cap =3D mxc_jpeg_get=
_q_data(ctx, cap_type);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  794  	desc->imgsize =3D q_data_ca=
p->w_adjusted << 16 | q_data_cap->h_adjusted;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  795  	img_fmt =3D mxc_jpeg_fourcc=
_to_imgfmt(q_data_cap->fmt->fourcc);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  796  	desc->stm_ctrl &=3D ~STM_CT=
RL_IMAGE_FORMAT(0xF); /* clear image format */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11 @797  	desc->stm_ctrl |=3D STM_CTR=
L_IMAGE_FORMAT(img_fmt);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  798  	desc->line_pitch =3D q_data=
_cap->bytesperline[0];
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  799  	mxc_jpeg_addrs(desc, dst_bu=
f, src_buf, 0);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  800  	mxc_jpeg_set_bufsize(desc, =
ALIGN(vb2_plane_size(src_buf, 0), 1024));
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  801  	print_descriptor_info(jpeg-=
>dev, desc);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  802  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  803  	if (!jpeg_src_buf->dht_need=
ed) {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  804  		/* validate the decoding d=
escriptor */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  805  		mxc_jpeg_set_desc(desc_han=
dle, reg, slot);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  806  		return;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  807  	}
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  808  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  809  	/*
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  810  	 * if a default huffman tab=
le is needed, use the config descriptor to
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  811  	 * inject a DHT, by chainin=
g it before the decoding descriptor
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  812  	 */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  813  	*cfg_size =3D mxc_jpeg_setu=
p_cfg_stream(cfg_stream_vaddr,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  814  					      V4L2_PIX_FMT_YUYV,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  815  					      MXC_JPEG_MIN_WIDT=
H,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  816  					      MXC_JPEG_MIN_HEIG=
HT);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  817  	cfg_desc->next_descpt_ptr =
=3D desc_handle | MXC_NXT_DESCPT_EN;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  818  	cfg_desc->buf_base0 =3D vb2=
_dma_contig_plane_dma_addr(dst_buf, 0);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  819  	cfg_desc->buf_base1 =3D 0;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  820  	cfg_desc->imgsize =3D MXC_J=
PEG_MIN_WIDTH << 16;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  821  	cfg_desc->imgsize |=3D MXC_=
JPEG_MIN_HEIGHT;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  822  	cfg_desc->line_pitch =3D MX=
C_JPEG_MIN_WIDTH * 2;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  823  	cfg_desc->stm_ctrl =3D STM_=
CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  824  	cfg_desc->stm_bufbase =3D c=
fg_stream_handle;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  825  	cfg_desc->stm_bufsize =3D A=
LIGN(*cfg_size, 1024);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  826  	print_descriptor_info(jpeg-=
>dev, cfg_desc);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  827  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  828  	/* validate the configurati=
on descriptor */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  829  	mxc_jpeg_set_desc(cfg_desc_=
handle, reg, slot);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  830  }
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  831  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  832  static void mxc_jpeg_config_=
enc_desc(struct vb2_buffer *out_buf,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  833  				     struct mxc_jpeg_ctx=
 *ctx,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  834  				     struct vb2_buffer *=
src_buf,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  835  				     struct vb2_buffer *=
dst_buf)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  836  {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  837  	struct mxc_jpeg_dev *jpeg =
=3D ctx->mxc_jpeg;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  838  	void __iomem *reg =3D jpeg-=
>base_reg;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  839  	unsigned int slot =3D ctx->=
slot;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  840  	struct mxc_jpeg_desc *desc =
=3D jpeg->slot_data[slot].desc;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  841  	struct mxc_jpeg_desc *cfg_d=
esc =3D jpeg->slot_data[slot].cfg_desc;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  842  	dma_addr_t desc_handle =3D =
jpeg->slot_data[slot].desc_handle;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  843  	dma_addr_t cfg_desc_handle =
=3D jpeg->slot_data[slot].cfg_desc_handle;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  844  	void *cfg_stream_vaddr =3D =
jpeg->slot_data[slot].cfg_stream_vaddr;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  845  	struct mxc_jpeg_q_data *q_d=
ata;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  846  	enum mxc_jpeg_image_format =
img_fmt;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  847  	int w, h;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  848  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  849  	q_data =3D mxc_jpeg_get_q_d=
ata(ctx, src_buf->vb2_queue->type);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  850  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  851  	jpeg->slot_data[slot].cfg_s=
tream_size =3D
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  852  			mxc_jpeg_setup_cfg_stream=
(cfg_stream_vaddr,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  853  						  q_data->fmt->fourcc,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  854  						  q_data->w_adjusted,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  855  						  q_data->h_adjusted);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  856  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  857  	/* chain the config descrip=
tor with the encoding descriptor */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  858  	cfg_desc->next_descpt_ptr =
=3D desc_handle | MXC_NXT_DESCPT_EN;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  859  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  860  	cfg_desc->buf_base0 =3D jpe=
g->slot_data[slot].cfg_stream_handle;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  861  	cfg_desc->buf_base1 =3D 0;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  862  	cfg_desc->line_pitch =3D 0;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  863  	cfg_desc->stm_bufbase =3D 0=
; /* no output expected */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  864  	cfg_desc->stm_bufsize =3D 0=
x0;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  865  	cfg_desc->imgsize =3D 0;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  866  	cfg_desc->stm_ctrl =3D STM_=
CTRL_CONFIG_MOD(1);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  867  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  868  	desc->next_descpt_ptr =3D 0=
; /* end of chain */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  869  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  870  	/* use adjusted resolution =
for CAST IP job */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  871  	w =3D q_data->w_adjusted;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  872  	h =3D q_data->h_adjusted;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  873  	mxc_jpeg_set_res(desc, w, h=
);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  874  	mxc_jpeg_set_line_pitch(des=
c, w * (q_data->fmt->depth / 8));
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  875  	mxc_jpeg_set_bufsize(desc, =
desc->line_pitch * h);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  876  	img_fmt =3D mxc_jpeg_fourcc=
_to_imgfmt(q_data->fmt->fourcc);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  877  	if (img_fmt =3D=3D MXC_JPEG=
_INVALID)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  878  		dev_err(jpeg->dev, "No val=
id image format detected\n");
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  879  	desc->stm_ctrl =3D STM_CTRL=
_CONFIG_MOD(0) |
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  880  			 STM_CTRL_IMAGE_FORMAT(im=
g_fmt);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  881  	mxc_jpeg_addrs(desc, src_bu=
f, dst_buf, 0);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  882  	dev_dbg(jpeg->dev, "cfg_des=
c:\n");
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  883  	print_descriptor_info(jpeg-=
>dev, cfg_desc);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  884  	dev_dbg(jpeg->dev, "enc des=
c:\n");
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  885  	print_descriptor_info(jpeg-=
>dev, desc);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  886  	print_wrapper_info(jpeg->de=
v, reg);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  887  	print_cast_status(jpeg->dev=
, reg, MXC_JPEG_ENCODE);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  888  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  889  	/* validate the configurati=
on descriptor */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  890  	mxc_jpeg_set_desc(cfg_desc_=
handle, reg, slot);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  891  }
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  892  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  893  static void mxc_jpeg_device_=
run(void *priv)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  894  {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  895  	struct mxc_jpeg_ctx *ctx =
=3D priv;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  896  	struct mxc_jpeg_dev *jpeg =
=3D ctx->mxc_jpeg;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  897  	void __iomem *reg =3D jpeg-=
>base_reg;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  898  	struct device *dev =3D jpeg=
->dev;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  899  	struct vb2_v4l2_buffer *src=
_buf, *dst_buf;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  900  	unsigned long flags;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  901  	struct mxc_jpeg_q_data *q_d=
ata_cap, *q_data_out;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  902  	struct mxc_jpeg_src_buf *jp=
eg_src_buf;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  903  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  904  	spin_lock_irqsave(&ctx->mxc=
_jpeg->hw_lock, flags);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  905  	src_buf =3D v4l2_m2m_next_s=
rc_buf(ctx->fh.m2m_ctx);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  906  	dst_buf =3D v4l2_m2m_next_d=
st_buf(ctx->fh.m2m_ctx);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  907  	if (!src_buf || !dst_buf) {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  908  		dev_err(dev, "Null src or =
dst buf\n");
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  909  		goto end;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  910  	}
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  911  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  912  	q_data_cap =3D mxc_jpeg_get=
_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  913  	if (!q_data_cap)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  914  		goto end;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  915  	q_data_out =3D mxc_jpeg_get=
_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  916  	if (!q_data_out)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  917  		goto end;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  918  	src_buf->sequence =3D q_dat=
a_out->sequence++;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  919  	dst_buf->sequence =3D q_dat=
a_cap->sequence++;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  920  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  921  	v4l2_m2m_buf_copy_metadata(=
src_buf, dst_buf, true);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  922  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  923  	jpeg_src_buf =3D vb2_to_mxc=
_buf(&src_buf->vb2_buf);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  924  	if (jpeg_src_buf->jpeg_pars=
e_error) {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  925  		jpeg->slot_data[ctx->slot]=
.used =3D false;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  926  		v4l2_m2m_src_buf_remove(ct=
x->fh.m2m_ctx);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  927  		v4l2_m2m_dst_buf_remove(ct=
x->fh.m2m_ctx);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  928  		v4l2_m2m_buf_done(src_buf,=
 VB2_BUF_STATE_ERROR);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  929  		v4l2_m2m_buf_done(dst_buf,=
 VB2_BUF_STATE_ERROR);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  930  		spin_unlock_irqrestore(&ct=
x->mxc_jpeg->hw_lock, flags);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  931  		v4l2_m2m_job_finish(jpeg->=
m2m_dev, ctx->fh.m2m_ctx);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  932  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  933  		return;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  934  	}
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  935  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  936  	/*
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  937  	 * TODO: this reset should =
be removed, once we figure out
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  938  	 * how to overcome hardware=
 issues both on encoder and decoder
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  939  	 */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  940  	mxc_jpeg_sw_reset(reg);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  941  	mxc_jpeg_enable(reg);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  942  	mxc_jpeg_set_l_endian(reg, =
1);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  943  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  944  	ctx->slot =3D mxc_get_free_=
slot(jpeg->slot_data, MXC_MAX_SLOTS);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  945  	if (ctx->slot >=3D MXC_MAX_=
SLOTS) {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  946  		dev_err(dev, "No more free=
 slots\n");
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  947  		goto end;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  948  	}
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  949  	if (!mxc_jpeg_alloc_slot_da=
ta(jpeg, ctx->slot)) {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  950  		dev_err(dev, "Canot alloca=
te slot data\n");
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  951  		goto end;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  952  	}
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  953  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  954  	mxc_jpeg_enable_slot(reg, c=
tx->slot);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  955  	mxc_jpeg_enable_irq(reg, ct=
x->slot);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  956  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  957  	if (jpeg->mode =3D=3D MXC_J=
PEG_ENCODE) {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  958  		dev_dbg(dev, "Encoding on =
slot %d\n", ctx->slot);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  959  		ctx->enc_state =3D MXC_JPE=
G_ENC_CONF;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  960  		mxc_jpeg_config_enc_desc(&=
dst_buf->vb2_buf, ctx,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  961  					 &src_buf->vb2_buf, &ds=
t_buf->vb2_buf);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  962  		mxc_jpeg_enc_mode_conf(dev=
, reg); /* start config phase */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  963  	} else {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  964  		dev_dbg(dev, "Decoding on =
slot %d\n", ctx->slot);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  965  		print_mxc_buf(jpeg, &src_b=
uf->vb2_buf, 0);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  966  		mxc_jpeg_config_dec_desc(&=
dst_buf->vb2_buf, ctx,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  967  					 &src_buf->vb2_buf, &ds=
t_buf->vb2_buf);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  968  		mxc_jpeg_dec_mode_go(dev, =
reg);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  969  	}
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  970  end:
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  971  	spin_unlock_irqrestore(&ctx=
->mxc_jpeg->hw_lock, flags);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  972  }
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  973  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  974  static int mxc_jpeg_decoder_=
cmd(struct file *file, void *priv,
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  975  				struct v4l2_decoder_cmd =
*cmd)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  976  {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  977  	struct v4l2_fh *fh =3D file=
->private_data;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  978  	struct mxc_jpeg_ctx *ctx =
=3D mxc_jpeg_fh_to_ctx(fh);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11 @979  	struct device *dev =3D ctx-=
>mxc_jpeg->dev;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  980  	int ret;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  981  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  982  	ret =3D v4l2_m2m_ioctl_try_=
decoder_cmd(file, fh, cmd);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  983  	if (ret < 0)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  984  		return ret;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  985  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  986  	if (cmd->cmd =3D=3D V4L2_DE=
C_CMD_STOP) {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  987  		dev_dbg(dev, "Received V4L=
2_DEC_CMD_STOP");
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  988  		if (v4l2_m2m_num_src_bufs_=
ready(fh->m2m_ctx) =3D=3D 0) {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  989  			/* No more src bufs, noti=
fy app EOS */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  990  			notify_eos(ctx);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  991  		} else {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  992  			/* will send EOS later*/
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  993  			ctx->stopping =3D 1;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  994  		}
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  995  	}
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  996  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  997  	return 0;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  998  }
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  999  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0963427710581478558==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0963427710581478558==--

