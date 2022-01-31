Content-Type: multipart/mixed; boundary="===============2361988823550481659=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [net-next v8 2/2] net: sched: support hash/classid/cpuid selecting tx queue
Date: Mon, 31 Jan 2022 08:00:28 +0800
Message-ID: <202201310739.dE653dha-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2361988823550481659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220126143206.23023-3-xiangxia.m.yue@gmail.com>
References: <20220126143206.23023-3-xiangxia.m.yue@gmail.com>
TO: xiangxia.m.yue(a)gmail.com

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/xiangxia-m-yue-gmail-com/n=
et-sched-allow-user-to-select-txqueue/20220126-223333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
ab14f1802cfb2d7ca120bbf48e3ba6712314ffc3
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
131/202201310739.dE653dha-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18a=
cb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/fca24c124e1091de78b0488a1=
528bc3b8515ce28
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review xiangxia-m-yue-gmail-com/net-sched=
-allow-user-to-select-txqueue/20220126-223333
        git checkout fca24c124e1091de78b0488a1528bc3b8515ce28
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:154:6: note: Assuming field 'length' is 0
           if (!bf[0].length) {
               ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:154:2: note: Taking true branch
           if (!bf[0].length) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:155:7: note: Assuming field 'offset' is 0
                   if (bf[0].offset)
                       ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:155:3: note: Taking false branch
                   if (bf[0].offset)
                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:159:6: note: Assuming field 'length' is 0
           if (!bf[1].length) {
               ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:159:2: note: Taking true branch
           if (!bf[1].length) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:160:7: note: Assuming field 'offset' is 0
                   if (bf[1].offset)
                       ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:160:3: note: Taking false branch
                   if (bf[1].offset)
                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:164:6: note: Assuming field 'length' is 0
           if (!bf[2].length) {
               ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:164:2: note: Taking true branch
           if (!bf[2].length) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:165:7: note: Assuming field 'offset' is 0
                   if (bf[2].offset)
                       ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:165:3: note: Taking false branch
                   if (bf[2].offset)
                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:170:6: note: Assuming the condition is fal=
se
           if (be16_to_cpu(bf[0].length) < be16_to_cpu(bf[1].length))
               ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^
   include/uapi/linux/swab.h:102:21: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                       ^
   fs/xfs/libxfs/xfs_dir2_data.c:170:2: note: Taking false branch
           if (be16_to_cpu(bf[0].length) < be16_to_cpu(bf[1].length))
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:172:6: note: Assuming the condition is fal=
se
           if (be16_to_cpu(bf[1].length) < be16_to_cpu(bf[2].length))
               ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^
   include/uapi/linux/swab.h:102:21: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                       ^
   fs/xfs/libxfs/xfs_dir2_data.c:172:2: note: Taking false branch
           if (be16_to_cpu(bf[1].length) < be16_to_cpu(bf[2].length))
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:177:9: note: Assuming 'offset' is >=3D 'en=
d'
           while (offset < end) {
                  ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:177:2: note: Loop condition is false. Exec=
ution continues on line 252
           while (offset < end) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:252:6: note: 'freeseen' is equal to 7
           if (freeseen !=3D 7)
               ^~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:252:2: note: Taking false branch
           if (freeseen !=3D 7)
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:254:6: note: Assuming the condition is true
           if (hdr->magic =3D=3D cpu_to_be32(XFS_DIR2_BLOCK_MAGIC) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:254:54: note: Left side of '||' is true
           if (hdr->magic =3D=3D cpu_to_be32(XFS_DIR2_BLOCK_MAGIC) ||
                                                               ^
   fs/xfs/libxfs/xfs_dir2_data.c:256:27: note: Access to field 'count' resu=
lts in a dereference of a null pointer (loaded from variable 'btp')
                   for (i =3D stale =3D 0; i < be32_to_cpu(btp->count); i++=
) {
                                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:58: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                                                            ^~
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> net/sched/act_skbedit.c:272:26: warning: Dereference of null pointer (lo=
aded from variable 'priority') [clang-analyzer-core.NullDereference]
                   params_new->priority =3D *priority;
                                          ^~~~~~~~~
   net/sched/act_skbedit.c:147:18: note: 'priority' initialized to a null p=
ointer value
           u32 flags =3D 0, *priority =3D NULL, *mark =3D NULL, *mask =3D N=
ULL;
                           ^~~~~~~~
   net/sched/act_skbedit.c:154:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:154:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:157:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:157:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:159:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:159:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:162:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:162:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:182:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:182:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:187:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:187:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:192:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:192:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:197:7: note: Assuming 'mapping_hash_type' is not=
 equal to 0
                   if (mapping_hash_type) {
                       ^~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:197:3: note: Taking true branch
                   if (mapping_hash_type) {
                   ^
   net/sched/act_skbedit.c:201:8: note: Assuming the condition is false
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:201:4: note: Taking false branch
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                           ^
   net/sched/act_skbedit.c:206:8: note: Left side of '||' is false
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                               ^
   net/sched/act_skbedit.c:207:8: note: Assuming the condition is false
                               !tb[TCA_SKBEDIT_QUEUE_MAPPING_MAX]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:206:4: note: Taking false branch
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                           ^
   net/sched/act_skbedit.c:214:8: note: Assuming the condition is false
                           if (*queue_mapping_max < *queue_mapping) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:214:4: note: Taking false branch
                           if (*queue_mapping_max < *queue_mapping) {
                           ^
   net/sched/act_skbedit.c:222:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:222:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:229:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:229:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:232:6: note: Assuming 'exists' is true
           if (exists && bind)
               ^~~~~~
   net/sched/act_skbedit.c:232:6: note: Left side of '&&' is true
   net/sched/act_skbedit.c:232:16: note: Assuming 'bind' is false
           if (exists && bind)
                         ^~~~
   net/sched/act_skbedit.c:232:2: note: Taking false branch
           if (exists && bind)
           ^
   net/sched/act_skbedit.c:235:7: note: 'flags' is not equal to 0
           if (!flags) {
                ^~~~~
   net/sched/act_skbedit.c:235:2: note: Taking false branch
           if (!flags) {
           ^
   net/sched/act_skbedit.c:243:7: note: 'exists' is true
           if (!exists) {
                ^~~~~~
   net/sched/act_skbedit.c:243:2: note: Taking false branch
           if (!exists) {
           ^
   net/sched/act_skbedit.c:255:7: note: Assuming the condition is false
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:255:3: note: Taking false branch
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                   ^
   net/sched/act_skbedit.c:261:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:261:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:265:15: note: Assuming 'params_new' is non-null
           if (unlikely(!params_new)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/act_skbedit.c:265:2: note: Taking false branch
           if (unlikely(!params_new)) {
           ^
   net/sched/act_skbedit.c:271:6: note: Assuming the condition is true
           if (flags & SKBEDIT_F_PRIORITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:271:2: note: Taking true branch
           if (flags & SKBEDIT_F_PRIORITY)
           ^
   net/sched/act_skbedit.c:272:26: note: Dereference of null pointer (loade=
d from variable 'priority')
                   params_new->priority =3D *priority;
                                          ^~~~~~~~~
>> net/sched/act_skbedit.c:278:22: warning: Dereference of null pointer (lo=
aded from variable 'mark') [clang-analyzer-core.NullDereference]
                   params_new->mark =3D *mark;
                                      ^~~~~
   net/sched/act_skbedit.c:147:36: note: 'mark' initialized to a null point=
er value
           u32 flags =3D 0, *priority =3D NULL, *mark =3D NULL, *mask =3D N=
ULL;
                                             ^~~~
   net/sched/act_skbedit.c:154:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:154:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:157:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:157:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:159:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:159:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:162:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:162:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:182:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:182:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:187:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:187:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:192:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:192:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:197:7: note: Assuming 'mapping_hash_type' is not=
 equal to 0
                   if (mapping_hash_type) {
                       ^~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:197:3: note: Taking true branch
                   if (mapping_hash_type) {
                   ^
   net/sched/act_skbedit.c:201:8: note: Assuming the condition is false
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:201:4: note: Taking false branch
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                           ^
   net/sched/act_skbedit.c:206:8: note: Left side of '||' is false
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                               ^
   net/sched/act_skbedit.c:207:8: note: Assuming the condition is false
                               !tb[TCA_SKBEDIT_QUEUE_MAPPING_MAX]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:206:4: note: Taking false branch
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                           ^
   net/sched/act_skbedit.c:214:8: note: Assuming the condition is false
                           if (*queue_mapping_max < *queue_mapping) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:214:4: note: Taking false branch
                           if (*queue_mapping_max < *queue_mapping) {
                           ^
   net/sched/act_skbedit.c:222:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:222:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:229:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:229:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:232:6: note: Assuming 'exists' is true
           if (exists && bind)
               ^~~~~~
   net/sched/act_skbedit.c:232:6: note: Left side of '&&' is true
   net/sched/act_skbedit.c:232:16: note: Assuming 'bind' is false
           if (exists && bind)
                         ^~~~
   net/sched/act_skbedit.c:232:2: note: Taking false branch
           if (exists && bind)
           ^
   net/sched/act_skbedit.c:235:7: note: 'flags' is not equal to 0
           if (!flags) {
                ^~~~~
   net/sched/act_skbedit.c:235:2: note: Taking false branch
           if (!flags) {
           ^
   net/sched/act_skbedit.c:243:7: note: 'exists' is true
           if (!exists) {
                ^~~~~~
   net/sched/act_skbedit.c:243:2: note: Taking false branch
           if (!exists) {
           ^
   net/sched/act_skbedit.c:255:7: note: Assuming the condition is false
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:255:3: note: Taking false branch
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                   ^
   net/sched/act_skbedit.c:261:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:261:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:265:15: note: Assuming 'params_new' is non-null
           if (unlikely(!params_new)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/act_skbedit.c:265:2: note: Taking false branch
           if (unlikely(!params_new)) {
           ^
   net/sched/act_skbedit.c:271:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_PRIORITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:271:2: note: Taking false branch
           if (flags & SKBEDIT_F_PRIORITY)
           ^
   net/sched/act_skbedit.c:273:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:273:2: note: Taking false branch
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
           ^
   net/sched/act_skbedit.c:277:6: note: Assuming the condition is true
           if (flags & SKBEDIT_F_MARK)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:277:2: note: Taking true branch
           if (flags & SKBEDIT_F_MARK)
           ^
   net/sched/act_skbedit.c:278:22: note: Dereference of null pointer (loade=
d from variable 'mark')
                   params_new->mark =3D *mark;
                                      ^~~~~
>> net/sched/act_skbedit.c:280:23: warning: Dereference of null pointer (lo=
aded from variable 'ptype') [clang-analyzer-core.NullDereference]
                   params_new->ptype =3D *ptype;
                                       ^~~~~~
   net/sched/act_skbedit.c:148:30: note: 'ptype' initialized to a null poin=
ter value
           u16 *queue_mapping =3D NULL, *ptype =3D NULL;
                                       ^~~~~
   net/sched/act_skbedit.c:154:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:154:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:157:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:157:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:159:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:159:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:162:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:162:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:182:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:182:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:187:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:187:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:192:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:192:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:197:7: note: Assuming 'mapping_hash_type' is not=
 equal to 0
                   if (mapping_hash_type) {
                       ^~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:197:3: note: Taking true branch
                   if (mapping_hash_type) {
                   ^
   net/sched/act_skbedit.c:201:8: note: Assuming the condition is false
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:201:4: note: Taking false branch
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                           ^
   net/sched/act_skbedit.c:206:8: note: Left side of '||' is false
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                               ^
   net/sched/act_skbedit.c:207:8: note: Assuming the condition is false
                               !tb[TCA_SKBEDIT_QUEUE_MAPPING_MAX]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:206:4: note: Taking false branch
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                           ^
   net/sched/act_skbedit.c:214:8: note: Assuming the condition is false
                           if (*queue_mapping_max < *queue_mapping) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:214:4: note: Taking false branch
                           if (*queue_mapping_max < *queue_mapping) {
                           ^
   net/sched/act_skbedit.c:222:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:222:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:229:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:229:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:232:6: note: Assuming 'exists' is true
           if (exists && bind)
               ^~~~~~
   net/sched/act_skbedit.c:232:6: note: Left side of '&&' is true
   net/sched/act_skbedit.c:232:16: note: Assuming 'bind' is false
           if (exists && bind)
                         ^~~~
   net/sched/act_skbedit.c:232:2: note: Taking false branch
           if (exists && bind)
           ^
   net/sched/act_skbedit.c:235:7: note: 'flags' is not equal to 0
           if (!flags) {
                ^~~~~
   net/sched/act_skbedit.c:235:2: note: Taking false branch
           if (!flags) {
           ^
   net/sched/act_skbedit.c:243:7: note: 'exists' is true
           if (!exists) {
                ^~~~~~
   net/sched/act_skbedit.c:243:2: note: Taking false branch
           if (!exists) {
           ^
   net/sched/act_skbedit.c:255:7: note: Assuming the condition is false
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:255:3: note: Taking false branch
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                   ^
   net/sched/act_skbedit.c:261:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:261:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:265:15: note: Assuming 'params_new' is non-null
           if (unlikely(!params_new)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/act_skbedit.c:265:2: note: Taking false branch
           if (unlikely(!params_new)) {
           ^
   net/sched/act_skbedit.c:271:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_PRIORITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:271:2: note: Taking false branch
           if (flags & SKBEDIT_F_PRIORITY)
           ^
   net/sched/act_skbedit.c:273:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:273:2: note: Taking false branch
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
           ^
   net/sched/act_skbedit.c:277:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_MARK)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:277:2: note: Taking false branch
           if (flags & SKBEDIT_F_MARK)
           ^
   net/sched/act_skbedit.c:279:6: note: Assuming the condition is true
           if (flags & SKBEDIT_F_PTYPE)
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:279:2: note: Taking true branch
           if (flags & SKBEDIT_F_PTYPE)
           ^
   net/sched/act_skbedit.c:280:23: note: Dereference of null pointer (loade=
d from variable 'ptype')
                   params_new->ptype =3D *ptype;
                                       ^~~~~~
>> net/sched/act_skbedit.c:284:22: warning: Dereference of null pointer (lo=
aded from variable 'mask') [clang-analyzer-core.NullDereference]
                   params_new->mask =3D *mask;
                                      ^~~~~
   net/sched/act_skbedit.c:147:50: note: 'mask' initialized to a null point=
er value
           u32 flags =3D 0, *priority =3D NULL, *mark =3D NULL, *mask =3D N=
ULL;
                                                           ^~~~
   net/sched/act_skbedit.c:154:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:154:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:157:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:157:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:159:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:159:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:162:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:162:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:182:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:182:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:187:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:187:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:192:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:192:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:197:7: note: Assuming 'mapping_hash_type' is not=
 equal to 0
                   if (mapping_hash_type) {
                       ^~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:197:3: note: Taking true branch
                   if (mapping_hash_type) {
                   ^
   net/sched/act_skbedit.c:201:8: note: Assuming the condition is false
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:201:4: note: Taking false branch
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                           ^
   net/sched/act_skbedit.c:206:8: note: Left side of '||' is false
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                               ^
   net/sched/act_skbedit.c:207:8: note: Assuming the condition is false
                               !tb[TCA_SKBEDIT_QUEUE_MAPPING_MAX]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:206:4: note: Taking false branch
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                           ^
   net/sched/act_skbedit.c:214:8: note: Assuming the condition is false
                           if (*queue_mapping_max < *queue_mapping) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:214:4: note: Taking false branch
                           if (*queue_mapping_max < *queue_mapping) {
                           ^
   net/sched/act_skbedit.c:222:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:222:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)

vim +/priority +272 net/sched/act_skbedit.c

ca9b0e27e072be4 Alexander Duyck   2008-09-12  134  =

c1b52739e45f596 Benjamin LaHaise  2013-01-14  135  static int tcf_skbedit_i=
nit(struct net *net, struct nlattr *nla,
a85a970af265f15 WANG Cong         2016-07-25  136  			    struct nlattr *es=
t, struct tc_action **a,
abbb0d33632ce93 Vlad Buslov       2019-10-30  137  			    struct tcf_proto =
*tp, u32 act_flags,
789871bb2a03814 Vlad Buslov       2018-07-05  138  			    struct netlink_ex=
t_ack *extack)
ca9b0e27e072be4 Alexander Duyck   2008-09-12  139  {
ddf97ccdd7cb7e0 WANG Cong         2016-02-22  140  	struct tc_action_net *t=
n =3D net_generic(net, skbedit_net_id);
695176bfe5dec20 Cong Wang         2021-07-29  141  	bool bind =3D act_flags=
 & TCA_ACT_FLAGS_BIND;
6d7a8df6dfe4d62 Vlad Buslov       2018-09-03  142  	struct tcf_skbedit_para=
ms *params_new;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  143  	struct nlattr *tb[TCA_S=
KBEDIT_MAX + 1];
ec7727bb24b01e9 Davide Caratti    2019-03-20  144  	struct tcf_chain *goto_=
ch =3D NULL;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  145  	struct tc_skbedit *parm;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  146  	struct tcf_skbedit *d;
4fe77d82ef80c77 Antonio Quartulli 2016-10-24  147  	u32 flags =3D 0, *prior=
ity =3D NULL, *mark =3D NULL, *mask =3D NULL;
ff202ee1ed8f032 Jamal Hadi Salim  2016-07-02  148  	u16 *queue_mapping =3D =
NULL, *ptype =3D NULL;
fca24c124e1091d Tonghao Zhang     2022-01-26  149  	u16 mapping_mod =3D 1;
b2313077ed0db35 WANG Cong         2016-06-13  150  	bool exists =3D false;
b2313077ed0db35 WANG Cong         2016-06-13  151  	int ret =3D 0, err;
7be8ef2cdbfe41a Dmytro Linkin     2019-08-01  152  	u32 index;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  153  =

ca9b0e27e072be4 Alexander Duyck   2008-09-12  154  	if (nla =3D=3D NULL)
ca9b0e27e072be4 Alexander Duyck   2008-09-12  155  		return -EINVAL;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  156  =

8cb081746c031fb Johannes Berg     2019-04-26  157  	err =3D nla_parse_neste=
d_deprecated(tb, TCA_SKBEDIT_MAX, nla,
8cb081746c031fb Johannes Berg     2019-04-26  158  					  skbedit_policy, N=
ULL);
ca9b0e27e072be4 Alexander Duyck   2008-09-12  159  	if (err < 0)
ca9b0e27e072be4 Alexander Duyck   2008-09-12  160  		return err;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  161  =

ca9b0e27e072be4 Alexander Duyck   2008-09-12  162  	if (tb[TCA_SKBEDIT_PARM=
S] =3D=3D NULL)
ca9b0e27e072be4 Alexander Duyck   2008-09-12  163  		return -EINVAL;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  164  =

ca9b0e27e072be4 Alexander Duyck   2008-09-12  165  	if (tb[TCA_SKBEDIT_PRIO=
RITY] !=3D NULL) {
ca9b0e27e072be4 Alexander Duyck   2008-09-12  166  		flags |=3D SKBEDIT_F_P=
RIORITY;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  167  		priority =3D nla_data(=
tb[TCA_SKBEDIT_PRIORITY]);
ca9b0e27e072be4 Alexander Duyck   2008-09-12  168  	}
ca9b0e27e072be4 Alexander Duyck   2008-09-12  169  =

ca9b0e27e072be4 Alexander Duyck   2008-09-12  170  	if (tb[TCA_SKBEDIT_QUEU=
E_MAPPING] !=3D NULL) {
ca9b0e27e072be4 Alexander Duyck   2008-09-12  171  		flags |=3D SKBEDIT_F_Q=
UEUE_MAPPING;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  172  		queue_mapping =3D nla_=
data(tb[TCA_SKBEDIT_QUEUE_MAPPING]);
ca9b0e27e072be4 Alexander Duyck   2008-09-12  173  	}
1c55d62e77fa16c jamal             2009-10-15  174  =

ff202ee1ed8f032 Jamal Hadi Salim  2016-07-02  175  	if (tb[TCA_SKBEDIT_PTYP=
E] !=3D NULL) {
ff202ee1ed8f032 Jamal Hadi Salim  2016-07-02  176  		ptype =3D nla_data(tb[=
TCA_SKBEDIT_PTYPE]);
ff202ee1ed8f032 Jamal Hadi Salim  2016-07-02  177  		if (!skb_pkt_type_ok(*=
ptype))
ff202ee1ed8f032 Jamal Hadi Salim  2016-07-02  178  			return -EINVAL;
ff202ee1ed8f032 Jamal Hadi Salim  2016-07-02  179  		flags |=3D SKBEDIT_F_P=
TYPE;
ff202ee1ed8f032 Jamal Hadi Salim  2016-07-02  180  	}
ff202ee1ed8f032 Jamal Hadi Salim  2016-07-02  181  =

1c55d62e77fa16c jamal             2009-10-15  182  	if (tb[TCA_SKBEDIT_MARK=
] !=3D NULL) {
1c55d62e77fa16c jamal             2009-10-15  183  		flags |=3D SKBEDIT_F_M=
ARK;
1c55d62e77fa16c jamal             2009-10-15  184  		mark =3D nla_data(tb[T=
CA_SKBEDIT_MARK]);
1c55d62e77fa16c jamal             2009-10-15  185  	}
1c55d62e77fa16c jamal             2009-10-15  186  =

4fe77d82ef80c77 Antonio Quartulli 2016-10-24  187  	if (tb[TCA_SKBEDIT_MASK=
] !=3D NULL) {
4fe77d82ef80c77 Antonio Quartulli 2016-10-24  188  		flags |=3D SKBEDIT_F_M=
ASK;
4fe77d82ef80c77 Antonio Quartulli 2016-10-24  189  		mask =3D nla_data(tb[T=
CA_SKBEDIT_MASK]);
4fe77d82ef80c77 Antonio Quartulli 2016-10-24  190  	}
4fe77d82ef80c77 Antonio Quartulli 2016-10-24  191  =

e7e3728bd776d1d Qiaobin Fu        2018-07-01  192  	if (tb[TCA_SKBEDIT_FLAG=
S] !=3D NULL) {
e7e3728bd776d1d Qiaobin Fu        2018-07-01  193  		u64 *pure_flags =3D nl=
a_data(tb[TCA_SKBEDIT_FLAGS]);
fca24c124e1091d Tonghao Zhang     2022-01-26  194  		u64 mapping_hash_type;
e7e3728bd776d1d Qiaobin Fu        2018-07-01  195  =

fca24c124e1091d Tonghao Zhang     2022-01-26  196  		mapping_hash_type =3D =
*pure_flags & SKBEDIT_F_TXQ_HASH_MASK;
fca24c124e1091d Tonghao Zhang     2022-01-26  197  		if (mapping_hash_type)=
 {
fca24c124e1091d Tonghao Zhang     2022-01-26  198  			u16 *queue_mapping_ma=
x;
fca24c124e1091d Tonghao Zhang     2022-01-26  199  =

fca24c124e1091d Tonghao Zhang     2022-01-26  200  			/* Hash types are mut=
ually exclusive. */
fca24c124e1091d Tonghao Zhang     2022-01-26  201  			if (mapping_hash_type=
 & (mapping_hash_type - 1)) {
fca24c124e1091d Tonghao Zhang     2022-01-26  202  				NL_SET_ERR_MSG_MOD(e=
xtack, "Multi types of hash are specified.");
fca24c124e1091d Tonghao Zhang     2022-01-26  203  				return -EINVAL;
fca24c124e1091d Tonghao Zhang     2022-01-26  204  			}
fca24c124e1091d Tonghao Zhang     2022-01-26  205  =

fca24c124e1091d Tonghao Zhang     2022-01-26  206  			if (!tb[TCA_SKBEDIT_Q=
UEUE_MAPPING] ||
fca24c124e1091d Tonghao Zhang     2022-01-26  207  			    !tb[TCA_SKBEDIT_Q=
UEUE_MAPPING_MAX]) {
fca24c124e1091d Tonghao Zhang     2022-01-26  208  				NL_SET_ERR_MSG_MOD(e=
xtack, "Missing required range of queue_mapping.");
fca24c124e1091d Tonghao Zhang     2022-01-26  209  				return -EINVAL;
fca24c124e1091d Tonghao Zhang     2022-01-26  210  			}
fca24c124e1091d Tonghao Zhang     2022-01-26  211  =

fca24c124e1091d Tonghao Zhang     2022-01-26  212  			queue_mapping_max =3D
fca24c124e1091d Tonghao Zhang     2022-01-26  213  				nla_data(tb[TCA_SKBE=
DIT_QUEUE_MAPPING_MAX]);
fca24c124e1091d Tonghao Zhang     2022-01-26  214  			if (*queue_mapping_ma=
x < *queue_mapping) {
fca24c124e1091d Tonghao Zhang     2022-01-26  215  				NL_SET_ERR_MSG_MOD(e=
xtack, "The range of queue_mapping is invalid, max < min.");
fca24c124e1091d Tonghao Zhang     2022-01-26  216  				return -EINVAL;
fca24c124e1091d Tonghao Zhang     2022-01-26  217  			}
fca24c124e1091d Tonghao Zhang     2022-01-26  218  =

fca24c124e1091d Tonghao Zhang     2022-01-26  219  			mapping_mod =3D *queu=
e_mapping_max - *queue_mapping + 1;
fca24c124e1091d Tonghao Zhang     2022-01-26  220  			flags |=3D mapping_ha=
sh_type;
fca24c124e1091d Tonghao Zhang     2022-01-26  221  		}
e7e3728bd776d1d Qiaobin Fu        2018-07-01  222  		if (*pure_flags & SKBE=
DIT_F_INHERITDSFIELD)
e7e3728bd776d1d Qiaobin Fu        2018-07-01  223  			flags |=3D SKBEDIT_F_=
INHERITDSFIELD;
e7e3728bd776d1d Qiaobin Fu        2018-07-01  224  	}
e7e3728bd776d1d Qiaobin Fu        2018-07-01  225  =

ca9b0e27e072be4 Alexander Duyck   2008-09-12  226  	parm =3D nla_data(tb[TC=
A_SKBEDIT_PARMS]);
7be8ef2cdbfe41a Dmytro Linkin     2019-08-01  227  	index =3D parm->index;
7be8ef2cdbfe41a Dmytro Linkin     2019-08-01  228  	err =3D tcf_idr_check_a=
lloc(tn, &index, a, bind);
0190c1d452a91c3 Vlad Buslov       2018-07-05  229  	if (err < 0)
0190c1d452a91c3 Vlad Buslov       2018-07-05  230  		return err;
0190c1d452a91c3 Vlad Buslov       2018-07-05  231  	exists =3D err;
5e1567aeb7fe0ca Jamal Hadi Salim  2016-05-10  232  	if (exists && bind)
5e1567aeb7fe0ca Jamal Hadi Salim  2016-05-10  233  		return 0;
5e1567aeb7fe0ca Jamal Hadi Salim  2016-05-10  234  =

5e1567aeb7fe0ca Jamal Hadi Salim  2016-05-10  235  	if (!flags) {
af5d01842fe1fbf Roman Mashak      2018-05-11  236  		if (exists)
65a206c01e8e7ff Chris Mi          2017-08-30  237  			tcf_idr_release(*a, b=
ind);
0190c1d452a91c3 Vlad Buslov       2018-07-05  238  		else
7be8ef2cdbfe41a Dmytro Linkin     2019-08-01  239  			tcf_idr_cleanup(tn, i=
ndex);
5e1567aeb7fe0ca Jamal Hadi Salim  2016-05-10  240  		return -EINVAL;
5e1567aeb7fe0ca Jamal Hadi Salim  2016-05-10  241  	}
5e1567aeb7fe0ca Jamal Hadi Salim  2016-05-10  242  =

5e1567aeb7fe0ca Jamal Hadi Salim  2016-05-10  243  	if (!exists) {
7be8ef2cdbfe41a Dmytro Linkin     2019-08-01  244  		ret =3D tcf_idr_create=
(tn, index, est, a,
40bd094d65fc9f8 Baowen Zheng      2021-12-17  245  				     &act_skbedit_op=
s, bind, true, act_flags);
0190c1d452a91c3 Vlad Buslov       2018-07-05  246  		if (ret) {
7be8ef2cdbfe41a Dmytro Linkin     2019-08-01  247  			tcf_idr_cleanup(tn, i=
ndex);
86062033feb8a16 WANG Cong         2014-02-11  248  			return ret;
0190c1d452a91c3 Vlad Buslov       2018-07-05  249  		}
ca9b0e27e072be4 Alexander Duyck   2008-09-12  250  =

a85a970af265f15 WANG Cong         2016-07-25  251  		d =3D to_skbedit(*a);
ca9b0e27e072be4 Alexander Duyck   2008-09-12  252  		ret =3D ACT_P_CREATED;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  253  	} else {
a85a970af265f15 WANG Cong         2016-07-25  254  		d =3D to_skbedit(*a);
695176bfe5dec20 Cong Wang         2021-07-29  255  		if (!(act_flags & TCA_=
ACT_FLAGS_REPLACE)) {
65a206c01e8e7ff Chris Mi          2017-08-30  256  			tcf_idr_release(*a, b=
ind);
ca9b0e27e072be4 Alexander Duyck   2008-09-12  257  			return -EEXIST;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  258  		}
4e8ddd7f1758ca4 Vlad Buslov       2018-07-05  259  	}
ec7727bb24b01e9 Davide Caratti    2019-03-20  260  	err =3D tcf_action_chec=
k_ctrlact(parm->action, tp, &goto_ch, extack);
ec7727bb24b01e9 Davide Caratti    2019-03-20  261  	if (err < 0)
ec7727bb24b01e9 Davide Caratti    2019-03-20  262  		goto release_idr;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  263  =

c749cdda9089eb1 Davide Caratti    2018-07-11  264  	params_new =3D kzalloc(=
sizeof(*params_new), GFP_KERNEL);
c749cdda9089eb1 Davide Caratti    2018-07-11  265  	if (unlikely(!params_ne=
w)) {
ec7727bb24b01e9 Davide Caratti    2019-03-20  266  		err =3D -ENOMEM;
ec7727bb24b01e9 Davide Caratti    2019-03-20  267  		goto put_chain;
c749cdda9089eb1 Davide Caratti    2018-07-11  268  	}
ca9b0e27e072be4 Alexander Duyck   2008-09-12  269  =

c749cdda9089eb1 Davide Caratti    2018-07-11  270  	params_new->flags =3D f=
lags;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  271  	if (flags & SKBEDIT_F_P=
RIORITY)
c749cdda9089eb1 Davide Caratti    2018-07-11 @272  		params_new->priority =
=3D *priority;
fca24c124e1091d Tonghao Zhang     2022-01-26  273  	if (flags & SKBEDIT_F_Q=
UEUE_MAPPING) {
c749cdda9089eb1 Davide Caratti    2018-07-11  274  		params_new->queue_mapp=
ing =3D *queue_mapping;
fca24c124e1091d Tonghao Zhang     2022-01-26  275  		params_new->mapping_mo=
d =3D mapping_mod;
fca24c124e1091d Tonghao Zhang     2022-01-26  276  	}
1c55d62e77fa16c jamal             2009-10-15  277  	if (flags & SKBEDIT_F_M=
ARK)
c749cdda9089eb1 Davide Caratti    2018-07-11 @278  		params_new->mark =3D *=
mark;
ff202ee1ed8f032 Jamal Hadi Salim  2016-07-02  279  	if (flags & SKBEDIT_F_P=
TYPE)
c749cdda9089eb1 Davide Caratti    2018-07-11 @280  		params_new->ptype =3D =
*ptype;
4fe77d82ef80c77 Antonio Quartulli 2016-10-24  281  	/* default behaviour is=
 to use all the bits */
c749cdda9089eb1 Davide Caratti    2018-07-11  282  	params_new->mask =3D 0x=
ffffffff;
4fe77d82ef80c77 Antonio Quartulli 2016-10-24  283  	if (flags & SKBEDIT_F_M=
ASK)
c749cdda9089eb1 Davide Caratti    2018-07-11 @284  		params_new->mask =3D *=
mask;
1c55d62e77fa16c jamal             2009-10-15  285  =

6d7a8df6dfe4d62 Vlad Buslov       2018-09-03  286  	spin_lock_bh(&d->tcf_lo=
ck);
ec7727bb24b01e9 Davide Caratti    2019-03-20  287  	goto_ch =3D tcf_action_=
set_ctrlact(*a, parm->action, goto_ch);
445d3749315f342 Paul E. McKenney  2019-09-23  288  	params_new =3D rcu_repl=
ace_pointer(d->params, params_new,
6d7a8df6dfe4d62 Vlad Buslov       2018-09-03  289  					 lockdep_is_held(&d=
->tcf_lock));
6d7a8df6dfe4d62 Vlad Buslov       2018-09-03  290  	spin_unlock_bh(&d->tcf_=
lock);
6d7a8df6dfe4d62 Vlad Buslov       2018-09-03  291  	if (params_new)
6d7a8df6dfe4d62 Vlad Buslov       2018-09-03  292  		kfree_rcu(params_new, =
rcu);
ec7727bb24b01e9 Davide Caratti    2019-03-20  293  	if (goto_ch)
ec7727bb24b01e9 Davide Caratti    2019-03-20  294  		tcf_chain_put_by_act(g=
oto_ch);
ca9b0e27e072be4 Alexander Duyck   2008-09-12  295  =

ca9b0e27e072be4 Alexander Duyck   2008-09-12  296  	return ret;
ec7727bb24b01e9 Davide Caratti    2019-03-20  297  put_chain:
ec7727bb24b01e9 Davide Caratti    2019-03-20  298  	if (goto_ch)
ec7727bb24b01e9 Davide Caratti    2019-03-20  299  		tcf_chain_put_by_act(g=
oto_ch);
ec7727bb24b01e9 Davide Caratti    2019-03-20  300  release_idr:
ec7727bb24b01e9 Davide Caratti    2019-03-20  301  	tcf_idr_release(*a, bin=
d);
ec7727bb24b01e9 Davide Caratti    2019-03-20  302  	return err;
ca9b0e27e072be4 Alexander Duyck   2008-09-12  303  }
ca9b0e27e072be4 Alexander Duyck   2008-09-12  304  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2361988823550481659==--

