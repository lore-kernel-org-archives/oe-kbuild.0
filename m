Content-Type: multipart/mixed; boundary="===============5195860587054812311=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/sysfs_engines.c:27:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argu...
Date: Sun, 17 Apr 2022 14:33:17 +0800
Message-ID: <202204171458.RmC9WJsd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5195860587054812311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a2c29ccd9477861b16ddc02c411a6c9665250558
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-c007-20220411 (https://download.01.org/0day-ci/ar=
chive/20220417/202204171458.RmC9WJsd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f=
560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                     ^~~~
   block/blk-mq.c:2549:3: note: Calling 'blk_mq_commit_rqs'
                   blk_mq_commit_rqs(hctx, &queued, from_schedule);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:2379:6: note: Access to field 'queue' results in a derefe=
rence of a null pointer (loaded from variable 'hctx')
           if (hctx->queue->mq_ops->commit_rqs) {
               ^~~~
   block/blk-mq.c:3954:4: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(new_hctxs, hctxs, q->nr_hw_queues *
                           ^~~~~~
   block/blk-mq.c:3954:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(new_hctxs, hctxs, q->nr_hw_queues *
                           ^~~~~~
   block/blk-mq.c:4210:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new_tags, set->tags, cur_nr_hw_queues *
                   ^~~~~~
   block/blk-mq.c:4210:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(new_tags, set->tags, cur_nr_hw_queues *
                   ^~~~~~
   block/blk-mq.c:4320:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(set, 0, sizeof(*set));
           ^~~~~~
   block/blk-mq.c:4320:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(set, 0, sizeof(*set));
           ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/gpu/drm/drm_encoder.c:201:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(encoder, 0, sizeof(*encoder));
           ^~~~~~
   drivers/gpu/drm/drm_encoder.c:201:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(encoder, 0, sizeof(*encoder));
           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/gpu/drm/drm_property.c:576:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(blob->data, data, length);
                   ^~~~~~
   drivers/gpu/drm/drm_property.c:576:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(blob->data, data, length);
                   ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/gpu/drm/drm_plane.c:203:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(formats_ptr(blob_data), plane->format_types, formats_size=
);
           ^~~~~~
   drivers/gpu/drm/drm_plane.c:203:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(formats_ptr(blob_data), plane->format_types, formats_size=
);
           ^~~~~~
   drivers/gpu/drm/drm_plane.c:321:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(plane->format_types, formats, format_count * sizeof(uint3=
2_t));
           ^~~~~~
   drivers/gpu/drm/drm_plane.c:321:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(plane->format_types, formats, format_count * sizeof(uint3=
2_t));
           ^~~~~~
   drivers/gpu/drm/drm_plane.c:323:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(plane->modifiers, format_modifiers,
           ^~~~~~
   drivers/gpu/drm/drm_plane.c:323:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(plane->modifiers, format_modifiers,
           ^~~~~~
   drivers/gpu/drm/drm_plane.c:553:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(plane, 0, sizeof(*plane));
           ^~~~~~
   drivers/gpu/drm/drm_plane.c:553:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(plane, 0, sizeof(*plane));
           ^~~~~~
   drivers/gpu/drm/drm_plane.c:1183:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&new_req, req, sizeof(struct drm_mode_cursor));
           ^~~~~~
   drivers/gpu/drm/drm_plane.c:1183:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&new_req, req, sizeof(struct drm_mode_cursor));
           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/gpu/drm/i915/gt/shmem_utils.c:109:4: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(vaddr + offset_in_page(off), ptr, this);
                           ^~~~~~
   drivers/gpu/drm/i915/gt/shmem_utils.c:109:4: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(vaddr + offset_in_page(off), ptr, this);
                           ^~~~~~
   drivers/gpu/drm/i915/gt/shmem_utils.c:112:4: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ptr, vaddr + offset_in_page(off), this);
                           ^~~~~~
   drivers/gpu/drm/i915/gt/shmem_utils.c:112:4: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ptr, vaddr + offset_in_page(off), this);
                           ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
>> drivers/gpu/drm/i915/gt/sysfs_engines.c:27:9: warning: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedO=
rUnsafeBufferHandling]
           return sprintf(buf, "%s\n", kobj_to_engine(kobj)->name);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:27:9: note: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11
           return sprintf(buf, "%s\n", kobj_to_engine(kobj)->name);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:36:9: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", kobj_to_engine(kobj)->uabi_class);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:36:9: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", kobj_to_engine(kobj)->uabi_class);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:45:9: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", kobj_to_engine(kobj)->uabi_instance);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:45:9: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", kobj_to_engine(kobj)->uabi_instance);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:54:9: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%x\n", kobj_to_engine(kobj)->mmio_base);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:54:9: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%x\n", kobj_to_engine(kobj)->mmio_base);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:110:12: warning: Call to functio=
