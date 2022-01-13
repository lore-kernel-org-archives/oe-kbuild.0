Content-Type: multipart/mixed; boundary="===============7418551395643774646=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/integrity/ima/ima_queue.c:163:6: warning: Value stored to 'digest' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 14 Jan 2022 04:51:30 +0800
Message-ID: <202201140423.yRkoYDjV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7418551395643774646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tushar Sugandhi <tusharsu@linux.microsoft.com>
CC: Mimi Zohar <zohar@linux.ibm.com>
CC: Petr Vorel <pvorel@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   455e73a07f6e288b0061dfcf4fcf54fa9fe06458
commit: 52c208397c246f0c31d031eb8c41f9c7e9fdec0e IMA: support for duplicate=
 measurement records
date:   7 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
114/202201140423.yRkoYDjV-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/acpi/acpica/dspkginit.c:80:9: note: Left side of '||' is false
           while ((parent->common.aml_opcode =3D=3D AML_PACKAGE_OP) ||
                  ^
   drivers/acpi/acpica/dspkginit.c:81:10: note: Assuming field 'aml_opcode'=
 is not equal to AML_VARIABLE_PACKAGE_OP
                  (parent->common.aml_opcode =3D=3D AML_VARIABLE_PACKAGE_OP=
)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:80:2: note: Loop condition is false. Exe=
cution continues on line 90
           while ((parent->common.aml_opcode =3D=3D AML_PACKAGE_OP) ||
           ^
   drivers/acpi/acpica/dspkginit.c:91:6: note: Assuming 'obj_desc' is null
           if (!obj_desc) {
               ^~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:91:2: note: Taking true branch
           if (!obj_desc) {
           ^
   drivers/acpi/acpica/dspkginit.c:94:7: note: Assuming 'obj_desc' is non-n=
ull
                   if (!obj_desc) {
                       ^~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:94:3: note: Taking false branch
                   if (!obj_desc) {
                   ^
   drivers/acpi/acpica/dspkginit.c:101:6: note: Assuming the condition is f=
alse
           if (obj_desc->package.flags & AOPOBJ_DATA_VALID) {      /* Just =
in case */
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:101:2: note: Taking false branch
           if (obj_desc->package.flags & AOPOBJ_DATA_VALID) {      /* Just =
in case */
           ^
   drivers/acpi/acpica/dspkginit.c:111:6: note: Assuming field 'elements' i=
s non-null
           if (!obj_desc->package.elements) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:111:2: note: Taking false branch
           if (!obj_desc->package.elements) {
           ^
   drivers/acpi/acpica/dspkginit.c:138:6: note: 'module_level_code' is 0
           if (module_level_code) {
               ^~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:138:2: note: Taking false branch
           if (module_level_code) {
           ^
   drivers/acpi/acpica/dspkginit.c:153:14: note: Assuming 'arg' is non-null
           for (i =3D 0; arg && (i < element_count); i++) {
                       ^~~
   drivers/acpi/acpica/dspkginit.c:153:14: note: Left side of '&&' is true
   drivers/acpi/acpica/dspkginit.c:153:22: note: Assuming 'i' is < 'element=
_count'
           for (i =3D 0; arg && (i < element_count); i++) {
                               ^~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:153:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; arg && (i < element_count); i++) {
           ^
   drivers/acpi/acpica/dspkginit.c:154:7: note: Assuming field 'aml_opcode'=
 is not equal to AML_INT_RETURN_VALUE_OP
                   if (arg->common.aml_opcode =3D=3D AML_INT_RETURN_VALUE_O=
P) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:154:3: note: Taking false branch
                   if (arg->common.aml_opcode =3D=3D AML_INT_RETURN_VALUE_O=
P) {
                   ^
   drivers/acpi/acpica/dspkginit.c:205:8: note: Assuming the condition is f=
alse
                           if (status =3D=3D AE_NOT_FOUND) {
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:205:4: note: Taking false branch
                           if (status =3D=3D AE_NOT_FOUND) {
                           ^
   drivers/acpi/acpica/dspkginit.c:210:9: note: 'module_level_code' is 0
                           if (!module_level_code) {
                                ^~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:210:4: note: Taking true branch
                           if (!module_level_code) {
                           ^
   drivers/acpi/acpica/dspkginit.c:219:26: note: Passing null pointer value=
 via 3rd parameter 'state'
                                                                elements[i]=
, NULL,
                                                                           =
  ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:217:5: note: Calling 'acpi_ds_init_packa=
ge_element'
                                   acpi_ds_init_package_element(0,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:332:6: note: Assuming 'source_object' is=
 non-null
           if (!source_object) {
               ^~~~~~~~~~~~~~
   drivers/acpi/acpica/dspkginit.c:332:2: note: Taking false branch
           if (!source_object) {
           ^
   drivers/acpi/acpica/dspkginit.c:342:6: note: Assuming 'context' is null
           if (context) {
               ^~~~~~~
   drivers/acpi/acpica/dspkginit.c:342:2: note: Taking false branch
           if (context) {
           ^
   drivers/acpi/acpica/dspkginit.c:350:17: note: Dereference of null pointer
                   element_ptr =3D state->pkg.this_target_obj;
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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

3323eec921efd8 Mimi Zohar      2009-02-04  150  =

d158847ae89a25 Mimi Zohar      2016-12-19  151  /*
d158847ae89a25 Mimi Zohar      2016-12-19  152   * Add template entry to th=
e measurement list and hash table, and
d158847ae89a25 Mimi Zohar      2016-12-19  153   * extend the pcr.
d158847ae89a25 Mimi Zohar      2016-12-19  154   *
d158847ae89a25 Mimi Zohar      2016-12-19  155   * On systems which support=
 carrying the IMA measurement list across
d158847ae89a25 Mimi Zohar      2016-12-19  156   * kexec, maintain the tota=
l memory size required for serializing the
d158847ae89a25 Mimi Zohar      2016-12-19  157   * binary_runtime_measureme=
nts.
3323eec921efd8 Mimi Zohar      2009-02-04  158   */
3323eec921efd8 Mimi Zohar      2009-02-04  159  int ima_add_template_entry(=
struct ima_template_entry *entry, int violation,
9803d413f41db8 Roberto Sassu   2013-06-07  160  			   const char *op, struc=
t inode *inode,
9803d413f41db8 Roberto Sassu   2013-06-07  161  			   const unsigned char *=
filename)
3323eec921efd8 Mimi Zohar      2009-02-04  162  {
2592677c0486e6 Roberto Sassu   2020-03-25 @163  	u8 *digest =3D entry->dige=
sts[ima_hash_algo_idx].digest;
1ea973df6e2166 Roberto Sassu   2020-03-25  164  	struct tpm_digest *digests=
_arg =3D entry->digests;
3323eec921efd8 Mimi Zohar      2009-02-04  165  	const char *audit_cause =
=3D "hash_added";
7b7e5916aa2f46 Roberto Sassu   2011-12-19  166  	char tpm_audit_cause[AUDIT=
_CAUSE_LEN_MAX];
3323eec921efd8 Mimi Zohar      2009-02-04  167  	int audit_info =3D 1;
7b7e5916aa2f46 Roberto Sassu   2011-12-19  168  	int result =3D 0, tpmresul=
t =3D 0;
3323eec921efd8 Mimi Zohar      2009-02-04  169  =

3323eec921efd8 Mimi Zohar      2009-02-04  170  	mutex_lock(&ima_extend_lis=
t_mutex);
52c208397c246f Tushar Sugandhi 2021-05-10  171  	if (!violation && !IS_ENAB=
LED(CONFIG_IMA_DISABLE_HTABLE)) {
67696f6d79923c Eric Richter    2016-06-01  172  		if (ima_lookup_digest_ent=
ry(digest, entry->pcr)) {
3323eec921efd8 Mimi Zohar      2009-02-04  173  			audit_cause =3D "hash_ex=
ists";
45fae7493970d7 Roberto Sassu   2011-12-19  174  			result =3D -EEXIST;
3323eec921efd8 Mimi Zohar      2009-02-04  175  			goto out;
3323eec921efd8 Mimi Zohar      2009-02-04  176  		}
3323eec921efd8 Mimi Zohar      2009-02-04  177  	}
3323eec921efd8 Mimi Zohar      2009-02-04  178  =

52c208397c246f Tushar Sugandhi 2021-05-10  179  	result =3D ima_add_digest_=
entry(entry,
52c208397c246f Tushar Sugandhi 2021-05-10  180  				      !IS_ENABLED(CONFI=
G_IMA_DISABLE_HTABLE));
3323eec921efd8 Mimi Zohar      2009-02-04  181  	if (result < 0) {
3323eec921efd8 Mimi Zohar      2009-02-04  182  		audit_cause =3D "ENOMEM";
3323eec921efd8 Mimi Zohar      2009-02-04  183  		audit_info =3D 0;
3323eec921efd8 Mimi Zohar      2009-02-04  184  		goto out;
3323eec921efd8 Mimi Zohar      2009-02-04  185  	}
3323eec921efd8 Mimi Zohar      2009-02-04  186  =

3323eec921efd8 Mimi Zohar      2009-02-04  187  	if (violation)		/* invalid=
ate pcr */
1ea973df6e2166 Roberto Sassu   2020-03-25  188  		digests_arg =3D digests;
3323eec921efd8 Mimi Zohar      2009-02-04  189  =

1ea973df6e2166 Roberto Sassu   2020-03-25  190  	tpmresult =3D ima_pcr_exte=
nd(digests_arg, entry->pcr);
7b7e5916aa2f46 Roberto Sassu   2011-12-19  191  	if (tpmresult !=3D 0) {
7b7e5916aa2f46 Roberto Sassu   2011-12-19  192  		snprintf(tpm_audit_cause,=
 AUDIT_CAUSE_LEN_MAX, "TPM_error(%d)",
7b7e5916aa2f46 Roberto Sassu   2011-12-19  193  			 tpmresult);
7b7e5916aa2f46 Roberto Sassu   2011-12-19  194  		audit_cause =3D tpm_audit=
_cause;
3323eec921efd8 Mimi Zohar      2009-02-04  195  		audit_info =3D 0;
3323eec921efd8 Mimi Zohar      2009-02-04  196  	}
3323eec921efd8 Mimi Zohar      2009-02-04  197  out:
3323eec921efd8 Mimi Zohar      2009-02-04  198  	mutex_unlock(&ima_extend_l=
ist_mutex);
9803d413f41db8 Roberto Sassu   2013-06-07  199  	integrity_audit_msg(AUDIT_=
INTEGRITY_PCR, inode, filename,
3323eec921efd8 Mimi Zohar      2009-02-04  200  			    op, audit_cause, res=
ult, audit_info);
3323eec921efd8 Mimi Zohar      2009-02-04  201  	return result;
3323eec921efd8 Mimi Zohar      2009-02-04  202  }
94c3aac567a9dd Mimi Zohar      2016-12-19  203  =


:::::: The code at line 163 was first introduced by commit
:::::: 2592677c0486e64a08e0b930a7dfa6fbf77e6fc1 ima: Use ima_hash_algo for =
collision detection in the measurement list

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Mimi Zohar <zohar@linux.ibm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7418551395643774646==--

