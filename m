Content-Type: multipart/mixed; boundary="===============8522539783192832724=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 2/7] include/asm-generic/bitops/generic-non-atomic.h:127:16: warning: Array access (from variable 'addr') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Sun, 19 Jun 2022 22:24:47 +0800
Message-ID: <202206192259.xQdByQP6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8522539783192832724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: include/a=
sm-generic/bitops/generic-non-atomic.h:127:16: warning: Array access (from =
variable 'addr') results in a null pointer dereference [clang-analyzer-core=
.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: b9944c14c86ab2ac2a97aeec1426812751e0039b [2/7] bitops: always defin=
e asm-generic non-atomic bitops
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220617 (https://download.01.org/0day-ci/arc=
hive/20220619/202206192259.xQdByQP6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/alobakin/linux/commit/b9944c14c86ab2ac2a97aeec=
1426812751e0039b
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout b9944c14c86ab2ac2a97aeec1426812751e0039b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   mm/hugetlb_cgroup.c:830:2: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cft->name, MAX_CFTYPE_NAME, "%s.rsvd.max_usage_in_bytes=
", buf);
           ^~~~~~~~
   mm/hugetlb_cgroup.c:830:2: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           snprintf(cft->name, MAX_CFTYPE_NAME, "%s.rsvd.max_usage_in_bytes=
", buf);
           ^~~~~~~~
   mm/hugetlb_cgroup.c:837:2: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cft->name, MAX_CFTYPE_NAME, "%s.failcnt", buf);
           ^~~~~~~~
   mm/hugetlb_cgroup.c:837:2: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           snprintf(cft->name, MAX_CFTYPE_NAME, "%s.failcnt", buf);
           ^~~~~~~~
   mm/hugetlb_cgroup.c:844:2: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cft->name, MAX_CFTYPE_NAME, "%s.rsvd.failcnt", buf);
           ^~~~~~~~
   mm/hugetlb_cgroup.c:844:2: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           snprintf(cft->name, MAX_CFTYPE_NAME, "%s.rsvd.failcnt", buf);
           ^~~~~~~~
   mm/hugetlb_cgroup.c:851:2: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cft->name, MAX_CFTYPE_NAME, "%s.numa_stat", buf);
           ^~~~~~~~
   mm/hugetlb_cgroup.c:851:2: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           snprintf(cft->name, MAX_CFTYPE_NAME, "%s.numa_stat", buf);
           ^~~~~~~~
   mm/hugetlb_cgroup.c:857:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cft, 0, sizeof(*cft));
           ^~~~~~
   mm/hugetlb_cgroup.c:857:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(cft, 0, sizeof(*cft));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
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
   fs/ext4/readpage.c:258:7: note: Assuming the condition is false
                   if (page_has_buffers(page))
                       ^
   include/linux/buffer_head.h:146:32: note: expanded from macro 'page_has_=
buffers'
   #define page_has_buffers(page)  PagePrivate(page)
                                   ^~~~~~~~~~~~~~~~~
   fs/ext4/readpage.c:258:3: note: Taking false branch
                   if (page_has_buffers(page))
                   ^
   fs/ext4/readpage.c:266:7: note: Assuming 'last_block' is <=3D 'last_bloc=
