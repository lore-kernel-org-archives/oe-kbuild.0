Content-Type: multipart/mixed; boundary="===============0378702447170859436=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/drm_gem_framebuffer_helper.c:56:21: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 11 Aug 2022 00:17:19 +0800
Message-ID: <202208110046.axD9co4L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0378702447170859436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/drm_gem_framebuffer_helper.c:56:21: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d4252071b97d2027d246f6a82cbee4d52f618b47
commit: 4f093a527b0b8f9d3059a4e8376e582fd14cf09e drm/gem: Warn on trying to=
 use a non-existing framebuffer plane
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-c004-20220808 (https://download.01.org/0day-ci/arch=
ive/20220811/202208110046.axD9co4L-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e=
2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4f093a527b0b8f9d3059a4e8376e582fd14cf09e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4f093a527b0b8f9d3059a4e8376e582fd14cf09e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/base/swnode.c:1110:29: note: Access to field 'managed' results i=
n a dereference of a null pointer
           to_swnode(fwnode)->managed =3D true;
                                      ^
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   mm/vmscan.c:240:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset(new->map, (int)0xff, old_map_size);
                   ^~~~~~
   mm/vmscan.c:240:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset(new->map, (int)0xff, old_map_size);
                   ^~~~~~
   mm/vmscan.c:241:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset((void *)new->map + old_map_size, 0, map_size - ol=
d_map_size);
                   ^~~~~~
   mm/vmscan.c:241:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset((void *)new->map + old_map_size, 0, map_size - ol=
d_map_size);
                   ^~~~~~
   mm/vmscan.c:243:3: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new->nr_deferred, old->nr_deferred, old_defer_siz=
e);
                   ^~~~~~
   mm/vmscan.c:243:3: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
                   memcpy(new->nr_deferred, old->nr_deferred, old_defer_siz=
e);
                   ^~~~~~
   mm/vmscan.c:244:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset((void *)new->nr_deferred + old_defer_size, 0,
                   ^~~~~~
   mm/vmscan.c:244:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset((void *)new->nr_deferred + old_defer_size, 0,
                   ^~~~~~
   mm/vmscan.c:1520:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(stat, 0, sizeof(*stat));
           ^~~~~~
   mm/vmscan.c:1520:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(stat, 0, sizeof(*stat));
           ^~~~~~
   mm/vmscan.c:2882:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(targets, nr, sizeof(nr));
           ^~~~~~
   mm/vmscan.c:2882:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(targets, nr, sizeof(nr));
           ^~~~~~
   mm/vmscan.c:3128:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(&sc->nr, 0, sizeof(sc->nr));
           ^~~~~~
   mm/vmscan.c:3128:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(&sc->nr, 0, sizeof(sc->nr));
           ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/gpu/drm/drm_managed.c:100:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dr, 0, offsetof(struct drmres, data));
           ^~~~~~
   drivers/gpu/drm/drm_managed.c:100:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(dr, 0, offsetof(struct drmres, data));
           ^~~~~~
   drivers/gpu/drm/drm_managed.c:228:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, s, size);
                   ^~~~~~
   drivers/gpu/drm/drm_managed.c:228:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, s, size);
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/gpu/drm/drm_vblank_work.c:243:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           kthread_init_work(&work->base, func);
           ^
   include/linux/kthread.h:173:3: note: expanded from macro 'kthread_init_w=
ork'
                   memset((work), 0, sizeof(struct kthread_work));         \
                   ^~~~~~
   drivers/gpu/drm/drm_vblank_work.c:243:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           kthread_init_work(&work->base, func);
           ^
   include/linux/kthread.h:173:3: note: expanded from macro 'kthread_init_w=
ork'
                   memset((work), 0, sizeof(struct kthread_work));         \
                   ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:56:21: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct drm_device *dev =3D fb->dev;
                              ^~~   ~~~~~~~
   drivers/gpu/drm/drm_gem_framebuffer_helper.c:56:21: note: Value stored t=
