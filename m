Content-Type: multipart/mixed; boundary="===============3408865124122811379=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/usb/mixer_scarlett_gen2.c:3246:4: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments ...
Date: Sun, 10 Apr 2022 18:20:59 +0800
Message-ID: <202204101836.l3OOSZ5l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3408865124122811379==
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
head:   1862a69c917417142190bc18c8ce16680598664b
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220406 (https://download.01.org/0day-ci/archi=
ve/20220410/202204101836.l3OOSZ5l-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1143:2: note: Taking false branch
           if (resp_data && resp_size > 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:1151:2: note: Returning without writing =
to '*resp_data'
           return err;
           ^
   sound/usb/mixer_scarlett_gen2.c:1494:8: note: Returning from 'scarlett2_=
usb'
           err =3D scarlett2_usb(mixer, SCARLETT2_USB_GET_MUX,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1497:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:1497:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:1500:7: note: The value 0 is assigned to=
 'i'
           for (i =3D 0; i < count; i++)
                ^~~~~
   sound/usb/mixer_scarlett_gen2.c:1500:14: note: Assuming 'i' is < 'count'
           for (i =3D 0; i < count; i++)
                       ^~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1500:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; i < count; i++)
           ^
   sound/usb/mixer_scarlett_gen2.c:1501:3: note: 2nd function call argument=
 is an uninitialized value
                   scarlett2_usb_populate_mux(private, le32_to_cpu(data[i])=
);
                   ^
   sound/usb/mixer_scarlett_gen2.c:2866:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s),
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2866:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s),
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2964:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s), "Master HW Playback Volume");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2964:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s), "Master HW Playback Volume");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2978:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2978:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2982:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2982:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2992:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s),
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2992:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s),
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3010:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3010:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3055:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s), fmt, i + 1 + info->level_input_fi=
rst,
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3055:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s), fmt, i + 1 + info->level_input_fi=
rst,
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3065:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s), fmt, i + 1, "Pad", "Switch");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3065:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s), fmt, i + 1, "Pad", "Switch");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3074:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s), fmt, i + 1, "Air", "Switch");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3074:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s), fmt, i + 1, "Air", "Switch");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3084:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s), fmt, i + 1,
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3084:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s), fmt, i + 1,
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3097:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s), fmt2, from, to,
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3097:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s), fmt2, from, to,
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3207:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3207:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
>> sound/usb/mixer_scarlett_gen2.c:3246:4: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                           sprintf(uinfo->value.enumerated.name,
                           ^~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3246:4: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                           sprintf(uinfo->value.enumerated.name,
                           ^~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3341:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s) - 5, descr, channel + 1);
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3341:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s) - 5, descr, channel + 1);
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3342:4: warning: Call to function 'strca=
t' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                           strcat(s, " Enum");
                           ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:3342:4: note: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119
                           strcat(s, " Enum");
                           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c:59:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c:59:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
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
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/keyboard/lkkbd.c:627:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lk->keycode, lkkbd_keycode, sizeof(lk->keycode));
           ^~~~~~
   drivers/input/keyboard/lkkbd.c:627:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(lk->keycode, lkkbd_keycode, sizeof(lk->keycode));
           ^~~~~~
   drivers/input/keyboard/lkkbd.c:630:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(lk->phys, sizeof(lk->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   drivers/input/keyboard/lkkbd.c:630:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(lk->phys, sizeof(lk->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   fs/udf/file.c:53:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kaddr, iinfo->i_data + iinfo->i_lenEAttr, isize);
           ^~~~~~
   fs/udf/file.c:53:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(kaddr, iinfo->i_data + iinfo->i_lenEAttr, isize);
           ^~~~~~
   fs/udf/file.c:54:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(kaddr + isize, 0, PAGE_SIZE - isize);
           ^~~~~~
   fs/udf/file.c:54:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(kaddr + isize, 0, PAGE_SIZE - isize);
           ^~~~~~
   fs/udf/file.c:79:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iinfo->i_data + iinfo->i_lenEAttr, kaddr, i_size_read(ino=
de));
           ^~~~~~
   fs/udf/file.c:79:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(iinfo->i_data + iinfo->i_lenEAttr, kaddr, i_size_read(ino=
de));
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   fs/udf/inode.c:103:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(pos, &iinfo->cached_extent.epos,
                   ^~~~~~
   fs/udf/inode.c:103:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(pos, &iinfo->cached_extent.epos,
                   ^~~~~~
   fs/udf/inode.c:124:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&iinfo->cached_extent.epos, pos, sizeof(*pos));
           ^~~~~~
   fs/udf/inode.c:124:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(&iinfo->cached_extent.epos, pos, sizeof(*pos));
           ^~~~~~
   fs/udf/inode.c:286:3: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(kaddr + iinfo->i_lenAlloc, 0x00,

vim +3246 sound/usb/mixer_scarlett_gen2.c

9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3220  =

9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3221  static int scarlett2_m=
ux_src_enum_ctl_info(struct snd_kcontrol *kctl,
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3222  					   struct snd_ctl=
_elem_info *uinfo)
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3223  {
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3224  	struct usb_mixer_elem=
_info *elem =3D kctl->private_data;
e46f2195c86b00 Geoffrey D. Bennett 2021-06-21  3225  	struct scarlett2_data=
 *private =3D elem->head.mixer->private_data;
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22  3226  	const struct scarlett=
2_device_info *info =3D private->info;
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22  3227  	const int (*port_coun=
t)[SCARLETT2_PORT_DIRNS] =3D info->port_count;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3228  	unsigned int item =3D=
 uinfo->value.enumerated.item;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3229  	int items =3D private=
->num_mux_srcs;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3230  	int port_type;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3231  =

9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3232  	uinfo->type =3D SNDRV=
_CTL_ELEM_TYPE_ENUMERATED;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3233  	uinfo->count =3D elem=
->channels;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3234  	uinfo->value.enumerat=
ed.items =3D items;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3235  =

9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3236  	if (item >=3D items)
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3237  		item =3D uinfo->valu=
e.enumerated.item =3D items - 1;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3238  =

9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3239  	for (port_type =3D 0;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3240  	     port_type < SCAR=
LETT2_PORT_TYPE_COUNT;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3241  	     port_type++) {
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22  3242  		if (item < port_coun=
t[port_type][SCARLETT2_PORT_IN]) {
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22  3243  			const struct scarle=
tt2_port *port =3D
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22  3244  				&scarlett2_ports[p=
ort_type];
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22  3245  =

9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29 @3246  			sprintf(uinfo->valu=
e.enumerated.name,
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22  3247  				port->src_descr, i=
tem + port->src_num_offset);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3248  			return 0;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3249  		}
e2cc91ac8f4e1b Geoffrey D. Bennett 2021-06-22  3250  		item -=3D port_count=
[port_type][SCARLETT2_PORT_IN];
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3251  	}
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3252  =

9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3253  	return -EINVAL;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3254  }
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  3255  =


:::::: The code at line 3246 was first introduced by commit
:::::: 9e4d5c1be21f0c00e747e92186784f3298309b3e ALSA: usb-audio: Scarlett G=
en 2 mixer interface

:::::: TO: Geoffrey D. Bennett <g@b4.vu>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3408865124122811379==--

