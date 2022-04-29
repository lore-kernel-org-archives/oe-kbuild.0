Content-Type: multipart/mixed; boundary="===============3839450234531379118=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [thierryreding:for-5.19/work 141/141] drivers/iommu/of_iommu.c:237:5: warning: Value stored to 'end' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 29 Apr 2022 19:24:51 +0800
Message-ID: <202204291911.7pvsSTui-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3839450234531379118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thierry Reding <treding@nvidia.com>

tree:   https://github.com/thierryreding/linux for-5.19/work
head:   a39ec325554470289e8384e30d06a22960d1dd7b
commit: a39ec325554470289e8384e30d06a22960d1dd7b [141/141] WIP
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220428 (https://download.01.org/0day-ci/archi=
ve/20220429/202204291911.7pvsSTui-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473=
aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/thierryreding/linux/commit/a39ec325554470289e8=
384e30d06a22960d1dd7b
        git remote add thierryreding https://github.com/thierryreding/linux
        git fetch --no-tags thierryreding for-5.19/work
        git checkout a39ec325554470289e8384e30d06a22960d1dd7b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/btrfs/ctree.c:409:6: note: Assuming 'level' is not equal to 0
           if (level =3D=3D 0)
               ^~~~~~~~~~
   fs/btrfs/ctree.c:409:2: note: Taking false branch
           if (level =3D=3D 0)
           ^
   fs/btrfs/ctree.c:414:7: note: Assuming the condition is true
           if ((root->root_key.objectid =3D=3D BTRFS_TREE_RELOC_OBJECTID) &=
& parent)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ctree.c:414:6: note: Left side of '&&' is true
           if ((root->root_key.objectid =3D=3D BTRFS_TREE_RELOC_OBJECTID) &=
& parent)
               ^
   fs/btrfs/ctree.c:414:6: note: Assuming pointer value is null
           if ((root->root_key.objectid =3D=3D BTRFS_TREE_RELOC_OBJECTID) &=
& parent)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/btrfs/ctree.c:414:64: note: Assuming 'parent' is null
           if ((root->root_key.objectid =3D=3D BTRFS_TREE_RELOC_OBJECTID) &=
& parent)
                                                                         ^~=
~~~~
   fs/btrfs/ctree.c:414:2: note: Taking false branch
           if ((root->root_key.objectid =3D=3D BTRFS_TREE_RELOC_OBJECTID) &=
& parent)
           ^
   fs/btrfs/ctree.c:420:2: note: Taking false branch
           if (IS_ERR(cow))
           ^
   fs/btrfs/ctree.c:431:6: note: Assuming the condition is false
           if (root->root_key.objectid =3D=3D BTRFS_TREE_RELOC_OBJECTID)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ctree.c:431:2: note: Taking false branch
           if (root->root_key.objectid =3D=3D BTRFS_TREE_RELOC_OBJECTID)
           ^
   fs/btrfs/ctree.c:439:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   fs/btrfs/ctree.c:439:2: note: Taking false branch
           if (ret) {
           ^
   fs/btrfs/ctree.c:446:6: note: Assuming the condition is false
           if (test_bit(BTRFS_ROOT_SHAREABLE, &root->state)) {
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   fs/btrfs/ctree.c:446:2: note: Taking false branch
           if (test_bit(BTRFS_ROOT_SHAREABLE, &root->state)) {
           ^
   fs/btrfs/ctree.c:456:6: note: Assuming 'buf' is not equal to field 'node'
           if (buf =3D=3D root->node) {
               ^~~~~~~~~~~~~~~~~
   fs/btrfs/ctree.c:456:2: note: Taking false branch
           if (buf =3D=3D root->node) {
           ^
   fs/btrfs/ctree.c:472:53: note: Passing null pointer value via 1st parame=
ter 'eb'
                   WARN_ON(trans->transid !=3D btrfs_header_generation(pare=
nt));
                                                                     ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/ctree.c:472:29: note: Calling 'btrfs_header_generation'
                   WARN_ON(trans->transid !=3D btrfs_header_generation(pare=
nt));
                                             ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/ctree.h:2215:1: note: Array access (via field 'pages') results =
in a null pointer dereference
   BTRFS_SETGET_HEADER_FUNCS(header_generation, struct btrfs_header,
   ^
   fs/btrfs/ctree.h:1667:31: note: expanded from macro 'BTRFS_SETGET_HEADER=
_FUNCS'
           const type *p =3D page_address(eb->pages[0]) +                  =
  \
                                        ^   ~~~~~
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/iommu/of_iommu.c:202:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&res, 0, sizeof(res));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/iommu/of_iommu.c:202:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(&res, 0, sizeof(res));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> drivers/iommu/of_iommu.c:237:5: warning: Value stored to 'end' is never =
read [clang-analyzer-deadcode.DeadStores]
                                   end =3D start + length - 1;
                                   ^     ~~~~~~~~~~~~~~~~~~
   drivers/iommu/of_iommu.c:237:5: note: Value stored to 'end' is never read
                                   end =3D start + length - 1;
                                   ^     ~~~~~~~~~~~~~~~~~~
   Suppressed 50 warnings (48 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/char/virtio_console.c:682:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((__force char *)out_buf, buf->buf + buf->offset,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:682:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy((__force char *)out_buf, buf->buf + buf->offset,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:897:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(page_address(page) + offset, src + buf->offset, l=
en);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:897:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(page_address(page) + offset, src + buf->offset, l=
en);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:1283:9: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           return sprintf(buffer, "%s\n", port->name);
                  ^~~~~~~
   drivers/char/virtio_console.c:1283:9: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           return sprintf(buffer, "%s\n", port->name);
                  ^~~~~~~
   drivers/char/virtio_console.c:1464:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u",
           ^~~~~~~~
   drivers/char/virtio_console.c:1464:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u",
           ^~~~~~~~
   drivers/char/virtio_console.c:1625:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&size, buf->buf + buf->offset + sizeof(*cpkt),
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/char/virtio_console.c:1625:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&size, buf->buf + buf->offset + sizeof(*cpkt),
                   ^

vim +/end +237 drivers/iommu/of_iommu.c

66e3b4ba9a4d92 Thierry Reding 2019-08-20  178  =

66e3b4ba9a4d92 Thierry Reding 2019-08-20  179  /**
66e3b4ba9a4d92 Thierry Reding 2019-08-20  180   * of_iommu_get_resv_regions=
 - reserved region driver helper for device tree
66e3b4ba9a4d92 Thierry Reding 2019-08-20  181   * @dev: device for which to=
 get reserved regions
66e3b4ba9a4d92 Thierry Reding 2019-08-20  182   * @list: reserved region li=
st
66e3b4ba9a4d92 Thierry Reding 2019-08-20  183   *
66e3b4ba9a4d92 Thierry Reding 2019-08-20  184   * IOMMU drivers can use thi=
s to implement their .get_resv_regions() callback
66e3b4ba9a4d92 Thierry Reding 2019-08-20  185   * for memory regions attach=
ed to a device tree node. See the reserved-memory
66e3b4ba9a4d92 Thierry Reding 2019-08-20  186   * device tree bindings on h=
ow to use these:
66e3b4ba9a4d92 Thierry Reding 2019-08-20  187   *
66e3b4ba9a4d92 Thierry Reding 2019-08-20  188   *   Documentation/devicetre=
e/bindings/reserved-memory/reserved-memory.txt
66e3b4ba9a4d92 Thierry Reding 2019-08-20  189   */
66e3b4ba9a4d92 Thierry Reding 2019-08-20  190  void of_iommu_get_resv_regio=
ns(struct device *dev, struct list_head *list)
66e3b4ba9a4d92 Thierry Reding 2019-08-20  191  {
66e3b4ba9a4d92 Thierry Reding 2019-08-20  192  #if IS_ENABLED(CONFIG_OF_ADD=
RESS)
66e3b4ba9a4d92 Thierry Reding 2019-08-20  193  	struct of_phandle_iterator =
it;
66e3b4ba9a4d92 Thierry Reding 2019-08-20  194  	int err;
66e3b4ba9a4d92 Thierry Reding 2019-08-20  195  =

a39ec325554470 Thierry Reding 2022-04-25  196  	of_for_each_phandle(&it, er=
r, dev->of_node, "memory-region", NULL, 0) {
66e3b4ba9a4d92 Thierry Reding 2019-08-20  197  		struct iommu_resv_region *=
region;
66e3b4ba9a4d92 Thierry Reding 2019-08-20  198  		struct resource res;
a39ec325554470 Thierry Reding 2022-04-25  199  		const __be32 *maps;
a39ec325554470 Thierry Reding 2022-04-25  200  		int size;
66e3b4ba9a4d92 Thierry Reding 2019-08-20  201  =

a39ec325554470 Thierry Reding 2022-04-25  202  		memset(&res, 0, sizeof(res=
));
66e3b4ba9a4d92 Thierry Reding 2019-08-20  203  =

a39ec325554470 Thierry Reding 2022-04-25  204  		/*
a39ec325554470 Thierry Reding 2022-04-25  205  		 * The "reg" property is o=
ptional and can be omitted by reserved-memory regions
a39ec325554470 Thierry Reding 2022-04-25  206  		 * that represent reservat=
ions in the IOVA space, which are regions that should
a39ec325554470 Thierry Reding 2022-04-25  207  		 * not be mapped.
a39ec325554470 Thierry Reding 2022-04-25  208  		 */
a39ec325554470 Thierry Reding 2022-04-25  209  		if (of_find_property(it.no=
de, "reg", NULL)) {
66e3b4ba9a4d92 Thierry Reding 2019-08-20  210  			err =3D of_address_to_res=
ource(it.node, 0, &res);
66e3b4ba9a4d92 Thierry Reding 2019-08-20  211  			if (err < 0) {
66e3b4ba9a4d92 Thierry Reding 2019-08-20  212  				dev_err(dev, "failed to =
parse memory region %pOF: %d\n",
66e3b4ba9a4d92 Thierry Reding 2019-08-20  213  					it.node, err);
66e3b4ba9a4d92 Thierry Reding 2019-08-20  214  				continue;
66e3b4ba9a4d92 Thierry Reding 2019-08-20  215  			}
a39ec325554470 Thierry Reding 2022-04-25  216  		}
a39ec325554470 Thierry Reding 2022-04-25  217  =

a39ec325554470 Thierry Reding 2022-04-25  218  		maps =3D of_get_property(i=
t.node, "iommu-addresses", &size);
a39ec325554470 Thierry Reding 2022-04-25  219  		if (maps) {
a39ec325554470 Thierry Reding 2022-04-25  220  			const __be32 *end =3D map=
s + size / sizeof(__be32);
a39ec325554470 Thierry Reding 2022-04-25  221  			struct device_node *np;
a39ec325554470 Thierry Reding 2022-04-25  222  			unsigned int index =3D 0;
a39ec325554470 Thierry Reding 2022-04-25  223  			u32 phandle;
a39ec325554470 Thierry Reding 2022-04-25  224  			int na, ns;
a39ec325554470 Thierry Reding 2022-04-25  225  =

a39ec325554470 Thierry Reding 2022-04-25  226  			while (maps < end) {
a39ec325554470 Thierry Reding 2022-04-25  227  				phys_addr_t start, end;
a39ec325554470 Thierry Reding 2022-04-25  228  				size_t length;
a39ec325554470 Thierry Reding 2022-04-25  229  =

a39ec325554470 Thierry Reding 2022-04-25  230  				phandle =3D be32_to_cpup=
(maps++);
a39ec325554470 Thierry Reding 2022-04-25  231  				np =3D of_find_node_by_p=
handle(phandle);
a39ec325554470 Thierry Reding 2022-04-25  232  				na =3D of_n_addr_cells(n=
p);
a39ec325554470 Thierry Reding 2022-04-25  233  				ns =3D of_n_size_cells(n=
p);
a39ec325554470 Thierry Reding 2022-04-25  234  =

a39ec325554470 Thierry Reding 2022-04-25  235  				start =3D of_translate_d=
ma_address(np, maps);
a39ec325554470 Thierry Reding 2022-04-25  236  				length =3D of_read_numbe=
r(maps + na, ns);
a39ec325554470 Thierry Reding 2022-04-25 @237  				end =3D start + length -=
 1;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3839450234531379118==--

