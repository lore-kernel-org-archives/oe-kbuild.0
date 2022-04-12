Content-Type: multipart/mixed; boundary="===============0185292410306844473=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:497:3: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 13 Apr 2022 04:14:04 +0800
Message-ID: <202204130410.GgQjsQnq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0185292410306844473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: d9a5696e7d52edf68776599f2a38b9aee1382be9 drm/i915/guc: Convert gold=
en context prep to iosys_map
date:   7 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-c007-20220411 (https://download.01.org/0day-ci/ar=
chive/20220413/202204130410.GgQjsQnq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f=
560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd9a5696e7d52edf68776599f2a38b9aee1382be9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d9a5696e7d52edf68776599f2a38b9aee1382be9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   if (is_acpi_data_node(child)) {
                   ^
   drivers/acpi/property.c:616:8: note: Calling 'acpi_data_node_match'
                           if (acpi_data_node_match(child, childname))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:446:9: note: Assuming the condition is true
           return is_acpi_data_node(fwnode) ?
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:446:9: note: '?' condition is true
   include/acpi/acpi_bus.h:447:12: note: Assuming the condition is false
                   (!strcmp(to_acpi_data_node(fwnode)->name, name)) : false;
                            ^
   include/acpi/acpi_bus.h:431:3: note: expanded from macro 'to_acpi_data_n=
ode'
                   is_acpi_data_node(__to_acpi_data_node_fwnode) ?         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:447:12: note: '?' condition is false
                   (!strcmp(to_acpi_data_node(fwnode)->name, name)) : false;
                            ^
   include/acpi/acpi_bus.h:431:3: note: expanded from macro 'to_acpi_data_n=
ode'
                   is_acpi_data_node(__to_acpi_data_node_fwnode) ?         \
                   ^
   include/acpi/acpi_bus.h:447:12: note: Access to field 'name' results in =
a dereference of a null pointer
                   (!strcmp(to_acpi_data_node(fwnode)->name, name)) : false;
                            ^
   include/acpi/acpi_bus.h:428:2: note: expanded from macro 'to_acpi_data_n=
ode'
           ({                                                              \
           ^
   4 warnings generated.
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:80:3: warning: Dereference of null=
 pointer [clang-analyzer-core.NullDereference]
                   i915->params.enable_guc,
                   ^
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:122:2: note: Value assigned to fie=
ld 'i915'
           intel_huc_init_early(&uc->huc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:124:2: note: Calling '__confirm_op=
tions'
           __confirm_options(uc);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:76:2: note: 'i915' initialized here
           struct drm_i915_private *i915 =3D uc_to_gt(uc)->i915;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:78:10: note: Assuming pointer valu=
e is null
           drm_dbg(&i915->drm,
                   ^
   include/drm/drm_print.h:461:15: note: expanded from macro 'drm_dbg'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__V=
A_ARGS__)
                        ^~~
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:78:2: note: '?' condition is false
           drm_dbg(&i915->drm,
           ^
   include/drm/drm_print.h:461:14: note: expanded from macro 'drm_dbg'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__V=
A_ARGS__)
                       ^
   drivers/gpu/drm/i915/gt/uc/intel_uc.c:80:3: note: Dereference of null po=
inter
                   i915->params.enable_guc,
                   ^
   include/drm/drm_print.h:461:63: note: expanded from macro 'drm_dbg'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__V=
A_ARGS__)
                                                                        ^~~=
~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:267:27: warning: Value stored t=
o 'i915' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct drm_i915_private *i915 =3D __uc_fw_to_gt(uc_fw)->i915;
                                    ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:267:27: note: Value stored to '=
i915' during its initialization is never read
           struct drm_i915_private *i915 =3D __uc_fw_to_gt(uc_fw)->i915;
                                    ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:203:2: warning: Undefined or =
garbage value returned to caller [clang-analyzer-core.uninitialized.UndefRe=
turn]
           return ret;
           ^      ~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:187:2: note: 'ret' declared w=
ithout an initial value
           int ret;
           ^~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:189:2: note: Taking false bra=
nch
           if (iosys_map_is_null(&guc->ads_map))
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:197:6: note: Assuming the con=
dition is false
           if (!intel_guc_is_ready(guc))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:197:2: note: Taking false bra=
nch
           if (!intel_guc_is_ready(guc))
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:200:2: note: Loop condition i=
s false. Execution continues on line 203
           with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
           ^
   drivers/gpu/drm/i915/intel_runtime_pm.h:184:2: note: expanded from macro=
 'with_intel_runtime_pm'
           for ((wf) =3D intel_runtime_pm_get(rpm); (wf); \
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:203:2: note: Undefined or gar=
bage value returned to caller
           return ret;
           ^      ~~~
>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:497:3: warning: Assigned valu=
e is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   ads_blob_write(guc, ads.golden_context_lrca[guc_class],
                   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:67:2: note: expanded from mac=
ro 'ads_blob_write'
           iosys_map_wr_field(&(guc_)->ads_map, 0, struct __guc_ads_blob,  \
           ^
   include/linux/iosys-map.h:456:8: note: expanded from macro 'iosys_map_wr=
_field'
                        typeof(s->field__), val__);                        =
                \
                        ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:743:6: note: Assuming field '=
ads_vma' is non-null
           if (!guc->ads_vma)
               ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:743:2: note: Taking false bra=
nch
           if (!guc->ads_vma)
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:746:2: note: Calling '__guc_a=
ds_init'
           __guc_ads_init(guc);
           ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:619:3: note: '?' condition is=
 false
                   hweight8(gt->info.sseu.slice_mask);
                   ^
   include/asm-generic/bitops/const_hweight.h:26:23: note: expanded from ma=
cro 'hweight8'
   #define hweight8(w)  (__builtin_constant_p(w) ? __const_hweight8(w)  : _=
_arch_hweight8(w))
                         ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:623:6: note: Assuming field '=
ver' is < 12
           if (GRAPHICS_VER(i915) >=3D 12 && !IS_DGFX(i915)) {
               ^
   drivers/gpu/drm/i915/i915_drv.h:943:29: note: expanded from macro 'GRAPH=
ICS_VER'
   #define GRAPHICS_VER(i915)              (INTEL_INFO(i915)->graphics.ver)
                                           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:623:31: note: Left side of '&=
&' is false
           if (GRAPHICS_VER(i915) >=3D 12 && !IS_DGFX(i915)) {
                                        ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:632:2: note: Calling 'guc_pre=
p_golden_context'
           guc_prep_golden_context(guc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:439:6: note: 'addr_ggtt' decl=
ared without an initial value
           u32 addr_ggtt, offset;
               ^~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:457:2: note: Taking false bra=
nch
           if (!iosys_map_is_null(&guc->ads_map)) {
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:468:2: note: Loop condition i=
s true.  Entering loop body
           for (engine_class =3D 0; engine_class <=3D MAX_ENGINE_CLASS; ++e=
ngine_class) {
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:469:7: note: 'engine_class' i=
s not equal to OTHER_CLASS
                   if (engine_class =3D=3D OTHER_CLASS)
                       ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:469:3: note: Taking false bra=
nch
                   if (engine_class =3D=3D OTHER_CLASS)
                   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:474:7: note: Assuming the con=
dition is false
                   if (!info_map_read(&info_map, engine_enabled_masks[guc_c=
lass]))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:474:3: note: Taking false bra=
nch
                   if (!info_map_read(&info_map, engine_enabled_masks[guc_c=
lass]))
                   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:481:3: note: Taking false bra=
nch
                   if (iosys_map_is_null(&guc->ads_map))
                   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:497:3: note: Assigned value i=
s garbage or undefined
                   ads_blob_write(guc, ads.golden_context_lrca[guc_class],
                   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:67:2: note: expanded from mac=
ro 'ads_blob_write'
           iosys_map_wr_field(&(guc_)->ads_map, 0, struct __guc_ads_blob,  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:456:8: note: expanded from macro 'iosys_map_wr=
_field'
                        typeof(s->field__), val__);                        =
                \
   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iosys-map.h:367:2: note: expanded from macro 'iosys_map_wr'
           type__ val =3D (val__);                                         =
  \
           ^            ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   mm/mmu_gather.c:86:3: warning: Value stored to 'batch' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   mm/mmu_gather.c:86:3: note: Value stored to 'batch' is never read
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   3 warnings generated.
   mm/vmalloc.c:300:2: warning: Value stored to 'start' is never read [clan=
g-analyzer-deadcode.DeadStores]
           start =3D addr;
           ^       ~~~~
   mm/vmalloc.c:300:2: note: Value stored to 'start' is never read
           start =3D addr;
           ^       ~~~~
   mm/vmalloc.c:582:18: warning: Value stored to 'nr' during its initializa=
tion is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
                           ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:582:18: note: Value stored to 'nr' during its initializatio=
n is never read
           unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
                           ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   6 warnings generated.
   mm/page_alloc.c:1151:13: warning: 2nd function call argument is an unini=
tialized value [clang-analyzer-core.CallAndMessage]
                   to_tail =3D buddy_merge_likely(pfn, buddy_pfn, page, ord=
er);
                             ^
   mm/page_alloc.c:8287:2: note: Calling 'drain_pages'
           drain_pages(cpu);

vim +497 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c

481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  433  =

d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  434  #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  435  #define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + LR_=
HW_CONTEXT_SIZE)
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  436  static int guc_prep_golden_context(struct intel_guc *g=
uc)
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  437  {
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  438  	struct intel_gt *gt =3D guc_to_gt(guc);
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  439  	u32 addr_ggtt, offset;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  440  	u32 total_size =3D 0, alloc_size, real_size;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  441  	u8 engine_class, guc_class;
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  442  	struct guc_gt_system_info local_info;
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  443  	struct iosys_map info_map;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  444  =

c24f0c1de481c1 drivers/gpu/drm/i915/intel_guc_ads.c       Sujaritha Sundare=
san 2018-01-02  445  	/*
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  446  	 * Reserve the memory for the golden contexts and poi=
nt GuC at it but
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  447  	 * leave it empty for now. The context data will be f=
illed in later
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  448  	 * once there is something available to put there.
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  449  	 *
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  450  	 * Note that the HWSP and ring context are not includ=
ed.
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  451  	 *
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  452  	 * Note also that the storage must be pinned in the G=
GTT, so that the
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  453  	 * address won't change after GuC has been told where=
 to find it. The
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  454  	 * GuC will also validate that the LRC base + size fa=
ll within the
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  455  	 * allowed GGTT range.
c24f0c1de481c1 drivers/gpu/drm/i915/intel_guc_ads.c       Sujaritha Sundare=
san 2018-01-02  456  	 */
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  457  	if (!iosys_map_is_null(&guc->ads_map)) {
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  458  		offset =3D guc_ads_golden_ctxt_offset(guc);
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  459  		addr_ggtt =3D intel_guc_ggtt_offset(guc, guc->ads_vm=
a) + offset;
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  460  		info_map =3D IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  461  						 offsetof(struct __guc_ads_blob, system_info));
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  462  	} else {
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  463  		memset(&local_info, 0, sizeof(local_info));
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  464  		iosys_map_set_vaddr(&info_map, &local_info);
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  465  		fill_engine_enable_masks(gt, &info_map);
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  466  	}
c24f0c1de481c1 drivers/gpu/drm/i915/intel_guc_ads.c       Sujaritha Sundare=
san 2018-01-02  467  =

481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  468  	for (engine_class =3D 0; engine_class <=3D MAX_ENGINE=
_CLASS; ++engine_class) {
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  469  		if (engine_class =3D=3D OTHER_CLASS)
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  470  			continue;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  471  =

481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  472  		guc_class =3D engine_class_to_guc_class(engine_class=
);
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  473  =

d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  474  		if (!info_map_read(&info_map, engine_enabled_masks[g=
uc_class]))
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  475  			continue;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  476  =

481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  477  		real_size =3D intel_engine_context_size(gt, engine_c=
lass);
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  478  		alloc_size =3D PAGE_ALIGN(real_size);
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  479  		total_size +=3D alloc_size;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  480  =

d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  481  		if (iosys_map_is_null(&guc->ads_map))
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  482  			continue;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  483  =

d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  484  		/*
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  485  		 * This interface is slightly confusing. We need to =
pass the
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  486  		 * base address of the full golden context and the s=
ize of just
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  487  		 * the engine state, which is the section of the con=
text image
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  488  		 * that starts after the execlists context. This is =
required to
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  489  		 * allow the GuC to restore just the engine state wh=
en a
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  490  		 * watchdog reset occurs.
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  491  		 * We calculate the engine state size by removing th=
e size of
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  492  		 * what comes before it in the context image (which =
is identical
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  493  		 * on all engines).
d135865cb8e396 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Matthew Brost    =
    2021-09-09  494  		 */
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  495  		ads_blob_write(guc, ads.eng_state_size[guc_class],
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  496  			       real_size - LRC_SKIP_SIZE);
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16 @497  		ads_blob_write(guc, ads.golden_context_lrca[guc_clas=
s],
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  498  			       addr_ggtt);
d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  499  =

481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  500  		addr_ggtt +=3D alloc_size;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  501  	}
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  502  =

d9a5696e7d52ed drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c Lucas De Marchi  =
    2022-02-16  503  	if (iosys_map_is_null(&guc->ads_map))
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  504  		return total_size;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  505  =

481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  506  	GEM_BUG_ON(guc->ads_golden_ctxt_size !=3D total_size);
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  507  	return total_size;
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  508  }
481d458caede24 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c John Harrison    =
    2021-07-26  509  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0185292410306844473==--

