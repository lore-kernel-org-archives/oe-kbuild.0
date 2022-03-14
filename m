Content-Type: multipart/mixed; boundary="===============6046114624371651638=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hare-scsi-devel:tls-upcall.v4 121/156] net/tls/af_tlsh.c:640:6: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 14 Mar 2022 11:10:41 +0800
Message-ID: <202203141106.9fgCAlQD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6046114624371651638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chuck Lever <chuck.lever@oracle.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 tls-upcall.v4
head:   d2416ecdb6b03fc2e4aa40b20cdf919322713224
commit: 33ec82590b0b919215a255fb431d661be4807b45 [121/156] net/tls: Add sup=
port for PF_TLSH (a TLS handshake listener)
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20220313 (https://download.01.org/0day-ci/archi=
ve/20220314/202203141106.9fgCAlQD-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb=
2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.g=
it/commit/?id=3D33ec82590b0b919215a255fb431d661be4807b45
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux=
/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-upcall.v4
        git checkout 33ec82590b0b919215a255fb431d661be4807b45
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mmc/host/atmel-mci.c:1253:6: note: Left side of '||' is false
   drivers/mmc/host/atmel-mci.c:1253:26: note: Assuming field 'need_reset_a=
fter_xfer' is false
           if (host->need_reset || host->caps.need_reset_after_xfer) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/atmel-mci.c:1253:2: note: Taking false branch
           if (host->need_reset || host->caps.need_reset_after_xfer) {
           ^
   drivers/mmc/host/atmel-mci.c:1267:6: note: Assuming the condition is fal=
se
           if (iflags & ~(ATMCI_SDIOIRQA | ATMCI_SDIOIRQB))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/atmel-mci.c:1267:2: note: Taking false branch
           if (iflags & ~(ATMCI_SDIOIRQA | ATMCI_SDIOIRQB))
           ^
   drivers/mmc/host/atmel-mci.c:1271:15: note: '?' condition is true
           if (unlikely(test_and_clear_bit(ATMCI_CARD_NEED_INIT, &slot->fla=
gs))) {
                        ^
   arch/arm/include/asm/bitops.h:193:34: note: expanded from macro 'test_an=
d_clear_bit'
   #define test_and_clear_bit(nr,p)        ATOMIC_BITOP(test_and_clear_bit,=
nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   drivers/mmc/host/atmel-mci.c:1271:6: note: Assuming the condition is true
           if (unlikely(test_and_clear_bit(ATMCI_CARD_NEED_INIT, &slot->fla=
gs))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/mmc/host/atmel-mci.c:1271:2: note: Taking false branch
           if (unlikely(test_and_clear_bit(ATMCI_CARD_NEED_INIT, &slot->fla=
gs))) {
           ^
   drivers/mmc/host/atmel-mci.c:1278:2: note: Value assigned to 'data'
           data =3D mrq->data;
           ^~~~~~~~~~~~~~~~
   drivers/mmc/host/atmel-mci.c:1279:6: note: Assuming 'data' is null
           if (data) {
               ^~~~
   drivers/mmc/host/atmel-mci.c:1279:2: note: Taking false branch
           if (data) {
           ^
   drivers/mmc/host/atmel-mci.c:1301:6: note: Assuming the condition is fal=
se
           if (host->submit_data !=3D &atmci_submit_data_dma)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/atmel-mci.c:1301:2: note: Taking false branch
           if (host->submit_data !=3D &atmci_submit_data_dma)
           ^
   drivers/mmc/host/atmel-mci.c:1304:6: note: 'data' is null
           if (data)
               ^~~~
   drivers/mmc/host/atmel-mci.c:1304:2: note: Taking false branch
           if (data)
           ^
   drivers/mmc/host/atmel-mci.c:1307:6: note: Assuming the condition is fal=
se
           if (host->submit_data =3D=3D &atmci_submit_data_dma)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/atmel-mci.c:1307:2: note: Taking false branch
           if (host->submit_data =3D=3D &atmci_submit_data_dma)
           ^
   drivers/mmc/host/atmel-mci.c:1310:6: note: Assuming field 'stop' is non-=
null
           if (mrq->stop) {
               ^~~~~~~~~
   drivers/mmc/host/atmel-mci.c:1310:2: note: Taking true branch
           if (mrq->stop) {
           ^
   drivers/mmc/host/atmel-mci.c:1313:9: note: Access to field 'flags' resul=
ts in a dereference of a null pointer (loaded from variable 'data')
                   if (!(data->flags & MMC_DATA_WRITE))
                         ^~~~
   drivers/mmc/host/atmel-mci.c:1727:23: warning: Value stored to 'state' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           enum atmel_mci_state    state =3D host->state;
                                   ^~~~~   ~~~~~~~~~~~
   drivers/mmc/host/atmel-mci.c:1727:23: note: Value stored to 'state' duri=
ng its initialization is never read
           enum atmel_mci_state    state =3D host->state;
                                   ^~~~~   ~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> net/tls/af_tlsh.c:640:6: warning: Assigned value is garbage or undefined=
 [clang-analyzer-core.uninitialized.Assign]
           if (put_user(outlen, optlen)) {
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^
   arch/arm/include/asm/uaccess.h:352:3: note: expanded from macro '__put_u=
ser_switch'
                   __typeof__(*(ptr)) __pu_val =3D (x);                    =
  \
                   ^
   net/tls/af_tlsh.c:701:2: note: Control jumps to 'case 2:'  at line 702
           switch (sk->sk_family) {
           ^
   net/tls/af_tlsh.c:703:3: note:  Execution continues on line 712
                   break;
                   ^
   net/tls/af_tlsh.c:712:6: note: Assuming 'level' is equal to SOL_TLSH
           if (level !=3D SOL_TLSH)
               ^~~~~~~~~~~~~~~~~
   net/tls/af_tlsh.c:712:2: note: Taking false branch
           if (level !=3D SOL_TLSH)
           ^
   net/tls/af_tlsh.c:715:2: note: Control jumps to 'case 1:'  at line 716
           switch (optname) {
           ^
   net/tls/af_tlsh.c:717:9: note: Calling 'tlsh_getsockopt_priorities'
                   ret =3D tlsh_getsockopt_priorities(sk, optval, optlen);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/af_tlsh.c:605:6: note: 'outlen' declared without an initial value
           int outlen, len, ret;
               ^~~~~~
   net/tls/af_tlsh.c:608:6: note: Control jumps to 'case 4:'  at line 608
           if (get_user(len, optlen))
               ^
   arch/arm/include/asm/uaccess.h:216:3: note: expanded from macro 'get_use=
r'
                   __get_user_check(x, p);                                 \
                   ^
   arch/arm/include/asm/uaccess.h:180:3: note: expanded from macro '__get_u=
ser_check'
                   switch (sizeof(*(__p))) {                               \
                   ^
   net/tls/af_tlsh.c:608:6: note: Taking false branch
           if (get_user(len, optlen))
               ^
   arch/arm/include/asm/uaccess.h:216:3: note: expanded from macro 'get_use=
r'
                   __get_user_check(x, p);                                 \
                   ^
   arch/arm/include/asm/uaccess.h:194:4: note: expanded from macro '__get_u=
ser_check'
                           if (sizeof((x)) >=3D 8)                         =
  \
                           ^
   net/tls/af_tlsh.c:608:6: note:  Execution continues on line 608
           if (get_user(len, optlen))
               ^
   arch/arm/include/asm/uaccess.h:216:3: note: expanded from macro 'get_use=
r'
                   __get_user_check(x, p);                                 \
                   ^
   arch/arm/include/asm/uaccess.h:198:4: note: expanded from macro '__get_u=
ser_check'
                           break;                                          \
                           ^
   net/tls/af_tlsh.c:608:6: note: Assuming the condition is false
           if (get_user(len, optlen))
               ^
   arch/arm/include/asm/uaccess.h:214:2: note: expanded from macro 'get_use=
r'
           ({                                                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/af_tlsh.c:608:2: note: Taking false branch
           if (get_user(len, optlen))
           ^
   net/tls/af_tlsh.c:610:6: note: Assuming 'optval' is non-null
           if (!optval)
               ^~~~~~~
   net/tls/af_tlsh.c:610:2: note: Taking false branch
           if (!optval)
           ^
   net/tls/af_tlsh.c:619:6: note: Assuming 'info' is non-null
           if (info) {
               ^~~~
   net/tls/af_tlsh.c:619:2: note: Taking true branch
           if (info) {
           ^
   net/tls/af_tlsh.c:629:6: note: Assuming 'val' is non-null
           if (val) {
               ^~~
   net/tls/af_tlsh.c:629:2: note: Taking true branch
           if (val) {
           ^
   net/tls/af_tlsh.c:632:7: note: Assuming 'len' is >=3D 'outlen'
                   if (len < outlen) {
                       ^~~~~~~~~~~~
   net/tls/af_tlsh.c:632:3: note: Taking false branch
                   if (len < outlen) {
                   ^
   net/tls/af_tlsh.c:640:6: note: Assigned value is garbage or undefined
           if (put_user(outlen, optlen)) {
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:352:3: note: expanded from macro '__put_u=
ser_switch'
                   __typeof__(*(ptr)) __pu_val =3D (x);                    =
  \
                   ^                             ~~~
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
               ^~~~
   net/ceph/messenger_v2.c:2548:2: note: Taking false branch
           if (skip)
           ^
   net/ceph/messenger_v2.c:2552:10: note: Access to field 'con' results in =
a dereference of a null pointer (loaded from field 'in_msg')
           WARN_ON(con->in_msg->con !=3D con);
                   ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/splice.c:725:2: warning: Undefined or garbage value returned to calle=
r [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   fs/splice.c:630:2: note: 'ret' declared without an initial value
           ssize_t ret;
           ^~~~~~~~~~~
   fs/splice.c:632:15: note: Assuming 'array' is non-null
           if (unlikely(!array))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/splice.c:632:2: note: Taking false branch
           if (unlikely(!array))
           ^
   fs/splice.c:638:2: note: Loop condition is false. Execution continues on=
 line 717
           while (sd.total_len) {
           ^
   fs/splice.c:722:9: note: Field 'num_spliced' is 0
           if (sd.num_spliced)
                  ^
   fs/splice.c:722:2: note: Taking false branch
           if (sd.num_spliced)
           ^
   fs/splice.c:725:2: note: Undefined or garbage value returned to caller
           return ret;
           ^      ~~~
   fs/splice.c:853:2: warning: Value stored to 'ret' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/splice.c:853:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   net/rxrpc/local_object.c:218:3: warning: Value stored to 'age' is never =
read [clang-analyzer-deadcode.DeadStores]
                   age =3D "old";
                   ^     ~~~~~
   net/rxrpc/local_object.c:218:3: note: Value stored to 'age' is never read
                   age =3D "old";
                   ^     ~~~~~
   net/rxrpc/local_object.c:234:2: warning: Value stored to 'age' is never =
read [clang-analyzer-deadcode.DeadStores]
           age =3D "new";
           ^     ~~~~~
   net/rxrpc/local_object.c:234:2: note: Value stored to 'age' is never read
           age =3D "new";
           ^     ~~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> net/tls/af_tlsh.c:640:6: warning: Assigned value is garbage or undefined=
 [clang-analyzer-core.uninitialized.Assign]
           if (put_user(outlen, optlen)) {
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^
   arch/arm/include/asm/uaccess.h:352:3: note: expanded from macro '__put_u=
ser_switch'
                   __typeof__(*(ptr)) __pu_val =3D (x);                    =
  \
                   ^
   net/tls/af_tlsh.c:701:2: note: Control jumps to 'case 2:'  at line 702
           switch (sk->sk_family) {
           ^
   net/tls/af_tlsh.c:703:3: note:  Execution continues on line 712
                   break;
                   ^
   net/tls/af_tlsh.c:712:6: note: Assuming 'level' is equal to SOL_TLSH
           if (level !=3D SOL_TLSH)
               ^~~~~~~~~~~~~~~~~
   net/tls/af_tlsh.c:712:2: note: Taking false branch
           if (level !=3D SOL_TLSH)
           ^
   net/tls/af_tlsh.c:715:2: note: Control jumps to 'case 1:'  at line 716
           switch (optname) {
           ^
   net/tls/af_tlsh.c:717:9: note: Calling 'tlsh_getsockopt_priorities'
                   ret =3D tlsh_getsockopt_priorities(sk, optval, optlen);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/af_tlsh.c:605:6: note: 'outlen' declared without an initial value
           int outlen, len, ret;
               ^~~~~~
   net/tls/af_tlsh.c:608:6: note: Control jumps to 'case 4:'  at line 608
           if (get_user(len, optlen))
               ^
   arch/arm/include/asm/uaccess.h:216:3: note: expanded from macro 'get_use=
r'
                   __get_user_check(x, p);                                 \
                   ^
   arch/arm/include/asm/uaccess.h:180:3: note: expanded from macro '__get_u=
ser_check'
                   switch (sizeof(*(__p))) {                               \
                   ^
   net/tls/af_tlsh.c:608:6: note: Taking false branch
           if (get_user(len, optlen))
               ^
   arch/arm/include/asm/uaccess.h:216:3: note: expanded from macro 'get_use=
r'
                   __get_user_check(x, p);                                 \
                   ^
   arch/arm/include/asm/uaccess.h:194:4: note: expanded from macro '__get_u=
ser_check'
                           if (sizeof((x)) >=3D 8)                         =
  \
                           ^
   net/tls/af_tlsh.c:608:6: note:  Execution continues on line 608
           if (get_user(len, optlen))
               ^
   arch/arm/include/asm/uaccess.h:216:3: note: expanded from macro 'get_use=
r'
                   __get_user_check(x, p);                                 \
                   ^
   arch/arm/include/asm/uaccess.h:198:4: note: expanded from macro '__get_u=
ser_check'
                           break;                                          \
                           ^
   net/tls/af_tlsh.c:608:6: note: Assuming the condition is false
           if (get_user(len, optlen))
               ^
   arch/arm/include/asm/uaccess.h:214:2: note: expanded from macro 'get_use=
r'
           ({                                                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/af_tlsh.c:608:2: note: Taking false branch
           if (get_user(len, optlen))
           ^
   net/tls/af_tlsh.c:610:6: note: Assuming 'optval' is non-null
           if (!optval)
               ^~~~~~~
   net/tls/af_tlsh.c:610:2: note: Taking false branch
           if (!optval)
           ^
   net/tls/af_tlsh.c:619:6: note: Assuming 'info' is non-null
           if (info) {
               ^~~~
   net/tls/af_tlsh.c:619:2: note: Taking true branch
           if (info) {
           ^
   net/tls/af_tlsh.c:629:6: note: Assuming 'val' is non-null
           if (val) {
               ^~~
   net/tls/af_tlsh.c:629:2: note: Taking true branch
           if (val) {
           ^
   net/tls/af_tlsh.c:632:7: note: Assuming 'len' is >=3D 'outlen'
                   if (len < outlen) {
                       ^~~~~~~~~~~~
   net/tls/af_tlsh.c:632:3: note: Taking false branch
                   if (len < outlen) {
                   ^
   net/tls/af_tlsh.c:640:6: note: Assigned value is garbage or undefined
           if (put_user(outlen, optlen)) {
               ^
   arch/arm/include/asm/uaccess.h:369:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:352:3: note: expanded from macro '__put_u=
ser_switch'
                   __typeof__(*(ptr)) __pu_val =3D (x);                    =
  \
                   ^                             ~~~
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +640 net/tls/af_tlsh.c

33ec82590b0b91 Chuck Lever 2021-11-19  600  =

33ec82590b0b91 Chuck Lever 2021-11-19  601  static int tlsh_getsockopt_prio=
rities(struct sock *sk, char __user *optval,
33ec82590b0b91 Chuck Lever 2021-11-19  602  				      int __user *optlen)
33ec82590b0b91 Chuck Lever 2021-11-19  603  {
33ec82590b0b91 Chuck Lever 2021-11-19  604  	struct tlsh_sock_info *info;
33ec82590b0b91 Chuck Lever 2021-11-19  605  	int outlen, len, ret;
33ec82590b0b91 Chuck Lever 2021-11-19  606  	const char *val;
33ec82590b0b91 Chuck Lever 2021-11-19  607  =

33ec82590b0b91 Chuck Lever 2021-11-19  608  	if (get_user(len, optlen))
33ec82590b0b91 Chuck Lever 2021-11-19  609  		return -EFAULT;
33ec82590b0b91 Chuck Lever 2021-11-19  610  	if (!optval)
33ec82590b0b91 Chuck Lever 2021-11-19  611  		return -EINVAL;
33ec82590b0b91 Chuck Lever 2021-11-19  612  =

33ec82590b0b91 Chuck Lever 2021-11-19  613  	ret =3D 0;
33ec82590b0b91 Chuck Lever 2021-11-19  614  =

33ec82590b0b91 Chuck Lever 2021-11-19  615  	sock_hold(sk);
33ec82590b0b91 Chuck Lever 2021-11-19  616  	write_lock_bh(&sk->sk_callback=
_lock);
33ec82590b0b91 Chuck Lever 2021-11-19  617  =

33ec82590b0b91 Chuck Lever 2021-11-19  618  	info =3D sk->sk_tlsh_priv;
33ec82590b0b91 Chuck Lever 2021-11-19  619  	if (info) {
33ec82590b0b91 Chuck Lever 2021-11-19  620  		val =3D info->tsi_tls_priorit=
ies;
33ec82590b0b91 Chuck Lever 2021-11-19  621  	} else {
33ec82590b0b91 Chuck Lever 2021-11-19  622  		write_unlock_bh(&sk->sk_callb=
ack_lock);
33ec82590b0b91 Chuck Lever 2021-11-19  623  		ret =3D -EBUSY;
33ec82590b0b91 Chuck Lever 2021-11-19  624  		goto out_put;
33ec82590b0b91 Chuck Lever 2021-11-19  625  	}
33ec82590b0b91 Chuck Lever 2021-11-19  626  =

33ec82590b0b91 Chuck Lever 2021-11-19  627  	write_unlock_bh(&sk->sk_callba=
ck_lock);
33ec82590b0b91 Chuck Lever 2021-11-19  628  =

33ec82590b0b91 Chuck Lever 2021-11-19  629  	if (val) {
33ec82590b0b91 Chuck Lever 2021-11-19  630  		int outlen =3D strlen(val);
33ec82590b0b91 Chuck Lever 2021-11-19  631  =

33ec82590b0b91 Chuck Lever 2021-11-19  632  		if (len < outlen) {
33ec82590b0b91 Chuck Lever 2021-11-19  633  			ret =3D -EINVAL;
33ec82590b0b91 Chuck Lever 2021-11-19  634  			goto out_put;
33ec82590b0b91 Chuck Lever 2021-11-19  635  		}
33ec82590b0b91 Chuck Lever 2021-11-19  636  	} else {
33ec82590b0b91 Chuck Lever 2021-11-19  637  		outlen =3D 0;
33ec82590b0b91 Chuck Lever 2021-11-19  638  	}
33ec82590b0b91 Chuck Lever 2021-11-19  639  =

33ec82590b0b91 Chuck Lever 2021-11-19 @640  	if (put_user(outlen, optlen)) {
33ec82590b0b91 Chuck Lever 2021-11-19  641  		ret =3D -EFAULT;
33ec82590b0b91 Chuck Lever 2021-11-19  642  		goto out_put;
33ec82590b0b91 Chuck Lever 2021-11-19  643  	}
33ec82590b0b91 Chuck Lever 2021-11-19  644  	if (copy_to_user(optval, &val,=
 outlen))
33ec82590b0b91 Chuck Lever 2021-11-19  645  		ret =3D -EFAULT;
33ec82590b0b91 Chuck Lever 2021-11-19  646  =

33ec82590b0b91 Chuck Lever 2021-11-19  647  out_put:
33ec82590b0b91 Chuck Lever 2021-11-19  648  	sock_put(sk);
33ec82590b0b91 Chuck Lever 2021-11-19  649  	return ret;
33ec82590b0b91 Chuck Lever 2021-11-19  650  }
33ec82590b0b91 Chuck Lever 2021-11-19  651  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6046114624371651638==--

