Content-Type: multipart/mixed; boundary="===============2210289853810350227=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] i2c: virtio: fix completion handling
Date: Sat, 04 Dec 2021 20:54:32 +0800
Message-ID: <202112042057.BoaGVMuC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2210289853810350227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211202153215.31796-1-vincent.whitchurch@axis.com>
References: <20211202153215.31796-1-vincent.whitchurch@axis.com>
TO: Vincent Whitchurch <vincent.whitchurch@axis.com>
TO: wsa(a)kernel.org
TO: Conghui Chen <conghui.chen@intel.com>
TO: Viresh Kumar <viresh.kumar@linaro.org>
CC: kernel(a)axis.com
CC: Vincent Whitchurch <vincent.whitchurch@axis.com>
CC: Jie Deng <jie.deng@intel.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: linux-i2c(a)vger.kernel.org
CC: virtualization(a)lists.linux-foundation.org
CC: linux-kernel(a)vger.kernel.org

Hi Vincent,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vincent-Whitchurch/i2c-vir=
tio-fix-completion-handling/20211202-233411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20211202 (https://download.01.org/0day-ci/arc=
hive/20211204/202112042057.BoaGVMuC-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6ee4a246e19d37a70be42556b=
fa2a41d3e13e00c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vincent-Whitchurch/i2c-virtio-fix-=
completion-handling/20211202-233411
        git checkout 6ee4a246e19d37a70be42556bfa2a41d3e13e00c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/pmbus/pmbus_core.c:793:6: note: 'negative' is false
           if (negative)
               ^~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:793:2: note: Taking false branch
           if (negative)
           ^
   drivers/hwmon/pmbus/pmbus_core.c:797:41: note: The result of the left sh=
ift is undefined because the left operand is negative
           return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
                                         ~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/usb/gadget/legacy/dbgp.c:364:3: warning: Value stored to 'err' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   drivers/usb/gadget/legacy/dbgp.c:364:3: note: Value stored to 'err' is n=
ever read
                   err =3D 0;
                   ^     ~
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/i2c/busses/i2c-viperboard.c:313:4: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D vprbrd_i2c_write(vb, pmsg);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-viperboard.c:313:4: note: Value stored to 'ret' i=
s never read
                           ret =3D vprbrd_i2c_write(vb, pmsg);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/i2c/busses/i2c-virtio.c:41:8: warning: Excessive padding in 'str=
uct virtio_i2c_req' (187 padding bytes, where 123 is optimal). =

   Optimal fields order: =

   in_hdr, =

   completion, =

   buf, =

   out_hdr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct virtio_i2c_req {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-virtio.c:41:8: note: Excessive padding in 'struct=
 virtio_i2c_req' (187 padding bytes, where 123 is optimal). Optimal fields =
order: in_hdr, completion, buf, out_hdr, consider reordering the fields or =
adding explicit padding members
   struct virtio_i2c_req {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/dvb-frontends/mb86a20s.c:877:3: warning: Value stored to '=
rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x52, 0x00);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:877:3: note: Value stored to 'rc'=
 is never read
   drivers/media/dvb-frontends/mb86a20s.c:903:3: warning: Value stored to '=
rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x52, 0x01);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:903:3: note: Value stored to 'rc'=
 is never read
   drivers/media/dvb-frontends/mb86a20s.c:1011:3: warning: Value stored to =
'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x5e, 0x00);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:1011:3: note: Value stored to 'rc=
' is never read
   drivers/media/dvb-frontends/mb86a20s.c:1028:3: warning: Value stored to =
'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x5e, 0x07);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:1028:3: note: Value stored to 'rc=
' is never read
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/dvb-frontends/stv0367.c:1103:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D stv0367_readbits(state, F367TER_TRL_NOMRATE_HI) * 512 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1103:2: note: Value stored to 'tem=
p' is never read
           temp =3D stv0367_readbits(state, F367TER_TRL_NOMRATE_HI) * 512 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1109:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D stv0367_readbits(state, F367TER_GAIN_SRC_HI) * 256 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1109:2: note: Value stored to 'tem=
p' is never read
           temp =3D stv0367_readbits(state, F367TER_GAIN_SRC_HI) * 256 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1530:3: warning: Value stored to '=
tber' is never read [clang-analyzer-deadcode.DeadStores]
                   tber =3D ter_state->pBER;
                   ^      ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1530:3: note: Value stored to 'tbe=
r' is never read
                   tber =3D ter_state->pBER;
                   ^      ~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/tty/nozomi.c:520:6: warning: Although the value stored to 'offse=
t' is used in the enclosing expression, the value is never actually read fr=
om 'offset' [clang-analyzer-deadcode.DeadStores]
                                   (offset +=3D dc->config_table.dl_app2_le=
n);
                                    ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/nozomi.c:520:6: note: Although the value stored to 'offset' =
is used in the enclosing expression, the value is never actually read from =
'offset'
                                   (offset +=3D dc->config_table.dl_app2_le=
n);
                                    ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/nozomi.c:555:6: warning: Although the value stored to 'offse=
t' is used in the enclosing expression, the value is never actually read fr=
om 'offset' [clang-analyzer-deadcode.DeadStores]

vim +41 drivers/i2c/busses/i2c-virtio.c

3cfc88380413d2 Jie Deng           2021-07-23  33  =

3cfc88380413d2 Jie Deng           2021-07-23  34  /**
3cfc88380413d2 Jie Deng           2021-07-23  35   * struct virtio_i2c_req =
- the virtio I2C request structure
6ee4a246e19d37 Vincent Whitchurch 2021-12-02  36   * @completion: completio=
n of virtio I2C message
3cfc88380413d2 Jie Deng           2021-07-23  37   * @out_hdr: the OUT head=
er of the virtio I2C message
3cfc88380413d2 Jie Deng           2021-07-23  38   * @buf: the buffer into =
which data is read, or from which it's written
3cfc88380413d2 Jie Deng           2021-07-23  39   * @in_hdr: the IN header=
 of the virtio I2C message
3cfc88380413d2 Jie Deng           2021-07-23  40   */
3cfc88380413d2 Jie Deng           2021-07-23 @41  struct virtio_i2c_req {
6ee4a246e19d37 Vincent Whitchurch 2021-12-02  42  	struct completion comple=
tion;
3cfc88380413d2 Jie Deng           2021-07-23  43  	struct virtio_i2c_out_hd=
r out_hdr	____cacheline_aligned;
3cfc88380413d2 Jie Deng           2021-07-23  44  	uint8_t *buf				____cach=
eline_aligned;
3cfc88380413d2 Jie Deng           2021-07-23  45  	struct virtio_i2c_in_hdr=
 in_hdr		____cacheline_aligned;
3cfc88380413d2 Jie Deng           2021-07-23  46  };
3cfc88380413d2 Jie Deng           2021-07-23  47  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2210289853810350227==--

