Content-Type: multipart/mixed; boundary="===============3288123013357021243=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/acpi/acpi_apd.c:94:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-an...
Date: Tue, 19 Apr 2022 02:32:46 +0800
Message-ID: <202204190206.ztx28PdH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3288123013357021243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Mario Limonciello <Mario.Limonciello@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 7fdb98e8a768b3ccc05494d3ea4436047f512b9d ACPI: APD: Add a fmw prope=
rty clk-name
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-c001-20220418 (https://download.01.org/0day-ci/arch=
ive/20220419/202204190206.ztx28PdH-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b27430=
f9f46b88bcd54d992debc8d72e131e1bd0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7fdb98e8a768b3ccc05494d3ea4436047f512b9d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7fdb98e8a768b3ccc05494d3ea4436047f512b9d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/x86/include/asm/pgtable.h:65:29: note: expanded from macro 'set_pte'
   #define set_pte(ptep, pte)              native_set_pte(ptep, pte)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-2level.h:17:8: note: Dereference of null po=
inter (loaded from variable 'ptep')
           *ptep =3D pte;
            ~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   arch/x86/include/asm/paravirt.h:55:2: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^
   arch/x86/include/asm/paravirt_types.h:387:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __eax =3D __eax, __edx =3D __edx, __ecx =3D __ecx;
                         ^
   drivers/video/console/vgacon.c:808:2: note: Control jumps to 'case -1:' =
 at line 823
           switch (blank) {
           ^
   drivers/video/console/vgacon.c:824:7: note: Assuming 'mode_switch' is 0
                   if (!mode_switch && vga_video_type =3D=3D VIDEO_TYPE_VGA=
C) {
                       ^~~~~~~~~~~~
   drivers/video/console/vgacon.c:824:7: note: Left side of '&&' is true
   drivers/video/console/vgacon.c:824:23: note: Assuming 'vga_video_type' i=
s equal to VIDEO_TYPE_VGAC
                   if (!mode_switch && vga_video_type =3D=3D VIDEO_TYPE_VGA=
C) {
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/console/vgacon.c:824:3: note: Taking true branch
                   if (!mode_switch && vga_video_type =3D=3D VIDEO_TYPE_VGA=
C) {
                   ^
   drivers/video/console/vgacon.c:825:4: note: Calling 'vga_pal_blank'
                           vga_pal_blank(&vgastate);
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/console/vgacon.c:797:2: note: Calling 'vga_w'
           vga_w(state->vgabase, VGA_PEL_MSK, 0xff);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/video/vga.h:244:6: note: Assuming 'regbase' is null
           if (regbase)
               ^~~~~~~
   include/video/vga.h:244:2: note: Taking false branch
           if (regbase)
           ^
   include/video/vga.h:247:3: note: Calling 'vga_io_w'
                   vga_io_w (port, val);
                   ^~~~~~~~~~~~~~~~~~~~
   include/video/vga.h:209:2: note: Calling 'outb_p'
           outb_p(val, port);
           ^
   arch/x86/include/asm/io.h:351:16: note: expanded from macro 'outb_p'
   #define outb_p outb_p
                  ^
   arch/x86/include/asm/io.h:334:1: note: Calling 'slow_down_io'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:292:2: note: expanded from macro 'BUILDIO'
           slow_down_io();                                                 \
           ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:55:2: note: Assigned value is garbage or=
 undefined
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:387:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __eax =3D __eax, __edx =3D __edx, __ecx =3D __ecx;
                         ^       ~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/acpi/acpi_apd.c:94:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(clk_data->name, obj->string.pointer);
                   ^~~~~~
   drivers/acpi/acpi_apd.c:94:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(clk_data->name, obj->string.pointer);
                   ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/acpi/power.c:940:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_POWER_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/power.c:940:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_POWER_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/power.c:941:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_POWER_CLASS);
           ^~~~~~
   drivers/acpi/power.c:941:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_POWER_CLASS);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/ext4/readpage.c:379:39: warning: The left operand of '<<' is a garbag=
e value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           bio->bi_iter.bi_sector =3D blocks[0] << (blkbits=
 - 9);
                                                    ~~~~~~~~~ ^
   fs/ext4/readpage.c:243:26: note: Assuming 'rac' is null
           unsigned int nr_pages =3D rac ? readahead_count(rac) : 1;
                                   ^~~
   fs/ext4/readpage.c:243:26: note: '?' condition is false
   fs/ext4/readpage.c:250:2: note: Loop condition is true.  Entering loop b=
ody
           for (; nr_pages; nr_pages--) {
           ^
   fs/ext4/readpage.c:254:7: note: 'rac' is null
                   if (rac) {
                       ^~~
   fs/ext4/readpage.c:254:3: note: Taking false branch
                   if (rac) {
                   ^
   fs/ext4/readpage.c:259:7: note: Assuming the condition is false
                   if (page_has_buffers(page))
                       ^
   include/linux/buffer_head.h:146:32: note: expanded from macro 'page_has_=
buffers'
   #define page_has_buffers(page)  PagePrivate(page)
                                   ^~~~~~~~~~~~~~~~~
   fs/ext4/readpage.c:259:3: note: Taking false branch
                   if (page_has_buffers(page))
                   ^
   fs/ext4/readpage.c:267:7: note: Assuming 'last_block' is > 'last_block_i=
n_file'
                   if (last_block > last_block_in_file)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/readpage.c:267:3: note: Taking true branch
                   if (last_block > last_block_in_file)
                   ^
   fs/ext4/readpage.c:274:39: note: Left side of '&&' is false
                   if ((map.m_flags & EXT4_MAP_MAPPED) &&
                                                       ^
   fs/ext4/readpage.c:299:10: note: Assuming 'page_block' is >=3D 'blocks_p=
er_page'
                   while (page_block < blocks_per_page) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/readpage.c:299:3: note: Loop condition is false. Execution conti=
nues on line 339
                   while (page_block < blocks_per_page) {
                   ^
   fs/ext4/readpage.c:339:7: note: 'first_hole' is equal to 'blocks_per_pag=
e'
                   if (first_hole !=3D blocks_per_page) {
                       ^~~~~~~~~~
   fs/ext4/readpage.c:339:3: note: Taking false branch
                   if (first_hole !=3D blocks_per_page) {
                   ^
   fs/ext4/readpage.c:350:14: note: 'fully_mapped' is 1
                   } else if (fully_mapped) {
                              ^~~~~~~~~~~~
   fs/ext4/readpage.c:350:10: note: Taking true branch
                   } else if (fully_mapped) {
                          ^
   fs/ext4/readpage.c:353:7: note: 'fully_mapped' is 1
                   if (fully_mapped && blocks_per_page =3D=3D 1 &&
                       ^~~~~~~~~~~~
   fs/ext4/readpage.c:353:7: note: Left side of '&&' is true
   fs/ext4/readpage.c:353:23: note: 'blocks_per_page' is not equal to 1
                   if (fully_mapped && blocks_per_page =3D=3D 1 &&
                                       ^~~~~~~~~~~~~~~
   fs/ext4/readpage.c:353:44: note: Left side of '&&' is false
                   if (fully_mapped && blocks_per_page =3D=3D 1 &&
                                                            ^
   fs/ext4/readpage.c:363:7: note: 'bio' is null
                   if (bio && (last_block_in_bio !=3D blocks[0] - 1 ||
                       ^~~
   fs/ext4/readpage.c:363:11: note: Left side of '&&' is false
                   if (bio && (last_block_in_bio !=3D blocks[0] - 1 ||
                           ^

vim +94 drivers/acpi/acpi_apd.c

3f4ba94e3615fe Akshu Agrawal     2018-05-09   69  =

d58669b093997e Akshu Agrawal     2020-07-31   70  static int fch_misc_setup=
(struct apd_private_data *pdata)
3f4ba94e3615fe Akshu Agrawal     2018-05-09   71  {
3f4ba94e3615fe Akshu Agrawal     2018-05-09   72  	struct acpi_device *adev=
 =3D pdata->adev;
7f8802f2d2ed67 Akshu Agrawal     2020-07-31   73  	const union acpi_object =
*obj;
3f4ba94e3615fe Akshu Agrawal     2018-05-09   74  	struct platform_device *=
clkdev;
d58669b093997e Akshu Agrawal     2020-07-31   75  	struct fch_clk_data *clk=
_data;
3f4ba94e3615fe Akshu Agrawal     2018-05-09   76  	struct resource_entry *r=
entry;
3f4ba94e3615fe Akshu Agrawal     2018-05-09   77  	struct list_head resourc=
e_list;
3f4ba94e3615fe Akshu Agrawal     2018-05-09   78  	int ret;
3f4ba94e3615fe Akshu Agrawal     2018-05-09   79  =

3f4ba94e3615fe Akshu Agrawal     2018-05-09   80  	clk_data =3D devm_kzallo=
c(&adev->dev, sizeof(*clk_data), GFP_KERNEL);
3f4ba94e3615fe Akshu Agrawal     2018-05-09   81  	if (!clk_data)
3f4ba94e3615fe Akshu Agrawal     2018-05-09   82  		return -ENOMEM;
3f4ba94e3615fe Akshu Agrawal     2018-05-09   83  =

3f4ba94e3615fe Akshu Agrawal     2018-05-09   84  	INIT_LIST_HEAD(&resource=
_list);
3f4ba94e3615fe Akshu Agrawal     2018-05-09   85  	ret =3D acpi_dev_get_res=
ources(adev, &resource_list, misc_check_res,
3f4ba94e3615fe Akshu Agrawal     2018-05-09   86  				     NULL);
3f4ba94e3615fe Akshu Agrawal     2018-05-09   87  	if (ret < 0)
3f4ba94e3615fe Akshu Agrawal     2018-05-09   88  		return -ENOENT;
3f4ba94e3615fe Akshu Agrawal     2018-05-09   89  =

7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12   90  	if (!acpi_dev_get_proper=
ty(adev, "clk-name", ACPI_TYPE_STRING, &obj)) {
7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12   91  		clk_data->name =3D devm=
_kzalloc(&adev->dev, obj->string.length,
7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12   92  					      GFP_KERNEL);
7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12   93  =

7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12  @94  		strcpy(clk_data->name, =
obj->string.pointer);
7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12   95  	} else {
7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12   96  		/* Set default name to =
mclk if entry missing in firmware */
7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12   97  		clk_data->name =3D "mcl=
k";
7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12   98  	}
7fdb98e8a768b3 Ajit Kumar Pandey 2021-12-12   99  =

3f4ba94e3615fe Akshu Agrawal     2018-05-09  100  	list_for_each_entry(rent=
ry, &resource_list, node) {
3f4ba94e3615fe Akshu Agrawal     2018-05-09  101  		clk_data->base =3D devm=
_ioremap(&adev->dev, rentry->res->start,
3f4ba94e3615fe Akshu Agrawal     2018-05-09  102  					      resource_size(=
rentry->res));
3f4ba94e3615fe Akshu Agrawal     2018-05-09  103  		break;
3f4ba94e3615fe Akshu Agrawal     2018-05-09  104  	}
3f4ba94e3615fe Akshu Agrawal     2018-05-09  105  =

3f4ba94e3615fe Akshu Agrawal     2018-05-09  106  	acpi_dev_free_resource_l=
ist(&resource_list);
3f4ba94e3615fe Akshu Agrawal     2018-05-09  107  =

d58669b093997e Akshu Agrawal     2020-07-31  108  	clkdev =3D platform_devi=
ce_register_data(&adev->dev, "clk-fch",
3f4ba94e3615fe Akshu Agrawal     2018-05-09  109  					       PLATFORM_DEVI=
D_NONE, clk_data,
3f4ba94e3615fe Akshu Agrawal     2018-05-09  110  					       sizeof(*clk_d=
ata));
3f4ba94e3615fe Akshu Agrawal     2018-05-09  111  	return PTR_ERR_OR_ZERO(c=
lkdev);
3f4ba94e3615fe Akshu Agrawal     2018-05-09  112  }
3f4ba94e3615fe Akshu Agrawal     2018-05-09  113  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3288123013357021243==--

