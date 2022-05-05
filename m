Content-Type: multipart/mixed; boundary="===============8406935582590290342=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [daniel-thompson:clang-analyzer/initial_review 7/7] lib/asn1_encoder.c:299:12: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Fri, 06 May 2022 01:00:49 +0800
Message-ID: <202205060003.X2rc2MdK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8406935582590290342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Thompson <daniel.thompson@linaro.org>

tree:   https://git.linaro.org/people/daniel.thompson/linux.git clang-analy=
zer/initial_review
head:   ad6525bf355a301ca52b1dc3639fa340409c79b9
commit: ad6525bf355a301ca52b1dc3639fa340409c79b9 [7/7] [RFC] linux/err.h: R=
efactor IS_ERR_VALUE(x) to improve clang reasoning
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm-randconfig-c002-20220505 (https://download.01.org/0day-ci/archi=
ve/20220506/202205060003.X2rc2MdK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add daniel-thompson https://git.linaro.org/people/daniel=
.thompson/linux.git
        git fetch --no-tags daniel-thompson clang-analyzer/initial_review
        git checkout ad6525bf355a301ca52b1dc3639fa340409c79b9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^
   mm/page-writeback.c:1652:11: note: Calling 'dirty_poll_interval'
                           intv =3D dirty_poll_interval(dirty, thresh);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1412:6: note: Assuming 'thresh' is > 'dirty'
           if (thresh > dirty)
               ^~~~~~~~~~~~~~
   mm/page-writeback.c:1412:2: note: Taking true branch
           if (thresh > dirty)
           ^
   mm/page-writeback.c:1413:18: note: '?' condition is false
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                                  ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   mm/page-writeback.c:1413:18: note: '?' condition is true
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                                  ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   mm/page-writeback.c:1413:14: note: The result of the left shift is undef=
ined because the right operand is negative
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                              ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:2902:2: warning: Value stored to 'access_ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           access_ret =3D arch_make_folio_accessible(folio);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:2902:2: note: Value stored to 'access_ret' is never =
read
           access_ret =3D arch_make_folio_accessible(folio);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   block/partitions/amiga.c:118:19: warning: The left operand of '<' is a g=
arbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           if (dostype[3] < ' ')
                               ~~~~~~~~~~ ^
   block/partitions/amiga.c:38:2: note: Loop condition is true.  Entering l=
oop body
           for (blk =3D 0; ; blk++, put_dev_sector(sect)) {
           ^
   block/partitions/amiga.c:39:7: note: 'blk' is not equal to RDB_ALLOCATIO=
N_LIMIT
                   if (blk =3D=3D RDB_ALLOCATION_LIMIT)
                       ^~~
   block/partitions/amiga.c:39:3: note: Taking false branch
                   if (blk =3D=3D RDB_ALLOCATION_LIMIT)
                   ^
   block/partitions/amiga.c:42:7: note: Assuming 'data' is non-null
                   if (!data) {
                       ^~~~~
   block/partitions/amiga.c:42:3: note: Taking false branch
                   if (!data) {
                   ^
   block/partitions/amiga.c:48:7: note: Assuming the condition is false
                   if (*(__be32 *)data !=3D cpu_to_be32(IDNAME_RIGIDDISK))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/amiga.c:48:3: note: Taking false branch
                   if (*(__be32 *)data !=3D cpu_to_be32(IDNAME_RIGIDDISK))
                   ^
   block/partitions/amiga.c:52:7: note: Assuming the condition is true
                   if (checksum_block((__be32 *)data, be32_to_cpu(rdb->rdb_=
SummedLongs) & 0x7F) =3D=3D 0)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/amiga.c:52:3: note: Taking true branch
                   if (checksum_block((__be32 *)data, be32_to_cpu(rdb->rdb_=
SummedLongs) & 0x7F) =3D=3D 0)
                   ^
   block/partitions/amiga.c:53:4: note:  Execution continues on line 70
                           break;
                           ^
   block/partitions/amiga.c:81:17: note: Assuming 'blk' is > 0
           for (part =3D 1; blk>0 && part<=3D16; part++, put_dev_sector(sec=
t)) {
                          ^~~~~
   block/partitions/amiga.c:81:17: note: Left side of '&&' is true
   block/partitions/amiga.c:81:2: note: Loop condition is true.  Entering l=
oop body
           for (part =3D 1; blk>0 && part<=3D16; part++, put_dev_sector(sec=
t)) {
           ^
   block/partitions/amiga.c:84:7: note: Assuming 'data' is non-null
                   if (!data) {
                       ^~~~~
   block/partitions/amiga.c:84:3: note: Taking false branch
                   if (!data) {
                   ^
   block/partitions/amiga.c:92:7: note: Assuming the condition is false
                   if (pb->pb_ID !=3D cpu_to_be32(IDNAME_PARTITION))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/amiga.c:92:3: note: Taking false branch
                   if (pb->pb_ID !=3D cpu_to_be32(IDNAME_PARTITION))
                   ^
   block/partitions/amiga.c:94:7: note: Assuming the condition is false
                   if (checksum_block((__be32 *)pb, be32_to_cpu(pb->pb_Summ=
edLongs) & 0x7F) !=3D 0 )
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   block/partitions/amiga.c:94:3: note: Taking false branch
                   if (checksum_block((__be32 *)pb, be32_to_cpu(pb->pb_Summ=
edLongs) & 0x7F) !=3D 0 )
                   ^
   block/partitions/amiga.c:104:7: note: Assuming 'nr_sects' is not equal t=
o 0
                   if (!nr_sects)
                       ^~~~~~~~~
   block/partitions/amiga.c:104:3: note: Taking false branch
                   if (!nr_sects)
                   ^
   block/partitions/amiga.c:118:19: note: The left operand of '<' is a garb=
age value
                           if (dostype[3] < ' ')
                               ~~~~~~~~~~ ^
   2 warnings generated.
>> lib/asn1_encoder.c:299:12: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           *(data++) =3D _tagn(CONT, CONS, tag);
           ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   lib/asn1_encoder.c:276:11: note: Assuming 'tag' is <=3D 30
           if (WARN(tag > 30, "ASN.1 tag can't be > 30"))
                    ^
   include/asm-generic/bug.h:130:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   lib/asn1_encoder.c:276:6: note: Taking false branch
           if (WARN(tag > 30, "ASN.1 tag can't be > 30"))
               ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   lib/asn1_encoder.c:276:2: note: Taking false branch
           if (WARN(tag > 30, "ASN.1 tag can't be > 30"))
           ^
   lib/asn1_encoder.c:279:6: note: Assuming 'string' is null
           if (!string && WARN(len > 127,
               ^~~~~~~
   lib/asn1_encoder.c:279:6: note: Left side of '&&' is true
   lib/asn1_encoder.c:279:22: note: Assuming 'len' is <=3D 127
           if (!string && WARN(len > 127,
                               ^
   include/asm-generic/bug.h:130:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   lib/asn1_encoder.c:279:17: note: Taking false branch
           if (!string && WARN(len > 127,
                          ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   lib/asn1_encoder.c:279:2: note: Taking false branch
           if (!string && WARN(len > 127,
           ^
   lib/asn1_encoder.c:283:2: note: Taking false branch
           if (IS_ERR(data))
           ^
   lib/asn1_encoder.c:286:7: note: 'string' is null
           if (!string && len > 0) {
                ^~~~~~
   lib/asn1_encoder.c:286:6: note: Left side of '&&' is true
           if (!string && len > 0) {
               ^
   lib/asn1_encoder.c:286:17: note: Assuming 'len' is > 0
           if (!string && len > 0) {
                          ^~~~~~~
   lib/asn1_encoder.c:286:2: note: Taking true branch
           if (!string && len > 0) {
           ^
   lib/asn1_encoder.c:296:6: note: 'data_len' is >=3D 2
           if (data_len < 2)
               ^~~~~~~~
   lib/asn1_encoder.c:296:2: note: Taking false branch
           if (data_len < 2)
           ^
   lib/asn1_encoder.c:299:4: note: Null pointer value stored to 'data'
           *(data++) =3D _tagn(CONT, CONS, tag);
             ^~~~~~
   lib/asn1_encoder.c:299:12: note: Dereference of null pointer
           *(data++) =3D _tagn(CONT, CONS, tag);
           ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   lib/asn1_encoder.c:399:12: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           *(data++) =3D _tag(UNIV, CONS, SEQ);
           ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   lib/asn1_encoder.c:379:6: note: Assuming 'seq' is null
           if (!seq && WARN(len > 127,
               ^~~~
   lib/asn1_encoder.c:379:6: note: Left side of '&&' is true
   lib/asn1_encoder.c:379:19: note: Assuming 'len' is <=3D 127
           if (!seq && WARN(len > 127,
                            ^
   include/asm-generic/bug.h:130:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   lib/asn1_encoder.c:379:14: note: Taking false branch
           if (!seq && WARN(len > 127,
                       ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   lib/asn1_encoder.c:379:2: note: Taking false branch
           if (!seq && WARN(len > 127,
           ^
   lib/asn1_encoder.c:383:2: note: Taking false branch
           if (IS_ERR(data))
           ^
   lib/asn1_encoder.c:386:7: note: 'seq' is null
           if (!seq && len >=3D 0) {
                ^~~
   lib/asn1_encoder.c:386:6: note: Left side of '&&' is true
           if (!seq && len >=3D 0) {
               ^
   lib/asn1_encoder.c:386:14: note: Assuming 'len' is >=3D 0
           if (!seq && len >=3D 0) {
                       ^~~~~~~~
   lib/asn1_encoder.c:386:2: note: Taking true branch
           if (!seq && len >=3D 0) {
           ^
--
   1 warning generated.
   fs/sysfs/file.c:57:2: warning: Null pointer passed as 1st argument to me=
mory set function [clang-analyzer-unix.cstring.NullArg]
           memset(buf, 0, PAGE_SIZE);
           ^      ~~~
   fs/sysfs/file.c:48:19: note: Assuming field 'show' is non-null
           if (WARN_ON_ONCE(!ops->show))
                            ^
   include/asm-generic/bug.h:146:18: note: expanded from macro 'WARN_ON_ONC=
E'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   fs/sysfs/file.c:48:6: note: '__ret_do_once' is false
           if (WARN_ON_ONCE(!ops->show))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/sysfs/file.c:48:6: note: Left side of '&&' is false
           if (WARN_ON_ONCE(!ops->show))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   fs/sysfs/file.c:48:6: note: Taking false branch
           if (WARN_ON_ONCE(!ops->show))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   fs/sysfs/file.c:48:2: note: Taking false branch
           if (WARN_ON_ONCE(!ops->show))
           ^
   fs/sysfs/file.c:52:10: note: Calling 'seq_get_buf'
           count =3D seq_get_buf(sf, &buf);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:66:9: note: Assuming field 'count' is <=3D fiel=
d 'size'
           BUG_ON(m->count > m->size);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/seq_file.h:66:2: note: Taking false branch
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/seq_file.h:66:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   include/linux/seq_file.h:67:6: note: Assuming field 'count' is >=3D fiel=
d 'size'
           if (m->count < m->size)
               ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:67:2: note: Taking false branch
           if (m->count < m->size)
           ^
   include/linux/seq_file.h:70:3: note: Null pointer value stored to 'buf'
                   *bufp =3D NULL;
                   ^~~~~~~~~~~~
   fs/sysfs/file.c:52:10: note: Returning from 'seq_get_buf'
           count =3D seq_get_buf(sf, &buf);
                   ^~~~~~~~~~~~~~~~~~~~~
   fs/sysfs/file.c:53:6: note: Assuming the condition is false
           if (count < PAGE_SIZE) {
               ^~~~~~~~~~~~~~~~~
   fs/sysfs/file.c:53:2: note: Taking false branch
           if (count < PAGE_SIZE) {
           ^
   fs/sysfs/file.c:57:2: note: Null pointer passed as 1st argument to memor=
y set function
           memset(buf, 0, PAGE_SIZE);
           ^      ~~~
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   3 warnings generated.
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/spi/spi.c:3318:15: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           xfers[0].len =3D min_t(size_t, maxsize, xfer[0].len);
                        ^
   drivers/spi/spi.c:3791:8: note: Calling '__spi_validate'
           ret =3D __spi_validate(spi, message);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:3580:6: note: Assuming the condition is false
           if (list_empty(&message->transfers))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:3580:2: note: Taking false branch
           if (list_empty(&message->transfers))
           ^
   drivers/spi/spi.c:3590:7: note: Assuming the condition is true
           if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WOR=
D) ||
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:3590:6: note: Left side of '&&' is true
           if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WOR=
D) ||
               ^
   drivers/spi/spi.c:3590:36: note: Assuming the condition is true
           if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WOR=
D) ||
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/spi/spi.c:3590:69: note: Left side of '||' is true
           if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WOR=
D) ||
                                                                           =
   ^
   drivers/spi/spi.c:3601:9: note: Calling 'spi_split_transfers_maxsize'
                   ret =3D spi_split_transfers_maxsize(ctlr, message, maxsi=
ze,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:3377:2: note: Loop condition is true.  Entering loop b=
ody
           list_for_each_entry(xfer, &msg->transfers, transfer_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi.c:3378:7: note: Assuming 'maxsize' is < field 'len'
                   if (xfer->len > maxsize) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:3378:3: note: Taking true branch
                   if (xfer->len > maxsize) {
                   ^
   drivers/spi/spi.c:3379:10: note: Calling '__spi_split_transfer_maxsize'
                           ret =3D __spi_split_transfer_maxsize(ctlr, msg, =
&xfer,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/spi/spi.c:3299:2: note: Taking false branch
           if (IS_ERR(srt))
           ^
   drivers/spi/spi.c:3301:2: note: Null pointer value stored to 'xfers'
           xfers =3D srt->inserted_transfers;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:3318:17: note: Assuming '__UNIQUE_ID___x282' is >=3D '=
__UNIQUE_ID___y283'
           xfers[0].len =3D min_t(size_t, maxsize, xfer[0].len);
                          ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/spi/spi.c:3318:17: note: '?' condition is false
           xfers[0].len =3D min_t(size_t, maxsize, xfer[0].len);
                          ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/spi/spi.c:3318:15: note: Dereference of null pointer
           xfers[0].len =3D min_t(size_t, maxsize, xfer[0].len);
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/ext4/readpage.c:373:39: warning: The left operand of '<<' is a garbag=
e value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           bio->bi_iter.bi_sector =3D blocks[0] << (blkbits=
 - 9);
                                                    ~~~~~~~~~ ^
   fs/ext4/readpage.c:242:26: note: Assuming 'rac' is null
           unsigned int nr_pages =3D rac ? readahead_count(rac) : 1;
                                   ^~~
   fs/ext4/readpage.c:242:26: note: '?' condition is false
   fs/ext4/readpage.c:249:2: note: Loop condition is true.  Entering loop b=
ody
           for (; nr_pages; nr_pages--) {
           ^
   fs/ext4/readpage.c:253:7: note: 'rac' is null
                   if (rac) {
                       ^~~
   fs/ext4/readpage.c:253:3: note: Taking false branch
                   if (rac) {
                   ^
--
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/video/backlight/pwm_bl.c:534:6: note: Assuming field 'period' is=
 not equal to 0
           if (!state.period && (data->pwm_period_ns > 0))
               ^~~~~~~~~~~~~
   drivers/video/backlight/pwm_bl.c:534:20: note: Left side of '&&' is false
           if (!state.period && (data->pwm_period_ns > 0))
                             ^
   drivers/video/backlight/pwm_bl.c:538:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/video/backlight/pwm_bl.c:538:2: note: Taking false branch
           if (ret) {
           ^
   drivers/video/backlight/pwm_bl.c:546:6: note: Assuming field 'levels' is=
 null
           if (data->levels) {
               ^~~~~~~~~~~~
   drivers/video/backlight/pwm_bl.c:546:2: note: Taking false branch
           if (data->levels) {
           ^
   drivers/video/backlight/pwm_bl.c:562:13: note: Assuming field 'max_brigh=
tness' is 0
           } else if (!data->max_brightness) {
                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/pwm_bl.c:562:9: note: Taking true branch
           } else if (!data->max_brightness) {
                  ^
   drivers/video/backlight/pwm_bl.c:574:9: note: Calling 'pwm_backlight_bri=
ghtness_default'
                   ret =3D pwm_backlight_brightness_default(&pdev->dev, dat=
a,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/pwm_bl.c:206:33: note: Calling 'fls'
                   min((int)DIV_ROUND_UP(period, fls(period)), 4096);
                                                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:57: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                           ^
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   include/asm-generic/bitops/builtin-fls.h:14:9: note: 'x' is 0
           return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
                  ^
   include/asm-generic/bitops/builtin-fls.h:14:9: note: '?' condition is fa=
lse
   include/asm-generic/bitops/builtin-fls.h:14:2: note: Returning zero
           return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/pwm_bl.c:206:33: note: Returning from 'fls'
                   min((int)DIV_ROUND_UP(period, fls(period)), 4096);
                                                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:57: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                           ^
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/video/backlight/pwm_bl.c:206:12: note: Division by zero
                   min((int)DIV_ROUND_UP(period, fls(period)), 4096);
                            ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   2 warnings generated.
>> fs/btrfs/uuid-tree.c:276:7: warning: Null pointer passed as 2nd argument=
 to memory comparison function [clang-analyzer-unix.cstring.NullArg]
                   if (memcmp(uuid, subvol_root->root_item.uuid, BTRFS_UUID=
_SIZE))
                       ^
   fs/btrfs/uuid-tree.c:302:6: note: Assuming 'path' is non-null
           if (!path) {
               ^~~~~
   fs/btrfs/uuid-tree.c:302:2: note: Taking false branch
           if (!path) {
           ^
   fs/btrfs/uuid-tree.c:313:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   fs/btrfs/uuid-tree.c:313:2: note: Taking false branch
           if (ret) {
           ^
   fs/btrfs/uuid-tree.c:319:2: note: Loop condition is true.  Entering loop=
 body
           while (1) {
           ^
   fs/btrfs/uuid-tree.c:320:3: note: Taking false branch
                   if (btrfs_fs_closing(fs_info)) {
                   ^
   fs/btrfs/uuid-tree.c:327:3: note: Calling 'btrfs_item_key_to_cpu'
                   btrfs_item_key_to_cpu(leaf, &key, slot);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ctree.h:2126:2: note: Calling 'btrfs_item_key'
           btrfs_item_key(eb, disk_key, nr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ctree.h:2021:2: note: Value assigned to 'key.type', which parti=
cipates in a condition later
           read_eb_member(eb, item, struct btrfs_item, key, disk_key);
           ^
   fs/btrfs/ctree.h:1581:2: note: expanded from macro 'read_eb_member'
           read_extent_buffer(eb, (char *)(result),                        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ctree.h:2126:2: note: Returning from 'btrfs_item_key'
           btrfs_item_key(eb, disk_key, nr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/uuid-tree.c:327:3: note: Returning from 'btrfs_item_key_to_cpu'
                   btrfs_item_key_to_cpu(leaf, &key, slot);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/uuid-tree.c:329:7: note: Assuming field 'type' is equal to BTRF=
S_UUID_KEY_SUBVOL
                   if (key.type !=3D BTRFS_UUID_KEY_SUBVOL &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/uuid-tree.c:329:41: note: Left side of '&&' is false
                   if (key.type !=3D BTRFS_UUID_KEY_SUBVOL &&
                                                         ^
   fs/btrfs/uuid-tree.c:334:15: note: Calling 'btrfs_item_size'
                   item_size =3D btrfs_item_size(leaf, slot);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ctree.h:2010:1: note: Calling 'btrfs_raw_item_size'
   BTRFS_ITEM_SETGET_FUNCS(size);
   ^
   fs/btrfs/ctree.h:1989:9: note: expanded from macro 'BTRFS_ITEM_SETGET_FU=
NCS'
           return btrfs_raw_item_##member(eb, btrfs_item_nr(slot));        =
        \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/btrfs/ctree.h:1970:1: note: Taking false branch
   BTRFS_SETGET_FUNCS(raw_item_size, struct btrfs_item, size, 32);
   ^
   fs/btrfs/ctree.h:1612:2: note: expanded from macro 'BTRFS_SETGET_FUNCS'
           BUILD_BUG_ON(sizeof(u##bits) !=3D sizeof(((type *)0))->member); =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/btrfs/ctree.h:1970:1: note: Loop condition is false.  Exiting loop
   BTRFS_SETGET_FUNCS(raw_item_size, struct btrfs_item, size, 32);
   ^
   fs/btrfs/ctree.h:1612:2: note: expanded from macro 'BTRFS_SETGET_FUNCS'
           BUILD_BUG_ON(sizeof(u##bits) !=3D sizeof(((type *)0))->member); =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/ctree.h:1970:1: note: Returning value, which participates in a =
condition later
   BTRFS_SETGET_FUNCS(raw_item_size, struct btrfs_item, size, 32);
   ^
   fs/btrfs/ctree.h:1613:2: note: expanded from macro 'BTRFS_SETGET_FUNCS'

vim +299 lib/asn1_encoder.c

b07067627cd5f1 James Bottomley 2021-01-27  242  =

b07067627cd5f1 James Bottomley 2021-01-27  243  /**
b07067627cd5f1 James Bottomley 2021-01-27  244   * asn1_encode_tag() - add =
a tag for optional or explicit value
b07067627cd5f1 James Bottomley 2021-01-27  245   * @data:	pointer to place =
tag at
b07067627cd5f1 James Bottomley 2021-01-27  246   * @end_data:	end of data p=
ointer, points one beyond last usable byte in @data
b07067627cd5f1 James Bottomley 2021-01-27  247   * @tag:	tag to be placed
b07067627cd5f1 James Bottomley 2021-01-27  248   * @string:	the data to be =
tagged
b07067627cd5f1 James Bottomley 2021-01-27  249   * @len:	the length of the =
data to be tagged
b07067627cd5f1 James Bottomley 2021-01-27  250   *
b07067627cd5f1 James Bottomley 2021-01-27  251   * Note this currently only=
 handles short form tags < 31.
b07067627cd5f1 James Bottomley 2021-01-27  252   *
b07067627cd5f1 James Bottomley 2021-01-27  253   * Standard usage is to pas=
s in a @tag, @string and @length and the
b07067627cd5f1 James Bottomley 2021-01-27  254   * @string will be ASN.1 en=
coded with @tag and placed into @data.  If
b07067627cd5f1 James Bottomley 2021-01-27  255   * the encoding would put d=
ata past @end_data then an error is
b07067627cd5f1 James Bottomley 2021-01-27  256   * returned, otherwise a po=
inter to a position one beyond the encoding
b07067627cd5f1 James Bottomley 2021-01-27  257   * is returned.
b07067627cd5f1 James Bottomley 2021-01-27  258   *
b07067627cd5f1 James Bottomley 2021-01-27  259   * To encode in place pass =
a NULL @string and -1 for @len and the
b07067627cd5f1 James Bottomley 2021-01-27  260   * maximum allowable beginn=
ing and end of the data; all this will do
b07067627cd5f1 James Bottomley 2021-01-27  261   * is add the current maxim=
um length and update the data pointer to
b07067627cd5f1 James Bottomley 2021-01-27  262   * the place where the tag =
contents should be placed is returned.  The
b07067627cd5f1 James Bottomley 2021-01-27  263   * data should be copied in=
 by the calling routine which should then
b07067627cd5f1 James Bottomley 2021-01-27  264   * repeat the prior stateme=
nt but now with the known length.  In order
b07067627cd5f1 James Bottomley 2021-01-27  265   * to avoid having to keep =
both before and after pointers, the repeat
b07067627cd5f1 James Bottomley 2021-01-27  266   * expects to be called wit=
h @data pointing to where the first encode
b07067627cd5f1 James Bottomley 2021-01-27  267   * returned it and still NU=
LL for @string but the real length in @len.
b07067627cd5f1 James Bottomley 2021-01-27  268   */
b07067627cd5f1 James Bottomley 2021-01-27  269  unsigned char *
b07067627cd5f1 James Bottomley 2021-01-27  270  asn1_encode_tag(unsigned ch=
ar *data, const unsigned char *end_data,
b07067627cd5f1 James Bottomley 2021-01-27  271  		u32 tag, const unsigned c=
har *string, int len)
b07067627cd5f1 James Bottomley 2021-01-27  272  {
b07067627cd5f1 James Bottomley 2021-01-27  273  	int data_len =3D end_data =
- data;
b07067627cd5f1 James Bottomley 2021-01-27  274  	int ret;
b07067627cd5f1 James Bottomley 2021-01-27  275  =

b07067627cd5f1 James Bottomley 2021-01-27  276  	if (WARN(tag > 30, "ASN.1 =
tag can't be > 30"))
b07067627cd5f1 James Bottomley 2021-01-27  277  		return ERR_PTR(-EINVAL);
b07067627cd5f1 James Bottomley 2021-01-27  278  =

b07067627cd5f1 James Bottomley 2021-01-27  279  	if (!string && WARN(len > =
127,
b07067627cd5f1 James Bottomley 2021-01-27  280  			    "BUG: recode tag is =
too big (>127)"))
b07067627cd5f1 James Bottomley 2021-01-27  281  		return ERR_PTR(-EINVAL);
b07067627cd5f1 James Bottomley 2021-01-27  282  =

b07067627cd5f1 James Bottomley 2021-01-27  283  	if (IS_ERR(data))
b07067627cd5f1 James Bottomley 2021-01-27  284  		return data;
b07067627cd5f1 James Bottomley 2021-01-27  285  =

b07067627cd5f1 James Bottomley 2021-01-27  286  	if (!string && len > 0) {
b07067627cd5f1 James Bottomley 2021-01-27  287  		/*
b07067627cd5f1 James Bottomley 2021-01-27  288  		 * we're recoding, so mov=
e back to the start of the
b07067627cd5f1 James Bottomley 2021-01-27  289  		 * tag and install a dumm=
y length because the real
b07067627cd5f1 James Bottomley 2021-01-27  290  		 * data_len should be NULL
b07067627cd5f1 James Bottomley 2021-01-27  291  		 */
b07067627cd5f1 James Bottomley 2021-01-27  292  		data -=3D 2;
b07067627cd5f1 James Bottomley 2021-01-27  293  		data_len =3D 2;
b07067627cd5f1 James Bottomley 2021-01-27  294  	}
b07067627cd5f1 James Bottomley 2021-01-27  295  =

b07067627cd5f1 James Bottomley 2021-01-27  296  	if (data_len < 2)
b07067627cd5f1 James Bottomley 2021-01-27  297  		return ERR_PTR(-EINVAL);
b07067627cd5f1 James Bottomley 2021-01-27  298  =

b07067627cd5f1 James Bottomley 2021-01-27 @299  	*(data++) =3D _tagn(CONT, =
CONS, tag);
b07067627cd5f1 James Bottomley 2021-01-27  300  	data_len--;
b07067627cd5f1 James Bottomley 2021-01-27  301  	ret =3D asn1_encode_length=
(&data, &data_len, len);
b07067627cd5f1 James Bottomley 2021-01-27  302  	if (ret < 0)
b07067627cd5f1 James Bottomley 2021-01-27  303  		return ERR_PTR(ret);
b07067627cd5f1 James Bottomley 2021-01-27  304  =

b07067627cd5f1 James Bottomley 2021-01-27  305  	if (!string)
b07067627cd5f1 James Bottomley 2021-01-27  306  		return data;
b07067627cd5f1 James Bottomley 2021-01-27  307  =

b07067627cd5f1 James Bottomley 2021-01-27  308  	if (data_len < len)
b07067627cd5f1 James Bottomley 2021-01-27  309  		return ERR_PTR(-EINVAL);
b07067627cd5f1 James Bottomley 2021-01-27  310  =

b07067627cd5f1 James Bottomley 2021-01-27  311  	memcpy(data, string, len);
b07067627cd5f1 James Bottomley 2021-01-27  312  	data +=3D len;
b07067627cd5f1 James Bottomley 2021-01-27  313  =

b07067627cd5f1 James Bottomley 2021-01-27  314  	return data;
b07067627cd5f1 James Bottomley 2021-01-27  315  }
b07067627cd5f1 James Bottomley 2021-01-27  316  EXPORT_SYMBOL_GPL(asn1_enco=
de_tag);
b07067627cd5f1 James Bottomley 2021-01-27  317  =


:::::: The code@line 299 was first introduced by commit
:::::: b07067627cd5f1f6dc60c224b47c728f7f4b7b45 lib: Add ASN.1 encoder

:::::: TO: James Bottomley <James.Bottomley@HansenPartnership.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8406935582590290342==--

