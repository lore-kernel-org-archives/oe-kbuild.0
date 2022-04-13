Content-Type: multipart/mixed; boundary="===============8864549376280128304=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/4] PCI: Move jailhouse's isolated function handling to pci_scan_slot()
Date: Thu, 14 Apr 2022 06:12:03 +0800
Message-ID: <202204140641.r3fD3EBW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8864549376280128304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220412143040.1882096-3-schnelle@linux.ibm.com>
References: <20220412143040.1882096-3-schnelle@linux.ibm.com>
TO: Niklas Schnelle <schnelle@linux.ibm.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Jan Kiszka <jan.kiszka@siemens.com>
TO: Matthew Rosato <mjrosato@linux.ibm.com>
TO: Pierre Morel <pmorel@linux.ibm.com>
CC: linux-s390(a)vger.kernel.org
CC: linux-pci(a)vger.kernel.org

Hi Niklas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on helgaas-pci/next]
[also build test WARNING on s390/features tip/x86/core v5.18-rc2 next-20220=
413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Schnelle/PCI-=
Rework-pci_scan_slot-and-isolated-PCI-functions/20220412-223307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-c007-20220411 (https://download.01.org/0day-ci/ar=
chive/20220414/202204140641.r3fD3EBW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478=
d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5cac6729750b7434ff5=
d6ae99469e9e54bc9fb6e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Niklas-Schnelle/PCI-Rework-pci_sca=
n_slot-and-isolated-PCI-functions/20220412-223307
        git checkout 5cac6729750b7434ff5d6ae99469e9e54bc9fb6e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (primary & WM831X_TCHDATA_INT)
           ^
   drivers/mfd/wm831x-irq.c:478:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < ARRAY_SIZE(wm831x_irqs); i++) {
           ^
   drivers/mfd/wm831x-irq.c:481:7: note: Assuming the condition is false
                   if (!(primary & wm831x_irqs[i].primary))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:481:3: note: Taking false branch
                   if (!(primary & wm831x_irqs[i].primary))
                   ^
   drivers/mfd/wm831x-irq.c:488:7: note: Assuming the condition is false
                   if (!read[offset]) {
                       ^~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:488:3: note: Taking false branch
                   if (!read[offset]) {
                   ^
   drivers/mfd/wm831x-irq.c:510:7: note: Assuming the condition is false
                   if (*status & wm831x_irqs[i].mask)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:510:3: note: Taking false branch
                   if (*status & wm831x_irqs[i].mask)
                   ^
   drivers/mfd/wm831x-irq.c:517:7: note: Assuming 'primary' is equal to WM8=
31X_GP_INT
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:517:7: note: Left side of '&&' is true
   drivers/mfd/wm831x-irq.c:518:7: note: Assuming the condition is false
                       wm831x->gpio_level_high[i - WM831X_IRQ_GPIO_1]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:517:3: note: Taking false branch
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   drivers/mfd/wm831x-irq.c:528:7: note: 'primary' is equal to WM831X_GP_INT
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^~~~~~~
   drivers/mfd/wm831x-irq.c:528:7: note: Left side of '&&' is true
   drivers/mfd/wm831x-irq.c:529:7: note: Assuming the condition is true
                       wm831x->gpio_level_low[i - WM831X_IRQ_GPIO_1]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:528:3: note: Taking true branch
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   drivers/mfd/wm831x-irq.c:531:21: note: The result of the left shift is u=
ndefined due to shifting by '4294967295', which is greater or equal to the =
width of type 'int'
                           while (!(ret & 1 << (i - WM831X_IRQ_GPIO_1))) {
                                            ^  ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   block/partitions/cmdline.c:84:3: warning: Call to function 'strncpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(new_subpart->name, partdef, length);
                   ^~~~~~~
   block/partitions/cmdline.c:84:3: note: Call to function 'strncpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'strncpy_s' in case of C11
                   strncpy(new_subpart->name, partdef, length);
                   ^~~~~~~
   block/partitions/cmdline.c:143:2: warning: Call to function 'strncpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(newparts->name, bdevdef, length);
           ^~~~~~~
   block/partitions/cmdline.c:143:2: note: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11
           strncpy(newparts->name, bdevdef, length);
           ^~~~~~~
   block/partitions/cmdline.c:156:3: warning: Call to function 'strncpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(buf, bdevdef, length);
                   ^~~~~~~
   block/partitions/cmdline.c:156:3: note: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11
                   strncpy(buf, bdevdef, length);
                   ^~~~~~~
   block/partitions/cmdline.c:270:2: warning: Call to function 'strncpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(info->volname, subpart->name, label_min);
           ^~~~~~~
   block/partitions/cmdline.c:270:2: note: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11
           strncpy(info->volname, subpart->name, label_min);
           ^~~~~~~
   block/partitions/cmdline.c:273:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(tmp, sizeof(tmp), "(%s)", info->volname);
           ^~~~~~~~
   block/partitions/cmdline.c:273:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(tmp, sizeof(tmp), "(%s)", info->volname);
           ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/pci/probe.c:1013:4: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(addr, sizeof(addr), fmt,
                           ^~~~~~~~
   drivers/pci/probe.c:1013:4: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                           snprintf(addr, sizeof(addr), fmt,
                           ^~~~~~~~
   drivers/pci/probe.c:1447:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
           sprintf(child->name,
           ^~~~~~~
   drivers/pci/probe.c:1447:2: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
           sprintf(child->name,
           ^~~~~~~
>> drivers/pci/probe.c:2867:3: warning: Value stored to 'nr_devs' is never =
read [clang-analyzer-deadcode.DeadStores]
                   nr_devs =3D pci_scan_slot(bus, devfn);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/probe.c:2867:3: note: Value stored to 'nr_devs' is never read
                   nr_devs =3D pci_scan_slot(bus, devfn);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 34 warnings (33 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/pci/pci.c:286:9: warning: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(p, "/%x.%x%c", &slot, &func, &end);
                         ^~~~~~
   drivers/pci/pci.c:286:9: note: Call to function 'sscanf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(p, "/%x.%x%c", &slot, &func, &end);
                         ^~~~~~
   drivers/pci/pci.c:312:8: warning: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(wpath, "%x:%x:%x.%x%c", &seg, &bus, &slot,
                 ^~~~~~
   drivers/pci/pci.c:312:8: note: Call to function 'sscanf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(wpath, "%x:%x:%x.%x%c", &seg, &bus, &slot,
                 ^~~~~~
   drivers/pci/pci.c:316:9: warning: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(wpath, "%x:%x.%x%c", &bus, &slot, &func, =
&end);
                         ^~~~~~
   drivers/pci/pci.c:316:9: note: Call to function 'sscanf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(wpath, "%x:%x.%x%c", &bus, &slot, &func, =
&end);
                         ^~~~~~
   drivers/pci/pci.c:372:9: warning: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(p, "%hx:%hx:%hx:%hx%n", &vendor, &device,
                         ^~~~~~
   drivers/pci/pci.c:372:9: note: Call to function 'sscanf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(p, "%hx:%hx:%hx:%hx%n", &vendor, &device,
                         ^~~~~~
   drivers/pci/pci.c:375:10: warning: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D sscanf(p, "%hx:%hx%n", &vendor, &device,=
 &count);
                                 ^~~~~~
   drivers/pci/pci.c:375:10: note: Call to function 'sscanf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sscanf_s' in case of C11
                           ret =3D sscanf(p, "%hx:%hx%n", &vendor, &device,=
 &count);
                                 ^~~~~~
   drivers/pci/pci.c:1783:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state->config_space, dev->saved_config_space,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/pci/pci.c:1783:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(state->config_space, dev->saved_config_space,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/pci/pci.c:1789:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cap, &tmp->cap, len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/pci/pci.c:1789:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(cap, &tmp->cap, len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/pci/pci.c:1813:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dev->saved_config_space, state->config_space,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'

vim +/nr_devs +2867 drivers/pci/probe.c

bccf90d6e063d27 Palmer Dabbelt  2017-06-23  2841  =

1c02ea81006548a Mika Westerberg 2017-10-13  2842  /**
1c02ea81006548a Mika Westerberg 2017-10-13  2843   * pci_scan_child_bus_ext=
end() - Scan devices below a bus
1c02ea81006548a Mika Westerberg 2017-10-13  2844   * @bus: Bus to scan for =
devices
1c02ea81006548a Mika Westerberg 2017-10-13  2845   * @available_buses: Tota=
l number of buses available (%0 does not try to
1c02ea81006548a Mika Westerberg 2017-10-13  2846   *		     extend beyond th=
e minimal)
1c02ea81006548a Mika Westerberg 2017-10-13  2847   *
1c02ea81006548a Mika Westerberg 2017-10-13  2848   * Scans devices below @b=
us including subordinate buses. Returns new
1c02ea81006548a Mika Westerberg 2017-10-13  2849   * subordinate number inc=
luding all the found devices. Passing
1c02ea81006548a Mika Westerberg 2017-10-13  2850   * @available_buses cause=
s the remaining bus space to be distributed
1c02ea81006548a Mika Westerberg 2017-10-13  2851   * equally between hotplu=
g-capable bridges to allow future extension of the
1c02ea81006548a Mika Westerberg 2017-10-13  2852   * hierarchy.
1c02ea81006548a Mika Westerberg 2017-10-13  2853   */
1c02ea81006548a Mika Westerberg 2017-10-13  2854  static unsigned int pci_s=
can_child_bus_extend(struct pci_bus *bus,
1c02ea81006548a Mika Westerberg 2017-10-13  2855  					      unsigned int a=
vailable_buses)
1c02ea81006548a Mika Westerberg 2017-10-13  2856  {
1c02ea81006548a Mika Westerberg 2017-10-13  2857  	unsigned int used_buses,=
 normal_bridges =3D 0, hotplug_bridges =3D 0;
1c02ea81006548a Mika Westerberg 2017-10-13  2858  	unsigned int start =3D b=
us->busn_res.start;
5cac6729750b743 Niklas Schnelle 2022-04-12  2859  	unsigned int devfn, cmax=
, max =3D start;
^1da177e4c3f415 Linus Torvalds  2005-04-16  2860  	struct pci_dev *dev;
690f4304104f37e Jan Kiszka      2018-03-07  2861  	int nr_devs;
^1da177e4c3f415 Linus Torvalds  2005-04-16  2862  =

0207c356ef0e2ba Bjorn Helgaas   2009-11-04  2863  	dev_dbg(&bus->dev, "scan=
ning bus\n");
^1da177e4c3f415 Linus Torvalds  2005-04-16  2864  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  2865  	/* Go find them, Rover! =
*/
5cac6729750b743 Niklas Schnelle 2022-04-12  2866  	for (devfn =3D 0; devfn =
< 256; devfn +=3D 8)
690f4304104f37e Jan Kiszka      2018-03-07 @2867  		nr_devs =3D pci_scan_sl=
ot(bus, devfn);
690f4304104f37e Jan Kiszka      2018-03-07  2868  =

3e466e2d3a04c72 Bjorn Helgaas   2017-11-30  2869  	/* Reserve buses for SR-=
IOV capability */
1c02ea81006548a Mika Westerberg 2017-10-13  2870  	used_buses =3D pci_iov_b=
us_range(bus);
1c02ea81006548a Mika Westerberg 2017-10-13  2871  	max +=3D used_buses;
a28724b0fb909d2 Yu Zhao         2009-03-20  2872  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  2873  	/*
^1da177e4c3f415 Linus Torvalds  2005-04-16  2874  	 * After performing arch=
-dependent fixup of the bus, look behind
^1da177e4c3f415 Linus Torvalds  2005-04-16  2875  	 * all PCI-to-PCI bridge=
s on this bus.
^1da177e4c3f415 Linus Torvalds  2005-04-16  2876  	 */
74710ded8e16fc8 Alex Chiang     2009-03-20  2877  	if (!bus->is_added) {
0207c356ef0e2ba Bjorn Helgaas   2009-11-04  2878  		dev_dbg(&bus->dev, "fix=
ups for bus\n");
^1da177e4c3f415 Linus Torvalds  2005-04-16  2879  		pcibios_fixup_bus(bus);
74710ded8e16fc8 Alex Chiang     2009-03-20  2880  		bus->is_added =3D 1;
74710ded8e16fc8 Alex Chiang     2009-03-20  2881  	}
74710ded8e16fc8 Alex Chiang     2009-03-20  2882  =

1c02ea81006548a Mika Westerberg 2017-10-13  2883  	/*
1c02ea81006548a Mika Westerberg 2017-10-13  2884  	 * Calculate how many ho=
tplug bridges and normal bridges there
1c02ea81006548a Mika Westerberg 2017-10-13  2885  	 * are on this bus. We w=
ill distribute the additional available
1c02ea81006548a Mika Westerberg 2017-10-13  2886  	 * buses between hotplug=
 bridges.
1c02ea81006548a Mika Westerberg 2017-10-13  2887  	 */
1c02ea81006548a Mika Westerberg 2017-10-13  2888  	for_each_pci_bridge(dev,=
 bus) {
1c02ea81006548a Mika Westerberg 2017-10-13  2889  		if (dev->is_hotplug_bri=
dge)
1c02ea81006548a Mika Westerberg 2017-10-13  2890  			hotplug_bridges++;
1c02ea81006548a Mika Westerberg 2017-10-13  2891  		else
1c02ea81006548a Mika Westerberg 2017-10-13  2892  			normal_bridges++;
1c02ea81006548a Mika Westerberg 2017-10-13  2893  	}
1c02ea81006548a Mika Westerberg 2017-10-13  2894  =

4147c2fd9b12ae1 Mika Westerberg 2017-10-13  2895  	/*
4147c2fd9b12ae1 Mika Westerberg 2017-10-13  2896  	 * Scan bridges that are=
 already configured. We don't touch them
4147c2fd9b12ae1 Mika Westerberg 2017-10-13  2897  	 * unless they are misco=
nfigured (which will be done in the second
4147c2fd9b12ae1 Mika Westerberg 2017-10-13  2898  	 * scan below).
4147c2fd9b12ae1 Mika Westerberg 2017-10-13  2899  	 */
1c02ea81006548a Mika Westerberg 2017-10-13  2900  	for_each_pci_bridge(dev,=
 bus) {
1c02ea81006548a Mika Westerberg 2017-10-13  2901  		cmax =3D max;
1c02ea81006548a Mika Westerberg 2017-10-13  2902  		max =3D pci_scan_bridge=
_extend(bus, dev, max, 0, 0);
3374c545c27c535 Mika Westerberg 2018-05-28  2903  =

3374c545c27c535 Mika Westerberg 2018-05-28  2904  		/*
3374c545c27c535 Mika Westerberg 2018-05-28  2905  		 * Reserve one bus for =
each bridge now to avoid extending
3374c545c27c535 Mika Westerberg 2018-05-28  2906  		 * hotplug bridges too =
much during the second scan below.
3374c545c27c535 Mika Westerberg 2018-05-28  2907  		 */
3374c545c27c535 Mika Westerberg 2018-05-28  2908  		used_buses++;
3374c545c27c535 Mika Westerberg 2018-05-28  2909  		if (cmax - max > 1)
3374c545c27c535 Mika Westerberg 2018-05-28  2910  			used_buses +=3D cmax -=
 max - 1;
1c02ea81006548a Mika Westerberg 2017-10-13  2911  	}
4147c2fd9b12ae1 Mika Westerberg 2017-10-13  2912  =

4147c2fd9b12ae1 Mika Westerberg 2017-10-13  2913  	/* Scan bridges that nee=
d to be reconfigured */
1c02ea81006548a Mika Westerberg 2017-10-13  2914  	for_each_pci_bridge(dev,=
 bus) {
1c02ea81006548a Mika Westerberg 2017-10-13  2915  		unsigned int buses =3D =
0;
1c02ea81006548a Mika Westerberg 2017-10-13  2916  =

1c02ea81006548a Mika Westerberg 2017-10-13  2917  		if (!hotplug_bridges &&=
 normal_bridges =3D=3D 1) {
3e466e2d3a04c72 Bjorn Helgaas   2017-11-30  2918  =

1c02ea81006548a Mika Westerberg 2017-10-13  2919  			/*
1c02ea81006548a Mika Westerberg 2017-10-13  2920  			 * There is only one b=
ridge on the bus (upstream
1c02ea81006548a Mika Westerberg 2017-10-13  2921  			 * port) so it gets al=
l available buses which it
1c02ea81006548a Mika Westerberg 2017-10-13  2922  			 * can then distribute=
 to the possible hotplug
1c02ea81006548a Mika Westerberg 2017-10-13  2923  			 * bridges below.
1c02ea81006548a Mika Westerberg 2017-10-13  2924  			 */
1c02ea81006548a Mika Westerberg 2017-10-13  2925  			buses =3D available_bu=
ses;
1c02ea81006548a Mika Westerberg 2017-10-13  2926  		} else if (dev->is_hotp=
lug_bridge) {
3e466e2d3a04c72 Bjorn Helgaas   2017-11-30  2927  =

1c02ea81006548a Mika Westerberg 2017-10-13  2928  			/*
1c02ea81006548a Mika Westerberg 2017-10-13  2929  			 * Distribute the extr=
a buses between hotplug
1c02ea81006548a Mika Westerberg 2017-10-13  2930  			 * bridges if any.
1c02ea81006548a Mika Westerberg 2017-10-13  2931  			 */
1c02ea81006548a Mika Westerberg 2017-10-13  2932  			buses =3D available_bu=
ses / hotplug_bridges;
3374c545c27c535 Mika Westerberg 2018-05-28  2933  			buses =3D min(buses, a=
vailable_buses - used_buses + 1);
1c02ea81006548a Mika Westerberg 2017-10-13  2934  		}
1c02ea81006548a Mika Westerberg 2017-10-13  2935  =

1c02ea81006548a Mika Westerberg 2017-10-13  2936  		cmax =3D max;
1c02ea81006548a Mika Westerberg 2017-10-13  2937  		max =3D pci_scan_bridge=
_extend(bus, dev, cmax, buses, 1);
3374c545c27c535 Mika Westerberg 2018-05-28  2938  		/* One bus is already a=
ccounted so don't add it again */
3374c545c27c535 Mika Westerberg 2018-05-28  2939  		if (max - cmax > 1)
3374c545c27c535 Mika Westerberg 2018-05-28  2940  			used_buses +=3D max - =
cmax - 1;
1c02ea81006548a Mika Westerberg 2017-10-13  2941  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  2942  =

e16b46605960bd0 Keith Busch     2016-07-21  2943  	/*
e16b46605960bd0 Keith Busch     2016-07-21  2944  	 * Make sure a hotplug b=
ridge has at least the minimum requested
1c02ea81006548a Mika Westerberg 2017-10-13  2945  	 * number of buses but a=
llow it to grow up to the maximum available
1c02ea81006548a Mika Westerberg 2017-10-13  2946  	 * bus number of there i=
s room.
e16b46605960bd0 Keith Busch     2016-07-21  2947  	 */
1c02ea81006548a Mika Westerberg 2017-10-13  2948  	if (bus->self && bus->se=
lf->is_hotplug_bridge) {
1c02ea81006548a Mika Westerberg 2017-10-13  2949  		used_buses =3D max_t(un=
signed int, available_buses,
1c02ea81006548a Mika Westerberg 2017-10-13  2950  				   pci_hotplug_bus_si=
ze - 1);
1c02ea81006548a Mika Westerberg 2017-10-13  2951  		if (max - start < used_=
buses) {
1c02ea81006548a Mika Westerberg 2017-10-13  2952  			max =3D start + used_b=
uses;
a20c7f36bd3d20d Mika Westerberg 2017-10-13  2953  =

a20c7f36bd3d20d Mika Westerberg 2017-10-13  2954  			/* Do not allocate mor=
e buses than we have room left */
a20c7f36bd3d20d Mika Westerberg 2017-10-13  2955  			if (max > bus->busn_re=
s.end)
a20c7f36bd3d20d Mika Westerberg 2017-10-13  2956  				max =3D bus->busn_res=
.end;
1c02ea81006548a Mika Westerberg 2017-10-13  2957  =

1c02ea81006548a Mika Westerberg 2017-10-13  2958  			dev_dbg(&bus->dev, "%p=
R extended by %#02x\n",
1c02ea81006548a Mika Westerberg 2017-10-13  2959  				&bus->busn_res, max -=
 start);
1c02ea81006548a Mika Westerberg 2017-10-13  2960  		}
e16b46605960bd0 Keith Busch     2016-07-21  2961  	}
e16b46605960bd0 Keith Busch     2016-07-21  2962  =

^1da177e4c3f415 Linus Torvalds  2005-04-16  2963  	/*
^1da177e4c3f415 Linus Torvalds  2005-04-16  2964  	 * We've scanned the bus=
 and so we know all about what's on
^1da177e4c3f415 Linus Torvalds  2005-04-16  2965  	 * the other side of any=
 bridges that may be on this bus plus
^1da177e4c3f415 Linus Torvalds  2005-04-16  2966  	 * any devices.
^1da177e4c3f415 Linus Torvalds  2005-04-16  2967  	 *
^1da177e4c3f415 Linus Torvalds  2005-04-16  2968  	 * Return how far we've =
got finding sub-buses.
^1da177e4c3f415 Linus Torvalds  2005-04-16  2969  	 */
0207c356ef0e2ba Bjorn Helgaas   2009-11-04  2970  	dev_dbg(&bus->dev, "bus =
scan returning with max=3D%02x\n", max);
^1da177e4c3f415 Linus Torvalds  2005-04-16  2971  	return max;
^1da177e4c3f415 Linus Torvalds  2005-04-16  2972  }
1c02ea81006548a Mika Westerberg 2017-10-13  2973  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8864549376280128304==--

