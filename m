Content-Type: multipart/mixed; boundary="===============7403357561340781859=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mailbox/pcc.c:190:6: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 23 Mar 2022 07:53:19 +0800
Message-ID: <202203230742.sacV4ntO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7403357561340781859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sudeep Holla <sudeep.holla@arm.com>
CC: Jassi Brar <jaswinder.singh@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5191290407668028179f2544a11ae9b57f0bcf07
commit: 45ec2dafb1775f7d806fbd2387e3f2cc2f56142d mailbox: pcc: Drop handlin=
g invalid bit-width in {read,write}_register
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20220321 (https://download.01.org/0day-ci/ar=
chive/20220323/202203230742.sacV4ntO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D45ec2dafb1775f7d806fbd2387e3f2cc2f56142d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 45ec2dafb1775f7d806fbd2387e3f2cc2f56142d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~
   net/9p/trans_virtio.c:408:2: note: Taking false branch
           if (uodata) {
           ^
   net/9p/trans_virtio.c:428:13: note: Assuming 'uidata' is non-null
           } else if (uidata) {
                      ^~~~~~
   net/9p/trans_virtio.c:428:9: note: Taking true branch
           } else if (uidata) {
                  ^
   net/9p/trans_virtio.c:429:11: note: Calling 'p9_get_mapped_pages'
                   int n =3D p9_get_mapped_pages(chan, &in_pages, uidata,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/9p/trans_virtio.c:319:6: note: Assuming the condition is true
           if (!iov_iter_count(data))
               ^~~~~~~~~~~~~~~~~~~~~
   net/9p/trans_virtio.c:319:2: note: Taking true branch
           if (!iov_iter_count(data))
           ^
   net/9p/trans_virtio.c:320:3: note: Returning without writing to '*offs'
                   return 0;
                   ^
   net/9p/trans_virtio.c:429:11: note: Returning from 'p9_get_mapped_pages'
                   int n =3D p9_get_mapped_pages(chan, &in_pages, uidata,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/9p/trans_virtio.c:431:7: note: 'n' is >=3D 0
                   if (n < 0) {
                       ^
   net/9p/trans_virtio.c:431:3: note: Taking false branch
                   if (n < 0) {
                   ^
   net/9p/trans_virtio.c:435:32: note: The right operand of '+' is a garbag=
e value
                   in_nr_pages =3D DIV_ROUND_UP(n + offs, PAGE_SIZE);
                                                ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:40: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                          ^
   net/9p/trans_virtio.c:475:3: warning: Value stored to 'in' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   in +=3D pack_sg_list_p(chan->sg, out + in, VIRTQUEUE_NUM,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/9p/trans_virtio.c:475:3: note: Value stored to 'in' is never read
                   in +=3D pack_sg_list_p(chan->sg, out + in, VIRTQUEUE_NUM,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/ds3000.c:588:4: warning: Value stored to 'sn=
r_value' is never read [clang-analyzer-deadcode.DeadStores]
                           snr_value =3D 0x0013;
                           ^           ~~~~~~
   drivers/media/dvb-frontends/ds3000.c:588:4: note: Value stored to 'snr_v=
alue' is never read
                           snr_value =3D 0x0013;
                           ^           ~~~~~~
   drivers/media/dvb-frontends/ds3000.c:720:28: warning: The result of the =
left shift is undefined because the left operand is negative [clang-analyze=
r-core.UndefinedBinaryOperatorResult]
           data |=3D ((d->msg_len - 1) << 3) | 0x07;
                    ~~~~~~~~~~~~~~~~ ^
   drivers/media/dvb-frontends/ds3000.c:698:2: note: Assuming 'debug' is 0
           dprintk("%s(", __func__);
           ^
   drivers/media/dvb-frontends/ds3000.c:25:7: note: expanded from macro 'dp=
rintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/ds3000.c:698:2: note: Taking false branch
           dprintk("%s(", __func__);
           ^
   drivers/media/dvb-frontends/ds3000.c:25:3: note: expanded from macro 'dp=
rintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/ds3000.c:698:2: note: Loop condition is fals=
e.  Exiting loop
           dprintk("%s(", __func__);
           ^
   drivers/media/dvb-frontends/ds3000.c:24:2: note: expanded from macro 'dp=
rintk'
           do { \
           ^
   drivers/media/dvb-frontends/ds3000.c:699:15: note: Assuming 'i' is >=3D =
field 'msg_len'
           for (i =3D 0 ; i < d->msg_len;) {
                        ^~~~~~~~~~~~~~
   drivers/media/dvb-frontends/ds3000.c:699:2: note: Loop condition is fals=
e. Execution continues on line 706
           for (i =3D 0 ; i < d->msg_len;) {
           ^
   drivers/media/dvb-frontends/ds3000.c:711:2: note: Loop condition is fals=
e. Execution continues on line 714
           for (i =3D 0; i < d->msg_len; i++)
           ^
   drivers/media/dvb-frontends/ds3000.c:720:28: note: The result of the lef=
t shift is undefined because the left operand is negative
           data |=3D ((d->msg_len - 1) << 3) | 0x07;
                    ~~~~~~~~~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/dvb-frontends/mb86a16.c:1151:3: warning: Value stored to '=
j' is never read [clang-analyzer-deadcode.DeadStores]
                   j =3D 0;
                   ^   ~
   drivers/media/dvb-frontends/mb86a16.c:1151:3: note: Value stored to 'j' =
is never read
                   j =3D 0;
                   ^   ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/mailbox/pcc.c:190:6: warning: The left expression of the compoun=
d assignment is an uninitialized value. The computed value will also be gar=
bage [clang-analyzer-core.uninitialized.Assign]
           val &=3D reg->preserve_mask;
               ^
   drivers/mailbox/pcc.c:345:9: note: Calling 'pcc_chan_reg_read_modify_wri=
te'
           return pcc_chan_reg_read_modify_write(&pchan->db);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:184:2: note: 'val' declared without an initial val=
ue
           u64 val;
           ^~~~~~~
   drivers/mailbox/pcc.c:186:8: note: Calling 'pcc_chan_reg_read'
           ret =3D pcc_chan_reg_read(reg, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:153:6: note: Assuming field 'gas' is non-null, whi=
ch participates in a condition later
           if (!reg->gas) {
               ^~~~~~~~~
   drivers/mailbox/pcc.c:153:2: note: Taking false branch
           if (!reg->gas) {
           ^
   drivers/mailbox/pcc.c:158:6: note: Assuming field 'vaddr' is non-null
           if (reg->vaddr)
               ^~~~~~~~~~
   drivers/mailbox/pcc.c:158:2: note: Taking true branch
           if (reg->vaddr)
           ^
   drivers/mailbox/pcc.c:159:3: note: Calling 'read_register'
                   read_register(reg->vaddr, val, reg->gas->bit_width);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:115:2: note: 'Default' branch taken. Execution con=
tinues on line 115
           switch (bit_width) {
           ^
   drivers/mailbox/pcc.c:129:1: note: Returning without writing to '*val'
   }
   ^
   drivers/mailbox/pcc.c:159:3: note: Returning from 'read_register'
                   read_register(reg->vaddr, val, reg->gas->bit_width);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:163:2: note: Returning without writing to '*val'
           return ret;
           ^
   drivers/mailbox/pcc.c:163:2: note: Returning zero (loaded from 'ret'), w=
hich participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/mailbox/pcc.c:186:8: note: Returning from 'pcc_chan_reg_read'
           ret =3D pcc_chan_reg_read(reg, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/pcc.c:187:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mailbox/pcc.c:187:2: note: Taking false branch
           if (ret)
           ^
   drivers/mailbox/pcc.c:190:6: note: The left expression of the compound a=
ssignment is an uninitialized value. The computed value will also be garbage
           val &=3D reg->preserve_mask;
           ~~~ ^
   Suppressed 3 warnings (3 in non-user code).
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
   net/ipv4/arp.c:603:2: warning: Null pointer passed as 2nd argument to me=
mory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(arp_ptr, src_hw, dev->addr_len);
           ^
   net/ipv4/arp.c:680:29: note: Calling '__in_dev_get_rcu'
           struct in_device *in_dev =3D __in_dev_get_rcu(dev);
                                      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/inetdevice.h:228:9: note: Left side of '||' is false
           return rcu_dereference(dev->ip_ptr);
                  ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/inetdevice.h:228:9: note: Left side of '||' is false
           return rcu_dereference(dev->ip_ptr);
                  ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)

vim +190 drivers/mailbox/pcc.c

800cda7b63f22b Sudeep Holla 2021-09-17  180  =

800cda7b63f22b Sudeep Holla 2021-09-17  181  static int pcc_chan_reg_read_m=
odify_write(struct pcc_chan_reg *reg)
800cda7b63f22b Sudeep Holla 2021-09-17  182  {
800cda7b63f22b Sudeep Holla 2021-09-17  183  	int ret =3D 0;
800cda7b63f22b Sudeep Holla 2021-09-17  184  	u64 val;
800cda7b63f22b Sudeep Holla 2021-09-17  185  =

800cda7b63f22b Sudeep Holla 2021-09-17  186  	ret =3D pcc_chan_reg_read(reg=
, &val);
800cda7b63f22b Sudeep Holla 2021-09-17  187  	if (ret)
800cda7b63f22b Sudeep Holla 2021-09-17  188  		return ret;
800cda7b63f22b Sudeep Holla 2021-09-17  189  =

800cda7b63f22b Sudeep Holla 2021-09-17 @190  	val &=3D reg->preserve_mask;
800cda7b63f22b Sudeep Holla 2021-09-17  191  	val |=3D reg->set_mask;
800cda7b63f22b Sudeep Holla 2021-09-17  192  =

800cda7b63f22b Sudeep Holla 2021-09-17  193  	return pcc_chan_reg_write(reg=
, val);
800cda7b63f22b Sudeep Holla 2021-09-17  194  }
800cda7b63f22b Sudeep Holla 2021-09-17  195  =


:::::: The code at line 190 was first introduced by commit
:::::: 800cda7b63f22be62e67142f1202d2ead2dff2e8 mailbox: pcc: Add PCC regis=
ter bundle and associated accessor functions

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Jassi Brar <jaswinder.singh@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7403357561340781859==--

