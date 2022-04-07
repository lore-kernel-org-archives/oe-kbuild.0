Content-Type: multipart/mixed; boundary="===============8548179752191411342=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/acpi/pfr_telemetry.c:176:3: warning: Value stored to 'ext_status' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 07 Apr 2022 20:51:34 +0800
Message-ID: <202204072043.hq2zqj94-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8548179752191411342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chen Yu <yu.c.chen@intel.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: b0013e037a8b07772c74ce24f1ae4743b30fc3cf ACPI: Introduce Platform F=
irmware Runtime Telemetry driver
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007-20220404 (https://download.01.org/0day-ci/ar=
chive/20220407/202204072043.hq2zqj94-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db0013e037a8b07772c74ce24f1ae4743b30fc3cf
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b0013e037a8b07772c74ce24f1ae4743b30fc3cf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/jump_label.h:420:2: note: expanded from macro 'static_key_=
enabled'
           static_key_count((struct static_key *)x) > 0;                   =
        \
           ^
   include/linux/compiler.h:80:39: note: expanded from macro 'unlikely_notr=
ace'
   # define unlikely_notrace(x)    unlikely(x)
                                   ~~~~~~~~~^~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/iommu/dma-iommu.c:988:2: note: Taking false branch
           if (static_branch_unlikely(&iommu_deferred_attach_enabled)) {
           ^
   drivers/iommu/dma-iommu.c:994:6: note: Calling 'dev_use_swiotlb'
           if (dev_use_swiotlb(dev))
               ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:315:9: note: Left side of '&&' is true
           return IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev);
                  ^
   include/linux/kconfig.h:73:28: note: expanded from macro 'IS_ENABLED'
   #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
                              ^
   include/linux/kconfig.h:24:22: note: expanded from macro '__or'
   #define __or(x, y)                      ___or(x, y)
                                           ^
   include/linux/kconfig.h:25:23: note: expanded from macro '___or'
   #define ___or(x, y)                     ____or(__ARG_PLACEHOLDER_##x, y)
                                           ^
   include/linux/kconfig.h:26:65: note: expanded from macro '____or'
   #define ____or(arg1_or_junk, y)         __take_second_arg(arg1_or_junk 1=
, y)
                                                                          ^
   drivers/iommu/dma-iommu.c:315:2: note: Returning zero, which participate=