k_in_file'
                   if (last_block > last_block_in_file)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/readpage.c:266:3: note: Taking false branch
                   if (last_block > last_block_in_file)
                   ^
   fs/ext4/readpage.c:273:39: note: Left side of '&&' is false
                   if ((map.m_flags & EXT4_MAP_MAPPED) &&
                                                       ^
   fs/ext4/readpage.c:298:10: note: Assuming 'page_block' is >=3D 'blocks_p=
er_page'
                   while (page_block < blocks_per_page) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/readpage.c:298:3: note: Loop condition is false. Execution conti=
nues on line 338
                   while (page_block < blocks_per_page) {
                   ^
   fs/ext4/readpage.c:338:7: note: 'first_hole' is equal to 'blocks_per_pag=
e'
                   if (first_hole !=3D blocks_per_page) {
                       ^~~~~~~~~~
   fs/ext4/readpage.c:338:3: note: Taking false branch
                   if (first_hole !=3D blocks_per_page) {
                   ^
   fs/ext4/readpage.c:349:14: note: 'fully_mapped' is 1
                   } else if (fully_mapped) {
                              ^~~~~~~~~~~~
   fs/ext4/readpage.c:349:10: note: Taking true branch
                   } else if (fully_mapped) {
                          ^
   fs/ext4/readpage.c:357:7: note: 'bio' is null
                   if (bio && (last_block_in_bio !=3D blocks[0] - 1 ||
                       ^~~
   fs/ext4/readpage.c:357:11: note: Left side of '&&' is false
                   if (bio && (last_block_in_bio !=3D blocks[0] - 1 ||
                           ^
   fs/ext4/readpage.c:363:7: note: 'bio' is equal to NULL
                   if (bio =3D=3D NULL) {
                       ^~~
   fs/ext4/readpage.c:363:3: note: Taking true branch
                   if (bio =3D=3D NULL) {
                   ^
   fs/ext4/readpage.c:373:39: note: The left operand of '<<' is a garbage v=
alue
                           bio->bi_iter.bi_sector =3D blocks[0] << (blkbits=
 - 9);
                                                    ~~~~~~~~~ ^
>> include/asm-generic/bitops/generic-non-atomic.h:127:16: warning: Array a=
ccess (from variable 'addr') results in a null pointer dereference [clang-a=
nalyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   fs/ext4/readpage.c:242:26: note: Assuming 'rac' is non-null
           unsigned int nr_pages =3D rac ? readahead_count(rac) : 1;
                                   ^~~
   fs/ext4/readpage.c:242:26: note: '?' condition is true
   fs/ext4/readpage.c:249:2: note: Loop condition is true.  Entering loop b=
ody
           for (; nr_pages; nr_pages--) {
           ^
   fs/ext4/readpage.c:253:7: note: 'rac' is non-null
                   if (rac) {
                       ^~~
   fs/ext4/readpage.c:253:3: note: Taking true branch
                   if (rac) {
                   ^
   fs/ext4/readpage.c:258:7: note: Calling 'PagePrivate'
                   if (page_has_buffers(page))
                       ^
   include/linux/buffer_head.h:146:32: note: expanded from macro 'page_has_=
buffers'
   #define page_has_buffers(page)  PagePrivate(page)
                                   ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:530:1: note: Passing null pointer value via 2=
nd parameter 'addr'
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:447:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:31: note: expanded from macro 'TESTPAGEFL=
AG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:530:1: note: Calling 'generic_test_bit'
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:447:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:10: note: expanded from macro 'TESTPAGEFL=
AG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:26:18: note: expanded from macro=
 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:25:23: note: expanded from macro=
 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   include/asm-generic/bitops/generic-non-atomic.h:127:16: note: Array acce=
ss (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   85 warnings generated.
   init/main.c:344:10: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D snprintf(buf, rest(buf, end), "%s ", xbc=
_namebuf);
                                 ^~~~~~~~
   init/main.c:344:10: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
                           ret =3D snprintf(buf, rest(buf, end), "%s ", xbc=
_namebuf);
                                 ^~~~~~~~
   init/main.c:351:10: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D snprintf(buf, rest(buf, end), "%s=3D\"%s=
\" ",
                                 ^~~~~~~~
   init/main.c:351:10: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
                           ret =3D snprintf(buf, rest(buf, end), "%s=3D\"%s=
\" ",
                                 ^~~~~~~~
   init/main.c:498:4: warning: Call to function 'memmove' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                           memmove(val-1, val, strlen(val)+1);
                           ^~~~~~~
   init/main.c:498:4: note: Call to function 'memmove' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memmove_s' in case of C11
                           memmove(val-1, val, strlen(val)+1);
                           ^~~~~~~
   init/main.c:640:3: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(saved_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:640:3: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                   strcpy(saved_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:641:3: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(static_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:641:3: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                   strcpy(static_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:643:2: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(saved_command_line + xlen, boot_command_line);
           ^~~~~~
   init/main.c:643:2: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
           strcpy(saved_command_line + xlen, boot_command_line);
           ^~~~~~
   init/main.c:644:2: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:644:2: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:656:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:656:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:658:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
--
   block/blk-mq.c:2570:7: note: Assuming 'hctx' is equal to field 'mq_hctx'
                   if (hctx !=3D rq->mq_hctx) {
                       ^~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2570:3: note: Taking false branch
                   if (hctx !=3D rq->mq_hctx) {
                   ^
   block/blk-mq.c:2577:3: note: Control jumps to the 'default' case at line=
 2586
                   switch (ret) {
                   ^
   block/blk-mq.c:2589:4: note:  Execution continues on line 2566
                           break;
                           ^
   block/blk-mq.c:2566:15: note: Left side of '&&' is true
           while ((rq =3D rq_list_pop(&plug->mq_list))) {
                        ^
   include/linux/blk-mq.h:226:6: note: expanded from macro 'rq_list_pop'
           if ((listptr) && *(listptr))    {               \
               ^
   block/blk-mq.c:2566:15: note: Taking false branch
           while ((rq =3D rq_list_pop(&plug->mq_list))) {
                        ^
   include/linux/blk-mq.h:226:2: note: expanded from macro 'rq_list_pop'
           if ((listptr) && *(listptr))    {               \
           ^
   block/blk-mq.c:2566:2: note: Loop condition is false. Execution continue=
s on line 2597
           while ((rq =3D rq_list_pop(&plug->mq_list))) {
           ^
   block/blk-mq.c:2597:6: note: 'errors' is 1
           if (errors)
               ^~~~~~
   block/blk-mq.c:2597:2: note: Taking true branch
           if (errors)
           ^
   block/blk-mq.c:2598:21: note: Passing null pointer value via 1st paramet=
er 'hctx'
                   blk_mq_commit_rqs(hctx, &queued, from_schedule);
                                     ^~~~
   block/blk-mq.c:2598:3: note: Calling 'blk_mq_commit_rqs'
                   blk_mq_commit_rqs(hctx, &queued, from_schedule);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2429:6: note: Access to field 'queue' results in a derefe=
rence of a null pointer (loaded from variable 'hctx')
           if (hctx->queue->mq_ops->commit_rqs) {
               ^~~~
   block/blk-mq.c:3003:6: warning: Branch condition evaluates to a garbage =
value [clang-analyzer-core.uninitialized.Branch]
           if (bio)
               ^~~
   block/blk-mq.c:2964:14: note: 'bio' declared without an initial value
           struct bio *bio, *bio_src;
                       ^~~
   block/blk-mq.c:2966:6: note: Assuming 'bs' is non-null
           if (!bs)
               ^~~
   block/blk-mq.c:2966:2: note: Taking false branch
           if (!bs)
           ^
   block/blk-mq.c:2969:2: note: Assuming field 'bio' is null
           __rq_for_each_bio(bio_src, rq_src) {
           ^
   include/linux/blk-mq.h:981:6: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
               ^~~~~~~~~
   block/blk-mq.c:2969:2: note: Taking false branch
           __rq_for_each_bio(bio_src, rq_src) {
           ^
   include/linux/blk-mq.h:981:2: note: expanded from macro '__rq_for_each_b=
io'
           if ((rq->bio))                  \
           ^
   block/blk-mq.c:2990:6: note: Assuming the condition is false
           if (rq_src->rq_flags & RQF_SPECIAL_PAYLOAD) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2990:2: note: Taking false branch
           if (rq_src->rq_flags & RQF_SPECIAL_PAYLOAD) {
           ^
   block/blk-mq.c:2997:6: note: Assuming field 'bio' is non-null
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
               ^~~~~~~
   block/blk-mq.c:2997:6: note: Left side of '&&' is true
   block/blk-mq.c:2997:17: note: Assuming the condition is true
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2997:2: note: Taking true branch
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
           ^
   block/blk-mq.c:2998:3: note: Control jumps to line 3003
                   goto free_and_out;
                   ^
   block/blk-mq.c:3003:6: note: Branch condition evaluates to a garbage val=
ue
           if (bio)
               ^~~
   block/blk-mq.c:4219:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new_tags, set->tags, cur_nr_hw_queues *
                   ^~~~~~
   block/blk-mq.c:4219:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(new_tags, set->tags, cur_nr_hw_queues *
                   ^~~~~~
   block/blk-mq.c:4329:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(set, 0, sizeof(*set));
           ^~~~~~
   block/blk-mq.c:4329:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(set, 0, sizeof(*set));
           ^~~~~~
>> include/asm-generic/bitops/generic-non-atomic.h:127:16: warning: Array a=
ccess (from variable 'addr') results in a null pointer dereference [clang-a=
nalyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   block/blk-mq.c:3373:9: note: Assuming '____ptr' is null
           hctx =3D hlist_entry_safe(node, struct blk_mq_hw_ctx, cpuhp_dead=
);
                  ^
   include/linux/list.h:1029:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   block/blk-mq.c:3373:9: note: '?' condition is false
           hctx =3D hlist_entry_safe(node, struct blk_mq_hw_ctx, cpuhp_dead=
);
                  ^
   include/linux/list.h:1029:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   block/blk-mq.c:3374:7: note: Calling 'cpumask_test_cpu'
           if (!cpumask_test_cpu(cpu, hctx->cpumask))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:379:38: note: Passing null pointer value via 2nd=
 parameter 'addr'
           return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
                                               ^
   include/linux/cpumask.h:26:29: note: expanded from macro 'cpumask_bits'
   #define cpumask_bits(maskp) ((maskp)->bits)
                               ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:379:9: note: Calling 'generic_test_bit'
           return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
                  ^
   include/asm-generic/bitops/non-atomic.h:26:18: note: expanded from macro=
 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:25:23: note: expanded from macro=
 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   include/asm-generic/bitops/generic-non-atomic.h:127:16: note: Array acce=
ss (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   crypto/aead.c:36:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   crypto/aead.c:36:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   crypto/aead.c:38:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(alignbuffer, 0, keylen);
           ^~~~~~
   crypto/aead.c:38:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(alignbuffer, 0, keylen);
           ^~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   crypto/geniv.c:77:6: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/geniv.c:77:6: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/geniv.c:81:6: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/geniv.c:81:6: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   crypto/skcipher.c:129:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(walk->dst.virt.addr, walk->page, n);
                   ^~~~~~
   crypto/skcipher.c:129:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(walk->dst.virt.addr, walk->page, n);
                   ^~~~~~
   crypto/skcipher.c:129:3: warning: Null pointer passed as 2nd argument to=
 memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(walk->dst.virt.addr, walk->page, n);
                   ^
   crypto/skcipher.c:563:9: note: Calling 'skcipher_walk_aead_common'
           return skcipher_walk_aead_common(walk, req, atomic);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:515:15: note: Assuming field 'total' is not equal to 0
           if (unlikely(!walk->total))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   crypto/skcipher.c:515:2: note: Taking false branch
           if (unlikely(!walk->total))
           ^
   crypto/skcipher.c:529:6: note: Assuming the condition is false
           if (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:529:2: note: Taking false branch
           if (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP)
           ^
   crypto/skcipher.c:539:8: note: Calling 'skcipher_walk_first'
           err =3D skcipher_walk_first(walk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/skcipher.c:434:6: note: Assuming the condition is true
           if (WARN_ON_ONCE(in_hardirq()))
--
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/buffer.c:1982:9: note: Assuming the condition is false
           BUG_ON(to > PAGE_SIZE);
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/buffer.c:1982:2: note: Taking false branch
           BUG_ON(to > PAGE_SIZE);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/buffer.c:1982:2: note: Loop condition is false.  Exiting loop
           BUG_ON(to > PAGE_SIZE);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/buffer.c:1983:9: note: Assuming 'from' is <=3D 'to'
           BUG_ON(from > to);
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/buffer.c:1983:2: note: Taking false branch
           BUG_ON(from > to);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/buffer.c:1983:2: note: Loop condition is false.  Exiting loop
           BUG_ON(from > to);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/buffer.c:1991:34: note: 'bh' is equal to 'head'
           for(bh =3D head, block_start =3D 0; bh !=3D head || !block_start;
                                           ^~
   fs/buffer.c:1991:34: note: Left side of '||' is false
   fs/buffer.c:1991:2: note: Loop condition is true.  Entering loop body
           for(bh =3D head, block_start =3D 0; bh !=3D head || !block_start;
           ^
   fs/buffer.c:1994:7: note: Assuming 'block_end' is > 'from'
                   if (block_end <=3D from || block_start >=3D to) {
                       ^~~~~~~~~~~~~~~~~
   fs/buffer.c:1994:7: note: Left side of '||' is false
   fs/buffer.c:1994:28: note: Assuming 'block_start' is < 'to'
                   if (block_end <=3D from || block_start >=3D to) {
                                            ^~~~~~~~~~~~~~~~~
   fs/buffer.c:1994:3: note: Taking false branch
                   if (block_end <=3D from || block_start >=3D to) {
                   ^
   fs/buffer.c:2001:7: note: Assuming the condition is false
                   if (buffer_new(bh))
                       ^~~~~~~~~~~~~~
   fs/buffer.c:2001:3: note: Taking false branch
                   if (buffer_new(bh))
                   ^
   fs/buffer.c:2003:7: note: Assuming the condition is true
                   if (!buffer_mapped(bh)) {
                       ^~~~~~~~~~~~~~~~~~
   fs/buffer.c:2003:3: note: Taking true branch
                   if (!buffer_mapped(bh)) {
                   ^
   fs/buffer.c:2004:4: note: Taking false branch
                           WARN_ON(bh->b_size !=3D blocksize);
                           ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/buffer.c:2005:8: note: Assuming 'get_block' is null
                           if (get_block) {
                               ^~~~~~~~~
   fs/buffer.c:2005:4: note: Taking false branch
                           if (get_block) {
                           ^
   fs/buffer.c:2010:35: note: Passing null pointer value via 4th parameter =
'iomap'
                                   iomap_to_bh(inode, block, bh, iomap);
                                                                 ^~~~~
   fs/buffer.c:2010:5: note: Calling 'iomap_to_bh'
                                   iomap_to_bh(inode, block, bh, iomap);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/buffer.c:1919:15: note: Access to field 'bdev' results in a dereferen=
ce of a null pointer (loaded from variable 'iomap')
           bh->b_bdev =3D iomap->bdev;
                        ^~~~~
   fs/buffer.c:2901:2: warning: Value stored to 'err' is never read [clang-=
analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   fs/buffer.c:2901:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
>> include/asm-generic/bitops/generic-non-atomic.h:127:16: warning: Array a=
ccess (from variable 'addr') results in a null pointer dereference [clang-a=
nalyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   fs/buffer.c:349:9: note: Assuming the condition is false
           BUG_ON(!buffer_async_write(bh));
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/buffer.c:349:2: note: Taking false branch
           BUG_ON(!buffer_async_write(bh));
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/buffer.c:349:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!buffer_async_write(bh));
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/buffer.c:352:6: note: Assuming 'uptodate' is 0
           if (uptodate) {
               ^~~~~~~~
   fs/buffer.c:352:2: note: Taking false branch
           if (uptodate) {
           ^
   fs/buffer.c:361:10: note: Calling 'PagePrivate'
           first =3D page_buffers(page);
                   ^
   include/linux/buffer_head.h:143:11: note: expanded from macro 'page_buff=
ers'
                   BUG_ON(!PagePrivate(page));                     \
                   ~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/page-flags.h:530:1: note: Passing null pointer value via 2=
nd parameter 'addr'
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:447:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:31: note: expanded from macro 'TESTPAGEFL=
AG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:530:1: note: Calling 'generic_test_bit'
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:447:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:10: note: expanded from macro 'TESTPAGEFL=
AG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:26:18: note: expanded from macro=
 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:25:23: note: expanded from macro=
 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   include/asm-generic/bitops/generic-non-atomic.h:127:16: note: Array acce=
ss (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   include/linux/list.h:88:24: warning: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'head') [clang-analyze=
r-core.NullDereference]
           __list_add(new, head, head->next);
                                 ^
   fs/buffer.c:545:6: note: Assuming 'buffer_mapping' is not equal to NULL
           if (buffer_mapping =3D=3D NULL || list_empty(&mapping->private_l=
ist))
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/buffer.c:545:6: note: Left side of '||' is false
   fs/buffer.c:545:32: note: Assuming the condition is false
           if (buffer_mapping =3D=3D NULL || list_empty(&mapping->private_l=
ist))
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/buffer.c:545:2: note: Taking false branch
           if (buffer_mapping =3D=3D NULL || list_empty(&mapping->private_l=
ist))
           ^
   fs/buffer.c:548:9: note: Calling 'fsync_buffers_list'
           return fsync_buffers_list(&buffer_mapping->private_lock,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/buffer.c:682:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(list)) {
           ^
   fs/buffer.c:685:3: note: Calling '__remove_assoc_queue'
                   __remove_assoc_queue(bh);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/buffer.c:480:10: note: Assuming field 'b_assoc_map' is non-null
           WARN_ON(!bh->b_assoc_map);
                   ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/buffer.c:480:2: note: Taking false branch
           WARN_ON(!bh->b_assoc_map);
           ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
--
                                                  ~~~~~~~~~~~~^~~~~~~~
   arch/riscv/include/asm/mmio.h:93:71: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                    ~~~~~~~=
~~~~~^~
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/gpio/gpiolib-cdev.c:213:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ghd, 0, sizeof(ghd));
                   ^~~~~~
   drivers/gpio/gpiolib-cdev.c:213:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(&ghd, 0, sizeof(ghd));
                   ^~~~~~
   drivers/gpio/gpiolib-cdev.c:586:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:586:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:666:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:666:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:798:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:798:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&le, 0, sizeof(le));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:1448:4: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EIO;
                           ^     ~~~~
   drivers/gpio/gpiolib-cdev.c:1448:4: note: Value stored to 'ret' is never=
 read
                           ret =3D -EIO;
                           ^     ~~~~
   drivers/gpio/gpiolib-cdev.c:1754:4: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EIO;
                           ^     ~~~~
   drivers/gpio/gpiolib-cdev.c:1754:4: note: Value stored to 'ret' is never=
 read
                           ret =3D -EIO;
                           ^     ~~~~
   drivers/gpio/gpiolib-cdev.c:1797:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ghd, 0, sizeof(ghd));
                   ^~~~~~
   drivers/gpio/gpiolib-cdev.c:1797:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(&ghd, 0, sizeof(ghd));
                   ^~~~~~
   drivers/gpio/gpiolib-cdev.c:1839:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ge, 0, sizeof(ge));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:1839:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&ge, 0, sizeof(ge));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2038:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(info_v1->name, info_v2->name, sizeof(info_v1->name));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2038:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(info_v1->name, info_v2->name, sizeof(info_v1->name));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2039:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(info_v1->consumer, info_v2->consumer, sizeof(info_v1->con=
sumer));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2039:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(info_v1->consumer, info_v2->consumer, sizeof(info_v1->con=
sumer));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2069:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(lic_v1, 0, sizeof(*lic_v1));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2069:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(lic_v1, 0, sizeof(*lic_v1));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2086:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2086:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2178:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&chipinfo, 0, sizeof(chipinfo));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2178:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&chipinfo, 0, sizeof(chipinfo));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2355:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&chg, 0, sizeof(chg));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2355:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&chg, 0, sizeof(chg));
           ^~~~~~
   drivers/gpio/gpiolib-cdev.c:2433:4: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EIO;
                           ^     ~~~~
   drivers/gpio/gpiolib-cdev.c:2433:4: note: Value stored to 'ret' is never=
 read
                           ret =3D -EIO;
                           ^     ~~~~
>> include/asm-generic/bitops/generic-non-atomic.h:32:6: warning: The left =
expression of the compound assignment is an uninitialized value. The comput=
ed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p  |=3D mask;
               ^
   drivers/gpio/gpiolib-cdev.c:204:2: note: Control jumps to 'case 32254658=
65:'  at line 221
           switch (cmd) {
           ^
   drivers/gpio/gpiolib-cdev.c:226:7: note: Assuming the condition is false
                   if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:226:3: note: Taking false branch
                   if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
                   ^
   drivers/gpio/gpiolib-cdev.c:229:7: note: Assuming the condition is false
                   if (copy_from_user(&ghd, ip, sizeof(ghd)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:229:3: note: Taking false branch
                   if (copy_from_user(&ghd, ip, sizeof(ghd)))
                   ^
   drivers/gpio/gpiolib-cdev.c:233:15: note: Assuming 'i' is < field 'num_d=
escs'
                   for (i =3D 0; i < lh->num_descs; i++)
                               ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:233:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (i =3D 0; i < lh->num_descs; i++)
                   ^
   drivers/gpio/gpiolib-cdev.c:234:4: note: Calling '__assign_bit'
                           __assign_bit(i, vals, ghd.values[i]);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:217:6: note: Assuming 'value' is true
           if (value)
               ^~~~~
   include/linux/bitops.h:217:2: note: Taking true branch
           if (value)
           ^
   include/linux/bitops.h:218:3: note: Calling 'generic___set_bit'
                   __set_bit(nr, addr);
                   ^
   include/asm-generic/bitops/non-atomic.h:8:19: note: expanded from macro =
'__set_bit'
   #define __set_bit arch___set_bit
                     ^
   include/asm-generic/bitops/non-atomic.h:7:24: note: expanded from macro =
'arch___set_bit'
   #define arch___set_bit generic___set_bit
                          ^
   include/asm-generic/bitops/generic-non-atomic.h:32:6: note: The left exp=
ression of the compound assignment is an uninitialized value. The computed =
value will also be garbage
           *p  |=3D mask;
           ~~  ^
   include/asm-generic/bitops/generic-non-atomic.h:41:5: warning: The left =
expression of the compound assignment is an uninitialized value. The comput=
ed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p &=3D ~mask;
              ^
   drivers/gpio/gpiolib-cdev.c:204:2: note: Control jumps to 'case 32254658=
65:'  at line 221
           switch (cmd) {
           ^
   drivers/gpio/gpiolib-cdev.c:226:7: note: Assuming the condition is false
                   if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:226:3: note: Taking false branch
                   if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
                   ^
   drivers/gpio/gpiolib-cdev.c:229:7: note: Assuming the condition is false
                   if (copy_from_user(&ghd, ip, sizeof(ghd)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:229:3: note: Taking false branch
                   if (copy_from_user(&ghd, ip, sizeof(ghd)))
                   ^
   drivers/gpio/gpiolib-cdev.c:233:15: note: Assuming 'i' is < field 'num_d=
escs'
                   for (i =3D 0; i < lh->num_descs; i++)
                               ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:233:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (i =3D 0; i < lh->num_descs; i++)
                   ^
   drivers/gpio/gpiolib-cdev.c:234:4: note: Calling '__assign_bit'
                           __assign_bit(i, vals, ghd.values[i]);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:217:6: note: Assuming 'value' is false
           if (value)
               ^~~~~
   include/linux/bitops.h:217:2: note: Taking false branch
           if (value)
           ^
   include/linux/bitops.h:220:3: note: Calling 'generic___clear_bit'
                   __clear_bit(nr, addr);
                   ^
   include/asm-generic/bitops/non-atomic.h:11:21: note: expanded from macro=
 '__clear_bit'
   #define __clear_bit arch___clear_bit
                       ^
   include/asm-generic/bitops/non-atomic.h:10:26: note: expanded from macro=
 'arch___clear_bit'
   #define arch___clear_bit generic___clear_bit
                            ^
   include/asm-generic/bitops/generic-non-atomic.h:41:5: note: The left exp=
ression of the compound assignment is an uninitialized value. The computed =
value will also be garbage
           *p &=3D ~mask;
           ~~ ^
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   fs/proc/generic.c:440:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ent->name, fn, qstr.len + 1);
           ^~~~~~
   fs/proc/generic.c:440:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(ent->name, fn, qstr.len + 1);
           ^~~~~~
   fs/proc/generic.c:470:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy((char*)ent->data,dest);
--
           ^      ~~~
   fs/sysfs/file.c:48:19: note: Assuming field 'show' is non-null
           if (WARN_ON_ONCE(!ops->show))
                            ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   fs/sysfs/file.c:48:6: note: Taking false branch
           if (WARN_ON_ONCE(!ops->show))
               ^
   include/asm-generic/bug.h:111:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
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
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/seq_file.h:66:2: note: Taking false branch
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/seq_file.h:66:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
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
   fs/sysfs/file.c:121:3: warning: Call to function 'memmove' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(buf, buf + pos, len);
                   ^~~~~~~
   fs/sysfs/file.c:121:3: note: Call to function 'memmove' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memmove_s' in case of C11
                   memmove(buf, buf + pos, len);
                   ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   mm/debug.c:262:3: warning: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   memset(page, PAGE_POISON_PATTERN, size);
                   ^~~~~~
   mm/debug.c:262:3: note: Call to function 'memset' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memset_s' in case of C11
                   memset(page, PAGE_POISON_PATTERN, size);
                   ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   mm/gup.c:711:2: warning: Value stored to 'page' is never read [clang-ana=
lyzer-deadcode.DeadStores]
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:711:2: note: Value stored to 'page' is never read
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
>> include/asm-generic/bitops/generic-non-atomic.h:127:16: warning: Array a=
ccess (from variable 'addr') results in a null pointer dereference [clang-a=
nalyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   mm/memory.c:3723:2: note: Taking false branch
           if (!pte_unmap_same(vmf))
           ^
   mm/memory.c:3727:2: note: Taking false branch
           if (unlikely(non_swap_entry(entry))) {
           ^
   mm/memory.c:3752:15: note: Assuming 'si' is non-null
           if (unlikely(!si))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/memory.c:3752:2: note: Taking false branch
           if (unlikely(!si))
           ^
   mm/memory.c:3758:6: note: Assuming 'page' is non-null
           if (!page) {
               ^~~~~
   mm/memory.c:3758:2: note: Taking false branch
           if (!page) {
           ^
   mm/memory.c:3809:9: note: Taking false branch
           } else if (PageHWPoison(page)) {
                  ^
   mm/memory.c:3820:7: note: 'locked' is 1
           if (!locked) {
                ^~~~~~
   mm/memory.c:3820:2: note: Taking false branch
           if (!locked) {
           ^
   mm/memory.c:3825:6: note: 'swapcache' is non-null
           if (swapcache) {
               ^~~~~~~~~
   mm/memory.c:3825:2: note: Taking true branch
           if (swapcache) {
           ^
   mm/memory.c:3833:16: note: Assuming the condition is false
                   if (unlikely(!PageSwapCache(page) ||
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/memory.c:3833:16: note: Left side of '||' is false
                   if (unlikely(!PageSwapCache(page) ||
                                ^
   mm/memory.c:3834:9: note: Assuming field 'private' is equal to field 'va=
l'
                                page_private(page) !=3D entry.val))
                                ^
   include/linux/mm_types.h:328:29: note: expanded from macro 'page_private'
   #define page_private(page)              ((page)->private)
                                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/memory.c:3833:3: note: Taking false branch
                   if (unlikely(!PageSwapCache(page) ||
                   ^
   mm/memory.c:3843:17: note: 'page' is non-null
                   if (unlikely(!page)) {
                                 ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/memory.c:3843:3: note: Taking false branch
                   if (unlikely(!page)) {
                   ^
   mm/memory.c:3855:8: note: Assuming the condition is true
                   if ((vmf->flags & FAULT_FLAG_WRITE) && page =3D=3D swapc=
ache &&
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:3855:7: note: Left side of '&&' is true
                   if ((vmf->flags & FAULT_FLAG_WRITE) && page =3D=3D swapc=
ache &&
                       ^
   mm/memory.c:3855:42: note: 'page' is equal to 'swapcache'
                   if ((vmf->flags & FAULT_FLAG_WRITE) && page =3D=3D swapc=
ache &&
                                                          ^~~~
   mm/memory.c:3855:7: note: Left side of '&&' is true
                   if ((vmf->flags & FAULT_FLAG_WRITE) && page =3D=3D swapc=
ache &&
                       ^
   mm/memory.c:3855:7: note: Left side of '&&' is true
   mm/memory.c:3856:25: note: Assuming the condition is false
                       !PageKsm(page) && !PageLRU(page))
                                         ^~~~~~~~~~~~~~
   mm/memory.c:3855:3: note: Taking false branch
                   if ((vmf->flags & FAULT_FLAG_WRITE) && page =3D=3D swapc=
ache &&
                   ^
   mm/memory.c:3867:2: note: Taking false branch
           if (unlikely(!pte_same(*vmf->pte, vmf->orig_pte)))
           ^
   mm/memory.c:3870:2: note: Taking false branch
           if (unlikely(!PageUptodate(page))) {
           ^
   mm/memory.c:3883:9: note: Assuming the condition is false
           BUG_ON(!PageAnon(page) && PageMappedToDisk(page));
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
--
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu=
_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_a=
dd'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   note: expanded from here
   include/asm-generic/percpu.h:227:34: note: expanded from macro 'raw_cpu_=
add_4'
   #define raw_cpu_add_4(pcp, val)         raw_cpu_generic_to_op(pcp, val, =
+=3D)
                                           ^
   include/asm-generic/percpu.h:70:48: note: expanded from macro 'raw_cpu_g=
eneric_to_op'
   #define raw_cpu_generic_to_op(pcp, val, op)                             \
                                                                           ^
   kernel/rcu/rcutorture.c:1706:2: note:  Execution continues on line 1706
           __this_cpu_inc(rcu_torture_batch[completed]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cp=
u_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu=
_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_a=
dd'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^
   include/linux/percpu-defs.h:379:42: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                                                          ^
   kernel/rcu/rcutorture.c:1706:2: note: Loop condition is false.  Exiting =
loop
           __this_cpu_inc(rcu_torture_batch[completed]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cp=
u_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu=
_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_a=
dd'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^
   include/linux/percpu-defs.h:373:50: note: expanded from macro '__pcpu_si=
ze_call'
   #define __pcpu_size_call(stem, variable, ...)                           \
                                                                           ^
   kernel/rcu/rcutorture.c:1707:2: note: Taking false branch
           preempt_enable();
           ^
   include/linux/preempt.h:221:2: note: expanded from macro 'preempt_enable'
           if (unlikely(preempt_count_dec_and_test())) \
           ^
   kernel/rcu/rcutorture.c:1707:2: note: Loop condition is false.  Exiting =
loop
           preempt_enable();
           ^
   include/linux/preempt.h:218:26: note: expanded from macro 'preempt_enabl=
e'
   #define preempt_enable() \
                            ^
   kernel/rcu/rcutorture.c:1708:6: note: Assuming field 'get_gp_state' is n=
on-null
           if (cur_ops->get_gp_state && cur_ops->poll_gp_state)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcutorture.c:1708:6: note: Left side of '&&' is true
   kernel/rcu/rcutorture.c:1708:31: note: Assuming field 'poll_gp_state' is=
 non-null
           if (cur_ops->get_gp_state && cur_ops->poll_gp_state)
                                        ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcutorture.c:1708:2: note: Taking true branch
           if (cur_ops->get_gp_state && cur_ops->poll_gp_state)
           ^
   kernel/rcu/rcutorture.c:1709:13: note: 1st function call argument is an =
uninitialized value
                   WARN_ONCE(cur_ops->poll_gp_state(cookie),
                             ^
   include/asm-generic/bug.h:151:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   kernel/rcu/rcutorture.c:2908:4: warning: Value stored to 'errexit' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           errexit =3D true;
                           ^         ~~~~
   kernel/rcu/rcutorture.c:2908:4: note: Value stored to 'errexit' is never=
 read
                           errexit =3D true;
                           ^         ~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/tty/serial/rda-uart.c:212:2: warning: Value stored to 'val' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           val =3D rda_uart_read(port, RDA_UART_RXTX_BUFFER);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/rda-uart.c:212:2: note: Value stored to 'val' is neve=
r read
           val =3D rda_uart_read(port, RDA_UART_RXTX_BUFFER);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
>> include/asm-generic/bitops/generic-non-atomic.h:32:6: warning: The left =
expression of the compound assignment is an uninitialized value. The comput=
ed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p  |=3D mask;
               ^
   drivers/tty/serial/serial_mctrl_gpio.c:52:6: note: Assuming 'gpios' is n=
ot equal to NULL
           if (gpios =3D=3D NULL)
               ^~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:52:2: note: Taking false branch
           if (gpios =3D=3D NULL)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:55:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < UART_GPIO_MAX; i++)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Assuming the conditio=
n is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                       ^~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Left side of '&&' is =
true
   drivers/tty/serial/serial_mctrl_gpio.c:56:25: note: Assuming the conditi=
on is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:3: note: Taking true branch
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                   ^
   drivers/tty/serial/serial_mctrl_gpio.c:58:4: note: Calling '__assign_bit'
                           __assign_bit(count, values,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:217:6: note: Assuming 'value' is true
           if (value)
               ^~~~~
   include/linux/bitops.h:217:2: note: Taking true branch
           if (value)
           ^
   include/linux/bitops.h:218:3: note: Calling 'generic___set_bit'
                   __set_bit(nr, addr);
                   ^
   include/asm-generic/bitops/non-atomic.h:8:19: note: expanded from macro =
'__set_bit'
   #define __set_bit arch___set_bit
                     ^
   include/asm-generic/bitops/non-atomic.h:7:24: note: expanded from macro =
'arch___set_bit'
   #define arch___set_bit generic___set_bit
                          ^
   include/asm-generic/bitops/generic-non-atomic.h:32:6: note: The left exp=
ression of the compound assignment is an uninitialized value. The computed =
value will also be garbage
           *p  |=3D mask;
           ~~  ^
   include/asm-generic/bitops/generic-non-atomic.h:41:5: warning: The left =
expression of the compound assignment is an uninitialized value. The comput=
ed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p &=3D ~mask;
              ^
   drivers/tty/serial/serial_mctrl_gpio.c:52:6: note: Assuming 'gpios' is n=
ot equal to NULL
           if (gpios =3D=3D NULL)
               ^~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:52:2: note: Taking false branch
           if (gpios =3D=3D NULL)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:55:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < UART_GPIO_MAX; i++)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Assuming the conditio=
n is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                       ^~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Left side of '&&' is =
true
   drivers/tty/serial/serial_mctrl_gpio.c:56:25: note: Assuming the conditi=
on is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:3: note: Taking true branch
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                   ^
   drivers/tty/serial/serial_mctrl_gpio.c:58:4: note: Calling '__assign_bit'
                           __assign_bit(count, values,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:217:6: note: Assuming 'value' is false
           if (value)
               ^~~~~
   include/linux/bitops.h:217:2: note: Taking false branch
           if (value)
           ^
   include/linux/bitops.h:220:3: note: Calling 'generic___clear_bit'
                   __clear_bit(nr, addr);
                   ^
   include/asm-generic/bitops/non-atomic.h:11:21: note: expanded from macro=
 '__clear_bit'
   #define __clear_bit arch___clear_bit
                       ^
   include/asm-generic/bitops/non-atomic.h:10:26: note: expanded from macro=
 'arch___clear_bit'
   #define arch___clear_bit generic___clear_bit
                            ^
   include/asm-generic/bitops/generic-non-atomic.h:41:5: note: The left exp=
ression of the compound assignment is an uninitialized value. The computed =
value will also be garbage
           *p &=3D ~mask;
           ~~ ^
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
--
           ^
   drivers/hwmon/pmbus/zl6100.c:106:3: note: The value -1 is assigned to 'e=
xponent'
                   exponent--;
                   ^~~~~~~~~~
   drivers/hwmon/pmbus/zl6100.c:105:9: note: Assuming the condition is false
           while (val < MIN_MANTISSA && exponent > -15) {
                  ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/zl6100.c:105:28: note: Left side of '&&' is false
           while (val < MIN_MANTISSA && exponent > -15) {
                                     ^
   drivers/hwmon/pmbus/zl6100.c:111:13: note: Left side of '||' is false
           mantissa =3D DIV_ROUND_CLOSEST(val, 1000);
                      ^
   include/linux/math.h:90:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/pmbus/zl6100.c:111:13: note: Left side of '||' is false
           mantissa =3D DIV_ROUND_CLOSEST(val, 1000);
                      ^
   include/linux/math.h:90:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/pmbus/zl6100.c:111:13: note: '__x' is > 0
           mantissa =3D DIV_ROUND_CLOSEST(val, 1000);
                      ^
   include/linux/math.h:92:5: note: expanded from macro 'DIV_ROUND_CLOSEST'
            (((__x) > 0) =3D=3D ((__d) > 0))) ?                \
              ^~~~~
   drivers/hwmon/pmbus/zl6100.c:111:13: note: '?' condition is true
           mantissa =3D DIV_ROUND_CLOSEST(val, 1000);
                      ^
   include/linux/math.h:90:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
           ^
   drivers/hwmon/pmbus/zl6100.c:114:6: note: Assuming 'mantissa' is <=3D 10=
23
           if (mantissa > 0x3ff)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/zl6100.c:114:2: note: Taking false branch
           if (mantissa > 0x3ff)
           ^
   drivers/hwmon/pmbus/zl6100.c:118:6: note: 'negative' is false
           if (negative)
               ^~~~~~~~
   drivers/hwmon/pmbus/zl6100.c:118:2: note: Taking false branch
           if (negative)
           ^
   drivers/hwmon/pmbus/zl6100.c:122:41: note: The result of the left shift =
is undefined because the left operand is negative
           return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
                                         ~~~~~~~~ ^
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/input/misc/kxtj9.c:299:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", tj9->last_poll_interval);
                  ^~~~~~~
   drivers/input/misc/kxtj9.c:299:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", tj9->last_poll_interval);
                  ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   drivers/input/misc/uinput.c:956:4: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&ff_up.old, 0, sizeof(struct ff_effect));
                           ^~~~~~
   drivers/input/misc/uinput.c:956:4: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                           memset(&ff_up.old, 0, sizeof(struct ff_effect));
                           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/input/joydev.c:465:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(joydev->abspam, abspam, len);
           ^~~~~~
   drivers/input/joydev.c:465:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(joydev->abspam, abspam, len);
           ^~~~~~
   drivers/input/joydev.c:499:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(joydev->keypam, keypam, len);
           ^~~~~~
   drivers/input/joydev.c:499:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(joydev->keypam, keypam, len);
           ^~~~~~
>> include/asm-generic/bitops/generic-non-atomic.h:127:16: warning: Array a=
ccess (from variable 'addr') results in a null pointer dereference [clang-a=
nalyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/input/joydev.c:919:6: note: Assuming 'minor' is >=3D 0
           if (minor < 0) {
               ^~~~~~~~~
   drivers/input/joydev.c:919:2: note: Taking false branch
           if (minor < 0) {
           ^
   drivers/input/joydev.c:925:11: note: Calling 'kzalloc'
           joydev =3D kzalloc(sizeof(struct joydev), GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:588:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:605:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joydev.c:925:11: note: Returning from 'kzalloc'
           joydev =3D kzalloc(sizeof(struct joydev), GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joydev.c:926:6: note: Assuming 'joydev' is non-null
           if (!joydev) {
               ^~~~~~~
   drivers/input/joydev.c:926:2: note: Taking false branch
           if (!joydev) {
           ^
   drivers/input/joydev.c:932:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_init(&joydev->client_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/input/joydev.c:933:2: note: Loop condition is false.  Exiting lo=
op
           mutex_init(&joydev->mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/input/joydev.c:934:2: note: Loop condition is false.  Exiting lo=
op
           init_waitqueue_head(&joydev->wait);
           ^
   include/linux/wait.h:67:2: note: expanded from macro 'init_waitqueue_hea=
d'
           do {                                                            =
        \
           ^
   drivers/input/joydev.c:939:6: note: Assuming the condition is false
           if (dev_no < JOYDEV_MINOR_BASE + JOYDEV_MINORS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joydev.c:939:2: note: Taking false branch
           if (dev_no < JOYDEV_MINOR_BASE + JOYDEV_MINORS)
           ^
   drivers/input/joydev.c:948:2: note: Assuming the condition is false
           for_each_set_bit(i, dev->absbit, ABS_CNT) {
           ^
   include/linux/find.h:284:7: note: expanded from macro 'for_each_set_bit'
                (bit) < (size);                                    \
                ^~~~~~~~~~~~~~
   drivers/input/joydev.c:948:2: note: Loop condition is false. Execution c=
ontinues on line 954
           for_each_set_bit(i, dev->absbit, ABS_CNT) {
           ^
   include/linux/find.h:283:2: note: expanded from macro 'for_each_set_bit'
           for ((bit) =3D find_next_bit((addr), (size), 0);          \
           ^
   drivers/input/joydev.c:954:2: note: Loop condition is true.  Entering lo=
op body
           for (i =3D BTN_JOYSTICK - BTN_MISC; i < KEY_MAX - BTN_MISC + 1; =
i++)
           ^
   drivers/input/joydev.c:955:30: note: Passing null pointer value via 2nd =
parameter 'addr'
                   if (test_bit(i + BTN_MISC, dev->keybit)) {
                                              ^~~~~~~~~~~
   drivers/input/joydev.c:955:7: note: Calling 'generic_test_bit'
                   if (test_bit(i + BTN_MISC, dev->keybit)) {
                       ^
   include/asm-generic/bitops/non-atomic.h:26:18: note: expanded from macro=
 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:25:23: note: expanded from macro=
 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   include/asm-generic/bitops/generic-non-atomic.h:127:16: note: Array acce=
ss (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/i2c/saa7110.c:93:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(decoder->reg + reg, data + 1, len - 1);
                   ^~~~~~
   drivers/media/i2c/saa7110.c:93:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(decoder->reg + reg, data + 1, len - 1);
                   ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1421:4: note: Taking false branch
                           if (i < conf->raid_disks)
                           ^
   drivers/md/raid1.c:1423:4: note:  Execution continues on line 1403
                           continue;
                           ^
   drivers/md/raid1.c:1403:15: note: Assuming 'i' is >=3D 'disks'
           for (i =3D 0;  i < disks; i++) {
                        ^~~~~~~~~
   drivers/md/raid1.c:1403:2: note: Loop condition is false. Execution cont=
inues on line 1470
           for (i =3D 0;  i < disks; i++) {
           ^
   drivers/md/raid1.c:1472:2: note: Taking false branch
           if (unlikely(blocked_rdev)) {
           ^
   drivers/md/raid1.c:1498:6: note: 'write_behind' is false
           if (write_behind && bitmap)
               ^~~~~~~~~~~~
   drivers/md/raid1.c:1498:19: note: Left side of '&&' is false
           if (write_behind && bitmap)
                            ^
   drivers/md/raid1.c:1501:6: note: Assuming the condition is false
           if (max_sectors < bio_sectors(bio)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1501:2: note: Taking false branch
           if (max_sectors < bio_sectors(bio)) {
           ^
   drivers/md/raid1.c:1511:6: note: Assuming the condition is false
           if (blk_queue_io_stat(bio->bi_bdev->bd_disk->queue))
               ^
   include/linux/blkdev.h:598:30: note: expanded from macro 'blk_queue_io_s=
tat'
   #define blk_queue_io_stat(q)    test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue=
_flags)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/asm-generic/bitops/non-atomic.h:26:18: note: expanded from macro=
 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:25:23: note: expanded from macro=
 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   drivers/md/raid1.c:1511:2: note: Taking false branch
           if (blk_queue_io_stat(bio->bi_bdev->bd_disk->queue))
           ^
   drivers/md/raid1.c:1514:2: note: Calling 'atomic_set'
           atomic_set(&r1_bio->behind_remaining, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:42:2: note: Assigning value, =
which participates in a condition later
           arch_atomic_set(v, i);
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:42:2: note: Value assigned to=
 field 'behind_master_bio', which participates in a condition later
           arch_atomic_set(v, i);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1514:2: note: Returning from 'atomic_set'
           atomic_set(&r1_bio->behind_remaining, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1518:2: note: Loop condition is true.  Entering loop =
body
           for (i =3D 0; i < disks; i++) {
           ^
   drivers/md/raid1.c:1520:3: note: 'rdev' initialized to a null pointer va=
lue
                   struct md_rdev *rdev =3D conf->mirrors[i].rdev;
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1521:7: note: Assuming the condition is false
                   if (!r1_bio->bios[i])
                       ^~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1521:3: note: Taking false branch
                   if (!r1_bio->bios[i])
                   ^
   drivers/md/raid1.c:1524:7: note: 'first_clone' is 1
                   if (first_clone) {
                       ^~~~~~~~~~~
   drivers/md/raid1.c:1524:3: note: Taking true branch
                   if (first_clone) {
                   ^
   drivers/md/raid1.c:1529:8: note: Assuming 'bitmap' is null
                           if (bitmap &&
                               ^~~~~~
   drivers/md/raid1.c:1529:15: note: Left side of '&&' is false
                           if (bitmap &&
                                      ^
   drivers/md/raid1.c:1542:7: note: Assuming field 'behind_master_bio' is n=
ull
                   if (r1_bio->behind_master_bio) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1542:3: note: Taking false branch
                   if (r1_bio->behind_master_bio) {
                   ^
   drivers/md/raid1.c:1551:27: note: Access to field 'bdev' results in a de=
reference of a null pointer (loaded from variable 'rdev')
                           mbio =3D bio_alloc_clone(rdev->bdev, bio, GFP_NO=
IO,
                                                  ^~~~
   drivers/md/raid1.c:3265:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&newpool, 0, sizeof(newpool));
           ^~~~~~
   drivers/md/raid1.c:3265:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&newpool, 0, sizeof(newpool));
           ^~~~~~
   drivers/md/raid1.c:3266:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&oldpool, 0, sizeof(oldpool));
           ^~~~~~
   drivers/md/raid1.c:3266:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&oldpool, 0, sizeof(oldpool));
           ^~~~~~
>> include/asm-generic/bitops/generic-non-atomic.h:127:16: warning: Array a=
ccess (from variable 'addr') results in a null pointer dereference [clang-a=
nalyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/md/raid1.c:1352:32: note: Left side of '&&' is false
           if (mddev_is_clustered(mddev) &&
                                         ^
   drivers/md/raid1.c:1378:6: note: Assuming the condition is false
           if (!wait_barrier(conf, bio->bi_iter.bi_sector,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1378:2: note: Taking false branch
           if (!wait_barrier(conf, bio->bi_iter.bi_sector,
           ^
   drivers/md/raid1.c:1403:15: note: Assuming 'i' is < 'disks'
           for (i =3D 0;  i < disks; i++) {
                        ^~~~~~~~~
   drivers/md/raid1.c:1403:2: note: Loop condition is true.  Entering loop =
body
           for (i =3D 0;  i < disks; i++) {
           ^
   drivers/md/raid1.c:1404:26: note: Left side of '||' is false
                   struct md_rdev *rdev =3D rcu_dereference(conf->mirrors[i=
].rdev);
                                          ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/md/raid1.c:1404:26: note: Left side of '||' is false
                   struct md_rdev *rdev =3D rcu_dereference(conf->mirrors[i=
].rdev);
                                          ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/md/raid1.c:1404:26: note: Left side of '||' is true
                   struct md_rdev *rdev =3D rcu_dereference(conf->mirrors[i=
].rdev);
                                          ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:320:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/md/raid1.c:1404:26: note: Taking false branch
                   struct md_rdev *rdev =3D rcu_dereference(conf->mirrors[i=
].rdev);
                                          ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
--
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/md/raid10.c:3709:11: note: Left side of '||' is false
                           rdev =3D rcu_dereference(conf->mirrors[d].replac=
ement);
                                  ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:533:5: note: expanded from macro 'rcu_dereferen=
ce_check'
                                   (c) || rcu_read_lock_held(), __rcu)
                                   ^
   drivers/md/raid10.c:3709:11: note: Assuming the condition is false
                           rdev =3D rcu_dereference(conf->mirrors[d].replac=
ement);
                                  ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:393:19: note: expanded from macro '__rcu_derefe=
rence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/rcupdate.h:320:8: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                        ^
   drivers/md/raid10.c:3709:11: note: Left side of '&&' is false
                           rdev =3D rcu_dereference(conf->mirrors[d].replac=
ement);
                                  ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:393:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:320:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   drivers/md/raid10.c:3709:11: note: Loop condition is false.  Exiting loop
                           rdev =3D rcu_dereference(conf->mirrors[d].replac=
ement);
                                  ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:393:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:318:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   drivers/md/raid10.c:3710:8: note: Assuming 'rdev' is not equal to NULL
                           if (rdev =3D=3D NULL || test_bit(Faulty, &rdev->=
flags)) {
                               ^~~~~~~~~~~~
   drivers/md/raid10.c:3710:8: note: Left side of '||' is false
   drivers/md/raid10.c:3710:24: note: Assuming the condition is false
                           if (rdev =3D=3D NULL || test_bit(Faulty, &rdev->=
flags)) {
                                               ^
   include/asm-generic/bitops/non-atomic.h:26:18: note: expanded from macro=
 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:25:23: note: expanded from macro=
 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   drivers/md/raid10.c:3710:4: note: Taking false branch
                           if (rdev =3D=3D NULL || test_bit(Faulty, &rdev->=
flags)) {
                           ^
   drivers/md/raid10.c:3717:4: note: Null pointer value stored to 'bio'
                           bio =3D r10_bio->devs[i].repl_bio;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3718:19: note: Access to field 'bi_status' results i=
n a dereference of a null pointer (loaded from variable 'bio')
                           bio->bi_status =3D BLK_STS_IOERR;
                           ~~~            ^
   drivers/md/raid10.c:4545:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(conf->mirrors_new, conf->mirrors,
                   ^~~~~~
   drivers/md/raid10.c:4545:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(conf->mirrors_new, conf->mirrors,
                   ^~~~~~
>> include/asm-generic/bitops/generic-non-atomic.h:127:16: warning: Array a=
ccess (from variable 'addr') results in a null pointer dereference [clang-a=
nalyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/md/raid10.c:3249:2: note: Taking true branch
           if (!mempool_initialized(&conf->r10buf_pool))
           ^
   drivers/md/raid10.c:3250:3: note: Taking false branch
                   if (init_resync(conf))
                   ^
   drivers/md/raid10.c:3257:6: note: Assuming field 'bitmap' is not equal t=
o NULL
           if (mddev->bitmap =3D=3D NULL &&
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3257:28: note: Left side of '&&' is false
           if (mddev->bitmap =3D=3D NULL &&
                                     ^
   drivers/md/raid10.c:3270:6: note: Assuming the condition is true
           if (test_bit(MD_RECOVERY_SYNC, &mddev->recovery) ||
               ^
   include/asm-generic/bitops/non-atomic.h:26:18: note: expanded from macro=
 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:25:23: note: expanded from macro=
 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   drivers/md/raid10.c:3270:51: note: Left side of '||' is true
           if (test_bit(MD_RECOVERY_SYNC, &mddev->recovery) ||
                                                            ^
   drivers/md/raid10.c:3273:6: note: Assuming 'sector_nr' is < 'max_sector'
           if (sector_nr >=3D max_sector) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3273:2: note: Taking false branch
           if (sector_nr >=3D max_sector) {
           ^
   drivers/md/raid10.c:3327:6: note: Assuming the condition is false
           if (test_bit(MD_RECOVERY_RESHAPE, &mddev->recovery))
               ^
   include/asm-generic/bitops/non-atomic.h:26:18: note: expanded from macro=
 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:25:23: note: expanded from macro=
 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   drivers/md/raid10.c:3327:2: note: Taking false branch
           if (test_bit(MD_RECOVERY_RESHAPE, &mddev->recovery))
           ^
   drivers/md/raid10.c:3330:6: note: Assuming 'chunks_skipped' is < field '=
raid_disks'
           if (chunks_skipped >=3D conf->geo.raid_disks) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3330:2: note: Taking false branch
           if (chunks_skipped >=3D conf->geo.raid_disks) {
           ^
   drivers/md/raid10.c:3338:6: note: Assuming 'max_sector' is <=3D field 'r=
esync_max'
           if (max_sector > mddev->resync_max)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3338:2: note: Taking false branch
           if (max_sector > mddev->resync_max)
           ^
   drivers/md/raid10.c:3344:6: note: Assuming field 'near_copies' is >=3D f=
ield 'raid_disks'
           if (conf->geo.near_copies < conf->geo.raid_disks &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3344:51: note: Left side of '&&' is false
           if (conf->geo.near_copies < conf->geo.raid_disks &&
                                                            ^
   drivers/md/raid10.c:3352:6: note: Assuming field 'nr_waiting' is 0
           if (conf->nr_waiting)
               ^~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3352:2: note: Taking false branch
           if (conf->nr_waiting)
           ^
   drivers/md/raid10.c:3371:2: note: Taking false branch
           if (!test_bit(MD_RECOVERY_SYNC, &mddev->recovery)) {
           ^
   drivers/md/raid10.c:3640:32: note: Left side of '&&' is false
                                           mddev_is_clustered(mddev) &&
                                                                     ^
   drivers/md/raid10.c:3643:7: note: Assuming the condition is false
                   if (!md_bitmap_start_sync(mddev->bitmap, sector_nr,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3644:39: note: Left side of '&&' is false
                                             &sync_blocks, mddev->degraded)=
 &&
                                                                           =
 ^
   drivers/md/raid10.c:3651:7: note: Assuming 'sync_blocks' is >=3D 'max_sy=
nc'
                   if (sync_blocks < max_sync)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3651:3: note: Taking false branch
                   if (sync_blocks < max_sync)
                   ^
   drivers/md/raid10.c:3667:15: note: Assuming 'i' is < field 'copies'
                   for (i =3D 0; i < conf->copies; i++) {
                               ^~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3667:3: note: Loop condition is true.  Entering loop=
 body
                   for (i =3D 0; i < conf->copies; i++) {
                   ^
   drivers/md/raid10.c:3673:8: note: Assuming field 'repl_bio' is null
                           if (r10_bio->devs[i].repl_bio)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3673:4: note: Taking false branch
                           if (r10_bio->devs[i].repl_bio)
                           ^
   drivers/md/raid10.c:3679:11: note: Left side of '||' is false
                           rdev =3D rcu_dereference(conf->mirrors[d].rdev);

vim +/addr +127 include/asm-generic/bitops/generic-non-atomic.h

b9944c14c86ab2a Alexander Lobakin 2022-05-07   11  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   12  /*
b9944c14c86ab2a Alexander Lobakin 2022-05-07   13   * Generic definitions f=
or bit operations, should not be used in regular code
b9944c14c86ab2a Alexander Lobakin 2022-05-07   14   * directly.
b9944c14c86ab2a Alexander Lobakin 2022-05-07   15   */
b9944c14c86ab2a Alexander Lobakin 2022-05-07   16  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   17  /**
b9944c14c86ab2a Alexander Lobakin 2022-05-07   18   * generic___set_bit - S=
et a bit in memory
b9944c14c86ab2a Alexander Lobakin 2022-05-07   19   * @nr: the bit to set
b9944c14c86ab2a Alexander Lobakin 2022-05-07   20   * @addr: the address to=
 start counting from
b9944c14c86ab2a Alexander Lobakin 2022-05-07   21   *
b9944c14c86ab2a Alexander Lobakin 2022-05-07   22   * Unlike set_bit(), thi=
s function is non-atomic and may be reordered.
b9944c14c86ab2a Alexander Lobakin 2022-05-07   23   * If it's called on the=
 same region of memory simultaneously, the effect
b9944c14c86ab2a Alexander Lobakin 2022-05-07   24   * may be that only one =
operation succeeds.
b9944c14c86ab2a Alexander Lobakin 2022-05-07   25   */
b9944c14c86ab2a Alexander Lobakin 2022-05-07   26  static __always_inline v=
oid
b9944c14c86ab2a Alexander Lobakin 2022-05-07   27  generic___set_bit(unsign=
ed int nr, volatile unsigned long *addr)
b9944c14c86ab2a Alexander Lobakin 2022-05-07   28  {
b9944c14c86ab2a Alexander Lobakin 2022-05-07   29  	unsigned long mask =3D =
BIT_MASK(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   30  	unsigned long *p =3D ((=
unsigned long *)addr) + BIT_WORD(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   31  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07  @32  	*p  |=3D mask;
b9944c14c86ab2a Alexander Lobakin 2022-05-07   33  }
b9944c14c86ab2a Alexander Lobakin 2022-05-07   34  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   35  static __always_inline v=
oid
b9944c14c86ab2a Alexander Lobakin 2022-05-07   36  generic___clear_bit(unsi=
gned int nr, volatile unsigned long *addr)
b9944c14c86ab2a Alexander Lobakin 2022-05-07   37  {
b9944c14c86ab2a Alexander Lobakin 2022-05-07   38  	unsigned long mask =3D =
BIT_MASK(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   39  	unsigned long *p =3D ((=
unsigned long *)addr) + BIT_WORD(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   40  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   41  	*p &=3D ~mask;
b9944c14c86ab2a Alexander Lobakin 2022-05-07   42  }
b9944c14c86ab2a Alexander Lobakin 2022-05-07   43  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   44  /**
b9944c14c86ab2a Alexander Lobakin 2022-05-07   45   * generic___change_bit =
- Toggle a bit in memory
b9944c14c86ab2a Alexander Lobakin 2022-05-07   46   * @nr: the bit to change
b9944c14c86ab2a Alexander Lobakin 2022-05-07   47   * @addr: the address to=
 start counting from
b9944c14c86ab2a Alexander Lobakin 2022-05-07   48   *
b9944c14c86ab2a Alexander Lobakin 2022-05-07   49   * Unlike change_bit(), =
this function is non-atomic and may be reordered.
b9944c14c86ab2a Alexander Lobakin 2022-05-07   50   * If it's called on the=
 same region of memory simultaneously, the effect
b9944c14c86ab2a Alexander Lobakin 2022-05-07   51   * may be that only one =
operation succeeds.
b9944c14c86ab2a Alexander Lobakin 2022-05-07   52   */
b9944c14c86ab2a Alexander Lobakin 2022-05-07   53  static __always_inline
b9944c14c86ab2a Alexander Lobakin 2022-05-07   54  void generic___change_bi=
t(unsigned int nr, volatile unsigned long *addr)
b9944c14c86ab2a Alexander Lobakin 2022-05-07   55  {
b9944c14c86ab2a Alexander Lobakin 2022-05-07   56  	unsigned long mask =3D =
BIT_MASK(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   57  	unsigned long *p =3D ((=
unsigned long *)addr) + BIT_WORD(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   58  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   59  	*p ^=3D mask;
b9944c14c86ab2a Alexander Lobakin 2022-05-07   60  }
b9944c14c86ab2a Alexander Lobakin 2022-05-07   61  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   62  /**
b9944c14c86ab2a Alexander Lobakin 2022-05-07   63   * generic___test_and_se=
t_bit - Set a bit and return its old value
b9944c14c86ab2a Alexander Lobakin 2022-05-07   64   * @nr: Bit to set
b9944c14c86ab2a Alexander Lobakin 2022-05-07   65   * @addr: Address to cou=
nt from
b9944c14c86ab2a Alexander Lobakin 2022-05-07   66   *
b9944c14c86ab2a Alexander Lobakin 2022-05-07   67   * This operation is non=
-atomic and can be reordered.
b9944c14c86ab2a Alexander Lobakin 2022-05-07   68   * If two examples of th=
is operation race, one can appear to succeed
b9944c14c86ab2a Alexander Lobakin 2022-05-07   69   * but actually fail.  Y=
ou must protect multiple accesses with a lock.
b9944c14c86ab2a Alexander Lobakin 2022-05-07   70   */
b9944c14c86ab2a Alexander Lobakin 2022-05-07   71  static __always_inline i=
nt
b9944c14c86ab2a Alexander Lobakin 2022-05-07   72  generic___test_and_set_b=
it(unsigned int nr, volatile unsigned long *addr)
b9944c14c86ab2a Alexander Lobakin 2022-05-07   73  {
b9944c14c86ab2a Alexander Lobakin 2022-05-07   74  	unsigned long mask =3D =
BIT_MASK(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   75  	unsigned long *p =3D ((=
unsigned long *)addr) + BIT_WORD(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   76  	unsigned long old =3D *=
p;
b9944c14c86ab2a Alexander Lobakin 2022-05-07   77  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   78  	*p =3D old | mask;
b9944c14c86ab2a Alexander Lobakin 2022-05-07   79  	return (old & mask) !=
=3D 0;
b9944c14c86ab2a Alexander Lobakin 2022-05-07   80  }
b9944c14c86ab2a Alexander Lobakin 2022-05-07   81  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   82  /**
b9944c14c86ab2a Alexander Lobakin 2022-05-07   83   * generic___test_and_cl=
ear_bit - Clear a bit and return its old value
b9944c14c86ab2a Alexander Lobakin 2022-05-07   84   * @nr: Bit to clear
b9944c14c86ab2a Alexander Lobakin 2022-05-07   85   * @addr: Address to cou=
nt from
b9944c14c86ab2a Alexander Lobakin 2022-05-07   86   *
b9944c14c86ab2a Alexander Lobakin 2022-05-07   87   * This operation is non=
-atomic and can be reordered.
b9944c14c86ab2a Alexander Lobakin 2022-05-07   88   * If two examples of th=
is operation race, one can appear to succeed
b9944c14c86ab2a Alexander Lobakin 2022-05-07   89   * but actually fail.  Y=
ou must protect multiple accesses with a lock.
b9944c14c86ab2a Alexander Lobakin 2022-05-07   90   */
b9944c14c86ab2a Alexander Lobakin 2022-05-07   91  static __always_inline i=
nt
b9944c14c86ab2a Alexander Lobakin 2022-05-07   92  generic___test_and_clear=
_bit(unsigned int nr, volatile unsigned long *addr)
b9944c14c86ab2a Alexander Lobakin 2022-05-07   93  {
b9944c14c86ab2a Alexander Lobakin 2022-05-07   94  	unsigned long mask =3D =
BIT_MASK(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   95  	unsigned long *p =3D ((=
unsigned long *)addr) + BIT_WORD(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07   96  	unsigned long old =3D *=
p;
b9944c14c86ab2a Alexander Lobakin 2022-05-07   97  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07   98  	*p =3D old & ~mask;
b9944c14c86ab2a Alexander Lobakin 2022-05-07   99  	return (old & mask) !=
=3D 0;
b9944c14c86ab2a Alexander Lobakin 2022-05-07  100  }
b9944c14c86ab2a Alexander Lobakin 2022-05-07  101  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07  102  /* WARNING: non atomic a=
nd it can be reordered! */
b9944c14c86ab2a Alexander Lobakin 2022-05-07  103  static __always_inline i=
nt
b9944c14c86ab2a Alexander Lobakin 2022-05-07  104  generic___test_and_chang=
e_bit(unsigned int nr, volatile unsigned long *addr)
b9944c14c86ab2a Alexander Lobakin 2022-05-07  105  {
b9944c14c86ab2a Alexander Lobakin 2022-05-07  106  	unsigned long mask =3D =
BIT_MASK(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07  107  	unsigned long *p =3D ((=
unsigned long *)addr) + BIT_WORD(nr);
b9944c14c86ab2a Alexander Lobakin 2022-05-07  108  	unsigned long old =3D *=
p;
b9944c14c86ab2a Alexander Lobakin 2022-05-07  109  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07  110  	*p =3D old ^ mask;
b9944c14c86ab2a Alexander Lobakin 2022-05-07  111  	return (old & mask) !=
=3D 0;
b9944c14c86ab2a Alexander Lobakin 2022-05-07  112  }
b9944c14c86ab2a Alexander Lobakin 2022-05-07  113  =

b9944c14c86ab2a Alexander Lobakin 2022-05-07  114  /**
b9944c14c86ab2a Alexander Lobakin 2022-05-07  115   * generic_test_bit - De=
termine whether a bit is set
b9944c14c86ab2a Alexander Lobakin 2022-05-07  116   * @nr: bit number to te=
st
b9944c14c86ab2a Alexander Lobakin 2022-05-07  117   * @addr: Address to sta=
rt counting from
b9944c14c86ab2a Alexander Lobakin 2022-05-07  118   */
b9944c14c86ab2a Alexander Lobakin 2022-05-07  119  static __always_inline i=
nt
b9944c14c86ab2a Alexander Lobakin 2022-05-07  120  generic_test_bit(unsigne=
d int nr, const volatile unsigned long *addr)
b9944c14c86ab2a Alexander Lobakin 2022-05-07  121  {
b9944c14c86ab2a Alexander Lobakin 2022-05-07  122  	/*
b9944c14c86ab2a Alexander Lobakin 2022-05-07  123  	 * Unlike the bitops wi=
th the '__' prefix above, this one *is* atomic,
b9944c14c86ab2a Alexander Lobakin 2022-05-07  124  	 * so `volatile` must a=
lways stay here with no cast-aways. See
b9944c14c86ab2a Alexander Lobakin 2022-05-07  125  	 * `Documentation/atomi=
c_bitops.txt` for the details.
b9944c14c86ab2a Alexander Lobakin 2022-05-07  126  	 */
b9944c14c86ab2a Alexander Lobakin 2022-05-07 @127  	return 1UL & (addr[BIT_=
WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
b9944c14c86ab2a Alexander Lobakin 2022-05-07  128  }
b9944c14c86ab2a Alexander Lobakin 2022-05-07  129  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8522539783192832724==--

