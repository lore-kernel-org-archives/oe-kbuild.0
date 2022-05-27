Content-Type: multipart/mixed; boundary="===============3200863786588236583=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 14/22] dma-buf: Introduce new locking convention
Date: Sat, 28 May 2022 06:08:07 +0800
Message-ID: <202205280550.MWGs9cj4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3200863786588236583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220526235040.678984-15-dmitry.osipenko@collabora.com>
References: <20220526235040.678984-15-dmitry.osipenko@collabora.com>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: David Airlie <airlied@linux.ie>
TO: Gerd Hoffmann <kraxel@redhat.com>
TO: Gurchetan Singh <gurchetansingh@chromium.org>
TO: "Chia-I Wu" <olvaffe@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Daniel Almeida <daniel.almeida@collabora.com>
TO: Gert Wollny <gert.wollny@collabora.com>
TO: Gustavo Padovan <gustavo.padovan@collabora.com>
TO: Daniel Stone <daniel@fooishbar.org>
TO: Tomeu Vizoso <tomeu.vizoso@collabora.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Steven Price <steven.price@arm.com>
TO: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
TO: Rob Clark <robdclark@gmail.com>
TO: Emil Velikov <emil.l.velikov@gmail.com>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Qiang Yu <yuq825@gmail.com>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
TO: "Pan, Xinhui" <Xinhui.Pan@amd.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Tomasz Figa <tfiga@chromium.org>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>
TO: Jani Nikula <jani.nikula@linux.intel.com>

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20220527]
[cannot apply to drm/drm-next media-tree/master drm-intel/for-linux-next v5=
.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Add-=
generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220527-075=
717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
cdeffe87f790dfd1baa193020411ce9a538446d7
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220528/202205280550.MWGs9cj4-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/97f090c47ec995a8cf3=
bced98526ee3eaa25f10f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/Add-generic-memory=
-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220527-075717
        git checkout 97f090c47ec995a8cf3bced98526ee3eaa25f10f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:602:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", state);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:602:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", state);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:613:6: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%ld\n", &state) !=3D 1)
               ^~~~~~
   drivers/thermal/thermal_sysfs.c:613:6: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%ld\n", &state) !=3D 1)
               ^~~~~~
   drivers/thermal/thermal_sysfs.c:702:8: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(buf, "%u\n", stats->total_trans);
                 ^~~~~~~
   drivers/thermal/thermal_sysfs.c:702:8: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           ret =3D sprintf(buf, "%u\n", stats->total_trans);
                 ^~~~~~~
   drivers/thermal/thermal_sysfs.c:721:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf + len, "state%u\t%llu\n", i,
                          ^~~~~~~
   drivers/thermal/thermal_sysfs.c:721:10: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf + len, "state%u\t%llu\n", i,
                          ^~~~~~~
   drivers/thermal/thermal_sysfs.c:741:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(stats->trans_table, 0,
           ^~~~~~
   drivers/thermal/thermal_sysfs.c:741:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(stats->trans_table, 0,
           ^~~~~~
   drivers/thermal/thermal_sysfs.c:760:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D snprintf(buf + len, PAGE_SIZE - len, " From  :    To\n"=
);
                  ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:760:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           len +=3D snprintf(buf + len, PAGE_SIZE - len, " From  :    To\n"=
);
                  ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:761:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D snprintf(buf + len, PAGE_SIZE - len, "       : ");
                  ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:761:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           len +=3D snprintf(buf + len, PAGE_SIZE - len, "       : ");
                  ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:765:10: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D snprintf(buf + len, PAGE_SIZE - len, "state%2u =
 ", i);
                          ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:765:10: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   len +=3D snprintf(buf + len, PAGE_SIZE - len, "state%2u =
 ", i);
                          ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:770:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D snprintf(buf + len, PAGE_SIZE - len, "\n");
                  ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:770:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           len +=3D snprintf(buf + len, PAGE_SIZE - len, "\n");
                  ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:776:10: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D snprintf(buf + len, PAGE_SIZE - len, "state%2u:=
", i);
                          ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:776:10: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   len +=3D snprintf(buf + len, PAGE_SIZE - len, "state%2u:=
", i);
                          ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:781:11: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len +=3D snprintf(buf + len, PAGE_SIZE - len, "%=
8u ",
                                  ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:781:11: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           len +=3D snprintf(buf + len, PAGE_SIZE - len, "%=
8u ",
                                  ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:786:10: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D snprintf(buf + len, PAGE_SIZE - len, "\n");
                          ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:786:10: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   len +=3D snprintf(buf + len, PAGE_SIZE - len, "\n");
                          ^~~~~~~~
   drivers/thermal/thermal_sysfs.c:881:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", instance->trip);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:881:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", instance->trip);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:891:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", instance->weight);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:891:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", instance->weight);
                  ^~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   lib/xarray.c:2035:18: warning: Value stored to 'node' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   lib/xarray.c:2035:18: note: Value stored to 'node' during its initializa=
tion is never read
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
>> drivers/dma-buf/dma-buf.c:1339:3: warning: Undefined or garbage value re=
turned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                   return ret;
                   ^
   drivers/dma-buf/dma-buf.c:1378:14: note: Assuming 'dmabuf' is non-null
           if (WARN_ON(!dmabuf))
                       ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/dma-buf/dma-buf.c:1378:6: note: Taking false branch
           if (WARN_ON(!dmabuf))
               ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/dma-buf/dma-buf.c:1378:2: note: Taking false branch
           if (WARN_ON(!dmabuf))
           ^
   drivers/dma-buf/dma-buf.c:1381:6: note: Assuming field 'vmap' is non-null
           if (!dmabuf->ops->vmap)
               ^~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:1381:2: note: Taking false branch
           if (!dmabuf->ops->vmap)
           ^
   drivers/dma-buf/dma-buf.c:1385:8: note: Calling 'dma_buf_vmap_locked'
           ret =3D dma_buf_vmap_locked(dmabuf, map);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:1331:2: note: 'ret' declared without an initia=
l value
           int ret;
           ^~~~~~~
   drivers/dma-buf/dma-buf.c:1333:2: note: Loop condition is false.  Exitin=
g loop
           dma_resv_assert_held(dmabuf->resv);
           ^
   include/linux/dma-resv.h:302:35: note: expanded from macro 'dma_resv_ass=
ert_held'
   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
                                     ^
   include/linux/lockdep.h:411:34: note: expanded from macro 'lockdep_asser=
t_held'
   #define lockdep_assert_held(l)                  do { (void)(l); } while =
(0)
                                                   ^
   drivers/dma-buf/dma-buf.c:1335:6: note: Assuming field 'vmapping_counter=
' is not equal to 0
           if (dmabuf->vmapping_counter) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:1335:2: note: Taking true branch
           if (dmabuf->vmapping_counter) {
           ^
   drivers/dma-buf/dma-buf.c:1337:3: note: Taking false branch
                   BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
                   ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/dma-buf/dma-buf.c:1337:3: note: Loop condition is false.  Exitin=
g loop
                   BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
                   ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/dma-buf/dma-buf.c:1339:3: note: Undefined or garbage value retur=
ned to caller
                   return ret;
                   ^      ~~~
   Suppressed 35 warnings (34 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   fs/xfs/libxfs/xfs_refcount_btree.c:66:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&args, 0, sizeof(args));
           ^~~~~~
   fs/xfs/libxfs/xfs_refcount_btree.c:66:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&args, 0, sizeof(args));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   fs/xfs/libxfs/xfs_sb.c:559:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&to->sb_uuid, &from->sb_uuid, sizeof(to->sb_uuid));
           ^~~~~~
   fs/xfs/libxfs/xfs_sb.c:559:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&to->sb_uuid, &from->sb_uuid, sizeof(to->sb_uuid));
           ^~~~~~
   fs/xfs/libxfs/xfs_sb.c:573:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&to->sb_fname, &from->sb_fname, sizeof(to->sb_fname));
           ^~~~~~
   fs/xfs/libxfs/xfs_sb.c:573:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&to->sb_fname, &from->sb_fname, sizeof(to->sb_fname));
           ^~~~~~
   fs/xfs/libxfs/xfs_sb.c:708:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&to->sb_uuid, &from->sb_uuid, sizeof(to->sb_uuid));
           ^~~~~~
   fs/xfs/libxfs/xfs_sb.c:708:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&to->sb_uuid, &from->sb_uuid, sizeof(to->sb_uuid));
           ^~~~~~
   fs/xfs/libxfs/xfs_sb.c:722:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&to->sb_fname, &from->sb_fname, sizeof(to->sb_fname));
           ^~~~~~
   fs/xfs/libxfs/xfs_sb.c:722:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&to->sb_fname, &from->sb_fname, sizeof(to->sb_fname));
           ^~~~~~
   fs/xfs/libxfs/xfs_sb.c:1128:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(geo, 0, sizeof(struct xfs_fsop_geom));
           ^~~~~~
   fs/xfs/libxfs/xfs_sb.c:1128:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(geo, 0, sizeof(struct xfs_fsop_geom));