s in a condition later
           return IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:994:6: note: Returning from 'dev_use_swiotlb'
           if (dev_use_swiotlb(dev))
               ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:994:2: note: Taking false branch
           if (dev_use_swiotlb(dev))
           ^
   drivers/iommu/dma-iommu.c:997:6: note: Assuming the condition is false
           if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:997:2: note: Taking false branch
           if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
           ^
   drivers/iommu/dma-iommu.c:1006:28: note: Assuming 'i' is < 'nents'
           for_each_sg(sg, s, nents, i) {
                                     ^
   include/linux/scatterlist.h:152:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   drivers/iommu/dma-iommu.c:1006:2: note: Loop condition is true.  Enterin=
g loop body
           for_each_sg(sg, s, nents, i) {
           ^
   include/linux/scatterlist.h:152:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   drivers/iommu/dma-iommu.c:1030:7: note: Assuming 'pad_len' is not equal =
to 0
                   if (pad_len && pad_len < s_length - 1) {
                       ^~~~~~~
   drivers/iommu/dma-iommu.c:1030:7: note: Left side of '&&' is true
   drivers/iommu/dma-iommu.c:1030:18: note: Assuming the condition is true
                   if (pad_len && pad_len < s_length - 1) {
                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:1030:3: note: Taking true branch
                   if (pad_len && pad_len < s_length - 1) {
                   ^
   drivers/iommu/dma-iommu.c:1031:17: note: Access to field 'length' result=
s in a dereference of a null pointer (loaded from variable 'prev')
                           prev->length +=3D pad_len;
                           ~~~~         ^
   drivers/iommu/dma-iommu.c:1149:7: warning: Value stored to 'coherent' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           bool coherent =3D dev_is_dma_coherent(dev);
                ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/dma-iommu.c:1149:7: note: Value stored to 'coherent' durin=
g its initialization is never read
           bool coherent =3D dev_is_dma_coherent(dev);
                ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/acpi/acpi_dbg.c:634:4: warning: Value stored to 'count' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           count -=3D ret;
                           ^        ~~~
   drivers/acpi/acpi_dbg.c:634:4: note: Value stored to 'count' is never re=
ad
                           count -=3D ret;
                           ^        ~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/acpi/pfr_telemetry.c:176:3: warning: Value stored to 'ext_status=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ext_status =3D obj->integer.value;
                   ^            ~~~~~~~~~~~~~~~~~~
   drivers/acpi/pfr_telemetry.c:176:3: note: Value stored to 'ext_status' i=
s never read
                   ext_status =3D obj->integer.value;
                   ^            ~~~~~~~~~~~~~~~~~~
   drivers/acpi/pfr_telemetry.c:207:3: warning: Value stored to 'ext_status=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ext_status =3D obj->integer.value;
                   ^            ~~~~~~~~~~~~~~~~~~
   drivers/acpi/pfr_telemetry.c:207:3: note: Value stored to 'ext_status' i=
s never read
                   ext_status =3D obj->integer.value;
                   ^            ~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/acpi/apei/apei-base.c:377:2: warning: Assigned value is garbage =
or undefined [clang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(res, resn, res_list, list) {
           ^
   include/linux/list.h:717:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:524:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^
   drivers/acpi/apei/apei-base.c:473:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/acpi/apei/apei-base.c:473:2: note: Taking false branch
           if (rc)
           ^
   drivers/acpi/apei/apei-base.c:483:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/acpi/apei/apei-base.c:483:2: note: Taking false branch
           if (rc)
           ^
   drivers/acpi/apei/apei-base.c:486:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/acpi/apei/apei-base.c:486:2: note: Taking false branch
           if (rc)
           ^
   drivers/acpi/apei/apei-base.c:489:6: note: Assuming 'arch_apei_filter_ad=
dr' is null
           if (arch_apei_filter_addr) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/apei/apei-base.c:489:2: note: Taking false branch
           if (arch_apei_filter_addr) {
           ^
   drivers/acpi/apei/apei-base.c:500:2: note: Loop condition is false. Exec=
ution continues on line 513
           list_for_each_entry(res, &resources->iomem, list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/acpi/apei/apei-base.c:513:2: note: Loop condition is false. Exec=
ution continues on line 525
           list_for_each_entry(res, &resources->ioport, list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/acpi/apei/apei-base.c:526:6: note: 'rc' is not equal to 0
           if (rc) {
               ^~
   drivers/acpi/apei/apei-base.c:526:2: note: Taking true branch
           if (rc) {
           ^
   drivers/acpi/apei/apei-base.c:527:3: note: Loop condition is false.  Exi=
ting loop
                   pr_err(APEI_PFX "Fail to merge resources!\n");
                   ^
   include/linux/printk.h:493:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/acpi/apei/apei-base.c:528:3: note: Control jumps to line 534
                   goto err_unmap_ioport;
                   ^
   drivers/acpi/apei/apei-base.c:534:2: note: Loop condition is false. Exec=
ution continues on line 539
           list_for_each_entry(res, &resources->ioport, list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/acpi/apei/apei-base.c:541:2: note: Loop condition is false. Exec=
ution continues on line 547
           list_for_each_entry(res, &resources->iomem, list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \

vim +/ext_status +176 drivers/acpi/pfr_telemetry.c

b0013e037a8b077 Chen Yu 2021-12-22  150  =

b0013e037a8b077 Chen Yu 2021-12-22  151  static int set_pfrt_log_level(int =
level, struct pfrt_log_device *pfrt_log_dev)
b0013e037a8b077 Chen Yu 2021-12-22  152  {
b0013e037a8b077 Chen Yu 2021-12-22  153  	acpi_handle handle =3D ACPI_HANDL=
E(pfrt_log_dev->parent_dev);
b0013e037a8b077 Chen Yu 2021-12-22  154  	union acpi_object *out_obj, *obj,=
 in_obj, in_buf;
b0013e037a8b077 Chen Yu 2021-12-22  155  	enum pfru_dsm_status status, ext_=
status;
b0013e037a8b077 Chen Yu 2021-12-22  156  	int ret =3D 0;
b0013e037a8b077 Chen Yu 2021-12-22  157  =

b0013e037a8b077 Chen Yu 2021-12-22  158  	memset(&in_obj, 0, sizeof(in_obj)=
);
b0013e037a8b077 Chen Yu 2021-12-22  159  	memset(&in_buf, 0, sizeof(in_buf)=
);
b0013e037a8b077 Chen Yu 2021-12-22  160  	in_obj.type =3D ACPI_TYPE_PACKAGE;
b0013e037a8b077 Chen Yu 2021-12-22  161  	in_obj.package.count =3D 1;
b0013e037a8b077 Chen Yu 2021-12-22  162  	in_obj.package.elements =3D &in_b=
uf;
b0013e037a8b077 Chen Yu 2021-12-22  163  	in_buf.type =3D ACPI_TYPE_INTEGER;
b0013e037a8b077 Chen Yu 2021-12-22  164  	in_buf.integer.value =3D level;
b0013e037a8b077 Chen Yu 2021-12-22  165  =

b0013e037a8b077 Chen Yu 2021-12-22  166  	out_obj =3D acpi_evaluate_dsm_typ=
ed(handle, &pfrt_log_guid,
b0013e037a8b077 Chen Yu 2021-12-22  167  					  pfrt_log_dev->info.log_revi=
d, PFRT_FUNC_SET_LEV,
b0013e037a8b077 Chen Yu 2021-12-22  168  					  &in_obj, ACPI_TYPE_PACKAGE);
b0013e037a8b077 Chen Yu 2021-12-22  169  	if (!out_obj)
b0013e037a8b077 Chen Yu 2021-12-22  170  		return -EINVAL;
b0013e037a8b077 Chen Yu 2021-12-22  171  =

b0013e037a8b077 Chen Yu 2021-12-22  172  	obj =3D &out_obj->package.element=
s[0];
b0013e037a8b077 Chen Yu 2021-12-22  173  	status =3D obj->integer.value;
b0013e037a8b077 Chen Yu 2021-12-22  174  	if (status !=3D DSM_SUCCEED) {
b0013e037a8b077 Chen Yu 2021-12-22  175  		obj =3D &out_obj->package.elemen=
ts[1];
b0013e037a8b077 Chen Yu 2021-12-22 @176  		ext_status =3D obj->integer.valu=
e;
b0013e037a8b077 Chen Yu 2021-12-22  177  		dev_dbg(pfrt_log_dev->parent_dev=
, "Error Status:%d\n", status);
b0013e037a8b077 Chen Yu 2021-12-22  178  		dev_dbg(pfrt_log_dev->parent_dev=
, "Error Extend Status:%d\n", ext_status);
b0013e037a8b077 Chen Yu 2021-12-22  179  		ret =3D -EBUSY;
b0013e037a8b077 Chen Yu 2021-12-22  180  	}
b0013e037a8b077 Chen Yu 2021-12-22  181  =

b0013e037a8b077 Chen Yu 2021-12-22  182  	kfree(out_obj);
b0013e037a8b077 Chen Yu 2021-12-22  183  =

b0013e037a8b077 Chen Yu 2021-12-22  184  	return ret;
b0013e037a8b077 Chen Yu 2021-12-22  185  }
b0013e037a8b077 Chen Yu 2021-12-22  186  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8548179752191411342==--

