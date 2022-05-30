Content-Type: multipart/mixed; boundary="===============3082892396743460146=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/integrity/ima/ima_queue.c:163:6: warning: Value stored to 'digest' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 30 May 2022 10:05:34 +0800
Message-ID: <202205300941.9gBLLc3T-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3082892396743460146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tushar Sugandhi <tusharsu@linux.microsoft.com>
CC: Mimi Zohar <zohar@linux.ibm.com>
CC: Petr Vorel <pvorel@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b00ed48bb0a7c295facf9036135a573a5cdbe7de
commit: 52c208397c246f0c31d031eb8c41f9c7e9fdec0e IMA: support for duplicate=
 measurement records
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
530/202205300941.9gBLLc3T-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D52c208397c246f0c31d031eb8c41f9c7e9fdec0e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 52c208397c246f0c31d031eb8c41f9c7e9fdec0e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/f2fs/xattr.c:787:8: note: Calling '__f2fs_setxattr'
           err =3D __f2fs_setxattr(inode, index, name, value, size, ipage, =
flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/f2fs/xattr.c:640:6: note: Assuming 'name' is not equal to NULL
           if (name =3D=3D NULL)
               ^~~~~~~~~~~~
   fs/f2fs/xattr.c:640:2: note: Taking false branch
           if (name =3D=3D NULL)
           ^
   fs/f2fs/xattr.c:643:6: note: Assuming 'value' is not equal to NULL
           if (value =3D=3D NULL)
               ^~~~~~~~~~~~~
   fs/f2fs/xattr.c:643:2: note: Taking false branch
           if (value =3D=3D NULL)
           ^
   fs/f2fs/xattr.c:648:6: note: Assuming 'len' is <=3D F2FS_NAME_LEN
           if (len > F2FS_NAME_LEN)
               ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:648:2: note: Taking false branch
           if (len > F2FS_NAME_LEN)
           ^
   fs/f2fs/xattr.c:651:6: note: Assuming the condition is false
           if (size > MAX_VALUE_LEN(inode))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:651:2: note: Taking false branch
           if (size > MAX_VALUE_LEN(inode))
           ^
   fs/f2fs/xattr.c:654:10: note: Calling 'read_all_xattrs'
           error =3D read_all_xattrs(inode, ipage, &base_addr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:397:29: note: Calling 'inline_xattr_size'
           unsigned int inline_size =3D inline_xattr_size(inode);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2883:6: note: Assuming the condition is false
           if (f2fs_has_inline_xattr(inode))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2883:2: note: Taking false branch
           if (f2fs_has_inline_xattr(inode))
           ^
   fs/f2fs/f2fs.h:2885:2: note: Returning zero, which participates in a con=
dition later
           return 0;
           ^~~~~~~~
   fs/f2fs/xattr.c:397:29: note: Returning from 'inline_xattr_size'
           unsigned int inline_size =3D inline_xattr_size(inode);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:401:16: note: Calling 'f2fs_kzalloc'
           txattr_addr =3D f2fs_kzalloc(F2FS_I_SB(inode),
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3063:9: note: Calling 'f2fs_kmalloc'
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3052:6: note: Assuming the condition is false
           if (time_to_inject(sbi, FAULT_KMALLOC)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3052:2: note: Taking false branch
           if (time_to_inject(sbi, FAULT_KMALLOC)) {
           ^
   fs/f2fs/f2fs.h:3057:9: note: Uninitialized value stored to field 'h_magi=
c'
           return kmalloc(size, flags);
                  ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3057:2: note: Returning pointer, which participates in a =
condition later
           return kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3063:9: note: Returning from 'f2fs_kmalloc'
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3063:2: note: Returning pointer, which participates in a =
condition later
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:401:16: note: Returning from 'f2fs_kzalloc'
           txattr_addr =3D f2fs_kzalloc(F2FS_I_SB(inode),
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:403:6: note: Assuming 'txattr_addr' is non-null
           if (!txattr_addr)
               ^~~~~~~~~~~~
   fs/f2fs/xattr.c:403:2: note: Taking false branch
           if (!txattr_addr)
           ^
   fs/f2fs/xattr.c:407:6: note: 'inline_size' is 0
           if (inline_size) {
               ^~~~~~~~~~~
   fs/f2fs/xattr.c:407:2: note: Taking false branch
           if (inline_size) {
           ^
   fs/f2fs/xattr.c:414:6: note: Assuming 'xnid' is 0
           if (xnid) {
               ^~~~
   fs/f2fs/xattr.c:414:2: note: Taking false branch
           if (xnid) {
           ^
   fs/f2fs/xattr.c:423:35: note: The left operand of '!=3D' is a garbage va=
lue
           if (le32_to_cpu(header->h_magic) !=3D F2FS_XATTR_MAGIC) {
                                            ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> security/integrity/ima/ima_queue.c:163:6: warning: Value stored to 'dige=
st' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           u8 *digest =3D entry->digests[ima_hash_algo_idx].digest;
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:163:6: note: Value stored to 'digest'=
 during its initialization is never read
           u8 *digest =3D entry->digests[ima_hash_algo_idx].digest;
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   security/integrity/ima/ima_main.c:417:15: warning: Value stored to 'file=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct file *file =3D vma->vm_file;
                        ^~~~   ~~~~~~~~~~~~
   security/integrity/ima/ima_main.c:417:15: note: Value stored to 'file' d=
uring its initialization is never read
           struct file *file =3D vma->vm_file;
                        ^~~~   ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   security/integrity/ima/ima_crypto.c:428:2: warning: 2nd function call ar=
gument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           ima_free_pages(rbuf[1], rbuf_size[1]);
           ^
   security/integrity/ima/ima_crypto.c:546:6: note: Assuming the condition =
is false
           if (file->f_flags & O_DIRECT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:546:2: note: Taking false branch
           if (file->f_flags & O_DIRECT) {
           ^
   security/integrity/ima/ima_crypto.c:553:6: note: Assuming the condition =
is false
           if (!(file->f_mode & FMODE_READ)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:553:2: note: Taking false branch
           if (!(file->f_mode & FMODE_READ)) {
           ^
   security/integrity/ima/ima_crypto.c:566:6: note: Assuming 'ima_ahash_min=
size' is not equal to 0
           if (ima_ahash_minsize && i_size >=3D ima_ahash_minsize) {
               ^~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:566:6: note: Left side of '&&' is tr=
ue
   security/integrity/ima/ima_crypto.c:566:27: note: Assuming 'i_size' is >=
=3D 'ima_ahash_minsize'
           if (ima_ahash_minsize && i_size >=3D ima_ahash_minsize) {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:566:2: note: Taking true branch
           if (ima_ahash_minsize && i_size >=3D ima_ahash_minsize) {
           ^
   security/integrity/ima/ima_crypto.c:567:8: note: Calling 'ima_calc_file_=
ahash'
                   rc =3D ima_calc_file_ahash(f, hash);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:445:2: note: Taking false branch
           if (IS_ERR(tfm))
           ^
   security/integrity/ima/ima_crypto.c:448:7: note: Calling 'ima_calc_file_=
hash_atfm'
           rc =3D ima_calc_file_hash_atfm(file, hash, tfm);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:342:8: note: Calling 'ahash_request_=
alloc'
           req =3D ahash_request_alloc(tfm, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:604:8: note: Calling 'kmalloc'
           req =3D kmalloc(sizeof(struct ahash_request) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:544:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:561:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:604:8: note: Returning from 'kmalloc'
           req =3D kmalloc(sizeof(struct ahash_request) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:607:6: note: Assuming 'req' is non-null, which par=
ticipates in a condition later
           if (likely(req))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   include/crypto/hash.h:607:2: note: Taking true branch
           if (likely(req))
           ^
   include/crypto/hash.h:610:2: note: Returning pointer (loaded from 'req')=
, which participates in a condition later
           return req;
           ^~~~~~~~~~
   security/integrity/ima/ima_crypto.c:342:8: note: Returning from 'ahash_r=
equest_alloc'
           req =3D ahash_request_alloc(tfm, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_crypto.c:343:7: note: 'req' is non-null
           if (!req)
                ^~~
   security/integrity/ima/ima_crypto.c:343:2: note: Taking false branch
           if (!req)
           ^
   security/integrity/ima/ima_crypto.c:351:18: note: Calling 'crypto_ahash_=
init'
           rc =3D ahash_wait(crypto_ahash_init(req), &wait);
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:532:6: note: Assuming the condition is false
           if (crypto_ahash_get_flags(tfm) & CRYPTO_TFM_NEED_KEY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/crypto/hash.h:532:2: note: Taking false branch
           if (crypto_ahash_get_flags(tfm) & CRYPTO_TFM_NEED_KEY)
           ^
   include/crypto/hash.h:535:2: note: Returning value, which participates i=
n a condition later

vim +/digest +163 security/integrity/ima/ima_queue.c

3323eec921efd81 Mimi Zohar      2009-02-04  150  =

d158847ae89a256 Mimi Zohar      2016-12-19  151  /*
d158847ae89a256 Mimi Zohar      2016-12-19  152   * Add template entry to t=
he measurement list and hash table, and
d158847ae89a256 Mimi Zohar      2016-12-19  153   * extend the pcr.
d158847ae89a256 Mimi Zohar      2016-12-19  154   *
d158847ae89a256 Mimi Zohar      2016-12-19  155   * On systems which suppor=
t carrying the IMA measurement list across
d158847ae89a256 Mimi Zohar      2016-12-19  156   * kexec, maintain the tot=
al memory size required for serializing the
d158847ae89a256 Mimi Zohar      2016-12-19  157   * binary_runtime_measurem=
ents.
3323eec921efd81 Mimi Zohar      2009-02-04  158   */
3323eec921efd81 Mimi Zohar      2009-02-04  159  int ima_add_template_entry=
(struct ima_template_entry *entry, int violation,
9803d413f41db86 Roberto Sassu   2013-06-07  160  			   const char *op, stru=
ct inode *inode,
9803d413f41db86 Roberto Sassu   2013-06-07  161  			   const unsigned char =
*filename)
3323eec921efd81 Mimi Zohar      2009-02-04  162  {
2592677c0486e64 Roberto Sassu   2020-03-25 @163  	u8 *digest =3D entry->dig=
ests[ima_hash_algo_idx].digest;
1ea973df6e2166d Roberto Sassu   2020-03-25  164  	struct tpm_digest *digest=
s_arg =3D entry->digests;
3323eec921efd81 Mimi Zohar      2009-02-04  165  	const char *audit_cause =
=3D "hash_added";
7b7e5916aa2f46e Roberto Sassu   2011-12-19  166  	char tpm_audit_cause[AUDI=
T_CAUSE_LEN_MAX];
3323eec921efd81 Mimi Zohar      2009-02-04  167  	int audit_info =3D 1;
7b7e5916aa2f46e Roberto Sassu   2011-12-19  168  	int result =3D 0, tpmresu=
lt =3D 0;
3323eec921efd81 Mimi Zohar      2009-02-04  169  =

3323eec921efd81 Mimi Zohar      2009-02-04  170  	mutex_lock(&ima_extend_li=
st_mutex);
52c208397c246f0 Tushar Sugandhi 2021-05-10  171  	if (!violation && !IS_ENA=
BLED(CONFIG_IMA_DISABLE_HTABLE)) {
67696f6d79923cd Eric Richter    2016-06-01  172  		if (ima_lookup_digest_en=
try(digest, entry->pcr)) {
3323eec921efd81 Mimi Zohar      2009-02-04  173  			audit_cause =3D "hash_e=
xists";
45fae7493970d7c Roberto Sassu   2011-12-19  174  			result =3D -EEXIST;
3323eec921efd81 Mimi Zohar      2009-02-04  175  			goto out;
3323eec921efd81 Mimi Zohar      2009-02-04  176  		}
3323eec921efd81 Mimi Zohar      2009-02-04  177  	}
3323eec921efd81 Mimi Zohar      2009-02-04  178  =

52c208397c246f0 Tushar Sugandhi 2021-05-10  179  	result =3D ima_add_digest=
_entry(entry,
52c208397c246f0 Tushar Sugandhi 2021-05-10  180  				      !IS_ENABLED(CONF=
IG_IMA_DISABLE_HTABLE));
3323eec921efd81 Mimi Zohar      2009-02-04  181  	if (result < 0) {
3323eec921efd81 Mimi Zohar      2009-02-04  182  		audit_cause =3D "ENOMEM";
3323eec921efd81 Mimi Zohar      2009-02-04  183  		audit_info =3D 0;
3323eec921efd81 Mimi Zohar      2009-02-04  184  		goto out;
3323eec921efd81 Mimi Zohar      2009-02-04  185  	}
3323eec921efd81 Mimi Zohar      2009-02-04  186  =

3323eec921efd81 Mimi Zohar      2009-02-04  187  	if (violation)		/* invali=
date pcr */
1ea973df6e2166d Roberto Sassu   2020-03-25  188  		digests_arg =3D digests;
3323eec921efd81 Mimi Zohar      2009-02-04  189  =

1ea973df6e2166d Roberto Sassu   2020-03-25  190  	tpmresult =3D ima_pcr_ext=
end(digests_arg, entry->pcr);
7b7e5916aa2f46e Roberto Sassu   2011-12-19  191  	if (tpmresult !=3D 0) {
7b7e5916aa2f46e Roberto Sassu   2011-12-19  192  		snprintf(tpm_audit_cause=
, AUDIT_CAUSE_LEN_MAX, "TPM_error(%d)",
7b7e5916aa2f46e Roberto Sassu   2011-12-19  193  			 tpmresult);
7b7e5916aa2f46e Roberto Sassu   2011-12-19  194  		audit_cause =3D tpm_audi=
t_cause;
3323eec921efd81 Mimi Zohar      2009-02-04  195  		audit_info =3D 0;
3323eec921efd81 Mimi Zohar      2009-02-04  196  	}
3323eec921efd81 Mimi Zohar      2009-02-04  197  out:
3323eec921efd81 Mimi Zohar      2009-02-04  198  	mutex_unlock(&ima_extend_=
list_mutex);
9803d413f41db86 Roberto Sassu   2013-06-07  199  	integrity_audit_msg(AUDIT=
_INTEGRITY_PCR, inode, filename,
3323eec921efd81 Mimi Zohar      2009-02-04  200  			    op, audit_cause, re=
sult, audit_info);
3323eec921efd81 Mimi Zohar      2009-02-04  201  	return result;
3323eec921efd81 Mimi Zohar      2009-02-04  202  }
94c3aac567a9ddb Mimi Zohar      2016-12-19  203  =


:::::: The code at line 163 was first introduced by commit
:::::: 2592677c0486e64a08e0b930a7dfa6fbf77e6fc1 ima: Use ima_hash_algo for =
collision detection in the measurement list

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Mimi Zohar <zohar@linux.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3082892396743460146==--

