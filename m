Content-Type: multipart/mixed; boundary="===============8574306892801765383=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 13215/13468] drivers/vdpa/virtio_pci/vp_vdpa.c:634:2: warning: Attempt to free released memory [clang-analyzer-unix.Malloc]
Date: Sat, 21 May 2022 10:08:00 +0800
Message-ID: <202205211019.pXna3DRu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8574306892801765383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Cindy Lu <lulu@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: 2fc449c4353ad6ea643a584e83440dc68a5a09dc [13215/13468] vdpa/vp_vdpa=
 : add vdpa tool support in vp_vdpa
:::::: branch date: 12 hours ago
:::::: commit date: 26 hours ago
config: arm-randconfig-c002-20220519 (https://download.01.org/0day-ci/archi=
ve/20220521/202205211019.pXna3DRu-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbb=
ec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D2fc449c4353ad6ea643a584e83440dc68a5a09dc
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2fc449c4353ad6ea643a584e83440dc68a5a09dc
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/greybus/svc.c:74:9: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/greybus/svc.c:106:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "panic\n");
                          ^~~~~~~
   drivers/greybus/svc.c:106:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "panic\n");
                          ^~~~~~~
   drivers/greybus/svc.c:108:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "reset\n");
                          ^~~~~~~
   drivers/greybus/svc.c:108:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "reset\n");
                          ^~~~~~~
   drivers/greybus/svc.c:563:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&request, 0, sizeof(request));
           ^~~~~~
   drivers/greybus/svc.c:563:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&request, 0, sizeof(request));
           ^~~~~~
   drivers/greybus/svc.c:605:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&request, 0, sizeof(request));
           ^~~~~~
   drivers/greybus/svc.c:605:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&request, 0, sizeof(request));
           ^~~~~~
   drivers/greybus/svc.c:796:3: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(fname, sizeof(fname), "%s",
                   ^~~~~~~~
   drivers/greybus/svc.c:796:3: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                   snprintf(fname, sizeof(fname), "%s",
                   ^~~~~~~~
   drivers/greybus/svc.c:1154:2: warning: Value stored to 'reset' is never =
read [clang-analyzer-deadcode.DeadStores]
           reset =3D request->payload;
           ^       ~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1154:2: note: Value stored to 'reset' is never read
           reset =3D request->payload;
           ^       ~~~~~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/i2c/busses/i2c-virtio.c:41:8: warning: Excessive padding in 'str=
uct virtio_i2c_req' (187 padding bytes, where 123 is optimal). =

   Optimal fields order: =

   in_hdr, =

   completion, =

   buf, =

   out_hdr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct virtio_i2c_req {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-virtio.c:41:8: note: Excessive padding in 'struct=
 virtio_i2c_req' (187 padding bytes, where 123 is optimal). Optimal fields =
order: in_hdr, completion, buf, out_hdr, consider reordering the fields or =
adding explicit padding members
   struct virtio_i2c_req {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-virtio.c:212:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(vi->adap.name, sizeof(vi->adap.name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-virtio.c:212:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(vi->adap.name, sizeof(vi->adap.name),
           ^~~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/i2c/muxes/i2c-demux-pinctrl.c:103:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(priv->cur_adap.name, sizeof(priv->cur_adap.name),
           ^~~~~~~~
   drivers/i2c/muxes/i2c-demux-pinctrl.c:103:2: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(priv->cur_adap.name, sizeof(priv->cur_adap.name),
           ^~~~~~~~
   drivers/i2c/muxes/i2c-demux-pinctrl.c:184:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", priv->cur_chan);
                  ^~~~~~~
   drivers/i2c/muxes/i2c-demux-pinctrl.c:184:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", priv->cur_chan);
                  ^~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   drivers/vdpa/vdpa_sim/vdpa_sim_net.c:218:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(vio_config->mac, config->net.mac, ETH_ALEN);
                   ^~~~~~
   drivers/vdpa/vdpa_sim/vdpa_sim_net.c:218:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(vio_config->mac, config->net.mac, ETH_ALEN);
                   ^~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   drivers/vdpa/virtio_pci/vp_vdpa.c:174:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(vp_vdpa->vring[i].msix_name, VP_VDPA_NAME_SIZE,
                   ^~~~~~~~
   drivers/vdpa/virtio_pci/vp_vdpa.c:174:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(vp_vdpa->vring[i].msix_name, VP_VDPA_NAME_SIZE,
                   ^~~~~~~~
   drivers/vdpa/virtio_pci/vp_vdpa.c:190:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(vp_vdpa->msix_name, VP_VDPA_NAME_SIZE, "vp-vdpa[%s]-con=
fig\n",
           ^~~~~~~~
   drivers/vdpa/virtio_pci/vp_vdpa.c:190:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(vp_vdpa->msix_name, VP_VDPA_NAME_SIZE, "vp-vdpa[%s]-con=
fig\n",
           ^~~~~~~~
>> drivers/vdpa/virtio_pci/vp_vdpa.c:634:2: warning: Attempt to free releas=
ed memory [clang-analyzer-unix.Malloc]
           kfree(vp_vdpa_mgtdev);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/virtio_pci/vp_vdpa.c:632:2: note: Memory is released
           kfree(&vp_vdpa_mgtdev->mgtdev.id_table);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/virtio_pci/vp_vdpa.c:634:2: note: Attempt to free released =
memory
           kfree(vp_vdpa_mgtdev);
           ^~~~~~~~~~~~~~~~~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   88 warnings generated.
   drivers/regulator/core.c:404:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_name, 64, "%s-supply", supply);
           ^~~~~~~~
   drivers/regulator/core.c:404:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop_name, 64, "%s-supply", supply);
           ^~~~~~~~
   drivers/regulator/core.c:596:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", uV);
                  ^~~~~~~
   drivers/regulator/core.c:596:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", uV);
                  ^~~~~~~
   drivers/regulator/core.c:605:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", _regulator_get_current_limit(rdev));
                  ^~~~~~~
   drivers/regulator/core.c:605:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", _regulator_get_current_limit(rdev));
                  ^~~~~~~
   drivers/regulator/core.c:614:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", rdev_get_name(rdev));
                  ^~~~~~~
   drivers/regulator/core.c:614:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", rdev_get_name(rdev));
                  ^~~~~~~
   drivers/regulator/core.c:635:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", regulator_opmode_to_str(mode));
                  ^~~~~~~
   drivers/regulator/core.c:635:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", regulator_opmode_to_str(mode));
                  ^~~~~~~
   drivers/regulator/core.c:650:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "enabled\n");
                          ^~~~~~~
   drivers/regulator/core.c:650:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "enabled\n");
                          ^~~~~~~
   drivers/regulator/core.c:652:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "disabled\n");
                          ^~~~~~~
   drivers/regulator/core.c:652:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "disabled\n");
                          ^~~~~~~
   drivers/regulator/core.c:654:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "unknown\n");
                          ^~~~~~~
   drivers/regulator/core.c:654:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "unknown\n");
                          ^~~~~~~
   drivers/regulator/core.c:714:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", label);
                  ^~~~~~~
   drivers/regulator/core.c:714:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", label);
                  ^~~~~~~
   drivers/regulator/core.c:724:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:724:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:726:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->min_uA);
                  ^~~~~~~
   drivers/regulator/core.c:726:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->min_uA);
                  ^~~~~~~
   drivers/regulator/core.c:736:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:736:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:738:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->max_uA);
                  ^~~~~~~
   drivers/regulator/core.c:738:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->max_uA);
                  ^~~~~~~
   drivers/regulator/core.c:748:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:748:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:750:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->min_uV);
                  ^~~~~~~
   drivers/regulator/core.c:750:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->min_uV);