vim +1339 drivers/dma-buf/dma-buf.c

4c78513e457f72 drivers/base/dma-buf.c    Daniel Vetter   2012-04-24  1327  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1328  =
static int dma_buf_vmap_locked(struct dma_buf *dmabuf, struct iosys_map *ma=
p)
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1329  {
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1330  =
	struct iosys_map ptr;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1331  =
	int ret;
4c78513e457f72 drivers/base/dma-buf.c    Daniel Vetter   2012-04-24  1332  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1333  =
	dma_resv_assert_held(dmabuf->resv);
4c78513e457f72 drivers/base/dma-buf.c    Daniel Vetter   2012-04-24  1334  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1335  =
	if (dmabuf->vmapping_counter) {
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1336  =
		dmabuf->vmapping_counter++;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1337  =
		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1338  =
		*map =3D dmabuf->vmap_ptr;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27 @1339  =
		return ret;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1340  =
	}
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1341  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1342  =
	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1343  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1344  =
	ret =3D dmabuf->ops->vmap(dmabuf, &ptr);
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1345  =
	if (WARN_ON_ONCE(ret))
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1346  =
		return ret;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1347  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1348  =
	dmabuf->vmap_ptr =3D ptr;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1349  =
	dmabuf->vmapping_counter =3D 1;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1350  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1351  =
	*map =3D dmabuf->vmap_ptr;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1352  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1353  =
	return 0;
4c78513e457f72 drivers/base/dma-buf.c    Daniel Vetter   2012-04-24  1354  }
98f86c9e4ae320 drivers/base/dma-buf.c    Dave Airlie     2012-05-20  1355  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3200863786588236583==--

