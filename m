Content-Type: multipart/mixed; boundary="===============0705175664912989000=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/5] drm/i915/gsc: add gsc as a mei auxiliary device
Date: Wed, 09 Feb 2022 22:28:38 +0800
Message-ID: <202202092218.JQby54ao-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0705175664912989000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220206131322.3246403-2-alexander.usyskin@intel.com>
References: <20220206131322.3246403-2-alexander.usyskin@intel.com>
TO: Alexander Usyskin <alexander.usyskin@intel.com>

Hi Alexander,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220209]
[cannot apply to drm-intel/for-linux-next char-misc/char-misc-testing linus=
/master v5.17-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexander-Usyskin/Add-driv=
er-for-GSC-controller/20220206-211428
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001-20220207 (https://download.01.org/0day-ci/arch=
ive/20220209/202202092218.JQby54ao-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850=
ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3640b7d101ae88e367a0abc2c=
da8eb46dbab2982
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexander-Usyskin/Add-driver-for-G=
SC-controller/20220206-211428
        git checkout 3640b7d101ae88e367a0abc2cda8eb46dbab2982
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/tunnel.c:124:11: note: Returning from 'kzalloc'
           tunnel =3D kzalloc(sizeof(*tunnel), GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/tunnel.c:125:6: note: Assuming 'tunnel' is non-null
           if (!tunnel)
               ^~~~~~~
   drivers/thunderbolt/tunnel.c:125:2: note: Taking false branch
           if (!tunnel)
           ^
   drivers/thunderbolt/tunnel.c:128:18: note: Calling 'kcalloc'
           tunnel->paths =3D kcalloc(npaths, sizeof(tunnel->paths[0]), GFP_=
KERNEL);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/slab.h:652:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:617:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:619:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:621:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:621:2: note: Returning pointer
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:2: note: Returning pointer
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/tunnel.c:128:18: note: Returning from 'kcalloc'
           tunnel->paths =3D kcalloc(npaths, sizeof(tunnel->paths[0]), GFP_=
KERNEL);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/thunderbolt/tunnel.c:128:2: note: Value assigned to field 'paths'
           tunnel->paths =3D kcalloc(npaths, sizeof(tunnel->paths[0]), GFP_=
KERNEL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/thunderbolt/tunnel.c:129:6: note: Assuming field 'paths' is null
           if (!tunnel->paths) {
               ^~~~~~~~~~~~~~
   drivers/thunderbolt/tunnel.c:129:2: note: Taking true branch
           if (!tunnel->paths) {
           ^
   drivers/thunderbolt/tunnel.c:130:3: note: Calling 'tb_tunnel_free'
                   tb_tunnel_free(tunnel);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/tunnel.c:1543:7: note: 'tunnel' is non-null
           if (!tunnel)
                ^~~~~~
   drivers/thunderbolt/tunnel.c:1543:2: note: Taking false branch
           if (!tunnel)
           ^
   drivers/thunderbolt/tunnel.c:1546:6: note: Assuming field 'deinit' is nu=
ll
           if (tunnel->deinit)
               ^~~~~~~~~~~~~~
   drivers/thunderbolt/tunnel.c:1546:2: note: Taking false branch
           if (tunnel->deinit)
           ^
   drivers/thunderbolt/tunnel.c:1549:14: note: Assuming 'i' is < field 'npa=
ths'
           for (i =3D 0; i < tunnel->npaths; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/tunnel.c:1549:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < tunnel->npaths; i++) {
           ^
   drivers/thunderbolt/tunnel.c:1550:7: note: Array access (via field 'path=
s') results in a null pointer dereference
                   if (tunnel->paths[i])
                       ^       ~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/gpu/drm/i915/gt/intel_gsc.c:109:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   drivers/gpu/drm/i915/gt/intel_gsc.c:109:3: note: Value stored to 'ret' i=
s never read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
>> drivers/gpu/drm/i915/gt/intel_gsc.c:112:2: warning: Value stored to 'aux=
_dev' is never read [clang-analyzer-deadcode.DeadStores]
           aux_dev =3D &adev->aux_dev;
           ^         ~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_gsc.c:112:2: note: Value stored to 'aux_de=
v' is never read
           aux_dev =3D &adev->aux_dev;
           ^         ~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/firewire/digi00x/digi00x.c:34:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(dg00x->card->shortname, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:34:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(dg00x->card->shortname, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:35:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(dg00x->card->mixername, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:35:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(dg00x->card->mixername, model);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/firewire/motu/motu.c:45:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(motu->card->shortname, motu->spec->name);
           ^~~~~~
   sound/firewire/motu/motu.c:45:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(motu->card->shortname, motu->spec->name);
           ^~~~~~
   sound/firewire/motu/motu.c:46:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(motu->card->mixername, motu->spec->name);
           ^~~~~~
   sound/firewire/motu/motu.c:46:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(motu->card->mixername, motu->spec->name);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/ret +109 drivers/gpu/drm/i915/gt/intel_gsc.c

3640b7d101ae88 Tomas Winkler 2022-02-06   75  =

3640b7d101ae88 Tomas Winkler 2022-02-06   76  static void intel_gsc_init_on=
e(struct drm_i915_private *dev_priv,
3640b7d101ae88 Tomas Winkler 2022-02-06   77  			       struct intel_gsc_in=
tf *intf,
3640b7d101ae88 Tomas Winkler 2022-02-06   78  			       unsigned int intf_i=
d)
3640b7d101ae88 Tomas Winkler 2022-02-06   79  {
3640b7d101ae88 Tomas Winkler 2022-02-06   80  	struct pci_dev *pdev =3D to_=
pci_dev(dev_priv->drm.dev);
3640b7d101ae88 Tomas Winkler 2022-02-06   81  	struct mei_aux_device *adev;
3640b7d101ae88 Tomas Winkler 2022-02-06   82  	struct auxiliary_device *aux=
_dev;
3640b7d101ae88 Tomas Winkler 2022-02-06   83  	const struct intel_gsc_def *=
def;
3640b7d101ae88 Tomas Winkler 2022-02-06   84  	int ret;
3640b7d101ae88 Tomas Winkler 2022-02-06   85  =

3640b7d101ae88 Tomas Winkler 2022-02-06   86  	intf->irq =3D -1;
3640b7d101ae88 Tomas Winkler 2022-02-06   87  	intf->id =3D intf_id;
3640b7d101ae88 Tomas Winkler 2022-02-06   88  =

3640b7d101ae88 Tomas Winkler 2022-02-06   89  	if (intf_id =3D=3D 0 && !HAS=
_HECI_PXP(dev_priv))
3640b7d101ae88 Tomas Winkler 2022-02-06   90  		return;
3640b7d101ae88 Tomas Winkler 2022-02-06   91  =

3640b7d101ae88 Tomas Winkler 2022-02-06   92  	def =3D &intel_gsc_def_dg1[i=
ntf_id];
3640b7d101ae88 Tomas Winkler 2022-02-06   93  =

3640b7d101ae88 Tomas Winkler 2022-02-06   94  	dev_dbg(&pdev->dev, "init gs=
c one with id %d\n", intf_id);
3640b7d101ae88 Tomas Winkler 2022-02-06   95  	intf->irq =3D irq_alloc_desc=
(0);
3640b7d101ae88 Tomas Winkler 2022-02-06   96  	if (intf->irq < 0) {
3640b7d101ae88 Tomas Winkler 2022-02-06   97  		dev_err(&pdev->dev, "gsc ir=
q error %d\n", intf->irq);
3640b7d101ae88 Tomas Winkler 2022-02-06   98  		return;
3640b7d101ae88 Tomas Winkler 2022-02-06   99  	}
3640b7d101ae88 Tomas Winkler 2022-02-06  100  =

3640b7d101ae88 Tomas Winkler 2022-02-06  101  	ret =3D gsc_irq_init(dev_pri=
v, intf->irq);
3640b7d101ae88 Tomas Winkler 2022-02-06  102  	if (ret < 0) {
3640b7d101ae88 Tomas Winkler 2022-02-06  103  		dev_err(&pdev->dev, "gsc ir=
q init failed %d\n", ret);
3640b7d101ae88 Tomas Winkler 2022-02-06  104  		goto fail;
3640b7d101ae88 Tomas Winkler 2022-02-06  105  	}
3640b7d101ae88 Tomas Winkler 2022-02-06  106  =

3640b7d101ae88 Tomas Winkler 2022-02-06  107  	adev =3D kzalloc(sizeof(*ade=
v), GFP_KERNEL);
3640b7d101ae88 Tomas Winkler 2022-02-06  108  	if (!adev) {
3640b7d101ae88 Tomas Winkler 2022-02-06 @109  		ret =3D -ENOMEM;
3640b7d101ae88 Tomas Winkler 2022-02-06  110  		goto fail;
3640b7d101ae88 Tomas Winkler 2022-02-06  111  	}
3640b7d101ae88 Tomas Winkler 2022-02-06 @112  	aux_dev =3D &adev->aux_dev;
3640b7d101ae88 Tomas Winkler 2022-02-06  113  =

3640b7d101ae88 Tomas Winkler 2022-02-06  114  	adev->irq =3D intf->irq;
3640b7d101ae88 Tomas Winkler 2022-02-06  115  	adev->bar.parent =3D &pdev->=
resource[0];
3640b7d101ae88 Tomas Winkler 2022-02-06  116  	adev->bar.start =3D def->bar=
 + pdev->resource[0].start;
3640b7d101ae88 Tomas Winkler 2022-02-06  117  	adev->bar.end =3D adev->bar.=
start + def->bar_size - 1;
3640b7d101ae88 Tomas Winkler 2022-02-06  118  	adev->bar.flags =3D IORESOUR=
CE_MEM;
3640b7d101ae88 Tomas Winkler 2022-02-06  119  	adev->bar.desc =3D IORES_DES=
C_NONE;
3640b7d101ae88 Tomas Winkler 2022-02-06  120  =

3640b7d101ae88 Tomas Winkler 2022-02-06  121  	aux_dev =3D &adev->aux_dev;
3640b7d101ae88 Tomas Winkler 2022-02-06  122  	aux_dev->name =3D def->name;
3640b7d101ae88 Tomas Winkler 2022-02-06  123  	aux_dev->id =3D (pci_domain_=
nr(pdev->bus) << 16) |
3640b7d101ae88 Tomas Winkler 2022-02-06  124  		      PCI_DEVID(pdev->bus->=
number, pdev->devfn);
3640b7d101ae88 Tomas Winkler 2022-02-06  125  	aux_dev->dev.parent =3D &pde=
v->dev;
3640b7d101ae88 Tomas Winkler 2022-02-06  126  	aux_dev->dev.release =3D int=
el_gsc_release_dev;
3640b7d101ae88 Tomas Winkler 2022-02-06  127  =

3640b7d101ae88 Tomas Winkler 2022-02-06  128  	ret =3D auxiliary_device_ini=
t(aux_dev);
3640b7d101ae88 Tomas Winkler 2022-02-06  129  	if (ret < 0) {
3640b7d101ae88 Tomas Winkler 2022-02-06  130  		dev_err(&pdev->dev, "gsc au=
x init failed %d\n", ret);
3640b7d101ae88 Tomas Winkler 2022-02-06  131  		kfree(adev);
3640b7d101ae88 Tomas Winkler 2022-02-06  132  		goto fail;
3640b7d101ae88 Tomas Winkler 2022-02-06  133  	}
3640b7d101ae88 Tomas Winkler 2022-02-06  134  =

3640b7d101ae88 Tomas Winkler 2022-02-06  135  	ret =3D auxiliary_device_add=
(aux_dev);
3640b7d101ae88 Tomas Winkler 2022-02-06  136  	if (ret < 0) {
3640b7d101ae88 Tomas Winkler 2022-02-06  137  		dev_err(&pdev->dev, "gsc au=
x add failed %d\n", ret);
3640b7d101ae88 Tomas Winkler 2022-02-06  138  		/* adev will be freed with =
the put_device() and .release sequence */
3640b7d101ae88 Tomas Winkler 2022-02-06  139  		auxiliary_device_uninit(aux=
_dev);
3640b7d101ae88 Tomas Winkler 2022-02-06  140  		goto fail;
3640b7d101ae88 Tomas Winkler 2022-02-06  141  	}
3640b7d101ae88 Tomas Winkler 2022-02-06  142  	intf->adev =3D adev;
3640b7d101ae88 Tomas Winkler 2022-02-06  143  =

3640b7d101ae88 Tomas Winkler 2022-02-06  144  	dev_dbg(&pdev->dev, "gsc ini=
t one done\n");
3640b7d101ae88 Tomas Winkler 2022-02-06  145  	return;
3640b7d101ae88 Tomas Winkler 2022-02-06  146  fail:
3640b7d101ae88 Tomas Winkler 2022-02-06  147  	intel_gsc_destroy_one(intf);
3640b7d101ae88 Tomas Winkler 2022-02-06  148  }
3640b7d101ae88 Tomas Winkler 2022-02-06  149  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0705175664912989000==--

