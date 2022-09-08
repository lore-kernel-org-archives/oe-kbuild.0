Content-Type: multipart/mixed; boundary="===============8648453262612670697=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/of/kexec.c:414:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 08 Sep 2022 19:16:07 +0800
Message-ID: <202209081918.zE8MoyWm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8648453262612670697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/of/kexec.c:414:3: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>

Hi Jason,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0066f1b0e27556381402db3ff31f85d2a2265858
commit: b7133757da4c4c17d625970f6da3d76af12a8867 crypto: s390 - do not depe=
nd on CRYPTO_HW for SIMD implementations
date:   9 weeks ago
:::::: branch date: 34 hours ago
:::::: commit date: 9 weeks ago
config: s390-randconfig-c005-20220906
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db7133757da4c4c17d625970f6da3d76af12a8867
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b7133757da4c4c17d625970f6da3d76af12a8867
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   sdw_dpn_array_attr(ch_combinations);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:141:12: note: expanded from macro 's=
dw_dpn_array_attr'
                           size +=3D sprintf(buf + size, "\n");            =
  \
                                   ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:164:1: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
   sdw_dpn_array_attr(ch_combinations);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:141:12: note: expanded from macro 's=
dw_dpn_array_attr'
                           size +=3D sprintf(buf + size, "\n");            =
  \
                                   ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:165:1: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
   sdw_dpn_array_attr(channels);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:138:13: note: expanded from macro 's=
