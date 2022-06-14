Content-Type: multipart/mixed; boundary="===============7627227798729945261=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v36 18/33] LSM: Use lsmcontext in security_dentry_init_security
Date: Tue, 14 Jun 2022 13:47:34 +0800
Message-ID: <202206141353.zFFje0Za-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7627227798729945261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/fuse/d=
ir.c:482:6: warning: Branch condition evaluates to a garbage value [clang-a=
nalyzer-core.uninitialized.Branch]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220609230146.319210-19-casey@schaufler-ca.com>
References: <20220609230146.319210-19-casey@schaufler-ca.com>
TO: Casey Schaufler <casey@schaufler-ca.com>
TO: casey.schaufler(a)intel.com
TO: jmorris(a)namei.org
TO: linux-security-module(a)vger.kernel.org
TO: selinux(a)vger.kernel.org
CC: casey(a)schaufler-ca.com
CC: linux-audit(a)redhat.com
CC: keescook(a)chromium.org
CC: john.johansen(a)canonical.com
CC: penguin-kernel(a)i-love.sakura.ne.jp
CC: paul(a)paul-moore.com
CC: stephen.smalley.work(a)gmail.com
CC: linux-kernel(a)vger.kernel.org

Hi Casey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on pcmoore-selinux/next linus/master v5.19-rc2 nex=
t-20220610]
[cannot apply to jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/inte=
grity-disassociate-ima_filter_rule-from-security_audit_rule/20220610-080129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git n=
ext
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-c005-20220613 (https://download.01.org/0day-ci/arch=
ive/20220614/202206141353.zFFje0Za-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d37826=
8ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/86d33e271bed739fe32=
367e703b054ea253bb471
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Casey-Schaufler/integrity-disassoc=
iate-ima_filter_rule-from-security_audit_rule/20220610-080129
        git checkout 86d33e271bed739fe32367e703b054ea253bb471
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~
   lib/kunit/test.c:371:2: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
           current->kunit_test =3D test;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   lib/kunit/test.c:371:2: note: Dereference of null pointer
           current->kunit_test =3D test;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   lib/kunit/test.c:535:6: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           snprintf(param_desc, sizeof(para=
m_desc),
                                           ^~~~~~~~
   lib/kunit/test.c:535:6: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                                           snprintf(param_desc, sizeof(para=
m_desc),
                                           ^~~~~~~~
   lib/kunit/test.c:699:2: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
           current->kunit_test =3D NULL;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   lib/kunit/test.c:390:6: note: Assuming 'try_exit_code' is 0
           if (try_exit_code) {
               ^~~~~~~~~~~~~
   lib/kunit/test.c:390:2: note: Taking false branch
           if (try_exit_code) {
           ^
   lib/kunit/test.c:413:2: note: Calling 'kunit_run_case_cleanup'
           kunit_run_case_cleanup(test, suite);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:352:6: note: Assuming field 'exit' is null
           if (suite->exit)
               ^~~~~~~~~~~
   lib/kunit/test.c:352:2: note: Taking false branch
           if (suite->exit)
           ^
   lib/kunit/test.c:355:2: note: Calling 'kunit_case_internal_cleanup'
           kunit_case_internal_cleanup(test);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:342:2: note: Calling 'kunit_cleanup'
           kunit_cleanup(test);
           ^~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:682:2: note: Loop condition is true.  Entering loop body
           while (true) {
           ^
   lib/kunit/test.c:683:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&test->lock, flags);
                   ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   lib/kunit/test.c:683:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&test->lock, flags);
                   ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   lib/kunit/test.c:684:7: note: Assuming the condition is true
                   if (list_empty(&test->resources)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:684:3: note: Taking true branch
                   if (list_empty(&test->resources)) {
                   ^
   lib/kunit/test.c:686:4: note:  Execution continues on line 699
                           break;
                           ^
   lib/kunit/test.c:699:2: note: Dereference of null pointer
           current->kunit_test =3D NULL;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   fs/fuse/dir.c:179:2: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memset(outarg, 0, sizeof(struct fuse_entry_out));
           ^~~~~~
   fs/fuse/dir.c:179:2: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
           memset(outarg, 0, sizeof(struct fuse_entry_out));
           ^~~~~~
>> fs/fuse/dir.c:482:6: warning: Branch condition evaluates to a garbage va=
lue [clang-analyzer-core.uninitialized.Branch]
           if (lsmctx.len) {
               ^
   fs/fuse/dir.c:831:9: note: Calling 'create_new_entry'
           return create_new_entry(fm, &args, dir, entry, S_IFLNK);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:702:2: note: Taking false branch
           if (fuse_is_bad(dir))
           ^
   fs/fuse/dir.c:706:6: note: Assuming 'forget' is non-null
           if (!forget)
               ^~~~~~~
   fs/fuse/dir.c:706:2: note: Taking false branch
           if (!forget)
           ^
   fs/fuse/dir.c:715:6: note: Assuming field 'init_security' is not equal t=
o 0
           if (fm->fc->init_security && args->opcode !=3D FUSE_LINK) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:715:6: note: Left side of '&&' is true
   fs/fuse/dir.c:715:37: note: Field 'opcode' is not equal to FUSE_LINK
           if (fm->fc->init_security && args->opcode !=3D FUSE_LINK) {
                                              ^
   fs/fuse/dir.c:715:2: note: Taking true branch
           if (fm->fc->init_security && args->opcode !=3D FUSE_LINK) {
           ^
   fs/fuse/dir.c:716:9: note: Calling 'get_security_context'
                   err =3D get_security_context(entry, mode, &security_ctx,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:474:8: note: Calling 'security_dentry_init_security'
           err =3D security_dentry_init_security(entry, mode, &entry->d_nam=
e,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/security.h:893:2: note: Returning without writing to 'lsmc=
xt->len'
           return -EOPNOTSUPP;
           ^
   include/linux/security.h:893:2: note: Returning the value -95, which par=
ticipates in a condition later
           return -EOPNOTSUPP;
           ^~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:474:8: note: Returning from 'security_dentry_init_security'
           err =3D security_dentry_init_security(entry, mode, &entry->d_nam=
e,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:476:6: note: 'err' is -95
           if (err) {
               ^~~
   fs/fuse/dir.c:476:2: note: Taking true branch
           if (err) {
           ^
   fs/fuse/dir.c:477:3: note: Taking false branch
                   if (err !=3D -EOPNOTSUPP)
                   ^
   fs/fuse/dir.c:482:6: note: Branch condition evaluates to a garbage value
           if (lsmctx.len) {
               ^~~~~~~~~~
   fs/fuse/dir.c:506:3: warning: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(ptr, name);
                   ^~~~~~
   fs/fuse/dir.c:506:3: note: Call to function 'strcpy' is insecure as it d=
oes not provide bounding of the memory buffer. Replace unbounded copy funct=
ions with analogous functions that support length arguments such as 'strlcp=
y'. CWE-119
                   strcpy(ptr, name);
                   ^~~~~~
   fs/fuse/dir.c:509:3: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ptr, lsmctx.context, lsmctx.len);
                   ^~~~~~
   fs/fuse/dir.c:509:3: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
                   memcpy(ptr, lsmctx.context, lsmctx.len);
                   ^~~~~~
   fs/fuse/dir.c:560:2: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   fs/fuse/dir.c:560:2: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   fs/fuse/dir.c:561:2: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memset(&outentry, 0, sizeof(outentry));
           ^~~~~~
   fs/fuse/dir.c:561:2: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
           memset(&outentry, 0, sizeof(outentry));
           ^~~~~~
   fs/fuse/dir.c:709:2: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memset(&outarg, 0, sizeof(outarg));
           ^~~~~~
   fs/fuse/dir.c:709:2: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
           memset(&outarg, 0, sizeof(outarg));
           ^~~~~~
   fs/fuse/dir.c:764:2: warning: Address of stack memory associated with lo=
cal variable 'outarg' is still referred to by the stack variable 'args' upo=
n returning to the caller.  This will be a dangling reference [clang-analyz=
er-core.StackAddressEscape]
           return err;
           ^
   fs/fuse/dir.c:649:2: note: Taking false branch
           if (fuse_is_bad(dir))
           ^
   fs/fuse/dir.c:652:6: note: Assuming the condition is true
           if (d_in_lookup(entry)) {
               ^~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:652:2: note: Taking true branch
           if (d_in_lookup(entry)) {
           ^
   fs/fuse/dir.c:654:3: note: Taking false branch
                   if (IS_ERR(res))
                   ^
   fs/fuse/dir.c:657:7: note: Assuming 'res' is null
                   if (res)
                       ^~~
   fs/fuse/dir.c:657:3: note: Taking false branch

vim +482 fs/fuse/dir.c

e5e5558e923f35 Miklos Szeredi  2005-09-09  461  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  462  static int get_security_con=
text(struct dentry *entry, umode_t mode,
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  463  				void **security_ctx, u3=
2 *security_ctxlen)
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  464  {
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  465  	struct fuse_secctx *fctx;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  466  	struct fuse_secctx_header =
*header;
86d33e271bed73 Casey Schaufler 2022-06-09  467  	struct lsmcontext lsmctx;
86d33e271bed73 Casey Schaufler 2022-06-09  468  	void *ptr;
86d33e271bed73 Casey Schaufler 2022-06-09  469  	u32 total_len =3D sizeof(*=
header);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  470  	int err, nr_ctx =3D 0;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  471  	const char *name;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  472  	size_t namelen;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  473  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  474  	err =3D security_dentry_in=
it_security(entry, mode, &entry->d_name,
86d33e271bed73 Casey Schaufler 2022-06-09  475  					    &name, &lsmctx);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  476  	if (err) {
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  477  		if (err !=3D -EOPNOTSUPP)
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  478  			goto out_err;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  479  		/* No LSM is supporting t=
his security hook. Ignore error */
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  480  	}
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  481  =

86d33e271bed73 Casey Schaufler 2022-06-09 @482  	if (lsmctx.len) {
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  483  		nr_ctx =3D 1;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  484  		namelen =3D strlen(name) =
+ 1;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  485  		err =3D -EIO;
86d33e271bed73 Casey Schaufler 2022-06-09  486  		if (WARN_ON(namelen > XAT=
TR_NAME_MAX + 1 ||
86d33e271bed73 Casey Schaufler 2022-06-09  487  		    lsmctx.len > S32_MAX))
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  488  			goto out_err;
86d33e271bed73 Casey Schaufler 2022-06-09  489  		total_len +=3D FUSE_REC_A=
LIGN(sizeof(*fctx) + namelen +
86d33e271bed73 Casey Schaufler 2022-06-09  490  					    lsmctx.len);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  491  	}
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  492  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  493  	err =3D -ENOMEM;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  494  	header =3D ptr =3D kzalloc=
(total_len, GFP_KERNEL);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  495  	if (!ptr)
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  496  		goto out_err;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  497  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  498  	header->nr_secctx =3D nr_c=
tx;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  499  	header->size =3D total_len;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  500  	ptr +=3D sizeof(*header);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  501  	if (nr_ctx) {
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  502  		fctx =3D ptr;
86d33e271bed73 Casey Schaufler 2022-06-09  503  		fctx->size =3D lsmctx.len;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  504  		ptr +=3D sizeof(*fctx);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  505  =

3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  506  		strcpy(ptr, name);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  507  		ptr +=3D namelen;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  508  =

86d33e271bed73 Casey Schaufler 2022-06-09  509  		memcpy(ptr, lsmctx.contex=
t, lsmctx.len);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  510  	}
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  511  	*security_ctxlen =3D total=
_len;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  512  	*security_ctx =3D header;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  513  	err =3D 0;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  514  out_err:
86d33e271bed73 Casey Schaufler 2022-06-09  515  	if (nr_ctx)
86d33e271bed73 Casey Schaufler 2022-06-09  516  		security_release_secctx(&=
lsmctx);
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  517  	return err;
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  518  }
3e2b6fdbdc9ab5 Vivek Goyal     2021-11-11  519  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7627227798729945261==--

