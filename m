Content-Type: multipart/mixed; boundary="===============5593527745478437240=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/cmipci.c:3113:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides b...
Date: Fri, 15 Apr 2022 12:59:36 +0800
Message-ID: <202204151205.9P8AKnJg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5593527745478437240==
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
head:   028192fea1de083f4f12bfb1eb7c4d7beb5c8ecd
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220414 (https://download.01.org/0day-ci/arc=
hive/20220415/202204151205.9P8AKnJg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6e=
a489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~
   drivers/misc/habanalabs/common/habanalabs_drv.c:329:2: note: Call to fun=
ction 'strncpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(hdev->status[HL_DEVICE_STATUS_OPERATIONAL], "operational=
", HL_STR_MAX);
           ^~~~~~~
   drivers/misc/habanalabs/common/habanalabs_drv.c:330:2: warning: Call to =
function 'strncpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'strncpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(hdev->status[HL_DEVICE_STATUS_IN_RESET], "in reset", HL_=
STR_MAX);
           ^~~~~~~
   drivers/misc/habanalabs/common/habanalabs_drv.c:330:2: note: Call to fun=
ction 'strncpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(hdev->status[HL_DEVICE_STATUS_IN_RESET], "in reset", HL_=
STR_MAX);
           ^~~~~~~
   drivers/misc/habanalabs/common/habanalabs_drv.c:331:2: warning: Call to =
function 'strncpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'strncpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(hdev->status[HL_DEVICE_STATUS_MALFUNCTION], "disabled", =
HL_STR_MAX);
           ^~~~~~~
   drivers/misc/habanalabs/common/habanalabs_drv.c:331:2: note: Call to fun=
ction 'strncpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(hdev->status[HL_DEVICE_STATUS_MALFUNCTION], "disabled", =
HL_STR_MAX);
           ^~~~~~~
   drivers/misc/habanalabs/common/habanalabs_drv.c:332:2: warning: Call to =
