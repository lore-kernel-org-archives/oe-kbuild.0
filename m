Content-Type: multipart/mixed; boundary="===============5795103266035861234=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/media/rkvdec/rkvdec-h264.c:732:45: warning: Value stored to 'dec_params' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 23 Aug 2022 14:30:02 +0800
Message-ID: <202208231452.J1mE9tYi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5795103266035861234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/s=
taging/media/rkvdec/rkvdec-h264.c:732:45: warning: Value stored to 'dec_par=
ams' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nicolas Dufresne <nicolas.dufresne@collabora.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   072e51356cd5a4a1c12c1020bc054c99b98333df
commit: 7ab889f09dfa70e8097ec1b9186fd228124112cb media: rkvdec: h264: Fix d=
pb_valid implementation
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220819 (https://download.01.org/0day-ci/archi=
ve/20220823/202208231452.J1mE9tYi-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 0ac597=
f3cacf60479ffd36b03766fa7462dabd78)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7ab889f09dfa70e8097ec1b9186fd228124112cb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7ab889f09dfa70e8097ec1b9186fd228124112cb
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:261:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, " ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:264:2: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/usb/misc/usbsevseg.c:264:2: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   drivers/usb/misc/usbsevseg.c:289:1: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MYDEV_ATTR_SIMPLE_UNSIGNED(powered, update_display_powered);
   ^
   drivers/usb/misc/usbsevseg.c:148:9: note: expanded from macro 'MYDEV_ATT=
R_SIMPLE_UNSIGNED'
           return sprintf(buf, "%u\n", mydev->name);               \
                  ^~~~~~~
   drivers/usb/misc/usbsevseg.c:289:1: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
   MYDEV_ATTR_SIMPLE_UNSIGNED(powered, update_display_powered);
   ^
   drivers/usb/misc/usbsevseg.c:148:9: note: expanded from macro 'MYDEV_ATT=
R_SIMPLE_UNSIGNED'
           return sprintf(buf, "%u\n", mydev->name);               \
                  ^~~~~~~
   drivers/usb/misc/usbsevseg.c:290:1: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MYDEV_ATTR_SIMPLE_UNSIGNED(mode_msb, update_display_mode);
   ^
   drivers/usb/misc/usbsevseg.c:148:9: note: expanded from macro 'MYDEV_ATT=
R_SIMPLE_UNSIGNED'
           return sprintf(buf, "%u\n", mydev->name);               \
                  ^~~~~~~
   drivers/usb/misc/usbsevseg.c:290:1: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
   MYDEV_ATTR_SIMPLE_UNSIGNED(mode_msb, update_display_mode);
   ^
   drivers/usb/misc/usbsevseg.c:148:9: note: expanded from macro 'MYDEV_ATT=
R_SIMPLE_UNSIGNED'
           return sprintf(buf, "%u\n", mydev->name);               \
                  ^~~~~~~
   drivers/usb/misc/usbsevseg.c:291:1: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MYDEV_ATTR_SIMPLE_UNSIGNED(mode_lsb, update_display_mode);
   ^
   drivers/usb/misc/usbsevseg.c:148:9: note: expanded from macro 'MYDEV_ATT=
R_SIMPLE_UNSIGNED'
           return sprintf(buf, "%u\n", mydev->name);               \
                  ^~~~~~~
   drivers/usb/misc/usbsevseg.c:291:1: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
   MYDEV_ATTR_SIMPLE_UNSIGNED(mode_lsb, update_display_mode);
   ^
   drivers/usb/misc/usbsevseg.c:148:9: note: expanded from macro 'MYDEV_ATT=
R_SIMPLE_UNSIGNED'
           return sprintf(buf, "%u\n", mydev->name);               \
                  ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/i2c/busses/i2c-iop3xx.c:481:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_adapter->name, pdev->name, strlen(pdev->name));
           ^~~~~~
   drivers/i2c/busses/i2c-iop3xx.c:481:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(new_adapter->name, pdev->name, strlen(pdev->name));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/i2c/busses/i2c-jz4780.c:573:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, len);
           ^~~~~~
   drivers/i2c/busses/i2c-jz4780.c:573:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, len);
           ^~~~~~
   drivers/i2c/busses/i2c-jz4780.c:784:2: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           sprintf(i2c->adap.name, "%s", pdev->name);
           ^~~~~~~
   drivers/i2c/busses/i2c-jz4780.c:784:2: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           sprintf(i2c->adap.name, "%s", pdev->name);
           ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/staging/media/rkvdec/rkvdec.c:175:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(f, 0, sizeof(*f));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:175:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(f, 0, sizeof(*f));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:240:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:240:2: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
           ^~~~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:673:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(run, 0, sizeof(*run));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec.c:673:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(run, 0, sizeof(*run));
           ^~~~~~
   Suppressed 49 warnings (48 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/staging/media/rkvdec/rkvdec-h264.c:657:2: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hw_ps, 0, sizeof(*hw_ps));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:657:2: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
           memset(hw_ps, 0, sizeof(*hw_ps));
           ^~~~~~
