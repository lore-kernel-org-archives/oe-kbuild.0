Content-Type: multipart/mixed; boundary="===============1617821652379076672=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jani-drm:edid-hfeeodb 51/63] drivers/gpu/drm/drm_edid.c:5158:20: warning: Array access (from variable 'name') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Thu, 14 Apr 2022 01:47:29 +0800
Message-ID: <202204140102.i06YgMsq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1617821652379076672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jani Nikula <jani.nikula@intel.com>

tree:   git://people.freedesktop.org/~jani/drm edid-hfeeodb
head:   06dad405a39456891fce7cc9e26d45177d56edc1
commit: 59d0e7c2f8dff534ac72b7a2baea89dc23c61d66 [51/63] drm/edid: convert =
get_monitor_name() to drm_edid
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm-randconfig-c002-20220413 (https://download.01.org/0day-ci/archi=
ve/20220414/202204140102.i06YgMsq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478=
d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add jani-drm git://people.freedesktop.org/~jani/drm
        git fetch --no-tags jani-drm edid-hfeeodb
        git checkout 59d0e7c2f8dff534ac72b7a2baea89dc23c61d66
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   drivers/usb/core/config.c:314:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&endpoint->desc, d, n);
           ^~~~~~
   drivers/usb/core/config.c:544:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&alt->desc, d, USB_DT_INTERFACE_SIZE);
           ^~~~~~
   drivers/usb/core/config.c:544:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&alt->desc, d, USB_DT_INTERFACE_SIZE);
           ^~~~~~
   drivers/usb/core/config.c:621:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&config->desc, buffer, USB_DT_CONFIG_SIZE);
           ^~~~~~
   drivers/usb/core/config.c:621:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&config->desc, buffer, USB_DT_CONFIG_SIZE);
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   fs/exec.c:644:3: warning: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
                   memcpy(kaddr + offset_in_page(pos), arg, bytes_to_copy);
                   ^~~~~~
   fs/exec.c:644:3: note: Call to function 'memcpy' is insecure as it does =
