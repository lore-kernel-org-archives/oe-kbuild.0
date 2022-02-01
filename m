Content-Type: multipart/mixed; boundary="===============7633771088408903762=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/be2iscsi/be_main.c:2955:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Tue, 01 Feb 2022 18:52:49 +0800
Message-ID: <202202011818.EZC1FDYu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7633771088408903762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: ad7d61f159db73974f1b0352f21afe04b0bbd920 printk: index: Add indexin=
g support to dev_printk
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220130 (https://download.01.org/0day-ci/archi=
ve/20220201/202202011818.EZC1FDYu-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dad7d61f159db73974f1b0352f21afe04b0bbd920
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ad7d61f159db73974f1b0352f21afe04b0bbd920
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1026:3: note: expanded from macro 'beisc=
si_log'
                   if (((mask) & log_value) || (level[1] <=3D '3')) \
                   ^
   drivers/scsi/be2iscsi/be_main.c:2780:5: note: Loop condition is false.  =
Exiting loop
                                   beiscsi_log(phba, KERN_INFO, BEISCSI_LOG=
_INIT,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1023:53: note: expanded from macro 'beis=
csi_log'
   #define beiscsi_log(phba, level, mask, fmt, arg...) \
                                                       ^
   drivers/scsi/be2iscsi/be_main.c:2799:8: note: Assuming field 'virtual_ad=
dress' is null
                           if (mem_descr->mem_array[0].virtual_address) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:2799:4: note: Taking false branch
                           if (mem_descr->mem_array[0].virtual_address) {
                           ^
   drivers/scsi/be2iscsi/be_main.c:2807:5: note: Left side of '||' is false
                                   beiscsi_log(phba, KERN_WARNING,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1026:7: note: expanded from macro 'beisc=
si_log'
                   if (((mask) & log_value) || (level[1] <=3D '3')) \
                       ^
   drivers/scsi/be2iscsi/be_main.c:2807:5: note: Taking false branch
                                   beiscsi_log(phba, KERN_WARNING,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1026:3: note: expanded from macro 'beisc=
si_log'
                   if (((mask) & log_value) || (level[1] <=3D '3')) \
                   ^
   drivers/scsi/be2iscsi/be_main.c:2807:5: note: Loop condition is false.  =
Exiting loop
                                   beiscsi_log(phba, KERN_WARNING,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1023:53: note: expanded from macro 'beis=
csi_log'
   #define beiscsi_log(phba, level, mask, fmt, arg...) \
                                                       ^
   drivers/scsi/be2iscsi/be_main.c:2819:8: note: Assuming pointer value is =
null
                           if (!mem_descr->mem_array[0].virtual_address)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:2819:8: note: Assuming field 'virtual_ad=
dress' is null
                           if (!mem_descr->mem_array[0].virtual_address)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:2819:4: note: Taking true branch
                           if (!mem_descr->mem_array[0].virtual_address)
                           ^
   drivers/scsi/be2iscsi/be_main.c:2820:5: note: Left side of '||' is false
                                   beiscsi_log(phba, KERN_WARNING,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1026:7: note: expanded from macro 'beisc=
si_log'
                   if (((mask) & log_value) || (level[1] <=3D '3')) \
                       ^
   drivers/scsi/be2iscsi/be_main.c:2820:5: note: Taking false branch
                                   beiscsi_log(phba, KERN_WARNING,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1026:3: note: expanded from macro 'beisc=
si_log'
                   if (((mask) & log_value) || (level[1] <=3D '3')) \
                   ^
   drivers/scsi/be2iscsi/be_main.c:2820:5: note: Loop condition is false.  =
Exiting loop
                                   beiscsi_log(phba, KERN_WARNING,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1023:53: note: expanded from macro 'beis=
csi_log'
   #define beiscsi_log(phba, level, mask, fmt, arg...) \
                                                       ^
   drivers/scsi/be2iscsi/be_main.c:2825:4: note: Null pointer value stored =
to field 'handle_base'
                           pasync_ctx->async_data.handle_base =3D
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:2831:4: note: Null pointer value stored =
to 'pasync_data_h'
                           pasync_data_h =3D
                           ^~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:2839:8: note: Assuming field 'virtual_ad=
dress' is null
                           if (mem_descr->mem_array[0].virtual_address) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:2839:4: note: Taking false branch
                           if (mem_descr->mem_array[0].virtual_address) {
                           ^
   drivers/scsi/be2iscsi/be_main.c:2847:5: note: Left side of '||' is false
                                   beiscsi_log(phba, KERN_WARNING,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1026:7: note: expanded from macro 'beisc=
si_log'
                   if (((mask) & log_value) || (level[1] <=3D '3')) \
                       ^
   drivers/scsi/be2iscsi/be_main.c:2847:5: note: Taking false branch
                                   beiscsi_log(phba, KERN_WARNING,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1026:3: note: expanded from macro 'beisc=
si_log'
                   if (((mask) & log_value) || (level[1] <=3D '3')) \
                   ^
   drivers/scsi/be2iscsi/be_main.c:2847:5: note: Loop condition is false.  =
Exiting loop
                                   beiscsi_log(phba, KERN_WARNING,
                                   ^
   drivers/scsi/be2iscsi/be_main.h:1023:53: note: expanded from macro 'beis=
csi_log'
   #define beiscsi_log(phba, level, mask, fmt, arg...) \
                                                       ^
   drivers/scsi/be2iscsi/be_main.c:2865:20: note: Assuming the condition is=
 true
                           for (index =3D 0; index < BEISCSI_ASYNC_HDQ_SIZE
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:2865:4: note: Loop condition is true.  E=
ntering loop body
                           for (index =3D 0; index < BEISCSI_ASYNC_HDQ_SIZE
                           ^
   drivers/scsi/be2iscsi/be_main.c:2887:24: note: Access to field 'cri' res=
ults in a dereference of a null pointer (loaded from variable 'pasync_data_=
h')
                                   pasync_data_h->cri =3D -1;
                                   ~~~~~~~~~~~~~      ^
>> drivers/scsi/be2iscsi/be_main.c:2955:6: warning: Branch condition evalua=
tes to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (sgl->va)
               ^
   drivers/scsi/be2iscsi/be_main.c:3699:6: note: 'status' is equal to 0
           if (status !=3D 0) {
               ^~~~~~
   drivers/scsi/be2iscsi/be_main.c:3699:2: note: Taking false branch
           if (status !=3D 0) {
           ^
   drivers/scsi/be2iscsi/be_main.c:3706:6: note: 'status' is equal to 0
           if (status !=3D 0)
               ^~~~~~
   drivers/scsi/be2iscsi/be_main.c:3706:2: note: Taking false branch
           if (status !=3D 0)
           ^
   drivers/scsi/be2iscsi/be_main.c:3710:6: note: Assuming 'status' is equal=
 to 0
           if (status !=3D 0) {
               ^~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:3710:2: note: Taking false branch
           if (status !=3D 0) {
           ^
   drivers/scsi/be2iscsi/be_main.c:3717:6: note: 'status' is equal to 0
           if (status !=3D 0) {
               ^~~~~~
   drivers/scsi/be2iscsi/be_main.c:3717:2: note: Taking false branch
           if (status !=3D 0) {
           ^
   drivers/scsi/be2iscsi/be_main.c:3723:2: note: Loop condition is true.  E=
ntering loop body
           for (ulp_num =3D 0; ulp_num < BEISCSI_ULP_COUNT; ulp_num++) {
           ^
   drivers/scsi/be2iscsi/be_main.c:3724:7: note: Assuming the condition is =
false
                   if (test_bit(ulp_num, &phba->fw_config.ulp_supported)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:3724:3: note: Taking false branch
                   if (test_bit(ulp_num, &phba->fw_config.ulp_supported)) {
                   ^
   drivers/scsi/be2iscsi/be_main.c:3723:2: note: Loop condition is true.  E=
ntering loop body
           for (ulp_num =3D 0; ulp_num < BEISCSI_ULP_COUNT; ulp_num++) {
           ^
   drivers/scsi/be2iscsi/be_main.c:3724:7: note: Assuming the condition is =
false
                   if (test_bit(ulp_num, &phba->fw_config.ulp_supported)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:3724:3: note: Taking false branch
                   if (test_bit(ulp_num, &phba->fw_config.ulp_supported)) {
                   ^
   drivers/scsi/be2iscsi/be_main.c:3723:2: note: Loop condition is false. E=
xecution continues on line 3760
           for (ulp_num =3D 0; ulp_num < BEISCSI_ULP_COUNT; ulp_num++) {
           ^
   drivers/scsi/be2iscsi/be_main.c:3760:11: note: Calling 'beiscsi_post_pag=
es'
           status =3D beiscsi_post_pages(phba);
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:3276:2: note: Loop condition is true.  E=
ntering loop body
           for (ulp_num =3D 0; ulp_num < BEISCSI_ULP_COUNT; ulp_num++)
           ^
   drivers/scsi/be2iscsi/be_main.c:3277:3: note: Taking false branch
                   if (test_bit(ulp_num, &phba->fw_config.ulp_supported))
                   ^
   drivers/scsi/be2iscsi/be_main.c:3276:2: note: Loop condition is true.  E=
ntering loop body
           for (ulp_num =3D 0; ulp_num < BEISCSI_ULP_COUNT; ulp_num++)
           ^
   drivers/scsi/be2iscsi/be_main.c:3277:3: note: Taking false branch
                   if (test_bit(ulp_num, &phba->fw_config.ulp_supported))
                   ^
   drivers/scsi/be2iscsi/be_main.c:3276:2: note: Loop condition is false. E=
xecution continues on line 3280
           for (ulp_num =3D 0; ulp_num < BEISCSI_ULP_COUNT; ulp_num++)
           ^
   drivers/scsi/be2iscsi/be_main.c:3282:14: note: Assuming 'i' is < field '=
num_elements'
           for (i =3D 0; i < mem_descr->num_elements; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:3282:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; i < mem_descr->num_elements; i++) {
           ^
   drivers/scsi/be2iscsi/be_main.c:3283:3: note: Calling 'hwi_build_be_sgl_=
arr'
                   hwi_build_be_sgl_arr(phba, pm_arr, &sgl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:2955:6: note: Branch condition evaluates=
 to a garbage value
           if (sgl->va)
               ^~~~~~~
   drivers/scsi/be2iscsi/be_main.c:2967:6: warning: Branch condition evalua=
tes to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (sgl->va)
               ^
   drivers/scsi/be2iscsi/be_main.c:3699:6: note: 'status' is equal to 0
           if (status !=3D 0) {
               ^~~~~~
   drivers/scsi/be2iscsi/be_main.c:3699:2: note: Taking false branch
           if (status !=3D 0) {
           ^
   drivers/scsi/be2iscsi/be_main.c:3706:6: note: 'status' is equal to 0
           if (status !=3D 0)
               ^~~~~~
   drivers/scsi/be2iscsi/be_main.c:3706:2: note: Taking false branch
           if (status !=3D 0)
           ^
   drivers/scsi/be2iscsi/be_main.c:3710:6: note: Assuming 'status' is equal=
 to 0
           if (status !=3D 0) {
               ^~~~~~~~~~~
   drivers/scsi/be2iscsi/be_main.c:3710:2: note: Taking false branch
           if (status !=3D 0) {
           ^
   drivers/scsi/be2iscsi/be_main.c:3717:6: note: 'status' is equal to 0
           if (status !=3D 0) {

vim +2955 drivers/scsi/be2iscsi/be_main.c

6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2950  =

6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2951  static void
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2952  hwi_build_be_sgl_arr(s=
truct beiscsi_hba *phba,
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2953  		     struct mem_arra=
y *pmem, struct be_dma_mem *sgl)
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2954  {
6733b39a1301b0 Jayamohan Kallickal 2009-09-05 @2955  	if (sgl->va)
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2956  		be_sgl_destroy_conti=
guous(sgl);
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2957  =

6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2958  	be_sgl_create_contigu=
ous(pmem->virtual_address,
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2959  				 pmem->bus_address=
.u.a64.address,
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2960  				 pmem->size, sgl);
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2961  }
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  2962  =


:::::: The code at line 2955 was first introduced by commit
:::::: 6733b39a1301b0b020bbcbf3295852e93e624cb1 [SCSI] be2iscsi: add 10Gbps=
 iSCSI - BladeEngine 2 driver

:::::: TO: Jayamohan Kallickal <jayamohank@serverengines.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7633771088408903762==--