function 'strncpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'strncpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(hdev->status[HL_DEVICE_STATUS_NEEDS_RESET], "needs reset=
", HL_STR_MAX);
           ^~~~~~~
   drivers/misc/habanalabs/common/habanalabs_drv.c:332:2: note: Call to fun=
ction 'strncpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(hdev->status[HL_DEVICE_STATUS_NEEDS_RESET], "needs reset=
", HL_STR_MAX);
           ^~~~~~~
   drivers/misc/habanalabs/common/habanalabs_drv.c:333:2: warning: Call to =
function 'strncpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'strncpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(hdev->status[HL_DEVICE_STATUS_IN_DEVICE_CREATION],
           ^~~~~~~
   drivers/misc/habanalabs/common/habanalabs_drv.c:333:2: note: Call to fun=
ction 'strncpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(hdev->status[HL_DEVICE_STATUS_IN_DEVICE_CREATION],
           ^~~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   sound/pci/atiixp_modem.c:1071:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ac97, 0, sizeof(ac97));
                   ^~~~~~
   sound/pci/atiixp_modem.c:1071:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&ac97, 0, sizeof(ac97));
                   ^~~~~~
   sound/pci/atiixp_modem.c:1239:2: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           sprintf(card->longname, "%s rev %x at 0x%lx, irq %i",
           ^~~~~~~
   sound/pci/atiixp_modem.c:1239:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           sprintf(card->longname, "%s rev %x at 0x%lx, irq %i",
           ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   sound/pci/cmipci.c:1121:5: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(val, 0, sizeof(*val));
                                   ^~~~~~
   sound/pci/cmipci.c:1121:5: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                                   memset(val, 0, sizeof(*val));
                                   ^~~~~~
   sound/pci/cmipci.c:1158:5: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(val, 0, sizeof(*val));
                                   ^~~~~~
   sound/pci/cmipci.c:1158:5: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                                   memset(val, 0, sizeof(*val));
                                   ^~~~~~
   sound/pci/cmipci.c:1318:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(runtime->dma_area, 0, PAGE_SIZE);
                   ^~~~~~
   sound/pci/cmipci.c:1318:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(runtime->dma_area, 0, PAGE_SIZE);
                   ^~~~~~
   sound/pci/cmipci.c:2740:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&elem_id, 0, sizeof(elem_id));
                   ^~~~~~
   sound/pci/cmipci.c:2740:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(&elem_id, 0, sizeof(elem_id));
                   ^~~~~~
   sound/pci/cmipci.c:2742:3: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(elem_id.name, cm_saved_mixer[idx].name);
                   ^~~~~~
   sound/pci/cmipci.c:2742:3: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                   strcpy(elem_id.name, cm_saved_mixer[idx].name);
                   ^~~~~~
   sound/pci/cmipci.c:3033:3: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(cm->card->driver + strlen(cm->card->driver),
                   ^~~~~~~
   sound/pci/cmipci.c:3033:3: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
                   sprintf(cm->card->driver + strlen(cm->card->driver),
                   ^~~~~~~
   sound/pci/cmipci.c:3036:3: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(cm->card->driver + strlen(cm->card->driver), "-SW=
IEC");
                   ^~~~~~
   sound/pci/cmipci.c:3036:3: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                   strcpy(cm->card->driver + strlen(cm->card->driver), "-SW=
IEC");
                   ^~~~~~
   sound/pci/cmipci.c:3108:2: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "C-Media CMI%d", val);
           ^~~~~~~
   sound/pci/cmipci.c:3108:2: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "C-Media CMI%d", val);
           ^~~~~~~
   sound/pci/cmipci.c:3110:3: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(modelstr, " (model %d)", cm->chip_version);
                   ^~~~~~~
   sound/pci/cmipci.c:3110:3: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
                   sprintf(modelstr, " (model %d)", cm->chip_version);
                   ^~~~~~~
>> sound/pci/cmipci.c:3113:2: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           sprintf(card->longname, "%s%s at %#lx, irq %i",
           ^~~~~~~
   sound/pci/cmipci.c:3113:2: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           sprintf(card->longname, "%s%s at %#lx, irq %i",
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/opp/of.c:585:3: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "opp-microvolt-%s",
                   ^~~~~~~~
   drivers/opp/of.c:585:3: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "opp-microvolt-%s",
                   ^~~~~~~~
   drivers/opp/of.c:592:3: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "opp-microvolt");
                   ^~~~~~~
   drivers/opp/of.c:592:3: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
                   sprintf(name, "opp-microvolt");
                   ^~~~~~~
   drivers/opp/of.c:648:3: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "opp-microamp-%s",
                   ^~~~~~~~
   drivers/opp/of.c:648:3: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "opp-microamp-%s",
                   ^~~~~~~~
   drivers/opp/of.c:655:3: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "opp-microamp");
                   ^~~~~~~
   drivers/opp/of.c:655:3: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
                   sprintf(name, "opp-microamp");
                   ^~~~~~~
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/opp/debugfs.c:24:3: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, NAME_MAX, "%s-%s", dev_name(dev->parent),
                   ^~~~~~~~
   drivers/opp/debugfs.c:24:3: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   snprintf(name, NAME_MAX, "%s-%s", dev_name(dev->parent),
                   ^~~~~~~~
   drivers/opp/debugfs.c:27:3: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, NAME_MAX, "%s", dev_name(dev));
                   ^~~~~~~~
   drivers/opp/debugfs.c:27:3: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   snprintf(name, NAME_MAX, "%s", dev_name(dev));
                   ^~~~~~~~
   drivers/opp/debugfs.c:62:3: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "icc-path-%.1d", i);
                   ^~~~~~~~
   drivers/opp/debugfs.c:62:3: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "icc-path-%.1d", i);
                   ^~~~~~~~
   drivers/opp/debugfs.c:86:3: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "supply-%d", i);
                   ^~~~~~~~
   drivers/opp/debugfs.c:86:3: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "supply-%d", i);
                   ^~~~~~~~
   drivers/opp/debugfs.c:123:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "opp:%lu", id);
           ^~~~~~~~
   drivers/opp/debugfs.c:123:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "opp:%lu", id);
           ^~~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   kernel/irq/debugfs.c:234:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "%d", irq);
           ^~~~~~~
   kernel/irq/debugfs.c:234:2: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           sprintf(name, "%d", irq);
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   kernel/rcu/sync.c:23:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rsp, 0, sizeof(*rsp));
           ^~~~~~
   kernel/rcu/sync.c:23:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(rsp, 0, sizeof(*rsp));
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/char/hw_random/ixp4xx-rng.c:44:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D &pdev->dev;
--
                  ^~~~~~~
   drivers/regulator/core.c:787:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->use_count);
                  ^~~~~~~
   drivers/regulator/core.c:787:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->use_count);
                  ^~~~~~~
   drivers/regulator/core.c:798:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "voltage\n");
                          ^~~~~~~
   drivers/regulator/core.c:798:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "voltage\n");
                          ^~~~~~~
   drivers/regulator/core.c:800:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "current\n");
                          ^~~~~~~
   drivers/regulator/core.c:800:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "current\n");
                          ^~~~~~~
   drivers/regulator/core.c:802:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "unknown\n");
                  ^~~~~~~
   drivers/regulator/core.c:802:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "unknown\n");
                  ^~~~~~~
   drivers/regulator/core.c:811:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->state_mem.uV);
                  ^~~~~~~
   drivers/regulator/core.c:811:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->state_mem.uV);
                  ^~~~~~~
   drivers/regulator/core.c:820:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->state_disk.uV);
                  ^~~~~~~
   drivers/regulator/core.c:820:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->state_disk.uV);
                  ^~~~~~~
   drivers/regulator/core.c:829:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->state_standby.uV);
                  ^~~~~~~
   drivers/regulator/core.c:829:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->state_standby.uV);
                  ^~~~~~~
   drivers/regulator/core.c:910:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", report);
                  ^~~~~~~
   drivers/regulator/core.c:910:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", report);
                  ^~~~~~~
   drivers/regulator/core.c:1109:2: warning: Value stored to 'count' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           count +=3D scnprintf(buf + count, len - count, ", %s",
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:1109:2: note: Value stored to 'count' is never =
read
           count +=3D scnprintf(buf + count, len - count, ", %s",
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:1693:8: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, PAGE_SIZE,
                 ^~~~~~~~
   drivers/regulator/core.c:1693:8: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, PAGE_SIZE,
                 ^~~~~~~~
   drivers/regulator/core.c:1738:10: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   size =3D snprintf(buf, REG_STR_SIZE, "%s-%s",
                          ^~~~~~~~
   drivers/regulator/core.c:1738:10: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   size =3D snprintf(buf, REG_STR_SIZE, "%s-%s",
                          ^~~~~~~~
   drivers/regulator/core.c:3792:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3792:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:5083:3: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "%s-%s", dev_name(parent),
                   ^~~~~~~~
   drivers/regulator/core.c:5083:3: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "%s-%s", dev_name(parent),
                   ^~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   sound/pci/via82xx_modem.c:845:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, chip->card->shortname);
           ^~~~~~
   sound/pci/via82xx_modem.c:845:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(pcm->name, chip->card->shortname);
           ^~~~~~
   sound/pci/via82xx_modem.c:890:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ac97, 0, sizeof(ac97));
           ^~~~~~
   sound/pci/via82xx_modem.c:890:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&ac97, 0, sizeof(ac97));
           ^~~~~~
   sound/pci/via82xx_modem.c:1125:3: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(card->shortname, "VIA 82XX modem");
                   ^~~~~~~
   sound/pci/via82xx_modem.c:1125:3: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   sprintf(card->shortname, "VIA 82XX modem");
                   ^~~~~~~
>> sound/pci/via82xx_modem.c:1148:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           sprintf(card->longname, "%s at 0x%lx, irq %d",
           ^~~~~~~
   sound/pci/via82xx_modem.c:1148:2: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           sprintf(card->longname, "%s at 0x%lx, irq %d",
           ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   sound/pci/ac97/ac97_codec.c:1067:3: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1067:3: note: Value stored to 'val' is never=
 read
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1104:3: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1104:3: note: Value stored to 'val' is never=
 read
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1159:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&template, _template, sizeof(template));
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1159:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&template, _template, sizeof(template));
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1288:3: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   sprintf(name, "%s Switch", pfx);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1288:3: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   sprintf(name, "%s Switch", pfx);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1297:3: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   sprintf(name, "%s Volume", pfx);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1297:3: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   sprintf(name, "%s Volume", pfx);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1848:2: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "0x%x %c%c%c", id,
           ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1848:2: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           sprintf(name, "0x%x %c%c%c", id,
           ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1856:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, pid->name);
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1856:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(name, pid->name);
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1865:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(name, " ");
                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:1865:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(name, " ");
                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:1866:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(name, pid->name);
                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:1866:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(name, pid->name);
                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:1868:4: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(name + strlen(name), " rev %d", id & ~pi=
d->mask);
                           ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1868:4: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(name + strlen(name), " rev %d", id & ~pi=
d->mask);
                           ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1875:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name + strlen(name), " id %x", id & 0xff);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1875:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(name + strlen(name), " id %x", id & 0xff);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:2307:4: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(card->mixername, name);
                           ^~~~~~
   sound/pci/ac97/ac97_codec.c:2307:4: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
                           strcpy(card->mixername, name);
                           ^~~~~~
   sound/pci/ac97/ac97_codec.c:2310:5: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcat(card->mixername, ",");
                                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:2310:5: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                                   strcat(card->mixername, ",");
                                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:2311:5: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcat(card->mixername, name);
                                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:2311:5: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                                   strcat(card->mixername, name);
                                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:2314:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(comp, "AC97a:%08x", ac97->id);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:2314:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(comp, "AC97a:%08x", ac97->id);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:2328:4: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(card->mixername, name);
