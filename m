Content-Type: multipart/mixed; boundary="===============7347995479625446903=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/../../../virt/kvm/binary_stats.c:139:3: warning: Value stored to 'remain' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 10 Aug 2021 03:59:10 +0800
Message-ID: <202108100300.KhG8IeJu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7347995479625446903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jing Zhang <jingzhangos@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: David Matlack <dmatlack@google.com>
CC: Ricardo Koller <ricarkol@google.com>
CC: Krish Sadhukhan <krish.sadhukhan@oracle.com>
CC: Fuad Tabba <tabba@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   36a21d51725af2ce0700c6ebcb6b9594aac658a6
commit: cb082bfab59a224a49ae803fed52cd03e8d6b5e0 KVM: stats: Add fd-based A=
PI to read binary stats data
date:   7 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-c001-20210806 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 42b9c2=
a17a0b63cccf3ac197a82f91b28e53e643)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcb082bfab59a224a49ae803fed52cd03e8d6b5e0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cb082bfab59a224a49ae803fed52cd03e8d6b5e0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:206:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:207:34: warning: Value store=
d to 'c' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:207:34: note: Value stored t=
o 'c' during its initialization is never read
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:220:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:220:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:236:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:236:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:252:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:252:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:253:34: warning: Value store=
d to 'c' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:253:34: note: Value stored t=
o 'c' during its initialization is never read
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:270:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:270:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:297:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:297:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:323:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:323:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:413:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:413:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:425:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:425:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:439:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:439:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:455:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:455:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   arch/x86/kvm/../../../virt/kvm/eventfd.c:385:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   arch/x86/kvm/../../../virt/kvm/eventfd.c:385:2: note: Value stored to 'r=
et' is never read
           ret =3D 0;
           ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> arch/x86/kvm/../../../virt/kvm/binary_stats.c:139:3: warning: Value stor=
ed to 'remain' is never read [clang-analyzer-deadcode.DeadStores]
                   remain -=3D copylen;
                   ^         ~~~~~~~
   arch/x86/kvm/../../../virt/kvm/binary_stats.c:139:3: note: Value stored =
to 'remain' is never read
                   remain -=3D copylen;
                   ^         ~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/binary_stats.c:141:3: warning: Value stor=
ed to 'dest' is never read [clang-analyzer-deadcode.DeadStores]
                   dest +=3D copylen;
                   ^       ~~~~~~~
   arch/x86/kvm/../../../virt/kvm/binary_stats.c:141:3: note: Value stored =
to 'dest' is never read
                   dest +=3D copylen;
                   ^       ~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   arch/x86/kvm/emulate.c:1521:9: warning: 2nd function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           return linear_read_system(ctxt, *desc_addr_p, desc, sizeof(*desc=
));
                  ^
   arch/x86/kvm/emulate.c:3671:6: note: Assuming field 'modrm_reg' is not e=