n 'snprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'snprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   len +=3D snprintf(buf + len, PAGE_SIZE -=
 len,
                                          ^~~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:110:12: note: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11
                                   len +=3D snprintf(buf + len, PAGE_SIZE -=
 len,
                                          ^~~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:113:11: warning: Call to functio=
n 'snprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'snprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len +=3D snprintf(buf + len, PAGE_SIZE - len,
                                  ^~~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:113:11: note: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11
                           len +=3D snprintf(buf + len, PAGE_SIZE - len,
                                  ^~~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:184:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->props.max_busywait_duration=
_ns);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:184:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->props.max_busywait_duration=
_ns);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:195:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->defaults.max_busywait_durat=
ion_ns);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:195:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->defaults.max_busywait_durat=
ion_ns);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:237:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->props.timeslice_duration_ms=
);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:237:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->props.timeslice_duration_ms=
);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:248:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->defaults.timeslice_duration=
_ms);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:248:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->defaults.timeslice_duration=
_ms);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:287:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->props.stop_timeout_ms);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:287:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->props.stop_timeout_ms);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:298:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->defaults.stop_timeout_ms);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:298:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->defaults.stop_timeout_ms);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:342:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->props.preempt_timeout_ms);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:342:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->props.preempt_timeout_ms);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:354:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->defaults.preempt_timeout_ms=
);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:354:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->defaults.preempt_timeout_ms=
);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:397:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->props.heartbeat_interval_ms=
);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:397:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->props.heartbeat_interval_ms=
);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:408:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", engine->defaults.heartbeat_interval=
_ms);
                  ^~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:408:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", engine->defaults.heartbeat_interval=
_ms);
                  ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/gpu/drm/i915/display/intel_vdsc.c:906:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rc_buf_thresh_dword, 0, sizeof(rc_buf_thresh_dword));
--
           ^~~~~~
   drivers/i2c/i2c-core-smbus.c:294:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(data.block + 1, values, length);
           ^~~~~~
   drivers/i2c/i2c-core-smbus.c:410:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(msg[0].buf + 1, data->block, msg[0].len -=
 1);
                           ^~~~~~
   drivers/i2c/i2c-core-smbus.c:410:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(msg[0].buf + 1, data->block, msg[0].len -=
 1);
                           ^~~~~~
   drivers/i2c/i2c-core-smbus.c:425:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg[0].buf + 1, data->block, msg[0].len - 1);
                   ^~~~~~
   drivers/i2c/i2c-core-smbus.c:425:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(msg[0].buf + 1, data->block, msg[0].len - 1);
                   ^~~~~~
   drivers/i2c/i2c-core-smbus.c:447:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(msg[0].buf + 1, data->block + 1, data->bl=
ock[0]);
                           ^~~~~~
   drivers/i2c/i2c-core-smbus.c:447:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(msg[0].buf + 1, data->block + 1, data->bl=
ock[0]);
                           ^~~~~~
   drivers/i2c/i2c-core-smbus.c:497:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(data->block + 1, msg[1].buf, data->block[=
0]);
                           ^~~~~~
   drivers/i2c/i2c-core-smbus.c:497:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(data->block + 1, msg[1].buf, data->block[=
0]);
                           ^~~~~~
   drivers/i2c/i2c-core-smbus.c:508:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(data->block, msg[1].buf, msg[1].buf[0] + =
1);
                           ^~~~~~
   drivers/i2c/i2c-core-smbus.c:508:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(data->block, msg[1].buf, msg[1].buf[0] + =
1);
                           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/input/joystick/adi.c:139:6: warning: Although the value stored t=
