Content-Type: multipart/mixed; boundary="===============5097131472127447031=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/drivers/serial-generic.c:303:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [...
Date: Tue, 26 Jul 2022 04:27:48 +0800
Message-ID: <202207260459.vxhTdxgE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5097131472127447031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: sound/dri=
vers/serial-generic.c:303:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Kaehn <kaehndan@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: 542350509499fed057a2a56921a383888a6f4fd3 ALSA: Add generic serial M=
IDI driver using serial bus API
date:   2 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 2 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220726/202207260459.vxhTdxgE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88=
c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D542350509499fed057a2a56921a383888a6f4fd3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 542350509499fed057a2a56921a383888a6f4fd3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:828:9: note: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:857:9: warning: Call=
 to function 'sprintf' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:857:9: note: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:886:9: warning: Call=
 to function 'sprintf' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:886:9: note: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:915:9: warning: Call=
 to function 'sprintf' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:915:9: note: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:958:9: warning: Call=
 to function 'sprintf' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:958:9: note: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:991:9: warning: Call=
 to function 'sprintf' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:991:9: note: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1040:9: warning: Cal=
l to function 'sprintf' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1040:9: note: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1091:9: warning: Cal=
l to function 'sprintf' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1091:9: note: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1127:9: warning: Cal=
l to function 'sprintf' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1127:9: note: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1156:9: warning: Cal=
l to function 'sprintf' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1156:9: note: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1197:9: warning: Cal=
l to function 'sprintf' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c:1197:9: note: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/tuners/mxl5007t.c:348:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->tab_init, &init_tab, sizeof(init_tab));
           ^~~~~~
   drivers/media/tuners/mxl5007t.c:348:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->tab_init, &init_tab, sizeof(init_tab));
           ^~~~~~
   drivers/media/tuners/mxl5007t.c:349:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->tab_init_cable, &init_tab_cable, sizeof(init_tab_=
cable));
           ^~~~~~
   drivers/media/tuners/mxl5007t.c:349:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->tab_init_cable, &init_tab_cable, sizeof(init_tab_=
cable));
           ^~~~~~
   drivers/media/tuners/mxl5007t.c:405:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->tab_rftune, &reg_pair_rftune, sizeof(reg_pair_rft=
une));
           ^~~~~~
   drivers/media/tuners/mxl5007t.c:405:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->tab_rftune, &reg_pair_rftune, sizeof(reg_pair_rft=
une));
           ^~~~~~
   drivers/media/tuners/mxl5007t.c:900:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &mxl5007t_tuner_ops,
           ^~~~~~
   drivers/media/tuners/mxl5007t.c:900:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &mxl5007t_tuner_ops,
           ^~~~~~
   Suppressed 43 warnings (41 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   sound/drivers/serial-generic.c:283:3: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, s=
ubstream->number);
                   ^~~~~~~
   sound/drivers/serial-generic.c:283:3: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, s=
ubstream->number);
                   ^~~~~~~
>> sound/drivers/serial-generic.c:303:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:303:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:333:2: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:333:2: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev=
->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev=
->ctrl->nr);
           ^~~~~~~
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/ssb/driver_chipcommon.c:130:12: warning: The left operand of '&'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           if (tmp & 0x10)
                                   ^
   drivers/ssb/driver_chipcommon.c:384:6: note: Assuming field 'dev' is non=
-null
           if (!cc->dev)
               ^~~~~~~~
   drivers/ssb/driver_chipcommon.c:384:2: note: Taking false branch
           if (!cc->dev)
           ^
   drivers/ssb/driver_chipcommon.c:386:2: note: Calling 'chipco_powercontro=
