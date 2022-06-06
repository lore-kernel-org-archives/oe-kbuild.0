Content-Type: multipart/mixed; boundary="===============8582183705976591485=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 19/20] drivers/gpu/drm/rcar-du/rcar_du_of.c:231:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argume...
Date: Tue, 07 Jun 2022 02:53:28 +0800
Message-ID: <202206070248.UrTRDiWK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8582183705976591485==
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
omeos-5.15
head:   44903c0c1ee49d44947df527a7f61fbeeef42835
commit: 70bcd67fdf72dd1c1346a53e0bc977ef78f65761 [19/20] UPSTREAM: Kbuild: =
move to -std=3Dgnu11
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archi=
ve/20220607/202206070248.UrTRDiWK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 70bcd67fdf72dd1c1346a53e0bc977ef78f65761
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
   include/linux/of.h:1301:48: note: expanded from macro 'for_each_child_of=
_node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
                                                         ^~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_of.c:284:2: note: Loop condition is true=
.  Entering loop body
           for_each_child_of_node(soc_node, lvds_node) {
           ^
   include/linux/of.h:1301:2: note: expanded from macro 'for_each_child_of_=
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
   include/uapi/linux/byteorder/little_endian.h:40:43: note: expanded from =
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
   Suppressed 52 warnings (51 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/gpu/drm/drm_sysfs.c:257:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, edid + off, count);
           ^~~~~~
   drivers/gpu/drm/drm_sysfs.c:257:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, edid + off, count);
           ^~~~~~
   drivers/gpu/drm/drm_sysfs.c:432:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(conn_id, ARRAY_SIZE(conn_id),
           ^~~~~~~~
   drivers/gpu/drm/drm_sysfs.c:432:2: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           snprintf(conn_id, ARRAY_SIZE(conn_id),
           ^~~~~~~~
   drivers/gpu/drm/drm_sysfs.c:434:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_id, ARRAY_SIZE(prop_id),
           ^~~~~~~~
   drivers/gpu/drm/drm_sysfs.c:434:2: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop_id, ARRAY_SIZE(prop_id),
           ^~~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/gpu/drm/drm_mm.c:945:27: warning: The left operand of '>' is a g=
arbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           DRM_MM_BUG_ON(hole_start > scan->hit_start);
                                    ^
   include/drm/drm_mm.h:52:36: note: expanded from macro 'DRM_MM_BUG_ON'
   #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
                                      ^~~~
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/drm_mm.c:919:6: note: 'hole_start' declared without an i=
nitial value
           u64 hole_start, hole_end;
               ^~~~~~~~~~
   drivers/gpu/drm/drm_mm.c:921:2: note: Assuming the condition is false
           DRM_MM_BUG_ON(list_empty(&mm->hole_stack));
           ^
   include/drm/drm_mm.h:52:29: note: expanded from macro 'DRM_MM_BUG_ON'
   #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
                               ^~~~~~~~~~~~
   include/asm-generic/bug.h:65:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mm.c:921:2: note: Taking false branch
           DRM_MM_BUG_ON(list_empty(&mm->hole_stack));
           ^
   include/drm/drm_mm.h:52:29: note: expanded from macro 'DRM_MM_BUG_ON'
   #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
                               ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/gpu/drm/drm_mm.c:921:2: note: Loop condition is false.  Exiting =
loop
           DRM_MM_BUG_ON(list_empty(&mm->hole_stack));
           ^
   include/drm/drm_mm.h:52:29: note: expanded from macro 'DRM_MM_BUG_ON'
   #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
                               ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/gpu/drm/drm_mm.c:923:6: note: Assuming field 'color_adjust' is n=
on-null
           if (!mm->color_adjust)
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mm.c:923:2: note: Taking false branch
           if (!mm->color_adjust)
           ^
   drivers/gpu/drm/drm_mm.c:931:2: note: Left side of '&&' is false
           list_for_each_entry(hole, &mm->hole_stack, hole_stack) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)

vim +231 drivers/gpu/drm/rcar-du/rcar_du_of.c

81c0e3dd8292706 Laurent Pinchart 2018-01-10  194  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  195  static void __init rcar_d=
u_of_lvds_patch(const struct of_device_id *of_ids)
81c0e3dd8292706 Laurent Pinchart 2018-01-10  196  {
81c0e3dd8292706 Laurent Pinchart 2018-01-10  197  	const struct rcar_du_dev=
ice_info *info;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  198  	const struct of_device_i=
d *match;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  199  	struct lvds_of_data lvds=
_data[2] =3D { };
81c0e3dd8292706 Laurent Pinchart 2018-01-10  200  	struct device_node *lvds=
_node;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  201  	struct device_node *soc_=
node;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  202  	struct device_node *du_n=
ode;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  203  	char compatible[22];
81c0e3dd8292706 Laurent Pinchart 2018-01-10  204  	const char *soc_name;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  205  	unsigned int i;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  206  	int ret;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  207  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  208  	/* Get the DU node and e=
xit if not present or disabled. */
81c0e3dd8292706 Laurent Pinchart 2018-01-10  209  	du_node =3D of_find_matc=
hing_node_and_match(NULL, of_ids, &match);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  210  	if (!du_node || !of_devi=
ce_is_available(du_node)) {
81c0e3dd8292706 Laurent Pinchart 2018-01-10  211  		of_node_put(du_node);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  212  		return;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  213  	}
81c0e3dd8292706 Laurent Pinchart 2018-01-10  214  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  215  	info =3D match->data;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  216  	soc_node =3D of_get_pare=
nt(du_node);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  217  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  218  	if (WARN_ON(info->num_lv=
ds > ARRAY_SIZE(lvds_data)))
81c0e3dd8292706 Laurent Pinchart 2018-01-10  219  		goto done;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  220  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  221  	/*
81c0e3dd8292706 Laurent Pinchart 2018-01-10  222  	 * Skip if the LVDS node=
s already exists.
81c0e3dd8292706 Laurent Pinchart 2018-01-10  223  	 *
81c0e3dd8292706 Laurent Pinchart 2018-01-10  224  	 * The nodes are searche=
d based on the compatible string, which we
81c0e3dd8292706 Laurent Pinchart 2018-01-10  225  	 * construct from the So=
C name found in the DU compatible string. As a
81c0e3dd8292706 Laurent Pinchart 2018-01-10  226  	 * match has been found =
we know the compatible string matches the
81c0e3dd8292706 Laurent Pinchart 2018-01-10  227  	 * expected format and c=
an thus skip some of the string manipulation
81c0e3dd8292706 Laurent Pinchart 2018-01-10  228  	 * normal safety checks.
81c0e3dd8292706 Laurent Pinchart 2018-01-10  229  	 */
81c0e3dd8292706 Laurent Pinchart 2018-01-10  230  	soc_name =3D strchr(matc=
h->compatible, '-') + 1;
81c0e3dd8292706 Laurent Pinchart 2018-01-10 @231  	sprintf(compatible, "ren=
esas,%s-lvds", soc_name);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  232  	lvds_node =3D of_find_co=
mpatible_node(NULL, NULL, compatible);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  233  	if (lvds_node) {
81c0e3dd8292706 Laurent Pinchart 2018-01-10  234  		of_node_put(lvds_node);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  235  		return;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  236  	}
81c0e3dd8292706 Laurent Pinchart 2018-01-10  237  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  238  	/*
81c0e3dd8292706 Laurent Pinchart 2018-01-10  239  	 * Parse the DU node and=
 store the register specifier, the clock
81c0e3dd8292706 Laurent Pinchart 2018-01-10  240  	 * specifier and the loc=
al and remote endpoint of the LVDS link for
81c0e3dd8292706 Laurent Pinchart 2018-01-10  241  	 * later use.
81c0e3dd8292706 Laurent Pinchart 2018-01-10  242  	 */
81c0e3dd8292706 Laurent Pinchart 2018-01-10  243  	for (i =3D 0; i < info->=
num_lvds; ++i) {
81c0e3dd8292706 Laurent Pinchart 2018-01-10  244  		struct lvds_of_data *lv=
ds =3D &lvds_data[i];
81c0e3dd8292706 Laurent Pinchart 2018-01-10  245  		unsigned int port;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  246  		char name[7];
81c0e3dd8292706 Laurent Pinchart 2018-01-10  247  		int index;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  248  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  249  		sprintf(name, "lvds.%u"=
, i);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  250  		index =3D of_property_m=
atch_string(du_node, "clock-names", name);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  251  		if (index < 0)
81c0e3dd8292706 Laurent Pinchart 2018-01-10  252  			continue;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  253  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  254  		ret =3D of_parse_phandl=
e_with_args(du_node, "clocks",
81c0e3dd8292706 Laurent Pinchart 2018-01-10  255  						 "#clock-cells", in=
dex,
81c0e3dd8292706 Laurent Pinchart 2018-01-10  256  						 &lvds->clkspec);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  257  		if (ret < 0)
81c0e3dd8292706 Laurent Pinchart 2018-01-10  258  			continue;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  259  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  260  		port =3D info->routes[R=
CAR_DU_OUTPUT_LVDS0 + i].port;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  261  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  262  		lvds->local =3D of_grap=
h_get_endpoint_by_regs(du_node, port, 0);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  263  		if (!lvds->local)
81c0e3dd8292706 Laurent Pinchart 2018-01-10  264  			continue;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  265  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  266  		lvds->remote =3D of_gra=
ph_get_remote_endpoint(lvds->local);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  267  		if (!lvds->remote)
81c0e3dd8292706 Laurent Pinchart 2018-01-10  268  			continue;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  269  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  270  		index =3D of_property_m=
atch_string(du_node, "reg-names", name);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  271  		if (index < 0)
81c0e3dd8292706 Laurent Pinchart 2018-01-10  272  			continue;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  273  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  274  		of_address_to_resource(=
du_node, index, &lvds->res);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  275  	}
81c0e3dd8292706 Laurent Pinchart 2018-01-10  276  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  277  	/* Parse and apply the o=
verlay. This will resolve phandles. */
81c0e3dd8292706 Laurent Pinchart 2018-01-10  278  	ret =3D rcar_du_of_apply=
_overlay(rcar_du_lvds_overlays,
81c0e3dd8292706 Laurent Pinchart 2018-01-10  279  				       match->compati=
ble);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  280  	if (ret < 0)
81c0e3dd8292706 Laurent Pinchart 2018-01-10  281  		goto done;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  282  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  283  	/* Patch the newly creat=
ed LVDS encoder nodes. */
81c0e3dd8292706 Laurent Pinchart 2018-01-10  284  	for_each_child_of_node(s=
oc_node, lvds_node) {
81c0e3dd8292706 Laurent Pinchart 2018-01-10  285  		struct resource res;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  286  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  287  		if (!of_device_is_compa=
tible(lvds_node, compatible))
81c0e3dd8292706 Laurent Pinchart 2018-01-10  288  			continue;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  289  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  290  		/* Locate the lvds_data=
 entry based on the resource start. */
81c0e3dd8292706 Laurent Pinchart 2018-01-10  291  		ret =3D of_address_to_r=
esource(lvds_node, 0, &res);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  292  		if (ret < 0)
81c0e3dd8292706 Laurent Pinchart 2018-01-10  293  			continue;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  294  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  295  		for (i =3D 0; i < ARRAY=
_SIZE(lvds_data); ++i) {
81c0e3dd8292706 Laurent Pinchart 2018-01-10  296  			if (lvds_data[i].res.s=
tart =3D=3D res.start)
81c0e3dd8292706 Laurent Pinchart 2018-01-10  297  				break;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  298  		}
81c0e3dd8292706 Laurent Pinchart 2018-01-10  299  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  300  		if (i =3D=3D ARRAY_SIZE=
(lvds_data))
81c0e3dd8292706 Laurent Pinchart 2018-01-10  301  			continue;
81c0e3dd8292706 Laurent Pinchart 2018-01-10  302  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  303  		/* Patch the LVDS encod=
er. */
81c0e3dd8292706 Laurent Pinchart 2018-01-10  304  		rcar_du_of_lvds_patch_o=
ne(lvds_node, &lvds_data[i].clkspec,
81c0e3dd8292706 Laurent Pinchart 2018-01-10  305  					  lvds_data[i].local,
81c0e3dd8292706 Laurent Pinchart 2018-01-10  306  					  lvds_data[i].remot=
e);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  307  	}
81c0e3dd8292706 Laurent Pinchart 2018-01-10  308  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  309  done:
81c0e3dd8292706 Laurent Pinchart 2018-01-10  310  	for (i =3D 0; i < info->=
num_lvds; ++i) {
81c0e3dd8292706 Laurent Pinchart 2018-01-10  311  		of_node_put(lvds_data[i=
].clkspec.np);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  312  		of_node_put(lvds_data[i=
].local);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  313  		of_node_put(lvds_data[i=
].remote);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  314  	}
81c0e3dd8292706 Laurent Pinchart 2018-01-10  315  =

81c0e3dd8292706 Laurent Pinchart 2018-01-10  316  	of_node_put(soc_node);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  317  	of_node_put(du_node);
81c0e3dd8292706 Laurent Pinchart 2018-01-10  318  }
81c0e3dd8292706 Laurent Pinchart 2018-01-10  319  =


:::::: The code at line 231 was first introduced by commit
:::::: 81c0e3dd82927064a2f56a31a0974a0d110fcdb0 drm: rcar-du: Fix legacy DT=
 to create LVDS encoder nodes

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8582183705976591485==--

