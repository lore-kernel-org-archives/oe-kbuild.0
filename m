Content-Type: multipart/mixed; boundary="===============3637858306700461198=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11468/14337] drivers/usb/atm/usbatm.c:739:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or prov...
Date: Fri, 25 Mar 2022 10:46:40 +0800
Message-ID: <202203251044.CED4kTi5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3637858306700461198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   dd315b5800612e6913343524aa9b993f9a8bb0cf
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 [11468/14337] Kbuild: move=
 to -std=3Dgnu11
:::::: branch date: 19 hours ago
:::::: commit date: 12 days ago
config: riscv-randconfig-c006-20220324 (https://download.01.org/0day-ci/arc=
hive/20220325/202203251044.CED4kTi5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   36 warnings generated.
   Suppressed 36 warnings (35 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/media/mc/mc-request.c:190:23: warning: Value stored to 'mdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:190:23: note: Value stored to 'mdev' durin=
g its initialization is never read
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:331:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(req->debug_str, sizeof(req->debug_str), "%u:%d",
           ^~~~~~~~
   drivers/media/mc/mc-request.c:331:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(req->debug_str, sizeof(req->debug_str), "%u:%d",
           ^~~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (41 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/dvb-core/dvbdev.c:480:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dvbdev, template, sizeof(struct dvb_device));
           ^~~~~~
   drivers/media/dvb-core/dvbdev.c:480:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dvbdev, template, sizeof(struct dvb_device));
           ^~~~~~
   drivers/media/dvb-core/dvbdev.c:862:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset (adap, 0, sizeof(struct dvb_adapter));
           ^~~~~~
   drivers/media/dvb-core/dvbdev.c:862:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset (adap, 0, sizeof(struct dvb_adapter));
           ^~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/media/dvb-core/dmxdev.c:741:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&((*secfilter)->filter_value[3]),
                   ^~~~~~
   drivers/media/dvb-core/dmxdev.c:741:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&((*secfilter)->filter_value[3]),
                   ^~~~~~
   drivers/media/dvb-core/dmxdev.c:743:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&(*secfilter)->filter_mask[3],
                   ^~~~~~
   drivers/media/dvb-core/dmxdev.c:743:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&(*secfilter)->filter_mask[3],
                   ^~~~~~
   drivers/media/dvb-core/dmxdev.c:745:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&(*secfilter)->filter_mode[3],
                   ^~~~~~
   drivers/media/dvb-core/dmxdev.c:745:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&(*secfilter)->filter_mode[3],
                   ^~~~~~
   drivers/media/dvb-core/dmxdev.c:921:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&dmxdevfilter->params.sec,
           ^~~~~~
   drivers/media/dvb-core/dmxdev.c:921:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&dmxdevfilter->params.sec,
           ^~~~~~
   drivers/media/dvb-core/dmxdev.c:945:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&dmxdevfilter->params, params,
           ^~~~~~
   drivers/media/dvb-core/dmxdev.c:945:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&dmxdevfilter->params, params,
           ^~~~~~
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
   drivers/usb/atm/usbatm.c:332:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_tail_pointer(sarb), source + ATM_CELL_HEADER, ATM_CEL=
L_PAYLOAD);
           ^~~~~~
   drivers/usb/atm/usbatm.c:332:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb_tail_pointer(sarb), source + ATM_CELL_HEADER, ATM_CEL=
L_PAYLOAD);
           ^~~~~~
   drivers/usb/atm/usbatm.c:425:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(cell_buf + buf_usage, source, space_left);
                           ^~~~~~
   drivers/usb/atm/usbatm.c:425:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(cell_buf + buf_usage, source, space_left);
                           ^~~~~~
   drivers/usb/atm/usbatm.c:432:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(cell_buf + buf_usage, source, avail_data);
                           ^~~~~~
   drivers/usb/atm/usbatm.c:432:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(cell_buf + buf_usage, source, avail_data);
                           ^~~~~~
   drivers/usb/atm/usbatm.c:444:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(instance->cell_buf, source, avail_data);
                   ^~~~~~
   drivers/usb/atm/usbatm.c:444:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(instance->cell_buf, source, avail_data);
                   ^~~~~~
   drivers/usb/atm/usbatm.c:483:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ptr, 0, left);
                   ^~~~~~
   drivers/usb/atm/usbatm.c:483:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(ptr, 0, left);
                   ^~~~~~
