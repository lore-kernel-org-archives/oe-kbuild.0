Content-Type: multipart/mixed; boundary="===============2349654082678789719=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/arcnet/com20020-pci.c:103:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments...
Date: Sun, 03 Apr 2022 23:38:38 +0800
Message-ID: <202204032344.EepSbW0d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2349654082678789719==
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
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220403 (https://download.01.org/0day-ci/arc=
hive/20220403/202204032344.EepSbW0d-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
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
               ^~~~
   net/core/failover.c:62:11: note: Left side of '&&' is false
           if (fops && fops->slave_pre_register &&
                    ^
   net/core/failover.c:66:46: note: Access to field 'slave_handle_frame' re=
sults in a dereference of a null pointer (loaded from variable 'fops')
           err =3D netdev_rx_handler_register(slave_dev, fops->slave_handle=
_frame,
                                                       ^~~~
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/hid/wacom_sys.c:169:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(wacom->wacom_wac.data, raw_data, size);
           ^~~~~~
   drivers/hid/wacom_sys.c:169:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(wacom->wacom_wac.data, raw_data, size);
           ^~~~~~
   drivers/hid/wacom_sys.c:323:5: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                                   ret =3D hid_report_raw_event(hdev,
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/wacom_sys.c:323:5: note: Value stored to 'ret' is never read
                                   ret =3D hid_report_raw_event(hdev,
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/wacom_sys.c:384:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D hid_report_raw_event(hdev, HID_FEATURE_R=
EPORT,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/hid/wacom_sys.c:384:4: note: Value stored to 'ret' is never read
                           ret =3D hid_report_raw_event(hdev, HID_FEATURE_R=
EPORT,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/hid/wacom_sys.c:1014:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf + 3, img + i * chunk_len, chunk_len);
                   ^~~~~~
   drivers/hid/wacom_sys.c:1014:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf + 3, img + i * chunk_len, chunk_len);
                   ^~~~~~
   drivers/hid/wacom_sys.c:1778:2: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(battery->bat_name, "wacom_battery_%ld", n);
           ^~~~~~~
   drivers/hid/wacom_sys.c:1778:2: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           sprintf(battery->bat_name, "wacom_battery_%ld", n);
           ^~~~~~~
   drivers/hid/wacom_sys.c:1861:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", mode < 3 ? mode : -1);
                  ^~~~~~~
   drivers/hid/wacom_sys.c:1861:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", mode < 3 ? mode : -1);
                  ^~~~~~~
   drivers/hid/wacom_sys.c:2224:4: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name), "%s %X",
                           ^~~~~~~~
   drivers/hid/wacom_sys.c:2224:4: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name), "%s %X",
                           ^~~~~~~~
   drivers/hid/wacom_sys.c:2231:4: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name), "Wacom %s", product=
_name);
                           ^~~~~~~~
   drivers/hid/wacom_sys.c:2231:4: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name), "Wacom %s", product=