o 'z' is used in the enclosing expression, the value is never actually read=
 from 'z' [clang-analyzer-deadcode.DeadStores]
           v =3D z =3D gameport_read(gameport);
               ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joystick/adi.c:139:6: note: Although the value stored to '=
z' is used in the enclosing expression, the value is never actually read fr=
om 'z'
           v =3D z =3D gameport_read(gameport);
               ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joystick/adi.c:397:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, ADI_MAX_PHYS_LENGTH, adi_names[t], adi->id);
           ^~~~~~~~
   drivers/input/joystick/adi.c:397:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, ADI_MAX_PHYS_LENGTH, adi_names[t], adi->id);
           ^~~~~~~~
   drivers/input/joystick/adi.c:398:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(adi->name, ADI_MAX_NAME_LENGTH, "Logitech %s [%s]", buf=
, adi->cname);
           ^~~~~~~~
   drivers/input/joystick/adi.c:398:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(adi->name, ADI_MAX_NAME_LENGTH, "Logitech %s [%s]", buf=
, adi->cname);
           ^~~~~~~~
   drivers/input/joystick/adi.c:399:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(adi->phys, ADI_MAX_PHYS_LENGTH, "%s/input%d", port->gam=
eport->phys, half);
           ^~~~~~~~
   drivers/input/joystick/adi.c:399:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(adi->phys, ADI_MAX_PHYS_LENGTH, "%s/input%d", port->gam=
eport->phys, half);
           ^~~~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/ptp/ptp_vclock.c:129:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(vclock->info.name, PTP_CLOCK_NAME_LEN, "ptp%d_virt",
           ^~~~~~~~
   drivers/ptp/ptp_vclock.c:129:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(vclock->info.name, PTP_CLOCK_NAME_LEN, "ptp%d_virt",
           ^~~~~~~~
   drivers/ptp/ptp_vclock.c:163:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, PTP_CLOCK_NAME_LEN, "ptp%d", pclock_index);
           ^~~~~~~~
   drivers/ptp/ptp_vclock.c:163:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, PTP_CLOCK_NAME_LEN, "ptp%d", pclock_index);
           ^~~~~~~~
   drivers/ptp/ptp_vclock.c:179:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(*vclock_index, ptp->vclock_index, sizeof(int) * ptp->n_vc=
locks);
           ^~~~~~
   drivers/ptp/ptp_vclock.c:179:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(*vclock_index, ptp->vclock_index, sizeof(int) * ptp->n_vc=
locks);
           ^~~~~~
   drivers/ptp/ptp_vclock.c:198:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, PTP_CLOCK_NAME_LEN, "ptp%d", vclock_index);
           ^~~~~~~~
   drivers/ptp/ptp_vclock.c:198:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, PTP_CLOCK_NAME_LEN, "ptp%d", vclock_index);
           ^~~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
>> drivers/gpu/drm/i915/i915_pmu.c:806:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "%s\n", eattr->str);
                  ^~~~~~~
   drivers/gpu/drm/i915/i915_pmu.c:806:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "%s\n", eattr->str);
                  ^~~~~~~
   drivers/gpu/drm/i915/i915_pmu.c:836:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "config=3D0x%lx\n", eattr->val);
                  ^~~~~~~
   drivers/gpu/drm/i915/i915_pmu.c:836:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "config=3D0x%lx\n", eattr->val);
                  ^~~~~~~
   drivers/gpu/drm/i915/i915_pmu.c:1046:19: warning: Value stored to 'pmu' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i915_pmu *pmu =3D hlist_entry_safe(node, typeof(*pmu), cp=
uhp.node);
                            ^~~
   drivers/gpu/drm/i915/i915_pmu.c:1046:19: note: Value stored to 'pmu' dur=