>> drivers/usb/atm/usbatm.c:739:10: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
                   return sprintf(page, "%s\n", instance->description);
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:739:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
                   return sprintf(page, "%s\n", instance->description);
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:742:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "MAC: %pM\n", atm_dev->esi);
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:742:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "MAC: %pM\n", atm_dev->esi);
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:745:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page,
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:745:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(page,
                          ^~~~~~~
   drivers/usb/atm/usbatm.c:755:11: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           return sprintf(page, "Disconnected\n");
                                  ^~~~~~~
   drivers/usb/atm/usbatm.c:755:11: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                           return sprintf(page, "Disconnected\n");
                                  ^~~~~~~
   drivers/usb/atm/usbatm.c:759:12: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   return sprintf(page, "Line up\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:759:12: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                                   return sprintf(page, "Line up\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:761:12: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   return sprintf(page, "Line down\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:761:12: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                                   return sprintf(page, "Line down\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:763:12: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   return sprintf(page, "Line state unknown=
\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:763:12: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                                   return sprintf(page, "Line state unknown=
\n");
                                          ^~~~~~~
   drivers/usb/atm/usbatm.c:1054:2: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, length, ")");
           ^~~~~~~~
   drivers/usb/atm/usbatm.c:1054:2: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           snprintf(buf, length, ")");
           ^~~~~~~~
   drivers/usb/atm/usbatm.c:1112:26: warning: Value stored to 'channel' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct usbatm_channel *channel =3D i ?
                                          ^~~~~~~   ~~~
   drivers/usb/atm/usbatm.c:1112:26: note: Value stored to 'channel' during=
 its initialization is never read
                   struct usbatm_channel *channel =3D i ?
                                          ^~~~~~~   ~~~
   drivers/usb/atm/usbatm.c:1208:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &intf->dev;
                          ^~~   ~~~~~~~~~~
   drivers/usb/atm/usbatm.c:1208:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D &intf->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 93 warnings (86 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (55 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   fs/orangefs/namei.c:44:2: warning: Call to function 'strncpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(new_op->upcall.req.create.d_name,
           ^~~~~~~
   fs/orangefs/namei.c:44:2: note: Call to function 'strncpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'strncpy_s' in case of C11
           strncpy(new_op->upcall.req.create.d_name,
           ^~~~~~~
   fs/orangefs/namei.c:86:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&iattr, 0, sizeof iattr);
           ^~~~~~
   fs/orangefs/namei.c:86:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&iattr, 0, sizeof iattr);
           ^~~~~~
   fs/orangefs/namei.c:140:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(new_op->upcall.req.lookup.d_name, dentry->d_name.name,
           ^~~~~~~
   fs/orangefs/namei.c:140:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(new_op->upcall.req.lookup.d_name, dentry->d_name.name,
           ^~~~~~~
   fs/orangefs/namei.c:195:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(new_op->upcall.req.remove.d_name, dentry->d_name.name,
           ^~~~~~~
   fs/orangefs/namei.c:195:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(new_op->upcall.req.remove.d_name, dentry->d_name.name,
           ^~~~~~~
   fs/orangefs/namei.c:211:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&iattr, 0, sizeof iattr);
                   ^~~~~~
   fs/orangefs/namei.c:211:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(&iattr, 0, sizeof iattr);
                   ^~~~~~
   fs/orangefs/namei.c:250:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(new_op->upcall.req.sym.entry_name,
           ^~~~~~~
   fs/orangefs/namei.c:250:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(new_op->upcall.req.sym.entry_name,
--
           ^
   fs/stat.c:341:40: note: expanded from macro 'INIT_STRUCT_STAT_PADDING'
   #  define INIT_STRUCT_STAT_PADDING(st) memset(&st, 0, sizeof(st))
                                          ^~~~~~
   fs/stat.c:355:2: note: Call to function 'memset' is insecure as it does =
not provide security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'memset_s' in case of C11
           INIT_STRUCT_STAT_PADDING(tmp);
           ^
   fs/stat.c:341:40: note: expanded from macro 'INIT_STRUCT_STAT_PADDING'
   #  define INIT_STRUCT_STAT_PADDING(st) memset(&st, 0, sizeof(st))
                                          ^~~~~~
   fs/stat.c:575:2: warning: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   fs/stat.c:575:2: note: Call to function 'memset' is insecure as it does =
not provide security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'memset_s' in case of C11
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/tuners/tda18250.c:445:11: warning: The result of the left =
shift is undefined due to shifting by '4294967295', which is greater or equ=
al to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorR=
esult]
           lopd =3D 1 << (exp - 1);
                    ^  ~~~~~~~~~
   drivers/media/tuners/tda18250.c:439:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/tuners/tda18250.c:439:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/tuners/tda18250.c:443:6: note: Assuming 'exp' is > 5
           if (exp > 5)
               ^~~~~~~
   drivers/media/tuners/tda18250.c:443:2: note: Taking true branch
           if (exp > 5)
           ^
   drivers/media/tuners/tda18250.c:445:11: note: The result of the left shi=
ft is undefined due to shifting by '4294967295', which is greater or equal =
to the width of type 'int'
           lopd =3D 1 << (exp - 1);
                    ^  ~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/tda18250.c:845:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &tda18250_ops,
           ^~~~~~
   drivers/media/tuners/tda18250.c:845:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &tda18250_ops,
           ^~~~~~
   drivers/media/tuners/tda18250.c:866:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   drivers/media/tuners/tda18250.c:866:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   96 warnings generated.
   drivers/usb/usbip/usbip_common.c:39:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lx\n", usbip_debug_flag);
                  ^~~~~~~
   drivers/usb/usbip/usbip_common.c:39:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lx\n", usbip_debug_flag);
                  ^~~~~~~
   drivers/usb/usbip/usbip_common.c:46:6: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%lx", &usbip_debug_flag) !=3D 1)
               ^~~~~~
   drivers/usb/usbip/usbip_common.c:46:6: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%lx", &usbip_debug_flag) !=3D 1)
               ^~~~~~
   drivers/usb/usbip/usbip_common.c:668:3: warning: Call to function 'memmo=
ve' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memmove_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(urb->transfer_buffer + urb->iso_frame_desc[i].of=
fset,
                   ^~~~~~~
   drivers/usb/usbip/usbip_common.c:668:3: note: Call to function 'memmove'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memmove_s' in case of C11
                   memmove(urb->transfer_buffer + urb->iso_frame_desc[i].of=
fset,
                   ^~~~~~~
   Suppressed 93 warnings (86 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (44 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/usb/usbip/vhci_sysfs.c:41:11: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   *out +=3D sprintf(*out, "hs  %04u %03u ",
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:41:11: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   *out +=3D sprintf(*out, "hs  %04u %03u ",
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:44:11: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   *out +=3D sprintf(*out, "ss  %04u %03u ",
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:44:11: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   *out +=3D sprintf(*out, "ss  %04u %03u ",
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:48:11: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   *out +=3D sprintf(*out, "%03u %08x ",
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:48:11: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   *out +=3D sprintf(*out, "%03u %08x ",
                           ^~~~~~~
>> drivers/usb/usbip/vhci_sysfs.c:50:11: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                   *out +=3D sprintf(*out, "%06u %s",
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:50:11: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
                   *out +=3D sprintf(*out, "%06u %s",
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:55:11: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   *out +=3D sprintf(*out, "000 00000000 ");
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:55:11: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   *out +=3D sprintf(*out, "000 00000000 ");
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:56:11: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   *out +=3D sprintf(*out, "000000 0-0");
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:56:11: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   *out +=3D sprintf(*out, "000000 0-0");
                           ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:59:10: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           *out +=3D sprintf(*out, "\n");
                   ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:59:10: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           *out +=3D sprintf(*out, "\n");
                   ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:113:10: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   out +=3D sprintf(out, "hs  %04u %03u ",
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:113:10: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   out +=3D sprintf(out, "hs  %04u %03u ",
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:116:10: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   out +=3D sprintf(out, "000 00000000 0000000000000000 0-0=
");
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:116:10: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   out +=3D sprintf(out, "000 00000000 0000000000000000 0-0=
");
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:117:10: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   out +=3D sprintf(out, "\n");
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:117:10: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   out +=3D sprintf(out, "\n");
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:121:10: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   out +=3D sprintf(out, "ss  %04u %03u ",
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:121:10: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   out +=3D sprintf(out, "ss  %04u %03u ",
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:124:10: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   out +=3D sprintf(out, "000 00000000 0000000000000000 0-0=
");
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:124:10: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   out +=3D sprintf(out, "000 00000000 0000000000000000 0-0=
");
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:125:10: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   out +=3D sprintf(out, "\n");
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:125:10: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   out +=3D sprintf(out, "\n");
                          ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:153:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           out +=3D sprintf(out,
                  ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:153:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           out +=3D sprintf(out,
                  ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:174:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           out +=3D sprintf(out, "%d\n", VHCI_PORTS * vhci_num_controllers);
                  ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:174:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           out +=3D sprintf(out, "%d\n", VHCI_PORTS * vhci_num_controllers);
                  ^~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:329:6: warning: Call to function 'sscanf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%u %u %u %u", &port, &sockfd, &devid, &speed) !=
=3D 4)
               ^~~~~~
   drivers/usb/usbip/vhci_sysfs.c:329:6: note: Call to function 'sscanf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%u %u %u %u", &port, &sockfd, &devid, &speed) !=
=3D 4)
               ^~~~~~
   drivers/usb/usbip/vhci_sysfs.c:467:3: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(status->name, MAX_STATUS_NAME+1, "status.%d", i=
d);
                   ^~~~~~~~
   drivers/usb/usbip/vhci_sysfs.c:467:3: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(status->name, MAX_STATUS_NAME+1, "status.%d", i=
d);
                   ^~~~~~~~
   Suppressed 51 warnings (44 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/media/i2c/ov8856.c:1827:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1827:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1839:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1839:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1849:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_3,
--
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/hwmon/pmbus/adm1266.c:108:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&msgs[0].buf[2], data_w, w_len);
           ^~~~~~
   drivers/hwmon/pmbus/adm1266.c:108:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&msgs[0].buf[2], data_w, w_len);
           ^~~~~~
   drivers/hwmon/pmbus/adm1266.c:135:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);
           ^~~~~~
   drivers/hwmon/pmbus/adm1266.c:135:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);
           ^~~~~~
   drivers/hwmon/pmbus/adm1266.c:388:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(data->dev_mem, 0, data->nvmem_config.size);
                   ^~~~~~
   drivers/hwmon/pmbus/adm1266.c:388:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(data->dev_mem, 0, data->nvmem_config.size);
                   ^~~~~~
   drivers/hwmon/pmbus/adm1266.c:397:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(val, data->dev_mem + offset, bytes);
           ^~~~~~
   drivers/hwmon/pmbus/adm1266.c:397:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(val, data->dev_mem + offset, bytes);
           ^~~~~~
   drivers/hwmon/pmbus/adm1266.c:438:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(write_buf, 0, sizeof(write_buf));
           ^~~~~~
   drivers/hwmon/pmbus/adm1266.c:438:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(write_buf, 0, sizeof(write_buf));
           ^~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   Suppressed 91 warnings (84 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   Suppressed 91 warnings (84 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   Suppressed 91 warnings (84 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   92 warnings generated.
   drivers/media/usb/dvb-usb/dvb-usb-remote.c:61:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ke->scancode, &keymap[index].scancode, ke->len);
           ^~~~~~
   drivers/media/usb/dvb-usb/dvb-usb-remote.c:61:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ke->scancode, &keymap[index].scancode, ke->len);
           ^~~~~~
   Suppressed 91 warnings (84 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   drivers/media/usb/dvb-usb/usb-urb.c:130:3: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(stream->buf_list[stream->buf_num],0,size);
                   ^~~~~~
   drivers/media/usb/dvb-usb/usb-urb.c:130:3: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
                   memset(stream->buf_list[stream->buf_num],0,size);
                   ^~~~~~
   drivers/media/usb/dvb-usb/usb-urb.c:218:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&stream->props, props, sizeof(*props));
           ^~~~~~
   drivers/media/usb/dvb-usb/usb-urb.c:218:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&stream->props, props, sizeof(*props));
           ^~~~~~
   Suppressed 91 warnings (84 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   127 warnings generated.
   Suppressed 127 warnings (120 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/usb/cdns3/cdns3-ti.c:160:2: warning: Value stored to 'reg' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           reg =3D cdns_ti_readl(data, USBSS_STATIC_CONFIG);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/cdns3/cdns3-ti.c:160:2: note: Value stored to 'reg' is never=
 read
           reg =3D cdns_ti_readl(data, USBSS_STATIC_CONFIG);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
>> drivers/usb/chipidea/core.c:956:10: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   return sprintf(buf, "%s\n", ci_role(ci)->name);
                          ^~~~~~~
   drivers/usb/chipidea/core.c:956:10: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   return sprintf(buf, "%s\n", ci_role(ci)->name);
                          ^~~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/usb/chipidea/debug.c:90:6: warning: Call to function 'sscanf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%u", &mode) !=3D 1)
               ^~~~~~
   drivers/usb/chipidea/debug.c:90:6: note: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%u", &mode) !=3D 1)
               ^~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   fs/ubifs/lprops.c:630:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lst, &c->lst, sizeof(struct ubifs_lp_stats));
           ^~~~~~
   fs/ubifs/lprops.c:630:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(lst, &c->lst, sizeof(struct ubifs_lp_stats));
           ^~~~~~
   fs/ubifs/lprops.c:740:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lp, lpp, sizeof(struct ubifs_lprops));
           ^~~~~~
   fs/ubifs/lprops.c:740:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(lp, lpp, sizeof(struct ubifs_lprops));
           ^~~~~~
   fs/ubifs/lprops.c:1084:18: warning: Access to field 'leb_size' results i=
n a dereference of a null pointer (loaded from variable 'c') [clang-analyze=
r-core.NullDereference]
           if (lp->free =3D=3D c->leb_size) {
                           ^
   fs/ubifs/lprops.c:1025:6: note: Assuming 'cat' is equal to LPROPS_UNCAT
           if (cat !=3D LPROPS_UNCAT) {
               ^~~~~~~~~~~~~~~~~~~
   fs/ubifs/lprops.c:1025:2: note: Taking false branch
           if (cat !=3D LPROPS_UNCAT) {
           ^
   fs/ubifs/lprops.c:1035:6: note: Assuming 'in_tree' is not equal to 0
           if (in_tree) {
               ^~~~~~~
   fs/ubifs/lprops.c:1035:2: note: Taking true branch
           if (in_tree) {
           ^
   fs/ubifs/lprops.c:1038:3: note: Control jumps to 'case LPROPS_UNCAT:'  a=
t line 1048
                   switch (cat) {
                   ^
   fs/ubifs/lprops.c:1050:4: note:  Execution continues on line 1052
                           break;
                           ^
   fs/ubifs/lprops.c:1052:7: note: Assuming 'list' is null
                   if (list) {
                       ^~~~
   fs/ubifs/lprops.c:1052:3: note: Taking false branch
                   if (list) {
                   ^
   fs/ubifs/lprops.c:1070:6: note: 'in_tree' is not equal to 0
           if (in_tree && cat > 0 && cat <=3D LPROPS_HEAP_CNT) {
               ^~~~~~~
   fs/ubifs/lprops.c:1070:6: note: Left side of '&&' is true
   fs/ubifs/lprops.c:1070:17: note: 'cat' is <=3D 0
           if (in_tree && cat > 0 && cat <=3D LPROPS_HEAP_CNT) {
                          ^~~
   fs/ubifs/lprops.c:1070:25: note: Left side of '&&' is false
           if (in_tree && cat > 0 && cat <=3D LPROPS_HEAP_CNT) {
                                  ^
   fs/ubifs/lprops.c:1084:18: note: Access to field 'leb_size' results in a=
 dereference of a null pointer (loaded from variable 'c')
           if (lp->free =3D=3D c->leb_size) {
                           ^
   fs/ubifs/lprops.c:1270:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&lst, 0, sizeof(struct ubifs_lp_stats));
           ^~~~~~
   fs/ubifs/lprops.c:1270:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&lst, 0, sizeof(struct ubifs_lp_stats));
           ^~~~~~
   Suppressed 65 warnings (58 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   fs/fuse/cuse.c:359:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:359:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:582:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", atomic_read(&cc->fc.num_waiting));
                  ^~~~~~~
   fs/fuse/cuse.c:582:9: note: Call to function 'sprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sprintf_s' in case of C11
--
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-common.h:73:7: note: expanded from macro 'v4l2_dbg'
                   if (debug >=3D (level))                                 =
  \
                       ^~~~~~~~~~~~~~~~
   drivers/media/usb/s2255/s2255drv.c:1913:3: note: Taking false branch
                   dprintk(dev, 2, "get fw error: %x\n", ret);
                   ^
   drivers/media/usb/s2255/s2255drv.c:355:2: note: expanded from macro 'dpr=
intk'
           v4l2_dbg(level, debug, &dev->v4l2_dev, fmt, ## arg)
           ^
   include/media/v4l2-common.h:73:3: note: expanded from macro 'v4l2_dbg'
                   if (debug >=3D (level))                                 =
  \
                   ^
   drivers/media/usb/s2255/s2255drv.c:1913:3: note: Loop condition is false=
.  Exiting loop
                   dprintk(dev, 2, "get fw error: %x\n", ret);
                   ^
   drivers/media/usb/s2255/s2255drv.c:355:2: note: expanded from macro 'dpr=
intk'
           v4l2_dbg(level, debug, &dev->v4l2_dev, fmt, ## arg)
           ^
   include/media/v4l2-common.h:72:2: note: expanded from macro 'v4l2_dbg'
           do {                                                            \
           ^
   drivers/media/usb/s2255/s2255drv.c:1914:40: note: The left operand of '<=
<' is a garbage value
           fw =3D transBuffer[0] + (transBuffer[1] << 8);
                                  ~~~~~~~~~~~~~~ ^
   drivers/media/usb/s2255/s2255drv.c:1973:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(pipe, 0, sizeof(*pipe));
           ^~~~~~
   drivers/media/usb/s2255/s2255drv.c:1973:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(pipe, 0, sizeof(*pipe));
           ^~~~~~
   drivers/media/usb/s2255/s2255drv.c:2187:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dev->fw_data->pfw_data,
           ^~~~~~
   drivers/media/usb/s2255/s2255drv.c:2187:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dev->fw_data->pfw_data,
           ^~~~~~
   Suppressed 63 warnings (56 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/media/platform/video-mux.c:422:2: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(vmux->subdev.name, sizeof(vmux->subdev.name), "%pOFn", =
np);
           ^~~~~~~~
   drivers/media/platform/video-mux.c:422:2: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(vmux->subdev.name, sizeof(vmux->subdev.name), "%pOFn", =
np);
           ^~~~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/media/platform/xilinx/xilinx-dma.c:498:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%pOFn:%=
u",
           ^~~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:498:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%pOFn:%=
u",
           ^~~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:681:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dma->video.name, sizeof(dma->video.name), "%pOFn %s %u",
           ^~~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:681:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dma->video.name, sizeof(dma->video.name), "%pOFn %s %u",
           ^~~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:724:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "port%u", port);
           ^~~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:724:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "port%u", port);
           ^~~~~~~~
   Suppressed 61 warnings (54 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   120 warnings generated.
   drivers/usb/atm/cxacru.c:233:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", value);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:233:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", value);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:238:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", value);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:238:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", value);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:244:10: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%u.%02u\n",
                          ^~~~~~~~
   drivers/usb/atm/cxacru.c:244:10: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%u.%02u\n",
                          ^~~~~~~~
   drivers/usb/atm/cxacru.c:248:10: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "-%u.%02u\n",
                          ^~~~~~~~
   drivers/usb/atm/cxacru.c:248:10: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "-%u.%02u\n",
                          ^~~~~~~~
   drivers/usb/atm/cxacru.c:258:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
   drivers/usb/atm/cxacru.c:258:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
>> drivers/usb/atm/cxacru.c:259:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:259:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:267:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
   drivers/usb/atm/cxacru.c:267:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
   drivers/usb/atm/cxacru.c:268:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:268:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:278:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
   drivers/usb/atm/cxacru.c:278:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
   drivers/usb/atm/cxacru.c:279:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:279:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:291:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
   drivers/usb/atm/cxacru.c:291:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
   drivers/usb/atm/cxacru.c:292:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:292:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:312:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%pM\n", instance->usbatm->atm_dev->esi);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:312:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%pM\n", instance->usbatm->atm_dev->esi);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:328:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
   drivers/usb/atm/cxacru.c:328:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%u\n", value);
                          ^~~~~~~
   drivers/usb/atm/cxacru.c:329:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:329:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", str[value]);
                  ^~~~~~~
   drivers/usb/atm/cxacru.c:345:8: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%7s", str_cmd);
                 ^~~~~~
   drivers/usb/atm/cxacru.c:345:8: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%7s", str_cmd);
                 ^~~~~~
   drivers/usb/atm/cxacru.c:457:9: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(buf + pos, "%x=3D%x%n", &index, &value, &=
tmp);
                         ^~~~~~
   drivers/usb/atm/cxacru.c:457:9: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(buf + pos, "%x=3D%x%n", &index, &value, &=
tmp);
                         ^~~~~~
   drivers/usb/atm/cxacru.c:490:5: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   snprintf(log + tmp*12, 13, " %02x=3D%08x=
",
                                   ^~~~~~~~
   drivers/usb/atm/cxacru.c:490:5: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                                   snprintf(log + tmp*12, 13, " %02x=3D%08x=
",
                                   ^~~~~~~~
   drivers/usb/atm/cxacru.c:639:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(wbuf, 0, wbuflen);
           ^~~~~~
   drivers/usb/atm/cxacru.c:639:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(wbuf, 0, wbuflen);
           ^~~~~~
   drivers/usb/atm/cxacru.c:644:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(wbuf + offb + 4, wdata + offd, min_t(int, stride,=
 wsize - offd));
                   ^~~~~~
   drivers/usb/atm/cxacru.c:644:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(wbuf + offb + 4, wdata + offd, min_t(int, stride,=
 wsize - offd));
                   ^~~~~~
   drivers/usb/atm/cxacru.c:696:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(rdata + offd, rbuf + offb + 4, min_t(int, stride,=
 rsize - offd));
                   ^~~~~~
   drivers/usb/atm/cxacru.c:696:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(rdata + offd, rbuf + offb + 4, min_t(int, stride,=
 rsize - offd));
                   ^~~~~~
   drivers/usb/atm/cxacru.c:773:24: warning: Value stored to 'intf' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct usb_interface *intf =3D usbatm_instance->usb_intf;
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/atm/cxacru.c:773:24: note: Value stored to 'intf' during its=
 initialization is never read
           struct usb_interface *intf =3D usbatm_instance->usb_intf;

vim +739 drivers/usb/atm/usbatm.c

c59bba75fa500f Duncan Sands       2005-05-11  729  =

c59bba75fa500f Duncan Sands       2005-05-11  730  static int usbatm_atm_pr=
oc_read(struct atm_dev *atm_dev, loff_t *pos, char *page)
c59bba75fa500f Duncan Sands       2005-05-11  731  {
c59bba75fa500f Duncan Sands       2005-05-11  732  	struct usbatm_data *ins=
tance =3D atm_dev->dev_data;
c59bba75fa500f Duncan Sands       2005-05-11  733  	int left =3D *pos;
c59bba75fa500f Duncan Sands       2005-05-11  734  =

4c2a47a287876c Greg Kroah-Hartman 2012-05-01  735  	if (!instance)
c59bba75fa500f Duncan Sands       2005-05-11  736  		return -ENODEV;
c59bba75fa500f Duncan Sands       2005-05-11  737  =

c59bba75fa500f Duncan Sands       2005-05-11  738  	if (!left--)
c59bba75fa500f Duncan Sands       2005-05-11 @739  		return sprintf(page, "=
%s\n", instance->description);
c59bba75fa500f Duncan Sands       2005-05-11  740  =

c59bba75fa500f Duncan Sands       2005-05-11  741  	if (!left--)
7c510e4b730a92 Johannes Berg      2008-10-27  742  		return sprintf(page, "=
MAC: %pM\n", atm_dev->esi);
c59bba75fa500f Duncan Sands       2005-05-11  743  =

c59bba75fa500f Duncan Sands       2005-05-11  744  	if (!left--)
c59bba75fa500f Duncan Sands       2005-05-11  745  		return sprintf(page,
c59bba75fa500f Duncan Sands       2005-05-11  746  			       "AAL5: tx %d (=
 %d err ), rx %d ( %d err, %d drop )\n",
c59bba75fa500f Duncan Sands       2005-05-11  747  			       atomic_read(&a=
tm_dev->stats.aal5.tx),
c59bba75fa500f Duncan Sands       2005-05-11  748  			       atomic_read(&a=
tm_dev->stats.aal5.tx_err),
c59bba75fa500f Duncan Sands       2005-05-11  749  			       atomic_read(&a=
tm_dev->stats.aal5.rx),
c59bba75fa500f Duncan Sands       2005-05-11  750  			       atomic_read(&a=
tm_dev->stats.aal5.rx_err),
c59bba75fa500f Duncan Sands       2005-05-11  751  			       atomic_read(&a=
tm_dev->stats.aal5.rx_drop));
c59bba75fa500f Duncan Sands       2005-05-11  752  =

0e42a627ec3d8d Duncan Sands       2006-01-13  753  	if (!left--) {
0e42a627ec3d8d Duncan Sands       2006-01-13  754  		if (instance->disconne=
cted)
0e42a627ec3d8d Duncan Sands       2006-01-13  755  			return sprintf(page, =
"Disconnected\n");
0e42a627ec3d8d Duncan Sands       2006-01-13  756  		else
c59bba75fa500f Duncan Sands       2005-05-11  757  			switch (atm_dev->sign=
al) {
c59bba75fa500f Duncan Sands       2005-05-11  758  			case ATM_PHY_SIG_FOUN=
D:
c59bba75fa500f Duncan Sands       2005-05-11  759  				return sprintf(page,=
 "Line up\n");
c59bba75fa500f Duncan Sands       2005-05-11  760  			case ATM_PHY_SIG_LOST:
c59bba75fa500f Duncan Sands       2005-05-11  761  				return sprintf(page,=
 "Line down\n");
c59bba75fa500f Duncan Sands       2005-05-11  762  			default:
c59bba75fa500f Duncan Sands       2005-05-11  763  				return sprintf(page,=
 "Line state unknown\n");
c59bba75fa500f Duncan Sands       2005-05-11  764  			}
0e42a627ec3d8d Duncan Sands       2006-01-13  765  	}
c59bba75fa500f Duncan Sands       2005-05-11  766  =

c59bba75fa500f Duncan Sands       2005-05-11  767  	return 0;
c59bba75fa500f Duncan Sands       2005-05-11  768  }
c59bba75fa500f Duncan Sands       2005-05-11  769  =


:::::: The code at line 739 was first introduced by commit
:::::: c59bba75fa500f13ef14215d599ee0d7faa1b954 [PATCH] USB ATM: new usbatm=
 core

:::::: TO: Duncan Sands <duncan.sands@math.u-psud.fr>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3637858306700461198==--