_name);
                           ^~~~~~~~
   drivers/hid/wacom_sys.c:2240:4: warning: Call to function 'memmove' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(gap, gap+1, strlen(gap));
                           ^~~~~~~
   drivers/hid/wacom_sys.c:2240:4: note: Call to function 'memmove' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memmove_s' in case of C11
                           memmove(gap, gap+1, strlen(gap));
                           ^~~~~~~
   drivers/hid/wacom_sys.c:2250:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(wacom_wac->name, sizeof(wacom_wac->name), "%s%s",
           ^~~~~~~~
   drivers/hid/wacom_sys.c:2250:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(wacom_wac->name, sizeof(wacom_wac->name), "%s%s",
           ^~~~~~~~
   drivers/hid/wacom_sys.c:2254:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(wacom_wac->pen_name, sizeof(wacom_wac->pen_name),
           ^~~~~~~~
   drivers/hid/wacom_sys.c:2254:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(wacom_wac->pen_name, sizeof(wacom_wac->pen_name),
           ^~~~~~~~
   drivers/hid/wacom_sys.c:2256:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(wacom_wac->touch_name, sizeof(wacom_wac->touch_name),
           ^~~~~~~~
   drivers/hid/wacom_sys.c:2256:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(wacom_wac->touch_name, sizeof(wacom_wac->touch_name),
           ^~~~~~~~
   drivers/hid/wacom_sys.c:2258:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(wacom_wac->pad_name, sizeof(wacom_wac->pad_name),
           ^~~~~~~~
   drivers/hid/wacom_sys.c:2258:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(wacom_wac->pad_name, sizeof(wacom_wac->pad_name),
           ^~~~~~~~
   drivers/hid/wacom_sys.c:2423:3: warning: Value stored to 'error' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   error =3D hid_hw_open(hdev);
                   ^       ~~~~~~~~~~~~~~~~~
   drivers/hid/wacom_sys.c:2423:3: note: Value stored to 'error' is never r=
ead
                   error =3D hid_hw_open(hdev);
                   ^       ~~~~~~~~~~~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
>> drivers/net/arcnet/com20020-pci.c:103:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s\n", lp->backplane ? "true" : "false");
                  ^~~~~~~
   drivers/net/arcnet/com20020-pci.c:103:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buf, "%s\n", lp->backplane ? "true" : "false");
                  ^~~~~~~
   drivers/net/arcnet/com20020-pci.c:218:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(dev->name, sizeof(dev->name), "arc%d-%d", dev->=
dev_id, i);
                   ^~~~~~~~
   drivers/net/arcnet/com20020-pci.c:218:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(dev->name, sizeof(dev->name), "arc%d-%d", dev->=
dev_id, i);
                   ^~~~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   drivers/net/ppp/ppp_generic.c:1169:5: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   snprintf(ppp->dev->name, IFNAMSIZ, "ppp%=
i", ret);
                                   ^~~~~~~~
   drivers/net/ppp/ppp_generic.c:1169:5: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                                   snprintf(ppp->dev->name, IFNAMSIZ, "ppp%=
i", ret);
                                   ^~~~~~~~
   drivers/net/ppp/ppp_generic.c:1198:3: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(ppp->dev->name, IFNAMSIZ, "ppp%i", ppp->file.in=
dex);
                   ^~~~~~~~
   drivers/net/ppp/ppp_generic.c:1198:3: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(ppp->dev->name, IFNAMSIZ, "ppp%i", ppp->file.in=
dex);
                   ^~~~~~~~
   drivers/net/ppp/ppp_generic.c:1490:3: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&cstats, 0, sizeof(cstats));
                   ^~~~~~
   drivers/net/ppp/ppp_generic.c:1490:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset(&cstats, 0, sizeof(cstats));
                   ^~~~~~
   drivers/net/ppp/ppp_generic.c:2051:59: warning: Division by zero [clang-=
analyzer-core.DivideZero]
                                   flen =3D (((totfree - nzero)*(totlen + h=
drlen*totfree)) /
                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~^
   drivers/net/ppp/ppp_generic.c:1928:2: note: The value 0 is assigned to '=
totspeed'
           totspeed =3D 0; /*total bitrate of the bundle*/
           ^~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:1936:12: note: Assuming the condition is f=
alse
           hdrlen =3D (ppp->flags & SC_MP_XSHORTSEQ)? MPHDRLEN_SSN: MPHDRLE=
N;
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:1936:11: note: '?' condition is false
           hdrlen =3D (ppp->flags & SC_MP_XSHORTSEQ)? MPHDRLEN_SSN: MPHDRLE=
N;
                    ^
   drivers/net/ppp/ppp_generic.c:1938:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry(pch, &ppp->channels, clist) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/net/ppp/ppp_generic.c:1939:7: note: Assuming field 'chan' is non=
-null
                   if (pch->chan) {
                       ^~~~~~~~~
   drivers/net/ppp/ppp_generic.c:1939:3: note: Taking true branch
                   if (pch->chan) {
                   ^
   drivers/net/ppp/ppp_generic.c:1946:12: note: Field 'avail' is 1
                   if (pch->avail) {
                            ^
   drivers/net/ppp/ppp_generic.c:1946:3: note: Taking true branch
                   if (pch->avail) {
                   ^
   drivers/net/ppp/ppp_generic.c:1947:8: note: Assuming the condition is tr=
ue
                           if (skb_queue_empty(&pch->file.xq) ||
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:1947:39: note: Left side of '||' is true
                           if (skb_queue_empty(&pch->file.xq) ||
                                                              ^
   drivers/net/ppp/ppp_generic.c:1949:10: note: Assuming field 'speed' is e=
qual to 0
                                           if (pch->speed =3D=3D 0)
                                               ^~~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:1949:6: note: Taking true branch
                                           if (pch->speed =3D=3D 0)
                                           ^
   drivers/net/ppp/ppp_generic.c:1958:8: note: Assuming field 'had_frag' is=
 not equal to 0
                           if (!pch->had_frag && i < ppp->nxchan)
                               ^~~~~~~~~~~~~~
   drivers/net/ppp/ppp_generic.c:1958:23: note: Left side of '&&' is false
                           if (!pch->had_frag && i < ppp->nxchan)
                                              ^
   drivers/net/ppp/ppp_generic.c:1938:2: note: Loop condition is false. Exe=
cution continues on line 1968
           list_for_each_entry(pch, &ppp->channels, clist) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/net/ppp/ppp_generic.c:1968:6: note: 'nfree' is not equal to 0
           if (nfree =3D=3D 0 || nfree < navail / 2)
               ^~~~~
   drivers/net/ppp/ppp_generic.c:1968:6: note: Left side of '||' is false
   drivers/net/ppp/ppp_generic.c:1968:2: note: Taking false branch
           if (nfree =3D=3D 0 || nfree < navail / 2)
           ^
   drivers/net/ppp/ppp_generic.c:1974:6: note: Assuming the condition is fa=
lse
           if (*p =3D=3D 0 && mp_protocol_compress) {
               ^~~~~~~
   drivers/net/ppp/ppp_generic.c:1974:14: note: Left side of '&&' is false
           if (*p =3D=3D 0 && mp_protocol_compress) {
                       ^
   drivers/net/ppp/ppp_generic.c:1985:14: note: Assuming 'i' is < field 'nx=
chan'

vim +103 drivers/net/arcnet/com20020-pci.c

8890624a4e8c2c Michael Grzeschik 2014-09-18   95  =

ede07a1fc7d70a Michael Grzeschik 2017-06-28   96  static ssize_t backplane_=
mode_show(struct device *dev,
ede07a1fc7d70a Michael Grzeschik 2017-06-28   97  				   struct device_attr=
ibute *attr,
ede07a1fc7d70a Michael Grzeschik 2017-06-28   98  				   char *buf)
ede07a1fc7d70a Michael Grzeschik 2017-06-28   99  {
ede07a1fc7d70a Michael Grzeschik 2017-06-28  100  	struct net_device *net_d=
ev =3D to_net_dev(dev);
ede07a1fc7d70a Michael Grzeschik 2017-06-28  101  	struct arcnet_local *lp =
=3D netdev_priv(net_dev);
ede07a1fc7d70a Michael Grzeschik 2017-06-28  102  =

ede07a1fc7d70a Michael Grzeschik 2017-06-28 @103  	return sprintf(buf, "%s\=
n", lp->backplane ? "true" : "false");
ede07a1fc7d70a Michael Grzeschik 2017-06-28  104  }
ede07a1fc7d70a Michael Grzeschik 2017-06-28  105  static DEVICE_ATTR_RO(bac=
kplane_mode);
ede07a1fc7d70a Michael Grzeschik 2017-06-28  106  =


:::::: The code at line 103 was first introduced by commit
:::::: ede07a1fc7d70adfb290cfdace391295897023cb arcnet: com20020-pci: add a=
ttribute to readback backplane status

:::::: TO: Michael Grzeschik <m.grzeschik@pengutronix.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2349654082678789719==--