vim +634 drivers/vdpa/virtio_pci/vp_vdpa.c

2fc449c4353ad6 Cindy Lu   2022-04-29  623  =

64b9f64f80a6f4 Jason Wang 2021-02-23  624  static void vp_vdpa_remove(struc=
t pci_dev *pdev)
64b9f64f80a6f4 Jason Wang 2021-02-23  625  {
2fc449c4353ad6 Cindy Lu   2022-04-29  626  	struct vp_vdpa_mgmtdev *vp_vdpa=
_mgtdev =3D pci_get_drvdata(pdev);
2fc449c4353ad6 Cindy Lu   2022-04-29  627  	struct virtio_pci_modern_device=
 *mdev =3D NULL;
64b9f64f80a6f4 Jason Wang 2021-02-23  628  =

2fc449c4353ad6 Cindy Lu   2022-04-29  629  	mdev =3D vp_vdpa_mgtdev->mdev;
2fc449c4353ad6 Cindy Lu   2022-04-29  630  	vp_modern_remove(mdev);
2fc449c4353ad6 Cindy Lu   2022-04-29  631  	vdpa_mgmtdev_unregister(&vp_vdp=
a_mgtdev->mgtdev);
2fc449c4353ad6 Cindy Lu   2022-04-29  632  	kfree(&vp_vdpa_mgtdev->mgtdev.i=
d_table);
2fc449c4353ad6 Cindy Lu   2022-04-29  633  	kfree(mdev);
2fc449c4353ad6 Cindy Lu   2022-04-29 @634  	kfree(vp_vdpa_mgtdev);
64b9f64f80a6f4 Jason Wang 2021-02-23  635  }
64b9f64f80a6f4 Jason Wang 2021-02-23  636  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8574306892801765383==--