o 'dev' during its initialization is never read
           struct drm_device *dev =3D fb->dev;
                              ^~~   ~~~~~~~
   drivers/gpu/drm/drm_gem_framebuffer_helper.c:364:4: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&data[i], &map[i], sizeof(data[i]));
                           ^~~~~~
   drivers/gpu/drm/drm_gem_framebuffer_helper.c:364:4: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&data[i], &map[i], sizeof(data[i]));
                           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/gpu/drm/drm_atomic_state_helper.c:134:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, crtc->state, sizeof(*state));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:134:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(state, crtc->state, sizeof(*state));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:331:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, plane->state, sizeof(*state));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:331:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(state, plane->state, sizeof(*state));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:494:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, connector->state, sizeof(*state));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:494:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(state, connector->state, sizeof(*state));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:581:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, obj->state, sizeof(*state));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:581:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(state, obj->state, sizeof(*state));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:658:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(state, 0, sizeof(*state));
           ^~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:658:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(state, 0, sizeof(*state));
           ^~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/gpu/drm/virtio/virtgpu_fence.c:54:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
           ^~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_fence.c:54:2: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
           ^~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_fence.c:62:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(str, size, "%llu",
           ^~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_fence.c:62:2: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(str, size, "%llu",
           ^~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/gpu/drm/i2c/tda998x_drv.c:623:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[1], p, cnt);
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:623:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[1], p, cnt);
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1075:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(audio.status, params->iec.status,
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1075:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(audio.status, params->iec.status,
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1155:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, priv->connector.eld,
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1155:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, priv->connector.eld,
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1770:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(priv->audio.status, p->audio_params.status,

vim +/dev +56 drivers/gpu/drm/drm_gem_framebuffer_helper.c

55f7f72753abdd4 Andrzej Pietrasiewicz 2020-03-11  29  =

4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  30  /**
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  31   * DOC: overview
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  32   *
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  33   * This library =
provides helpers for drivers that don't subclass
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  34   * &drm_framebuf=
fer and use &drm_gem_object for their backing storage.
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  35   *
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  36   * Drivers witho=
ut additional needs to validate framebuffers can simply use
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  37   * drm_gem_fb_cr=
eate() and everything is wired up automatically. Other drivers
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  38   * can use all p=
arts independently.
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  39   */
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  40  =

4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  41  /**
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  42   * drm_gem_fb_ge=
t_obj() - Get GEM object backing the framebuffer
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  43   * @fb: Framebuf=
fer
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  44   * @plane: Plane=
 index
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  45   *
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  46   * No additional=
 reference is taken beyond the one that the &drm_frambuffer
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  47   * already holds.
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  48   *
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  49   * Returns:
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  50   * Pointer to &d=
rm_gem_object for the given framebuffer and plane index or NULL
2e187b2099034a2 Noralf Tr=C3=B8nnes        2017-09-22  51   * if it does no=
t exist.
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  52   */
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  53  struct drm_gem_o=
bject *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  54  					  unsigned =
int plane)
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  55  {
4f093a527b0b8f9 Thomas Zimmermann     2022-05-17 @56  	struct drm_device *d=
ev =3D fb->dev;
4f093a527b0b8f9 Thomas Zimmermann     2022-05-17  57  =

4f093a527b0b8f9 Thomas Zimmermann     2022-05-17  58  	if (drm_WARN_ON_ONCE=
(dev, plane >=3D ARRAY_SIZE(fb->obj)))
4f093a527b0b8f9 Thomas Zimmermann     2022-05-17  59  		return NULL;
4f093a527b0b8f9 Thomas Zimmermann     2022-05-17  60  	else if (drm_WARN_ON=
_ONCE(dev, !fb->obj[plane]))
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  61  		return NULL;
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  62  =

4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  63  	return fb->obj[=
plane];
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  64  }
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  65  EXPORT_SYMBOL_GP=
L(drm_gem_fb_get_obj);
4c3dbb2c312c9fa Noralf Tr=C3=B8nnes        2017-08-13  66  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0378702447170859436==--

