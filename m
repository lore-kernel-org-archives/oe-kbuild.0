Content-Type: multipart/mixed; boundary="===============3206475247291263383=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/3] clocksource: Ingenic: Add SMP/SMT support for sysost driver.
Date: Sun, 06 Feb 2022 23:34:13 +0800
Message-ID: <202202062351.QH1OpvUh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3206475247291263383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <1643957682-39450-4-git-send-email-zhouyanjie@wanyeetech.com>
References: <1643957682-39450-4-git-send-email-zhouyanjie@wanyeetech.com>
TO: "=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)" <zhouyanjie@wanyeetech.co=
m>

Hi "=E5=91=A8=E7=90=B0=E6=9D=B0,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on robh/for-next v5.17-rc2 next-20220204]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhou-Yanjie/Add-SMP-SMT-su=
pport-for-Ingenic-sysost-driver/20220204-145627
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 35e13e9=
da9afbce13c1d36465504ece4e65f24fe
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220206 (https://download.01.org/0day-ci/arc=
hive/20220206/202202062351.QH1OpvUh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5=
a44925592c764c59219b0024ee06317028)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/f2b83a99eb3a0530a50a43d34=
584e76efee0952c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zhou-Yanjie/Add-SMP-SMT-support-fo=
r-Ingenic-sysost-driver/20220204-145627
        git checkout f2b83a99eb3a0530a50a43d34584e76efee0952c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/spi/spi-rspi.c:774:10: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
                           *rx++ =3D rspi_read_data(rspi);
                                 ^
   drivers/spi/spi-rspi.c:864:6: note: Assuming the condition is true
           if (spi->mode & SPI_LOOP) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-rspi.c:864:2: note: Taking true branch
           if (spi->mode & SPI_LOOP) {
           ^
   drivers/spi/spi-rspi.c:865:10: note: Calling 'qspi_transfer_out_in'
                   return qspi_transfer_out_in(rspi, xfer);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-rspi.c:790:2: note: Taking false branch
           if (ret !=3D -EAGAIN)
           ^
   drivers/spi/spi-rspi.c:793:9: note: Calling 'qspi_trigger_transfer_out_i=
n'
           return qspi_trigger_transfer_out_in(rspi, xfer->tx_buf,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-rspi.c:757:9: note: 'len' is > 0
           while (len > 0) {
                  ^~~
   drivers/spi/spi-rspi.c:757:2: note: Loop condition is true.  Entering lo=
op body
           while (len > 0) {
           ^
   drivers/spi/spi-rspi.c:761:7: note: 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~
   drivers/spi/spi-rspi.c:761:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   drivers/spi/spi-rspi.c:765:15: note: 'i' is < 'n'
                   for (i =3D 0; i < n; i++)
                               ^
   drivers/spi/spi-rspi.c:765:3: note: Loop condition is true.  Entering lo=
op body
                   for (i =3D 0; i < n; i++)
                   ^
   drivers/spi/spi-rspi.c:765:15: note: Assuming 'i' is >=3D 'n'
                   for (i =3D 0; i < n; i++)
                               ^~~~~
   drivers/spi/spi-rspi.c:765:3: note: Loop condition is false. Execution c=
ontinues on line 768
                   for (i =3D 0; i < n; i++)
                   ^
   drivers/spi/spi-rspi.c:769:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/spi/spi-rspi.c:769:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   drivers/spi/spi-rspi.c:773:15: note: 'i' is < 'n'
                   for (i =3D 0; i < n; i++)
                               ^
   drivers/spi/spi-rspi.c:773:3: note: Loop condition is true.  Entering lo=
op body
                   for (i =3D 0; i < n; i++)
                   ^
   drivers/spi/spi-rspi.c:774:5: note: Null pointer value stored to 'rx'
                           *rx++ =3D rspi_read_data(rspi);
                            ^~~~
   drivers/spi/spi-rspi.c:774:10: note: Dereference of null pointer
                           *rx++ =3D rspi_read_data(rspi);
                           ~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
>> drivers/clocksource/ingenic-sysost.c:92:8: warning: Excessive padding in=
 'struct ingenic_ost_timer' (76 padding bytes, where 12 is optimal). =

   Optimal fields order: =

   cevt, =

   base, =

   ost, =

   clk, =

   cpu, =

   channel, =

   name, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ingenic_ost_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/clocksource/ingenic-sysost.c:92:8: note: Excessive padding in 's=
truct ingenic_ost_timer' (76 padding bytes, where 12 is optimal). Optimal f=
ields order: cevt, base, ost, clk, cpu, channel, name, consider reordering =
the fields or adding explicit padding members
   struct ingenic_ost_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   8 warnings generated.
   drivers/staging/greybus/fw-download.c:51:19: warning: Use of memory afte=
r it is freed [clang-analyzer-unix.Malloc]
           release_firmware(fw_req->fw);
                            ^
   drivers/staging/greybus/fw-download.c:442:6: note: Assuming 'connection'=
 is non-null
           if (!connection)
               ^~~~~~~~~~~
   drivers/staging/greybus/fw-download.c:442:2: note: Taking false branch
           if (!connection)
           ^
   drivers/staging/greybus/fw-download.c:453:2: note: Loop condition is fal=
se. Execution continues on line 455
           list_for_each_entry(fw_req, &fw_download->fw_requests, node)
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/staging/greybus/fw-download.c:458:2: note: Loop condition is tru=
e.  Entering loop body
           list_for_each_entry_safe(fw_req, tmp, &fw_download->fw_requests,=
 node) {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/staging/greybus/fw-download.c:460:3: note: Calling 'free_firmwar=
e'
                   free_firmware(fw_download, fw_req);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/fw-download.c:118:6: note: Assuming field 'disab=
led' is false
           if (fw_req->disabled)
               ^~~~~~~~~~~~~~~~
   drivers/staging/greybus/fw-download.c:118:2: note: Taking false branch
           if (fw_req->disabled)
           ^
   drivers/staging/greybus/fw-download.c:126:2: note: Calling 'put_fw_req'
           put_fw_req(fw_req);
           ^~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/fw-download.c:88:2: note: Calling 'kref_put'
           kref_put(&fw_req->kref, fw_req_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'fw_req_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/staging/greybus/fw-download.c:48:2: note: Taking false branch
           dev_dbg(fw_req->fw_download->parent, "firmware %s released\n",
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/staging/greybus/fw-download.c:65:6: note: Assuming field 'timedo=
ut' is true
           if (!fw_req->timedout)
               ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/fw-download.c:65:2: note: Taking false branch
           if (!fw_req->timedout)
           ^
   drivers/staging/greybus/fw-download.c:69:2: note: Memory is released
           kfree(fw_req);
           ^~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/staging/greybus/fw-download.c:88:2: note: Returning; memory was =
released
           kref_put(&fw_req->kref, fw_req_release);

vim +92 drivers/clocksource/ingenic-sysost.c

5ecafc120bbea6 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2020-07-23   91) =

f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04  @92) s=
truct ingenic_ost_timer {
f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04   93) 	=
void __iomem *base;
f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04   94) 	=
unsigned int cpu;
f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04   95) 	=
unsigned int channel;
f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04   96) 	=
struct clock_event_device cevt;
f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04   97) 	=
struct ingenic_ost *ost;
f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04   98) 	=
struct clk *clk;
f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04   99) 	=
char name[20];
f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04  100) };
f2b83a99eb3a05 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie  2022-02-04  101) =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3206475247291263383==--

