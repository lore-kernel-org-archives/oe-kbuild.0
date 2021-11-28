Content-Type: multipart/mixed; boundary="===============8039758407080275281=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/endpoint/pci-epc-mem.c:29:7: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 28 Nov 2021 11:46:58 +0800
Message-ID: <202111281158.rWWuYjqz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8039758407080275281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20211126 (https://download.01.org/0day-ci/archi=
ve/20211128/202111281158.rWWuYjqz-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2f78788b55baa3410b1ec91a576286abe1ad4d6a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2f78788b55baa3410b1ec91a576286abe1ad4d6a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/drm_file.c:593:7: note: 'e' is not equal to NULL
                   if (e =3D=3D NULL) {
                       ^
   drivers/gpu/drm/drm_file.c:593:3: note: Taking false branch
                   if (e =3D=3D NULL) {
                   ^
   drivers/gpu/drm/drm_file.c:612:8: note: Assuming the condition is false
                           if (length > count - ret) {
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:612:4: note: Taking false branch
                           if (length > count - ret) {
                           ^
   drivers/gpu/drm/drm_file.c:623:8: note: Assuming the condition is false
                           if (copy_to_user(buffer + ret, e->event, length)=
) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:623:4: note: Taking false branch
                           if (copy_to_user(buffer + ret, e->event, length)=
) {
                           ^
   drivers/gpu/drm/drm_file.c:630:4: note: Memory is released
                           kfree(e);
                           ^~~~~~~~
   drivers/gpu/drm/drm_file.c:581:2: note: Loop condition is true.  Enterin=
g loop body
           for (;;) {
           ^
   drivers/gpu/drm/drm_file.c:585:7: note: Assuming the condition is true
                   if (!list_empty(&file_priv->event_list)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:585:3: note: Taking true branch
                   if (!list_empty(&file_priv->event_list)) {
                   ^
   drivers/gpu/drm/drm_file.c:586:8: note: Left side of '&&' is false
                           e =3D list_first_entry(&file_priv->event_list,
                               ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/drm_file.c:586:8: note: Taking false branch
                           e =3D list_first_entry(&file_priv->event_list,
                               ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/drm_file.c:586:8: note: Loop condition is false.  Exitin=
g loop
                           e =3D list_first_entry(&file_priv->event_list,
                               ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/drm_file.c:588:30: note: Use of memory after it is freed
                           file_priv->event_space +=3D e->event->length;
                                                     ^~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/pci/endpoint/pci-epc-mem.c:29:7: warning: Assigned value is garb=
age or undefined [clang-analyzer-core.uninitialized.Assign]
           size >>=3D page_shift;
                ^
   drivers/pci/endpoint/pci-epc-mem.c:244:7: note: 'mem' is non-null
           if (!mem) {
                ^~~
   drivers/pci/endpoint/pci-epc-mem.c:244:2: note: Taking false branch
           if (!mem) {
           ^
   drivers/pci/endpoint/pci-epc-mem.c:250:15: note: '?' condition is false
           page_shift =3D ilog2(page_size);
                        ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:250:15: note: '?' condition is true
           page_shift =3D ilog2(page_size);
                        ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:254:10: note: Calling 'pci_epc_mem_ge=
t_order'
           order =3D pci_epc_mem_get_order(mem, size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: '?' condition is false
           unsigned int page_shift =3D ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: '?' condition is true
           unsigned int page_shift =3D ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: Calling '__ilog2_u32'
           unsigned int page_shift =3D ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: Returning from '__ilog2_=
u32'
           unsigned int page_shift =3D ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:26:2: note: 'page_shift' initialized =
to 4294967295
           unsigned int page_shift =3D ilog2(mem->window.page_size);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:29:7: note: Assigned value is garbage=
 or undefined
           size >>=3D page_shift;
                ^   ~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/pci/endpoint/functions/pci-epf-test.c:758:17: warning: Access to=
 field 'msix_capable' results in a dereference of a null pointer (loaded fr=
om variable 'epc_features') [clang-analyzer-core.NullDereference]
           msix_capable =3D epc_features->msix_capable;
                          ^
   drivers/pci/endpoint/functions/pci-epf-test.c:829:19: note: Assuming 'ep=
c' is non-null
           if (WARN_ON_ONCE(!epc))
                            ^
   include/asm-generic/bug.h:145:27: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_once =3D !!(condition);                    \
                                    ^~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-test.c:829:6: note: '__ret_warn_o=
nce' is 0
           if (WARN_ON_ONCE(!epc))
               ^
   include/asm-generic/bug.h:147:15: note: expanded from macro 'WARN_ON_ONC=
E'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                        ^~~~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/pci/endpoint/functions/pci-epf-test.c:829:6: note: Left side of =
'&&' is false
           if (WARN_ON_ONCE(!epc))
               ^
   include/asm-generic/bug.h:147:31: note: expanded from macro 'WARN_ON_ONC=
E'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                                        ^
   drivers/pci/endpoint/functions/pci-epf-test.c:829:6: note: '__ret_warn_o=
nce' is 0
           if (WARN_ON_ONCE(!epc))
               ^
   include/asm-generic/bug.h:147:15: note: expanded from macro 'WARN_ON_ONC=
E'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                        ^~~~~~~~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-test.c:829:6: note: Left side of =
'&&' is false
           if (WARN_ON_ONCE(!epc))
--
                       ^~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1243:3: note: Taking false branch
                   if (!ccb)
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1248:3: note: Loop condition is =
true.  Entering loop body
                   for (j =3D 0; j < BNAD_MAX_RXQ_PER_RXP; j++) {
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1250:8: note: Assuming 'rcb' is =
non-null
                           if (!rcb)
                               ^~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1250:4: note: Taking false branch
                           if (!rcb)
                           ^
   drivers/net/ethernet/brocade/bna/bnad.c:1253:4: note: Calling 'bnad_rxq_=
alloc_init'
                           bnad_rxq_alloc_init(bnad, rcb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:266:10: note: Calling 'get_order'
           order =3D get_order(rcb->rxq->buffer_size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/getorder.h:31:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/asm-generic/getorder.h:44:9: note: Calling 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/asm-generic/getorder.h:44:9: note: Returning from 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/getorder.h:44:2: note: Returning the value 32
           return fls(size);
           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:266:10: note: Returning from 'ge=
t_order'
           order =3D get_order(rcb->rxq->buffer_size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:266:2: note: The value 32 is ass=
igned to 'order'
           order =3D get_order(rcb->rxq->buffer_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:270:6: note: Assuming the condit=
ion is true
           if (bna_is_small_rxq(rcb->id)) {
               ^
   drivers/net/ethernet/brocade/bna/bna.h:23:32: note: expanded from macro =
'bna_is_small_rxq'
   #define bna_is_small_rxq(_id) ((_id) & 0x1)
                                  ^~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:270:2: note: Taking true branch
           if (bna_is_small_rxq(rcb->id)) {
           ^
   drivers/net/ethernet/brocade/bna/bnad.c:286:20: note: The result of the =
left shift is undefined due to shifting by '32', which is greater or equal =
to the width of type 'unsigned long'
           BUG_ON((PAGE_SIZE << order) % unmap_q->map_size);
                             ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
>> drivers/net/ethernet/brocade/bna/bnad.c:286:30: warning: Division by zer=
o [clang-analyzer-core.DivideZero]
           BUG_ON((PAGE_SIZE << order) % unmap_q->map_size);
                                       ^
   drivers/net/ethernet/brocade/bna/bnad.c:1240:2: note: Loop condition is =
true.  Entering loop body
           for (i =3D 0; i < BNAD_MAX_RXP_PER_RX; i++) {
           ^
   drivers/net/ethernet/brocade/bna/bnad.c:1243:7: note: Assuming 'ccb' is =
non-null
                   if (!ccb)
                       ^~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1243:3: note: Taking false branch
                   if (!ccb)
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1248:3: note: Loop condition is =
true.  Entering loop body
                   for (j =3D 0; j < BNAD_MAX_RXQ_PER_RXP; j++) {
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1250:8: note: Assuming 'rcb' is =
non-null
                           if (!rcb)
                               ^~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1250:4: note: Taking false branch
                           if (!rcb)
                           ^
   drivers/net/ethernet/brocade/bna/bnad.c:1253:4: note: Calling 'bnad_rxq_=
alloc_init'
                           bnad_rxq_alloc_init(bnad, rcb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:270:6: note: Assuming the condit=
ion is false
           if (bna_is_small_rxq(rcb->id)) {
               ^
   drivers/net/ethernet/brocade/bna/bna.h:23:32: note: expanded from macro =
'bna_is_small_rxq'
   #define bna_is_small_rxq(_id) ((_id) & 0x1)
                                  ^~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:270:2: note: Taking false branch
           if (bna_is_small_rxq(rcb->id)) {
           ^
   drivers/net/ethernet/brocade/bna/bnad.c:274:7: note: Assuming field 'mul=
ti_buffer' is 0
                   if (rcb->rxq->multi_buffer) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:274:3: note: Taking false branch
                   if (rcb->rxq->multi_buffer) {
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:281:6: note: Assuming field 'buf=
fer_size' is > 2048
                                   (rcb->rxq->buffer_size > 2048) ?
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:281:5: note: '?' condition is tr=
ue
                                   (rcb->rxq->buffer_size > 2048) ?
                                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:280:4: note: The value 0 is assi=
gned to field 'map_size'
                           unmap_q->map_size =3D
                           ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:286:30: note: Division by zero
           BUG_ON((PAGE_SIZE << order) % unmap_q->map_size);
                                       ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/net/ethernet/brocade/bna/bnad.c:396:3: warning: Assigned value i=
s garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   BNA_SET_DMA_ADDR(dma_addr, &rxent->host_addr);
                   ^
   drivers/net/ethernet/brocade/bna/bna.h:34:23: note: expanded from macro =
'BNA_SET_DMA_ADDR'
           (_bna_dma_addr)->lsb =3D ((struct bna_dma_addr *)&tmp_addr)->lsb=
; \
                                ^
   drivers/net/ethernet/brocade/bna/bnad.c:1860:3: note: Left side of '&&' =
is false
                   container_of(napi, struct bnad_rx_ctrl, napi);
                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/ethernet/brocade/bna/bnad.c:1860:3: note: Taking false branch
                   container_of(napi, struct bnad_rx_ctrl, napi);
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1860:3: note: Loop condition is =
false.  Exiting loop
                   container_of(napi, struct bnad_rx_ctrl, napi);
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)

vim +29 drivers/pci/endpoint/pci-epc-mem.c

5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  14  =

5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  15  /**
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  16   * pci_epc_mem_get_or=
der() - determine the allocation order of a memory size
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  17   * @mem: address spac=
e of the endpoint controller
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  18   * @size: the size fo=
r which to get the order
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  19   *
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  20   * Reimplement get_or=
der() for mem->page_size since the generic get_order
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  21   * always gets order =
with a constant PAGE_SIZE.
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  22   */
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  23  static int pci_epc_me=
m_get_order(struct pci_epc_mem *mem, size_t size)
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  24  {
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  25  	int order;
d45e3c1a5979ef Lad Prabhakar          2020-05-07  26  	unsigned int page_sh=
ift =3D ilog2(mem->window.page_size);
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  27  =

52c9285d47459c Kishon Vijay Abraham I 2017-08-18  28  	size--;
52c9285d47459c Kishon Vijay Abraham I 2017-08-18 @29  	size >>=3D page_shif=
t;
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  30  #if BITS_PER_LONG =3D=
=3D 32
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  31  	order =3D fls(size);
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  32  #else
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  33  	order =3D fls64(size=
);
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  34  #endif
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  35  	return order;
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  36  }
52c9285d47459c Kishon Vijay Abraham I 2017-08-18  37  =


:::::: The code at line 29 was first introduced by commit
:::::: 52c9285d47459cf241e144c7d8ef15941ba1b181 PCI: endpoint: Add support =
for configurable page size

:::::: TO: Kishon Vijay Abraham I <kishon@ti.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8039758407080275281==--

