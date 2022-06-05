Content-Type: multipart/mixed; boundary="===============0549995434383499508=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 25/29] drivers/gpu/drm/rcar-du/rcar_du_of.c:231:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argume...
Date: Sun, 05 Jun 2022 09:15:47 +0800
Message-ID: <202206050915.zPFF7aSt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0549995434383499508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/gpu/drm/rcar-du/rcar_du_of.c:231:2: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   eac8b965b3d595180654d8895d89bf1c21dba722
commit: 56f22b8f6853d26be82709a978e89db6856af6b4 [25/29] BACKPORT: Kbuild: =
move to -std=3Dgnu11
:::::: branch date: 28 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220605 (https://download.01.org/0day-ci/archi=
ve/20220605/202206050915.zPFF7aSt-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 56f22b8f6853d26be82709a978e89db6856af6b4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:267:3: note: Taking true branch
                   if (!lvds->remote)
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:268:4: note:  Execution continues o=
n line 243
                           continue;
                           ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:243:2: note: Loop condition is fals=
e. Execution continues on line 278
           for (i =3D 0; i < info->num_lvds; ++i) {
           ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:280:6: note: Assuming 'ret' is >=3D=
 0
           if (ret < 0)
               ^~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:280:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:284:35: note: Assuming 'lvds_node' =
is not equal to null
           for_each_child_of_node(soc_node, lvds_node) {
                                            ^
   include/linux/of.h:1270:48: note: expanded from macro 'for_each_child_of=
_node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
                                                         ^~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:284:2: note: Loop condition is true=
.  Entering loop body
           for_each_child_of_node(soc_node, lvds_node) {
           ^
   include/linux/of.h:1270:2: note: expanded from macro 'for_each_child_of_=
node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
           ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:287:7: note: Assuming the condition=
 is false
                   if (!of_device_is_compatible(lvds_node, compatible))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:287:3: note: Taking false branch
                   if (!of_device_is_compatible(lvds_node, compatible))
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:292:7: note: Assuming 'ret' is >=3D=
 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:292:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:295:3: note: Loop condition is true=
.  Entering loop body
                   for (i =3D 0; i < ARRAY_SIZE(lvds_data); ++i) {
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:296:8: note: Assuming 'lvds_data[i]=
.res.start' is not equal to 'res.start'
                           if (lvds_data[i].res.start =3D=3D res.start)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:296:4: note: Taking false branch
                           if (lvds_data[i].res.start =3D=3D res.start)
                           ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:295:3: note: Loop condition is true=
.  Entering loop body
                   for (i =3D 0; i < ARRAY_SIZE(lvds_data); ++i) {
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:296:8: note: Assuming 'lvds_data[i]=
.res.start' is equal to 'res.start'
                           if (lvds_data[i].res.start =3D=3D res.start)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:296:4: note: Taking true branch
                           if (lvds_data[i].res.start =3D=3D res.start)
                           ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:297:5: note:  Execution continues o=
n line 300
                                   break;
                                   ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:300:3: note: Taking false branch
                   if (i =3D=3D ARRAY_SIZE(lvds_data))
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:306:8: note: Passing null pointer v=
alue via 4th parameter 'remote'
                                             lvds_data[i].remote);
                                             ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:304:3: note: Calling 'rcar_du_of_lv=
ds_patch_one'
                   rcar_du_of_lvds_patch_one(lvds_node, &lvds_data[i].clksp=
ec,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:138:6: note: Assuming the condition=
 is false
           if (clk->args_count >=3D ARRAY_SIZE(value) - 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:138:2: note: Taking false branch
           if (clk->args_count >=3D ARRAY_SIZE(value) - 1)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:144:14: note: Assuming 'i' is >=3D =
field 'args_count'
           for (i =3D 0; i < clk->args_count; ++i)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:144:2: note: Loop condition is fals=
e. Execution continues on line 147
           for (i =3D 0; i < clk->args_count; ++i)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:150:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:150:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_of.c:162:13: note: Access to field 'phan=
dle' results in a dereference of a null pointer (loaded from variable 'remo=
te')
           value[1] =3D cpu_to_be32(remote->phandle);
                      ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^
   include/uapi/linux/byteorder/little_endian.h:39:43: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                             ^         ~
   include/uapi/linux/swab.h:115:53: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                       ^~
>> drivers/gpu/drm/rcar-du/rcar_du_of.c:231:2: warning: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrU=
nsafeBufferHandling]
           sprintf(compatible, "renesas,%s-lvds", soc_name);
           ^~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:231:2: note: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11
           sprintf(compatible, "renesas,%s-lvds", soc_name);
           ^~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:249:3: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "lvds.%u", i);
                   ^~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:249:3: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(name, "lvds.%u", i);
                   ^~~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
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
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/input/misc/yealink.c:288:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:288:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:305:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p->data, &buf[ix], len);
                   ^~~~~~
   drivers/input/misc/yealink.c:305:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(p->data, &buf[ix], len);
                   ^~~~~~
   drivers/input/misc/yealink.c:321:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:321:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:516:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:516:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(yld->ctl_data, 0, sizeof(*(yld->ctl_data)));
           ^~~~~~
   drivers/input/misc/yealink.c:558:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &map_seg7, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:558:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &map_seg7, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:567:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&map_seg7, buf, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:567:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&map_seg7, buf, sizeof(map_seg7));
           ^~~~~~
   drivers/input/misc/yealink.c:691:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   ret +=3D sprintf(&buf[ret], "%s %s\n",
                          ^~~~~~~
   drivers/input/misc/yealink.c:691:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   ret +=3D sprintf(&buf[ret], "%s %s\n",
                          ^~~~~~~
   drivers/input/misc/yealink.c:979:2: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/yealink.c:979:2: note: Value stored to 'ret' is never=
 read
           ret =3D sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/mtd/mtdoops.c:203:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cxt->oops_buf, 0xff, record_size);
           ^~~~~~
   drivers/mtd/mtdoops.c:203:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(cxt->oops_buf, 0xff, record_size);
           ^~~~~~
   drivers/mtd/mtdoops.c:396:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cxt->oops_buf, 0xff, record_size);
           ^~~~~~
   drivers/mtd/mtdoops.c:396:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(cxt->oops_buf, 0xff, record_size);
           ^~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/mtd/chips/cfi_util.c:114:21: warning: The result of the left shi=
ft is undefined due to shifting by '32', which is greater or equal to the w=
idth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRe=
sult]
                   onecmd |=3D (onecmd << (chip_mode * 16));
                                     ^
   drivers/mtd/chips/cfi_util.c:307:6: note: Assuming 'adr' is not equal to=
 0
           if (!adr)
--
   fs/btrfs/check-integrity.c:1340:6: note: Left side of '&&' is true
   fs/btrfs/check-integrity.c:1340:27: note: 'did_alloc_block_link' is 1
           if (limit_nesting > 0 && did_alloc_block_link) {
                                    ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:1340:2: note: Taking true branch
           if (limit_nesting > 0 && did_alloc_block_link) {
           ^
   fs/btrfs/check-integrity.c:1341:9: note: Calling 'btrfsic_read_block'
                   ret =3D btrfsic_read_block(state, next_block_ctx);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:1589:2: note: Taking false branch
           BUG_ON(block_ctx->datav);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/check-integrity.c:1589:2: note: Loop condition is false.  Exiti=
ng loop
           BUG_ON(block_ctx->datav);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/check-integrity.c:1590:2: note: Taking false branch
           BUG_ON(block_ctx->pagev);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/check-integrity.c:1590:2: note: Loop condition is false.  Exiti=
ng loop
           BUG_ON(block_ctx->pagev);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/check-integrity.c:1591:2: note: Taking false branch
           BUG_ON(block_ctx->mem_to_free);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/check-integrity.c:1591:2: note: Loop condition is false.  Exiti=
ng loop
           BUG_ON(block_ctx->mem_to_free);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/check-integrity.c:1592:7: note: Assuming the condition is false
           if (!PAGE_ALIGNED(block_ctx->dev_bytenr)) {
                ^
   include/linux/mm.h:228:28: note: expanded from macro 'PAGE_ALIGNED'
   #define PAGE_ALIGNED(addr)      IS_ALIGNED((unsigned long)(addr), PAGE_S=
IZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/kernel.h:38:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/check-integrity.c:1592:2: note: Taking true branch
           if (!PAGE_ALIGNED(block_ctx->dev_bytenr)) {
           ^
   fs/btrfs/check-integrity.c:1595:3: note: Returning without writing to 'b=
lock_ctx->datav'
                   return -1;
                   ^
   fs/btrfs/check-integrity.c:1341:9: note: Returning from 'btrfsic_read_bl=
ock'
                   ret =3D btrfsic_read_block(state, next_block_ctx);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:1342:7: note: 'ret' is >=3D field 'len'
                   if (ret < (int)next_block_ctx->len) {
                       ^~~
   fs/btrfs/check-integrity.c:1342:3: note: Taking false branch
                   if (ret < (int)next_block_ctx->len) {
                   ^
   fs/btrfs/check-integrity.c:1356:2: note: Returning zero, which participa=
tes in a condition later
           return 0;
           ^~~~~~~~
   fs/btrfs/check-integrity.c:1123:16: note: Returning from 'btrfsic_create=
_link_to_next_block'
                           sf->error =3D btrfsic_create_link_to_next_block(
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:1136:12: note: Field 'error' is 0
                           if (sf->error)
                                   ^
   fs/btrfs/check-integrity.c:1136:4: note: Taking false branch
                           if (sf->error)
                           ^
   fs/btrfs/check-integrity.c:1139:8: note: NULL is not equal to field 'nex=
t_block'
                           if (NULL !=3D sf->next_block) {
                               ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   fs/btrfs/check-integrity.c:1139:4: note: Taking true branch
                           if (NULL !=3D sf->next_block) {
                           ^
   fs/btrfs/check-integrity.c:1142:9: note: Array access (via field 'datav'=
) results in a null pointer dereference
                                       sf->next_block_ctx.datav[0];
                                       ^                  ~~~~~
   fs/btrfs/check-integrity.c:1208:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, kaddr + pgoff, cur);
                   ^~~~~~
   fs/btrfs/check-integrity.c:1208:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, kaddr + pgoff, cur);
                   ^~~~~~
>> fs/btrfs/check-integrity.c:2475:15: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           indent_add =3D sprintf(buf, "%c-%llu(%s/%llu/%u)",
                        ^~~~~~~
   fs/btrfs/check-integrity.c:2475:15: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           indent_add =3D sprintf(buf, "%c-%llu(%s/%llu/%u)",
                        ^~~~~~~
   fs/btrfs/check-integrity.c:2502:17: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           indent_add =3D sprintf(buf, " %d*--> ", l->ref_c=
nt);
                                        ^~~~~~~
   fs/btrfs/check-integrity.c:2502:17: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                           indent_add =3D sprintf(buf, " %d*--> ", l->ref_c=
nt);
                                        ^~~~~~~
   fs/btrfs/check-integrity.c:2504:17: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           indent_add =3D sprintf(buf, " --> ");
                                        ^~~~~~~
   fs/btrfs/check-integrity.c:2504:17: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                           indent_add =3D sprintf(buf, " --> ");
                                        ^~~~~~~
   include/linux/unaligned/packed_struct.h:25:2: warning: Undefined or garb=
age value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ptr->x;
           ^
   fs/btrfs/check-integrity.c:2777:7: note: Assuming the condition is true
           if (!PAGE_ALIGNED(fs_info->nodesize)) {
                ^
   include/linux/mm.h:228:28: note: expanded from macro 'PAGE_ALIGNED'
   #define PAGE_ALIGNED(addr)      IS_ALIGNED((unsigned long)(addr), PAGE_S=
IZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/kernel.h:38:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/check-integrity.c:2777:2: note: Taking false branch
           if (!PAGE_ALIGNED(fs_info->nodesize)) {
           ^
   fs/btrfs/check-integrity.c:2782:7: note: Assuming the condition is true
           if (!PAGE_ALIGNED(fs_info->sectorsize)) {
                ^
   include/linux/mm.h:228:28: note: expanded from macro 'PAGE_ALIGNED'
   #define PAGE_ALIGNED(addr)      IS_ALIGNED((unsigned long)(addr), PAGE_S=
IZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/kernel.h:38:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/check-integrity.c:2782:2: note: Taking false branch
           if (!PAGE_ALIGNED(fs_info->sectorsize)) {
           ^
   fs/btrfs/check-integrity.c:2788:6: note: Assuming 'state' is non-null
           if (!state)
               ^~~~~~
   fs/btrfs/check-integrity.c:2788:2: note: Taking false branch
           if (!state)
           ^
   fs/btrfs/check-integrity.c:2791:6: note: Assuming 'btrfsic_is_initialize=
d' is not equal to 0
           if (!btrfsic_is_initialized) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:2791:2: note: Taking false branch
           if (!btrfsic_is_initialized) {
           ^
   fs/btrfs/check-integrity.c:2809:2: note: Left side of '&&' is false
           list_for_each_entry(device, dev_head, dev_list) {
           ^
   include/linux/list.h:654:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:855:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/check-integrity.c:2809:2: note: Taking false branch
           list_for_each_entry(device, dev_head, dev_list) {
           ^
   include/linux/list.h:654:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/btrfs/check-integrity.c:2809:2: note: Loop condition is false.  Exiti=
ng loop
           list_for_each_entry(device, dev_head, dev_list) {
           ^
   include/linux/list.h:654:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'

vim +231 drivers/gpu/drm/rcar-du/rcar_du_of.c

81c0e3dd829270 Laurent Pinchart 2018-01-10  194  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  195  static void __init rcar_du=
_of_lvds_patch(const struct of_device_id *of_ids)
81c0e3dd829270 Laurent Pinchart 2018-01-10  196  {
81c0e3dd829270 Laurent Pinchart 2018-01-10  197  	const struct rcar_du_devi=
ce_info *info;
81c0e3dd829270 Laurent Pinchart 2018-01-10  198  	const struct of_device_id=
 *match;
81c0e3dd829270 Laurent Pinchart 2018-01-10  199  	struct lvds_of_data lvds_=
data[2] =3D { };
81c0e3dd829270 Laurent Pinchart 2018-01-10  200  	struct device_node *lvds_=
node;
81c0e3dd829270 Laurent Pinchart 2018-01-10  201  	struct device_node *soc_n=
ode;
81c0e3dd829270 Laurent Pinchart 2018-01-10  202  	struct device_node *du_no=
de;
81c0e3dd829270 Laurent Pinchart 2018-01-10  203  	char compatible[22];
81c0e3dd829270 Laurent Pinchart 2018-01-10  204  	const char *soc_name;
81c0e3dd829270 Laurent Pinchart 2018-01-10  205  	unsigned int i;
81c0e3dd829270 Laurent Pinchart 2018-01-10  206  	int ret;
81c0e3dd829270 Laurent Pinchart 2018-01-10  207  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  208  	/* Get the DU node and ex=
it if not present or disabled. */
81c0e3dd829270 Laurent Pinchart 2018-01-10  209  	du_node =3D of_find_match=
ing_node_and_match(NULL, of_ids, &match);
81c0e3dd829270 Laurent Pinchart 2018-01-10  210  	if (!du_node || !of_devic=
e_is_available(du_node)) {
81c0e3dd829270 Laurent Pinchart 2018-01-10  211  		of_node_put(du_node);
81c0e3dd829270 Laurent Pinchart 2018-01-10  212  		return;
81c0e3dd829270 Laurent Pinchart 2018-01-10  213  	}
81c0e3dd829270 Laurent Pinchart 2018-01-10  214  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  215  	info =3D match->data;
81c0e3dd829270 Laurent Pinchart 2018-01-10  216  	soc_node =3D of_get_paren=
t(du_node);
81c0e3dd829270 Laurent Pinchart 2018-01-10  217  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  218  	if (WARN_ON(info->num_lvd=
s > ARRAY_SIZE(lvds_data)))
81c0e3dd829270 Laurent Pinchart 2018-01-10  219  		goto done;
81c0e3dd829270 Laurent Pinchart 2018-01-10  220  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  221  	/*
81c0e3dd829270 Laurent Pinchart 2018-01-10  222  	 * Skip if the LVDS nodes=
 already exists.
81c0e3dd829270 Laurent Pinchart 2018-01-10  223  	 *
81c0e3dd829270 Laurent Pinchart 2018-01-10  224  	 * The nodes are searched=
 based on the compatible string, which we
81c0e3dd829270 Laurent Pinchart 2018-01-10  225  	 * construct from the SoC=
 name found in the DU compatible string. As a
81c0e3dd829270 Laurent Pinchart 2018-01-10  226  	 * match has been found w=
e know the compatible string matches the
81c0e3dd829270 Laurent Pinchart 2018-01-10  227  	 * expected format and ca=
n thus skip some of the string manipulation
81c0e3dd829270 Laurent Pinchart 2018-01-10  228  	 * normal safety checks.
81c0e3dd829270 Laurent Pinchart 2018-01-10  229  	 */
81c0e3dd829270 Laurent Pinchart 2018-01-10  230  	soc_name =3D strchr(match=
->compatible, '-') + 1;
81c0e3dd829270 Laurent Pinchart 2018-01-10 @231  	sprintf(compatible, "rene=
sas,%s-lvds", soc_name);
81c0e3dd829270 Laurent Pinchart 2018-01-10  232  	lvds_node =3D of_find_com=
patible_node(NULL, NULL, compatible);
81c0e3dd829270 Laurent Pinchart 2018-01-10  233  	if (lvds_node) {
81c0e3dd829270 Laurent Pinchart 2018-01-10  234  		of_node_put(lvds_node);
81c0e3dd829270 Laurent Pinchart 2018-01-10  235  		return;
81c0e3dd829270 Laurent Pinchart 2018-01-10  236  	}
81c0e3dd829270 Laurent Pinchart 2018-01-10  237  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  238  	/*
81c0e3dd829270 Laurent Pinchart 2018-01-10  239  	 * Parse the DU node and =
store the register specifier, the clock
81c0e3dd829270 Laurent Pinchart 2018-01-10  240  	 * specifier and the loca=
l and remote endpoint of the LVDS link for
81c0e3dd829270 Laurent Pinchart 2018-01-10  241  	 * later use.
81c0e3dd829270 Laurent Pinchart 2018-01-10  242  	 */
81c0e3dd829270 Laurent Pinchart 2018-01-10  243  	for (i =3D 0; i < info->n=
um_lvds; ++i) {
81c0e3dd829270 Laurent Pinchart 2018-01-10  244  		struct lvds_of_data *lvd=
s =3D &lvds_data[i];
81c0e3dd829270 Laurent Pinchart 2018-01-10  245  		unsigned int port;
81c0e3dd829270 Laurent Pinchart 2018-01-10  246  		char name[7];
81c0e3dd829270 Laurent Pinchart 2018-01-10  247  		int index;
81c0e3dd829270 Laurent Pinchart 2018-01-10  248  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  249  		sprintf(name, "lvds.%u",=
 i);
81c0e3dd829270 Laurent Pinchart 2018-01-10  250  		index =3D of_property_ma=
tch_string(du_node, "clock-names", name);
81c0e3dd829270 Laurent Pinchart 2018-01-10  251  		if (index < 0)
81c0e3dd829270 Laurent Pinchart 2018-01-10  252  			continue;
81c0e3dd829270 Laurent Pinchart 2018-01-10  253  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  254  		ret =3D of_parse_phandle=
_with_args(du_node, "clocks",
81c0e3dd829270 Laurent Pinchart 2018-01-10  255  						 "#clock-cells", ind=
ex,
81c0e3dd829270 Laurent Pinchart 2018-01-10  256  						 &lvds->clkspec);
81c0e3dd829270 Laurent Pinchart 2018-01-10  257  		if (ret < 0)
81c0e3dd829270 Laurent Pinchart 2018-01-10  258  			continue;
81c0e3dd829270 Laurent Pinchart 2018-01-10  259  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  260  		port =3D info->routes[RC=
AR_DU_OUTPUT_LVDS0 + i].port;
81c0e3dd829270 Laurent Pinchart 2018-01-10  261  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  262  		lvds->local =3D of_graph=
_get_endpoint_by_regs(du_node, port, 0);
81c0e3dd829270 Laurent Pinchart 2018-01-10  263  		if (!lvds->local)
81c0e3dd829270 Laurent Pinchart 2018-01-10  264  			continue;
81c0e3dd829270 Laurent Pinchart 2018-01-10  265  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  266  		lvds->remote =3D of_grap=
h_get_remote_endpoint(lvds->local);
81c0e3dd829270 Laurent Pinchart 2018-01-10  267  		if (!lvds->remote)
81c0e3dd829270 Laurent Pinchart 2018-01-10  268  			continue;
81c0e3dd829270 Laurent Pinchart 2018-01-10  269  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  270  		index =3D of_property_ma=
tch_string(du_node, "reg-names", name);
81c0e3dd829270 Laurent Pinchart 2018-01-10  271  		if (index < 0)
81c0e3dd829270 Laurent Pinchart 2018-01-10  272  			continue;
81c0e3dd829270 Laurent Pinchart 2018-01-10  273  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  274  		of_address_to_resource(d=
u_node, index, &lvds->res);
81c0e3dd829270 Laurent Pinchart 2018-01-10  275  	}
81c0e3dd829270 Laurent Pinchart 2018-01-10  276  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  277  	/* Parse and apply the ov=
erlay. This will resolve phandles. */
81c0e3dd829270 Laurent Pinchart 2018-01-10  278  	ret =3D rcar_du_of_apply_=
overlay(rcar_du_lvds_overlays,
81c0e3dd829270 Laurent Pinchart 2018-01-10  279  				       match->compatib=
le);
81c0e3dd829270 Laurent Pinchart 2018-01-10  280  	if (ret < 0)
81c0e3dd829270 Laurent Pinchart 2018-01-10  281  		goto done;
81c0e3dd829270 Laurent Pinchart 2018-01-10  282  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  283  	/* Patch the newly create=
d LVDS encoder nodes. */
81c0e3dd829270 Laurent Pinchart 2018-01-10  284  	for_each_child_of_node(so=
c_node, lvds_node) {
81c0e3dd829270 Laurent Pinchart 2018-01-10  285  		struct resource res;
81c0e3dd829270 Laurent Pinchart 2018-01-10  286  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  287  		if (!of_device_is_compat=
ible(lvds_node, compatible))
81c0e3dd829270 Laurent Pinchart 2018-01-10  288  			continue;
81c0e3dd829270 Laurent Pinchart 2018-01-10  289  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  290  		/* Locate the lvds_data =
entry based on the resource start. */
81c0e3dd829270 Laurent Pinchart 2018-01-10  291  		ret =3D of_address_to_re=
source(lvds_node, 0, &res);
81c0e3dd829270 Laurent Pinchart 2018-01-10  292  		if (ret < 0)
81c0e3dd829270 Laurent Pinchart 2018-01-10  293  			continue;
81c0e3dd829270 Laurent Pinchart 2018-01-10  294  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  295  		for (i =3D 0; i < ARRAY_=
SIZE(lvds_data); ++i) {
81c0e3dd829270 Laurent Pinchart 2018-01-10  296  			if (lvds_data[i].res.st=
art =3D=3D res.start)
81c0e3dd829270 Laurent Pinchart 2018-01-10  297  				break;
81c0e3dd829270 Laurent Pinchart 2018-01-10  298  		}
81c0e3dd829270 Laurent Pinchart 2018-01-10  299  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  300  		if (i =3D=3D ARRAY_SIZE(=
lvds_data))
81c0e3dd829270 Laurent Pinchart 2018-01-10  301  			continue;
81c0e3dd829270 Laurent Pinchart 2018-01-10  302  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  303  		/* Patch the LVDS encode=
r. */
81c0e3dd829270 Laurent Pinchart 2018-01-10  304  		rcar_du_of_lvds_patch_on=
e(lvds_node, &lvds_data[i].clkspec,
81c0e3dd829270 Laurent Pinchart 2018-01-10  305  					  lvds_data[i].local,
81c0e3dd829270 Laurent Pinchart 2018-01-10  306  					  lvds_data[i].remote=
);
81c0e3dd829270 Laurent Pinchart 2018-01-10  307  	}
81c0e3dd829270 Laurent Pinchart 2018-01-10  308  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  309  done:
81c0e3dd829270 Laurent Pinchart 2018-01-10  310  	for (i =3D 0; i < info->n=
um_lvds; ++i) {
81c0e3dd829270 Laurent Pinchart 2018-01-10  311  		of_node_put(lvds_data[i]=
.clkspec.np);
81c0e3dd829270 Laurent Pinchart 2018-01-10  312  		of_node_put(lvds_data[i]=
.local);
81c0e3dd829270 Laurent Pinchart 2018-01-10  313  		of_node_put(lvds_data[i]=
.remote);
81c0e3dd829270 Laurent Pinchart 2018-01-10  314  	}
81c0e3dd829270 Laurent Pinchart 2018-01-10  315  =

81c0e3dd829270 Laurent Pinchart 2018-01-10  316  	of_node_put(soc_node);
81c0e3dd829270 Laurent Pinchart 2018-01-10  317  	of_node_put(du_node);
81c0e3dd829270 Laurent Pinchart 2018-01-10  318  }
81c0e3dd829270 Laurent Pinchart 2018-01-10  319  =


:::::: The code at line 231 was first introduced by commit
:::::: 81c0e3dd82927064a2f56a31a0974a0d110fcdb0 drm: rcar-du: Fix legacy DT=
 to create LVDS encoder nodes

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0549995434383499508==--

