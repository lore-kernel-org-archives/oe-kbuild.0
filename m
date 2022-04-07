Content-Type: multipart/mixed; boundary="===============5774120788063655155=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/8] crypto: skcipher - avoid rounding up request size to DMA alignment
Date: Fri, 08 Apr 2022 03:00:11 +0800
Message-ID: <202204080201.rcMuCSVx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5774120788063655155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220406142715.2270256-6-ardb@kernel.org>
References: <20220406142715.2270256-6-ardb@kernel.org>
TO: Ard Biesheuvel <ardb@kernel.org>
TO: linux-crypto(a)vger.kernel.org
CC: herbert(a)gondor.apana.org.au
CC: keescook(a)chromium.org
CC: Ard Biesheuvel <ardb@kernel.org>

Hi Ard,

I love your patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master sunxi/sunxi/for-next =
v5.18-rc1 next-20220407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/crypt=
o-avoid-DMA-padding-for-request-structures/20220407-010855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm-randconfig-c002-20220406 (https://download.01.org/0day-ci/archi=
ve/20220408/202204080201.rcMuCSVx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b3062=
33f78876a1d197ed6e1f05785505de7c63)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/9ee3fae5a9cb824bb1a=
8a7f0cc52910bb5a186ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ard-Biesheuvel/crypto-avoid-DMA-pa=
dding-for-request-structures/20220407-010855
        git checkout 9ee3fae5a9cb824bb1a8a7f0cc52910bb5a186ad
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:343:4: note: expanded from macro '__DECLARE_T=
RACE'
           { }                                                             \
             ^
   fs/erofs/data.c:120:2: note: Returning from 'trace_erofs_map_blocks_ente=
r'
           trace_erofs_map_blocks_enter(inode, map, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:122:6: note: Assuming field 'm_la' is < field 'i_size'
           if (map->m_la >=3D inode->i_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:122:2: note: Taking false branch
           if (map->m_la >=3D inode->i_size) {
           ^
   fs/erofs/data.c:129:6: note: Assuming field 'datalayout' is equal to ERO=
FS_INODE_CHUNK_BASED
           if (vi->datalayout !=3D EROFS_INODE_CHUNK_BASED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:129:2: note: Taking false branch
           if (vi->datalayout !=3D EROFS_INODE_CHUNK_BASED) {
           ^
   fs/erofs/data.c:134:6: note: Assuming the condition is false
           if (vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:134:2: note: Taking false branch
           if (vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
           ^
   fs/erofs/data.c:144:2: note: Taking true branch
           if (IS_ERR(kaddr)) {
           ^
   fs/erofs/data.c:146:3: note: Control jumps to line 180
                   goto out;
                   ^
   fs/erofs/data.c:180:7: note: 'err' is not equal to 0
           if (!err)
                ^~~
   fs/erofs/data.c:180:2: note: Taking false branch
           if (!err)
           ^
   fs/erofs/data.c:182:2: note: Calling 'trace_erofs_map_blocks_exit'
           trace_erofs_map_blocks_exit(inode, map, flags, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/erofs.h:224:1: note: Returning without writing to '=
map->m_flags'
   DEFINE_EVENT(erofs__map_blocks_exit, erofs_map_blocks_exit,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:343:4: note: expanded from macro '__DECLARE_T=
RACE'
           { }                                                             \
             ^
   fs/erofs/data.c:182:2: note: Returning from 'trace_erofs_map_blocks_exit'
           trace_erofs_map_blocks_exit(inode, map, flags, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:183:2: note: Returning without writing to 'map->m_flags'
           return err;
           ^
   fs/erofs/data.c:242:8: note: Returning from 'erofs_map_blocks'
           ret =3D erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:243:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   fs/erofs/data.c:243:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/erofs/data.c:251:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/erofs/data.c:251:2: note: Taking false branch
           if (ret)
           ^
   fs/erofs/data.c:255:2: note: Taking false branch
           if (flags & IOMAP_DAX) {
           ^
   fs/erofs/data.c:265:20: note: The left operand of '&' is a garbage value
           if (!(map.m_flags & EROFS_MAP_MAPPED)) {
                 ~~~~~~~~~~~ ^
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> crypto/ctr.c:23:8: warning: Excessive padding in 'struct crypto_rfc3686_=
req_ctx' (40 padding bytes, where 8 is optimal). =

   Optimal fields order: =

   subreq, =

   iv, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct crypto_rfc3686_req_ctx {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ctr.c:23:8: note: Excessive padding in 'struct crypto_rfc3686_req=
_ctx' (40 padding bytes, where 8 is optimal). Optimal fields order: subreq,=
 iv, consider reordering the fields or adding explicit padding members
   struct crypto_rfc3686_req_ctx {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/mfd/tps65010.c:650:5: warning: Value stored to 'status' is never=
 read [clang-analyzer-deadcode.DeadStores]
                                   status =3D 0;
                                   ^        ~
   drivers/mfd/tps65010.c:650:5: note: Value stored to 'status' is never re=
ad
                                   status =3D 0;
                                   ^        ~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/iio/industrialio-buffer.c:854:2: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:640:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/iio/industrialio-buffer.c:1303:8: note: Calling 'strtobool'
           ret =3D strtobool(buf, &requested_state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kstrtox.h:152:9: note: Value assigned to 'requested_state'=
, which participates in a condition later
           return kstrtobool(s, res);
                  ^~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1303:8: note: Returning from 'strtoboo=
l'
           ret =3D strtobool(buf, &requested_state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1304:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/industrialio-buffer.c:1304:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/industrialio-buffer.c:1312:6: note: Assuming 'inlist' is not=
 equal to 'requested_state'
           if (inlist =3D=3D requested_state)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1312:2: note: Taking false branch
           if (inlist =3D=3D requested_state)
           ^
   drivers/iio/industrialio-buffer.c:1315:6: note: Assuming 'requested_stat=
e' is true
           if (requested_state)
               ^~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1315:2: note: Taking true branch
           if (requested_state)
           ^
   drivers/iio/industrialio-buffer.c:1316:9: note: Calling '__iio_update_bu=
ffers'
                   ret =3D __iio_update_buffers(indio_dev, buffer, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:1197:8: note: Calling 'iio_verify_upda=
te'
           ret =3D iio_verify_update(indio_dev, insert_buffer, remove_buffe=
r,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:834:6: note: 'insert_buffer' is non-nu=
ll
           if (insert_buffer &&
               ^~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:834:6: note: Left side of '&&' is true
   drivers/iio/industrialio-buffer.c:835:6: note: Calling 'bitmap_empty'
               bitmap_empty(insert_buffer->scan_mask, indio_dev->masklength=
)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:385:6: note: Left side of '&&' is false
           if (small_const_nbits(nbits))
               ^
   include/asm-generic/bitsperlong.h:36:31: note: expanded from macro 'smal=
l_const_nbits'

vim +23 crypto/ctr.c

23e353c8a681cc3 Joy Latten      2007-10-23  22  =

69d3150cfc2075d Jussi Kivilinna 2012-12-28 @23  struct crypto_rfc3686_req_c=
tx {
69d3150cfc2075d Jussi Kivilinna 2012-12-28  24  	u8 iv[CTR_RFC3686_BLOCK_SI=
ZE];
b2b39c2f976bc7b Herbert Xu      2016-07-12  25  	struct skcipher_request su=
breq CRYPTO_MINALIGN_ATTR;
69d3150cfc2075d Jussi Kivilinna 2012-12-28  26  };
69d3150cfc2075d Jussi Kivilinna 2012-12-28  27  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5774120788063655155==--