ing its initialization is never read
           struct i915_pmu *pmu =3D hlist_entry_safe(node, typeof(*pmu), cp=
uhp.node);
                            ^~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/power/supply/power_supply_sysfs.c:251:13: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                           count +=3D sprintf(buf + count, "[%s] ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:251:13: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           count +=3D sprintf(buf + count, "[%s] ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:255:13: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                           count +=3D sprintf(buf + count, "%s ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:255:13: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           count +=3D sprintf(buf + count, "%s ",
                                    ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:299:10: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                   return sprintf(buf, "%s\n", ps_attr->text_values[value.i=
ntval]);
                          ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:299:10: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                   return sprintf(buf, "%s\n", ps_attr->text_values[value.i=
ntval]);
                          ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:308:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%s\n", value.strval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:308:9: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%s\n", value.strval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:311:9: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%d\n", value.intval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:311:9: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%d\n", value.intval);
                         ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:415:4: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(power_supply_attrs[i].attr_name, "_err_%=
d", i);
                           ^~~~~~~
   drivers/power/supply/power_supply_sysfs.c:415:4: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(power_supply_attrs[i].attr_name, "_err_%=
d", i);
                           ^~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   kernel/static_call.c:275:47: warning: Access to field 'func' results in =
a dereference of a null pointer (loaded from variable 'key') [clang-analyze=
r-core.NullDereference]
                   arch_static_call_transform(site_addr, NULL, key->func,
                                                               ^
   kernel/static_call.c:478:6: note: Assuming 'static_call_initialized' is =
false
           if (static_call_initialized)
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/static_call.c:478:2: note: Taking false branch
           if (static_call_initialized)
           ^
   kernel/static_call.c:483:8: note: Calling '__static_call_init'
           ret =3D __static_call_init(NULL, __start_static_call_sites,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/static_call.c:217:6: note: 'start' is not equal to 'stop'
           if (start =3D=3D stop)
               ^~~~~
   kernel/static_call.c:217:2: note: Taking false branch
           if (start =3D=3D stop)
           ^
   kernel/static_call.c:222:2: note: Loop condition is true.  Entering loop=
 body
           for (site =3D start; site < stop; site++) {
           ^
   kernel/static_call.c:225:8: note: 'mod' is null
                   if ((mod && within_module_init((unsigned long)site_addr,=
 mod)) ||
                        ^~~
   kernel/static_call.c:225:12: note: Left side of '&&' is false
                   if ((mod && within_module_init((unsigned long)site_addr,=
 mod)) ||
                            ^
   kernel/static_call.c:226:9: note: 'mod' is null
                       (!mod && init_section_contains(site_addr, 1)))
                         ^~~
   kernel/static_call.c:226:8: note: Left side of '&&' is true
                       (!mod && init_section_contains(site_addr, 1)))
                        ^
   kernel/static_call.c:225:3: note: Taking false branch
                   if ((mod && within_module_init((unsigned long)site_addr,=
 mod)) ||
                   ^
   kernel/static_call.c:229:3: note: Value assigned to 'key'
                   key =3D static_call_key(site);

vim +27 drivers/gpu/drm/i915/gt/sysfs_engines.c

4ec76dbeb62b5f Chris Wilson 2020-02-28  23  =

4ec76dbeb62b5f Chris Wilson 2020-02-28  24  static ssize_t
4ec76dbeb62b5f Chris Wilson 2020-02-28  25  name_show(struct kobject *kobj,=
 struct kobj_attribute *attr, char *buf)
4ec76dbeb62b5f Chris Wilson 2020-02-28  26  {
4ec76dbeb62b5f Chris Wilson 2020-02-28 @27  	return sprintf(buf, "%s\n", ko=
bj_to_engine(kobj)->name);
4ec76dbeb62b5f Chris Wilson 2020-02-28  28  }
4ec76dbeb62b5f Chris Wilson 2020-02-28  29  =


:::::: The code at line 27 was first introduced by commit
:::::: 4ec76dbeb62b5f897641af502b8309808e4e2d82 drm/i915/gt: Expose engine =
properties via sysfs

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5195860587054812311==--