l_init'
           chipco_powercontrol_init(cc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:215:6: note: Assuming field 'chip_id' is=
 not equal to 17185
           if (bus->chip_id =3D=3D 0x4321) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:215:2: note: Taking false branch
           if (bus->chip_id =3D=3D 0x4321) {
           ^
   drivers/ssb/driver_chipcommon.c:222:6: note: Assuming the condition is f=
alse
           if (!(cc->capabilities & SSB_CHIPCO_CAP_PCTL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:222:2: note: Taking false branch
           if (!(cc->capabilities & SSB_CHIPCO_CAP_PCTL))
           ^
   drivers/ssb/driver_chipcommon.c:225:6: note: Assuming field 'revision' i=
s < 10
           if (cc->dev->id.revision >=3D 10) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:225:2: note: Taking false branch
           if (cc->dev->id.revision >=3D 10) {
           ^
   drivers/ssb/driver_chipcommon.c:233:13: note: Calling 'chipco_pctl_clock=
freqlimit'
                   maxfreq =3D chipco_pctl_clockfreqlimit(cc, 1);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:157:13: note: Calling 'chipco_pctl_get_s=
lowclksrc'
           clocksrc =3D chipco_pctl_get_slowclksrc(cc);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:122:2: note: 'tmp' declared without an i=
nitial value
           u32 tmp;
           ^~~~~~~
   drivers/ssb/driver_chipcommon.c:124:6: note: Assuming field 'revision' i=
s < 6
           if (cc->dev->id.revision < 6) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:124:2: note: Taking true branch
           if (cc->dev->id.revision < 6) {
           ^
   drivers/ssb/driver_chipcommon.c:125:7: note: Assuming field 'bustype' is=
 not equal to SSB_BUSTYPE_SSB
                   if (bus->bustype =3D=3D SSB_BUSTYPE_SSB ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:125:7: note: Left side of '||' is false
   drivers/ssb/driver_chipcommon.c:126:7: note: Assuming field 'bustype' is=
 not equal to SSB_BUSTYPE_PCMCIA
                       bus->bustype =3D=3D SSB_BUSTYPE_PCMCIA)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:125:3: note: Taking false branch
                   if (bus->bustype =3D=3D SSB_BUSTYPE_SSB ||
                   ^
   drivers/ssb/driver_chipcommon.c:128:7: note: Assuming field 'bustype' is=
 equal to SSB_BUSTYPE_PCI
                   if (bus->bustype =3D=3D SSB_BUSTYPE_PCI) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/driver_chipcommon.c:128:3: note: Taking true branch
                   if (bus->bustype =3D=3D SSB_BUSTYPE_PCI) {
                   ^
   drivers/ssb/driver_chipcommon.c:129:4: note: Calling 'pci_read_config_dw=
ord'
                           pci_read_config_dword(bus->host_pci, SSB_GPIO_OU=
T, &tmp);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/pci.h:1772:1: note: Returning without writing to '*val'
   _PCI_NOP_ALL(read, *)
   ^
   include/linux/pci.h:1771:5: note: expanded from macro '_PCI_NOP_ALL'
                                   _PCI_NOP(o, dword, u32 x)
                                   ^
   include/linux/pci.h:1767:5: note: expanded from macro '_PCI_NOP'
                   { return PCIBIOS_FUNC_NOT_SUPPORTED; }
                     ^
   drivers/ssb/driver_chipcommon.c:129:4: note: Returning from 'pci_read_co=
nfig_dword'
                           pci_read_config_dword(bus->host_pci, SSB_GPIO_OU=
T, &tmp);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/ssb/driver_chipcommon.c:130:12: note: The left operand of '&' is=
 a garbage value

vim +303 sound/drivers/serial-generic.c

542350509499fe Daniel Kaehn 2022-05-09  286  =

542350509499fe Daniel Kaehn 2022-05-09  287  static int snd_serial_generic_=
rmidi(struct snd_serial_generic *drvdata,
542350509499fe Daniel Kaehn 2022-05-09  288  				int outs, int ins, struct =
snd_rawmidi **rmidi)
542350509499fe Daniel Kaehn 2022-05-09  289  {
542350509499fe Daniel Kaehn 2022-05-09  290  	struct snd_rawmidi *rrawmidi;
542350509499fe Daniel Kaehn 2022-05-09  291  	int err;
542350509499fe Daniel Kaehn 2022-05-09  292  =

542350509499fe Daniel Kaehn 2022-05-09  293  	err =3D snd_rawmidi_new(drvda=
ta->card, drvdata->card->driver, 0,
542350509499fe Daniel Kaehn 2022-05-09  294  				outs, ins, &rrawmidi);
542350509499fe Daniel Kaehn 2022-05-09  295  =

542350509499fe Daniel Kaehn 2022-05-09  296  	if (err < 0)
542350509499fe Daniel Kaehn 2022-05-09  297  		return err;
542350509499fe Daniel Kaehn 2022-05-09  298  =

542350509499fe Daniel Kaehn 2022-05-09  299  	snd_rawmidi_set_ops(rrawmidi,=
 SNDRV_RAWMIDI_STREAM_INPUT,
542350509499fe Daniel Kaehn 2022-05-09  300  				&snd_serial_generic_input);
542350509499fe Daniel Kaehn 2022-05-09  301  	snd_rawmidi_set_ops(rrawmidi,=
 SNDRV_RAWMIDI_STREAM_OUTPUT,
542350509499fe Daniel Kaehn 2022-05-09  302  				&snd_serial_generic_output=
);
542350509499fe Daniel Kaehn 2022-05-09 @303  	strcpy(rrawmidi->name, drvdat=
a->card->shortname);
542350509499fe Daniel Kaehn 2022-05-09  304  =

542350509499fe Daniel Kaehn 2022-05-09  305  	snd_serial_generic_substreams=
(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT],
542350509499fe Daniel Kaehn 2022-05-09  306  					drvdata->serdev->ctrl->nr=
);
542350509499fe Daniel Kaehn 2022-05-09  307  	snd_serial_generic_substreams=
(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT],
542350509499fe Daniel Kaehn 2022-05-09  308  					drvdata->serdev->ctrl->nr=
);
542350509499fe Daniel Kaehn 2022-05-09  309  =

542350509499fe Daniel Kaehn 2022-05-09  310  	rrawmidi->info_flags =3D SNDR=
V_RAWMIDI_INFO_OUTPUT |
542350509499fe Daniel Kaehn 2022-05-09  311  			       SNDRV_RAWMIDI_INFO_I=
NPUT |
542350509499fe Daniel Kaehn 2022-05-09  312  			       SNDRV_RAWMIDI_INFO_D=
UPLEX;
542350509499fe Daniel Kaehn 2022-05-09  313  =

542350509499fe Daniel Kaehn 2022-05-09  314  	if (rmidi)
542350509499fe Daniel Kaehn 2022-05-09  315  		*rmidi =3D rrawmidi;
542350509499fe Daniel Kaehn 2022-05-09  316  	return 0;
542350509499fe Daniel Kaehn 2022-05-09  317  }
542350509499fe Daniel Kaehn 2022-05-09  318  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5097131472127447031==--