--
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:4158:7: warning: Value stored to 'voltag=
e_found' is never read [clang-analyzer-deadcode.DeadStores]
                                                   voltage_found =3D true;
                                                   ^               ~~~~
   drivers/gpu/drm/radeon/si_dpm.c:4158:7: note: Value stored to 'voltage_f=
ound' is never read
                                                   voltage_found =3D true;
                                                   ^               ~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5262:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(smc_state, 0, state_size);
           ^~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5262:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(smc_state, 0, state_size);
           ^~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5286:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(smc_state, 0, state_size);
                   ^~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5286:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(smc_state, 0, state_size);
                   ^~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5639:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(smc_mc_reg_table, 0, sizeof(SMC_SIslands_MCRegisters));
           ^~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5639:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(smc_mc_reg_table, 0, sizeof(SMC_SIslands_MCRegisters));
           ^~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5679:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(smc_mc_reg_table, 0, sizeof(SMC_SIslands_MCRegisters));
           ^~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5679:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(smc_mc_reg_table, 0, sizeof(SMC_SIslands_MCRegisters));
           ^~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5885:2: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
           ret =3D si_patch_single_dependency_table_based_on_leakage(rdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5885:2: note: Value stored to 'ret' is n=
ever read
           ret =3D si_patch_single_dependency_table_based_on_leakage(rdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5887:2: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
           ret =3D si_patch_single_dependency_table_based_on_leakage(rdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/si_dpm.c:5887:2: note: Value stored to 'ret' is n=
ever read
           ret =3D si_patch_single_dependency_table_based_on_leakage(rdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/media/pci/tw5864/tw5864-core.c:249:2: warning: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dev->name, sizeof(dev->name), "tw5864:%s", pci_name(pci=
_dev));
           ^~~~~~~~
   drivers/media/pci/tw5864/tw5864-core.c:249:2: note: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dev->name, sizeof(dev->name), "tw5864:%s", pci_name(pci=
_dev));
           ^~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/media/pci/tw5864/tw5864-video.c:515:3: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(input->md_threshold_grid_values, ctrl->val,
                   ^~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:515:3: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                   memset(input->md_threshold_grid_values, ctrl->val,
                   ^~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:522:3: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(input->md_threshold_grid_values,
                   ^~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:522:3: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(input->md_threshold_grid_values,
                   ^~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:570:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(i->name, sizeof(i->name), "Encoder %d", input->nr);
           ^~~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:570:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(i->name, sizeof(i->name), "Encoder %d", input->nr);
           ^~~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:605:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->card, sizeof(cap->card), "TW5864 Encoder %d",
           ^~~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:605:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->card, sizeof(cap->card), "TW5864 Encoder %d",
           ^~~~~~~~
>> drivers/media/pci/tw5864/tw5864-video.c:607:2: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
           sprintf(cap->bus_info, "PCI:%s", pci_name(input->root->pci));
           ^~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:607:2: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
           sprintf(cap->bus_info, "PCI:%s", pci_name(input->root->pci));
           ^~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:1367:21: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct tw5864_dev *dev =3D input->root;
                              ^~~   ~~~~~~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:1367:21: note: Value stored to '=
dev' during its initialization is never read
           struct tw5864_dev *dev =3D input->root;
                              ^~~   ~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/phy/phy-core.c:307:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D 0; /* Override possible ret =3D=3D -ENOTSUPP */
           ^     ~
   drivers/phy/phy-core.c:307:2: note: Value stored to 'ret' is never read
           ret =3D 0; /* Override possible ret =3D=3D -ENOTSUPP */
           ^     ~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   drivers/gpu/drm/radeon/si.c:1780:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(fw_name, sizeof(fw_name), "radeon/%s_pfp.bin", new_chip=
_name);
           ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1780:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(fw_name, sizeof(fw_name), "radeon/%s_pfp.bin", new_chip=
_name);
           ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1783:3: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(fw_name, sizeof(fw_name), "radeon/%s_pfp.bin", =
chip_name);
                   ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1783:3: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(fw_name, sizeof(fw_name), "radeon/%s_pfp.bin", =
chip_name);
                   ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1804:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(fw_name, sizeof(fw_name), "radeon/%s_me.bin", new_chip_=
name);
           ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1804:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(fw_name, sizeof(fw_name), "radeon/%s_me.bin", new_chip_=
name);
           ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1807:3: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(fw_name, sizeof(fw_name), "radeon/%s_me.bin", c=
hip_name);
                   ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1807:3: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(fw_name, sizeof(fw_name), "radeon/%s_me.bin", c=
hip_name);
                   ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1814:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1814:4: note: Value stored to 'err' is never=
 read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1827:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(fw_name, sizeof(fw_name), "radeon/%s_ce.bin", new_chip_=
name);
           ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1827:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(fw_name, sizeof(fw_name), "radeon/%s_ce.bin", new_chip_=
name);
           ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1830:3: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(fw_name, sizeof(fw_name), "radeon/%s_ce.bin", c=
hip_name);
                   ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1830:3: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(fw_name, sizeof(fw_name), "radeon/%s_ce.bin", c=
hip_name);
                   ^~~~~~~~
   drivers/gpu/drm/radeon/si.c:1837:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;

vim +3113 sound/pci/cmipci.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  3046  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  3047  	/* initialize codec regis=
ters */
3042ef75203947 Clemens Ladisch 2007-09-17  3048  	snd_cmipci_set_bit(cm, CM=
_REG_MISC_CTRL, CM_RESET);
3042ef75203947 Clemens Ladisch 2007-09-17  3049  	snd_cmipci_clear_bit(cm, =
CM_REG_MISC_CTRL, CM_RESET);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3050  	snd_cmipci_write(cm, CM_R=
EG_INT_HLDCLR, 0);	/* disable ints */
^1da177e4c3f41 Linus Torvalds  2005-04-16  3051  	snd_cmipci_ch_reset(cm, C=
M_CH_PLAY);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3052  	snd_cmipci_ch_reset(cm, C=
M_CH_CAPT);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3053  	snd_cmipci_write(cm, CM_R=
EG_FUNCTRL0, 0);	/* disable channels */
^1da177e4c3f41 Linus Torvalds  2005-04-16  3054  	snd_cmipci_write(cm, CM_R=
EG_FUNCTRL1, 0);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3055  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  3056  	snd_cmipci_write(cm, CM_R=
EG_CHFORMAT, 0);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3057  	snd_cmipci_set_bit(cm, CM=
_REG_MISC_CTRL, CM_ENDBDAC|CM_N4SPK3D);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3058  #if CM_CH_PLAY =3D=3D 1
^1da177e4c3f41 Linus Torvalds  2005-04-16  3059  	snd_cmipci_set_bit(cm, CM=
_REG_MISC_CTRL, CM_XCHGDAC);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3060  #else
^1da177e4c3f41 Linus Torvalds  2005-04-16  3061  	snd_cmipci_clear_bit(cm, =
CM_REG_MISC_CTRL, CM_XCHGDAC);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3062  #endif
4ee72717188767 Clemens Ladisch 2007-09-17  3063  	if (cm->chip_version) {
4ee72717188767 Clemens Ladisch 2007-09-17  3064  		snd_cmipci_write_b(cm, C=
M_REG_EXT_MISC, 0x20); /* magic */
4ee72717188767 Clemens Ladisch 2007-09-17  3065  		snd_cmipci_write_b(cm, C=
M_REG_EXT_MISC + 1, 0x09); /* more magic */
4ee72717188767 Clemens Ladisch 2007-09-17  3066  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3067  	/* Set Bus Master Request=
 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  3068  	snd_cmipci_set_bit(cm, CM=
_REG_FUNCTRL1, CM_BREQ);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3069  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  3070  	/* Assume TX and compatib=
le chip set (Autodetection required for VX chip sets) */
^1da177e4c3f41 Linus Torvalds  2005-04-16  3071  	switch (pci->device) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  3072  	case PCI_DEVICE_ID_CMEDIA=
_CM8738:
^1da177e4c3f41 Linus Torvalds  2005-04-16  3073  	case PCI_DEVICE_ID_CMEDIA=
_CM8738B:
^1da177e4c3f41 Linus Torvalds  2005-04-16  3074  		if (!pci_dev_present(int=
el_82437vx)) =

^1da177e4c3f41 Linus Torvalds  2005-04-16  3075  			snd_cmipci_set_bit(cm, =
CM_REG_MISC_CTRL, CM_TXVX);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3076  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3077  	default:
^1da177e4c3f41 Linus Torvalds  2005-04-16  3078  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3079  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3080  =

d6426257d2c960 Clemens Ladisch 2007-08-27  3081  	if (cm->chip_version < 68=
) {
d6426257d2c960 Clemens Ladisch 2007-08-27  3082  		val =3D pci->device < 0x=
110 ? 8338 : 8738;
d6426257d2c960 Clemens Ladisch 2007-08-27  3083  	} else {
d6426257d2c960 Clemens Ladisch 2007-08-27  3084  		switch (snd_cmipci_read_=
b(cm, CM_REG_INT_HLDCLR + 3) & 0x03) {
d6426257d2c960 Clemens Ladisch 2007-08-27  3085  		case 0:
d6426257d2c960 Clemens Ladisch 2007-08-27  3086  			val =3D 8769;
d6426257d2c960 Clemens Ladisch 2007-08-27  3087  			break;
d6426257d2c960 Clemens Ladisch 2007-08-27  3088  		case 2:
d6426257d2c960 Clemens Ladisch 2007-08-27  3089  			val =3D 8762;
d6426257d2c960 Clemens Ladisch 2007-08-27  3090  			break;
d6426257d2c960 Clemens Ladisch 2007-08-27  3091  		default:
d6426257d2c960 Clemens Ladisch 2007-08-27  3092  			switch ((pci->subsystem=
_vendor << 16) |
d6426257d2c960 Clemens Ladisch 2007-08-27  3093  				pci->subsystem_device)=
 {
d6426257d2c960 Clemens Ladisch 2007-08-27  3094  			case 0x13f69761:
d6426257d2c960 Clemens Ladisch 2007-08-27  3095  			case 0x584d3741:
d6426257d2c960 Clemens Ladisch 2007-08-27  3096  			case 0x584d3751:
d6426257d2c960 Clemens Ladisch 2007-08-27  3097  			case 0x584d3761:
d6426257d2c960 Clemens Ladisch 2007-08-27  3098  			case 0x584d3771:
d6426257d2c960 Clemens Ladisch 2007-08-27  3099  			case 0x72848384:
d6426257d2c960 Clemens Ladisch 2007-08-27  3100  				val =3D 8770;
d6426257d2c960 Clemens Ladisch 2007-08-27  3101  				break;
d6426257d2c960 Clemens Ladisch 2007-08-27  3102  			default:
d6426257d2c960 Clemens Ladisch 2007-08-27  3103  				val =3D 8768;
d6426257d2c960 Clemens Ladisch 2007-08-27  3104  				break;
d6426257d2c960 Clemens Ladisch 2007-08-27  3105  			}
d6426257d2c960 Clemens Ladisch 2007-08-27  3106  		}
d6426257d2c960 Clemens Ladisch 2007-08-27  3107  	}
b7e054a76fdc42 Clemens Ladisch 2007-09-03  3108  	sprintf(card->shortname, =
"C-Media CMI%d", val);
b7e054a76fdc42 Clemens Ladisch 2007-09-03  3109  	if (cm->chip_version < 68)
b7e054a76fdc42 Clemens Ladisch 2007-09-03  3110  		sprintf(modelstr, " (mod=
el %d)", cm->chip_version);
b7e054a76fdc42 Clemens Ladisch 2007-09-03  3111  	else
b7e054a76fdc42 Clemens Ladisch 2007-09-03  3112  		modelstr[0] =3D '\0';
b7e054a76fdc42 Clemens Ladisch 2007-09-03 @3113  	sprintf(card->longname, "=
%s%s at %#lx, irq %i",
b7e054a76fdc42 Clemens Ladisch 2007-09-03  3114  		card->shortname, modelst=
r, cm->iobase, cm->irq);
1e02d6ea85e5ca Clemens Ladisch 2007-08-21  3115  =

c78c950d28df98 Clemens Ladisch 2007-09-03  3116  	if (cm->chip_version >=3D=
 39) {
c9116ae45bd10e Clemens Ladisch 2007-08-24  3117  		val =3D snd_cmipci_read_=
b(cm, CM_REG_MPU_PCI + 1);
c9116ae45bd10e Clemens Ladisch 2007-08-24  3118  		if (val !=3D 0x00 && val=
 !=3D 0xff) {
d8cac6207ec1ab Takashi Iwai    2019-12-17  3119  			if (mpu_port[dev])
5747e54042c710 Clemens Ladisch 2005-09-14  3120  				iomidi =3D cm->iobase =
+ CM_REG_MPU_PCI;
c9116ae45bd10e Clemens Ladisch 2007-08-24  3121  			integrated_midi =3D 1;
c9116ae45bd10e Clemens Ladisch 2007-08-24  3122  		}
c9116ae45bd10e Clemens Ladisch 2007-08-24  3123  	}
c9116ae45bd10e Clemens Ladisch 2007-08-24  3124  	if (!integrated_midi) {
c78c950d28df98 Clemens Ladisch 2007-09-03  3125  		val =3D 0;
5747e54042c710 Clemens Ladisch 2005-09-14  3126  		iomidi =3D mpu_port[dev];
^1da177e4c3f41 Linus Torvalds  2005-04-16  3127  		switch (iomidi) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  3128  		case 0x320: val =3D CM_V=
MPU_320; break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3129  		case 0x310: val =3D CM_V=
MPU_310; break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3130  		case 0x300: val =3D CM_V=
MPU_300; break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3131  		case 0x330: val =3D CM_V=
MPU_330; break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3132  		default:
^1da177e4c3f41 Linus Torvalds  2005-04-16  3133  			    iomidi =3D 0; break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3134  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3135  		if (iomidi > 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  3136  			snd_cmipci_write(cm, CM=
_REG_LEGACY_CTRL, val);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3137  			/* enable UART */
^1da177e4c3f41 Linus Torvalds  2005-04-16  3138  			snd_cmipci_set_bit(cm, =
CM_REG_FUNCTRL1, CM_UART_EN);
88039815d8868f Clemens Ladisch 2007-09-03  3139  			if (inb(iomidi + 1) =3D=
=3D 0xff) {
40175bdba1bbf8 Takashi Iwai    2014-02-25  3140  				dev_err(cm->card->dev,
40175bdba1bbf8 Takashi Iwai    2014-02-25  3141  					"cannot enable MPU-40=
1 port at %#lx\n",
40175bdba1bbf8 Takashi Iwai    2014-02-25  3142  					iomidi);
88039815d8868f Clemens Ladisch 2007-09-03  3143  				snd_cmipci_clear_bit(c=
m, CM_REG_FUNCTRL1,
88039815d8868f Clemens Ladisch 2007-09-03  3144  						     CM_UART_EN);
88039815d8868f Clemens Ladisch 2007-09-03  3145  				iomidi =3D 0;
88039815d8868f Clemens Ladisch 2007-09-03  3146  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3147  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3148  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3149  =

45c41b4868c9db Clemens Ladisch 2007-08-22  3150  	if (cm->chip_version < 68=
) {
45c41b4868c9db Clemens Ladisch 2007-08-22  3151  		err =3D snd_cmipci_creat=
e_fm(cm, fm_port[dev]);
45c41b4868c9db Clemens Ladisch 2007-08-22  3152  		if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  3153  			return err;
45c41b4868c9db Clemens Ladisch 2007-08-22  3154  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3155  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  3156  	/* reset mixer */
^1da177e4c3f41 Linus Torvalds  2005-04-16  3157  	snd_cmipci_mixer_write(cm=
, 0, 0);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3158  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  3159  	snd_cmipci_proc_init(cm);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3160  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  3161  	/* create pcm devices */
^1da177e4c3f41 Linus Torvalds  2005-04-16  3162  	pcm_index =3D pcm_spdif_i=
ndex =3D 0;
4379588272cec1 Takashi Iwai    2021-06-08  3163  	err =3D snd_cmipci_pcm_ne=
w(cm, pcm_index);
4379588272cec1 Takashi Iwai    2021-06-08  3164  	if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  3165  		return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3166  	pcm_index++;
4379588272cec1 Takashi Iwai    2021-06-08  3167  	err =3D snd_cmipci_pcm2_n=
ew(cm, pcm_index);
4379588272cec1 Takashi Iwai    2021-06-08  3168  	if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  3169  		return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3170  	pcm_index++;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3171  	if (cm->can_ac3_hw || cm-=
>can_ac3_sw) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  3172  		pcm_spdif_index =3D pcm_=
index;
4379588272cec1 Takashi Iwai    2021-06-08  3173  		err =3D snd_cmipci_pcm_s=
pdif_new(cm, pcm_index);
4379588272cec1 Takashi Iwai    2021-06-08  3174  		if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  3175  			return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3176  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3177  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  3178  	/* create mixer interface=
 & switches */
4379588272cec1 Takashi Iwai    2021-06-08  3179  	err =3D snd_cmipci_mixer_=
new(cm, pcm_spdif_index);
4379588272cec1 Takashi Iwai    2021-06-08  3180  	if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  3181  		return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  3182  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  3183  	if (iomidi > 0) {
4379588272cec1 Takashi Iwai    2021-06-08  3184  		err =3D snd_mpu401_uart_=
new(card, 0, MPU401_HW_CMIPCI,
302e4c2f9e2b9f Takashi Iwai    2006-05-23  3185  					  iomidi,
302e4c2f9e2b9f Takashi Iwai    2006-05-23  3186  					  (integrated_midi ?
dba8b46992c559 Clemens Ladisch 2011-09-13  3187  					   MPU401_INFO_INTEGR=
ATED : 0) |
dba8b46992c559 Clemens Ladisch 2011-09-13  3188  					  MPU401_INFO_IRQ_HOO=
K,
4379588272cec1 Takashi Iwai    2021-06-08  3189  					  -1, &cm->rmidi);
4379588272cec1 Takashi Iwai    2021-06-08  3190  		if (err < 0)
40175bdba1bbf8 Takashi Iwai    2014-02-25  3191  			dev_err(cm->card->dev,
40175bdba1bbf8 Takashi Iwai    2014-02-25  3192  				"no UART401 device at =
0x%lx\n", iomidi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  3193  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  3194  =


:::::: The code at line 3113 was first introduced by commit
:::::: b7e054a76fdc42b442c003f8d19ee5dce6b55f02 [ALSA] cmipci: show real ch=
ip name in card name

:::::: TO: Clemens Ladisch <clemens@ladisch.de>
:::::: CC: Jaroslav Kysela <perex@perex.cz>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5593527745478437240==--

