Content-Type: multipart/mixed; boundary="===============0535649428291673754=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ogabbay:habanalabs-next 14/44] drivers/misc/habanalabs/common/memory_mgr.c:273:7: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sat, 07 May 2022 21:41:37 +0800
Message-ID: <202205072142.wNzl13BK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0535649428291673754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yuri Nudelman <ynudelman@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git h=
abanalabs-next
head:   31b4e207e4199cd59aac5e6f4f546bcc8410558b
commit: dbb42df4b94ab9c7d74483439b8b3f7ec08db191 [14/44] habanalabs: unifie=
d memory manager infrastructure
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20220505 (https://download.01.org/0day-ci/arc=
hive/20220507/202205072142.wNzl13BK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git=
/commit/?id=3Ddbb42df4b94ab9c7d74483439b8b3f7ec08db191
        git remote add ogabbay https://git.kernel.org/pub/scm/linux/kernel/=
git/ogabbay/linux.git
        git fetch --no-tags ogabbay habanalabs-next
        git checkout dbb42df4b94ab9c7d74483439b8b3f7ec08db191
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3746:2: note: Taking false branch
           if (FLEXONENAND(this))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mtd/nand/onenand/onenand_base.c:3751:23: note: The result of the=
 left shift is undefined due to shifting by '4294967295', which is greater =
or equal to the width of type 'int'
           this->page_mask =3D (1 << (this->erase_shift - this->page_shift)=
) - 1;
                                ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 42 warnings (35 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/video/fbdev/riva/rivafb-i2c.c:94:2: warning: Call to function 's=
trcpy' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.=
strcpy]
           strcpy(chan->adapter.name, name);
           ^~~~~~
   drivers/video/fbdev/riva/rivafb-i2c.c:94:2: note: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119
           strcpy(chan->adapter.name, name);
           ^~~~~~
   Suppressed 54 warnings (47 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/i2c/busses/i2c-designware-master.c:107:3: warning: Value stored =
to 'fp_str' is never read [clang-analyzer-deadcode.DeadStores]
                   fp_str =3D " Plus";
                   ^        ~~~~~~~
   drivers/i2c/busses/i2c-designware-master.c:107:3: note: Value stored to =
'fp_str' is never read
                   fp_str =3D " Plus";
                   ^        ~~~~~~~
   drivers/i2c/busses/i2c-designware-master.c:886:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(adap->name, sizeof(adap->name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-designware-master.c:886:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(adap->name, sizeof(adap->name),
           ^~~~~~~~
   Suppressed 54 warnings (47 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (47 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (47 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (47 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/input/rmi4/rmi_bus.c:161:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(of_name, sizeof(of_name), "rmi4-f%02x",
           ^~~~~~~~
   drivers/input/rmi4/rmi_bus.c:161:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(of_name, sizeof(of_name), "rmi4-f%02x",
           ^~~~~~~~
   Suppressed 42 warnings (35 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/input/rmi4/rmi_driver.c:586:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, sizeof(buf));
           ^~~~~~
   drivers/input/rmi4/rmi_driver.c:586:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, sizeof(buf));
           ^~~~~~
   Suppressed 42 warnings (35 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/input/rmi4/rmi_f01.c:174:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(props->dom, sizeof(props->dom), "20%02d/%02d/%02d",
           ^~~~~~~~
   drivers/input/rmi4/rmi_f01.c:174:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(props->dom, sizeof(props->dom), "20%02d/%02d/%02d",
           ^~~~~~~~
   drivers/input/rmi4/rmi_f01.c:179:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(props->product_id, &queries[11],
           ^~~~~~
   drivers/input/rmi4/rmi_f01.c:179:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(props->product_id, &queries[11],
           ^~~~~~
   Suppressed 42 warnings (35 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   drivers/misc/habanalabs/common/state_dump.c:80:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(resized_buf, *buf, *size);
           ^~~~~~
   drivers/misc/habanalabs/common/state_dump.c:80:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(resized_buf, *buf, *size);
           ^~~~~~
   drivers/misc/habanalabs/common/state_dump.c:116:11: warning: Call to fun=
ction 'vsnprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'vsnprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           length =3D vsnprintf(*buf + *offset, *size - *offset, format, ar=
gs);
                    ^~~~~~~~~
   drivers/misc/habanalabs/common/state_dump.c:116:11: note: Call to functi=
on 'vsnprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'vsnprintf_s' in case of C11
           length =3D vsnprintf(*buf + *offset, *size - *offset, format, ar=
gs);
                    ^~~~~~~~~
   drivers/misc/habanalabs/common/state_dump.c:125:12: warning: Call to fun=
ction 'vsnprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'vsnprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   length =3D vsnprintf(*buf + *offset, *size - *offset, fo=
rmat,
                            ^~~~~~~~~
   drivers/misc/habanalabs/common/state_dump.c:125:12: note: Call to functi=
on 'vsnprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'vsnprintf_s' in case of C11
                   length =3D vsnprintf(*buf + *offset, *size - *offset, fo=
rmat,
                            ^~~~~~~~~
   Suppressed 74 warnings (67 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
>> drivers/misc/habanalabs/common/memory_mgr.c:273:7: warning: Use of memor=
y after it is freed [clang-analyzer-unix.Malloc]
                   if (hl_mmap_mem_buf_put(buf) !=3D 1)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/misc/habanalabs/common/memory_mgr.c:272:2: note: Assuming the co=
ndition is true
           idr_for_each_entry(idp, buf, id) {
           ^
   include/linux/idr.h:188:15: note: expanded from macro 'idr_for_each_entr=
y'
           for (id =3D 0; ((entry) =3D idr_get_next(idr, &(id))) !=3D NULL;=
 id +=3D 1U)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/memory_mgr.c:272:2: note: Loop condition =
is true.  Entering loop body
           idr_for_each_entry(idp, buf, id) {
           ^
   include/linux/idr.h:188:2: note: expanded from macro 'idr_for_each_entry'
           for (id =3D 0; ((entry) =3D idr_get_next(idr, &(id))) !=3D NULL;=
 id +=3D 1U)
           ^
   drivers/misc/habanalabs/common/memory_mgr.c:273:7: note: Calling 'hl_mma=
p_mem_buf_put'
                   if (hl_mmap_mem_buf_put(buf) !=3D 1)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/memory_mgr.c:70:9: note: Calling 'kref_pu=
t'
           return kref_put(&buf->refcount, hl_mmap_mem_buf_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: '?' condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/kref.h:64:2: note: '?' condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/kref.h:65:3: note: Calling 'hl_mmap_mem_buf_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/misc/habanalabs/common/memory_mgr.c:54:2: note: Assuming field '=
release' is null
           if (buf->ops->release)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/memory_mgr.c:54:2: note: '?' condition is=
 false
           if (buf->ops->release)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/misc/habanalabs/common/memory_mgr.c:54:16: note: Field 'release'=
 is null
           if (buf->ops->release)
                         ^
   drivers/misc/habanalabs/common/memory_mgr.c:54:2: note: '?' condition is=
 false
           if (buf->ops->release)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/misc/habanalabs/common/memory_mgr.c:54:2: note: Taking false bra=
nch
           if (buf->ops->release)

vim +273 drivers/misc/habanalabs/common/memory_mgr.c

dbb42df4b94ab9 Yuri Nudelman 2022-03-20  256  =

dbb42df4b94ab9 Yuri Nudelman 2022-03-20  257  /**
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  258   * @hl_mem_mgr_fini - release=
 unified memory manager
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  259   *
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  260   * @mmg: parent unifed memory=
 manager
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  261   *
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  262   * Release the unified memory=
 manager. Shall be called from an interrupt context.
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  263   */
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  264  void hl_mem_mgr_fini(struct h=
l_mem_mgr *mmg)
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  265  {
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  266  	struct hl_mmap_mem_buf *buf;
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  267  	struct idr *idp;
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  268  	u32 id;
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  269  =

dbb42df4b94ab9 Yuri Nudelman 2022-03-20  270  	idp =3D &mmg->handles;
dbb42df4b94ab9 Yuri Nudelman 2022-03-20  271  =

dbb42df4b94ab9 Yuri Nudelman 2022-03-20  272  	idr_for_each_entry(idp, buf,=
 id) {
dbb42df4b94ab9 Yuri Nudelman 2022-03-20 @273  		if (hl_mmap_mem_buf_put(buf=
) !=3D 1)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0535649428291673754==--