qual to VCPU_SREG_CS
           if (ctxt->modrm_reg =3D=3D VCPU_SREG_CS || ctxt->modrm_reg > VCP=
U_SREG_GS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:3671:6: note: Left side of '||' is false
   arch/x86/kvm/emulate.c:3671:41: note: Assuming field 'modrm_reg' is <=3D=
 VCPU_SREG_GS
           if (ctxt->modrm_reg =3D=3D VCPU_SREG_CS || ctxt->modrm_reg > VCP=
U_SREG_GS)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kvm/emulate.c:3671:2: note: Taking false branch
           if (ctxt->modrm_reg =3D=3D VCPU_SREG_CS || ctxt->modrm_reg > VCP=
U_SREG_GS)
           ^
   arch/x86/kvm/emulate.c:3674:6: note: Assuming field 'modrm_reg' is not e=
qual to VCPU_SREG_SS
           if (ctxt->modrm_reg =3D=3D VCPU_SREG_SS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:3674:2: note: Taking false branch
           if (ctxt->modrm_reg =3D=3D VCPU_SREG_SS)
           ^
   arch/x86/kvm/emulate.c:3679:9: note: Calling 'load_segment_descriptor'
           return load_segment_descriptor(ctxt, sel, ctxt->modrm_reg);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1727:6: note: 'seg' is not equal to VCPU_SREG_SS
           if (seg =3D=3D VCPU_SREG_SS && selector =3D=3D 3 &&
               ^~~
   arch/x86/kvm/emulate.c:1727:26: note: Left side of '&&' is false
           if (seg =3D=3D VCPU_SREG_SS && selector =3D=3D 3 &&
                                   ^
   arch/x86/kvm/emulate.c:1731:9: note: Calling '__load_segment_descriptor'
           return __load_segment_descriptor(ctxt, selector, seg, cpl,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1547:23: note: Assuming the condition is false
           bool null_selector =3D !(selector & ~0x3); /* 0000-0003 are null=
 */
                                ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1548:2: note: 'desc_addr' declared without an ini=
tial value
           ulong desc_addr;
           ^~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1555:6: note: Assuming field 'mode' is not equal =
to X86EMUL_MODE_REAL
           if (ctxt->mode =3D=3D X86EMUL_MODE_REAL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1555:2: note: Taking false branch
           if (ctxt->mode =3D=3D X86EMUL_MODE_REAL) {
           ^
   arch/x86/kvm/emulate.c:1561:13: note: 'seg' is <=3D VCPU_SREG_GS
           } else if (seg <=3D VCPU_SREG_GS && ctxt->mode =3D=3D X86EMUL_MO=
DE_VM86) {
                      ^~~
   arch/x86/kvm/emulate.c:1561:13: note: Left side of '&&' is true
   arch/x86/kvm/emulate.c:1561:36: note: Assuming field 'mode' is not equal=
 to X86EMUL_MODE_VM86
           } else if (seg <=3D VCPU_SREG_GS && ctxt->mode =3D=3D X86EMUL_MO=
DE_VM86) {
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1561:9: note: Taking false branch
           } else if (seg <=3D VCPU_SREG_GS && ctxt->mode =3D=3D X86EMUL_MO=
DE_VM86) {
                  ^
   arch/x86/kvm/emulate.c:1575:6: note: 'seg' is not equal to VCPU_SREG_TR
           if (seg =3D=3D VCPU_SREG_TR && (selector & (1 << 2)))
               ^~~
   arch/x86/kvm/emulate.c:1575:26: note: Left side of '&&' is false
           if (seg =3D=3D VCPU_SREG_TR && (selector & (1 << 2)))
                                   ^
   arch/x86/kvm/emulate.c:1579:6: note: 'null_selector' is false
           if (null_selector) {
               ^~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1579:2: note: Taking false branch
           if (null_selector) {
           ^
   arch/x86/kvm/emulate.c:1603:8: note: Calling 'read_segment_descriptor'
           ret =3D read_segment_descriptor(ctxt, selector, &seg_desc, &desc=
_addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   arch/x86/kvm/emulate.c:1517:7: note: Calling 'get_descriptor_ptr'
           rc =3D get_descriptor_ptr(ctxt, selector, desc_addr_p);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1491:6: note: Assuming the condition is true
           if (dt.size < index * 8 + 7)
               ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1491:2: note: Taking true branch
           if (dt.size < index * 8 + 7)
           ^
   arch/x86/kvm/emulate.c:1517:7: note: Returning from 'get_descriptor_ptr'
           rc =3D get_descriptor_ptr(ctxt, selector, desc_addr_p);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1518:6: note: Assuming 'rc' is equal to X86EMUL_C=
ONTINUE
           if (rc !=3D X86EMUL_CONTINUE)
               ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/emulate.c:1518:2: note: Taking false branch
           if (rc !=3D X86EMUL_CONTINUE)
           ^

vim +/remain +139 arch/x86/kvm/../../../virt/kvm/binary_stats.c

cb082bfab59a224 Jing Zhang 2021-06-18   12  =

cb082bfab59a224 Jing Zhang 2021-06-18   13  /**
cb082bfab59a224 Jing Zhang 2021-06-18   14   * kvm_stats_read() - Common fu=
nction to read from the binary statistics
cb082bfab59a224 Jing Zhang 2021-06-18   15   * file descriptor.
cb082bfab59a224 Jing Zhang 2021-06-18   16   *
cb082bfab59a224 Jing Zhang 2021-06-18   17   * @id: identification string o=
f the stats
cb082bfab59a224 Jing Zhang 2021-06-18   18   * @header: stats header for a =
vm or a vcpu
cb082bfab59a224 Jing Zhang 2021-06-18   19   * @desc: start address of an a=
rray of stats descriptors for a vm or a vcpu
cb082bfab59a224 Jing Zhang 2021-06-18   20   * @stats: start address of sta=
ts data block for a vm or a vcpu
cb082bfab59a224 Jing Zhang 2021-06-18   21   * @size_stats: the size of sta=
ts data block pointed by @stats
cb082bfab59a224 Jing Zhang 2021-06-18   22   * @user_buffer: start address =
of userspace buffer
cb082bfab59a224 Jing Zhang 2021-06-18   23   * @size: requested read size f=
rom userspace
cb082bfab59a224 Jing Zhang 2021-06-18   24   * @offset: the start position =
from which the content will be read for the
cb082bfab59a224 Jing Zhang 2021-06-18   25   *          corresponding vm or=
 vcp file descriptor
cb082bfab59a224 Jing Zhang 2021-06-18   26   *
cb082bfab59a224 Jing Zhang 2021-06-18   27   * The file content of a vm/vcp=
u file descriptor is now defined as below:
cb082bfab59a224 Jing Zhang 2021-06-18   28   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   29   * |   Header    |
cb082bfab59a224 Jing Zhang 2021-06-18   30   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   31   * |  id string  |
cb082bfab59a224 Jing Zhang 2021-06-18   32   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   33   * | Descriptors |
cb082bfab59a224 Jing Zhang 2021-06-18   34   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   35   * | Stats Data  |
cb082bfab59a224 Jing Zhang 2021-06-18   36   * +-------------+
cb082bfab59a224 Jing Zhang 2021-06-18   37   * Although this function allow=
s userspace to read any amount of data (as long
cb082bfab59a224 Jing Zhang 2021-06-18   38   * as in the limit) from any po=
sition, the typical usage would follow below
cb082bfab59a224 Jing Zhang 2021-06-18   39   * steps:
cb082bfab59a224 Jing Zhang 2021-06-18   40   * 1. Read header from offset 0=
. Get the offset of descriptors and stats data
cb082bfab59a224 Jing Zhang 2021-06-18   41   *    and some other necessary =
information. This is a one-time work for the
cb082bfab59a224 Jing Zhang 2021-06-18   42   *    lifecycle of the correspo=
nding vm/vcpu stats fd.
cb082bfab59a224 Jing Zhang 2021-06-18   43   * 2. Read id string from its o=
ffset. This is a one-time work for the lifecycle
cb082bfab59a224 Jing Zhang 2021-06-18   44   *    of the corresponding vm/v=
cpu stats fd.
cb082bfab59a224 Jing Zhang 2021-06-18   45   * 3. Read descriptors from its=
 offset and discover all the stats by parsing
cb082bfab59a224 Jing Zhang 2021-06-18   46   *    descriptors. This is a on=
e-time work for the lifecycle of the
cb082bfab59a224 Jing Zhang 2021-06-18   47   *    corresponding vm/vcpu sta=
ts fd.
cb082bfab59a224 Jing Zhang 2021-06-18   48   * 4. Periodically read stats d=
ata from its offset using pread.
cb082bfab59a224 Jing Zhang 2021-06-18   49   *
cb082bfab59a224 Jing Zhang 2021-06-18   50   * Return: the number of bytes =
that has been successfully read
cb082bfab59a224 Jing Zhang 2021-06-18   51   */
cb082bfab59a224 Jing Zhang 2021-06-18   52  ssize_t kvm_stats_read(char *id=
, const struct kvm_stats_header *header,
cb082bfab59a224 Jing Zhang 2021-06-18   53  		       const struct _kvm_stat=
s_desc *desc,
cb082bfab59a224 Jing Zhang 2021-06-18   54  		       void *stats, size_t si=
ze_stats,
cb082bfab59a224 Jing Zhang 2021-06-18   55  		       char __user *user_buff=
er, size_t size, loff_t *offset)
cb082bfab59a224 Jing Zhang 2021-06-18   56  {
cb082bfab59a224 Jing Zhang 2021-06-18   57  	ssize_t len;
cb082bfab59a224 Jing Zhang 2021-06-18   58  	ssize_t copylen;
cb082bfab59a224 Jing Zhang 2021-06-18   59  	ssize_t remain =3D size;
cb082bfab59a224 Jing Zhang 2021-06-18   60  	size_t size_desc;
cb082bfab59a224 Jing Zhang 2021-06-18   61  	size_t size_header;
cb082bfab59a224 Jing Zhang 2021-06-18   62  	void *src;
cb082bfab59a224 Jing Zhang 2021-06-18   63  	loff_t pos =3D *offset;
cb082bfab59a224 Jing Zhang 2021-06-18   64  	char __user *dest =3D user_buf=
fer;
cb082bfab59a224 Jing Zhang 2021-06-18   65  =

cb082bfab59a224 Jing Zhang 2021-06-18   66  	size_header =3D sizeof(*header=
);
cb082bfab59a224 Jing Zhang 2021-06-18   67  	size_desc =3D header->num_desc=
 * sizeof(*desc);
cb082bfab59a224 Jing Zhang 2021-06-18   68  =

cb082bfab59a224 Jing Zhang 2021-06-18   69  	len =3D KVM_STATS_NAME_SIZE + =
size_header + size_desc + size_stats - pos;
cb082bfab59a224 Jing Zhang 2021-06-18   70  	len =3D min(len, remain);
cb082bfab59a224 Jing Zhang 2021-06-18   71  	if (len <=3D 0)
cb082bfab59a224 Jing Zhang 2021-06-18   72  		return 0;
cb082bfab59a224 Jing Zhang 2021-06-18   73  	remain =3D len;
cb082bfab59a224 Jing Zhang 2021-06-18   74  =

cb082bfab59a224 Jing Zhang 2021-06-18   75  	/*
cb082bfab59a224 Jing Zhang 2021-06-18   76  	 * Copy kvm stats header.
cb082bfab59a224 Jing Zhang 2021-06-18   77  	 * The header is the first blo=
ck of content userspace usually read out.
cb082bfab59a224 Jing Zhang 2021-06-18   78  	 * The pos is 0 and the copyle=
n and remain would be the size of header.
cb082bfab59a224 Jing Zhang 2021-06-18   79  	 * The copy of the header woul=
d be skipped if offset is larger than the
cb082bfab59a224 Jing Zhang 2021-06-18   80  	 * size of header. That usuall=
y happens when userspace reads stats
cb082bfab59a224 Jing Zhang 2021-06-18   81  	 * descriptors and stats data.
cb082bfab59a224 Jing Zhang 2021-06-18   82  	 */
cb082bfab59a224 Jing Zhang 2021-06-18   83  	copylen =3D size_header - pos;
cb082bfab59a224 Jing Zhang 2021-06-18   84  	copylen =3D min(copylen, remai=
n);
cb082bfab59a224 Jing Zhang 2021-06-18   85  	if (copylen > 0) {
cb082bfab59a224 Jing Zhang 2021-06-18   86  		src =3D (void *)header + pos;
cb082bfab59a224 Jing Zhang 2021-06-18   87  		if (copy_to_user(dest, src, c=
opylen))
cb082bfab59a224 Jing Zhang 2021-06-18   88  			return -EFAULT;
cb082bfab59a224 Jing Zhang 2021-06-18   89  		remain -=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18   90  		pos +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18   91  		dest +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18   92  	}
cb082bfab59a224 Jing Zhang 2021-06-18   93  =

cb082bfab59a224 Jing Zhang 2021-06-18   94  	/*
cb082bfab59a224 Jing Zhang 2021-06-18   95  	 * Copy kvm stats header id st=
ring.
cb082bfab59a224 Jing Zhang 2021-06-18   96  	 * The id string is unique for=
 every vm/vcpu, which is stored in kvm
cb082bfab59a224 Jing Zhang 2021-06-18   97  	 * and kvm_vcpu structure.
cb082bfab59a224 Jing Zhang 2021-06-18   98  	 * The id string is part of th=
e stat header from the perspective of
cb082bfab59a224 Jing Zhang 2021-06-18   99  	 * userspace, it is usually re=
ad out together with previous constant
cb082bfab59a224 Jing Zhang 2021-06-18  100  	 * header part and could be sk=
ipped for later descriptors and stats
cb082bfab59a224 Jing Zhang 2021-06-18  101  	 * data readings.
cb082bfab59a224 Jing Zhang 2021-06-18  102  	 */
cb082bfab59a224 Jing Zhang 2021-06-18  103  	copylen =3D header->id_offset =
+ KVM_STATS_NAME_SIZE - pos;
cb082bfab59a224 Jing Zhang 2021-06-18  104  	copylen =3D min(copylen, remai=
n);
cb082bfab59a224 Jing Zhang 2021-06-18  105  	if (copylen > 0) {
cb082bfab59a224 Jing Zhang 2021-06-18  106  		src =3D id + pos - header->id=
_offset;
cb082bfab59a224 Jing Zhang 2021-06-18  107  		if (copy_to_user(dest, src, c=
opylen))
cb082bfab59a224 Jing Zhang 2021-06-18  108  			return -EFAULT;
cb082bfab59a224 Jing Zhang 2021-06-18  109  		remain -=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  110  		pos +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  111  		dest +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  112  	}
cb082bfab59a224 Jing Zhang 2021-06-18  113  =

cb082bfab59a224 Jing Zhang 2021-06-18  114  	/*
cb082bfab59a224 Jing Zhang 2021-06-18  115  	 * Copy kvm stats descriptors.
cb082bfab59a224 Jing Zhang 2021-06-18  116  	 * The descriptors copy would =
be skipped in the typical case that
cb082bfab59a224 Jing Zhang 2021-06-18  117  	 * userspace periodically read=
 stats data, since the pos would be
cb082bfab59a224 Jing Zhang 2021-06-18  118  	 * greater than the end addres=
s of descriptors
cb082bfab59a224 Jing Zhang 2021-06-18  119  	 * (header->header.desc_offset=
 + size_desc) causing copylen <=3D 0.
cb082bfab59a224 Jing Zhang 2021-06-18  120  	 */
cb082bfab59a224 Jing Zhang 2021-06-18  121  	copylen =3D header->desc_offse=
t + size_desc - pos;
cb082bfab59a224 Jing Zhang 2021-06-18  122  	copylen =3D min(copylen, remai=
n);
cb082bfab59a224 Jing Zhang 2021-06-18  123  	if (copylen > 0) {
cb082bfab59a224 Jing Zhang 2021-06-18  124  		src =3D (void *)desc + pos - =
header->desc_offset;
cb082bfab59a224 Jing Zhang 2021-06-18  125  		if (copy_to_user(dest, src, c=
opylen))
cb082bfab59a224 Jing Zhang 2021-06-18  126  			return -EFAULT;
cb082bfab59a224 Jing Zhang 2021-06-18  127  		remain -=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  128  		pos +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  129  		dest +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  130  	}
cb082bfab59a224 Jing Zhang 2021-06-18  131  =

cb082bfab59a224 Jing Zhang 2021-06-18  132  	/* Copy kvm stats values */
cb082bfab59a224 Jing Zhang 2021-06-18  133  	copylen =3D header->data_offse=
t + size_stats - pos;
cb082bfab59a224 Jing Zhang 2021-06-18  134  	copylen =3D min(copylen, remai=
n);
cb082bfab59a224 Jing Zhang 2021-06-18  135  	if (copylen > 0) {
cb082bfab59a224 Jing Zhang 2021-06-18  136  		src =3D stats + pos - header-=
>data_offset;
cb082bfab59a224 Jing Zhang 2021-06-18  137  		if (copy_to_user(dest, src, c=
opylen))
cb082bfab59a224 Jing Zhang 2021-06-18  138  			return -EFAULT;
cb082bfab59a224 Jing Zhang 2021-06-18 @139  		remain -=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18  140  		pos +=3D copylen;
cb082bfab59a224 Jing Zhang 2021-06-18 @141  		dest +=3D copylen;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7347995479625446903==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
YLpI5D+rzCaIUcNmr/8HAvitCXW8AQA=
--===============7347995479625446903==--