dw_dpn_array_attr'
                                   size +=3D sprintf(buf + size,           =
  \
                                           ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:165:1: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
   sdw_dpn_array_attr(channels);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:138:13: note: expanded from macro 's=
dw_dpn_array_attr'
                                   size +=3D sprintf(buf + size,           =
  \
                                           ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:165:1: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   sdw_dpn_array_attr(channels);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:141:12: note: expanded from macro 's=
dw_dpn_array_attr'
                           size +=3D sprintf(buf + size, "\n");            =
  \
                                   ^~~~~~~
   drivers/soundwire/sysfs_slave_dpn.c:165:1: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
   sdw_dpn_array_attr(channels);
   ^
   drivers/soundwire/sysfs_slave_dpn.c:141:12: note: expanded from macro 's=
dw_dpn_array_attr'
                           size +=3D sprintf(buf + size, "\n");            =
  \
                                   ^~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/soundwire/bus_type.c:56:9: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, size, "sdw:m%04Xp%04Xv%02Xc%02X\n",
                  ^~~~~~~~
   drivers/soundwire/bus_type.c:56:9: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, size, "sdw:m%04Xp%04Xv%02Xc%02X\n",
                  ^~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/soundwire/bus.c:329:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(msg, 0, sizeof(*msg));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:329:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(msg, 0, sizeof(*msg));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1618:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(slave_intr.port, &port_status,
                           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1618:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(slave_intr.port, &port_status,
                           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
>> drivers/of/kexec.c:414:3: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/of/kexec.c:414:3: note: Value stored to 'ret' is never read
                   ret =3D 0;
                   ^     ~
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/remoteproc/remoteproc_core.c:263:2: warning: Call to function 'v=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'vsnprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(_name, sizeof(_name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:263:2: note: Call to function 'vsnp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(_name, sizeof(_name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:557:2: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
           ^~~~~~~~
   drivers/remoteproc/remoteproc_core.c:557:2: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
           ^~~~~~~~
   drivers/remoteproc/remoteproc_core.c:683:2: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "trace%d", rproc->num_traces);
           ^~~~~~~~
   drivers/remoteproc/remoteproc_core.c:683:2: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "trace%d", rproc->num_traces);
           ^~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1044:2: warning: Call to function '=
vsnprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'vsnprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(mem->name, sizeof(mem->name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1044:2: note: Call to function 'vsn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(mem->name, sizeof(mem->name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1083:2: warning: Call to function '=
vsnprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'vsnprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(mem->name, sizeof(mem->name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1083:2: note: Call to function 'vsn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(mem->name, sizeof(mem->name), name, args);
           ^~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1395:3: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(loaded_table, rproc->cached_table, rproc->table_s=
z);
                   ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1395:3: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(loaded_table, rproc->cached_table, rproc->table_s=
z);
                   ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1644:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(table_ptr, rproc->clean_table, rproc->table_sz);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1644:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(table_ptr, rproc->clean_table, rproc->table_sz);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/leds/led-class-flash.c:75:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", fled_cdev->brightness.val);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:75:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", fled_cdev->brightness.val);
                  ^~~~~~~
   drivers/leds/led-class-flash.c:85:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]

vim +/ret +414 drivers/of/kexec.c

fee3ff99bc6760 Lakshmi Ramasubramanian 2021-02-21  251  =

b30be4dc733e50 Rob Herring             2021-02-21  252  /*
b30be4dc733e50 Rob Herring             2021-02-21  253   * of_kexec_alloc_a=
nd_setup_fdt - Alloc and setup a new Flattened Device Tree
b30be4dc733e50 Rob Herring             2021-02-21  254   *
b30be4dc733e50 Rob Herring             2021-02-21  255   * @image:		kexec i=
mage being loaded.
b30be4dc733e50 Rob Herring             2021-02-21  256   * @initrd_load_add=
r:	Address where the next initrd will be loaded.
b30be4dc733e50 Rob Herring             2021-02-21  257   * @initrd_len:		Si=
ze of the next initrd, or 0 if there will be none.
b30be4dc733e50 Rob Herring             2021-02-21  258   * @cmdline:		Comma=
nd line for the next kernel, or NULL if there will
b30be4dc733e50 Rob Herring             2021-02-21  259   *			be none.
b30be4dc733e50 Rob Herring             2021-02-21  260   * @extra_fdt_size:=
	Additional size for the new FDT buffer.
b30be4dc733e50 Rob Herring             2021-02-21  261   *
b30be4dc733e50 Rob Herring             2021-02-21  262   * Return: fdt on s=
uccess, or NULL errno on error.
b30be4dc733e50 Rob Herring             2021-02-21  263   */
b30be4dc733e50 Rob Herring             2021-02-21  264  void *of_kexec_allo=
c_and_setup_fdt(const struct kimage *image,
b30be4dc733e50 Rob Herring             2021-02-21  265  				   unsigned lon=
g initrd_load_addr,
b30be4dc733e50 Rob Herring             2021-02-21  266  				   unsigned lon=
g initrd_len,
b30be4dc733e50 Rob Herring             2021-02-21  267  				   const char *=
cmdline, size_t extra_fdt_size)
b30be4dc733e50 Rob Herring             2021-02-21  268  {
b30be4dc733e50 Rob Herring             2021-02-21  269  	void *fdt;
b30be4dc733e50 Rob Herring             2021-02-21  270  	int ret, chosen_no=
de;
b30be4dc733e50 Rob Herring             2021-02-21  271  	const void *prop;
b30be4dc733e50 Rob Herring             2021-02-21  272  	size_t fdt_size;
b30be4dc733e50 Rob Herring             2021-02-21  273  =

b30be4dc733e50 Rob Herring             2021-02-21  274  	fdt_size =3D fdt_t=
otalsize(initial_boot_params) +
b30be4dc733e50 Rob Herring             2021-02-21  275  		   (cmdline ? str=
len(cmdline) : 0) +
b30be4dc733e50 Rob Herring             2021-02-21  276  		   FDT_EXTRA_SPAC=
E +
b30be4dc733e50 Rob Herring             2021-02-21  277  		   extra_fdt_size;
b30be4dc733e50 Rob Herring             2021-02-21  278  	fdt =3D kvmalloc(f=
dt_size, GFP_KERNEL);
b30be4dc733e50 Rob Herring             2021-02-21  279  	if (!fdt)
b30be4dc733e50 Rob Herring             2021-02-21  280  		return NULL;
b30be4dc733e50 Rob Herring             2021-02-21  281  =

b30be4dc733e50 Rob Herring             2021-02-21  282  	ret =3D fdt_open_i=
nto(initial_boot_params, fdt, fdt_size);
b30be4dc733e50 Rob Herring             2021-02-21  283  	if (ret < 0) {
b30be4dc733e50 Rob Herring             2021-02-21  284  		pr_err("Error %d =
setting up the new device tree.\n", ret);
b30be4dc733e50 Rob Herring             2021-02-21  285  		goto out;
b30be4dc733e50 Rob Herring             2021-02-21  286  	}
b30be4dc733e50 Rob Herring             2021-02-21  287  =

b30be4dc733e50 Rob Herring             2021-02-21  288  	/* Remove memory r=
eservation for the current device tree. */
b30be4dc733e50 Rob Herring             2021-02-21  289  	ret =3D fdt_find_a=
nd_del_mem_rsv(fdt, __pa(initial_boot_params),
b30be4dc733e50 Rob Herring             2021-02-21  290  				       fdt_tota=
lsize(initial_boot_params));
b30be4dc733e50 Rob Herring             2021-02-21  291  	if (ret =3D=3D -EI=
NVAL) {
b30be4dc733e50 Rob Herring             2021-02-21  292  		pr_err("Error rem=
oving memory reservation.\n");
b30be4dc733e50 Rob Herring             2021-02-21  293  		goto out;
b30be4dc733e50 Rob Herring             2021-02-21  294  	}
b30be4dc733e50 Rob Herring             2021-02-21  295  =

b30be4dc733e50 Rob Herring             2021-02-21  296  	chosen_node =3D fd=
t_path_offset(fdt, "/chosen");
b30be4dc733e50 Rob Herring             2021-02-21  297  	if (chosen_node =
=3D=3D -FDT_ERR_NOTFOUND)
b30be4dc733e50 Rob Herring             2021-02-21  298  		chosen_node =3D f=
dt_add_subnode(fdt, fdt_path_offset(fdt, "/"),
b30be4dc733e50 Rob Herring             2021-02-21  299  					      "chosen"=
);
b30be4dc733e50 Rob Herring             2021-02-21  300  	if (chosen_node < =
0) {
b30be4dc733e50 Rob Herring             2021-02-21  301  		ret =3D chosen_no=
de;
b30be4dc733e50 Rob Herring             2021-02-21  302  		goto out;
b30be4dc733e50 Rob Herring             2021-02-21  303  	}
b30be4dc733e50 Rob Herring             2021-02-21  304  =

cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  305  	ret =3D fdt_delpro=
p(fdt, chosen_node, "linux,elfcorehdr");
b30be4dc733e50 Rob Herring             2021-02-21  306  	if (ret && ret !=
=3D -FDT_ERR_NOTFOUND)
b30be4dc733e50 Rob Herring             2021-02-21  307  		goto out;
cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  308  	ret =3D fdt_delpro=
p(fdt, chosen_node, "linux,usable-memory-range");
b30be4dc733e50 Rob Herring             2021-02-21  309  	if (ret && ret !=
=3D -FDT_ERR_NOTFOUND)
b30be4dc733e50 Rob Herring             2021-02-21  310  		goto out;
b30be4dc733e50 Rob Herring             2021-02-21  311  =

b30be4dc733e50 Rob Herring             2021-02-21  312  	/* Did we boot usi=
ng an initrd? */
b30be4dc733e50 Rob Herring             2021-02-21  313  	prop =3D fdt_getpr=
op(fdt, chosen_node, "linux,initrd-start", NULL);
b30be4dc733e50 Rob Herring             2021-02-21  314  	if (prop) {
b30be4dc733e50 Rob Herring             2021-02-21  315  		u64 tmp_start, tm=
p_end, tmp_size;
b30be4dc733e50 Rob Herring             2021-02-21  316  =

b30be4dc733e50 Rob Herring             2021-02-21  317  		tmp_start =3D fdt=
64_to_cpu(*((const fdt64_t *) prop));
b30be4dc733e50 Rob Herring             2021-02-21  318  =

b30be4dc733e50 Rob Herring             2021-02-21  319  		prop =3D fdt_getp=
rop(fdt, chosen_node, "linux,initrd-end", NULL);
b30be4dc733e50 Rob Herring             2021-02-21  320  		if (!prop) {
b30be4dc733e50 Rob Herring             2021-02-21  321  			ret =3D -EINVAL;
b30be4dc733e50 Rob Herring             2021-02-21  322  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  323  		}
b30be4dc733e50 Rob Herring             2021-02-21  324  =

b30be4dc733e50 Rob Herring             2021-02-21  325  		tmp_end =3D fdt64=
_to_cpu(*((const fdt64_t *) prop));
b30be4dc733e50 Rob Herring             2021-02-21  326  =

b30be4dc733e50 Rob Herring             2021-02-21  327  		/*
b30be4dc733e50 Rob Herring             2021-02-21  328  		 * kexec reserves=
 exact initrd size, while firmware may
b30be4dc733e50 Rob Herring             2021-02-21  329  		 * reserve a mult=
iple of PAGE_SIZE, so check for both.
b30be4dc733e50 Rob Herring             2021-02-21  330  		 */
b30be4dc733e50 Rob Herring             2021-02-21  331  		tmp_size =3D tmp_=
end - tmp_start;
b30be4dc733e50 Rob Herring             2021-02-21  332  		ret =3D fdt_find_=
and_del_mem_rsv(fdt, tmp_start, tmp_size);
b30be4dc733e50 Rob Herring             2021-02-21  333  		if (ret =3D=3D -E=
NOENT)
b30be4dc733e50 Rob Herring             2021-02-21  334  			ret =3D fdt_find=
_and_del_mem_rsv(fdt, tmp_start,
b30be4dc733e50 Rob Herring             2021-02-21  335  						       round_=
up(tmp_size, PAGE_SIZE));
b30be4dc733e50 Rob Herring             2021-02-21  336  		if (ret =3D=3D -E=
INVAL)
b30be4dc733e50 Rob Herring             2021-02-21  337  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  338  	}
b30be4dc733e50 Rob Herring             2021-02-21  339  =

b30be4dc733e50 Rob Herring             2021-02-21  340  	/* add initrd-* */
b30be4dc733e50 Rob Herring             2021-02-21  341  	if (initrd_load_ad=
dr) {
cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  342  		ret =3D fdt_setpr=
op_u64(fdt, chosen_node, "linux,initrd-start",
b30be4dc733e50 Rob Herring             2021-02-21  343  				      initrd_lo=
ad_addr);
b30be4dc733e50 Rob Herring             2021-02-21  344  		if (ret)
b30be4dc733e50 Rob Herring             2021-02-21  345  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  346  =

cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  347  		ret =3D fdt_setpr=
op_u64(fdt, chosen_node, "linux,initrd-end",
b30be4dc733e50 Rob Herring             2021-02-21  348  				      initrd_lo=
ad_addr + initrd_len);
b30be4dc733e50 Rob Herring             2021-02-21  349  		if (ret)
b30be4dc733e50 Rob Herring             2021-02-21  350  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  351  =

b30be4dc733e50 Rob Herring             2021-02-21  352  		ret =3D fdt_add_m=
em_rsv(fdt, initrd_load_addr, initrd_len);
b30be4dc733e50 Rob Herring             2021-02-21  353  		if (ret)
b30be4dc733e50 Rob Herring             2021-02-21  354  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  355  =

b30be4dc733e50 Rob Herring             2021-02-21  356  	} else {
cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  357  		ret =3D fdt_delpr=
op(fdt, chosen_node, "linux,initrd-start");
b30be4dc733e50 Rob Herring             2021-02-21  358  		if (ret && (ret !=
=3D -FDT_ERR_NOTFOUND))
b30be4dc733e50 Rob Herring             2021-02-21  359  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  360  =

cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  361  		ret =3D fdt_delpr=
op(fdt, chosen_node, "linux,initrd-end");
b30be4dc733e50 Rob Herring             2021-02-21  362  		if (ret && (ret !=
=3D -FDT_ERR_NOTFOUND))
b30be4dc733e50 Rob Herring             2021-02-21  363  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  364  	}
b30be4dc733e50 Rob Herring             2021-02-21  365  =

b30be4dc733e50 Rob Herring             2021-02-21  366  	if (image->type =
=3D=3D KEXEC_TYPE_CRASH) {
b30be4dc733e50 Rob Herring             2021-02-21  367  		/* add linux,elfc=
orehdr */
b30be4dc733e50 Rob Herring             2021-02-21  368  		ret =3D fdt_appen=
dprop_addrrange(fdt, 0, chosen_node,
cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  369  				"linux,elfcoreh=
dr", image->elf_load_addr,
b30be4dc733e50 Rob Herring             2021-02-21  370  				image->elf_head=
ers_sz);
b30be4dc733e50 Rob Herring             2021-02-21  371  		if (ret)
b30be4dc733e50 Rob Herring             2021-02-21  372  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  373  =

b30be4dc733e50 Rob Herring             2021-02-21  374  		/*
b30be4dc733e50 Rob Herring             2021-02-21  375  		 * Avoid elfcoreh=
dr from being stomped on in kdump kernel by
b30be4dc733e50 Rob Herring             2021-02-21  376  		 * setting up mem=
ory reserve map.
b30be4dc733e50 Rob Herring             2021-02-21  377  		 */
b30be4dc733e50 Rob Herring             2021-02-21  378  		ret =3D fdt_add_m=
em_rsv(fdt, image->elf_load_addr,
b30be4dc733e50 Rob Herring             2021-02-21  379  				      image->el=
f_headers_sz);
b30be4dc733e50 Rob Herring             2021-02-21  380  		if (ret)
b30be4dc733e50 Rob Herring             2021-02-21  381  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  382  =

b30be4dc733e50 Rob Herring             2021-02-21  383  		/* add linux,usab=
le-memory-range */
b30be4dc733e50 Rob Herring             2021-02-21  384  		ret =3D fdt_appen=
dprop_addrrange(fdt, 0, chosen_node,
cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  385  				"linux,usable-m=
emory-range", crashk_res.start,
b30be4dc733e50 Rob Herring             2021-02-21  386  				crashk_res.end =
- crashk_res.start + 1);
b30be4dc733e50 Rob Herring             2021-02-21  387  		if (ret)
b30be4dc733e50 Rob Herring             2021-02-21  388  			goto out;
8af6b91f583413 Zhen Lei                2022-05-06  389  =

8af6b91f583413 Zhen Lei                2022-05-06  390  		if (crashk_low_re=
s.end) {
8af6b91f583413 Zhen Lei                2022-05-06  391  			ret =3D fdt_appe=
ndprop_addrrange(fdt, 0, chosen_node,
8af6b91f583413 Zhen Lei                2022-05-06  392  					"linux,usable-=
memory-range",
8af6b91f583413 Zhen Lei                2022-05-06  393  					crashk_low_res=
.start,
8af6b91f583413 Zhen Lei                2022-05-06  394  					crashk_low_res=
.end - crashk_low_res.start + 1);
8af6b91f583413 Zhen Lei                2022-05-06  395  			if (ret)
8af6b91f583413 Zhen Lei                2022-05-06  396  				goto out;
8af6b91f583413 Zhen Lei                2022-05-06  397  		}
b30be4dc733e50 Rob Herring             2021-02-21  398  	}
b30be4dc733e50 Rob Herring             2021-02-21  399  =

b30be4dc733e50 Rob Herring             2021-02-21  400  	/* add bootargs */
b30be4dc733e50 Rob Herring             2021-02-21  401  	if (cmdline) {
cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  402  		ret =3D fdt_setpr=
op_string(fdt, chosen_node, "bootargs", cmdline);
b30be4dc733e50 Rob Herring             2021-02-21  403  		if (ret)
b30be4dc733e50 Rob Herring             2021-02-21  404  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  405  	} else {
cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  406  		ret =3D fdt_delpr=
op(fdt, chosen_node, "bootargs");
b30be4dc733e50 Rob Herring             2021-02-21  407  		if (ret && (ret !=
=3D -FDT_ERR_NOTFOUND))
b30be4dc733e50 Rob Herring             2021-02-21  408  			goto out;
b30be4dc733e50 Rob Herring             2021-02-21  409  	}
b30be4dc733e50 Rob Herring             2021-02-21  410  =

b30be4dc733e50 Rob Herring             2021-02-21  411  	/* add kaslr-seed =
*/
cc6ef3d1fdde75 Geert Uytterhoeven      2021-07-14  412  	ret =3D fdt_delpro=
p(fdt, chosen_node, "kaslr-seed");
b30be4dc733e50 Rob Herring             2021-02-21  413  	if (ret =3D=3D -FD=
T_ERR_NOTFOUND)
b30be4dc733e50 Rob Herring             2021-02-21 @414  		ret =3D 0;

:::::: The code at line 414 was first introduced by commit
:::::: b30be4dc733e5067b56def359b0823f1e54ded8c of: Add a common kexec FDT =
setup function

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Rob Herring <robh@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp

--===============8648453262612670697==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.ksh"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3Mz
OTAgNS4xOS4wLXJjNCBLZXJuZWwgQ29uZmlndXJhdGlvbgojCkNPTkZJR19DQ19WRVJTSU9OX1RF
WFQ9ImNsYW5nIHZlcnNpb24gMTYuMC4wIChnaXQ6Ly9naXRtaXJyb3IvbGx2bV9wcm9qZWN0IDE1
NDZkZjQ5ZjVhNmQwOWRmNzhmNTY5ZTQxMzdkZGIzNjVhM2U4MjcpIgpDT05GSUdfR0NDX1ZFUlNJ
T049MApDT05GSUdfQ0NfSVNfQ0xBTkc9eQpDT05GSUdfQ0xBTkdfVkVSU0lPTj0xNjAwMDAKQ09O
RklHX0FTX0lTX0xMVk09eQpDT05GSUdfQVNfVkVSU0lPTj0xNjAwMDAKQ09ORklHX0xEX0lTX0JG
RD15CkNPTkZJR19MRF9WRVJTSU9OPTIzODAwCkNPTkZJR19MTERfVkVSU0lPTj0wCkNPTkZJR19D
Q19IQVNfQVNNX0dPVE89eQpDT05GSUdfQ0NfSEFTX0FTTV9HT1RPX09VVFBVVD15CkNPTkZJR19D
Q19IQVNfQVNNX0lOTElORT15CkNPTkZJR19DQ19IQVNfTk9fUFJPRklMRV9GTl9BVFRSPXkKQ09O
RklHX1BBSE9MRV9WRVJTSU9OPTEyMwpDT05GSUdfQ09OU1RSVUNUT1JTPXkKQ09ORklHX0lSUV9X
T1JLPXkKQ09ORklHX0JVSUxEVElNRV9UQUJMRV9TT1JUPXkKQ09ORklHX1RIUkVBRF9JTkZPX0lO
X1RBU0s9eQoKIwojIEdlbmVyYWwgc2V0dXAKIwpDT05GSUdfSU5JVF9FTlZfQVJHX0xJTUlUPTMy
CiMgQ09ORklHX1dFUlJPUiBpcyBub3Qgc2V0CkNPTkZJR19MT0NBTFZFUlNJT049IiIKIyBDT05G
SUdfTE9DQUxWRVJTSU9OX0FVVE8gaXMgbm90IHNldApDT05GSUdfQlVJTERfU0FMVD0iIgpDT05G
SUdfSEFWRV9LRVJORUxfR1pJUD15CkNPTkZJR19IQVZFX0tFUk5FTF9CWklQMj15CkNPTkZJR19I
QVZFX0tFUk5FTF9MWk1BPXkKQ09ORklHX0hBVkVfS0VSTkVMX1haPXkKQ09ORklHX0hBVkVfS0VS
TkVMX0xaTz15CkNPTkZJR19IQVZFX0tFUk5FTF9MWjQ9eQpDT05GSUdfSEFWRV9LRVJORUxfWlNU
RD15CkNPTkZJR19IQVZFX0tFUk5FTF9VTkNPTVBSRVNTRUQ9eQojIENPTkZJR19LRVJORUxfR1pJ
UCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9CWklQMiBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
Uk5FTF9MWk1BIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX1haIGlzIG5vdCBzZXQKIyBDT05G
SUdfS0VSTkVMX0xaTyBpcyBub3Qgc2V0CkNPTkZJR19LRVJORUxfTFo0PXkKIyBDT05GSUdfS0VS
TkVMX1pTVEQgaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfVU5DT01QUkVTU0VEIGlzIG5vdCBz
ZXQKQ09ORklHX0RFRkFVTFRfSU5JVD0iIgpDT05GSUdfREVGQVVMVF9IT1NUTkFNRT0iKG5vbmUp
IgojIENPTkZJR19TWVNWSVBDIGlzIG5vdCBzZXQKQ09ORklHX1dBVENIX1FVRVVFPXkKQ09ORklH
X0NST1NTX01FTU9SWV9BVFRBQ0g9eQpDT05GSUdfVVNFTElCPXkKQ09ORklHX0hBVkVfQVJDSF9B
VURJVFNZU0NBTEw9eQoKIwojIElSUSBzdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19JUlFfSU5K
RUNUSU9OPXkKQ09ORklHX0dFTkVSSUNfSVJRX0NISVA9eQpDT05GSUdfSVJRX0RPTUFJTj15CkNP
TkZJR19JUlFfU0lNPXkKQ09ORklHX1NQQVJTRV9JUlE9eQpDT05GSUdfR0VORVJJQ19JUlFfREVC
VUdGUz15CiMgZW5kIG9mIElSUSBzdWJzeXN0ZW0KCkNPTkZJR19HRU5FUklDX1RJTUVfVlNZU0NB
TEw9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UUz15CgojCiMgVGltZXJzIHN1YnN5c3RlbQoj
CkNPTkZJR19USUNLX09ORVNIT1Q9eQpDT05GSUdfTk9fSFpfQ09NTU9OPXkKIyBDT05GSUdfSFpf
UEVSSU9ESUMgaXMgbm90IHNldApDT05GSUdfTk9fSFpfSURMRT15CkNPTkZJR19OT19IWj15CiMg
Q09ORklHX0hJR0hfUkVTX1RJTUVSUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFRpbWVycyBzdWJzeXN0
ZW0KCkNPTkZJR19CUEY9eQpDT05GSUdfSEFWRV9FQlBGX0pJVD15CkNPTkZJR19BUkNIX1dBTlRf
REVGQVVMVF9CUEZfSklUPXkKCiMKIyBCUEYgc3Vic3lzdGVtCiMKQ09ORklHX0JQRl9TWVNDQUxM
PXkKIyBDT05GSUdfQlBGX0pJVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JQRl9VTlBSSVZfREVGQVVM
VF9PRkYgaXMgbm90IHNldApDT05GSUdfVVNFUk1PREVfRFJJVkVSPXkKQ09ORklHX0JQRl9QUkVM
T0FEPXkKIyBDT05GSUdfQlBGX1BSRUxPQURfVU1EIGlzIG5vdCBzZXQKIyBlbmQgb2YgQlBGIHN1
YnN5c3RlbQoKQ09ORklHX1BSRUVNUFRfQlVJTEQ9eQojIENPTkZJR19QUkVFTVBUX05PTkUgaXMg
bm90IHNldAojIENPTkZJR19QUkVFTVBUX1ZPTFVOVEFSWSBpcyBub3Qgc2V0CkNPTkZJR19QUkVF
TVBUPXkKQ09ORklHX1BSRUVNUFRfQ09VTlQ9eQpDT05GSUdfUFJFRU1QVElPTj15CkNPTkZJR19T
Q0hFRF9DT1JFPXkKCiMKIyBDUFUvVGFzayB0aW1lIGFuZCBzdGF0cyBhY2NvdW50aW5nCiMKQ09O
RklHX1ZJUlRfQ1BVX0FDQ09VTlRJTkc9eQpDT05GSUdfVklSVF9DUFVfQUNDT1VOVElOR19OQVRJ
VkU9eQpDT05GSUdfUFNJPXkKIyBDT05GSUdfUFNJX0RFRkFVTFRfRElTQUJMRUQgaXMgbm90IHNl
dAojIGVuZCBvZiBDUFUvVGFzayB0aW1lIGFuZCBzdGF0cyBhY2NvdW50aW5nCgpDT05GSUdfQ1BV
X0lTT0xBVElPTj15CgojCiMgUkNVIFN1YnN5c3RlbQojCkNPTkZJR19UUkVFX1JDVT15CkNPTkZJ
R19QUkVFTVBUX1JDVT15CkNPTkZJR19SQ1VfRVhQRVJUPXkKQ09ORklHX1NSQ1U9eQpDT05GSUdf
VFJFRV9TUkNVPXkKQ09ORklHX1RBU0tTX1JDVV9HRU5FUklDPXkKQ09ORklHX0ZPUkNFX1RBU0tT
X1JDVT15CkNPTkZJR19UQVNLU19SQ1U9eQpDT05GSUdfRk9SQ0VfVEFTS1NfUlVERV9SQ1U9eQpD
T05GSUdfVEFTS1NfUlVERV9SQ1U9eQojIENPTkZJR19GT1JDRV9UQVNLU19UUkFDRV9SQ1UgaXMg
bm90IHNldApDT05GSUdfVEFTS1NfVFJBQ0VfUkNVPXkKQ09ORklHX1JDVV9TVEFMTF9DT01NT049
eQpDT05GSUdfUkNVX05FRURfU0VHQ0JMSVNUPXkKQ09ORklHX1JDVV9GQU5PVVQ9NjQKQ09ORklH
X1JDVV9GQU5PVVRfTEVBRj0xNgpDT05GSUdfUkNVX0JPT1NUPXkKQ09ORklHX1JDVV9CT09TVF9E
RUxBWT01MDAKIyBDT05GSUdfUkNVX0VYUF9LVEhSRUFEIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNV
X05PQ0JfQ1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfVEFTS1NfVFJBQ0VfUkNVX1JFQURfTUIgaXMg
bm90IHNldAojIGVuZCBvZiBSQ1UgU3Vic3lzdGVtCgpDT05GSUdfQlVJTERfQklOMkM9eQojIENP
TkZJR19JS0NPTkZJRyBpcyBub3Qgc2V0CkNPTkZJR19JS0hFQURFUlM9bQpDT05GSUdfTE9HX0JV
Rl9TSElGVD0xNwpDT05GSUdfTE9HX0NQVV9NQVhfQlVGX1NISUZUPTEyCkNPTkZJR19QUklOVEtf
U0FGRV9MT0dfQlVGX1NISUZUPTEzCkNPTkZJR19QUklOVEtfSU5ERVg9eQoKIwojIFNjaGVkdWxl
ciBmZWF0dXJlcwojCiMgZW5kIG9mIFNjaGVkdWxlciBmZWF0dXJlcwoKQ09ORklHX0FSQ0hfU1VQ
UE9SVFNfTlVNQV9CQUxBTkNJTkc9eQpDT05GSUdfQ0NfSEFTX0lOVDEyOD15CkNPTkZJR19DQ19J
TVBMSUNJVF9GQUxMVEhST1VHSD0iLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCIKQ09ORklHX0dDQzEy
X05PX0FSUkFZX0JPVU5EUz15CiMgQ09ORklHX05VTUFfQkFMQU5DSU5HIGlzIG5vdCBzZXQKQ09O
RklHX0NHUk9VUFM9eQojIENPTkZJR19NRU1DRyBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBfU0NI
RUQ9eQpDT05GSUdfRkFJUl9HUk9VUF9TQ0hFRD15CkNPTkZJR19DRlNfQkFORFdJRFRIPXkKQ09O
RklHX1JUX0dST1VQX1NDSEVEPXkKIyBDT05GSUdfQ0dST1VQX1BJRFMgaXMgbm90IHNldAojIENP
TkZJR19DR1JPVVBfUkRNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9GUkVFWkVSIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1BVU0VUUyBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBfREVWSUNFPXkK
IyBDT05GSUdfQ0dST1VQX0NQVUFDQ1QgaXMgbm90IHNldApDT05GSUdfQ0dST1VQX0JQRj15CiMg
Q09ORklHX0NHUk9VUF9NSVNDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0dST1VQX0RFQlVHIGlzIG5v
dCBzZXQKQ09ORklHX1NPQ0tfQ0dST1VQX0RBVEE9eQojIENPTkZJR19DSEVDS1BPSU5UX1JFU1RP
UkUgaXMgbm90IHNldApDT05GSUdfU0NIRURfQVVUT0dST1VQPXkKIyBDT05GSUdfU1lTRlNfREVQ
UkVDQVRFRCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFTEFZIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxL
X0RFVl9JTklUUkQgaXMgbm90IHNldApDT05GSUdfQk9PVF9DT05GSUc9eQpDT05GSUdfQk9PVF9D
T05GSUdfRU1CRUQ9eQpDT05GSUdfQk9PVF9DT05GSUdfRU1CRURfRklMRT0iIgpDT05GSUdfSU5J
VFJBTUZTX1BSRVNFUlZFX01USU1FPXkKQ09ORklHX0NDX09QVElNSVpFX0ZPUl9QRVJGT1JNQU5D
RT15CiMgQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFIGlzIG5vdCBzZXQKQ09ORklHX1NZU0NU
TF9FWENFUFRJT05fVFJBQ0U9eQpDT05GSUdfRVhQRVJUPXkKIyBDT05GSUdfTVVMVElVU0VSIGlz
IG5vdCBzZXQKQ09ORklHX1NHRVRNQVNLX1NZU0NBTEw9eQojIENPTkZJR19TWVNGU19TWVNDQUxM
IGlzIG5vdCBzZXQKIyBDT05GSUdfRkhBTkRMRSBpcyBub3Qgc2V0CkNPTkZJR19QT1NJWF9USU1F
UlM9eQpDT05GSUdfUFJJTlRLPXkKIyBDT05GSUdfQlVHIGlzIG5vdCBzZXQKQ09ORklHX0VMRl9D
T1JFPXkKIyBDT05GSUdfQkFTRV9GVUxMIGlzIG5vdCBzZXQKQ09ORklHX0ZVVEVYPXkKQ09ORklH
X0ZVVEVYX1BJPXkKIyBDT05GSUdfRVBPTEwgaXMgbm90IHNldApDT05GSUdfU0lHTkFMRkQ9eQpD
T05GSUdfVElNRVJGRD15CkNPTkZJR19FVkVOVEZEPXkKQ09ORklHX1NITUVNPXkKIyBDT05GSUdf
QUlPIGlzIG5vdCBzZXQKQ09ORklHX0lPX1VSSU5HPXkKIyBDT05GSUdfQURWSVNFX1NZU0NBTExT
IGlzIG5vdCBzZXQKQ09ORklHX01FTUJBUlJJRVI9eQpDT05GSUdfS0FMTFNZTVM9eQpDT05GSUdf
S0FMTFNZTVNfQUxMPXkKQ09ORklHX0tBTExTWU1TX0JBU0VfUkVMQVRJVkU9eQojIENPTkZJR19L
Q01QIGlzIG5vdCBzZXQKIyBDT05GSUdfUlNFUSBpcyBub3Qgc2V0CkNPTkZJR19FTUJFRERFRD15
CkNPTkZJR19IQVZFX1BFUkZfRVZFTlRTPXkKQ09ORklHX1BDMTA0PXkKCiMKIyBLZXJuZWwgUGVy
Zm9ybWFuY2UgRXZlbnRzIEFuZCBDb3VudGVycwojCiMgQ09ORklHX1BFUkZfRVZFTlRTIGlzIG5v
dCBzZXQKIyBlbmQgb2YgS2VybmVsIFBlcmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnMKCkNP
TkZJR19TWVNURU1fREFUQV9WRVJJRklDQVRJT049eQojIENPTkZJR19QUk9GSUxJTkcgaXMgbm90
IHNldApDT05GSUdfVFJBQ0VQT0lOVFM9eQojIGVuZCBvZiBHZW5lcmFsIHNldHVwCgpDT05GSUdf
TU1VPXkKQ09ORklHX0NQVV9CSUdfRU5ESUFOPXkKQ09ORklHX0xPQ0tERVBfU1VQUE9SVD15CkNP
TkZJR19TVEFDS1RSQUNFX1NVUFBPUlQ9eQpDT05GSUdfR0VORVJJQ19IV0VJR0hUPXkKQ09ORklH
X0dFTkVSSUNfQlVHX1JFTEFUSVZFX1BPSU5URVJTPXkKQ09ORklHX0dFTkVSSUNfTE9DS0JSRUFL
PXkKQ09ORklHX1BHU1RFPXkKQ09ORklHX0FVRElUX0FSQ0g9eQpDT05GSUdfTk9fSU9QT1JUX01B
UD15CkNPTkZJR19BUkNIX1NVUFBPUlRTX1VQUk9CRVM9eQpDT05GSUdfUzM5MD15CkNPTkZJR19T
Q0hFRF9PTUlUX0ZSQU1FX1BPSU5URVI9eQpDT05GSUdfUEdUQUJMRV9MRVZFTFM9NQpDT05GSUdf
SEFWRV9MSVZFUEFUQ0g9eQoKIwojIFByb2Nlc3NvciB0eXBlIGFuZCBmZWF0dXJlcwojCkNPTkZJ
R19IQVZFX01BUkNIX1oxMF9GRUFUVVJFUz15CkNPTkZJR19IQVZFX01BUkNIX1oxOTZfRkVBVFVS
RVM9eQojIENPTkZJR19NQVJDSF9aMTAgaXMgbm90IHNldApDT05GSUdfTUFSQ0hfWjE5Nj15CiMg
Q09ORklHX01BUkNIX1pFQzEyIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFSQ0hfWjEzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUFSQ0hfWjE0IGlzIG5vdCBzZXQKIyBDT05GSUdfTUFSQ0hfWjE1IGlzIG5v
dCBzZXQKIyBDT05GSUdfTUFSQ0hfWjE2IGlzIG5vdCBzZXQKQ09ORklHX01BUkNIX1oxOTZfVFVO
RT15CiMgQ09ORklHX1RVTkVfREVGQVVMVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RVTkVfWjEwIGlz
IG5vdCBzZXQKQ09ORklHX1RVTkVfWjE5Nj15CiMgQ09ORklHX1RVTkVfWkVDMTIgaXMgbm90IHNl
dAojIENPTkZJR19UVU5FX1oxMyBpcyBub3Qgc2V0CiMgQ09ORklHX1RVTkVfWjE0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVFVORV9aMTUgaXMgbm90IHNldAojIENPTkZJR19UVU5FX1oxNiBpcyBub3Qg
c2V0CkNPTkZJR182NEJJVD15CkNPTkZJR19DT01NQU5EX0xJTkVfU0laRT00MDk2CkNPTkZJR19T
TVA9eQpDT05GSUdfTlJfQ1BVUz02NApDT05GSUdfSE9UUExVR19DUFU9eQpDT05GSUdfTlVNQT15
CkNPTkZJR19OT0RFU19TSElGVD0xCkNPTkZJR19TQ0hFRF9TTVQ9eQpDT05GSUdfU0NIRURfTUM9
eQpDT05GSUdfU0NIRURfQk9PSz15CkNPTkZJR19TQ0hFRF9EUkFXRVI9eQpDT05GSUdfU0NIRURf
VE9QT0xPR1k9eQojIENPTkZJR19IWl8xMDAgaXMgbm90IHNldAojIENPTkZJR19IWl8yNTAgaXMg
bm90IHNldApDT05GSUdfSFpfMzAwPXkKIyBDT05GSUdfSFpfMTAwMCBpcyBub3Qgc2V0CkNPTkZJ
R19IWj0zMDAKQ09ORklHX0tFWEVDPXkKQ09ORklHX0tFWEVDX0ZJTEU9eQpDT05GSUdfQVJDSF9I
QVNfS0VYRUNfUFVSR0FUT1JZPXkKIyBDT05GSUdfS0VYRUNfU0lHIGlzIG5vdCBzZXQKQ09ORklH
X0FSQ0hfUkFORE9NPXkKQ09ORklHX0tFUk5FTF9OT0JQPXkKIyBDT05GSUdfUkVMT0NBVEFCTEUg
aXMgbm90IHNldAojIGVuZCBvZiBQcm9jZXNzb3IgdHlwZSBhbmQgZmVhdHVyZXMKCiMKIyBNZW1v
cnkgc2V0dXAKIwpDT05GSUdfQVJDSF9TUEFSU0VNRU1fRU5BQkxFPXkKQ09ORklHX0FSQ0hfU1BB
UlNFTUVNX0RFRkFVTFQ9eQpDT05GSUdfTUFYX1BIWVNNRU1fQklUUz00NgpDT05GSUdfQ0hFQ0tf
U1RBQ0s9eQpDT05GSUdfU1RBQ0tfR1VBUkQ9MjU2CiMgZW5kIG9mIE1lbW9yeSBzZXR1cAoKIwoj
IEkvTyBzdWJzeXN0ZW0KIwpDT05GSUdfUURJTz1tCiMgQ09ORklHX0NIU0NfU0NIIGlzIG5vdCBz
ZXQKQ09ORklHX1NDTV9CVVM9eQpDT05GSUdfRUFETV9TQ0g9bQojIGVuZCBvZiBJL08gc3Vic3lz
dGVtCgojCiMgRHVtcCBzdXBwb3J0CiMKIyBDT05GSUdfQ1JBU0hfRFVNUCBpcyBub3Qgc2V0CiMg
ZW5kIG9mIER1bXAgc3VwcG9ydAoKQ09ORklHX0NDVz15CgojCiMgVmlydHVhbGl6YXRpb24KIwoj
IENPTkZJR19QUk9URUNURURfVklSVFVBTElaQVRJT05fR1VFU1QgaXMgbm90IHNldApDT05GSUdf
UEZBVUxUPXkKQ09ORklHX0NNTT1tCkNPTkZJR19TMzkwX0hZUEZTX0ZTPXkKQ09ORklHX0hBVkVf
S1ZNPXkKQ09ORklHX0hBVkVfS1ZNX0lSUUNISVA9eQpDT05GSUdfSEFWRV9LVk1fSVJRRkQ9eQpD
T05GSUdfSEFWRV9LVk1fSVJRX1JPVVRJTkc9eQpDT05GSUdfSEFWRV9LVk1fRVZFTlRGRD15CkNP
TkZJR19LVk1fQVNZTkNfUEY9eQpDT05GSUdfS1ZNX0FTWU5DX1BGX1NZTkM9eQpDT05GSUdfSEFW
RV9LVk1fQ1BVX1JFTEFYX0lOVEVSQ0VQVD15CkNPTkZJR19LVk1fVkZJTz15CkNPTkZJR19IQVZF
X0tWTV9JTlZBTElEX1dBS0VVUFM9eQpDT05GSUdfSEFWRV9LVk1fVkNQVV9BU1lOQ19JT0NUTD15
CkNPTkZJR19IQVZFX0tWTV9OT19QT0xMPXkKQ09ORklHX1ZJUlRVQUxJWkFUSU9OPXkKQ09ORklH
X0tWTT15CiMgQ09ORklHX0tWTV9TMzkwX1VDT05UUk9MIGlzIG5vdCBzZXQKIyBDT05GSUdfUzM5
MF9HVUVTVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFZpcnR1YWxpemF0aW9uCgojCiMgU2VsZnRlc3Rz
CiMKIyBlbmQgb2YgU2VsZnRlc3RzCgojCiMgR2VuZXJhbCBhcmNoaXRlY3R1cmUtZGVwZW5kZW50
IG9wdGlvbnMKIwpDT05GSUdfQ1JBU0hfQ09SRT15CkNPTkZJR19LRVhFQ19DT1JFPXkKQ09ORklH
X0dFTkVSSUNfRU5UUlk9eQpDT05GSUdfS1BST0JFUz15CkNPTkZJR19KVU1QX0xBQkVMPXkKQ09O
RklHX1NUQVRJQ19LRVlTX1NFTEZURVNUPXkKQ09ORklHX0tQUk9CRVNfT05fRlRSQUNFPXkKQ09O
RklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1M9eQpDT05GSUdfQVJDSF9VU0VfQlVJ
TFRJTl9CU1dBUD15CkNPTkZJR19LUkVUUFJPQkVTPXkKQ09ORklHX0hBVkVfS1BST0JFUz15CkNP
TkZJR19IQVZFX0tSRVRQUk9CRVM9eQpDT05GSUdfSEFWRV9LUFJPQkVTX09OX0ZUUkFDRT15CkNP
TkZJR19BUkNIX0NPUlJFQ1RfU1RBQ0tUUkFDRV9PTl9LUkVUUFJPQkU9eQpDT05GSUdfSEFWRV9G
VU5DVElPTl9FUlJPUl9JTkpFQ1RJT049eQpDT05GSUdfSEFWRV9OTUk9eQpDT05GSUdfVFJBQ0Vf
SVJRRkxBR1NfU1VQUE9SVD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBQ0VIT09LPXkKQ09ORklHX0hB
VkVfRE1BX0NPTlRJR1VPVVM9eQpDT05GSUdfR0VORVJJQ19TTVBfSURMRV9USFJFQUQ9eQpDT05G
SUdfQVJDSF9IQVNfRk9SVElGWV9TT1VSQ0U9eQpDT05GSUdfQVJDSF9IQVNfU0VUX01FTU9SWT15
CkNPTkZJR19BUkNIX1dBTlRTX0RZTkFNSUNfVEFTS19TVFJVQ1Q9eQpDT05GSUdfQVJDSF9XQU5U
U19OT19JTlNUUj15CkNPTkZJR19BUkNIXzMyQklUX1VTVEFUX0ZfVElOT0RFPXkKQ09ORklHX0hB
VkVfQVNNX01PRFZFUlNJT05TPXkKQ09ORklHX0hBVkVfUkVHU19BTkRfU1RBQ0tfQUNDRVNTX0FQ
ST15CkNPTkZJR19IQVZFX1JTRVE9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9BUkdfQUNDRVNTX0FQ
ST15CkNPTkZJR19IQVZFX1BFUkZfUkVHUz15CkNPTkZJR19IQVZFX1BFUkZfVVNFUl9TVEFDS19E
VU1QPXkKQ09ORklHX0hBVkVfQVJDSF9KVU1QX0xBQkVMPXkKQ09ORklHX0hBVkVfQVJDSF9KVU1Q
X0xBQkVMX1JFTEFUSVZFPXkKQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRT15CkNPTkZJR19N
TVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFPXkKQ09ORklHX01NVV9HQVRIRVJfTk9fR0FUSEVSPXkK
Q09ORklHX0FSQ0hfSEFWRV9OTUlfU0FGRV9DTVBYQ0hHPXkKQ09ORklHX0hBVkVfQ01QWENIR19M
T0NBTD15CkNPTkZJR19IQVZFX0NNUFhDSEdfRE9VQkxFPXkKQ09ORklHX0FSQ0hfV0FOVF9JUENf
UEFSU0VfVkVSU0lPTj15CkNPTkZJR19IQVZFX0FSQ0hfU0VDQ09NUD15CkNPTkZJR19IQVZFX0FS
Q0hfU0VDQ09NUF9GSUxURVI9eQojIENPTkZJR19TRUNDT01QIGlzIG5vdCBzZXQKQ09ORklHX0xU
T19OT05FPXkKQ09ORklHX0hBVkVfVklSVF9DUFVfQUNDT1VOVElORz15CkNPTkZJR19IQVZFX1ZJ
UlRfQ1BVX0FDQ09VTlRJTkdfSURMRT15CkNPTkZJR19BUkNIX0hBU19TQ0FMRURfQ1BVVElNRT15
CkNPTkZJR19IQVZFX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOPXkKQ09ORklHX0hBVkVfQVJDSF9U
UkFOU1BBUkVOVF9IVUdFUEFHRT15CkNPTkZJR19IQVZFX0FSQ0hfU09GVF9ESVJUWT15CkNPTkZJ
R19IQVZFX01PRF9BUkNIX1NQRUNJRklDPXkKQ09ORklHX01PRFVMRVNfVVNFX0VMRl9SRUxBPXkK
Q09ORklHX0hBVkVfU09GVElSUV9PTl9PV05fU1RBQ0s9eQpDT05GSUdfQUxURVJOQVRFX1VTRVJf
QUREUkVTU19TUEFDRT15CkNPTkZJR19BUkNIX0hBU19FTEZfUkFORE9NSVpFPXkKQ09ORklHX1BB
R0VfU0laRV9MRVNTX1RIQU5fNjRLQj15CkNPTkZJR19QQUdFX1NJWkVfTEVTU19USEFOXzI1NktC
PXkKQ09ORklHX0hBVkVfUkVMSUFCTEVfU1RBQ0tUUkFDRT15CkNPTkZJR19DTE9ORV9CQUNLV0FS
RFMyPXkKQ09ORklHX09MRF9TSUdTVVNQRU5EMz15CkNPTkZJR19PTERfU0lHQUNUSU9OPXkKQ09O
RklHX0NPTVBBVF8zMkJJVF9USU1FPXkKQ09ORklHX0hBVkVfQVJDSF9WTUFQX1NUQUNLPXkKIyBD
T05GSUdfVk1BUF9TVEFDSyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfUkFORE9NSVpFX0tT
VEFDS19PRkZTRVQ9eQojIENPTkZJR19SQU5ET01JWkVfS1NUQUNLX09GRlNFVCBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX0hBU19TVFJJQ1RfS0VSTkVMX1JXWD15CkNPTkZJR19TVFJJQ1RfS0VSTkVM
X1JXWD15CkNPTkZJR19BUkNIX0hBU19TVFJJQ1RfTU9EVUxFX1JXWD15CkNPTkZJR19TVFJJQ1Rf
TU9EVUxFX1JXWD15CkNPTkZJR19MT0NLX0VWRU5UX0NPVU5UUz15CkNPTkZJR19BUkNIX0hBU19N
RU1fRU5DUllQVD15CkNPTkZJR19BUkNIX0hBU19WRFNPX0RBVEE9eQpDT05GSUdfQVJDSF9TVVBQ
T1JUU19ERUJVR19QQUdFQUxMT0M9eQoKIwojIEdDT1YtYmFzZWQga2VybmVsIHByb2ZpbGluZwoj
CkNPTkZJR19HQ09WX0tFUk5FTD15CkNPTkZJR19BUkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMPXkK
IyBDT05GSUdfR0NPVl9QUk9GSUxFX0FMTCBpcyBub3Qgc2V0CiMgZW5kIG9mIEdDT1YtYmFzZWQg
a2VybmVsIHByb2ZpbGluZwoKQ09ORklHX0hBVkVfR0NDX1BMVUdJTlM9eQojIGVuZCBvZiBHZW5l
cmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwoKQ09ORklHX1JUX01VVEVYRVM9eQpD
T05GSUdfQkFTRV9TTUFMTD0xCkNPTkZJR19NT0RVTEVfU0lHX0ZPUk1BVD15CkNPTkZJR19NT0RV
TEVTPXkKQ09ORklHX01PRFVMRV9GT1JDRV9MT0FEPXkKQ09ORklHX01PRFVMRV9VTkxPQUQ9eQpD
T05GSUdfTU9EVUxFX0ZPUkNFX1VOTE9BRD15CkNPTkZJR19NT0RVTEVfVU5MT0FEX1RBSU5UX1RS
QUNLSU5HPXkKIyBDT05GSUdfTU9EVkVSU0lPTlMgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVf
U1JDVkVSU0lPTl9BTEwgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1NJRz15CiMgQ09ORklHX01P
RFVMRV9TSUdfRk9SQ0UgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1NJR19BTEw9eQojIENPTkZJ
R19NT0RVTEVfU0lHX1NIQTEgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1NJR19TSEEyMjQ9eQoj
IENPTkZJR19NT0RVTEVfU0lHX1NIQTI1NiBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9TSUdf
U0hBMzg0IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX1NJR19TSEE1MTIgaXMgbm90IHNldApD
T05GSUdfTU9EVUxFX1NJR19IQVNIPSJzaGEyMjQiCiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19O
T05FIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRV9DT01QUkVTU19HWklQPXkKIyBDT05GSUdfTU9E
VUxFX0NPTVBSRVNTX1haIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNTX1pTVEQg
aXMgbm90IHNldApDT05GSUdfTU9EVUxFX0RFQ09NUFJFU1M9eQojIENPTkZJR19NT0RVTEVfQUxM
T1dfTUlTU0lOR19OQU1FU1BBQ0VfSU1QT1JUUyBpcyBub3Qgc2V0CkNPTkZJR19NT0RQUk9CRV9Q
QVRIPSIvc2Jpbi9tb2Rwcm9iZSIKQ09ORklHX1RSSU1fVU5VU0VEX0tTWU1TPXkKQ09ORklHX1VO
VVNFRF9LU1lNU19XSElURUxJU1Q9IiIKQ09ORklHX01PRFVMRVNfVFJFRV9MT09LVVA9eQojIENP
TkZJR19CTE9DSyBpcyBub3Qgc2V0CkNPTkZJR19QUkVFTVBUX05PVElGSUVSUz15CkNPTkZJR19B
U04xPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1NQSU5fVFJZTE9DSz15CkNPTkZJR19BUkNIX0lOTElO
RV9TUElOX1RSWUxPQ0tfQkg9eQpDT05GSUdfQVJDSF9JTkxJTkVfU1BJTl9MT0NLPXkKQ09ORklH
X0FSQ0hfSU5MSU5FX1NQSU5fTE9DS19CSD15CkNPTkZJR19BUkNIX0lOTElORV9TUElOX0xPQ0tf
SVJRPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1NQSU5fTE9DS19JUlFTQVZFPXkKQ09ORklHX0FSQ0hf
SU5MSU5FX1NQSU5fVU5MT0NLPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1NQSU5fVU5MT0NLX0JIPXkK
Q09ORklHX0FSQ0hfSU5MSU5FX1NQSU5fVU5MT0NLX0lSUT15CkNPTkZJR19BUkNIX0lOTElORV9T
UElOX1VOTE9DS19JUlFSRVNUT1JFPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1JFQURfVFJZTE9DSz15
CkNPTkZJR19BUkNIX0lOTElORV9SRUFEX0xPQ0s9eQpDT05GSUdfQVJDSF9JTkxJTkVfUkVBRF9M
T0NLX0JIPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1JFQURfTE9DS19JUlE9eQpDT05GSUdfQVJDSF9J
TkxJTkVfUkVBRF9MT0NLX0lSUVNBVkU9eQpDT05GSUdfQVJDSF9JTkxJTkVfUkVBRF9VTkxPQ0s9
eQpDT05GSUdfQVJDSF9JTkxJTkVfUkVBRF9VTkxPQ0tfQkg9eQpDT05GSUdfQVJDSF9JTkxJTkVf
UkVBRF9VTkxPQ0tfSVJRPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1JFQURfVU5MT0NLX0lSUVJFU1RP
UkU9eQpDT05GSUdfQVJDSF9JTkxJTkVfV1JJVEVfVFJZTE9DSz15CkNPTkZJR19BUkNIX0lOTElO
RV9XUklURV9MT0NLPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1dSSVRFX0xPQ0tfQkg9eQpDT05GSUdf
QVJDSF9JTkxJTkVfV1JJVEVfTE9DS19JUlE9eQpDT05GSUdfQVJDSF9JTkxJTkVfV1JJVEVfTE9D
S19JUlFTQVZFPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1dSSVRFX1VOTE9DSz15CkNPTkZJR19BUkNI
X0lOTElORV9XUklURV9VTkxPQ0tfQkg9eQpDT05GSUdfQVJDSF9JTkxJTkVfV1JJVEVfVU5MT0NL
X0lSUT15CkNPTkZJR19BUkNIX0lOTElORV9XUklURV9VTkxPQ0tfSVJRUkVTVE9SRT15CkNPTkZJ
R19VTklOTElORV9TUElOX1VOTE9DSz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0FUT01JQ19STVc9
eQpDT05GSUdfTVVURVhfU1BJTl9PTl9PV05FUj15CkNPTkZJR19SV1NFTV9TUElOX09OX09XTkVS
PXkKQ09ORklHX0xPQ0tfU1BJTl9PTl9PV05FUj15CkNPTkZJR19BUkNIX0hBU19TWVNDQUxMX1dS
QVBQRVI9eQoKIwojIEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCiMKIyBDT05GSUdfQklORk1UX0VM
RiBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0JJTkZNVF9FTEZfU1RBVEU9eQpDT05GSUdfQklORk1U
X1NDUklQVD1tCkNPTkZJR19CSU5GTVRfTUlTQz15CkNPTkZJR19DT1JFRFVNUD15CiMgZW5kIG9m
IEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCgojCiMgTWVtb3J5IE1hbmFnZW1lbnQgb3B0aW9ucwoj
CgojCiMgU0xBQiBhbGxvY2F0b3Igb3B0aW9ucwojCiMgQ09ORklHX1NMQUIgaXMgbm90IHNldAoj
IENPTkZJR19TTFVCIGlzIG5vdCBzZXQKQ09ORklHX1NMT0I9eQojIGVuZCBvZiBTTEFCIGFsbG9j
YXRvciBvcHRpb25zCgojIENPTkZJR19TSFVGRkxFX1BBR0VfQUxMT0NBVE9SIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NUEFUX0JSSyBpcyBub3Qgc2V0CkNPTkZJR19TUEFSU0VNRU09eQpDT05GSUdf
U1BBUlNFTUVNX0VYVFJFTUU9eQpDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVBfRU5BQkxFPXkKQ09O
RklHX1NQQVJTRU1FTV9WTUVNTUFQPXkKQ09ORklHX0hBVkVfTUVNQkxPQ0tfUEhZU19NQVA9eQpD
T05GSUdfSEFWRV9GQVNUX0dVUD15CkNPTkZJR19OVU1BX0tFRVBfTUVNSU5GTz15CkNPTkZJR19N
RU1PUllfSVNPTEFUSU9OPXkKQ09ORklHX0VYQ0xVU0lWRV9TWVNURU1fUkFNPXkKQ09ORklHX0FS
Q0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHPXkKQ09ORklHX0FSQ0hfRU5BQkxFX01FTU9SWV9IT1RS
RU1PVkU9eQpDT05GSUdfTUVNT1JZX0hPVFBMVUc9eQojIENPTkZJR19NRU1PUllfSE9UUExVR19E
RUZBVUxUX09OTElORSBpcyBub3Qgc2V0CkNPTkZJR19NRU1PUllfSE9UUkVNT1ZFPXkKQ09ORklH
X1NQTElUX1BUTE9DS19DUFVTPTQKQ09ORklHX0FSQ0hfRU5BQkxFX1NQTElUX1BNRF9QVExPQ0s9
eQpDT05GSUdfTUVNT1JZX0JBTExPT049eQojIENPTkZJR19DT01QQUNUSU9OIGlzIG5vdCBzZXQK
Q09ORklHX1BBR0VfUkVQT1JUSU5HPXkKQ09ORklHX01JR1JBVElPTj15CkNPTkZJR19DT05USUdf
QUxMT0M9eQpDT05GSUdfUEhZU19BRERSX1RfNjRCSVQ9eQpDT05GSUdfS1NNPXkKQ09ORklHX0RF
RkFVTFRfTU1BUF9NSU5fQUREUj00MDk2CiMgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFIGlz
IG5vdCBzZXQKQ09ORklHX0NNQT15CkNPTkZJR19DTUFfREVCVUc9eQojIENPTkZJR19DTUFfREVC
VUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NNQV9TWVNGUyBpcyBub3Qgc2V0CkNPTkZJR19DTUFf
QVJFQVM9MTkKIyBDT05GSUdfREVGRVJSRURfU1RSVUNUX1BBR0VfSU5JVCBpcyBub3Qgc2V0CkNP
TkZJR19QQUdFX0lETEVfRkxBRz15CkNPTkZJR19JRExFX1BBR0VfVFJBQ0tJTkc9eQpDT05GSUdf
QVJDSF9IQVNfQ1VSUkVOVF9TVEFDS19QT0lOVEVSPXkKQ09ORklHX1pPTkVfRE1BPXkKIyBDT05G
SUdfVk1fRVZFTlRfQ09VTlRFUlMgaXMgbm90IHNldApDT05GSUdfUEVSQ1BVX1NUQVRTPXkKQ09O
RklHX0dVUF9URVNUPXkKQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMPXkKIyBDT05GSUdfVVNF
UkZBVUxURkQgaXMgbm90IHNldAoKIwojIERhdGEgQWNjZXNzIE1vbml0b3JpbmcKIwojIENPTkZJ
R19EQU1PTiBpcyBub3Qgc2V0CiMgZW5kIG9mIERhdGEgQWNjZXNzIE1vbml0b3JpbmcKIyBlbmQg
b2YgTWVtb3J5IE1hbmFnZW1lbnQgb3B0aW9ucwoKIyBDT05GSUdfTkVUIGlzIG5vdCBzZXQKCiMK
IyBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19IQVZFX1BDST15CiMgQ09ORklHX1BDSSBpcyBub3Qg
c2V0CkNPTkZJR19QQ0NBUkQ9bQojIENPTkZJR19QQ01DSUEgaXMgbm90IHNldAoKIwojIFBDLWNh
cmQgYnJpZGdlcwojCgojCiMgR2VuZXJpYyBEcml2ZXIgT3B0aW9ucwojCkNPTkZJR19BVVhJTElB
UllfQlVTPXkKIyBDT05GSUdfVUVWRU5UX0hFTFBFUiBpcyBub3Qgc2V0CkNPTkZJR19ERVZUTVBG
Uz15CiMgQ09ORklHX0RFVlRNUEZTX01PVU5UIGlzIG5vdCBzZXQKQ09ORklHX0RFVlRNUEZTX1NB
RkU9eQpDT05GSUdfU1RBTkRBTE9ORT15CiMgQ09ORklHX1BSRVZFTlRfRklSTVdBUkVfQlVJTEQg
aXMgbm90IHNldAoKIwojIEZpcm13YXJlIGxvYWRlcgojCkNPTkZJR19GV19MT0FERVI9eQpDT05G
SUdfRldfTE9BREVSX1BBR0VEX0JVRj15CkNPTkZJR19GV19MT0FERVJfU1lTRlM9eQpDT05GSUdf
RVhUUkFfRklSTVdBUkU9IiIKQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUj15CiMgQ09ORklH
X0ZXX0xPQURFUl9VU0VSX0hFTFBFUl9GQUxMQkFDSyBpcyBub3Qgc2V0CkNPTkZJR19GV19MT0FE
RVJfQ09NUFJFU1M9eQojIENPTkZJR19GV19MT0FERVJfQ09NUFJFU1NfWFogaXMgbm90IHNldApD
T05GSUdfRldfTE9BREVSX0NPTVBSRVNTX1pTVEQ9eQojIENPTkZJR19GV19VUExPQUQgaXMgbm90
IHNldAojIGVuZCBvZiBGaXJtd2FyZSBsb2FkZXIKCkNPTkZJR19XQU5UX0RFVl9DT1JFRFVNUD15
CkNPTkZJR19BTExPV19ERVZfQ09SRURVTVA9eQpDT05GSUdfREVWX0NPUkVEVU1QPXkKIyBDT05G
SUdfREVCVUdfRFJJVkVSIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0RFVlJFUz15CkNPTkZJR19E
RUJVR19URVNUX0RSSVZFUl9SRU1PVkU9eQpDT05GSUdfVEVTVF9BU1lOQ19EUklWRVJfUFJPQkU9
bQpDT05GSUdfU1lTX0hZUEVSVklTT1I9eQpDT05GSUdfR0VORVJJQ19DUFVfQVVUT1BST0JFPXkK
Q09ORklHX0dFTkVSSUNfQ1BVX1ZVTE5FUkFCSUxJVElFUz15CkNPTkZJR19SRUdNQVA9eQpDT05G
SUdfUkVHTUFQX0kyQz15CkNPTkZJR19SRUdNQVBfU1BNST1tCkNPTkZJR19SRUdNQVBfTU1JTz1t
CkNPTkZJR19SRUdNQVBfSVJRPXkKQ09ORklHX0RNQV9TSEFSRURfQlVGRkVSPXkKQ09ORklHX0RN
QV9GRU5DRV9UUkFDRT15CiMgZW5kIG9mIEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKCiMKIyBCdXMg
ZGV2aWNlcwojCkNPTkZJR19NSElfQlVTPXkKQ09ORklHX01ISV9CVVNfREVCVUc9eQpDT05GSUdf
TUhJX0JVU19FUD1tCiMgZW5kIG9mIEJ1cyBkZXZpY2VzCgojCiMgRmlybXdhcmUgRHJpdmVycwoj
CgojCiMgQVJNIFN5c3RlbSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFjZSBQcm90b2Nv
bAojCiMgZW5kIG9mIEFSTSBTeXN0ZW0gQ29udHJvbCBhbmQgTWFuYWdlbWVudCBJbnRlcmZhY2Ug
UHJvdG9jb2wKCkNPTkZJR19GSVJNV0FSRV9NRU1NQVA9eQojIENPTkZJR19HT09HTEVfRklSTVdB
UkUgaXMgbm90IHNldAoKIwojIFRlZ3JhIGZpcm13YXJlIGRyaXZlcgojCiMgZW5kIG9mIFRlZ3Jh
IGZpcm13YXJlIGRyaXZlcgojIGVuZCBvZiBGaXJtd2FyZSBEcml2ZXJzCgojIENPTkZJR19HTlNT
IGlzIG5vdCBzZXQKQ09ORklHX01URD1tCkNPTkZJR19NVERfVEVTVFM9bQoKIwojIFBhcnRpdGlv
biBwYXJzZXJzCiMKIyBDT05GSUdfTVREX0FSN19QQVJUUyBpcyBub3Qgc2V0CkNPTkZJR19NVERf
Q01ETElORV9QQVJUUz1tCkNPTkZJR19NVERfT0ZfUEFSVFM9bQpDT05GSUdfTVREX1JFREJPT1Rf
UEFSVFM9bQpDT05GSUdfTVREX1JFREJPT1RfRElSRUNUT1JZX0JMT0NLPS0xCiMgQ09ORklHX01U
RF9SRURCT09UX1BBUlRTX1VOQUxMT0NBVEVEIGlzIG5vdCBzZXQKQ09ORklHX01URF9SRURCT09U
X1BBUlRTX1JFQURPTkxZPXkKIyBlbmQgb2YgUGFydGl0aW9uIHBhcnNlcnMKCiMKIyBVc2VyIE1v
ZHVsZXMgQW5kIFRyYW5zbGF0aW9uIExheWVycwojCkNPTkZJR19NVERfT09QUz1tCiMgQ09ORklH
X01URF9QQVJUSVRJT05FRF9NQVNURVIgaXMgbm90IHNldAoKIwojIFJBTS9ST00vRmxhc2ggY2hp
cCBkcml2ZXJzCiMKQ09ORklHX01URF9DRkk9bQpDT05GSUdfTVREX0pFREVDUFJPQkU9bQpDT05G
SUdfTVREX0dFTl9QUk9CRT1tCkNPTkZJR19NVERfQ0ZJX0FEVl9PUFRJT05TPXkKIyBDT05GSUdf
TVREX0NGSV9OT1NXQVAgaXMgbm90IHNldApDT05GSUdfTVREX0NGSV9CRV9CWVRFX1NXQVA9eQoj
IENPTkZJR19NVERfQ0ZJX0xFX0JZVEVfU1dBUCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9DRklf
R0VPTUVUUlkgaXMgbm90IHNldApDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzE9eQpDT05GSUdf
TVREX01BUF9CQU5LX1dJRFRIXzI9eQpDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzQ9eQpDT05G
SUdfTVREX0NGSV9JMT15CkNPTkZJR19NVERfQ0ZJX0kyPXkKQ09ORklHX01URF9PVFA9eQojIENP
TkZJR19NVERfQ0ZJX0lOVEVMRVhUIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX0NGSV9BTURTVEQg
aXMgbm90IHNldAojIENPTkZJR19NVERfQ0ZJX1NUQUEgaXMgbm90IHNldApDT05GSUdfTVREX0NG
SV9VVElMPW0KIyBDT05GSUdfTVREX1JBTSBpcyBub3Qgc2V0CkNPTkZJR19NVERfUk9NPW0KIyBD
T05GSUdfTVREX0FCU0VOVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFJBTS9ST00vRmxhc2ggY2hpcCBk
cml2ZXJzCgojCiMgTkFORAojCkNPTkZJR19NVERfTkFORF9DT1JFPW0KQ09ORklHX01URF9SQVdf
TkFORD1tCgojCiMgUmF3L3BhcmFsbGVsIE5BTkQgZmxhc2ggY29udHJvbGxlcnMKIwoKIwojIE1p
c2MKIwpDT05GSUdfTVREX05BTkRfTkFORFNJTT1tCgojCiMgRUNDIGVuZ2luZSBzdXBwb3J0CiMK
Q09ORklHX01URF9OQU5EX0VDQz15CkNPTkZJR19NVERfTkFORF9FQ0NfU1dfSEFNTUlORz15CiMg
Q09ORklHX01URF9OQU5EX0VDQ19TV19IQU1NSU5HX1NNQyBpcyBub3Qgc2V0CkNPTkZJR19NVERf
TkFORF9FQ0NfU1dfQkNIPXkKIyBlbmQgb2YgRUNDIGVuZ2luZSBzdXBwb3J0CiMgZW5kIG9mIE5B
TkQKCiMKIyBMUEREUiAmIExQRERSMiBQQ00gbWVtb3J5IGRyaXZlcnMKIwojIENPTkZJR19NVERf
TFBERFIgaXMgbm90IHNldAojIGVuZCBvZiBMUEREUiAmIExQRERSMiBQQ00gbWVtb3J5IGRyaXZl
cnMKCiMgQ09ORklHX01URF9VQkkgaXMgbm90IHNldApDT05GSUdfRFRDPXkKQ09ORklHX09GPXkK
IyBDT05GSUdfT0ZfVU5JVFRFU1QgaXMgbm90IHNldApDT05GSUdfT0ZfRkxBVFRSRUU9eQpDT05G
SUdfT0ZfS09CSj15CkNPTkZJR19PRl9EWU5BTUlDPXkKQ09ORklHX09GX0lSUT15CkNPTkZJR19P
Rl9SRVNPTFZFPXkKQ09ORklHX09GX09WRVJMQVk9eQoKIwojIE5WTUUgU3VwcG9ydAojCiMgZW5k
IG9mIE5WTUUgU3VwcG9ydAoKIwojIE1pc2MgZGV2aWNlcwojCkNPTkZJR19TRU5TT1JTX0xJUzNM
VjAyRD1tCiMgQ09ORklHX0FENTI1WF9EUE9UIGlzIG5vdCBzZXQKIyBDT05GSUdfRFVNTVlfSVJR
IGlzIG5vdCBzZXQKIyBDT05GSUdfSUNTOTMyUzQwMSBpcyBub3Qgc2V0CkNPTkZJR19FTkNMT1NV
UkVfU0VSVklDRVM9bQojIENPTkZJR19BUERTOTgwMkFMUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lT
TDI5MDAzIGlzIG5vdCBzZXQKQ09ORklHX0lTTDI5MDIwPXkKQ09ORklHX1NFTlNPUlNfVFNMMjU1
MD1tCiMgQ09ORklHX1NFTlNPUlNfQkgxNzcwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQVBE
Uzk5MFg9eQpDT05GSUdfSE1DNjM1Mj15CkNPTkZJR19EUzE2ODI9bQpDT05GSUdfQzJQT1JUPW0K
CiMKIyBFRVBST00gc3VwcG9ydAojCiMgQ09ORklHX0VFUFJPTV9BVDI0IGlzIG5vdCBzZXQKQ09O
RklHX0VFUFJPTV9MRUdBQ1k9bQpDT05GSUdfRUVQUk9NX01BWDY4NzU9eQpDT05GSUdfRUVQUk9N
XzkzQ1g2PXkKQ09ORklHX0VFUFJPTV9JRFRfODlIUEVTWD1tCkNPTkZJR19FRVBST01fRUUxMDA0
PXkKIyBlbmQgb2YgRUVQUk9NIHN1cHBvcnQKCiMKIyBUZXhhcyBJbnN0cnVtZW50cyBzaGFyZWQg
dHJhbnNwb3J0IGxpbmUgZGlzY2lwbGluZQojCiMgZW5kIG9mIFRleGFzIEluc3RydW1lbnRzIHNo
YXJlZCB0cmFuc3BvcnQgbGluZSBkaXNjaXBsaW5lCgpDT05GSUdfU0VOU09SU19MSVMzX0kyQz1t
CiMgQ09ORklHX0FMVEVSQV9TVEFQTCBpcyBub3Qgc2V0CiMgQ09ORklHX0VDSE8gaXMgbm90IHNl
dAojIENPTkZJR19VQUNDRSBpcyBub3Qgc2V0CkNPTkZJR19QVlBBTklDPXkKIyBlbmQgb2YgTWlz
YyBkZXZpY2VzCgojCiMgU0NTSSBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19TQ1NJX01PRD15CiMg
ZW5kIG9mIFNDU0kgZGV2aWNlIHN1cHBvcnQKCiMKIyBJbnB1dCBkZXZpY2Ugc3VwcG9ydAojCkNP
TkZJR19JTlBVVD1tCkNPTkZJR19JTlBVVF9MRURTPW0KQ09ORklHX0lOUFVUX0ZGX01FTUxFU1M9
bQpDT05GSUdfSU5QVVRfU1BBUlNFS01BUD1tCkNPTkZJR19JTlBVVF9NQVRSSVhLTUFQPW0KQ09O
RklHX0lOUFVUX1ZJVkFMRElGTUFQPW0KCiMKIyBVc2VybGFuZCBpbnRlcmZhY2VzCiMKQ09ORklH
X0lOUFVUX01PVVNFREVWPW0KQ09ORklHX0lOUFVUX01PVVNFREVWX1BTQVVYPXkKQ09ORklHX0lO
UFVUX01PVVNFREVWX1NDUkVFTl9YPTEwMjQKQ09ORklHX0lOUFVUX01PVVNFREVWX1NDUkVFTl9Z
PTc2OApDT05GSUdfSU5QVVRfSk9ZREVWPW0KQ09ORklHX0lOUFVUX0VWREVWPW0KQ09ORklHX0lO
UFVUX0VWQlVHPW0KCiMKIyBJbnB1dCBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19JTlBVVF9LRVlC
T0FSRD15CiMgQ09ORklHX0tFWUJPQVJEX0FEQyBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9B
RFA1NTg4PW0KQ09ORklHX0tFWUJPQVJEX0FEUDU1ODk9bQpDT05GSUdfS0VZQk9BUkRfQVRLQkQ9
bQojIENPTkZJR19LRVlCT0FSRF9RVDEwNTAgaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfUVQx
MDcwPW0KQ09ORklHX0tFWUJPQVJEX1FUMjE2MD1tCiMgQ09ORklHX0tFWUJPQVJEX0RMSU5LX0RJ
UjY4NSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0xLS0JEIGlzIG5vdCBzZXQKIyBDT05G
SUdfS0VZQk9BUkRfR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9HUElPX1BPTExFRD1t
CiMgQ09ORklHX0tFWUJPQVJEX1RDQTY0MTYgaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfVENB
ODQxOD1tCiMgQ09ORklHX0tFWUJPQVJEX01BVFJJWCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJP
QVJEX0xNODMyMyBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9MTTgzMzM9bQpDT05GSUdfS0VZ
Qk9BUkRfTUFYNzM1OT1tCkNPTkZJR19LRVlCT0FSRF9NQ1M9bQpDT05GSUdfS0VZQk9BUkRfTVBS
MTIxPW0KQ09ORklHX0tFWUJPQVJEX05FV1RPTj1tCiMgQ09ORklHX0tFWUJPQVJEX1NUT1dBV0FZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU1VOS0JEIGlzIG5vdCBzZXQKQ09ORklHX0tF
WUJPQVJEX1RNMl9UT1VDSEtFWT1tCkNPTkZJR19LRVlCT0FSRF9YVEtCRD1tCkNPTkZJR19LRVlC
T0FSRF9DQVAxMVhYPW0KIyBDT05GSUdfS0VZQk9BUkRfQ1lQUkVTU19TRiBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOUFVUX01PVVNFIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX0pPWVNUSUNLPXkKQ09O
RklHX0pPWVNUSUNLX0FOQUxPRz1tCiMgQ09ORklHX0pPWVNUSUNLX0EzRCBpcyBub3Qgc2V0CkNP
TkZJR19KT1lTVElDS19BREM9bQpDT05GSUdfSk9ZU1RJQ0tfQURJPW0KQ09ORklHX0pPWVNUSUNL
X0NPQlJBPW0KQ09ORklHX0pPWVNUSUNLX0dGMks9bQpDT05GSUdfSk9ZU1RJQ0tfR1JJUD1tCkNP
TkZJR19KT1lTVElDS19HUklQX01QPW0KIyBDT05GSUdfSk9ZU1RJQ0tfR1VJTExFTU9UIGlzIG5v
dCBzZXQKQ09ORklHX0pPWVNUSUNLX0lOVEVSQUNUPW0KQ09ORklHX0pPWVNUSUNLX1NJREVXSU5E
RVI9bQpDT05GSUdfSk9ZU1RJQ0tfVE1EQz1tCkNPTkZJR19KT1lTVElDS19JRk9SQ0U9bQojIENP
TkZJR19KT1lTVElDS19JRk9SQ0VfMjMyIGlzIG5vdCBzZXQKQ09ORklHX0pPWVNUSUNLX1dBUlJJ
T1I9bQojIENPTkZJR19KT1lTVElDS19NQUdFTExBTiBpcyBub3Qgc2V0CkNPTkZJR19KT1lTVElD
S19TUEFDRU9SQj1tCiMgQ09ORklHX0pPWVNUSUNLX1NQQUNFQkFMTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0pPWVNUSUNLX1NUSU5HRVIgaXMgbm90IHNldApDT05GSUdfSk9ZU1RJQ0tfVFdJREpPWT1t
CkNPTkZJR19KT1lTVElDS19aSEVOSFVBPW0KQ09ORklHX0pPWVNUSUNLX0FTNTAxMT1tCkNPTkZJ
R19KT1lTVElDS19KT1lEVU1QPW0KQ09ORklHX0pPWVNUSUNLX1FXSUlDPW0KQ09ORklHX0pPWVNU
SUNLX0ZTSUE2Qj1tCkNPTkZJR19JTlBVVF9UQUJMRVQ9eQpDT05GSUdfVEFCTEVUX1NFUklBTF9X
QUNPTTQ9bQojIENPTkZJR19JTlBVVF9UT1VDSFNDUkVFTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lO
UFVUX01JU0MgaXMgbm90IHNldAojIENPTkZJR19STUk0X0NPUkUgaXMgbm90IHNldAoKIwojIEhh
cmR3YXJlIEkvTyBwb3J0cwojCkNPTkZJR19TRVJJTz1tCiMgQ09ORklHX1NFUklPX1NFUlBPUlQg
aXMgbm90IHNldApDT05GSUdfU0VSSU9fTElCUFMyPW0KIyBDT05GSUdfU0VSSU9fUkFXIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VSSU9fUFMyTVVMVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX0dQ
SU9fUFMyIGlzIG5vdCBzZXQKQ09ORklHX1VTRVJJTz1tCkNPTkZJR19HQU1FUE9SVD1tCkNPTkZJ
R19HQU1FUE9SVF9OUzU1OD1tCiMgQ09ORklHX0dBTUVQT1JUX0w0IGlzIG5vdCBzZXQKIyBlbmQg
b2YgSGFyZHdhcmUgSS9PIHBvcnRzCiMgZW5kIG9mIElucHV0IGRldmljZSBzdXBwb3J0CgojCiMg
Q2hhcmFjdGVyIGRldmljZXMKIwpDT05GSUdfVFRZPXkKIyBDT05GSUdfVlQgaXMgbm90IHNldApD
T05GSUdfVU5JWDk4X1BUWVM9eQojIENPTkZJR19MRUdBQ1lfUFRZUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0xESVNDX0FVVE9MT0FEIGlzIG5vdCBzZXQKQ09ORklHX05VTExfVFRZPXkKQ09ORklHX0hW
Q19EUklWRVI9eQpDT05GSUdfUlBNU0dfVFRZPXkKQ09ORklHX1NFUklBTF9ERVZfQlVTPW0KIyBD
T05GSUdfVFRZX1BSSU5USyBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fQ09OU09MRT1tCiMgQ09O
RklHX0hXX1JBTkRPTSBpcyBub3Qgc2V0CkNPTkZJR19ERVZNRU09eQojIENPTkZJR19IQU5HQ0hF
Q0tfVElNRVIgaXMgbm90IHNldAoKIwojIFMvMzkwIGNoYXJhY3RlciBkZXZpY2UgZHJpdmVycwoj
CiMgQ09ORklHX1ROMzI3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ROMzIxNSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NDTFBfVFRZIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NMUF9WVDIyMF9UVFkgaXMgbm90
IHNldApDT05GSUdfSE1DX0RSVj15CiMgQ09ORklHX1NDTFBfT0ZCIGlzIG5vdCBzZXQKQ09ORklH
X1MzOTBfVVZfVUFQST1tCkNPTkZJR19TMzkwX1RBUEU9bQoKIwojIFMvMzkwIHRhcGUgaGFyZHdh
cmUgc3VwcG9ydAojCiMgQ09ORklHX1MzOTBfVEFQRV8zNFhYIGlzIG5vdCBzZXQKQ09ORklHX1Mz
OTBfVEFQRV8zNTkwPW0KIyBDT05GSUdfVk1DUCBpcyBub3Qgc2V0CkNPTkZJR19NT05XUklURVI9
eQpDT05GSUdfUzM5MF9WTVVSPXkKQ09ORklHX1hJTExZQlVTX0NMQVNTPW0KQ09ORklHX1hJTExZ
QlVTPW0KIyBDT05GSUdfWElMTFlCVVNfT0YgaXMgbm90IHNldAojIENPTkZJR19SQU5ET01fVFJV
U1RfQ1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFORE9NX1RSVVNUX0JPT1RMT0FERVIgaXMgbm90
IHNldAojIGVuZCBvZiBDaGFyYWN0ZXIgZGV2aWNlcwoKIwojIEkyQyBzdXBwb3J0CiMKQ09ORklH
X0kyQz15CkNPTkZJR19JMkNfQk9BUkRJTkZPPXkKIyBDT05GSUdfSTJDX0NPTVBBVCBpcyBub3Qg
c2V0CkNPTkZJR19JMkNfQ0hBUkRFVj1tCkNPTkZJR19JMkNfTVVYPXkKCiMKIyBNdWx0aXBsZXhl
ciBJMkMgQ2hpcCBzdXBwb3J0CiMKIyBDT05GSUdfSTJDX0FSQl9HUElPX0NIQUxMRU5HRSBpcyBu
b3Qgc2V0CkNPTkZJR19JMkNfTVVYX0dQSU89bQojIENPTkZJR19JMkNfTVVYX0dQTVVYIGlzIG5v
dCBzZXQKQ09ORklHX0kyQ19NVVhfTFRDNDMwNj15CiMgQ09ORklHX0kyQ19NVVhfUENBOTU0MSBp
cyBub3Qgc2V0CiMgQ09ORklHX0kyQ19NVVhfUENBOTU0eCBpcyBub3Qgc2V0CkNPTkZJR19JMkNf
TVVYX01MWENQTEQ9bQojIGVuZCBvZiBNdWx0aXBsZXhlciBJMkMgQ2hpcCBzdXBwb3J0CgojIENP
TkZJR19JMkNfSEVMUEVSX0FVVE8gaXMgbm90IHNldApDT05GSUdfSTJDX1NNQlVTPXkKCiMKIyBJ
MkMgQWxnb3JpdGhtcwojCkNPTkZJR19JMkNfQUxHT0JJVD1tCiMgQ09ORklHX0kyQ19BTEdPUENG
IGlzIG5vdCBzZXQKQ09ORklHX0kyQ19BTEdPUENBPXkKIyBlbmQgb2YgSTJDIEFsZ29yaXRobXMK
CkNPTkZJR19JMkNfU1RVQj1tCiMgQ09ORklHX0kyQ19TTEFWRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0kyQ19ERUJVR19DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFQlVHX0FMR08gaXMgbm90
IHNldAojIGVuZCBvZiBJMkMgc3VwcG9ydAoKIyBDT05GSUdfSTNDIGlzIG5vdCBzZXQKQ09ORklH
X1NQTUk9eQpDT05GSUdfSFNJPW0KQ09ORklHX0hTSV9CT0FSRElORk89eQoKIwojIEhTSSBjb250
cm9sbGVycwojCgojCiMgSFNJIGNsaWVudHMKIwpDT05GSUdfSFNJX0NIQVI9bQpDT05GSUdfUFBT
PW0KQ09ORklHX1BQU19ERUJVRz15CgojCiMgUFBTIGNsaWVudHMgc3VwcG9ydAojCkNPTkZJR19Q
UFNfQ0xJRU5UX0tUSU1FUj1tCkNPTkZJR19QUFNfQ0xJRU5UX0xESVNDPW0KQ09ORklHX1BQU19D
TElFTlRfR1BJTz1tCgojCiMgUFBTIGdlbmVyYXRvcnMgc3VwcG9ydAojCgojCiMgUFRQIGNsb2Nr
IHN1cHBvcnQKIwpDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfT1BUSU9OQUw9eQoKIwojIEVuYWJsZSBQ
SFlMSUIgYW5kIE5FVFdPUktfUEhZX1RJTUVTVEFNUElORyB0byBzZWUgdGhlIGFkZGl0aW9uYWwg
Y2xvY2tzLgojCiMgZW5kIG9mIFBUUCBjbG9jayBzdXBwb3J0CgojIENPTkZJR19QSU5DVFJMIGlz
IG5vdCBzZXQKQ09ORklHX0dQSU9MSUI9eQpDT05GSUdfR1BJT0xJQl9GQVNUUEFUSF9MSU1JVD01
MTIKQ09ORklHX0dQSU9MSUJfSVJRQ0hJUD15CkNPTkZJR19ERUJVR19HUElPPXkKIyBDT05GSUdf
R1BJT19TWVNGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQ0RFViBpcyBub3Qgc2V0CkNPTkZJ
R19HUElPX01BWDczMFg9bQoKIwojIEkyQyBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9f
QURQNTU4OCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX01BWDczMDA9bQpDT05GSUdfR1BJT19NQVg3
MzJYPW0KQ09ORklHX0dQSU9fUENBOTUzWD1tCiMgQ09ORklHX0dQSU9fUENBOTUzWF9JUlEgaXMg
bm90IHNldAojIENPTkZJR19HUElPX1BDQTk1NzAgaXMgbm90IHNldApDT05GSUdfR1BJT19QQ0Y4
NTdYPXkKQ09ORklHX0dQSU9fVFBJQzI4MTA9eQojIGVuZCBvZiBJMkMgR1BJTyBleHBhbmRlcnMK
CiMKIyBNRkQgR1BJTyBleHBhbmRlcnMKIwojIGVuZCBvZiBNRkQgR1BJTyBleHBhbmRlcnMKCiMK
IyBWaXJ0dWFsIEdQSU8gZHJpdmVycwojCiMgQ09ORklHX0dQSU9fQUdHUkVHQVRPUiBpcyBub3Qg
c2V0CkNPTkZJR19HUElPX01PQ0tVUD1tCkNPTkZJR19HUElPX1ZJUlRJTz15CiMgQ09ORklHX0dQ
SU9fU0lNIGlzIG5vdCBzZXQKIyBlbmQgb2YgVmlydHVhbCBHUElPIGRyaXZlcnMKCiMgQ09ORklH
X1BPV0VSX1JFU0VUIGlzIG5vdCBzZXQKQ09ORklHX1BPV0VSX1NVUFBMWT15CkNPTkZJR19QT1dF
Ul9TVVBQTFlfREVCVUc9eQpDT05GSUdfR0VORVJJQ19BRENfQkFUVEVSWT1tCkNPTkZJR19JUDVY
WFhfUE9XRVI9eQpDT05GSUdfVEVTVF9QT1dFUj15CkNPTkZJR19DSEFSR0VSX0FEUDUwNjE9bQpD
T05GSUdfQkFUVEVSWV9DVzIwMTU9eQpDT05GSUdfQkFUVEVSWV9EUzI3ODI9eQpDT05GSUdfQkFU
VEVSWV9TQU1TVU5HX1NEST15CiMgQ09ORklHX0JBVFRFUllfU0JTIGlzIG5vdCBzZXQKQ09ORklH
X0NIQVJHRVJfU0JTPXkKQ09ORklHX01BTkFHRVJfU0JTPXkKQ09ORklHX0JBVFRFUllfQlEyN1hY
WD1tCiMgQ09ORklHX0JBVFRFUllfQlEyN1hYWF9JMkMgaXMgbm90IHNldApDT05GSUdfQkFUVEVS
WV9NQVgxNzA0MD15CkNPTkZJR19CQVRURVJZX01BWDE3MDQyPW0KQ09ORklHX0NIQVJHRVJfTUFY
ODkwMz15CkNPTkZJR19DSEFSR0VSX0xQODcyNz15CiMgQ09ORklHX0NIQVJHRVJfR1BJTyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfTFQzNjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdF
Ul9MVEM0MTYyTCBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX0RFVEVDVE9SX01BWDE0NjU2PXkK
Q09ORklHX0NIQVJHRVJfTUFYNzc5NzY9eQpDT05GSUdfQ0hBUkdFUl9CUTI0MTVYPW0KQ09ORklH
X0NIQVJHRVJfQlEyNDE5MD15CkNPTkZJR19DSEFSR0VSX0JRMjQyNTc9bQpDT05GSUdfQ0hBUkdF
Ul9CUTI0NzM1PXkKQ09ORklHX0NIQVJHRVJfQlEyNTE1WD1tCkNPTkZJR19DSEFSR0VSX0JRMjU4
OTA9bQojIENPTkZJR19DSEFSR0VSX0JRMjU5ODAgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9C
UTI1NlhYPXkKIyBDT05GSUdfQkFUVEVSWV9HQVVHRV9MVEMyOTQxIGlzIG5vdCBzZXQKQ09ORklH
X0JBVFRFUllfUlQ1MDMzPW0KIyBDT05GSUdfQ0hBUkdFUl9SVDk0NTUgaXMgbm90IHNldAojIENP
TkZJR19DSEFSR0VSX0JEOTk5NTQgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX1VHMzEwNSBp
cyBub3Qgc2V0CkNPTkZJR19USEVSTUFMPXkKIyBDT05GSUdfVEhFUk1BTF9TVEFUSVNUSUNTIGlz
IG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfRU1FUkdFTkNZX1BPV0VST0ZGX0RFTEFZX01TPTAKQ09O
RklHX1RIRVJNQUxfT0Y9eQojIENPTkZJR19USEVSTUFMX1dSSVRBQkxFX1RSSVBTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9TVEVQX1dJU0UgaXMgbm90IHNldApDT05G
SUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9GQUlSX1NIQVJFPXkKIyBDT05GSUdfVEhFUk1BTF9ERUZB
VUxUX0dPVl9VU0VSX1NQQUNFIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfR09WX0ZBSVJfU0hB
UkU9eQpDT05GSUdfVEhFUk1BTF9HT1ZfU1RFUF9XSVNFPXkKIyBDT05GSUdfVEhFUk1BTF9HT1Zf
QkFOR19CQU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhFUk1BTF9HT1ZfVVNFUl9TUEFDRSBpcyBu
b3Qgc2V0CkNPTkZJR19DUFVfVEhFUk1BTD15CiMgQ09ORklHX1RIRVJNQUxfRU1VTEFUSU9OIGlz
IG5vdCBzZXQKQ09ORklHX0dFTkVSSUNfQURDX1RIRVJNQUw9bQojIENPTkZJR19XQVRDSERPRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUiBpcyBub3Qgc2V0CkNPTkZJR19SQ19DT1JFPW0K
IyBDT05GSUdfTElSQyBpcyBub3Qgc2V0CkNPTkZJR19SQ19NQVA9bQpDT05GSUdfUkNfREVDT0RF
UlM9eQojIENPTkZJR19JUl9JTU9OX0RFQ09ERVIgaXMgbm90IHNldApDT05GSUdfSVJfSlZDX0RF
Q09ERVI9bQpDT05GSUdfSVJfTUNFX0tCRF9ERUNPREVSPW0KQ09ORklHX0lSX05FQ19ERUNPREVS
PW0KIyBDT05GSUdfSVJfUkM1X0RFQ09ERVIgaXMgbm90IHNldAojIENPTkZJR19JUl9SQzZfREVD
T0RFUiBpcyBub3Qgc2V0CkNPTkZJR19JUl9SQ01NX0RFQ09ERVI9bQojIENPTkZJR19JUl9TQU5Z
T19ERUNPREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfU0hBUlBfREVDT0RFUiBpcyBub3Qgc2V0
CkNPTkZJR19JUl9TT05ZX0RFQ09ERVI9bQpDT05GSUdfSVJfWE1QX0RFQ09ERVI9bQojIENPTkZJ
R19SQ19ERVZJQ0VTIGlzIG5vdCBzZXQKQ09ORklHX0NFQ19DT1JFPXkKQ09ORklHX0NFQ19OT1RJ
RklFUj15CkNPTkZJR19DRUNfUElOPXkKCiMKIyBDRUMgc3VwcG9ydAojCiMgQ09ORklHX0NFQ19Q
SU5fRVJST1JfSU5KIGlzIG5vdCBzZXQKQ09ORklHX01FRElBX0NFQ19TVVBQT1JUPXkKQ09ORklH
X0NFQ19DSDczMjI9eQpDT05GSUdfQ0VDX0dQSU89eQojIGVuZCBvZiBDRUMgc3VwcG9ydAoKIwoj
IEdyYXBoaWNzIHN1cHBvcnQKIwojIGVuZCBvZiBHcmFwaGljcyBzdXBwb3J0CgojCiMgSElEIHN1
cHBvcnQKIwpDT05GSUdfSElEPW0KQ09ORklHX0hJRF9CQVRURVJZX1NUUkVOR1RIPXkKIyBDT05G
SUdfSElEUkFXIGlzIG5vdCBzZXQKQ09ORklHX1VISUQ9bQpDT05GSUdfSElEX0dFTkVSSUM9bQoK
IwojIFNwZWNpYWwgSElEIGRyaXZlcnMKIwpDT05GSUdfSElEX0E0VEVDSD1tCkNPTkZJR19ISURf
QUNSVVg9bQpDT05GSUdfSElEX0FDUlVYX0ZGPXkKQ09ORklHX0hJRF9BUFBMRT1tCkNPTkZJR19I
SURfQVVSRUFMPW0KQ09ORklHX0hJRF9CRUxLSU49bQpDT05GSUdfSElEX0NIRVJSWT1tCkNPTkZJ
R19ISURfQ09VR0FSPW0KIyBDT05GSUdfSElEX01BQ0FMTFkgaXMgbm90IHNldApDT05GSUdfSElE
X0NNRURJQT1tCiMgQ09ORklHX0hJRF9DWVBSRVNTIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9EUkFH
T05SSVNFPW0KQ09ORklHX0RSQUdPTlJJU0VfRkY9eQojIENPTkZJR19ISURfRU1TX0ZGIGlzIG5v
dCBzZXQKQ09ORklHX0hJRF9FTEVDT009bQojIENPTkZJR19ISURfRVpLRVkgaXMgbm90IHNldAoj
IENPTkZJR19ISURfR0VNQklSRCBpcyBub3Qgc2V0CkNPTkZJR19ISURfR0ZSTT1tCkNPTkZJR19I
SURfR0xPUklPVVM9bQpDT05GSUdfSElEX1ZJVkFMRElfQ09NTU9OPW0KQ09ORklHX0hJRF9WSVZB
TERJPW0KQ09ORklHX0hJRF9LRVlUT1VDSD1tCkNPTkZJR19ISURfS1lFPW0KQ09ORklHX0hJRF9X
QUxUT1A9bQpDT05GSUdfSElEX1ZJRVdTT05JQz1tCiMgQ09ORklHX0hJRF9YSUFPTUkgaXMgbm90
IHNldApDT05GSUdfSElEX0dZUkFUSU9OPW0KIyBDT05GSUdfSElEX0lDQURFIGlzIG5vdCBzZXQK
Q09ORklHX0hJRF9JVEU9bQpDT05GSUdfSElEX0pBQlJBPW0KQ09ORklHX0hJRF9UV0lOSEFOPW0K
Q09ORklHX0hJRF9LRU5TSU5HVE9OPW0KQ09ORklHX0hJRF9MQ1BPV0VSPW0KQ09ORklHX0hJRF9M
RUQ9bQpDT05GSUdfSElEX0xFTk9WTz1tCkNPTkZJR19ISURfTUFHSUNNT1VTRT1tCkNPTkZJR19I
SURfTUFMVFJPTj1tCiMgQ09ORklHX0hJRF9NQVlGTEFTSCBpcyBub3Qgc2V0CkNPTkZJR19ISURf
UkVEUkFHT049bQpDT05GSUdfSElEX01JQ1JPU09GVD1tCkNPTkZJR19ISURfTU9OVEVSRVk9bQpD
T05GSUdfSElEX01VTFRJVE9VQ0g9bQpDT05GSUdfSElEX05JTlRFTkRPPW0KQ09ORklHX05JTlRF
TkRPX0ZGPXkKIyBDT05GSUdfSElEX05USSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9PUlRFSyBp
cyBub3Qgc2V0CkNPTkZJR19ISURfUEFOVEhFUkxPUkQ9bQojIENPTkZJR19QQU5USEVSTE9SRF9G
RiBpcyBub3Qgc2V0CkNPTkZJR19ISURfUEVUQUxZTlg9bQojIENPTkZJR19ISURfUElDT0xDRCBp
cyBub3Qgc2V0CkNPTkZJR19ISURfUExBTlRST05JQ1M9bQpDT05GSUdfSElEX1BMQVlTVEFUSU9O
PW0KIyBDT05GSUdfUExBWVNUQVRJT05fRkYgaXMgbm90IHNldApDT05GSUdfSElEX1JBWkVSPW0K
Q09ORklHX0hJRF9QUklNQVg9bQpDT05GSUdfSElEX1NBSVRFSz1tCkNPTkZJR19ISURfU0VNSVRF
Sz1tCkNPTkZJR19ISURfU1BFRURMSU5LPW0KIyBDT05GSUdfSElEX1NURUFNIGlzIG5vdCBzZXQK
Q09ORklHX0hJRF9TVEVFTFNFUklFUz1tCkNPTkZJR19ISURfU1VOUExVUz1tCiMgQ09ORklHX0hJ
RF9STUkgaXMgbm90IHNldApDT05GSUdfSElEX0dSRUVOQVNJQT1tCkNPTkZJR19HUkVFTkFTSUFf
RkY9eQpDT05GSUdfSElEX1NNQVJUSk9ZUExVUz1tCkNPTkZJR19TTUFSVEpPWVBMVVNfRkY9eQpD
T05GSUdfSElEX1RJVk89bQpDT05GSUdfSElEX1RPUFNFRUQ9bQpDT05GSUdfSElEX1RISU5HTT1t
CkNPTkZJR19ISURfVURSQVdfUFMzPW0KIyBDT05GSUdfSElEX1dJSU1PVEUgaXMgbm90IHNldAoj
IENPTkZJR19ISURfWElOTU8gaXMgbm90IHNldApDT05GSUdfSElEX1pFUk9QTFVTPW0KQ09ORklH
X1pFUk9QTFVTX0ZGPXkKIyBDT05GSUdfSElEX1pZREFDUk9OIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9BTFBTPW0KIyBlbmQgb2YgU3BlY2lhbCBISUQgZHJpdmVycwoKIwojIEkyQyBISUQgc3VwcG9y
dAojCkNPTkZJR19JMkNfSElEX09GPW0KQ09ORklHX0kyQ19ISURfT0ZfR09PRElYPW0KIyBlbmQg
b2YgSTJDIEhJRCBzdXBwb3J0CgpDT05GSUdfSTJDX0hJRF9DT1JFPW0KIyBlbmQgb2YgSElEIHN1
cHBvcnQKCkNPTkZJR19VU0JfT0hDSV9MSVRUTEVfRU5ESUFOPXkKQ09ORklHX01FTVNUSUNLPW0K
IyBDT05GSUdfTUVNU1RJQ0tfREVCVUcgaXMgbm90IHNldAoKIwojIE1lbW9yeVN0aWNrIGRyaXZl
cnMKIwpDT05GSUdfTUVNU1RJQ0tfVU5TQUZFX1JFU1VNRT15CgojCiMgTWVtb3J5U3RpY2sgSG9z
dCBDb250cm9sbGVyIERyaXZlcnMKIwpDT05GSUdfTkVXX0xFRFM9eQpDT05GSUdfTEVEU19DTEFT
Uz15CkNPTkZJR19MRURTX0NMQVNTX0ZMQVNIPW0KQ09ORklHX0xFRFNfQ0xBU1NfTVVMVElDT0xP
Uj15CkNPTkZJR19MRURTX0JSSUdIVE5FU1NfSFdfQ0hBTkdFRD15CgojCiMgTEVEIGRyaXZlcnMK
IwojIENPTkZJR19MRURTX0FOMzAyNTlBIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfQVcyMDEzPW0K
IyBDT05GSUdfTEVEU19MTTM1MzAgaXMgbm90IHNldApDT05GSUdfTEVEU19MTTM1MzI9eQpDT05G
SUdfTEVEU19MTTM2NDI9bQpDT05GSUdfTEVEU19MTTM2OTJYPXkKQ09ORklHX0xFRFNfUENBOTUz
Mj1tCiMgQ09ORklHX0xFRFNfUENBOTUzMl9HUElPIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfR1BJ
Tz1tCkNPTkZJR19MRURTX0xQMzk0ND15CiMgQ09ORklHX0xFRFNfTFAzOTUyIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19MUDUwWFggaXMgbm90IHNldApDT05GSUdfTEVEU19MUDU1WFhfQ09NTU9O
PW0KQ09ORklHX0xFRFNfTFA1NTIxPW0KQ09ORklHX0xFRFNfTFA1NTIzPW0KQ09ORklHX0xFRFNf
TFA1NTYyPW0KQ09ORklHX0xFRFNfTFA4NTAxPW0KQ09ORklHX0xFRFNfTFA4ODYwPXkKQ09ORklH
X0xFRFNfUENBOTU1WD15CkNPTkZJR19MRURTX1BDQTk1NVhfR1BJTz15CiMgQ09ORklHX0xFRFNf
UENBOTYzWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUFdNIGlzIG5vdCBzZXQKQ09ORklHX0xF
RFNfQkQyODAyPXkKQ09ORklHX0xFRFNfTFQzNTkzPW0KIyBDT05GSUdfTEVEU19UQ0E2NTA3IGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19UTEM1OTFYWCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xN
MzU1eD1tCkNPTkZJR19MRURTX0lTMzFGTDMxOVg9eQojIENPTkZJR19MRURTX0lTMzFGTDMyWFgg
aXMgbm90IHNldAoKIwojIExFRCBkcml2ZXIgZm9yIGJsaW5rKDEpIFVTQiBSR0IgTEVEIGlzIHVu
ZGVyIFNwZWNpYWwgSElEIGRyaXZlcnMgKEhJRF9USElOR00pCiMKQ09ORklHX0xFRFNfQkxJTktN
PW0KQ09ORklHX0xFRFNfTUxYUkVHPW0KIyBDT05GSUdfTEVEU19VU0VSIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEVEU19USV9MTVVfQ09NTU9OIGlzIG5vdCBzZXQKCiMKIyBGbGFzaCBhbmQgVG9yY2gg
TEVEIGRyaXZlcnMKIwpDT05GSUdfTEVEU19BUzM2NDVBPW0KQ09ORklHX0xFRFNfS1REMjY5Mj1t
CkNPTkZJR19MRURTX0xNMzYwMVg9bQpDT05GSUdfTEVEU19SVDQ1MDU9bQojIENPTkZJR19MRURT
X1JUODUxNSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1NHTTMxNDA9bQoKIwojIFJHQiBMRUQgZHJp
dmVycwojCkNPTkZJR19MRURTX1BXTV9NVUxUSUNPTE9SPXkKQ09ORklHX0xFRFNfUUNPTV9MUEc9
eQoKIwojIExFRCBUcmlnZ2VycwojCiMgQ09ORklHX0xFRFNfVFJJR0dFUlMgaXMgbm90IHNldAoK
IwojIFNpbXBsZSBMRUQgZHJpdmVycwojCiMgQ09ORklHX0FDQ0VTU0lCSUxJVFkgaXMgbm90IHNl
dApDT05GSUdfRE1BREVWSUNFUz15CiMgQ09ORklHX0RNQURFVklDRVNfREVCVUcgaXMgbm90IHNl
dAoKIwojIERNQSBEZXZpY2VzCiMKQ09ORklHX0RNQV9FTkdJTkU9eQpDT05GSUdfRE1BX1ZJUlRV
QUxfQ0hBTk5FTFM9eQpDT05GSUdfRE1BX09GPXkKQ09ORklHX0ZTTF9FRE1BPXkKIyBDT05GSUdf
SU5URUxfSURNQTY0IGlzIG5vdCBzZXQKQ09ORklHX1FDT01fSElETUE9eQoKIwojIERNQSBDbGll
bnRzCiMKQ09ORklHX0FTWU5DX1RYX0RNQT15CkNPTkZJR19ETUFURVNUPW0KQ09ORklHX0RNQV9F
TkdJTkVfUkFJRD15CgojCiMgRE1BQlVGIG9wdGlvbnMKIwojIENPTkZJR19TWU5DX0ZJTEUgaXMg
bm90IHNldAojIENPTkZJR19VRE1BQlVGIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BQlVGX01PVkVf
Tk9USUZZIGlzIG5vdCBzZXQKQ09ORklHX0RNQUJVRl9ERUJVRz15CkNPTkZJR19ETUFCVUZfU0VM
RlRFU1RTPW0KQ09ORklHX0RNQUJVRl9IRUFQUz15CkNPTkZJR19ETUFCVUZfU1lTRlNfU1RBVFM9
eQojIENPTkZJR19ETUFCVUZfSEVBUFNfU1lTVEVNIGlzIG5vdCBzZXQKIyBlbmQgb2YgRE1BQlVG
IG9wdGlvbnMKCiMgQ09ORklHX0FVWERJU1BMQVkgaXMgbm90IHNldApDT05GSUdfVUlPPW0KIyBD
T05GSUdfVUlPX1BEUlZfR0VOSVJRIGlzIG5vdCBzZXQKIyBDT05GSUdfVUlPX0RNRU1fR0VOSVJR
IGlzIG5vdCBzZXQKQ09ORklHX1ZGSU89bQpDT05GSUdfVkZJT19JT01NVV9UWVBFMT1tCkNPTkZJ
R19WRklPX05PSU9NTVU9eQojIENPTkZJR19WRklPX01ERVYgaXMgbm90IHNldAojIENPTkZJR19W
SVJUX0RSSVZFUlMgaXMgbm90IHNldApDT05GSUdfVklSVElPPXkKQ09ORklHX1ZJUlRJT19NRU5V
PXkKIyBDT05GSUdfVklSVElPX0hBUkRFTl9OT1RJRklDQVRJT04gaXMgbm90IHNldApDT05GSUdf
VklSVElPX0JBTExPT049bQpDT05GSUdfVklSVElPX0lOUFVUPW0KQ09ORklHX1ZIT1NUX01FTlU9
eQojIENPTkZJR19WSE9TVF9DUk9TU19FTkRJQU5fTEVHQUNZIGlzIG5vdCBzZXQKCiMKIyBNaWNy
b3NvZnQgSHlwZXItViBndWVzdCBzdXBwb3J0CiMKIyBlbmQgb2YgTWljcm9zb2Z0IEh5cGVyLVYg
Z3Vlc3Qgc3VwcG9ydAoKQ09ORklHX0dSRVlCVVM9bQojIENPTkZJR19DT01FREkgaXMgbm90IHNl
dAojIENPTkZJR19TVEFHSU5HIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQ0xLPXkKQ09ORklHX0hB
VkVfQ0xLX1BSRVBBUkU9eQpDT05GSUdfQ09NTU9OX0NMSz15CkNPTkZJR19DT01NT05fQ0xLX01B
WDk0ODU9eQpDT05GSUdfQ09NTU9OX0NMS19TSTUzNDE9bQpDT05GSUdfQ09NTU9OX0NMS19TSTUz
NTE9bQpDT05GSUdfQ09NTU9OX0NMS19TSTUxND15CkNPTkZJR19DT01NT05fQ0xLX1NJNTQ0PW0K
Q09ORklHX0NPTU1PTl9DTEtfU0k1NzA9bQpDT05GSUdfQ09NTU9OX0NMS19DRENFNzA2PW0KIyBD
T05GSUdfQ09NTU9OX0NMS19DRENFOTI1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19D
UzIwMDBfQ1AgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19QV009eQpDT05GSUdfQ09NTU9O
X0NMS19SUzlfUENJRT15CkNPTkZJR19DT01NT05fQ0xLX1ZDNT15CiMgQ09ORklHX0NPTU1PTl9D
TEtfRklYRURfTU1JTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hXU1BJTkxPQ0sgaXMgbm90IHNldAoK
IwojIENsb2NrIFNvdXJjZSBkcml2ZXJzCiMKIyBDT05GSUdfTUlDUk9DSElQX1BJVDY0QiBpcyBu
b3Qgc2V0CiMgZW5kIG9mIENsb2NrIFNvdXJjZSBkcml2ZXJzCgojIENPTkZJR19NQUlMQk9YIGlz
IG5vdCBzZXQKQ09ORklHX0lPTU1VX0FQST15CiMgQ09ORklHX0lPTU1VX1NVUFBPUlQgaXMgbm90
IHNldAoKIwojIFJlbW90ZXByb2MgZHJpdmVycwojCkNPTkZJR19SRU1PVEVQUk9DPXkKQ09ORklH
X1JFTU9URVBST0NfQ0RFVj15CiMgZW5kIG9mIFJlbW90ZXByb2MgZHJpdmVycwoKIwojIFJwbXNn
IGRyaXZlcnMKIwpDT05GSUdfUlBNU0c9eQojIENPTkZJR19SUE1TR19DVFJMIGlzIG5vdCBzZXQK
Q09ORklHX1JQTVNHX05TPXkKQ09ORklHX1JQTVNHX1ZJUlRJTz15CiMgZW5kIG9mIFJwbXNnIGRy
aXZlcnMKCkNPTkZJR19TT1VORFdJUkU9eQoKIwojIFNvdW5kV2lyZSBEZXZpY2VzCiMKCiMKIyBT
T0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxvZ2ljIFNvQyBk
cml2ZXJzCiMKIyBlbmQgb2YgQW1sb2dpYyBTb0MgZHJpdmVycwoKIwojIEJyb2FkY29tIFNvQyBk
cml2ZXJzCiMKIyBlbmQgb2YgQnJvYWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAvRnJlZXNjYWxl
IFFvcklRIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgTlhQL0ZyZWVzY2FsZSBRb3JJUSBTb0MgZHJp
dmVycwoKIwojIGkuTVggU29DIGRyaXZlcnMKIwojIGVuZCBvZiBpLk1YIFNvQyBkcml2ZXJzCgoj
CiMgRW5hYmxlIExpdGVYIFNvQyBCdWlsZGVyIHNwZWNpZmljIGRyaXZlcnMKIwojIGVuZCBvZiBF
bmFibGUgTGl0ZVggU29DIEJ1aWxkZXIgc3BlY2lmaWMgZHJpdmVycwoKIwojIFF1YWxjb21tIFNv
QyBkcml2ZXJzCiMKIyBlbmQgb2YgUXVhbGNvbW0gU29DIGRyaXZlcnMKCkNPTkZJR19TT0NfVEk9
eQoKIwojIFhpbGlueCBTb0MgZHJpdmVycwojCiMgZW5kIG9mIFhpbGlueCBTb0MgZHJpdmVycwoj
IGVuZCBvZiBTT0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCgojIENPTkZJR19Q
TV9ERVZGUkVRIGlzIG5vdCBzZXQKQ09ORklHX0VYVENPTj15CgojCiMgRXh0Y29uIERldmljZSBE
cml2ZXJzCiMKQ09ORklHX0VYVENPTl9BRENfSkFDSz1tCkNPTkZJR19FWFRDT05fRlNBOTQ4MD1t
CiMgQ09ORklHX0VYVENPTl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09OX01BWDMzNTUg
aXMgbm90IHNldApDT05GSUdfRVhUQ09OX1BUTjUxNTA9eQpDT05GSUdfRVhUQ09OX1JUODk3M0E9
eQpDT05GSUdfRVhUQ09OX1NNNTUwMj1tCkNPTkZJR19FWFRDT05fVVNCX0dQSU89bQpDT05GSUdf
RVhUQ09OX1VTQkNfVFVTQjMyMD1tCkNPTkZJR19NRU1PUlk9eQpDT05GSUdfSUlPPW0KQ09ORklH
X0lJT19CVUZGRVI9eQpDT05GSUdfSUlPX0JVRkZFUl9DQj1tCkNPTkZJR19JSU9fQlVGRkVSX0RN
QT1tCiMgQ09ORklHX0lJT19CVUZGRVJfRE1BRU5HSU5FIGlzIG5vdCBzZXQKQ09ORklHX0lJT19C
VUZGRVJfSFdfQ09OU1VNRVI9bQpDT05GSUdfSUlPX0tGSUZPX0JVRj1tCkNPTkZJR19JSU9fVFJJ
R0dFUkVEX0JVRkZFUj1tCkNPTkZJR19JSU9fQ09ORklHRlM9bQpDT05GSUdfSUlPX1RSSUdHRVI9
eQpDT05GSUdfSUlPX0NPTlNVTUVSU19QRVJfVFJJR0dFUj0yCkNPTkZJR19JSU9fU1dfREVWSUNF
PW0KIyBDT05GSUdfSUlPX1NXX1RSSUdHRVIgaXMgbm90IHNldApDT05GSUdfSUlPX1RSSUdHRVJF
RF9FVkVOVD1tCgojCiMgQWNjZWxlcm9tZXRlcnMKIwojIENPTkZJR19BRFhMMzEzX0kyQyBpcyBu
b3Qgc2V0CkNPTkZJR19BRFhMMzQ1PW0KQ09ORklHX0FEWEwzNDVfSTJDPW0KIyBDT05GSUdfQURY
TDM1NV9JMkMgaXMgbm90IHNldApDT05GSUdfQURYTDM2Nz1tCkNPTkZJR19BRFhMMzY3X0kyQz1t
CkNPTkZJR19BRFhMMzcyPW0KQ09ORklHX0FEWEwzNzJfSTJDPW0KIyBDT05GSUdfQk1BMTgwIGlz
IG5vdCBzZXQKIyBDT05GSUdfQk1BNDAwIGlzIG5vdCBzZXQKQ09ORklHX0JNQzE1MF9BQ0NFTD1t
CkNPTkZJR19CTUMxNTBfQUNDRUxfSTJDPW0KIyBDT05GSUdfREEyODAgaXMgbm90IHNldApDT05G
SUdfREEzMTE9bQpDT05GSUdfRE1BUkQwNj1tCkNPTkZJR19ETUFSRDA5PW0KQ09ORklHX0RNQVJE
MTA9bQpDT05GSUdfRlhMUzg5NjJBRj1tCkNPTkZJR19GWExTODk2MkFGX0kyQz1tCkNPTkZJR19J
SU9fU1RfQUNDRUxfM0FYSVM9bQojIENPTkZJR19JSU9fU1RfQUNDRUxfSTJDXzNBWElTIGlzIG5v
dCBzZXQKIyBDT05GSUdfS1hTRDkgaXMgbm90IHNldApDT05GSUdfS1hDSksxMDEzPW0KIyBDT05G
SUdfTUMzMjMwIGlzIG5vdCBzZXQKQ09ORklHX01NQTc0NTU9bQpDT05GSUdfTU1BNzQ1NV9JMkM9
bQojIENPTkZJR19NTUE3NjYwIGlzIG5vdCBzZXQKQ09ORklHX01NQTg0NTI9bQpDT05GSUdfTU1B
OTU1MV9DT1JFPW0KQ09ORklHX01NQTk1NTE9bQpDT05GSUdfTU1BOTU1Mz1tCkNPTkZJR19NWEM0
MDA1PW0KQ09ORklHX01YQzYyNTU9bQojIENPTkZJR19TVEs4MzEyIGlzIG5vdCBzZXQKQ09ORklH
X1NUSzhCQTUwPW0KIyBlbmQgb2YgQWNjZWxlcm9tZXRlcnMKCiMKIyBBbmFsb2cgdG8gZGlnaXRh
bCBjb252ZXJ0ZXJzCiMKIyBDT05GSUdfQUQ3MDkxUjUgaXMgbm90IHNldApDT05GSUdfQUQ3Mjkx
PW0KQ09ORklHX0FENzk5WD1tCkNPTkZJR19FTlZFTE9QRV9ERVRFQ1RPUj1tCkNPTkZJR19IWDcx
MT1tCkNPTkZJR19JTkEyWFhfQURDPW0KQ09ORklHX0xUQzI0NzE9bQpDT05GSUdfTFRDMjQ4NT1t
CkNPTkZJR19MVEMyNDk3PW0KIyBDT05GSUdfTUFYMTM2MyBpcyBub3Qgc2V0CiMgQ09ORklHX01B
WDk2MTEgaXMgbm90IHNldAojIENPTkZJR19NQ1AzNDIyIGlzIG5vdCBzZXQKQ09ORklHX05BVTc4
MDI9bQpDT05GSUdfUUNPTV9WQURDX0NPTU1PTj1tCkNPTkZJR19RQ09NX1NQTUlfSUFEQz1tCkNP
TkZJR19RQ09NX1NQTUlfVkFEQz1tCkNPTkZJR19RQ09NX1NQTUlfQURDNT1tCiMgQ09ORklHX1NE
X0FEQ19NT0RVTEFUT1IgaXMgbm90IHNldApDT05GSUdfVElfQURDMDgxQz1tCkNPTkZJR19USV9B
RFMxMDE1PW0KIyBlbmQgb2YgQW5hbG9nIHRvIGRpZ2l0YWwgY29udmVydGVycwoKIwojIEFuYWxv
ZyB0byBkaWdpdGFsIGFuZCBkaWdpdGFsIHRvIGFuYWxvZyBjb252ZXJ0ZXJzCiMKIyBlbmQgb2Yg
QW5hbG9nIHRvIGRpZ2l0YWwgYW5kIGRpZ2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKCiMKIyBB
bmFsb2cgRnJvbnQgRW5kcwojCkNPTkZJR19JSU9fUkVTQ0FMRT1tCiMgZW5kIG9mIEFuYWxvZyBG
cm9udCBFbmRzCgojCiMgQW1wbGlmaWVycwojCkNPTkZJR19ITUM0MjU9bQojIGVuZCBvZiBBbXBs
aWZpZXJzCgojCiMgQ2FwYWNpdGFuY2UgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMKQ09ORklHX0FE
NzE1MD1tCiMgZW5kIG9mIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29udmVydGVycwoKIwojIENo
ZW1pY2FsIFNlbnNvcnMKIwpDT05GSUdfQVRMQVNfUEhfU0VOU09SPW0KIyBDT05GSUdfQVRMQVNf
RVpPX1NFTlNPUiBpcyBub3Qgc2V0CkNPTkZJR19CTUU2ODA9bQpDT05GSUdfQk1FNjgwX0kyQz1t
CiMgQ09ORklHX0NDUzgxMSBpcyBub3Qgc2V0CkNPTkZJR19JQVFDT1JFPW0KIyBDT05GSUdfUE1T
NzAwMyBpcyBub3Qgc2V0CkNPTkZJR19TQ0QzMF9DT1JFPW0KQ09ORklHX1NDRDMwX0kyQz1tCiMg
Q09ORklHX1NDRDMwX1NFUklBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDRDRYIGlzIG5vdCBzZXQK
Q09ORklHX1NFTlNJUklPTl9TR1AzMD1tCkNPTkZJR19TRU5TSVJJT05fU0dQNDA9bQpDT05GSUdf
U1BTMzA9bQojIENPTkZJR19TUFMzMF9JMkMgaXMgbm90IHNldApDT05GSUdfU1BTMzBfU0VSSUFM
PW0KIyBDT05GSUdfU0VOU0VBSVJfU1VOUklTRV9DTzIgaXMgbm90IHNldAojIENPTkZJR19WWjg5
WCBpcyBub3Qgc2V0CiMgZW5kIG9mIENoZW1pY2FsIFNlbnNvcnMKCiMKIyBIaWQgU2Vuc29yIElJ
TyBDb21tb24KIwojIGVuZCBvZiBIaWQgU2Vuc29yIElJTyBDb21tb24KCkNPTkZJR19JSU9fTVNf
U0VOU09SU19JMkM9bQoKIwojIElJTyBTQ01JIFNlbnNvcnMKIwojIGVuZCBvZiBJSU8gU0NNSSBT
ZW5zb3JzCgojCiMgU1NQIFNlbnNvciBDb21tb24KIwojIGVuZCBvZiBTU1AgU2Vuc29yIENvbW1v
bgoKQ09ORklHX0lJT19TVF9TRU5TT1JTX0NPUkU9bQoKIwojIERpZ2l0YWwgdG8gYW5hbG9nIGNv
bnZlcnRlcnMKIwpDT05GSUdfQUQ1MDY0PW0KIyBDT05GSUdfQUQ1MzgwIGlzIG5vdCBzZXQKQ09O
RklHX0FENTQ0Nj1tCiMgQ09ORklHX0FENTU5M1IgaXMgbm90IHNldApDT05GSUdfQUQ1Njg2PW0K
Q09ORklHX0FENTY5Nl9JMkM9bQojIENPTkZJR19EUE9UX0RBQyBpcyBub3Qgc2V0CiMgQ09ORklH
X0RTNDQyNCBpcyBub3Qgc2V0CiMgQ09ORklHX002MjMzMiBpcyBub3Qgc2V0CkNPTkZJR19NQVg1
MTc9bQpDT05GSUdfTUFYNTgyMT1tCkNPTkZJR19NQ1A0NzI1PW0KQ09ORklHX1RJX0RBQzU1NzE9
bQojIGVuZCBvZiBEaWdpdGFsIHRvIGFuYWxvZyBjb252ZXJ0ZXJzCgojCiMgSUlPIGR1bW15IGRy
aXZlcgojCkNPTkZJR19JSU9fU0lNUExFX0RVTU1ZPW0KIyBDT05GSUdfSUlPX1NJTVBMRV9EVU1N
WV9FVkVOVFMgaXMgbm90IHNldApDT05GSUdfSUlPX1NJTVBMRV9EVU1NWV9CVUZGRVI9eQojIGVu
ZCBvZiBJSU8gZHVtbXkgZHJpdmVyCgojCiMgRmlsdGVycwojCiMgZW5kIG9mIEZpbHRlcnMKCiMK
IyBGcmVxdWVuY3kgU3ludGhlc2l6ZXJzIEREUy9QTEwKIwoKIwojIENsb2NrIEdlbmVyYXRvci9E
aXN0cmlidXRpb24KIwojIGVuZCBvZiBDbG9jayBHZW5lcmF0b3IvRGlzdHJpYnV0aW9uCgojCiMg
UGhhc2UtTG9ja2VkIExvb3AgKFBMTCkgZnJlcXVlbmN5IHN5bnRoZXNpemVycwojCiMgZW5kIG9m
IFBoYXNlLUxvY2tlZCBMb29wIChQTEwpIGZyZXF1ZW5jeSBzeW50aGVzaXplcnMKIyBlbmQgb2Yg
RnJlcXVlbmN5IFN5bnRoZXNpemVycyBERFMvUExMCgojCiMgRGlnaXRhbCBneXJvc2NvcGUgc2Vu
c29ycwojCiMgQ09ORklHX0JNRzE2MCBpcyBub3Qgc2V0CkNPTkZJR19GWEFTMjEwMDJDPW0KQ09O
RklHX0ZYQVMyMTAwMkNfSTJDPW0KIyBDT05GSUdfTVBVMzA1MF9JMkMgaXMgbm90IHNldAojIENP
TkZJR19JSU9fU1RfR1lST18zQVhJUyBpcyBub3Qgc2V0CkNPTkZJR19JVEczMjAwPW0KIyBlbmQg
b2YgRGlnaXRhbCBneXJvc2NvcGUgc2Vuc29ycwoKIwojIEhlYWx0aCBTZW5zb3JzCiMKCiMKIyBI
ZWFydCBSYXRlIE1vbml0b3JzCiMKQ09ORklHX0FGRTQ0MDQ9bQpDT05GSUdfTUFYMzAxMDA9bQoj
IENPTkZJR19NQVgzMDEwMiBpcyBub3Qgc2V0CiMgZW5kIG9mIEhlYXJ0IFJhdGUgTW9uaXRvcnMK
IyBlbmQgb2YgSGVhbHRoIFNlbnNvcnMKCiMKIyBIdW1pZGl0eSBzZW5zb3JzCiMKQ09ORklHX0FN
MjMxNT1tCkNPTkZJR19ESFQxMT1tCiMgQ09ORklHX0hEQzEwMFggaXMgbm90IHNldAojIENPTkZJ
R19IREMyMDEwIGlzIG5vdCBzZXQKQ09ORklHX0hUUzIyMT1tCkNPTkZJR19IVFMyMjFfSTJDPW0K
Q09ORklHX0hUVTIxPW0KQ09ORklHX1NJNzAwNT1tCkNPTkZJR19TSTcwMjA9bQojIGVuZCBvZiBI
dW1pZGl0eSBzZW5zb3JzCgojCiMgSW5lcnRpYWwgbWVhc3VyZW1lbnQgdW5pdHMKIwpDT05GSUdf
Qk1JMTYwPW0KQ09ORklHX0JNSTE2MF9JMkM9bQpDT05GSUdfRlhPUzg3MDA9bQpDT05GSUdfRlhP
Uzg3MDBfSTJDPW0KQ09ORklHX0tNWDYxPW0KQ09ORklHX0lOVl9JQ000MjYwMD1tCkNPTkZJR19J
TlZfSUNNNDI2MDBfSTJDPW0KQ09ORklHX0lOVl9NUFU2MDUwX0lJTz1tCkNPTkZJR19JTlZfTVBV
NjA1MF9JMkM9bQpDT05GSUdfSUlPX1NUX0xTTTZEU1g9bQpDT05GSUdfSUlPX1NUX0xTTTZEU1hf
STJDPW0KQ09ORklHX0lJT19TVF9MU005RFMwPW0KIyBDT05GSUdfSUlPX1NUX0xTTTlEUzBfSTJD
IGlzIG5vdCBzZXQKIyBlbmQgb2YgSW5lcnRpYWwgbWVhc3VyZW1lbnQgdW5pdHMKCiMKIyBMaWdo
dCBzZW5zb3JzCiMKQ09ORklHX0FESkRfUzMxMT1tCkNPTkZJR19BRFVYMTAyMD1tCkNPTkZJR19B
TDMwMTA9bQojIENPTkZJR19BTDMzMjBBIGlzIG5vdCBzZXQKQ09ORklHX0FQRFM5MzAwPW0KIyBD
T05GSUdfQVBEUzk5NjAgaXMgbm90IHNldAojIENPTkZJR19BUzczMjExIGlzIG5vdCBzZXQKQ09O
RklHX0JIMTc1MD1tCiMgQ09ORklHX0JIMTc4MCBpcyBub3Qgc2V0CkNPTkZJR19DTTMyMTgxPW0K
IyBDT05GSUdfQ00zMjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ00zMzIzIGlzIG5vdCBzZXQKQ09O
RklHX0NNMzYwNT1tCkNPTkZJR19DTTM2NjUxPW0KQ09ORklHX0dQMkFQMDAyPW0KQ09ORklHX0dQ
MkFQMDIwQTAwRj1tCkNPTkZJR19TRU5TT1JTX0lTTDI5MDE4PW0KIyBDT05GSUdfU0VOU09SU19J
U0wyOTAyOCBpcyBub3Qgc2V0CkNPTkZJR19JU0wyOTEyNT1tCkNPTkZJR19KU0ExMjEyPW0KQ09O
RklHX1JQUjA1MjE9bQpDT05GSUdfTFRSNTAxPW0KIyBDT05GSUdfTFYwMTA0Q1MgaXMgbm90IHNl
dApDT05GSUdfTUFYNDQwMDA9bQojIENPTkZJR19NQVg0NDAwOSBpcyBub3Qgc2V0CiMgQ09ORklH
X05PQTEzMDUgaXMgbm90IHNldApDT05GSUdfT1BUMzAwMT1tCkNPTkZJR19QQTEyMjAzMDAxPW0K
IyBDT05GSUdfU0kxMTMzIGlzIG5vdCBzZXQKQ09ORklHX1NJMTE0NT1tCkNPTkZJR19TVEszMzEw
PW0KQ09ORklHX1NUX1VWSVMyNT1tCkNPTkZJR19TVF9VVklTMjVfSTJDPW0KQ09ORklHX1RDUzM0
MTQ9bQpDT05GSUdfVENTMzQ3Mj1tCkNPTkZJR19TRU5TT1JTX1RTTDI1NjM9bQpDT05GSUdfVFNM
MjU4Mz1tCiMgQ09ORklHX1RTTDI1OTEgaXMgbm90IHNldApDT05GSUdfVFNMMjc3Mj1tCkNPTkZJ
R19UU0w0NTMxPW0KIyBDT05GSUdfVVM1MTgyRCBpcyBub3Qgc2V0CkNPTkZJR19WQ05MNDAwMD1t
CkNPTkZJR19WQ05MNDAzNT1tCiMgQ09ORklHX1ZFTUw2MDMwIGlzIG5vdCBzZXQKQ09ORklHX1ZF
TUw2MDcwPW0KQ09ORklHX1ZMNjE4MD1tCkNPTkZJR19aT1BUMjIwMT1tCiMgZW5kIG9mIExpZ2h0
IHNlbnNvcnMKCiMKIyBNYWduZXRvbWV0ZXIgc2Vuc29ycwojCiMgQ09ORklHX0FLODk3NCBpcyBu
b3Qgc2V0CkNPTkZJR19BSzg5NzU9bQpDT05GSUdfQUswOTkxMT1tCiMgQ09ORklHX0JNQzE1MF9N
QUdOX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19NQUczMTEwPW0KQ09ORklHX01NQzM1MjQwPW0KQ09O
RklHX0lJT19TVF9NQUdOXzNBWElTPW0KIyBDT05GSUdfSUlPX1NUX01BR05fSTJDXzNBWElTIGlz
IG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfSE1DNTg0Mz1tCkNPTkZJR19TRU5TT1JTX0hNQzU4NDNf
STJDPW0KIyBDT05GSUdfU0VOU09SU19STTMxMDBfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfWUFN
QUhBX1lBUzUzMCBpcyBub3Qgc2V0CiMgZW5kIG9mIE1hZ25ldG9tZXRlciBzZW5zb3JzCgojCiMg
TXVsdGlwbGV4ZXJzCiMKQ09ORklHX0lJT19NVVg9bQojIGVuZCBvZiBNdWx0aXBsZXhlcnMKCiMK
IyBJbmNsaW5vbWV0ZXIgc2Vuc29ycwojCiMgZW5kIG9mIEluY2xpbm9tZXRlciBzZW5zb3JzCgoj
CiMgVHJpZ2dlcnMgLSBzdGFuZGFsb25lCiMKQ09ORklHX0lJT19JTlRFUlJVUFRfVFJJR0dFUj1t
CkNPTkZJR19JSU9fU1lTRlNfVFJJR0dFUj1tCiMgZW5kIG9mIFRyaWdnZXJzIC0gc3RhbmRhbG9u
ZQoKIwojIExpbmVhciBhbmQgYW5ndWxhciBwb3NpdGlvbiBzZW5zb3JzCiMKIyBlbmQgb2YgTGlu
ZWFyIGFuZCBhbmd1bGFyIHBvc2l0aW9uIHNlbnNvcnMKCiMKIyBEaWdpdGFsIHBvdGVudGlvbWV0
ZXJzCiMKQ09ORklHX0FENTExMD1tCkNPTkZJR19BRDUyNzI9bQpDT05GSUdfRFMxODAzPW0KQ09O
RklHX01BWDU0MzI9bQpDT05GSUdfTUNQNDAxOD1tCkNPTkZJR19NQ1A0NTMxPW0KIyBDT05GSUdf
VFBMMDEwMiBpcyBub3Qgc2V0CiMgZW5kIG9mIERpZ2l0YWwgcG90ZW50aW9tZXRlcnMKCiMKIyBE
aWdpdGFsIHBvdGVudGlvc3RhdHMKIwpDT05GSUdfTE1QOTEwMDA9bQojIGVuZCBvZiBEaWdpdGFs
IHBvdGVudGlvc3RhdHMKCiMKIyBQcmVzc3VyZSBzZW5zb3JzCiMKQ09ORklHX0FCUDA2ME1HPW0K
IyBDT05GSUdfQk1QMjgwIGlzIG5vdCBzZXQKQ09ORklHX0RMSEw2MEQ9bQpDT05GSUdfRFBTMzEw
PW0KIyBDT05GSUdfSFAwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0lDUDEwMTAwIGlzIG5vdCBzZXQK
Q09ORklHX01QTDExNT1tCkNPTkZJR19NUEwxMTVfSTJDPW0KIyBDT05GSUdfTVBMMzExNSBpcyBu
b3Qgc2V0CkNPTkZJR19NUzU2MTE9bQpDT05GSUdfTVM1NjExX0kyQz1tCkNPTkZJR19NUzU2Mzc9
bQpDT05GSUdfSUlPX1NUX1BSRVNTPW0KIyBDT05GSUdfSUlPX1NUX1BSRVNTX0kyQyBpcyBub3Qg
c2V0CkNPTkZJR19UNTQwMz1tCkNPTkZJR19IUDIwNkM9bQojIENPTkZJR19aUEEyMzI2IGlzIG5v
dCBzZXQKIyBlbmQgb2YgUHJlc3N1cmUgc2Vuc29ycwoKIwojIExpZ2h0bmluZyBzZW5zb3JzCiMK
IyBlbmQgb2YgTGlnaHRuaW5nIHNlbnNvcnMKCiMKIyBQcm94aW1pdHkgYW5kIGRpc3RhbmNlIHNl
bnNvcnMKIwojIENPTkZJR19JU0wyOTUwMSBpcyBub3Qgc2V0CkNPTkZJR19MSURBUl9MSVRFX1Yy
PW0KQ09ORklHX01CMTIzMj1tCkNPTkZJR19QSU5HPW0KIyBDT05GSUdfUkZENzc0MDIgaXMgbm90
IHNldApDT05GSUdfU1JGMDQ9bQpDT05GSUdfU1hfQ09NTU9OPW0KQ09ORklHX1NYOTMxMD1tCkNP
TkZJR19TWDkzMjQ9bQpDT05GSUdfU1g5MzYwPW0KIyBDT05GSUdfU1g5NTAwIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1JGMDggaXMgbm90IHNldApDT05GSUdfVkNOTDMwMjA9bQpDT05GSUdfVkw1M0ww
WF9JMkM9bQojIGVuZCBvZiBQcm94aW1pdHkgYW5kIGRpc3RhbmNlIHNlbnNvcnMKCiMKIyBSZXNv
bHZlciB0byBkaWdpdGFsIGNvbnZlcnRlcnMKIwojIGVuZCBvZiBSZXNvbHZlciB0byBkaWdpdGFs
IGNvbnZlcnRlcnMKCiMKIyBUZW1wZXJhdHVyZSBzZW5zb3JzCiMKQ09ORklHX01MWDkwNjE0PW0K
IyBDT05GSUdfTUxYOTA2MzIgaXMgbm90IHNldAojIENPTkZJR19UTVAwMDYgaXMgbm90IHNldApD
T05GSUdfVE1QMDA3PW0KIyBDT05GSUdfVE1QMTE3IGlzIG5vdCBzZXQKQ09ORklHX1RTWVMwMT1t
CkNPTkZJR19UU1lTMDJEPW0KIyBlbmQgb2YgVGVtcGVyYXR1cmUgc2Vuc29ycwoKQ09ORklHX1BX
TT15CkNPTkZJR19QV01fU1lTRlM9eQojIENPTkZJR19QV01fREVCVUcgaXMgbm90IHNldApDT05G
SUdfUFdNX0FUTUVMX1RDQj1tCkNPTkZJR19QV01fUENBOTY4NT15CgojCiMgSVJRIGNoaXAgc3Vw
cG9ydAojCkNPTkZJR19JUlFDSElQPXkKQ09ORklHX0FMX0ZJQz15CiMgQ09ORklHX1hJTElOWF9J
TlRDIGlzIG5vdCBzZXQKIyBlbmQgb2YgSVJRIGNoaXAgc3VwcG9ydAoKQ09ORklHX1JFU0VUX0NP
TlRST0xMRVI9eQoKIwojIFBIWSBTdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19QSFk9eQpDT05G
SUdfUEhZX0NBTl9UUkFOU0NFSVZFUj15CgojCiMgUEhZIGRyaXZlcnMgZm9yIEJyb2FkY29tIHBs
YXRmb3JtcwojCiMgZW5kIG9mIFBIWSBkcml2ZXJzIGZvciBCcm9hZGNvbSBwbGF0Zm9ybXMKIyBl
bmQgb2YgUEhZIFN1YnN5c3RlbQoKIyBDT05GSUdfUE9XRVJDQVAgaXMgbm90IHNldApDT05GSUdf
UkFTPXkKCiMKIyBBbmRyb2lkCiMKIyBDT05GSUdfQU5EUk9JRCBpcyBub3Qgc2V0CiMgZW5kIG9m
IEFuZHJvaWQKCkNPTkZJR19EQVg9eQojIENPTkZJR19OVk1FTSBpcyBub3Qgc2V0CgojCiMgSFcg
dHJhY2luZyBzdXBwb3J0CiMKQ09ORklHX1NUTT15CkNPTkZJR19TVE1fUFJPVE9fQkFTSUM9eQpD
T05GSUdfU1RNX1BST1RPX1NZU19UPXkKQ09ORklHX1NUTV9EVU1NWT1tCkNPTkZJR19TVE1fU09V
UkNFX0NPTlNPTEU9eQojIENPTkZJR19TVE1fU09VUkNFX0hFQVJUQkVBVCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NUTV9TT1VSQ0VfRlRSQUNFIGlzIG5vdCBzZXQKIyBlbmQgb2YgSFcgdHJhY2luZyBz
dXBwb3J0CgpDT05GSUdfRlBHQT1tCkNPTkZJR19BTFRFUkFfUFJfSVBfQ09SRT1tCkNPTkZJR19G
UEdBX0JSSURHRT1tCkNPTkZJR19GUEdBX1JFR0lPTj1tCkNPTkZJR19PRl9GUEdBX1JFR0lPTj1t
CkNPTkZJR19GU0k9eQojIENPTkZJR19GU0lfTkVXX0RFVl9OT0RFIGlzIG5vdCBzZXQKQ09ORklH
X0ZTSV9NQVNURVJfR1BJTz1tCkNPTkZJR19GU0lfTUFTVEVSX0hVQj1tCkNPTkZJR19GU0lfU0NP
TT15CkNPTkZJR19NVUxUSVBMRVhFUj15CgojCiMgTXVsdGlwbGV4ZXIgZHJpdmVycwojCkNPTkZJ
R19NVVhfQURHNzkyQT1tCkNPTkZJR19NVVhfR1BJTz15CkNPTkZJR19NVVhfTU1JTz1tCiMgZW5k
IG9mIE11bHRpcGxleGVyIGRyaXZlcnMKCkNPTkZJR19TSU9YPW0KQ09ORklHX1NJT1hfQlVTX0dQ
SU89bQpDT05GSUdfU0xJTUJVUz1tCkNPTkZJR19JTlRFUkNPTk5FQ1Q9eQojIENPTkZJR19DT1VO
VEVSIGlzIG5vdCBzZXQKQ09ORklHX01PU1Q9bQpDT05GSUdfTU9TVF9DREVWPW0KQ09ORklHX1BF
Q0k9eQpDT05GSUdfUEVDSV9DUFU9bQojIENPTkZJR19IVEUgaXMgbm90IHNldAojIGVuZCBvZiBE
ZXZpY2UgRHJpdmVycwoKIwojIEZpbGUgc3lzdGVtcwojCkNPTkZJR19WQUxJREFURV9GU19QQVJT
RVI9eQpDT05GSUdfRVhQT1JURlM9eQpDT05GSUdfRVhQT1JURlNfQkxPQ0tfT1BTPXkKIyBDT05G
SUdfRklMRV9MT0NLSU5HIGlzIG5vdCBzZXQKQ09ORklHX0ZTX0VOQ1JZUFRJT049eQojIENPTkZJ
R19GU19WRVJJVFkgaXMgbm90IHNldAojIENPTkZJR19ETk9USUZZIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5PVElGWV9VU0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfRkFOT1RJRlkgaXMgbm90IHNldAoj
IENPTkZJR19RVU9UQSBpcyBub3Qgc2V0CkNPTkZJR19BVVRPRlM0X0ZTPW0KQ09ORklHX0FVVE9G
U19GUz15CiMgQ09ORklHX0ZVU0VfRlMgaXMgbm90IHNldApDT05GSUdfT1ZFUkxBWV9GUz15CkNP
TkZJR19PVkVSTEFZX0ZTX1JFRElSRUNUX0RJUj15CkNPTkZJR19PVkVSTEFZX0ZTX1JFRElSRUNU
X0FMV0FZU19GT0xMT1c9eQpDT05GSUdfT1ZFUkxBWV9GU19JTkRFWD15CkNPTkZJR19PVkVSTEFZ
X0ZTX1hJTk9fQVVUTz15CkNPTkZJR19PVkVSTEFZX0ZTX01FVEFDT1BZPXkKCiMKIyBDYWNoZXMK
IwojIENPTkZJR19GU0NBQ0hFIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2FjaGVzCgojCiMgUHNldWRv
IGZpbGVzeXN0ZW1zCiMKIyBDT05GSUdfUFJPQ19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BST0Nf
Q0hJTERSRU4gaXMgbm90IHNldApDT05GSUdfS0VSTkZTPXkKQ09ORklHX1NZU0ZTPXkKQ09ORklH
X1RNUEZTPXkKIyBDT05GSUdfVE1QRlNfUE9TSVhfQUNMIGlzIG5vdCBzZXQKIyBDT05GSUdfVE1Q
RlNfWEFUVFIgaXMgbm90IHNldApDT05GSUdfVE1QRlNfSU5PREU2ND15CkNPTkZJR19BUkNIX1NV
UFBPUlRTX0hVR0VUTEJGUz15CiMgQ09ORklHX0hVR0VUTEJGUyBpcyBub3Qgc2V0CkNPTkZJR19N
RU1GRF9DUkVBVEU9eQpDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRT15CkNPTkZJR19DT05G
SUdGU19GUz15CiMgZW5kIG9mIFBzZXVkbyBmaWxlc3lzdGVtcwoKIyBDT05GSUdfTUlTQ19GSUxF
U1lTVEVNUyBpcyBub3Qgc2V0CkNPTkZJR19OTFM9bQpDT05GSUdfTkxTX0RFRkFVTFQ9Imlzbzg4
NTktMSIKIyBDT05GSUdfTkxTX0NPREVQQUdFXzQzNyBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09E
RVBBR0VfNzM3PW0KQ09ORklHX05MU19DT0RFUEFHRV83NzU9bQpDT05GSUdfTkxTX0NPREVQQUdF
Xzg1MD1tCiMgQ09ORklHX05MU19DT0RFUEFHRV84NTIgaXMgbm90IHNldApDT05GSUdfTkxTX0NP
REVQQUdFXzg1NT1tCiMgQ09ORklHX05MU19DT0RFUEFHRV84NTcgaXMgbm90IHNldAojIENPTkZJ
R19OTFNfQ09ERVBBR0VfODYwIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MSBp
cyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBBR0VfODYyPW0KIyBDT05GSUdfTkxTX0NPREVQQUdF
Xzg2MyBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBBR0VfODY0PW0KQ09ORklHX05MU19DT0RF
UEFHRV84NjU9bQojIENPTkZJR19OTFNfQ09ERVBBR0VfODY2IGlzIG5vdCBzZXQKQ09ORklHX05M
U19DT0RFUEFHRV84Njk9bQpDT05GSUdfTkxTX0NPREVQQUdFXzkzNj1tCiMgQ09ORklHX05MU19D
T0RFUEFHRV85NTAgaXMgbm90IHNldApDT05GSUdfTkxTX0NPREVQQUdFXzkzMj1tCkNPTkZJR19O
TFNfQ09ERVBBR0VfOTQ5PW0KQ09ORklHX05MU19DT0RFUEFHRV84NzQ9bQpDT05GSUdfTkxTX0lT
Tzg4NTlfOD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfMTI1MD1tCiMgQ09ORklHX05MU19DT0RFUEFH
RV8xMjUxIGlzIG5vdCBzZXQKQ09ORklHX05MU19BU0NJST1tCkNPTkZJR19OTFNfSVNPODg1OV8x
PW0KQ09ORklHX05MU19JU084ODU5XzI9bQpDT05GSUdfTkxTX0lTTzg4NTlfMz1tCkNPTkZJR19O
TFNfSVNPODg1OV80PW0KIyBDT05GSUdfTkxTX0lTTzg4NTlfNSBpcyBub3Qgc2V0CkNPTkZJR19O
TFNfSVNPODg1OV82PW0KQ09ORklHX05MU19JU084ODU5Xzc9bQpDT05GSUdfTkxTX0lTTzg4NTlf
OT1tCkNPTkZJR19OTFNfSVNPODg1OV8xMz1tCiMgQ09ORklHX05MU19JU084ODU5XzE0IGlzIG5v
dCBzZXQKQ09ORklHX05MU19JU084ODU5XzE1PW0KIyBDT05GSUdfTkxTX0tPSThfUiBpcyBub3Qg
c2V0CkNPTkZJR19OTFNfS09JOF9VPW0KIyBDT05GSUdfTkxTX01BQ19ST01BTiBpcyBub3Qgc2V0
CiMgQ09ORklHX05MU19NQUNfQ0VMVElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DRU5U
RVVSTyBpcyBub3Qgc2V0CkNPTkZJR19OTFNfTUFDX0NST0FUSUFOPW0KQ09ORklHX05MU19NQUNf
Q1lSSUxMSUM9bQojIENPTkZJR19OTFNfTUFDX0dBRUxJQyBpcyBub3Qgc2V0CkNPTkZJR19OTFNf
TUFDX0dSRUVLPW0KQ09ORklHX05MU19NQUNfSUNFTEFORD1tCiMgQ09ORklHX05MU19NQUNfSU5V
SVQgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFOSUFOIGlzIG5vdCBzZXQKQ09ORklH
X05MU19NQUNfVFVSS0lTSD1tCiMgQ09ORklHX05MU19VVEY4IGlzIG5vdCBzZXQKIyBDT05GSUdf
VU5JQ09ERSBpcyBub3Qgc2V0CkNPTkZJR19JT19XUT15CiMgZW5kIG9mIEZpbGUgc3lzdGVtcwoK
IwojIFNlY3VyaXR5IG9wdGlvbnMKIwpDT05GSUdfS0VZUz15CiMgQ09ORklHX0tFWVNfUkVRVUVT
VF9DQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BFUlNJU1RFTlRfS0VZUklOR1MgaXMgbm90IHNl
dApDT05GSUdfVFJVU1RFRF9LRVlTPW0KCiMKIyBObyB0cnVzdCBzb3VyY2Ugc2VsZWN0ZWQhCiMK
IyBDT05GSUdfRU5DUllQVEVEX0tFWVMgaXMgbm90IHNldAojIENPTkZJR19LRVlfREhfT1BFUkFU
SU9OUyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWV9OT1RJRklDQVRJT05TIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VDVVJJVFlfRE1FU0dfUkVTVFJJQ1QgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklU
WUZTIGlzIG5vdCBzZXQKQ09ORklHX0ZPUlRJRllfU09VUkNFPXkKIyBDT05GSUdfU1RBVElDX1VT
RVJNT0RFSEVMUEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1BX1NFQ1VSRV9BTkRfT1JfVFJVU1RF
RF9CT09UIGlzIG5vdCBzZXQKQ09ORklHX0RFRkFVTFRfU0VDVVJJVFlfREFDPXkKQ09ORklHX0xT
TT0ibGFuZGxvY2ssbG9ja2Rvd24seWFtYSxsb2FkcGluLHNhZmVzZXRpZCxpbnRlZ3JpdHksYnBm
IgoKIwojIEtlcm5lbCBoYXJkZW5pbmcgb3B0aW9ucwojCgojCiMgTWVtb3J5IGluaXRpYWxpemF0
aW9uCiMKQ09ORklHX0NDX0hBU19BVVRPX1ZBUl9JTklUX1BBVFRFUk49eQpDT05GSUdfQ0NfSEFT
X0FVVE9fVkFSX0lOSVRfWkVSTz15CiMgQ09ORklHX0lOSVRfU1RBQ0tfTk9ORSBpcyBub3Qgc2V0
CkNPTkZJR19JTklUX1NUQUNLX0FMTF9QQVRURVJOPXkKIyBDT05GSUdfSU5JVF9TVEFDS19BTExf
WkVSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfT05fQUxMT0NfREVGQVVMVF9PTiBpcyBub3Qg
c2V0CiMgQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
TWVtb3J5IGluaXRpYWxpemF0aW9uCgpDT05GSUdfQ0NfSEFTX1JBTkRTVFJVQ1Q9eQpDT05GSUdf
UkFORFNUUlVDVF9OT05FPXkKIyBDT05GSUdfUkFORFNUUlVDVF9GVUxMIGlzIG5vdCBzZXQKIyBl
bmQgb2YgS2VybmVsIGhhcmRlbmluZyBvcHRpb25zCiMgZW5kIG9mIFNlY3VyaXR5IG9wdGlvbnMK
CkNPTkZJR19YT1JfQkxPQ0tTPXkKQ09ORklHX0NSWVBUTz15CgojCiMgQ3J5cHRvIGNvcmUgb3Ig
aGVscGVyCiMKQ09ORklHX0NSWVBUT19GSVBTPXkKQ09ORklHX0NSWVBUT19BTEdBUEk9eQpDT05G
SUdfQ1JZUFRPX0FMR0FQSTI9eQpDT05GSUdfQ1JZUFRPX0FFQUQ9eQpDT05GSUdfQ1JZUFRPX0FF
QUQyPXkKQ09ORklHX0NSWVBUT19TS0NJUEhFUj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVIyPXkK
Q09ORklHX0NSWVBUT19IQVNIPXkKQ09ORklHX0NSWVBUT19IQVNIMj15CkNPTkZJR19DUllQVE9f
Uk5HPXkKQ09ORklHX0NSWVBUT19STkcyPXkKQ09ORklHX0NSWVBUT19STkdfREVGQVVMVD15CkNP
TkZJR19DUllQVE9fQUtDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19BS0NJUEhFUj15CkNPTkZJR19D
UllQVE9fS1BQMj15CkNPTkZJR19DUllQVE9fS1BQPW0KQ09ORklHX0NSWVBUT19BQ09NUDI9eQpD
T05GSUdfQ1JZUFRPX01BTkFHRVI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVIyPXkKIyBDT05GSUdf
Q1JZUFRPX01BTkFHRVJfRElTQUJMRV9URVNUUyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTUFO
QUdFUl9FWFRSQV9URVNUUz15CkNPTkZJR19DUllQVE9fR0YxMjhNVUw9eQpDT05GSUdfQ1JZUFRP
X05VTEw9eQpDT05GSUdfQ1JZUFRPX05VTEwyPXkKIyBDT05GSUdfQ1JZUFRPX1BDUllQVCBpcyBu
b3Qgc2V0CkNPTkZJR19DUllQVE9fQ1JZUFREPW0KQ09ORklHX0NSWVBUT19BVVRIRU5DPXkKIyBD
T05GSUdfQ1JZUFRPX1RFU1QgaXMgbm90IHNldAoKIwojIFB1YmxpYy1rZXkgY3J5cHRvZ3JhcGh5
CiMKQ09ORklHX0NSWVBUT19SU0E9eQpDT05GSUdfQ1JZUFRPX0RIPW0KIyBDT05GSUdfQ1JZUFRP
X0RIX1JGQzc5MTlfR1JPVVBTIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19FQ0M9eQpDT05GSUdf
Q1JZUFRPX0VDREg9bQpDT05GSUdfQ1JZUFRPX0VDRFNBPW0KQ09ORklHX0NSWVBUT19FQ1JEU0E9
eQojIENPTkZJR19DUllQVE9fU00yIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NVUlZFMjU1
MTkgaXMgbm90IHNldAoKIwojIEF1dGhlbnRpY2F0ZWQgRW5jcnlwdGlvbiB3aXRoIEFzc29jaWF0
ZWQgRGF0YQojCkNPTkZJR19DUllQVE9fQ0NNPW0KQ09ORklHX0NSWVBUT19HQ009bQpDT05GSUdf
Q1JZUFRPX0NIQUNIQTIwUE9MWTEzMDU9eQpDT05GSUdfQ1JZUFRPX0FFR0lTMTI4PW0KQ09ORklH
X0NSWVBUT19TRVFJVj15CkNPTkZJR19DUllQVE9fRUNIQUlOSVY9bQoKIwojIEJsb2NrIG1vZGVz
CiMKIyBDT05GSUdfQ1JZUFRPX0NCQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DRkIgaXMg
bm90IHNldApDT05GSUdfQ1JZUFRPX0NUUj15CkNPTkZJR19DUllQVE9fQ1RTPXkKQ09ORklHX0NS
WVBUT19FQ0I9eQpDT05GSUdfQ1JZUFRPX0xSVz15CiMgQ09ORklHX0NSWVBUT19PRkIgaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fUENCQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19YVFMg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fS0VZV1JBUCBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
WVBUT19BRElBTlRVTSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRVNTSVY9eQoKIwojIEhhc2gg
bW9kZXMKIwpDT05GSUdfQ1JZUFRPX0NNQUM9eQpDT05GSUdfQ1JZUFRPX0hNQUM9eQojIENPTkZJ
R19DUllQVE9fWENCQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19WTUFDIGlzIG5vdCBzZXQK
CiMKIyBEaWdlc3QKIwpDT05GSUdfQ1JZUFRPX0NSQzMyQz15CkNPTkZJR19DUllQVE9fQ1JDMzI9
bQpDT05GSUdfQ1JZUFRPX0NSQzMyX1MzOTA9eQpDT05GSUdfQ1JZUFRPX1hYSEFTSD1tCkNPTkZJ
R19DUllQVE9fQkxBS0UyQj1tCiMgQ09ORklHX0NSWVBUT19CTEFLRTJTIGlzIG5vdCBzZXQKQ09O
RklHX0NSWVBUT19DUkNUMTBESUY9eQpDT05GSUdfQ1JZUFRPX0NSQzY0X1JPQ0tTT0ZUPXkKQ09O
RklHX0NSWVBUT19HSEFTSD1tCkNPTkZJR19DUllQVE9fUE9MWTEzMDU9eQpDT05GSUdfQ1JZUFRP
X01END1tCkNPTkZJR19DUllQVE9fTUQ1PXkKQ09ORklHX0NSWVBUT19NSUNIQUVMX01JQz15CkNP
TkZJR19DUllQVE9fUk1EMTYwPXkKQ09ORklHX0NSWVBUT19TSEExPXkKQ09ORklHX0NSWVBUT19T
SEE1MTJfUzM5MD15CkNPTkZJR19DUllQVE9fU0hBMV9TMzkwPXkKQ09ORklHX0NSWVBUT19TSEEy
NTY9eQpDT05GSUdfQ1JZUFRPX1NIQTI1Nl9TMzkwPW0KQ09ORklHX0NSWVBUT19TSEE1MTI9eQpD
T05GSUdfQ1JZUFRPX1NIQTM9eQpDT05GSUdfQ1JZUFRPX1NIQTNfMjU2X1MzOTA9bQojIENPTkZJ
R19DUllQVE9fU0hBM181MTJfUzM5MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TTTNfR0VO
RVJJQyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fU1RSRUVCT0c9eQpDT05GSUdfQ1JZUFRPX1dQ
NTEyPW0KIyBDT05GSUdfQ1JZUFRPX0dIQVNIX1MzOTAgaXMgbm90IHNldAoKIwojIENpcGhlcnMK
IwpDT05GSUdfQ1JZUFRPX0FFUz15CkNPTkZJR19DUllQVE9fQUVTX1RJPW0KQ09ORklHX0NSWVBU
T19BRVNfUzM5MD15CiMgQ09ORklHX0NSWVBUT19CTE9XRklTSCBpcyBub3Qgc2V0CkNPTkZJR19D
UllQVE9fQ0FNRUxMSUE9eQpDT05GSUdfQ1JZUFRPX0NBU1RfQ09NTU9OPW0KQ09ORklHX0NSWVBU
T19DQVNUNT1tCiMgQ09ORklHX0NSWVBUT19DQVNUNiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9f
REVTPW0KQ09ORklHX0NSWVBUT19ERVNfUzM5MD15CiMgQ09ORklHX0NSWVBUT19GQ1JZUFQgaXMg
bm90IHNldApDT05GSUdfQ1JZUFRPX0NIQUNIQTIwPXkKQ09ORklHX0NSWVBUT19DSEFDSEFfUzM5
MD1tCkNPTkZJR19DUllQVE9fU0VSUEVOVD15CkNPTkZJR19DUllQVE9fU000PW0KQ09ORklHX0NS
WVBUT19TTTRfR0VORVJJQz1tCiMgQ09ORklHX0NSWVBUT19UV09GSVNIIGlzIG5vdCBzZXQKCiMK
IyBDb21wcmVzc2lvbgojCiMgQ09ORklHX0NSWVBUT19ERUZMQVRFIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX0xaTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT184NDIgaXMgbm90IHNldApD
T05GSUdfQ1JZUFRPX0xaND1tCiMgQ09ORklHX0NSWVBUT19MWjRIQyBpcyBub3Qgc2V0CkNPTkZJ
R19DUllQVE9fWlNURD15CgojCiMgUmFuZG9tIE51bWJlciBHZW5lcmF0aW9uCiMKIyBDT05GSUdf
Q1JZUFRPX0FOU0lfQ1BSTkcgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RSQkdfTUVOVT15CkNP
TkZJR19DUllQVE9fRFJCR19ITUFDPXkKQ09ORklHX0NSWVBUT19EUkJHX0hBU0g9eQpDT05GSUdf
Q1JZUFRPX0RSQkdfQ1RSPXkKQ09ORklHX0NSWVBUT19EUkJHPXkKQ09ORklHX0NSWVBUT19KSVRU
RVJFTlRST1BZPXkKQ09ORklHX0NSWVBUT19IQVNIX0lORk89eQojIENPTkZJR19DUllQVE9fSFcg
aXMgbm90IHNldApDT05GSUdfQVNZTU1FVFJJQ19LRVlfVFlQRT15CkNPTkZJR19BU1lNTUVUUklD
X1BVQkxJQ19LRVlfU1VCVFlQRT15CkNPTkZJR19YNTA5X0NFUlRJRklDQVRFX1BBUlNFUj15CkNP
TkZJR19QS0NTOF9QUklWQVRFX0tFWV9QQVJTRVI9eQpDT05GSUdfUEtDUzdfTUVTU0FHRV9QQVJT
RVI9eQojIENPTkZJR19QS0NTN19URVNUX0tFWSBpcyBub3Qgc2V0CiMgQ09ORklHX1NJR05FRF9Q
RV9GSUxFX1ZFUklGSUNBVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZJUFNfU0lHTkFUVVJFX1NF
TEZURVNUIGlzIG5vdCBzZXQKCiMKIyBDZXJ0aWZpY2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2lu
ZwojCkNPTkZJR19NT0RVTEVfU0lHX0tFWT0iY2VydHMvc2lnbmluZ19rZXkucGVtIgpDT05GSUdf
TU9EVUxFX1NJR19LRVlfVFlQRV9SU0E9eQojIENPTkZJR19NT0RVTEVfU0lHX0tFWV9UWVBFX0VD
RFNBIGlzIG5vdCBzZXQKQ09ORklHX1NZU1RFTV9UUlVTVEVEX0tFWVJJTkc9eQpDT05GSUdfU1lT
VEVNX1RSVVNURURfS0VZUz0iIgpDT05GSUdfU1lTVEVNX0VYVFJBX0NFUlRJRklDQVRFPXkKQ09O
RklHX1NZU1RFTV9FWFRSQV9DRVJUSUZJQ0FURV9TSVpFPTQwOTYKQ09ORklHX1NFQ09OREFSWV9U
UlVTVEVEX0tFWVJJTkc9eQpDT05GSUdfU1lTVEVNX0JMQUNLTElTVF9LRVlSSU5HPXkKQ09ORklH
X1NZU1RFTV9CTEFDS0xJU1RfSEFTSF9MSVNUPSIiCiMgQ09ORklHX1NZU1RFTV9SRVZPQ0FUSU9O
X0xJU1QgaXMgbm90IHNldAojIENPTkZJR19TWVNURU1fQkxBQ0tMSVNUX0FVVEhfVVBEQVRFIGlz
IG5vdCBzZXQKIyBlbmQgb2YgQ2VydGlmaWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKCkNP
TkZJR19CSU5BUllfUFJJTlRGPXkKCiMKIyBMaWJyYXJ5IHJvdXRpbmVzCiMKQ09ORklHX1BBQ0tJ
Tkc9eQpDT05GSUdfQklUUkVWRVJTRT15CkNPTkZJR19HRU5FUklDX1NUUk5DUFlfRlJPTV9VU0VS
PXkKQ09ORklHX0dFTkVSSUNfU1RSTkxFTl9VU0VSPXkKIyBDT05GSUdfQ09SRElDIGlzIG5vdCBz
ZXQKQ09ORklHX1BSSU1FX05VTUJFUlM9eQpDT05GSUdfUkFUSU9OQUw9eQpDT05GSUdfQVJDSF9V
U0VfQ01QWENIR19MT0NLUkVGPXkKCiMKIyBDcnlwdG8gbGlicmFyeSByb3V0aW5lcwojCkNPTkZJ
R19DUllQVE9fTElCX0FFUz15CkNPTkZJR19DUllQVE9fTElCX0JMQUtFMlNfR0VORVJJQz15CkNP
TkZJR19DUllQVE9fQVJDSF9IQVZFX0xJQl9DSEFDSEE9bQpDT05GSUdfQ1JZUFRPX0xJQl9DSEFD
SEFfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX0NIQUNIQT1tCkNPTkZJR19DUllQVE9fTElC
X0NVUlZFMjU1MTlfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX0NVUlZFMjU1MTk9eQpDT05G
SUdfQ1JZUFRPX0xJQl9ERVM9eQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNV9SU0laRT0xCkNP
TkZJR19DUllQVE9fTElCX1BPTFkxMzA1X0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZ
MTMwNT1tCkNPTkZJR19DUllQVE9fTElCX0NIQUNIQTIwUE9MWTEzMDU9bQpDT05GSUdfQ1JZUFRP
X0xJQl9TSEEyNTY9eQojIGVuZCBvZiBDcnlwdG8gbGlicmFyeSByb3V0aW5lcwoKQ09ORklHX0xJ
Ql9NRU1ORVE9eQpDT05GSUdfQ1JDX0NDSVRUPW0KQ09ORklHX0NSQzE2PXkKIyBDT05GSUdfQ1JD
X1QxMERJRiBpcyBub3Qgc2V0CkNPTkZJR19DUkM2NF9ST0NLU09GVD1tCiMgQ09ORklHX0NSQ19J
VFVfVCBpcyBub3Qgc2V0CkNPTkZJR19DUkMzMj15CiMgQ09ORklHX0NSQzMyX1NFTEZURVNUIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JDMzJfU0xJQ0VCWTggaXMgbm90IHNldAojIENPTkZJR19DUkMz
Ml9TTElDRUJZNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX1NBUldBVEUgaXMgbm90IHNldApD
T05GSUdfQ1JDMzJfQklUPXkKQ09ORklHX0NSQzY0PXkKQ09ORklHX0NSQzQ9eQpDT05GSUdfQ1JD
Nz1tCkNPTkZJR19MSUJDUkMzMkM9bQpDT05GSUdfQ1JDOD1tCkNPTkZJR19YWEhBU0g9eQojIENP
TkZJR19SQU5ET00zMl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19aTElCX0lORkxBVEU9eQoj
IENPTkZJR19aTElCX0RGTFRDQyBpcyBub3Qgc2V0CkNPTkZJR19MWjRfQ09NUFJFU1M9bQpDT05G
SUdfTFo0X0RFQ09NUFJFU1M9bQpDT05GSUdfWlNURF9DT01QUkVTUz15CkNPTkZJR19aU1REX0RF
Q09NUFJFU1M9eQpDT05GSUdfWFpfREVDPW0KQ09ORklHX1haX0RFQ19YODY9eQojIENPTkZJR19Y
Wl9ERUNfUE9XRVJQQyBpcyBub3Qgc2V0CkNPTkZJR19YWl9ERUNfSUE2ND15CiMgQ09ORklHX1ha
X0RFQ19BUk0gaXMgbm90IHNldAojIENPTkZJR19YWl9ERUNfQVJNVEhVTUIgaXMgbm90IHNldApD
T05GSUdfWFpfREVDX1NQQVJDPXkKQ09ORklHX1haX0RFQ19NSUNST0xaTUE9eQpDT05GSUdfWFpf
REVDX0JDSj15CkNPTkZJR19YWl9ERUNfVEVTVD1tCkNPTkZJR19HRU5FUklDX0FMTE9DQVRPUj15
CkNPTkZJR19CQ0g9bQpDT05GSUdfSU5URVJWQUxfVFJFRT15CkNPTkZJR19BU1NPQ0lBVElWRV9B
UlJBWT15CkNPTkZJR19IQVNfRE1BPXkKQ09ORklHX05FRURfRE1BX01BUF9TVEFURT15CkNPTkZJ
R19BUkNIX0RNQV9BRERSX1RfNjRCSVQ9eQpDT05GSUdfQVJDSF9IQVNfRk9SQ0VfRE1BX1VORU5D
UllQVEVEPXkKQ09ORklHX1NXSU9UTEI9eQojIENPTkZJR19ETUFfQ01BIGlzIG5vdCBzZXQKQ09O
RklHX0RNQV9BUElfREVCVUc9eQojIENPTkZJR19ETUFfQVBJX0RFQlVHX1NHIGlzIG5vdCBzZXQK
Q09ORklHX0RNQV9NQVBfQkVOQ0hNQVJLPXkKQ09ORklHX1NHTF9BTExPQz15CiMgQ09ORklHX0NQ
VU1BU0tfT0ZGU1RBQ0sgaXMgbm90IHNldApDT05GSUdfR0xPQj15CkNPTkZJR19HTE9CX1NFTEZU
RVNUPW0KQ09ORklHX0NMWl9UQUI9eQpDT05GSUdfSVJRX1BPTEw9eQpDT05GSUdfTVBJTElCPXkK
Q09ORklHX0xJQkZEVD15CkNPTkZJR19PSURfUkVHSVNUUlk9eQpDT05GSUdfSEFWRV9HRU5FUklD
X1ZEU089eQpDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVk9eQpDT05GSUdfR0VORVJJQ19WRFNP
X1RJTUVfTlM9eQpDT05GSUdfQVJDSF9TVEFDS1dBTEs9eQpDT05GSUdfU1RBQ0tERVBPVD15CkNP
TkZJR19TVEFDS19IQVNIX09SREVSPTIwCiMgZW5kIG9mIExpYnJhcnkgcm91dGluZXMKCiMKIyBL
ZXJuZWwgaGFja2luZwojCgojCiMgcHJpbnRrIGFuZCBkbWVzZyBvcHRpb25zCiMKQ09ORklHX1BS
SU5US19USU1FPXkKQ09ORklHX1BSSU5US19DQUxMRVI9eQojIENPTkZJR19TVEFDS1RSQUNFX0JV
SUxEX0lEIGlzIG5vdCBzZXQKQ09ORklHX0NPTlNPTEVfTE9HTEVWRUxfREVGQVVMVD03CkNPTkZJ
R19DT05TT0xFX0xPR0xFVkVMX1FVSUVUPTQKQ09ORklHX01FU1NBR0VfTE9HTEVWRUxfREVGQVVM
VD00CkNPTkZJR19EWU5BTUlDX0RFQlVHPXkKQ09ORklHX0RZTkFNSUNfREVCVUdfQ09SRT15CkNP
TkZJR19TWU1CT0xJQ19FUlJOQU1FPXkKIyBlbmQgb2YgcHJpbnRrIGFuZCBkbWVzZyBvcHRpb25z
CgpDT05GSUdfREVCVUdfS0VSTkVMPXkKIyBDT05GSUdfREVCVUdfTUlTQyBpcyBub3Qgc2V0Cgoj
CiMgQ29tcGlsZS10aW1lIGNoZWNrcyBhbmQgY29tcGlsZXIgb3B0aW9ucwojCkNPTkZJR19ERUJV
R19JTkZPX05PTkU9eQojIENPTkZJR19ERUJVR19JTkZPX0RXQVJGX1RPT0xDSEFJTl9ERUZBVUxU
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19EV0FSRjQgaXMgbm90IHNldAojIENPTkZJ
R19ERUJVR19JTkZPX0RXQVJGNSBpcyBub3Qgc2V0CkNPTkZJR19GUkFNRV9XQVJOPTIwNDgKIyBD
T05GSUdfU1RSSVBfQVNNX1NZTVMgaXMgbm90IHNldAojIENPTkZJR19IRUFERVJTX0lOU1RBTEwg
aXMgbm90IHNldApDT05GSUdfU0VDVElPTl9NSVNNQVRDSF9XQVJOX09OTFk9eQpDT05GSUdfVk1M
SU5VWF9NQVA9eQojIENPTkZJR19ERUJVR19GT1JDRV9XRUFLX1BFUl9DUFUgaXMgbm90IHNldAoj
IGVuZCBvZiBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCgojCiMgR2Vu
ZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCiMKIyBDT05GSUdfTUFHSUNfU1lTUlEg
aXMgbm90IHNldApDT05GSUdfREVCVUdfRlM9eQojIENPTkZJR19ERUJVR19GU19BTExPV19BTEwg
aXMgbm90IHNldAojIENPTkZJR19ERUJVR19GU19ESVNBTExPV19NT1VOVCBpcyBub3Qgc2V0CkNP
TkZJR19ERUJVR19GU19BTExPV19OT05FPXkKQ09ORklHX0FSQ0hfSEFTX1VCU0FOX1NBTklUSVpF
X0FMTD15CkNPTkZJR19VQlNBTj15CiMgQ09ORklHX1VCU0FOX1RSQVAgaXMgbm90IHNldApDT05G
SUdfQ0NfSEFTX1VCU0FOX0JPVU5EUz15CkNPTkZJR19DQ19IQVNfVUJTQU5fQVJSQVlfQk9VTkRT
PXkKQ09ORklHX1VCU0FOX0JPVU5EUz15CkNPTkZJR19VQlNBTl9BUlJBWV9CT1VORFM9eQojIENP
TkZJR19VQlNBTl9TSElGVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VCU0FOX0RJVl9aRVJPIGlzIG5v
dCBzZXQKIyBDT05GSUdfVUJTQU5fVU5SRUFDSEFCTEUgaXMgbm90IHNldAojIENPTkZJR19VQlNB
Tl9CT09MIGlzIG5vdCBzZXQKQ09ORklHX1VCU0FOX0VOVU09eQpDT05GSUdfVUJTQU5fQUxJR05N
RU5UPXkKQ09ORklHX1VCU0FOX1NBTklUSVpFX0FMTD15CkNPTkZJR19URVNUX1VCU0FOPW0KQ09O
RklHX0hBVkVfQVJDSF9LQ1NBTj15CkNPTkZJR19IQVZFX0tDU0FOX0NPTVBJTEVSPXkKIyBDT05G
SUdfS0NTQU4gaXMgbm90IHNldAojIGVuZCBvZiBHZW5lcmljIEtlcm5lbCBEZWJ1Z2dpbmcgSW5z
dHJ1bWVudHMKCiMKIyBOZXR3b3JraW5nIERlYnVnZ2luZwojCiMgQ09ORklHX05FVF9ERVZfUkVG
Q05UX1RSQUNLRVIgaXMgbm90IHNldAojIENPTkZJR19ORVRfTlNfUkVGQ05UX1RSQUNLRVIgaXMg
bm90IHNldAojIGVuZCBvZiBOZXR3b3JraW5nIERlYnVnZ2luZwoKIwojIE1lbW9yeSBEZWJ1Z2dp
bmcKIwpDT05GSUdfUEFHRV9FWFRFTlNJT049eQpDT05GSUdfREVCVUdfUEFHRUFMTE9DPXkKIyBD
T05GSUdfREVCVUdfUEFHRUFMTE9DX0VOQUJMRV9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX1BB
R0VfT1dORVI9eQojIENPTkZJR19QQUdFX1BPSVNPTklORyBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX1BBR0VfUkVGIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1JPREFUQV9URVNUPXkKQ09ORklH
X0FSQ0hfSEFTX0RFQlVHX1dYPXkKIyBDT05GSUdfREVCVUdfV1ggaXMgbm90IHNldApDT05GSUdf
R0VORVJJQ19QVERVTVA9eQojIENPTkZJR19QVERVTVBfREVCVUdGUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0RFQlVHX09CSkVDVFMgaXMgbm90IHNldApDT05GSUdfSEFWRV9ERUJVR19LTUVNTEVBSz15
CkNPTkZJR19ERUJVR19LTUVNTEVBSz15CkNPTkZJR19ERUJVR19LTUVNTEVBS19NRU1fUE9PTF9T
SVpFPTE2MDAwCkNPTkZJR19ERUJVR19LTUVNTEVBS19URVNUPW0KIyBDT05GSUdfREVCVUdfS01F
TUxFQUtfREVGQVVMVF9PRkYgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19LTUVNTEVBS19BVVRP
X1NDQU4gaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TVEFDS19VU0FHRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NDSEVEX1NUQUNLX0VORF9DSEVDSyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19E
RUJVR19WTV9QR1RBQkxFPXkKQ09ORklHX0RFQlVHX1ZNPXkKQ09ORklHX0RFQlVHX1ZNX1ZNQUNB
Q0hFPXkKQ09ORklHX0RFQlVHX1ZNX1JCPXkKQ09ORklHX0RFQlVHX1ZNX1BHRkxBR1M9eQpDT05G
SUdfREVCVUdfVk1fUEdUQUJMRT15CkNPTkZJR19ERUJVR19NRU1PUllfSU5JVD15CkNPTkZJR19E
RUJVR19QRVJfQ1BVX01BUFM9eQpDT05GSUdfSEFWRV9BUkNIX0tBU0FOPXkKQ09ORklHX0hBVkVf
QVJDSF9LQVNBTl9WTUFMTE9DPXkKQ09ORklHX0NDX0hBU19LQVNBTl9HRU5FUklDPXkKQ09ORklH
X0NDX0hBU19XT1JLSU5HX05PU0FOSVRJWkVfQUREUkVTUz15CkNPTkZJR19IQVZFX0FSQ0hfS0ZF
TkNFPXkKIyBlbmQgb2YgTWVtb3J5IERlYnVnZ2luZwoKIyBDT05GSUdfREVCVUdfU0hJUlEgaXMg
bm90IHNldAoKIwojIERlYnVnIE9vcHMsIExvY2t1cHMgYW5kIEhhbmdzCiMKIyBDT05GSUdfUEFO
SUNfT05fT09QUyBpcyBub3Qgc2V0CkNPTkZJR19QQU5JQ19PTl9PT1BTX1ZBTFVFPTAKQ09ORklH
X1BBTklDX1RJTUVPVVQ9MApDT05GSUdfREVURUNUX0hVTkdfVEFTSz15CkNPTkZJR19ERUZBVUxU
X0hVTkdfVEFTS19USU1FT1VUPTEyMAojIENPTkZJR19CT09UUEFSQU1fSFVOR19UQVNLX1BBTklD
IGlzIG5vdCBzZXQKIyBDT05GSUdfV1FfV0FUQ0hET0cgaXMgbm90IHNldApDT05GSUdfVEVTVF9M
T0NLVVA9bQojIGVuZCBvZiBEZWJ1ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5ncwoKIwojIFNjaGVk
dWxlciBEZWJ1Z2dpbmcKIwojIGVuZCBvZiBTY2hlZHVsZXIgRGVidWdnaW5nCgojIENPTkZJR19E
RUJVR19USU1FS0VFUElORyBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19QUkVFTVBUPXkKCiMKIyBM
b2NrIERlYnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4pCiMKQ09ORklHX0xPQ0tf
REVCVUdHSU5HX1NVUFBPUlQ9eQojIENPTkZJR19QUk9WRV9MT0NLSU5HIGlzIG5vdCBzZXQKIyBD
T05GSUdfTE9DS19TVEFUIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1JUX01VVEVYRVM9eQpDT05G
SUdfREVCVUdfU1BJTkxPQ0s9eQpDT05GSUdfREVCVUdfTVVURVhFUz15CiMgQ09ORklHX0RFQlVH
X1dXX01VVEVYX1NMT1dQQVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUldTRU1TIGlzIG5v
dCBzZXQKQ09ORklHX0RFQlVHX0xPQ0tfQUxMT0M9eQpDT05GSUdfTE9DS0RFUD15CkNPTkZJR19M
T0NLREVQX0JJVFM9MTUKQ09ORklHX0xPQ0tERVBfQ0hBSU5TX0JJVFM9MTYKQ09ORklHX0xPQ0tE
RVBfU1RBQ0tfVFJBQ0VfQklUUz0xOQpDT05GSUdfTE9DS0RFUF9TVEFDS19UUkFDRV9IQVNIX0JJ
VFM9MTQKQ09ORklHX0xPQ0tERVBfQ0lSQ1VMQVJfUVVFVUVfQklUUz0xMgojIENPTkZJR19ERUJV
R19MT0NLREVQIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfQVRPTUlDX1NMRUVQIGlzIG5vdCBz
ZXQKQ09ORklHX0RFQlVHX0xPQ0tJTkdfQVBJX1NFTEZURVNUUz15CkNPTkZJR19MT0NLX1RPUlRV
UkVfVEVTVD1tCkNPTkZJR19XV19NVVRFWF9TRUxGVEVTVD1tCiMgQ09ORklHX1NDRl9UT1JUVVJF
X1RFU1QgaXMgbm90IHNldAojIENPTkZJR19DU0RfTE9DS19XQUlUX0RFQlVHIGlzIG5vdCBzZXQK
IyBlbmQgb2YgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKQoKQ09O
RklHX1RSQUNFX0lSUUZMQUdTPXkKIyBDT05GSUdfREVCVUdfSVJRRkxBR1MgaXMgbm90IHNldApD
T05GSUdfU1RBQ0tUUkFDRT15CkNPTkZJR19XQVJOX0FMTF9VTlNFRURFRF9SQU5ET009eQojIENP
TkZJR19ERUJVR19LT0JKRUNUIGlzIG5vdCBzZXQKCiMKIyBEZWJ1ZyBrZXJuZWwgZGF0YSBzdHJ1
Y3R1cmVzCiMKQ09ORklHX0RFQlVHX0xJU1Q9eQpDT05GSUdfREVCVUdfUExJU1Q9eQpDT05GSUdf
REVCVUdfU0c9eQpDT05GSUdfREVCVUdfTk9USUZJRVJTPXkKIyBDT05GSUdfQlVHX09OX0RBVEFf
Q09SUlVQVElPTiBpcyBub3Qgc2V0CiMgZW5kIG9mIERlYnVnIGtlcm5lbCBkYXRhIHN0cnVjdHVy
ZXMKCkNPTkZJR19ERUJVR19DUkVERU5USUFMUz15CgojCiMgUkNVIERlYnVnZ2luZwojCkNPTkZJ
R19UT1JUVVJFX1RFU1Q9bQojIENPTkZJR19SQ1VfU0NBTEVfVEVTVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1JDVV9UT1JUVVJFX1RFU1QgaXMgbm90IHNldApDT05GSUdfUkNVX1JFRl9TQ0FMRV9URVNU
PW0KQ09ORklHX1JDVV9DUFVfU1RBTExfVElNRU9VVD0yMQpDT05GSUdfUkNVX0VYUF9DUFVfU1RB
TExfVElNRU9VVD0wCkNPTkZJR19SQ1VfVFJBQ0U9eQpDT05GSUdfUkNVX0VRU19ERUJVRz15CiMg
ZW5kIG9mIFJDVSBEZWJ1Z2dpbmcKCiMgQ09ORklHX0RFQlVHX1dRX0ZPUkNFX1JSX0NQVSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NQVV9IT1RQTFVHX1NUQVRFX0NPTlRST0wgaXMgbm90IHNldApDT05G
SUdfTk9QX1RSQUNFUj15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX1RSQUNFUj15CkNPTkZJR19IQVZF
X0ZVTkNUSU9OX0dSQVBIX1RSQUNFUj15CkNPTkZJR19IQVZFX0RZTkFNSUNfRlRSQUNFPXkKQ09O
RklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19G
VFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFM9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRI
X0FSR1M9eQpDT05GSUdfSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRD15CkNPTkZJR19IQVZFX1NZ
U0NBTExfVFJBQ0VQT0lOVFM9eQpDT05GSUdfSEFWRV9GRU5UUlk9eQpDT05GSUdfSEFWRV9OT1Bf
TUNPVU5UPXkKQ09ORklHX1RSQUNFUl9NQVhfVFJBQ0U9eQpDT05GSUdfVFJBQ0VfQ0xPQ0s9eQpD
T05GSUdfUklOR19CVUZGRVI9eQpDT05GSUdfRVZFTlRfVFJBQ0lORz15CkNPTkZJR19DT05URVhU
X1NXSVRDSF9UUkFDRVI9eQpDT05GSUdfUklOR19CVUZGRVJfQUxMT1dfU1dBUD15CkNPTkZJR19Q
UkVFTVBUSVJRX1RSQUNFUE9JTlRTPXkKQ09ORklHX1RSQUNJTkc9eQpDT05GSUdfR0VORVJJQ19U
UkFDRVI9eQpDT05GSUdfVFJBQ0lOR19TVVBQT1JUPXkKQ09ORklHX0ZUUkFDRT15CiMgQ09ORklH
X0JPT1RUSU1FX1RSQUNJTkcgaXMgbm90IHNldApDT05GSUdfRlVOQ1RJT05fVFJBQ0VSPXkKIyBD
T05GSUdfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSIGlzIG5vdCBzZXQKQ09ORklHX0RZTkFNSUNfRlRS
QUNFPXkKQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUz15CkNPTkZJR19EWU5BTUlDX0ZU
UkFDRV9XSVRIX0RJUkVDVF9DQUxMUz15CkNPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1M9
eQojIENPTkZJR19GVU5DVElPTl9QUk9GSUxFUiBpcyBub3Qgc2V0CkNPTkZJR19TVEFDS19UUkFD
RVI9eQpDT05GSUdfVFJBQ0VfUFJFRU1QVF9UT0dHTEU9eQpDT05GSUdfSVJRU09GRl9UUkFDRVI9
eQpDT05GSUdfUFJFRU1QVF9UUkFDRVI9eQpDT05GSUdfU0NIRURfVFJBQ0VSPXkKIyBDT05GSUdf
SFdMQVRfVFJBQ0VSIGlzIG5vdCBzZXQKQ09ORklHX09TTk9JU0VfVFJBQ0VSPXkKIyBDT05GSUdf
VElNRVJMQVRfVFJBQ0VSIGlzIG5vdCBzZXQKQ09ORklHX0ZUUkFDRV9TWVNDQUxMUz15CkNPTkZJ
R19UUkFDRVJfU05BUFNIT1Q9eQpDT05GSUdfVFJBQ0VSX1NOQVBTSE9UX1BFUl9DUFVfU1dBUD15
CkNPTkZJR19UUkFDRV9CUkFOQ0hfUFJPRklMSU5HPXkKIyBDT05GSUdfQlJBTkNIX1BST0ZJTEVf
Tk9ORSBpcyBub3Qgc2V0CkNPTkZJR19QUk9GSUxFX0FOTk9UQVRFRF9CUkFOQ0hFUz15CkNPTkZJ
R19UUkFDSU5HX0JSQU5DSEVTPXkKQ09ORklHX0JSQU5DSF9UUkFDRVI9eQojIENPTkZJR19LUFJP
QkVfRVZFTlRTIGlzIG5vdCBzZXQKQ09ORklHX0RZTkFNSUNfRVZFTlRTPXkKQ09ORklHX0ZUUkFD
RV9NQ09VTlRfUkVDT1JEPXkKQ09ORklHX0ZUUkFDRV9NQ09VTlRfVVNFX0NDPXkKQ09ORklHX1RS
QUNJTkdfTUFQPXkKQ09ORklHX1NZTlRIX0VWRU5UUz15CkNPTkZJR19ISVNUX1RSSUdHRVJTPXkK
Q09ORklHX1RSQUNFX0VWRU5UX0lOSkVDVD15CkNPTkZJR19UUkFDRVBPSU5UX0JFTkNITUFSSz15
CiMgQ09ORklHX1JJTkdfQlVGRkVSX0JFTkNITUFSSyBpcyBub3Qgc2V0CiMgQ09ORklHX1RSQUNF
X0VWQUxfTUFQX0ZJTEUgaXMgbm90IHNldApDT05GSUdfRlRSQUNFX1JFQ09SRF9SRUNVUlNJT049
eQpDT05GSUdfRlRSQUNFX1JFQ09SRF9SRUNVUlNJT05fU0laRT0xMjgKIyBDT05GSUdfUklOR19C
VUZGRVJfUkVDT1JEX1JFQ1VSU0lPTiBpcyBub3Qgc2V0CkNPTkZJR19HQ09WX1BST0ZJTEVfRlRS
QUNFPXkKIyBDT05GSUdfRlRSQUNFX1NUQVJUVVBfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JJ
TkdfQlVGRkVSX1NUQVJUVVBfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19SSU5HX0JVRkZFUl9WQUxJ
REFURV9USU1FX0RFTFRBUz15CkNPTkZJR19QUkVFTVBUSVJRX0RFTEFZX1RFU1Q9bQojIENPTkZJ
R19TWU5USF9FVkVOVF9HRU5fVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19ISVNUX1RSSUdHRVJTX0RF
QlVHPXkKIyBDT05GSUdfU0FNUExFUyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX1NBTVBMRV9GVFJB
Q0VfRElSRUNUPXkKQ09ORklHX0hBVkVfU0FNUExFX0ZUUkFDRV9ESVJFQ1RfTVVMVEk9eQpDT05G
SUdfQVJDSF9IQVNfREVWTUVNX0lTX0FMTE9XRUQ9eQpDT05GSUdfU1RSSUNUX0RFVk1FTT15CiMg
Q09ORklHX0lPX1NUUklDVF9ERVZNRU0gaXMgbm90IHNldAoKIwojIHMzOTAgRGVidWdnaW5nCiMK
Q09ORklHX0VBUkxZX1BSSU5USz15CkNPTkZJR19ERUJVR19FTlRSWT15CkNPTkZJR19DSU9fSU5K
RUNUPXkKIyBlbmQgb2YgczM5MCBEZWJ1Z2dpbmcKCiMKIyBLZXJuZWwgVGVzdGluZyBhbmQgQ292
ZXJhZ2UKIwojIENPTkZJR19LVU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX05PVElGSUVSX0VSUk9S
X0lOSkVDVElPTiBpcyBub3Qgc2V0CkNPTkZJR19GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT049eQoj
IENPTkZJR19GQVVMVF9JTkpFQ1RJT04gaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfS0NPVj15
CkNPTkZJR19DQ19IQVNfU0FOQ09WX1RSQUNFX1BDPXkKIyBDT05GSUdfS0NPViBpcyBub3Qgc2V0
CiMgQ09ORklHX1JVTlRJTUVfVEVTVElOR19NRU5VIGlzIG5vdCBzZXQKIyBlbmQgb2YgS2VybmVs
IFRlc3RpbmcgYW5kIENvdmVyYWdlCiMgZW5kIG9mIEtlcm5lbCBoYWNraW5nCg==

--===============8648453262612670697==--

