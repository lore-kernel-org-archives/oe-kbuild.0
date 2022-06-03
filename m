Content-Type: multipart/mixed; boundary="===============7537381994686701405=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/module/decompress.c:215:2: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 03 Jun 2022 19:19:45 +0800
Message-ID: <202206031927.zyTEcclp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7537381994686701405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/mo=
dule/decompress.c:215:2: warning: Value stored to 'error' is never read [cl=
ang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Aaron Tomlin <atomlin@redhat.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50fd82b3a9a9335df5d50c7ddcb81c81d358c4fc
commit: cfc1d277891eb499b3b5354df33b30f598683e90 module: Move all into modu=
le/
date:   9 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20220530 (https://download.01.org/0day-ci/arc=
hive/20220603/202206031927.zyTEcclp-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c4=
8f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcfc1d277891eb499b3b5354df33b30f598683e90
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cfc1d277891eb499b3b5354df33b30f598683e90
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:125:3: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(args->v0.data, kind, args->v0.count);
                   ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:125:3: warning: Null poin=
ter passed as 2nd argument to memory copy function [clang-analyzer-unix.cst=
ring.NullArg]
                   memcpy(args->v0.data, kind, args->v0.count);
                   ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:136:2: note: Control jump=
s to 'case 2:'  at line 139
           switch (mthd) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:139:32: note: Calling 'nv=
km_ummu_kind'
           case NVIF_MMU_V0_KIND: return nvkm_ummu_kind(ummu, argv, argc);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:112:2: note: 'kind' initi=
alized to a null pointer value
           const u8 *kind =3D NULL;
           ^~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:116:6: note: Assuming fie=
ld 'kind' is null
           if (mmu->func->kind)
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:116:2: note: Taking false=
 branch
           if (mmu->func->kind)
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:14: note: Left side o=
f '&&' is true
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
                       ^
   drivers/gpu/drm/nouveau/include/nvif/unpack.h:17:6: note: expanded from =
macro 'nvif_unpack'
           if (_ret =3D=3D -ENOSYS && *_size >=3D sizeof(m) &&             =
             \
               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:14: note: Assuming th=
e condition is true
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
                       ^
   drivers/gpu/drm/nouveau/include/nvif/unpack.h:17:25: note: expanded from=
 macro 'nvif_unpack'
           if (_ret =3D=3D -ENOSYS && *_size >=3D sizeof(m) &&             =
             \
                                  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:14: note: Left side o=
f '&&' is true
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
                       ^
   drivers/gpu/drm/nouveau/include/nvif/unpack.h:17:6: note: expanded from =
macro 'nvif_unpack'
           if (_ret =3D=3D -ENOSYS && *_size >=3D sizeof(m) &&             =
             \
               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:14: note: Assuming '_=
vl' is <=3D field 'version'
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
                       ^
   drivers/gpu/drm/nouveau/include/nvif/unpack.h:18:6: note: expanded from =
macro 'nvif_unpack'
               (m).version >=3D _vl && (m).version <=3D _vh) {             =
           \
               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:14: note: Left side o=
f '&&' is true
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
                       ^
   drivers/gpu/drm/nouveau/include/nvif/unpack.h:17:6: note: expanded from =
macro 'nvif_unpack'
           if (_ret =3D=3D -ENOSYS && *_size >=3D sizeof(m) &&             =
             \
               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:14: note: Assuming '_=
vh' is >=3D field 'version'
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
                       ^
   drivers/gpu/drm/nouveau/include/nvif/unpack.h:18:28: note: expanded from=
 macro 'nvif_unpack'
               (m).version >=3D _vl && (m).version <=3D _vh) {             =
           \
                                     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:14: note: Taking true=
 branch
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
                       ^
   drivers/gpu/drm/nouveau/include/nvif/unpack.h:17:2: note: expanded from =
macro 'nvif_unpack'
           if (_ret =3D=3D -ENOSYS && *_size >=3D sizeof(m) &&             =
             \
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:14: note: Taking fals=
e branch
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
                       ^
   drivers/gpu/drm/nouveau/include/nvif/unpack.h:21:3: note: expanded from =
macro 'nvif_unpack'
                   if (_ret =3D 0, !(x)) {                                 =
         \
                   ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:8: note: Assuming 're=
t' is 0
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
                 ^~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:119:2: note: Taking true =
branch
           if (!(ret =3D nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, tru=
e))) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:120:7: note: Assuming the=
 condition is false
                   if (argc !=3D args->v0.count * sizeof(*args->v0.data))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:120:3: note: Taking false=
 branch
                   if (argc !=3D args->v0.count * sizeof(*args->v0.data))
                   ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:122:7: note: Assuming 'co=
unt' is >=3D field 'count'
                   if (args->v0.count > count)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:122:3: note: Taking false=
 branch
                   if (args->v0.count > count)
                   ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c:125:3: note: Null pointer=
 passed as 2nd argument to memory copy function
                   memcpy(args->v0.data, kind, args->v0.count);
                   ^                     ~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   kernel/module/decompress.c:26:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_pages, info->pages, info->max_pages * sizeof(info->pa=
ges));
           ^~~~~~
   kernel/module/decompress.c:26:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(new_pages, info->pages, info->max_pages * sizeof(info->pa=
ges));
           ^~~~~~
>> kernel/module/decompress.c:215:2: warning: Value stored to 'error' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           error =3D module_extend_max_pages(info, n_pages);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/decompress.c:215:2: note: Value stored to 'error' is never=
 read
           error =3D module_extend_max_pages(info, n_pages);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   kernel/module/signing.c:31:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ms, mod + (modlen - sizeof(ms)), sizeof(ms));
           ^~~~~~
   kernel/module/signing.c:31:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&ms, mod + (modlen - sizeof(ms)), sizeof(ms));
           ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   kernel/stacktrace.c:56:15: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   generated =3D snprintf(buf, size, "%*c%pS\n", 1 + spaces=
, ' ',
                               ^~~~~~~~
   kernel/stacktrace.c:56:15: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
                   generated =3D snprintf(buf, size, "%*c%pS\n", 1 + spaces=
, ' ',
                               ^~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/virtio/virtio.c:17:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%04x\n", dev->id.device);
                  ^~~~~~~
   drivers/virtio/virtio.c:17:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%04x\n", dev->id.device);
                  ^~~~~~~
   drivers/virtio/virtio.c:25:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%04x\n", dev->id.vendor);
                  ^~~~~~~
   drivers/virtio/virtio.c:25:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%04x\n", dev->id.vendor);
                  ^~~~~~~
   drivers/virtio/virtio.c:33:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", dev->config->get_status(dev));
                  ^~~~~~~
   drivers/virtio/virtio.c:33:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", dev->config->get_status(dev));
                  ^~~~~~~
   drivers/virtio/virtio.c:41:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "virtio:d%08Xv%08X\n",
                  ^~~~~~~
   drivers/virtio/virtio.c:41:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "virtio:d%08Xv%08X\n",
                  ^~~~~~~
   drivers/virtio/virtio.c:56:10: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf+len, "%c",
                          ^~~~~~~
   drivers/virtio/virtio.c:56:10: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf+len, "%c",
                          ^~~~~~~
   drivers/virtio/virtio.c:58:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf+len, "\n");
                  ^~~~~~~
   drivers/virtio/virtio.c:58:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf+len, "\n");
                  ^~~~~~~
   drivers/virtio/virtio.c:378:8: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(compat, sizeof(compat), "virtio,device%x", dev-=
>id.device);
                 ^~~~~~~~
   drivers/virtio/virtio.c:378:8: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(compat, sizeof(compat), "virtio,device%x", dev-=
>id.device);
                 ^~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   security/keys/persistent.c:83:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&index_key, 0, sizeof(index_key));
           ^~~~~~
   security/keys/persistent.c:83:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&index_key, 0, sizeof(index_key));
           ^~~~~~
   security/keys/persistent.c:86:23: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           index_key.desc_len =3D sprintf(buf, "_persistent.%u", from_kuid(=
ns, uid));
                                ^~~~~~~
   security/keys/persistent.c:86:23: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           index_key.desc_len =3D sprintf(buf, "_persistent.%u", from_kuid(=
ns, uid));
                                ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   security/keys/keyctl_pkey.c:86:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(params, 0, sizeof(*params));

vim +/error +215 kernel/module/decompress.c

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  203  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  204  =
int module_decompress(struct load_info *info, const void *buf, size_t size)
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  205  {
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  206  =
	unsigned int n_pages;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  207  =
	ssize_t data_size;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  208  =
	int error;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  209  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  210  =
	/*
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  211  =
	 * Start with number of pages twice as big as needed for
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  212  =
	 * compressed data.
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  213  =
	 */
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  214  =
	n_pages =3D DIV_ROUND_UP(size, PAGE_SIZE) * 2;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05 @215  =
	error =3D module_extend_max_pages(info, n_pages);
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  216  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  217  =
	data_size =3D MODULE_DECOMPRESS_FN(info, buf, size);
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  218  =
	if (data_size < 0) {
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  219  =
		error =3D data_size;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  220  =
		goto err;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  221  =
	}
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  222  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  223  =
	info->hdr =3D vmap(info->pages, info->used_pages, VM_MAP, PAGE_KERNEL);
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  224  =
	if (!info->hdr) {
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  225  =
		error =3D -ENOMEM;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  226  =
		goto err;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  227  =
	}
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  228  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  229  =
	info->len =3D data_size;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  230  =
	return 0;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  231  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  232  =
err:
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  233  =
	module_decompress_cleanup(info);
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  234  =
	return error;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  235  }
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  236  =


:::::: The code at line 215 was first introduced by commit
:::::: b1ae6dc41eaaa98bb75671e0f3665bfda248c3e7 module: add in-kernel suppo=
rt for decompressing

:::::: TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7537381994686701405==--