not provide security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'memcpy_s' in case of C11
                   memcpy(kaddr + offset_in_page(pos), arg, bytes_to_copy);
                   ^~~~~~
   fs/exec.c:1199:3: warning: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   memcpy(newsighand->action, oldsighand->action,
                   ^~~~~~
   fs/exec.c:1199:3: note: Call to function 'memcpy' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memcpy_s' in case of C11
                   memcpy(newsighand->action, oldsighand->action,
                   ^~~~~~
   fs/exec.c:1655:2: warning: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
           memset(bprm->buf, 0, BINPRM_BUF_SIZE);
           ^~~~~~
   fs/exec.c:1655:2: note: Call to function 'memset' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memset_s' in case of C11
           memset(bprm->buf, 0, BINPRM_BUF_SIZE);
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/gpu/drm/drm_edid.c:1636:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(iter, 0, sizeof(*iter));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:1636:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(iter, 0, sizeof(*iter));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:1659:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(iter, 0, sizeof(*iter));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:1659:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(iter, 0, sizeof(*iter));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:1669:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(edid, edid_header, sizeof(edid_header));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:1669:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(edid, edid_header, sizeof(edid_header));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:1879:3: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(prefix, "\t[%02x] ZERO ", block_num);
                   ^~~~~~~
   drivers/gpu/drm/drm_edid.c:1879:3: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   sprintf(prefix, "\t[%02x] ZERO ", block_num);
                   ^~~~~~~
   drivers/gpu/drm/drm_edid.c:1881:3: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(prefix, "\t[%02x] BAD  ", block_num);
                   ^~~~~~~
   drivers/gpu/drm/drm_edid.c:1881:3: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   sprintf(prefix, "\t[%02x] BAD  ", block_num);
                   ^~~~~~~
   drivers/gpu/drm/drm_edid.c:1883:3: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(prefix, "\t[%02x] GOOD ", block_num);
                   ^~~~~~~
   drivers/gpu/drm/drm_edid.c:1883:3: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   sprintf(prefix, "\t[%02x] GOOD ", block_num);
                   ^~~~~~~
   drivers/gpu/drm/drm_edid.c:1994:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dest_block++, block, EDID_LENGTH);
                           ^~~~~~
   drivers/gpu/drm/drm_edid.c:1994:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(dest_block++, block, EDID_LENGTH);
                           ^~~~~~
   drivers/gpu/drm/drm_edid.c:4705:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(iter, 0, sizeof(*iter));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:4705:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(iter, 0, sizeof(*iter));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:4830:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(iter, 0, sizeof(*iter));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:4830:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(iter, 0, sizeof(*iter));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:5155:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(name, buf, name_length);
                   ^~~~~~
   drivers/gpu/drm/drm_edid.c:5155:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(name, buf, name_length);
                   ^~~~~~
>> drivers/gpu/drm/drm_edid.c:5158:20: warning: Array access (from variable=
 'name') results in a null pointer dereference [clang-analyzer-core.NullDer=
eference]
           name[name_length] =3D '\0';
           ~~~~              ^
   drivers/gpu/drm/drm_edid.c:5144:6: note: Assuming 'bufsize' is > 0
           if (bufsize <=3D 0)
               ^~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5144:2: note: Taking false branch
           if (bufsize <=3D 0)
           ^
   drivers/gpu/drm/drm_edid.c:5147:6: note: Assuming 'edid' is non-null
           if (edid && name) {
               ^~~~
   drivers/gpu/drm/drm_edid.c:5147:6: note: Left side of '&&' is true
   drivers/gpu/drm/drm_edid.c:5147:14: note: Assuming 'name' is null
           if (edid && name) {
                       ^~~~
   drivers/gpu/drm/drm_edid.c:5147:6: note: Assuming pointer value is null
           if (edid && name) {
               ^~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5147:2: note: Taking false branch
           if (edid && name) {
           ^
   drivers/gpu/drm/drm_edid.c:5158:20: note: Array access (from variable 'n=
ame') results in a null pointer dereference
           name[name_length] =3D '\0';
           ~~~~              ^
   drivers/gpu/drm/drm_edid.c:5164:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(connector->eld, 0, sizeof(connector->eld));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:5164:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(connector->eld, 0, sizeof(connector->eld));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:5221:5: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&eld[DRM_ELD_CEA_SAD(mnl, total_s=
ad_count)],
                                   ^~~~~~
   drivers/gpu/drm/drm_edid.c:5221:5: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(&eld[DRM_ELD_CEA_SAD(mnl, total_s=
ad_count)],
                                   ^~~~~~
   drivers/gpu/drm/drm_edid.c:5937:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info->hdmi, 0, sizeof(info->hdmi));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:5937:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&info->hdmi, 0, sizeof(info->hdmi));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:5943:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info->monitor_range, 0, sizeof(info->monitor_range));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:5943:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&info->monitor_range, 0, sizeof(info->monitor_range));
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:6434:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&frame->display_primaries,
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:6434:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(&frame->display_primaries,
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:6438:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&frame->white_point,
           ^~~~~~
   drivers/gpu/drm/drm_edid.c:6438:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(&frame->white_point,
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c:123:2: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, &offset, 1);
           ^~~~~~
   drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c:123:2: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, &offset, 1);
           ^~~~~~
   drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c:124:2: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data + 1, buffer, size);
           ^~~~~~
   drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c:124:2: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data + 1, buffer, size);
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/video/backlight/pwm_bl.c:206:12: warning: Division by zero [clan=
g-analyzer-core.DivideZero]
                   min((int)DIV_ROUND_UP(period, fls(period)), 4096);
                            ^
   include/linux/math.h:37:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/video/backlight/pwm_bl.c:464:6: note: Assuming 'data' is non-null
           if (!data) {
               ^~~~~
   drivers/video/backlight/pwm_bl.c:464:2: note: Taking false branch
           if (!data) {
           ^
   drivers/video/backlight/pwm_bl.c:474:6: note: Assuming field 'init' is n=
ull
           if (data->init) {
               ^~~~~~~~~~
   drivers/video/backlight/pwm_bl.c:474:2: note: Taking false branch

vim +/name +5158 drivers/gpu/drm/drm_edid.c

59f7c0fa325e56 Jim Bride   2016-04-14  5132  =

59f7c0fa325e56 Jim Bride   2016-04-14  5133  /**
59f7c0fa325e56 Jim Bride   2016-04-14  5134   * drm_edid_get_monitor_name -=
 fetch the monitor name from the edid
59f7c0fa325e56 Jim Bride   2016-04-14  5135   * @edid: monitor EDID informa=
tion
59f7c0fa325e56 Jim Bride   2016-04-14  5136   * @name: pointer to a charact=
er array to hold the name of the monitor
59f7c0fa325e56 Jim Bride   2016-04-14  5137   * @bufsize: The size of the n=
ame buffer (should be at least 14 chars.)
59f7c0fa325e56 Jim Bride   2016-04-14  5138   *
59f7c0fa325e56 Jim Bride   2016-04-14  5139   */
f4e558ec9d9fb9 Jani Nikula 2022-03-28  5140  void drm_edid_get_monitor_name=
(const struct edid *edid, char *name, int bufsize)
59f7c0fa325e56 Jim Bride   2016-04-14  5141  {
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5142  	int name_length =3D 0;
59f7c0fa325e56 Jim Bride   2016-04-14  5143  =

59f7c0fa325e56 Jim Bride   2016-04-14  5144  	if (bufsize <=3D 0)
59f7c0fa325e56 Jim Bride   2016-04-14  5145  		return;
59f7c0fa325e56 Jim Bride   2016-04-14  5146  =

59d0e7c2f8dff5 Jani Nikula 2022-04-12  5147  	if (edid && name) {
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5148  		char buf[13];
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5149  		struct drm_edid drm_edid =3D=
 {
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5150  			.edid =3D edid,
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5151  			.size =3D edid_size(edid),
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5152  		};
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5153  =

59d0e7c2f8dff5 Jani Nikula 2022-04-12  5154  		name_length =3D min(get_moni=
tor_name(&drm_edid, buf), bufsize - 1);
59f7c0fa325e56 Jim Bride   2016-04-14  5155  		memcpy(name, buf, name_lengt=
h);
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5156  	}
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5157  =

59f7c0fa325e56 Jim Bride   2016-04-14 @5158  	name[name_length] =3D '\0';
59f7c0fa325e56 Jim Bride   2016-04-14  5159  }
59f7c0fa325e56 Jim Bride   2016-04-14  5160  EXPORT_SYMBOL(drm_edid_get_mon=
itor_name);
59f7c0fa325e56 Jim Bride   2016-04-14  5161  =


:::::: The code@line 5158 was first introduced by commit
:::::: 59f7c0fa325e5661188a174a435ea4925543985b drm/edid: Add drm_edid_get_=
monitor_name()

:::::: TO: Jim Bride <jim.bride@linux.intel.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1617821652379076672==--

