Content-Type: multipart/mixed; boundary="===============8070413490307194414=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 4/4] usb: xhci: Introduce Synopsys glue extension for DWC_usb3x
Date: Tue, 07 Jun 2022 12:30:00 +0800
Message-ID: <202206071252.zCFLyuXL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8070413490307194414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/u=
sb/host/xhci-plat.c:196:25: warning: Value stored to 'priv' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <fdd35b176f74e80fd75e4f75731e0f26c0808c89.1654310542.git.Thinh=
.Nguyen@synopsys.com>
References: <fdd35b176f74e80fd75e4f75731e0f26c0808c89.1654310542.git.Thinh.=
Nguyen@synopsys.com>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Hi Thinh,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 97fa5887cf283bb75ffff5f6b2c0e71794c02400]

url:    https://github.com/intel-lab-lkp/linux/commits/Thinh-Nguyen/usb-xhc=
i-Introduce-xhci-snps/20220606-004743
base:   97fa5887cf283bb75ffff5f6b2c0e71794c02400
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220605 (https://download.01.org/0day-ci/archi=
ve/20220607/202206071252.zCFLyuXL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436=
efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/f2403a44ab42c6e321d=
bd2b12c754321a30c09f6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thinh-Nguyen/usb-xhci-Introduce-xh=
ci-snps/20220606-004743
        git checkout f2403a44ab42c6e321dbd2b12c754321a30c09f6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (buscfg->interface =3D=3D ISP_INTERFACE_CCP2B_PHY1
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:172:6: note: Left side of=
 '||' is false
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:173:9: note: Assuming fie=
ld 'interface' is not equal to ISP_INTERFACE_CCP2B_PHY2
               || buscfg->interface =3D=3D ISP_INTERFACE_CCP2B_PHY2) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:172:2: note: Taking false=
 branch
           if (buscfg->interface =3D=3D ISP_INTERFACE_CCP2B_PHY1
           ^
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:181:6: note: Assuming 'nu=
m_data_lanes' is <=3D field 'num_data_lanes'
           if (num_data_lanes > phy->num_data_lanes)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:181:2: note: Taking false=
 branch
           if (num_data_lanes > phy->num_data_lanes)
           ^
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:185:14: note: Assuming 'i=
' is >=3D 'num_data_lanes'
           for (i =3D 0; i < num_data_lanes; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:185:2: note: Loop conditi=
on is false. Execution continues on line 195
           for (i =3D 0; i < num_data_lanes; i++) {
           ^
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:195:6: note: Assuming fie=
ld 'pol' is <=3D 1
           if (lanes->clk.pol > 1 || lanes->clk.pos > 3)
               ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:195:6: note: Left side of=
 '||' is false
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:195:28: note: Assuming fi=
eld 'pos' is <=3D 3
           if (lanes->clk.pol > 1 || lanes->clk.pos > 3)
                                     ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:195:2: note: Taking false=
 branch
           if (lanes->clk.pol > 1 || lanes->clk.pos > 3)
           ^
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:198:6: note: Assuming fie=
ld 'pos' is not equal to 0
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:198:6: note: Left side of=
 '||' is false
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:198:2: note: Taking false=
 branch
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
           ^
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:206:2: note: Calling 'csi=
phy_routing_cfg'
           csiphy_routing_cfg(phy, buscfg->interface, true,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:105:6: note: Assuming fie=
ld 'phy_type' is equal to ISP_PHY_TYPE_3630
           if (phy->isp->phy_type =3D=3D ISP_PHY_TYPE_3630 && on)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:105:6: note: Left side of=
 '&&' is true
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:105:49: note: 'on' is true
           if (phy->isp->phy_type =3D=3D ISP_PHY_TYPE_3630 && on)
                                                          ^~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:105:2: note: Taking true =
branch
           if (phy->isp->phy_type =3D=3D ISP_PHY_TYPE_3630 && on)
           ^
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:106:10: note: Calling 'cs=
iphy_routing_cfg_3630'
                   return csiphy_routing_cfg_3630(phy, iface, ccp2_strobe);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:28:13: note: 'mode' decla=
red without an initial value
           u32 shift, mode;
                      ^~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:32:2: note: Control jumps=
 to the 'default' case at line 33
           switch (iface) {
           ^
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:38:3: note:  Execution co=
ntinues on line 54
                   break;
                   ^
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:54:6: note: 'iface' is no=
t equal to ISP_INTERFACE_CCP2B_PHY1
           if (iface =3D=3D ISP_INTERFACE_CCP2B_PHY1 ||
               ^~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:54:6: note: Left side of =
'||' is false
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:55:6: note: 'iface' is no=
t equal to ISP_INTERFACE_CCP2B_PHY2
               iface =3D=3D ISP_INTERFACE_CCP2B_PHY2) {
               ^~~~~
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:54:2: note: Taking false =
branch
           if (iface =3D=3D ISP_INTERFACE_CCP2B_PHY1 ||
           ^
   drivers/media/platform/ti/omap3isp/ispcsiphy.c:63:14: note: The left ope=
rand of '<<' is a garbage value
           reg |=3D mode << shift;
                  ~~~~ ^
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/of/base.c:1296:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(it, 0, sizeof(*it));
           ^~~~~~
   drivers/of/base.c:1296:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(it, 0, sizeof(*it));
           ^~~~~~
   drivers/of/base.c:1886:2: warning: Call to function 'strncpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   drivers/of/base.c:1886:2: note: Call to function 'strncpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'strncpy_s' in case of C11
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   drivers/of/base.c:1957:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ap, 0, sizeof(*ap) + len + 1);
                   ^~~~~~
   drivers/of/base.c:1957:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(ap, 0, sizeof(*ap) + len + 1);
                   ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   113 warnings generated.
>> drivers/usb/host/xhci-plat.c:196:25: warning: Value stored to 'priv' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xhci_plat_priv *priv =3D hcd_to_xhci_priv(hcd);
                                  ^~~~
   drivers/usb/host/xhci-plat.c:196:25: note: Value stored to 'priv' during=
 its initialization is never read
           struct xhci_plat_priv *priv =3D hcd_to_xhci_priv(hcd);
                                  ^~~~
   drivers/usb/host/xhci-plat.c:255:15: warning: Access to field 'dma_mask'=
 results in a dereference of a null pointer (loaded from variable 'sysdev')=
 [clang-analyzer-core.NullDereference]
           if (WARN_ON(!sysdev->dma_mask))
                        ^
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/usb/host/xhci-plat.c:226:6: note: Assuming the condition is false
           if (usb_disabled())
               ^~~~~~~~~~~~~~
   drivers/usb/host/xhci-plat.c:226:2: note: Taking false branch
           if (usb_disabled())
           ^
   drivers/usb/host/xhci-plat.c:232:6: note: Assuming 'irq' is >=3D 0
           if (irq < 0)
               ^~~~~~~
   drivers/usb/host/xhci-plat.c:232:2: note: Taking false branch
           if (irq < 0)
           ^
   drivers/usb/host/xhci-plat.c:242:28: note: Assuming pointer value is null
           for (sysdev =3D &pdev->dev; sysdev; sysdev =3D sysdev->parent) {
                                     ^~~~~~
   drivers/usb/host/xhci-plat.c:242:2: note: Loop condition is false. Execu=
tion continues on line 252
           for (sysdev =3D &pdev->dev; sysdev; sysdev =3D sysdev->parent) {
           ^
   drivers/usb/host/xhci-plat.c:252:7: note: 'sysdev' is null
           if (!sysdev)
                ^~~~~~
   drivers/usb/host/xhci-plat.c:252:2: note: Taking true branch
           if (!sysdev)
           ^
   drivers/usb/host/xhci-plat.c:253:3: note: Null pointer value stored to '=
sysdev'
                   sysdev =3D &pdev->dev;
                   ^~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-plat.c:255:15: note: Access to field 'dma_mask' re=
sults in a dereference of a null pointer (loaded from variable 'sysdev')
           if (WARN_ON(!sysdev->dma_mask))
                        ^
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   Suppressed 111 warnings (111 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   Suppressed 98 warnings (98 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   111 warnings generated.
   Suppressed 111 warnings (111 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   sound/core/seq/seq_timer.c:270:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(str, "sequencer queue %i", q->queue);
           ^~~~~~~
   sound/core/seq/seq_timer.c:270:2: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           sprintf(str, "sequencer queue %i", q->queue);
           ^~~~~~~
   sound/core/seq/seq_timer.c:286:4: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&tid, 0, sizeof(tid));
                           ^~~~~~
   sound/core/seq/seq_timer.c:286:4: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                           memset(&tid, 0, sizeof(tid));
                           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   sound/core/seq/seq_system.c:60:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ev, 0, sizeof(struct snd_seq_event));
           ^~~~~~
   sound/core/seq/seq_system.c:60:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(ev, 0, sizeof(struct snd_seq_event));
           ^~~~~~
   sound/core/seq/seq_system.c:117:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pcallbacks, 0, sizeof(pcallbacks));
           ^~~~~~
   sound/core/seq/seq_system.c:117:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&pcallbacks, 0, sizeof(pcallbacks));
           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/hwtracing/intel_th/gth.c:157:11: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   count =3D snprintf(buf, PAGE_SIZE, "%x\n", port);
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:157:11: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   count =3D snprintf(buf, PAGE_SIZE, "%x\n", port);
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:159:11: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   count =3D snprintf(buf, PAGE_SIZE, "disabled\n");
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:159:11: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   count =3D snprintf(buf, PAGE_SIZE, "disabled\n");
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:335:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           count =3D snprintf(buf, PAGE_SIZE, "%x\n",

vim +/priv +196 drivers/usb/host/xhci-plat.c

4efb2f69411456d Yoshihiro Shimoda 2015-11-24  193  =

f2403a44ab42c6e Thinh Nguyen      2022-06-03  194  static int xhci_plat_set=
up_snps_quirks(struct usb_hcd *hcd)
f2403a44ab42c6e Thinh Nguyen      2022-06-03  195  {
f2403a44ab42c6e Thinh Nguyen      2022-06-03 @196  	struct xhci_plat_priv *=
priv =3D hcd_to_xhci_priv(hcd);
f2403a44ab42c6e Thinh Nguyen      2022-06-03  197  	int ret;
f2403a44ab42c6e Thinh Nguyen      2022-06-03  198  =

f2403a44ab42c6e Thinh Nguyen      2022-06-03  199  	if (!IS_ENABLED(CONFIG_=
USB_XHCI_SNPS))
f2403a44ab42c6e Thinh Nguyen      2022-06-03  200  		return 0;
f2403a44ab42c6e Thinh Nguyen      2022-06-03  201  =

f2403a44ab42c6e Thinh Nguyen      2022-06-03  202  	ret =3D xhci_snps_init(=
hcd);
f2403a44ab42c6e Thinh Nguyen      2022-06-03  203  	if (ret) {
f2403a44ab42c6e Thinh Nguyen      2022-06-03  204  		dev_err(hcd->self.cont=
roller, "SNPS extension setup fails\n");
f2403a44ab42c6e Thinh Nguyen      2022-06-03  205  		return ret;
f2403a44ab42c6e Thinh Nguyen      2022-06-03  206  	}
f2403a44ab42c6e Thinh Nguyen      2022-06-03  207  =

f2403a44ab42c6e Thinh Nguyen      2022-06-03  208  	priv->init_quirk =3D &x=
hci_snps_setup;
f2403a44ab42c6e Thinh Nguyen      2022-06-03  209  	priv->add_endpoint_quir=
k =3D &xhci_snps_add_endpoint;
f2403a44ab42c6e Thinh Nguyen      2022-06-03  210  	return 0;
f2403a44ab42c6e Thinh Nguyen      2022-06-03  211  }
f2403a44ab42c6e Thinh Nguyen      2022-06-03  212  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8070413490307194414==--