>> drivers/staging/media/rkvdec/rkvdec-h264.c:732:45: warning: Value stored=
 to 'dec_params' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->d=
ecode_params;
                                                      ^~~~~~~~~~   ~~~~~~~~=
~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:732:45: note: Value stored to=
 'dec_params' during its initialization is never read
           const struct v4l2_ctrl_h264_decode_params *dec_params =3D run->d=
ecode_params;
                                                      ^~~~~~~~~~   ~~~~~~~~=
~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:763:2: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hw_rps, 0, sizeof(priv_tbl->rps));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:763:2: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
           memset(hw_rps, 0, sizeof(priv_tbl->rps));
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:826:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tbl->scaling_list.scaling_list_4x4,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:826:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tbl->scaling_list.scaling_list_4x4,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:830:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tbl->scaling_list.scaling_list_8x8,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:830:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tbl->scaling_list.scaling_list_8x8,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:1058:2: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
           ^~~~~~
   drivers/staging/media/rkvdec/rkvdec-h264.c:1058:2: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
           ^~~~~~
   Suppressed 49 warnings (48 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/mtd/devices/slram.c:87:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(priv->start + instr->addr, 0xff, instr->len);
           ^~~~~~
   drivers/mtd/devices/slram.c:87:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(priv->start + instr->addr, 0xff, instr->len);
           ^~~~~~
   drivers/mtd/devices/slram.c:112:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, priv->start + from, len);
           ^~~~~~
   drivers/mtd/devices/slram.c:112:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, priv->start + from, len);
           ^~~~~~
   drivers/mtd/devices/slram.c:122:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(priv->start + to, buf, len);
           ^~~~~~
   drivers/mtd/devices/slram.c:122:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(priv->start + to, buf, len);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/i2c/s5c73m3/s5c73m3-spi.c:72:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(padding, 0, sizeof(padding));
           ^~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-spi.c:72:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(padding, 0, sizeof(padding));
           ^~~~~~
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/i2c/s5k5baf.c:1905:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(sd->name, sizeof(sd->name), "S5K5BAF-CIS %d-%04x",
           ^~~~~~~~
   drivers/media/i2c/s5k5baf.c:1905:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(sd->name, sizeof(sd->name), "S5K5BAF-CIS %d-%04x",
           ^~~~~~~~
   drivers/media/i2c/s5k5baf.c:1919:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(sd->name, sizeof(sd->name), "S5K5BAF-ISP %d-%04x",
           ^~~~~~~~
   drivers/media/i2c/s5k5baf.c:1919:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(sd->name, sizeof(sd->name), "S5K5BAF-ISP %d-%04x",
           ^~~~~~~~
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/rtc/rtc-rs5c348.c:78:2: warning: Value stored to 'txp' is never =
read [clang-analyzer-deadcode.DeadStores]
           txp =3D txbuf;
           ^     ~~~~~
   drivers/rtc/rtc-rs5c348.c:78:2: note: Value stored to 'txp' is never read
           txp =3D txbuf;
           ^     ~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/rtc/rtc-rx8025.c:197:3: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   status &=3D RX8025_BIT_CTRL2_DAFG;

vim +/dec_params +732 drivers/staging/media/rkvdec/rkvdec-h264.c

cd33c830448baf7 Boris Brezillon  2020-04-04  728  =

7ab889f09dfa70e Nicolas Dufresne 2022-05-13  729  static void lookup_ref_bu=
f_idx(struct rkvdec_ctx *ctx,
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  730  			       struct rkvdec_h=
264_run *run)
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  731  {
7ab889f09dfa70e Nicolas Dufresne 2022-05-13 @732  	const struct v4l2_ctrl_h=
264_decode_params *dec_params =3D run->decode_params;
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  733  	u32 i;
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  734  =

7ab889f09dfa70e Nicolas Dufresne 2022-05-13  735  	for (i =3D 0; i < ARRAY_=
SIZE(dec_params->dpb); i++) {
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  736  		struct v4l2_m2m_ctx *m2=
m_ctx =3D ctx->fh.m2m_ctx;
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  737  		const struct v4l2_h264_=
dpb_entry *dpb =3D run->decode_params->dpb;
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  738  		struct vb2_queue *cap_q=
 =3D &m2m_ctx->cap_q_ctx.q;
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  739  		int buf_idx =3D -1;
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  740  =

7ab889f09dfa70e Nicolas Dufresne 2022-05-13  741  		if (dpb[i].flags & V4L2=
_H264_DPB_ENTRY_FLAG_ACTIVE)
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  742  			buf_idx =3D vb2_find_t=
imestamp(cap_q,
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  743  						     dpb[i].referen=
ce_ts, 0);
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  744  =

7ab889f09dfa70e Nicolas Dufresne 2022-05-13  745  		run->ref_buf_idx[i] =3D=
 buf_idx;
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  746  	}
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  747  }
7ab889f09dfa70e Nicolas Dufresne 2022-05-13  748  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5795103266035861234==--

