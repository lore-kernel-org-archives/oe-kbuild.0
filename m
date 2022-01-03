Content-Type: multipart/mixed; boundary="===============4101176651915384342=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/intel_region_lmem.c:80:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 03 Jan 2022 15:01:24 +0800
Message-ID: <202201031429.j2PfXnBc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4101176651915384342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matthew Auld <matthew.auld@intel.com>
CC: Chris Wilson <chris@chris-wilson.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: f178b89743867255b3946b40b640f379c3961c09 drm/i915: move region_lmem=
 under gt
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007-20211231 (https://download.01.org/0day-ci/ar=
chive/20220103/202201031429.j2PfXnBc-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 441de7=
5f69e975b0c7690044560520f8538b4efb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df178b89743867255b3946b40b640f379c3961c09
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f178b89743867255b3946b40b640f379c3961c09
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   7 warnings generated.
   drivers/char/tpm/tpm_tis_core.c:455:2: warning: Value stored to 'rc' is =
never read [clang-analyzer-deadcode.DeadStores]
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.c:455:2: note: Value stored to 'rc' is nev=
er read
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/char/tpm/tpm_infineon.c:172:3: warning: Value stored to 'status'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D tpm_data_in(RDFIFO);
                   ^        ~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_infineon.c:172:3: note: Value stored to 'status' is=
 never read
                   status =3D tpm_data_in(RDFIFO);
                   ^        ~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/char/tpm/eventlog/tpm1.c:275:2: warning: Value stored to 'len' i=
s never read [clang-analyzer-deadcode.DeadStores]
           len +=3D get_event_name(eventname, event, event_entry);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/eventlog/tpm1.c:275:2: note: Value stored to 'len' is n=
ever read
           len +=3D get_event_name(eventname, event, event_entry);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/gpu/drm/i915/gt/intel_region_lmem.c:80:3: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D init_fake_lmem_bar(mem);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_region_lmem.c:80:3: note: Value stored to =
'ret' is never read
                   ret =3D init_fake_lmem_bar(mem);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/video/fbdev/aty/radeon_base.c:306:3: warning: Value stored to 't=
mp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D INREG(CLOCK_CNTL_DATA);
                   ^
   drivers/video/fbdev/aty/radeon_base.c:306:3: note: Value stored to 'tmp'=
 is never read
   drivers/video/fbdev/aty/radeon_base.c:432:2: warning: Value stored to 't=
emp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D INREG(MPP_TB_CONFIG);
           ^
   drivers/video/fbdev/aty/radeon_base.c:432:2: note: Value stored to 'temp=
' is never read
   drivers/video/fbdev/aty/radeon_base.c:591:2: warning: Value stored to 't=
mp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D INREG16(DEVICE_ID);
           ^
   drivers/video/fbdev/aty/radeon_base.c:591:2: note: Value stored to 'tmp'=
 is never read
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/aty/radeon_pm.c:1270:7: warning: Value stored to 'sd=
ram_mode_reg' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
                   u32 sdram_mode_reg =3D rinfo->save_regs[35];
                       ^~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/aty/radeon_pm.c:1270:7: note: Value stored to 'sdram=
_mode_reg' during its initialization is never read
                   u32 sdram_mode_reg =3D rinfo->save_regs[35];
                       ^~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/aty/radeon_monitor.c:928:4: warning: Value stored to=
 'has_default_mode' is never read [clang-analyzer-deadcode.DeadStores]
                           has_default_mode =3D 1;
                           ^                  ~
   drivers/video/fbdev/aty/radeon_monitor.c:928:4: note: Value stored to 'h=
as_default_mode' is never read
                           has_default_mode =3D 1;
                           ^                  ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/via/viafbdev.c:147:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(fix->id, viafb_name);
           ^~~~~~
   drivers/video/fbdev/via/viafbdev.c:147:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(fix->id, viafb_name);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   6 warnings generated.
   Suppressed 6 warnings (3 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   lib/zstd/decompress.c:1557:4: warning: Value stored to 'remainingSize' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           remainingSize -=3D 4;
                           ^                ~
   lib/zstd/decompress.c:1557:4: note: Value stored to 'remainingSize' is n=
ever read
                           remainingSize -=3D 4;
                           ^                ~
   Suppressed 8 warnings (3 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.

vim +/ret +80 drivers/gpu/drm/i915/gt/intel_region_lmem.c

cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  73  =

cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  74  static int
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  75  region_lmem_init(struct intel_memory_region *mem)
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  76  {
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  77  	int ret;
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  78  =

8a25c4be583d8a drivers/gpu/drm/i915/intel_region_lmem.c Jani Nikula        =
2020-06-18  79  	if (mem->i915->params.fake_lmem_start) {
1629224324b6ca drivers/gpu/drm/i915/intel_region_lmem.c Matthew Auld       =
2019-10-30 @80  		ret =3D init_fake_lmem_bar(mem);
1629224324b6ca drivers/gpu/drm/i915/intel_region_lmem.c Matthew Auld       =
2019-10-30  81  		GEM_BUG_ON(ret);
1629224324b6ca drivers/gpu/drm/i915/intel_region_lmem.c Matthew Auld       =
2019-10-30  82  	}
1629224324b6ca drivers/gpu/drm/i915/intel_region_lmem.c Matthew Auld       =
2019-10-30  83  =

cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  84  	if (!io_mapping_init_wc(&mem->iomap,
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  85  				mem->io_start,
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  86  				resource_size(&mem->region)))
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  87  		return -EIO;
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  88  =

cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  89  	ret =3D intel_memory_region_init_buddy(mem);
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  90  	if (ret)
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  91  		io_mapping_fini(&mem->iomap);
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  92  =

38f1cb68582cee drivers/gpu/drm/i915/intel_region_lmem.c Lukasz Fiedorowicz =
2019-12-27  93  	intel_memory_region_set_name(mem, "local");
38f1cb68582cee drivers/gpu/drm/i915/intel_region_lmem.c Lukasz Fiedorowicz =
2019-12-27  94  =

cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  95  	return ret;
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  96  }
cb6d2467ace7fb drivers/gpu/drm/i915/intel_region_lmem.c Abdiel Janulgue    =
2019-10-25  97  =


:::::: The code at line 80 was first introduced by commit
:::::: 1629224324b6cab6f7f96e839c9b57b74cfd8349 drm/i915/lmem: add the fake=
 lmem region

:::::: TO: Matthew Auld <matthew.auld@intel.com>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4101176651915384342==--

